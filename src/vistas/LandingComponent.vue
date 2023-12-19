<template>
    <div class="user-ranking-cards container">
        <div class="mb-2">
            <picture>                    
                <source media="(min-width:768px)" srcset="../activos/landing-baner.jpg">
                <source media="(min-width:576px)" srcset="../activos/landing-baner-tablet.jpg">
                <img src="../activos/landing-baner-mobile.jpg" class="d-block w-100" alt="disco de vinilo con olas"/>                
            </picture>
        </div>        
        <v-card class="mx-auto">

        <v-container>
        <v-row dense>        
            <v-col cols="12">
            <v-card class="card-bg">
                <div class="d-flex flex-no-wrap justify-space-between">
                    <v-img                        
                        src="../activos/piano-sepia.jpg"
                        class="align-end"
                        gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                        height="200px"
                        cover
                    >
                        <v-card-text class="main-landing-text" id="adaptable-text">
                            En esta aplicación subimos diez discos semanales y sobre estos puedes escribir una reseña aquí. Esta reseña puede llegar a ser leída en el programa de los lunes
                            <strong>
                                “La Isla de los Monos” de la radio FM 90, Radio Devoto!    
                            </strong>                            
                            
                        </v-card-text>
                        <v-card-actions>
                            <v-btn class="action-button" href="#/escribe-tu-resena">Empieza aquí!</v-btn>
                        </v-card-actions>
                    </v-img>
                </div>
            </v-card>
            </v-col>
        </v-row>
        </v-container>
    </v-card>   

     
    <v-card
        class="mx-auto"    
    >
        <v-container fluid>
        <v-row dense>
            <v-col
            v-for="card in cards"
            :key="card.title"
            :cols="card.flex"
            >
            <v-card>
                <v-img
                :src="card.src"
                class="align-end"
                gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                height="200px"
                cover
                >
                <v-card-title class="text-white" v-text="card.title"></v-card-title>
                <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn class="action-button" :href="card.urlTo">{{card.buttonLore}}</v-btn>
                </v-card-actions>
                </v-img>                
            </v-card>
            </v-col>
        </v-row>
        </v-container>
    </v-card>
    </div>    
</template>

<script>
  export default {
    data: () => ({
      cards: [
        { title: 'Mira otras reseñas!', src: 'https://i.ibb.co/RSPG3Cm/resenas-1.jpg', flex: 12, urlTo: '#/tus-resenas', buttonLore:'Aquí' },
        { title: 'Escribe tu reseña', src: 'https://i.ibb.co/y0tRMNy/computer-baner.jpg', flex: 6, urlTo: '#/escribe-tu-resena', buttonLore:'Tu Reseña'},
        { title: 'Aprende sobre este concurso', src: 'https://i.ibb.co/gRK9sHm/music-791631-1920.jpg', flex: 6, urlTo: '#/sobre-nosotros', buttonLore:'Nosotros'},
      ],
    }),
  }
</script>