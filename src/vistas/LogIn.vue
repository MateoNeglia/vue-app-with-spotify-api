<template>
  <div>
    <v-img
      class="mx-auto my-6"
      max-width="228"
      src="../activos/full-main-logo.svg"
    ></v-img>

    <v-card
      class="mx-auto pa-12 pb-8"
      elevation="8"
      max-width="448"
      rounded="lg"
    >
      <form v-on:submit.prevent="logIn">
        <div class="text-subtitle-1 text-medium-emphasis">Cuenta</div>

        <v-text-field
          density="compact"
          placeholder="Dirección de correo electrónico"
          prepend-inner-icon="mdi-email-outline"
          variant="outlined"
          v-model="formData.email"
        ></v-text-field>

        <div class="text-subtitle-1 text-medium-emphasis d-flex align-center justify-space-between">
          Contraseña
        </div>
        <v-text-field
          :append-inner-icon="visible ? 'mdi-eye-off' : 'mdi-eye'"
          :type="visible ? 'text' : 'password'"
          density="compact"
          placeholder="Ingresa tu contraseña"
          prepend-inner-icon="mdi-lock-outline"
          variant="outlined"
          v-model="formData.password"
          @click:append-inner="visible = !visible"
        ></v-text-field>

        <v-card
          class="mb-12"
          color="surface-variant"
          variant="tonal"
        >
        </v-card>

        <v-btn
          block
          class="mb-8 action-button"        
          size="large"
          variant="tonal"
          type="submit"
        >
          Iniciar Sesión
        </v-btn>

      </form>

      <v-card-text class="text-center">
        <a
          class="text-decoration-none dark-brown-link"
          href="#/registrarse"
          rel="noopener noreferrer"          
        >          
        Regístrate ahora <v-icon icon="mdi-chevron-right"></v-icon>
        </a>
      </v-card-text>
    </v-card>
  </div>
</template>

<script>
  export default {
    data: () => ({
      visible: false,
      estaLogIn: false,
      formData: {
        email: '',
        password: '',        
      }      
    }),
    methods: {
      async logIn() {
        console.log('data is', this.formData.email, this.formData.password);

        try {
            const response = await fetch('https://lchoicedb.000webhostapp.com/api/iniciar-sesion.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: new URLSearchParams(this.formData), 
            });

            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }

            const data = await response.json();
         
            this.estaLogIn = true;
            sessionStorage.setItem("usuarioIniciado",JSON.stringify(data));
            sessionStorage.setItem("estaLogIn",JSON.stringify(this.estaLogIn));
            this.$router.push('/');
            window.location.reload();

        } catch (error) {
            console.error(error);
            return null;
        }
      }


    },
  }
</script>