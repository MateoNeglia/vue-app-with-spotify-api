<template>
  <v-app>
    <header class="">
          <div class="nav-bar container-lg"> 
            <b-navbar id="main-nav" toggleable="lg" >
              <b-navbar-brand href="#"><h1 class="main-title" id="logo">Listener's Choice</h1></b-navbar-brand>
              <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
              <b-collapse id="nav-collapse" is-nav>
                <b-navbar-nav>
                  <b-nav-item right><router-link class="nav-link custom-nav-link" to="/" >Home</router-link></b-nav-item>
                  <b-nav-item right><router-link class="nav-link custom-nav-link" to="/sobre-nosotros">Sobre Nosotros</router-link></b-nav-item>
                  <b-nav-item right><router-link class="nav-link custom-nav-link" to="/escribe-tu-resena">Escribe tu Reseña</router-link></b-nav-item>
                  <b-nav-item right><router-link class="nav-link custom-nav-link" to="/resenas">Reseñas</router-link></b-nav-item>
                  <b-nav-item right><router-link class="nav-link custom-nav-link" to="/tu-album">Álbumes de la Semana</router-link></b-nav-item>                  
                  <b-nav-item right><router-link class="nav-link custom-nav-link" to="/iniciar-sesion" v-if="!estaLogIn">Iniciar Sesión</router-link></b-nav-item>                  
                  <b-nav-item right><router-link class="nav-link custom-nav-link" to="/perfil" v-if="estaLogIn">{{usuarioLogeado}}</router-link></b-nav-item>
                </b-navbar-nav>     
              </b-collapse>
            </b-navbar>
          </div>
    </header>      
    <v-main>
      <transition name="fade" mode="out-in" enter-active-class="animate__animated animate__fadeInLeft">
        <router-view/>
      </transition> 
    </v-main>
  </v-app>
</template>

<script>

export default {
  name: 'App',  
  data: () => ({
    estaLogIn: false,
    usuarioLogeado: 'Perfil',
  }),
  mounted() {
    this.estaLogIn = JSON.parse(sessionStorage.getItem("estaLogIn")) || false;
    if(this.estaLogIn) {
      let usuario = JSON.parse(sessionStorage.getItem("usuarioIniciado"));
      this.usuarioLogeado = usuario.nick_name;      
    }
  }
};
</script>
<style scoped>
  @import url("activos/styles.css");
</style>