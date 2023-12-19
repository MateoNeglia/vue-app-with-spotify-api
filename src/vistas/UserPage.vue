<template>
    <div class="user-ranking-cards container">
      <h1>Tu Página</h1>
      <div v-if="usuarioIniciado">
        <h2>{{ usuarioIniciado.nick_name }}</h2>
        <p>Nombre(s): {{ usuarioIniciado.name }}</p>
        <p>Apellido(s): {{ usuarioIniciado.last_name }}</p>
        <p>Correo Electrónico: {{ usuarioIniciado.email }}</p>
        <p>Rol: {{ traerRol(usuarioIniciado.user_role) }}</p>
        <v-btn
          block
          class="mb-8 action-button"        
          size="large"
          variant="tonal"
          @click="cerrarSesion()"
        >
          Cerrar Sesión
        </v-btn>
      </div>
      <div v-else>
        <p>Loading user data...</p>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'UserPage',
    data() {
      return {
        usuarioIniciado: null,
      };
    },
    mounted() {
      this.traerDatosUsuario();
    },
    methods: {
      traerDatosUsuario() {
        this.usuarioIniciado = JSON.parse(sessionStorage.getItem("usuarioIniciado"));        
      },
      traerRol(rol) {
        if(rol === 1) {
          return 'Administrador';
        } else if(rol === 2) {
          return 'Moderador';
        } else {
          return 'Usuario';
        }
      },
      cerrarSesion() { 
        sessionStorage.clear();
        this.$router.push('/');
        window.location.reload();
      },
    }
  };
  </script>
  