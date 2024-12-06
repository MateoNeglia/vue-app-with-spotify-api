const clientId = process.env.VUE_APP_SPOTIFY_CLIENT_ID;
const clientSecret = process.env.VUE_APP_SPOTIFY_CLIENT_SECRET;

const Credentials = () => {

    return {
        ClientId: clientId,
        ClientSecret: clientSecret
    }
}

export { Credentials };