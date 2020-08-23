<template>
<div>

    <div class="section">
        <div class="container">
            <div class="row">


                <div class="">
                </div>
                <div class="col-md-6  col-sm-12">
                    <div class="caru">
                     <v-zoomer style="width: 500px; height: 500px; border: solid 1px silver;">
       
                    <b-carousel   id="carousel-1" v-model="slide" :interval="4000" controls indicators background="#ffffff" img-width="350px" img-height="350px" style="text-shadow: 1px 1px 2px #333;" @sliding-start="onSlideStart" @sliding-end="onSlideEnd">
                        <span v-for="data in imagen_id" v-bind:key="data.id" >
                        
                        <b-carousel-slide caption="" text="" :img-src="'/imagenes_files/'+data.nombre"></b-carousel-slide>
                        </span>
                    </b-carousel>
                    </v-zoomer>

                    </div>

                </div>

                <div class="col-md-6">
                    <div class="product-details">
                        <p class="product-name t-12" >
                        
                        <router-link  v-if="$can('Producto Editar')" :to="{ name: 'productoform', params: { id: producto_id.id }}">
                            <i class="fa fa-pencil-square-o fa-3" aria-hidden="true"></i> Editar
                        </router-link>
                        
                        </p>
                        <h2 class="product-name"> 
                           
                            {{producto_id.nombre}}
                        </h2>
                        <div>
                            <div class="product-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <a class="review-link" href="#"></a>
                        </div>
                        <div>
                            <h3 class="product-price">$ {{formatPrice(producto_id.precio)}}<del class="product-old-price"></del></h3>
                            <span class="product-available">En venta</span>
                        </div>
                        <p></p>

                        <!--
                        <div class="product-options">
                            <label>
                                Size
                                <select class="input-select">
                                    <option value="0">X</option>
                                </select>
                            </label>
                            <label>
                                Color
                                <select class="input-select">
                                    <option value="0">Red</option>
                                </select>
                            </label>
                        </div>
                        -->

                        <div class="add-to-cart">
                            <div class="qty-label">
                                Cantidad
                                <div class="input-number">
                                    <input type="number" v-model="input_cantidad" max="1" value="1" >
                                    <span v-on:click="cantida_cambio_s()" class="qty-up">+</span>
                                    <span v-on:click="cantida_cambio_r()" class="qty-down">-</span>
                                </div>
                            </div>
                            <button class="add-to-cart-btn" v-on:click="add_carrito()" ><i class="fa fa-shopping-cart"></i> Añadir al carrito</button>
                        </div>

                        <ul class="product-btns">
                            <li><b-button variant="link" href="#" v-on:click="favorito(producto_id.id)"><i class="fa fa-heart-o"></i> Añadir a Favorito</b-button></li>
                            <!--
                            <li><a href="#"><i class="fa fa-exchange"></i> add to compare</a></li>
                            -->
                        </ul>

                        <ul class="product-links">
                            <li>Categoria:</li>

                            <li v-for="data in producto_id.categoria_id" v-bind:key="data.id"><a href="#">{{data.nombre_categoria.nombre}}</a></li>
                            <li><a href="#"></a></li>
                        </ul>

                        <ul class="product-links">
                            <li>Compartir:</li>  
                            
                            <li><a v-bind:href="'https://www.facebook.com/sharer/sharer.php?u=https://cicloespinal.com/Producto/'+producto_com+'/ShowProducto'"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                           <!--
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                            <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                        -->
                        </ul>
                        <ul class="product-links"> 
                            <li>Colores:</li> 

                            <li v-for="(data, index) in imagen_id" v-bind:key="data.id" >
                                <button class="btn btn-light" v-on:click="boton(index,data)">

                                
                                <div class="circulo" :style="'background:'+data.color_p+''"></div>
                                <div class="circulo" :style="'background:'+data.color_s+''"></div>
                            </button>
                            </li>
                        </ul>
                        <ul class="product-links"> 
                            <li>Tallas:</li> 

                            <Select2 v-model="input_talla" :options="producto_id.tallas" :settings="{ multiple: false }" />

                        <!--
                            <li v-for="(data, index) in imagen_id" v-bind:key="data.id" >
                                <button class="btn btn-light" v-on:click="boton(index)">

                                
                                <div class="circulo" :style="'background:'+data.color_p+''"></div>
                                <div class="circulo" :style="'background:'+data.color_s+''"></div>
                            </button>
                            </li>
                        -->
                        </ul>
<!--
                            $data['tallas'] = str_replace('"', ' ', $data['tallas']);
    $data['tallas'] = str_replace('[', ' ', $data['tallas']);
    $data['tallas'] = str_replace(']', ' ', $data['tallas']);
    $data['tallas'] =explode(",",$data['tallas']);
-->


                    </div>
                </div>
                <!-- /Product details -->

                <!-- Product tab -->
                <div class="col-md-12">
                    <div id="product-tab">
                        <!-- product tab nav -->
                        <ul class="tab-nav">
                            <li class="active"><a data-toggle="tab" href="#tab1" aria-expanded="false">Descripción</a></li>
                            <!--
                            <li class=""><a data-toggle="tab" href="#tab2" aria-expanded="false">Details</a></li>
                            
                            <li class=""><a data-toggle="tab" href="#tab3" aria-expanded="true">Reviews (3)</a></li>
                            -->
                        </ul>
                        <!-- /product tab nav -->

                        <!-- product tab content -->
                        <div class="tab-content">
                            <!-- tab1  -->
                            <div id="tab1" class="tab-pane fade in active">
                                <div class="row">
                                    <div class="col-md-12 t-20">
                                        <p v-html="producto_id.descripcion"></p>
                                    </div>
                                </div>
                            </div>
                            <!-- /tab1  -->

                            <!-- tab2  -->
                          
                            <!-- /tab2  -->

                            <!-- tab3  -->
                            <div id="tab3" class="tab-pane fade ">
                                <div class="row">
                                    <!-- Rating -->
                                    <div class="col-md-3">
                                        <div id="rating">
                                            <div class="rating-avg">
                                                <span>4.5</span>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                            </div>
                                            <ul class="rating">
                                                <li>
                                                    <div class="rating-stars">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <div class="rating-progress">
                                                        <div style="width: 80%;"></div>
                                                    </div>
                                                    <span class="sum">3</span>
                                                </li>
                                                <li>
                                                    <div class="rating-stars">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                    <div class="rating-progress">
                                                        <div style="width: 60%;"></div>
                                                    </div>
                                                    <span class="sum">2</span>
                                                </li>
                                                <li>
                                                    <div class="rating-stars">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                    <div class="rating-progress">
                                                        <div></div>
                                                    </div>
                                                    <span class="sum">0</span>
                                                </li>
                                                <li>
                                                    <div class="rating-stars">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                    <div class="rating-progress">
                                                        <div></div>
                                                    </div>
                                                    <span class="sum">0</span>
                                                </li>
                                                <li>
                                                    <div class="rating-stars">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                    <div class="rating-progress">
                                                        <div></div>
                                                    </div>
                                                    <span class="sum">0</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- /Rating -->

                                    <!-- Reviews -->
                                    <div class="col-md-6">
                                        <div id="reviews">
                                            <ul class="reviews">
                                                <li>
                                                    <div class="review-heading">
                                                        <h5 class="name">John</h5>
                                                        <p class="date">27 DEC 2018, 8:0 PM</p>
                                                        <div class="review-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o empty"></i>
                                                        </div>
                                                    </div>
                                                    <div class="review-body">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="review-heading">
                                                        <h5 class="name">John</h5>
                                                        <p class="date">27 DEC 2018, 8:0 PM</p>
                                                        <div class="review-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o empty"></i>
                                                        </div>
                                                    </div>
                                                    <div class="review-body">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="review-heading">
                                                        <h5 class="name">John</h5>
                                                        <p class="date">27 DEC 2018, 8:0 PM</p>
                                                        <div class="review-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o empty"></i>
                                                        </div>
                                                    </div>
                                                    <div class="review-body">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                    </div>
                                                </li>
                                            </ul>
                                            <ul class="reviews-pagination">
                                                <li class="active">1</li>
                                                <li><a href="#">2</a></li>
                                                <li><a href="#">3</a></li>
                                                <li><a href="#">4</a></li>
                                                <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- /Reviews -->

                                    <!-- Review Form -->
                                    <div class="col-md-3">
                                        <div id="review-form">
                                            <form class="review-form">
                                                <input class="input" type="text" placeholder="Your Name">
                                                <input class="input" type="email" placeholder="Your Email">
                                                <textarea class="input" placeholder="Your Review"></textarea>
                                                <div class="input-rating">
                                                    <span>Your Rating: </span>
                                                    <div class="stars">
                                                        <input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
                                                        <input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
                                                        <input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
                                                        <input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
                                                        <input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
                                                    </div>
                                                </div>
                                                <button class="primary-btn">Submit</button>
                                            </form>
                                        </div>
                                    </div>
                                    <!-- /Review Form -->
                                </div>
                            </div>
                            <!-- /tab3  -->
                        </div>
                        <!-- /product tab content  -->
                    </div>
                </div>
                <!-- /product tab -->
            </div>
            <!-- SECTION -->

            <!-- /SECTION -->

            <!-- NEWSLETTER -->

            <!-- /NEWSLETTER -->
        </div>
    </div>

</div>
</template>

<script>
import Vue from "vue";
//import VueSingleSelect from "vue-single-select";

import VueSlickCarousel from 'vue-slick-carousel'
import 'vue-slick-carousel/dist/vue-slick-carousel.css'
// optional style for arrows & dots
import 'vue-slick-carousel/dist/vue-slick-carousel-theme.css'
//import VueToast from "vue-toast-notification";
//import "vue-toast-notification/dist/index.css";
import Select2 from "v-select2-component";
//https://www.npmjs.com/package/vue-toastr-2
import VueToastr2 from "vue-toastr-2";
import "vue-toastr-2/dist/vue-toastr-2.min.css";
window.toastr = require("toastr");
Vue.use(VueToastr2);
//import { Photoshop } from 'vue-color'

import VueZoomer from 'vue-zoomer'
Vue.use(VueZoomer)

import { ColourPicker } from 'vue-colour-picker'

export default {
    components: {
        //  VueSingleSelect,
        VueToastr2,
        VueSlickCarousel,
        Select2,
    'colour-picker': ColourPicker

    },
    name: 'MyComponent',
    data() {

        return {
            colour:[],
            producto_show: [],
            producto_com: this.$route.params.id,
            producto_id: [],

            imagen_id: [],
            input_talla: 0,
            marca_id: [],
            imagen_producto:0,
            categoria_id: [],
            consulta_datos: [],
            errors: {},
            mensaje_formulario: "",
            page: 1,
            show_twitter: [],
            input_cantidad:1,
            slide:0,

        };
    },
    mounted() {
        this.consulta();
        $('html, body').animate({scrollTop:0}, 'slow');

        //this.consulta_producto();
    },
    methods: {

        consulta() {
            //alert(this.$route.params.id)
            axios.get(`/index/consulta_producto/${this.$route.params.id}`)
                .then(response => {
                    this.producto_id = response.data.producto_id;
                    this.imagen_id = response.data.imagen_id;
                });
        },
        consulta_producto() {
            axios.get(`Lista_producto/consulta_tipo`).then(response => {
                this.productos_id = response.data;
                this.categoria_id = response.data.categoria_id;
                this.marca_id = response.data.marca_id;

            });
        },
        add_carrito(){
            axios.post(`/Carrito_Compra/add_carrito/${this.$route.params.id}/${this.input_cantidad}/${this.input_talla}/${this.imagen_producto}`).then(response => {
                const data = response.data;
                if(response.data==false){
                    window.location.href = '/login'
                }
                if (response.data.id) {
                    this.validacion = "";
                    this.$toastr.success("Operacio exitosa", "Producto Añadido");
                    //this.$refs['my-modal'].hide()
                    //this.consulta(this.page);
                }
            });
        },
        cantida_cambio_s(){
            this.input_cantidad=this.input_cantidad+1;
        },
        boton(id,imagen_id){
            this.slide=id
            this.imagen_producto =imagen_id.id;
            //alert(imagen_id.id);
        },
        cantida_cambio_r(){
            if(this.input_cantidad>1){
            this.input_cantidad=this.input_cantidad-1;

            }
        },

        eliminar_registro(data_id) {
            this.input_Twitter_id = data_id;
        },
        eliminar_registro_delete() {
            var data_id = this.input_Twitter_id;
            axios.post(`Twitter/${this.input_Twitter_id}`).then(response => {
                const data = response.data;
                if (response.data.id) {
                    this.validacion = "";
                    this.$toastr.info("Operacio exitosa", "Datos Eliminados");
                    this.$refs['my-modal'].hide()
                    this.consulta(this.page);
                }
            });

        },

        cancelar_registro() {
            this.formulario_Twitter = false;
        },
        formatPrice(value) {
            let val = (value / 1).toFixed(0).replace(".", ",");
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        },
        favorito(id) {
            axios.get(`/Favorito/${id}`).then(response => {
                this.$toastr.info("Añadido a favoritos", "Añadido a favoritos");
            });
        },
        $can(permissionName) {
            //return true;
            return Permissions.indexOf(permissionName) !== -1;
        },

    }
};
</script>

<style scoped>
p.card-text {
    font-size: 30px;
}

.color-name {
    background-color: #eaeaea;
}

.card {
    margin-bottom: 10px
}
.t-20{
    font-size: 20px;
}
.circulo{
    width: 25px;
    height: 25px;
    _background: #8AC007;
    _border-radius: 1000px;

}
.caru{
    max-height: 350px;
}
 </style>
