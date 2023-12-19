import { getAlbumIds } from "./album-id-service";

const clientId = '254f2b3e77b446f4af640f5fe3caac64';
const clientSecret = 'ffd41e8d0a2d484cb288267398cd9e78';

export async function getAccessToken() {
  const response = await fetch('https://accounts.spotify.com/api/token', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: `grant_type=client_credentials&client_id=${clientId}&client_secret=${clientSecret}`
  });
  const data = await response.json();
  return data.access_token;
}

export async function fetchSpotifyAlbum(albumId, accessToken) {
  const response = await fetch(`https://api.spotify.com/v1/albums?ids=${albumId}`, {
    headers: {
      'Authorization': `Bearer ${accessToken}`
    }
  });
  const data = await response.json();
  return data;
}

export async function getAlbumData(accessToken) {
  try {
    const albumId = await getAlbumIds();
    const albumData = await fetchSpotifyAlbum(albumId, accessToken);
    return albumData;
  } catch (error) {
    console.error('Error Al conseguir los datos del album:', error);
    throw error; 
  }
}
