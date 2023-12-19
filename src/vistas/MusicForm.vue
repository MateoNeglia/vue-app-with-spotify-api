<template>
    <div class="form container-lg mt-3">
		<v-skeleton-loader :elevation="24" type="card" v-if="!isLoaded"></v-skeleton-loader>
		
		<form v-on:submit.prevent="saveReview" novalidate v-if="isLoaded">
			<h2 class="">Envíanos la reseña de tu álbum</h2>

			<div v-if="!isLogged" class="d-flex flex-column">
				<input type="text" 
				   placeholder="Escribe tu Nombre o Nick aquí" 
				   v-model="nameSpace"
				   @input="isNameSpaceFilled = true" :class=" isNameSpaceFilled ? 'input-completado' : 'form-input' ">			

				<input type="email" 
					placeholder="tumailvaaquí@así.com" 
					v-model="email"
					@input="isEmailFilled = true" :class=" isEmailFilled ? 'input-completado' : 'form-input' ">			
			</div>			
			
			<span>Selecciona un álbum y envía tu reseña!</span>
			<select v-model="selected"  class="form-select" v-on:change.prevent="changeAlbumImage()" :class=" selected != '' ?  'input-completado' : 'form-select' ">
				<option value="" selected disabled hidden>Selecciona tu Disco</option>   
				<option v-for="album in albumData.albums" :key="album.id" :value="album">
					{{ album.name }} por {{ album.artists[0].name }}
				</option>
			</select>
			<div class="align-self-center rounded" id="album-cover-cont" v-if="imgRute != ''" >
				<picture>
					<source media="(min-width:1025px)" :srcset="imgRute" />
					<source media="(min-width:480px)" :srcset="imgRuteMid" />
					<img :src="imgRuteMin" :alt="selected.name" />
				</picture>
				
			</div>			
			<span>Elige el rango del rango del Álbum:</span>
			
			<label for="Copper" class="ranks">
				<input type="radio" id="Copper" value="Copper" v-model="rank">
				<img src="../activos/copper.svg" alt="Rango Cobre" v-bind:style="{width:'25px', margin: '1em'}" class=" animate__animated animate__flipInX"/>
				Cobre
			</label>
			<label for="bronze">
				<input type="radio" id="bronze" value="bronze" v-model="rank">
				<img src="../activos/bronze.svg" alt="Rango Bronce" v-bind:style="{width:'25px', margin: '1em'}" class=" animate__animated animate__flipInX"/>
				Bronce
			</label>
			<label for="Silver">
				<input type="radio" id="Silver" value="Silver" v-model="rank">
				<img src="../activos/silver.svg" alt="Rango Plata" v-bind:style="{width:'25px', margin: '1em'}" class=" animate__animated animate__flipInX"/>
				Plata
			</label>
			<label for="Gold">
				<input type="radio" id="Gold" value="Gold" v-model="rank">
				<img src="../activos/gold.svg" alt="Rango Oro" v-bind:style="{width:'25px', margin: '1em'}" class=" animate__animated animate__flipInX"/>
				Oro
			</label>
			<label for="Diamond">
				<input type="radio" id="Diamond" value="Diamond" v-model="rank">
				<img src="../activos/diamond.svg" alt="Rango Diamante" v-bind:style="{width:'25px', margin: '1em'}" class=" animate__animated animate__flipInX"/>
				Diamante
			</label>
				
			<textarea v-model="review" 
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
						   v-model="wannaBuy">
					<img src="../activos/yes.svg" 
						 alt="Green Disc" 
						 v-bind:style="{width:'25px', margin: '1em'}"/>
					Sí
				</label>				
				
				<label for="noBuy">
					<input type="radio" 
						   id="noBuy" 
						   value="false" 
						   v-model="wannaBuy">
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
						   v-model="wannaListenMore">
					<img src="../activos/yes.svg" 
						 alt="Green Disc" 
						 v-bind:style="{width:'25px', margin: '1em'}"/>
					Sí
				</label>				
				<label for="no">
					<input type="radio" 
						   id="no" 
						   value="false" 
						   v-model="wannaListenMore">
					<img src="../activos/no.svg" 
						 alt="Red Disc" 
						 v-bind:style="{width:'25px', margin: '1em'}"/>
					No
				</label>
			</div>
			<div>
				<label for="isMailsOn" class="mx-2">Marca este campo si quieres recibir mails con recomendaciones musicales:</label>
				<input type="checkbox" id="isMailsOn" value="isMailsOn" v-model="isMailsOn">
			</div>
			<input type="submit" value="Enviar Reseña" id="submit" class="action-button"/>

		</form>

		<div v-if="sended === true">
			<div v-if="hasAnError" class="classerror">
			    <div v-for="x in errors" v-bind:key="x.id" class="p-3 mb-2 bg-danger text-white rounded">{{x}}</div>	    	
	  		</div>
	  		<div v-else class="sended">
	          <div class="p-3 mb-2 bg-success text-white rounded">¡Tu reseña fue enviada exitosamente!</div>
    	    </div>
 		</div>
		<div v-if="this.arr.length > 0">
			<h2>Estas fueron tus últimas reseñas:</h2>

			<div v-for="item in arr" :key="item.id" class='card mb-3'>
			<p class="card-title">User: {{item.nameSpace}}</p>
			<p class="card-subtitle mb-2">Album Seleccionado: {{item.selected}}</p>
			<p class="card-text">Album rankeado como: {{item.rank}}</p>				
			<p class="card-subtitle mb-2 text-muted">Para ver tu reseña completa ve a la pestaña de Reseñas</p>
			</div>

		</div>
		<div v-else class="classerror">
			<p class="text-warning">Aún no tenemos datos. Completa tu reseña y envíala!!</p>
		</div>

		
	</div>
</template>

<script>
import { getAccessToken, getAlbumData } from '../servicios/spotify-service';

export default {
  name: 'MusicForm',
  data:function(){
		return {
				isLogged: false,
				isLoaded: false,
				isNameSpaceFilled: false,
				isEmailFilled: false,
				isReviewFilled: false,
				isAlbumSelected: false,
				accessToken: '',
      			selectedAlbum: '',				
      			//albumId: '3dPZH0a4kjtjq6Hm53BS9S,1P9AuGH530Oy9JEW5XVuxo,1ZxChDw03SUFGUz0RC8A8M,3dck2tBxGfxj9m3CguDgjb,0kBfgEilUFCMIQY5IOjG4t,180jTzor4W2MQ9HW5h5Fh4,2ANVost0y2y52ema1E9xAZ,2Yyh46jU6QOZ4OSCRMwaon,1LVYzlSY6TdYsxm7KGBcY4,6P7vL4vGgyrD7q9VR9BcnV',
      			albumData: [],				
				nameSpace: "",
				email: "",
				selected:"",
				artist: "",
				rank: "",
				review:"",
				wannaBuy: false,
				wannaListenMore: false,
				isMailsOn: false,
                imgRute: "",
				imgRuteMid: "",
                imgRuteMin: "",										
				arr:[],
				errors:[],
                sended: false,
                formObject: {
					id: 0,
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
  computed: {
        hasAnError: function(){
    return this.errors.length;  
    }
  },
  methods:{
	saveReview:function() {
		
       this.sended = true; 
       this.errors = []; 
             
	  if (!this.nameSpace) {
	  	console.log(!this.nameSpace)
	   	this.errors.push('Tienes que ingresar tu Nombre o un Nick.');
       
      }
      if(this.nameSpace && this.nameSpace.length < 3) {
        this.errors.push('Tu nombre o nick tiene que tener más de tres caracteres.');
         
      }
      if(!this.selected){
      	this.errors.push('Tienes que elegir un disco.');
	  }
	  
	  if(!this.rank) {
		this.errors.push('Tienes que rankear el disco.');
	  }

	  if(!this.review) {
		this.errors.push('Debes escribir una reseña.');
	  }
     	
     if(this.errors.length == 0) {
     	     	 
     this.formObject = {
		id: this.selected.id,
		nameSpace: this.nameSpace,
		email: this.email,
		selected: this.selected.name,
		artist: this.selected.artists[0].name,
		rank: this.rank,
		review: this.review,
		wannaBuy: this.wannaBuy,
		wannaListenMore: this.wannaListenMore,
		isMailsOn: this.isMailsOn
		}
			
      if(!localStorage.formData) {
					this.arr=[]
	  } else {
		this.arr=JSON.parse(localStorage.getItem("formData"))
	  }
		this.arr.push(this.formObject)
		localStorage.setItem("formData",JSON.stringify(this.arr))
	}
	if(!this.isLogged) {
		this.nameSpace = '';
		this.email = '';
	}	
	this.selected = '';
	this.artist = '';
	this.rank = '';
	this.review = '';
	this.imgRute = '';
	this.imgRuteMid = '';
	this.imgRuteMin = '';
	this.wannaBuy = false;
	this.wannaListenMore = false;
	this.isMailsOn = false;
	this.isNameSpaceFilled = false;
	this.isEmailFilled = false;
	this.isReviewFilled = false;
	this.isAlbumSelected = false;
	

	},
	changeAlbumImage:function() {
		this.imgRute = this.selected.images[0].url;
		this.imgRuteMid = this.selected.images[1].url;
		this.imgRuteMin = this.selected.images[2].url;		
	},

	async fetchAlbumData() {
      try {
        this.accessToken = await getAccessToken();        
        this.albumData = await getAlbumData(this.accessToken);
		this.isLoaded = true;
      } catch (error) {
        console.error('Error consiguiendo el Token:', error);
      }
    },

	getSessionData:function() {
		this.isLogged = JSON.parse(sessionStorage.getItem("estaLogIn")) || false;
		if(this.isLogged) {
			let usuario = JSON.parse(sessionStorage.getItem("usuarioIniciado"));
			this.nameSpace = usuario.nick_name;
			this.email = usuario.email;
		}
	},

},
mounted() {	
	this.fetchAlbumData();
	this.getSessionData();
}
}
</script>