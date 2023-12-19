<template>
  <div class="form container-lg mt-3">
    <v-skeleton-loader :elevation="24" type="card" v-if="!isLoaded"></v-skeleton-loader>
    <h2>Los álbumes disponibles para rankear de la semana</h2>    
    <v-card class="card mb-3 shadow-lg review-card p-3" v-for="album in albumData.albums" :key="album.id" :value="album.id">
      <h3>{{ album.name }}</h3>
      <p>Artista: <strong> {{ album.artists[0].name }}</strong></p>
      <p class="mb-0">Tracks:</p>
      <v-list lines="one" class="card-bg">
        <v-list-item
          v-for="track in album.tracks.items"
          :key="track.id"          
        >
      {{ track.name }}
      <v-chip v-if="track.explicit" variant="outlined">
        Explícito 
      </v-chip>
      </v-list-item>
      </v-list>
      <p>Índice de Popularidad:</p>
      <v-chip :class="popularityCheck(album.popularity)">
        {{album.popularity}}
      </v-chip>

      <iframe style="border-radius:12px" 
              :src="getUrl(album.id)"
              width="100%" 
              height="152" 
              frameBorder="0"              
              allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" 
              loading="lazy"></iframe>
    </v-card>	    
  </div>
</template>

<script>
import { getAccessToken, getAlbumData } from '../servicios/spotify-service';

export default {
  name: 'AlbumComponent',
  data() {
    return {
      accessToken: '',
      selectedAlbum: '',      
      albumData: [],
      isLoaded: false,
    };
  },
  methods: {

    async fetchAlbumData() {
      try {
        this.accessToken = await getAccessToken();        
        this.albumData = await getAlbumData(this.accessToken);        
        this.isLoaded = true;
      } catch (error) {
        console.error('Error al traer el token:', error);
      }
    },
    getUrl:function(id) {
      return `https://open.spotify.com/embed/album/${id}?utm_source=generator&theme=0`;
    },
    
    popularityCheck:function(popularity) {
      if (popularity < 35) {
        return "red-score";
      } else if (popularity < 65) {
        return "orange-score";
      } else {
        return "green-score";
      }
    }


  },
  mounted() {
    this.fetchAlbumData()
  }
};
</script>

