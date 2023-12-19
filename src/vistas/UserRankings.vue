<template>
    <div class="user-ranking-cards container">
      <div v-if="this.arr.length > 0">
        <h2>Estas son tus reseñas:</h2>
        
        <v-card class="card mb-3 shadow-lg review-card" v-for = "x in arr" :key="x.id">
          <div class="card-body">
            <h3 class="card-title">{{x.nameSpace}}</h3>
            <p class="card-subtitle mb-2 text-muted">Álbum Seleccionado: <b> {{x.selected}} </b></p>
            <p class="card-text">Álbum rankeado como: {{x.rank}}</p>			
            <p class="card-text">Y la reseña de {{ x.nameSpace }} fue: {{x.review}}</p>			
          </div>
          <div>
            <v-btn type="button" class="btn action-button p-2 m-2" @click="irAEditar(x.id)">Editar</v-btn>
            <v-btn type="button" class="btn p-2 m-2 delete-button" v-on:click.prevent="borrarResena(x.id)">Borrar</v-btn>	
          </div>
        </v-card>	
        
        <v-btn type="button" class="btn action-button" v-on:click.prevent="borrarTodas()">Borrar todas las reseñas</v-btn>	
      </div>
      <div v-if="this.arr.length === 0">
        Aún no tenemos datos tus reseñas, ¿por qué no empiezas?
        <v-btn class="action-button" href="#/escribe-tu-resena">Empieza aquí!</v-btn>
      </div>
      <hr/>
      <div v-if="this.dbReviews.length > 0">
        <h2>Estas son las actuales reseñas del sitio:</h2>
        <v-card class="card mb-3 shadow-lg review-card" v-for = "x in dbReviews" :key="x.id">
          <div class="card-body">
            <h3 class="card-title">{{x.name}}</h3>
            <p class="card-subtitle mb-2 text-muted">Álbum Seleccionado: <b> {{x.selected}} </b></p>
            <p class="card-text">Álbum rankeado como: {{x.rank}}</p>			
            <p class="card-text">Y la reseña de {{ x.name }} fue: {{x.review}}</p>			
          </div>
        </v-card>	
      </div>
	</div>
</template>

<script>
import { getReviews } from '../servicios/review-service';
export default {
  name: 'UserRankings',
  data() {
    return {					
      name: "",
      arr: [],
      dbReviews: [],
    }
  },
  methods: {
    borrarTodas() {
      localStorage.clear();
      location.reload();
    },
    irAEditar(userId) {
      this.$router.push({ name: 'edita-tu-resena', params: { id: userId } });
    },
    borrarResena(id) {
      this.arr = this.arr.filter(item => item.id !== id);
      localStorage.setItem("formData", JSON.stringify(this.arr));
      location.reload();
    },
    async traerResenas() {
      this.dbReviews = await getReviews();      
    },
  },
  mounted() {
    this.arr = JSON.parse(localStorage.getItem("formData")) || [];
    this.traerResenas();
  }
}
</script>