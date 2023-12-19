<template>
    <div class="form container-lg mt-3">
      <h2>Registration Form</h2>
      <form @submit.prevent="registerUser">
        <label for="email">Email:</label>
        <input type="email" 
               id="email" 
               v-model="formData.email" 
               required 
               class="form-input"
               placeholder="tumailvaaquí@así.com" />
  
        <label for="password">Contraseña:</label>
        <input type="password" 
               id="password" 
               v-model="formData.password" 
               required 
               class="form-input"
               placeholder="Escribe tu Contraseña aquí"/>
  
        <label for="name">Nombre(s):</label>
        <input type="text" 
               id="name" 
               v-model="formData.name" 
               required 
               class="form-input"
               placeholder="Escribe tu Nombre aquí" />
  
        <label for="last_name">Apellido(s):</label>
        <input type="text" 
               id="last_name" 
               v-model="formData.last_name" 
               required 
               class="form-input"
               placeholder="Escribe tu Apellido aquí"/>
  
        <label for="nick_name">Nick:</label>
        <input type="text" 
               id="nick_name" 
               v-model="formData.nick_name" 
               required 
               class="form-input"
               placeholder="Escribe tu Nick aquí"/>
  
        <button type="submit" id="submit" class="action-button">Registrarse</button>
      </form>
    </div>
  </template>
  
  <script>
  export default {
    name: 'RegistrarseAhora',
    data() {
      return {
        formData: {
          user_role: 3, 
          email: '',
          password: '',
          name: '',
          last_name: '',
          nick_name: '',
        },
      };
    },
    methods: {
      async registerUser() {
        
        console.log('Form data submitted:', this.formData);

                try {
            const response = await fetch('https://lchoicedb.000webhostapp.com/api/registrarse.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: new URLSearchParams(this.formData), 
            });

            if (!response.ok) {
                throw new Error(`Status de Error: ${response.status}`);
            }

            const data = await response.json();            
            this.$router.push('/');
            console.log(data);

        } catch (error) {
            console.error(error);
            return null;
        }
      
        
        
      },
    },
  };
  </script>
  