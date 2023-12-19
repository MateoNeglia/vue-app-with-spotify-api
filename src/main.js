import Vue from 'vue'
import App from './App.vue'
import router from './router'
import AnimateCss from 'animate.css'
import vuetify from './plugins/vuetify'
import BootstrapVue from 'bootstrap-vue/dist/bootstrap-vue.esm';
import 'bootstrap-vue/dist/bootstrap-vue.css';
import 'bootstrap/dist/css/bootstrap.css';
import '@mdi/font/css/materialdesignicons.css';

Vue.use(BootstrapVue);

Vue.config.productionTip = false

new Vue({
  router,
  AnimateCss,
  vuetify,  
  render: h => h(App)
}).$mount('#app')
