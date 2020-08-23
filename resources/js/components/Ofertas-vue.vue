<template>
<div>
<div class="container-fluid" style="padding-right: 0px;padding-left: 0px;s">
    <div class="row">
        <div class="col-md-12">
            <img src="/img/OFERTAS-01.png" class="img-fluid" alt="Responsive image" width="100%" height="20%px">
        </div>
    </div>
</div>

<div class='container'>

    <div class='row'>
        <div  
        class="col-md-12"><div  class="section-title"><h3  class="title"></h3></div></div>
        <div class="col-md-3 col-xs-6" v-for="data in consulta_datos" v-bind:key="data.id">
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
</template>

<style>
.texto-lectura {
    font-size: 18px;

}

.titulo {

    text-align: center;
    color: #ffffff;
    background: #2fcc0e;
    font-size: 2em;
    _font-family: 'helvcondensedbold';
    margin: 0 auto 15px;
    font-weight: 100;
    padding: 12px;
    letter-spacing: 2px;
    padding: 14px 12px;
    letter-spacing: 2px;
    width: 45%;
}
</style>

<script>
import Vue from "vue";

import Select2 from "v-select2-component";
//https://www.npmjs.com/package/vue-toastr-2
import VueToastr2 from "vue-toastr-2";
import "vue-toastr-2/dist/vue-toastr-2.min.css";
window.toastr = require("toastr");
Vue.use(VueToastr2);

export default {
    components: {
        VueToastr2,
        Select2
    },
    data() {

        return {
            consulta_datos:[]
        };
    },
    mounted() {
        $('html, body').animate({
            scrollTop: 0
        }, 'slow');
        this.consulta()
    },
    methods: {

        consulta(){
            axios.get(`index/ofectas`)
                .then(response => {
                    this.consulta_datos = response.data;
                    //const parsed = JSON.stringify(response.data);
                    //localStorage.setItem("producto_inicio", parsed);
            });

        },

        $can(permissionName) {
            return Permissions.indexOf(permissionName) !== -1;
        },
        
        formatPrice(value) {
            let val = (value / 1).toFixed(0).replace(".", ",");
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        },

    }
};
</script>
