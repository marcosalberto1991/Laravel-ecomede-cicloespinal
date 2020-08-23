/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

import Vue from 'vue'
import VueToastr2 from 'vue-toastr-2';
import 'vue-toastr-2/dist/vue-toastr-2.min.css';
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
Vue.use(require('vue-moment'));

// Install BootstrapVue
Vue.use(BootstrapVue)
// Optionally install the BootstrapVue icon components plugin
Vue.use(IconsPlugin)

//import Permissions from './mixins/Permissions';
//Vue.mixin(Permissions);

import VueRouter from 'vue-router'
Vue.use(VueRouter)

const $ = require('jquery')
// Lo declaramos globalmente
window.$ = $
/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

//Vue.component('example-component', require('./components/ExampleComponent.vue').default);
//Vue.component('twitter', require('./components/vue-twitte.vue').default);
//Vue.component('vuetwitter', require('./components/vue-Twitter.vue').default);
//Vue.component('vuetwittershow', require('./components/vue-twitter-show.vue').default);
/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */ 

 
Vue.component('pagination', require('laravel-vue-pagination').default); //https://www.npmjs.com/package/laravel-vue-pagination
/*
Vue.component('producto-vue', require('./components/Producto-vue.vue').default);

Vue.component('estado-vue', require('./components/Estado-vue.vue').default);
Vue.component('marca-vue', require('./components/Marca-vue.vue').default);
Vue.component('marcaform-vue', require('./components/MarcaForm-vue.vue').default);
Vue.component('producto-vue', require('./components/Producto-vue.vue'));
Vue.component('categoria-vue', require('./components/Categoria-vue.vue').default);
Vue.component('productoimagen-vue', require('./components/ProductoImagen-vue.vue').default);
Vue.component('vue-productoimagen', require('./components/vue-ProductoImagen.vue').default);
Vue.component('estado_venta-vue', require('./components/Estado_Venta-vue.vue'));
Vue.component('blog-vue', require('./components/Blog-vue.vue'));
Vue.component('Sobre_Nosotros-vue', require('./components/Sobre_Nosotros-vue.vue'));
Vue.component('suscripcion-web', require('./components/Suscripcion-web.vue').default);
Vue.component('favorito-vue', require('./components/Favorito-vue.vue'));
*/

Vue.component('suscripcion-web', require('./components/Suscripcion-web.vue').default);


//import suscripcion-web from './components/Suscripcion-web.vue';

import Inicio from './components/inicio-vue.vue';
import home from './components/inicio-vue.vue';
import Lista_Producto from './components/Lista_Producto-vue.vue';
import Estado from './components/Estado-vue.vue';
import Marca from './components/Marca-vue.vue';
import MarcaForm from './components/MarcaForm-vue.vue';

import Marcav2 from './components/Marcav2-vue.vue';
import Marcav2Form from './components/MarcaForm-vue.vue';

import Producto from './components/Producto-vue.vue';
import ProductoForm from './components/ProductoForm-vue.vue';
import ShowProducto from './components/ProductoShow-vue.vue';


import Categoria from './components/Categoria-vue.vue';
import CategoriaForm from './components/CategoriaForm-vue.vue';

import Carrito_Compra from './components/Carrito_Compra-vue.vue';
import Carrito_CompraForm from './components/Carrito_CompraForm-vue.vue';

import Estado_Venta from './components/Estado_Venta-vue.vue';
import Estado_VentaForm from './components/Estado_VentaForm-vue.vue';

import venta_procesar from './components/venta_procesar-vue.vue';
import Venta from './components/Venta-vue.vue';
import VentaForm from './components/VentaForm-vue.vue';
//import Ventas from './components/vue-Ventas.vue';
//import v404 from './components/vue-404.vue';

import Producto_Venta from './components/Producto_Venta-vue.vue';
import Producto_VentaForm from './components/Producto_VentaForm-vue.vue';
//const Foo = { template: '<div>Foo</div>' }
//const Bar = { template: '<div>bar</div>' }
import Sobre_Nosotros from './components/Sobre_Nosotros-vue.vue';
import Contactenos from './components/Contactenos-vue.vue';
import Ofertas from './components/Ofertas-vue.vue';

import Politica_de_privacidad from './components/Politica_de_privacidad-vue.vue';
import Pedidos_y_Devoluciones from './components/Pedidos_y_Devoluciones-vue.vue';
import Terminos_y_condiciones from './components/Terminos_y_condiciones-vue.vue';
import Mantenimiento from './components/Mantenimiento-vue.vue';

import Favorito from './components/Favorito-vue.vue';


import MyBlog from './components/MyBlog-vue.vue';

import MyBlogShow from './components/MyBlogShow-vue.vue';

import Blog from './components/Blog-vue.vue';
import BlogForm from './components/BlogForm-vue.vue';
var url = '';
const router = new VueRouter({
    
    mode: 'history',
    routes: [

            { path:  url+'/', component: Inicio, name: 'Inicio' },
            
            { path: url+'/Mantenimiento', component: Mantenimiento, name: 'Mantenimiento' },
            { path: url+'/Ofertas', component: Ofertas, name: 'Ofertas' },
            { path: url+'/Sobre_Nosotros', component: Sobre_Nosotros, name: 'Sobre_Nosotros' },
            { path: url+'/Contactenos', component: Contactenos, name: 'Contactenos' },
            { path: url+'/Terminos_y_condiciones', component: Terminos_y_condiciones, name: 'Terminos_y_condiciones' },
            { path: url+'/Politica_de_privacidad', component: Politica_de_privacidad, name: 'Politica_de_privacidad' },
            { path: url+'/Pedidos_y_Devoluciones', component: Pedidos_y_Devoluciones, name: 'Pedidos_y_Devoluciones' },
            { path: url+'/home', component: home, name: 'home' },
            { path: url+'/Lista_Producto', component: Lista_Producto, name: 'Lista_Producto' ,
            
        },
            { path: url+'/Lista_Producto_Tipo/:categoria_id/:marca_id', component: Lista_Producto, name: 'Lista_Producto_Tipo'
           
        
        },
            //{ path: '/Producto', component: Producto, name: 'Producto' },
            { path: url+'/Estado', component: Estado, name: 'Estado' },
            { path: url+'/Marca', component: Marca, name: 'Marca' },
            { path: url+'/Marca/:id/edit', component: MarcaForm, name: 'marcaform' },
            { path: url+'/Marca/create', component: MarcaForm, name: 'marcaformadd' },

            { path: url+'/Marcav2', component: Marcav2, name: 'marcav2' },
            { path: url+'/Marcav2/:id/edit', component: Marcav2Form, name: 'marcav2form' },
            { path: url+'/Marcav2/create', component: Marcav2Form, name: 'marcav2formadd' },

            { path: url+'/Producto', component: Producto, name: 'Producto' },
            { path: url+'/Producto/:id/edit', component: ProductoForm, name: 'productoform' },
            { path: url+'/Producto/create', component: ProductoForm, name: 'productoformadd' },
            { path: url+'/Producto/:id/ShowProducto', component: ShowProducto, name: 'ShowProducto' },
            { path: url+'/Producto/:id/ShowProducto', component: ShowProducto, name: 'ShowProducto_list' },


            { path: url+'/Categoria', component: Categoria, name: 'Categoria' },
            { path: url+'/Categoria/:id/edit', component: CategoriaForm, name: 'categoriaform' },
            { path: url+'/Categoria/create', component: CategoriaForm, name: 'categoriaformadd' },

            { path: url+'/Carrito_Compra', component: Carrito_Compra, name: 'Carrito_Compra' },
            { path: url+'/Carrito_Compra/:id/edit', component: Carrito_CompraForm, name: 'carrito_compraform' },
            { path: url+'/Carrito_Compra/create', component: Carrito_CompraForm, name: 'carrito_compraformadd' },

            { path: '/Estado_Venta', component: Estado_Venta, name: 'estado_venta' },
            { path: '/Estado_Venta/:id/edit', component: Estado_VentaForm, name: 'estado_ventaform' },
            { path: '/Estado_Venta/create', component: Estado_VentaForm, name: 'estado_ventaformadd' },

            { path: '/Producto_Venta', component: Producto_Venta, name: 'producto_venta' },
            { path: '/Producto_Venta/:id/edit', component: Producto_VentaForm, name: 'producto_ventaform' },
            { path: '/Producto_Venta/create', component: Producto_VentaForm, name: 'producto_ventaformadd' },
            
            { path: '/Venta/venta_procesar', component: venta_procesar, name: 'venta_procesar' },
            { path: '/Venta', component: Venta, name: 'venta' },
            { path: '/Venta/:id/edit', component: VentaForm, name: 'ventaform' },
            { path: '/Venta/create', component: VentaForm, name: 'ventaformadd' },
            
            { path: '/MyBlog', component: MyBlog, name: 'MyBlog' },
            { path: '/MyBlogShow/:id/Show', component: MyBlogShow, name: 'MyBlogShow' },
             
            { path: '/Blog', component: Blog, name: 'blog' },
            { path: '/Blog/:id/edit', component: BlogForm, name: 'blogform' },
            { path: '/Blog/create', component: BlogForm, name: 'blogformadd' },

            { path: '/Favorito', component: Favorito, name: 'favorito' },
            

        ]
});



const app = new Vue({
    router,
}).$mount('#app')
