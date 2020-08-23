<template>
<div>
    <div class="section carrusel-inicio" style="padding-top: 0px;">
        <div class="container-fluid">
            <div class="row">
                <b-carousel id="carousel-1" v-model="slide" :interval="4000" controls indicators background="#ababab" img-height="490px" style="text-shadow: 1px 1px 2px #333;" class="w-100">
                    <b-carousel-slide img-src="/img/SLIDER1.png"></b-carousel-slide>
                    <b-carousel-slide img-src="/img/SLIDER2.png"></b-carousel-slide>
                    <b-carousel-slide img-src="/img/SLIDER3.png"></b-carousel-slide>
                </b-carousel>
            </div>
            <!-- /row -->
        </div>
        <div class="container-fluid">
            <div class="row">
                <!-- shop -->

                <!-- /shop -->

                <!-- shop -->

                <!-- /shop -->

                <!-- shop -->

                <div class="col-md-3 col-xs-6">
                    <router-link class="cta-btn" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'14',marca_id:'All'}}">

                        <div class="shop">
                            <div class="shop-img">
                                <img src="/img/fondo_1s.png" alt="">
                            </div>
                        </div>
                    </router-link>
                </div>
                <div class="col-md-3 col-xs-6">
                    <router-link class="cta-btn" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'35',marca_id:'All'}}">

                        <div class="shop">
                            <div class="shop-img">
                                <img src="/img/fondo_2.png" alt="">
                            </div>
                        </div>
                    </router-link>
                </div>
                <div class="col-md-3 col-xs-6">
                    <router-link class="cta-btn" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'3',marca_id:'All'}}">

                        <div class="shop">
                            <div class="shop-img">
                                <img src="/img/fondo_3.png" alt="">
                            </div>
                        </div>
                    </router-link>
                </div>
                <div class="col-md-3 col-xs-6">
                    <router-link class="cta-btn" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'2',marca_id:'All'}}">

                        <div class="shop">
                            <div class="shop-img">
                                <img src="/img/fondo_4.png" alt="">
                            </div>
                        </div>
                    </router-link>
                </div>


                

                <!-- /shop -->
            </div>
        </div>

        <!-- /container -->
    </div>
 

    
	<div class="section" style="padding-top:0px">
        <!-- container -->
        <div class="container-fluid" style="padding-right: 0px;padding-left: 0px;">
    
    			       <img  src="/img/OFERTAS-01.png" class="img-fluid" alt="Responsive image" width="100%" height="20%px" >
        </div>
	</div>
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">

                <!-- section title -->
                <div class="col-md-12">
                    <div class="section-title">
                        <h3 class="title">Productos con Descuentos</h3>
                        <div class="section-nav">
                            <!--
                            <ul class="section-tab-nav tab-nav">

                                <li class="active" v-for="data in categoria_id" v-bind:key="data.id">
                                    <a data-toggle="tab" v-on:click="consulta(data.nombre,'All')" href="#tab1">{{data.nombre}}</a>
                                </li>
                                <li class="active" v-for="data in marca_id" v-bind:key="data.id">
                                    <a data-toggle="tab" v-on:click="consulta('All',data.nombre)" href="#tab1">{{data.nombre}}</a>
                                </li>

                            </ul>
                            -->
                        </div>
                    </div>
                </div>
                <!-- /section title -->

                <!-- Products tab & slick -->
                <div class="col-md-12">
                    <div class="row">


                        <div class="col-md-3 col-xs-6" v-for="data in consulta_datos_descuentos" v-bind:key="data.id">
                            <div class="product">
                                <router-link :to="{ name: 'ShowProducto', params: { id: data.id }}">
                                    <div class="product-img">
                                        <img v-if="data.productoimagenuno!=undefined" :src="'imagenes_files/'+data.productoimagenuno.nombre" alt="">
                                        <img v-else src="imagenes_files/null.png" alt="">
                                        <div class="product-label">
                                            <span v-if="data.descuento!=0" class="sale">{{data.descuento}}</span>
                                            <span v-if="data.is_nuevo==1" class="new">Nuevo</span>
                                        </div>
                                    </div>
                                </router-link>
                                <div class="product-body">
                                    <p class="product-category">Disponible</p>
                                    <h3 class="product-name"><a href="#">{{data.nombre}}</a></h3>
                                    <h4 class="product-price">${{ formatPrice(data.precio)}}

                                    </h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <!--
                                                    <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                    <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                    -->
                                        <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Añadir al Carrito</button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="col-md-12 ">
                <div class="row">

                </div>
            </div>
            <!-- Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">

                <!-- section title -->
                <div class="col-md-12">
                    <div class="section-title">
                        <h3 class="title">Nuevos Productos</h3>
                        <!--
                        <div class="section-nav">
                            <ul class="section-tab-nav tab-nav">

                                <li class="active" v-for="data in categoria_id" v-bind:key="data.id">
                                    <a data-toggle="tab" v-on:click="consulta(data.nombre,'All')" href="#tab1">{{data.nombre}}</a>
                                </li>
                                <li class="active" v-for="data in marca_id" v-bind:key="data.id">
                                    <a data-toggle="tab" v-on:click="consulta('All',data.nombre)" href="#tab1">{{data.nombre}}</a>
                                </li>

                            </ul>
                        </div>
                        -->
                    </div>
                </div>
                <!-- /section title -->

                <!-- Products tab & slick -->
                <div class="col-md-12">
                    <div class="row">


                        <div class="col-md-3 col-xs-6" v-for="data in consulta_datos" v-bind:key="data.id">
                            <div class="product">
                                <!--
                                <router-link :to="{ name: 'ShowProducto', params: { id: 123 }}">
-->
                                
                                <router-link :to="{ name: 'ShowProducto', params: { id: data.id }}">
                                   
                                    <div class="product-img">
                                        <img v-if="data.productoimagenuno!=undefined" :src="'imagenes_files/'+data.productoimagenuno.nombre" alt="">
                                        <img v-else src="imagenes_files/null.png" alt="">
                                        <div class="product-label">
                                            <span v-if="data.descuento!=0" class="sale">{{data.descuento}}</span>
                                            <span v-if="data.is_nuevo==1" class="new">Nuevo</span>
                                        </div>
                                    </div>
                                

                                </router-link>
                                <div class="product-body">
                                    <p class="product-category">Disponible</p>
                                    <h3 class="product-name"><a href="#">{{data.nombre}}</a></h3>
                                    <h4 class="product-price">${{ formatPrice(data.precio)}}

                                    </h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <!--
                                                    <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                    <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                    -->
                                        <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp"></span></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Añadir al Carrito</button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="col-md-12 ">
                <div class="row">

                </div>
            </div>
            <!-- Products tab & slick -->
        </div>
        <!-- /row -->
    </div>

    <!-- /container -->
</div>
</div>
</template>

<script>
import Vue from "vue";
//import Slick from 'vue-slick';
//import 'node_modules/slick-carousel/slick/slick.css';

import VueSlickCarousel from 'vue-slick-carousel'
import 'vue-slick-carousel/dist/vue-slick-carousel.css'
// optional style for arrows & dots
import 'vue-slick-carousel/dist/vue-slick-carousel-theme.css'
//import VueToast from "vue-toast-notification";
//import "vue-toast-notification/dist/index.css";
//import Select2 from "v-select2-component";
//https://www.npmjs.com/package/vue-toastr-2
import VueToastr2 from "vue-toastr-2";
import "vue-toastr-2/dist/vue-toastr-2.min.css";
window.toastr = require("toastr");
Vue.use(VueToastr2);

export default {
    //components: {  },
    components: {
        //  VueSingleSelect,
        VueToastr2,
        VueSlickCarousel
    },
    data() {

        return {
            marca_id: [],
            categoria_id: [],
            consulta_datos: [],
            consulta_datos_descuentos:[],

        };
    },
    mounted() {
        this.consulta();
        this.data_foraneo();
    },
    methods: {

        next() {
            this.$refs.slick.next();
        },

        prev() {
            this.$refs.slick.prev();
        },

        reInit() {
            // Helpful if you have to deal with v-for to update dynamic lists
            this.$nextTick(() => {
                this.$refs.slick.reSlick();
            });
        },

        // Events listeners
        handleAfterChange(event, slick, currentSlide) {
            console.log('handleAfterChange', event, slick, currentSlide);
        },
        handleBeforeChange(event, slick, currentSlide, nextSlide) {
            console.log('handleBeforeChange', event, slick, currentSlide, nextSlide);
        },
        handleBreakpoint(event, slick, breakpoint) {
            console.log('handleBreakpoint', event, slick, breakpoint);
        },
        handleDestroy(event, slick) {
            console.log('handleDestroy', event, slick);
        },
        handleEdge(event, slick, direction) {
            console.log('handleEdge', event, slick, direction);
        },
        handleInit(event, slick) {
            console.log('handleInit', event, slick);
        },
        handleReInit(event, slick) {
            console.log('handleReInit', event, slick);
        },
        handleSetPosition(event, slick) {
            console.log('handleSetPosition', event, slick);
        },
        handleSwipe(event, slick, direction) {
            console.log('handleSwipe', event, slick, direction);
        },
        handleLazyLoaded(event, slick, image, imageSource) {
            console.log('handleLazyLoaded', event, slick, image, imageSource);
        },
        handleLazeLoadError(event, slick, image, imageSource) {
            console.log('handleLazeLoadError', event, slick, image, imageSource);
        },

        consulta() {
            if (localStorage.getItem("producto_inicio")) {
                try {
                    //this.consulta_datos = JSON.parse(localStorage.getItem("producto_inicio"));
                } catch (e) {
                    localStorage.removeItem("producto_inicio");
                }
            }
           
            axios.get(`index/productos_nuevos`)
                .then(response => {
                    this.consulta_datos = response.data;
                    const parsed = JSON.stringify(response.data);
                    localStorage.setItem("producto_inicio", parsed);
            });
            /*
            axios.get(`index/consulta_inicio/${nombre_categoria}/${nombre_marca}`)
                .then(response => {
                    this.consulta_datos = response.data;
                    const parsed = JSON.stringify(response.data);
                    localStorage.setItem("producto_inicio", parsed);
            });
            */
            
        },
        data_foraneo() {
            axios.get(`Lista_producto/consulta_tipo`).then(response => {
                this.marca_id = response.data.marca_id;
                this.categoria_id = response.data.categoria_id;
                this.consulta_datos_descuentos = response.data.consulta_datos_descuentos;

                

            });
        },
        formatPrice(value) {
            let val = (value / 1).toFixed(0).replace(".", ",");
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
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

.slick-slider.slick-initialized {
    width: 100%;
}

.products-slick {
    padding: 10%;

}

.product-body {
    margin-bottom: 40px;
}

.products-tabs {
    width: 100%;
}

.slick-slide.slick-active {
    padding: 5%;
}

.carrusel-inicio {
    padding-top: 0px !important;
}
.product-body .product-rating>i.fa-star {
    color: #2fcc0e;
}
</style>
