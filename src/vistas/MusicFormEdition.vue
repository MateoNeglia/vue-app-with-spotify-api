<template>
    <div class="form container-lg mt-3">
		<v-skeleton-loader :elevation="10" type="card" v-if="!isLoaded"></v-skeleton-loader>
		<form v-on:submit.prevent="saveReview" novalidate v-if="isLoaded">
			<h2 class="">Aquí puedes editar la reseña de 
                <b>{{ formObject.selected }}</b>
            </h2>
			<div class="align-self-center rounded" id="album-cover-cont" >
				<picture>
					<source media="(min-width:1025px)" :srcset="imgRute" />
					<source media="(min-width:480px)" :srcset="imgRuteMid" />
					<img :src="imgRuteMin" :alt="formObject.selected" />
				</picture>				
			</div>	
			<span>Elige el rango del rango del Álbum:</span>
			
			<label for="Copper" class="ranks">
				<input type="radio" id="Copper" value="Copper" v-model="formObject.rank">
				<img src="../activos/copper.svg" alt="Rango Cobre" v-bind:style="{width:'25px', margin: '1em'}" class=" animate__animated animate__flipInX"/>
				Cobre
			</label>
			<label for="bronze">
				<input type="radio" id="bronze" value="bronze" v-model="formObject.rank">
				<img src="../activos/bronze.svg" alt="Rango Bronce" v-bind:style="{width:'25px', margin: '1em'}" class=" animate__animated animate__flipInX"/>
				Bronce
			</label>
			<label for="Silver">
				<input type="radio" id="Silver" value="Silver" v-model="formObject.rank">
				<img src="../activos/silver.svg" alt="Rango Plata" v-bind:style="{width:'25px', margin: '1em'}" class=" animate__animated animate__flipInX"/>
				Plata
			</label>
			<label for="Gold">
				<input type="radio" id="Gold" value="Gold" v-model="formObject.rank">
				<img src="../activos/gold.svg" alt="Rango Oro" v-bind:style="{width:'25px', margin: '1em'}" class=" animate__animated animate__flipInX"/>
				Oro
			</label>
			<label for="Diamond">
				<input type="radio" id="Diamond" value="Diamond" v-model="formObject.rank">
				<img src="../activos/diamond.svg" alt="Rango Diamante" v-bind:style="{width:'25px', margin: '1em'}" class=" animate__animated animate__flipInX"/>
				Diamante
			</label>
				
			<textarea v-model="formObject.review" 
					  name="review" 
					  placeholder="Escribe aquí tu reseña"
					  @input="isReviewFilled = true" :class=" isReviewFilled ? 'input-completado' : 'form-input' ">
			</textarea>
			
			
			
			<span>¿Comprarías digitalmente este álbum?</span>
			<div>				
				<label for="yesBuy">
					<input type="radio" 
						   id="yesBuy" 
						   value="true" 
						   v-model="formObject.wannaBuy">
					<img src="../activos/yes.svg" 
						 alt="Green Disc" 
						 v-bind:style="{width:'25px', margin: '1em'}"/>
					Sí
				</label>				
				
				<label for="noBuy">
					<input type="radio" 
						   id="noBuy" 
						   value="false" 
						   v-model="formObject.wannaBuy">
					<img src="../activos/no.svg" 
						 alt="Red Disc" 
						 v-bind:style="{width:'25px', margin: '1em'}"/>
				No</label>
			</div>		
			
		
			<span>¿Escucharías más álbums de este género?</span>
			<div>
				
				<label for="yes">
					<input type="radio" 
						   id="yes" 
						   value="true" 
						   v-model="formObject.wannaListenMore">
					<img src="../activos/yes.svg" 
						 alt="Green Disc" 
						 v-bind:style="{width:'25px', margin: '1em'}"/>
					Sí
				</label>				
				<label for="no">
					<input type="radio" 
						   id="no" 
						   value="false" 
						   v-model="formObject.wannaListenMore">
					<img src="../activos/no.svg" 
						 alt="Red Disc" 
						 v-bind:style="{width:'25px', margin: '1em'}"/>
					No
				</label>
			</div>
			
			<label for="isMailsOn">Marca este campo si quieres recibir mails con recomendaciones musicales:</label>
			<input type="checkbox" id="isMailsOn" value="isMailsOn" v-model="formObject.isMailsOn">
			<input type="submit" value="Editar Reseña" id="submit" class="action-button"/>

		</form>

		<div v-if="sended === true">
			<div v-if="hasAnError" class="classerror">
			    <div v-for="x in errors" v-bind:key="x.id" class="p-3 mb-2 bg-danger text-white rounded">{{x}}</div>	    	
	  		</div>
	  		<div v-else class="sended">
	          <div class="p-3 mb-2 bg-success text-white rounded">¡Tu reseña fue enviada exitosamente!</div>
    	    </div>
 		</div>
		
	</div>
</template>

<script>
import { getAccessToken, fetchSpotifyAlbum } from '../servicios/spotify-service';
export default {
  name: 'MusicFormEdition',
  data:function(){
		return {
				isLoaded: false,	
                id: "",				
                imgRute: "",
				imgRuteMid: "",
                imgRuteMin: "",
				isReviewFilled: false,
				albumId: '',
      			albumData: {},
				arr:[],
				errors:[],
                sended: false,
                formObject: {
					nameSpace: '',
					email: '',
					selected: '',
					rank: '',
					review: '',
					wannaBuy: false,
					wannaListenMore: false,
					isMailsOn: false
				}
		}

	},  
    created() {
        this.id = this.$route.params.id;         
        this.arr = JSON.parse(localStorage.getItem("formData"));
        this.formObject = this.arr.find(item => item.id === this.id);
		this.albumId = this.formObject.id;		
        this.fetchAlbumData();	
		
    },
  computed: {
        hasAnError: function(){
    		return this.errors.length;  
   		}
  },
  methods:{
	saveReview: function() {
		this.sended = true;
		this.errors = [];

		if (!this.formObject.review) {
			this.errors.push('Debes escribir una reseña.');
		}

		if (this.errors.length === 0) {	
			const index = this.arr.findIndex(item => item.id === this.id);

			if (index !== -1) {			
			this.arr[index] = this.formObject;
			localStorage.setItem("formData", JSON.stringify(this.arr));

			this.$router.push('/resenas');
			}
		}
	},
	getAlbum:function() {
		if(this.albumData) {
			this.imgRute = this.albumData.albums[0]?.images[0].url;
			this.imgRuteMid = this.albumData.albums[0]?.images[1].url;
			this.imgRuteMin = this.albumData.albums[0]?.images[2].url;
		}		
		
	},
	async fetchAlbumData() {
		try {
			console.log('ID SENT IS', this.albumId);
			this.accessToken = await getAccessToken();			
			this.albumData = await fetchSpotifyAlbum(this.albumId, this.accessToken);
			console.log('GET ALBUM is', this.albumData)
			this.getAlbum();
			this.isLoaded = true;			
		} catch (error) {
			console.error('Error getting access token:', error);
		}
	},

}
}
</script>