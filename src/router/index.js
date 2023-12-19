import Vue from 'vue';
import VueRouter from 'vue-router';
import LandingComponent from '../vistas/LandingComponent.vue';
import AboutUs from '../vistas/AboutUs.vue';
import MusicForm from '../vistas/MusicForm.vue';
import MusicFormEdition from '../vistas/MusicFormEdition.vue';
import UserRankings from '../vistas/UserRankings.vue';
import AlbumComponent from '../vistas/AlbumComponent.vue';
import LogIn from '../vistas/LogIn.vue';
import UserPage from '../vistas/UserPage.vue';
import Register from '../vistas/Register.vue';

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: LandingComponent
  },
  {
    path: '/sobre-nosotros',
    name: 'sobre-nosotros',
    component: AboutUs
  },
  
  {
    path: '/escribe-tu-resena',
    name: 'escribe-tu-resena',
    component: MusicForm
  },  
  {
    path: '/edita-tu-resena/:id',
    name: 'edita-tu-resena',
    component: MusicFormEdition
  },
  {
    path: '/resenas',
    name: 'resenas',
    component: UserRankings
  },
  {
    path: '/tu-album',
    name: 'tu-album',
    component: AlbumComponent
  },
  {
    path: '/iniciar-sesion',
    name: 'iniciar-sesion',
    component: LogIn
  },
  {
    path: '/perfil',
    name: 'Perfil',
    component: UserPage
  },
  {
    path: '/registrarse',
    name: 'Registrarse',
    component: Register
  }
  
]

const router = new VueRouter({
  routes
})

export default router
