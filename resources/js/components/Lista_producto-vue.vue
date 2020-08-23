<template>
<div class="">
    <div>
        <!-- SECTION -->
        <div class="section section-titulo" style="padding-top: 0px;">
            <!-- container -->
            <div class="container-fluid" style="padding-right: 0px;padding-left: 0px;s">
                <div class="row">
                    <div class="col-md-12">
                        <img v-if="$route.params.categoria_id==35" src="/img/cabecera-categoria-bicicletaderuta.png" class="img-fluid" alt="Responsive image" width="100%" height="20%px">
                        <img v-if="$route.params.categoria_id==13" src="/img/ca_bi_playa.png" class="img-fluid" alt="Responsive image" width="100%" height="20%px">
                        <img v-if="$route.params.categoria_id==4" src="/img/cabecera-categoria-bicicleta_de_turismo-01.png" class="img-fluid" alt="Responsive image" width="100%" height="20%px">
                        <img v-if="$route.params.categoria_id==3" src="/img/ca_bi_ninos.png" class="img-fluid" alt="Responsive image" width="100%" height="20%px">
                        <img v-if="$route.params.categoria_id==14" src="/img/ca_bi_montaña.png" class="img-fluid" alt="Responsive image" width="100%" height="20%px">
                        <img v-if="$route.params.categoria_id==2" src="/img/ca_accesorios.png" class="img-fluid" alt="Responsive image" width="100%" height="20%px">
                        <img v-if="$route.params.categoria_id==5" src="/img/ca_accesorios.png" class="img-fluid" alt="Responsive image" width="100%" height="20%px">
                        <img v-if="$route.params.categoria_id==6" src="/img/ca_accesorios.png" class="img-fluid" alt="Responsive image" width="100%" height="20%px">
                        <img v-if="$route.params.categoria_id==7" src="/img/ca_accesorios.png" class="img-fluid" alt="Responsive image" width="100%" height="20%px">
                        <img v-if="$route.params.categoria_id==8" src="/img/ca_accesorios.png" class="img-fluid" alt="Responsive image" width="100%" height="20%px">
                        <img v-if="$route.params.categoria_id==9" src="/img/ca_accesorios.png" class="img-fluid" alt="Responsive image" width="100%" height="20%px">
                        <img v-if="$route.params.categoria_id==10" src="/img/ca_accesorios.png" class="img-fluid" alt="Responsive image" width="100%" height="20%px">
                        <img v-if="$route.params.categoria_id==11" src="/img/ca_accesorios.png" class="img-fluid" alt="Responsive image" width="100%" height="20%px">
                        <img v-if="$route.params.categoria_id==12" src="/img/ca_accesorios.png" class="img-fluid" alt="Responsive image" width="100%" height="20%px">
                        <img v-if="$route.params.categoria_id>=15 && $route.params.categoria_id<=34" src="/img/ca_accesorios.png" class="img-fluid" alt="Responsive image" width="100%" height="20%px">
                    </div>
                </div>
            </div>
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- ASIDE -->

                    <div id="aside" class="col-md-3">
                        <!-- aside Widget -->

                        <div class="aside">

                            <h3 class="aside-title " type="button" v-b-toggle.collapse-3>Categorias</h3>
                            <div class="checkbox-filter">

                                <b-collapse visible id="collapse-3">

                                    <div class="input-checkbox" v-for="data in categoria_id" v-on:change="consulta()" v-bind:key="data.id">
                                        <b-form-checkbox-group id="checkbox-group-2" v-model="categoria_select" name="flavour-2">

                                            <label for="category-1">
                                                <b-form-checkbox class="label-chek-mass" :value="data.id">
                                                    <span>
                                                    </span>
                                                    {{data.nombre}}
                                                    <small>({{data.id}}})</small>

                                                </b-form-checkbox>

                                            </label>

                                        </b-form-checkbox-group>
                                    </div>

                                </b-collapse>

                            </div>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title " type="button" v-b-toggle.collapse-6>Precio</h3>

                            <h3 class="aside-title">Precio</h3>
                            <b-collapse visible id="collapse-6">

                                <div class="price-filter">
                                    <div id="price-slider"></div>
                                    <div class="input-number price-min">
                                        <input id="price-min" v-model="input_precio_max" type="number" v-on:change="consulta()">
                                        <span class="qty-up">+</span>
                                        <span class="qty-down">-</span>
                                    </div>
                                    <span>-</span>
                                    <div class="input-number price-max">
                                        <input id="price-max" v-model="input_precio_min" type="number" v-on:change="consulta()">
                                        <span class="qty-up">+</span>
                                        <span class="qty-down">-</span>
                                    </div>
                                </div>
                            </b-collapse>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title " type="button" v-b-toggle.collapse-4>Marca</h3>

                            <div class="checkbox-filter">
                                <b-collapse visible id="collapse-4">

                                    <div class="input-checkbox" v-for="data in marca_id" v-bind:key="data.id" v-on:change="consulta()">
                                        <b-form-checkbox-group id="checkbox-group-3" v-model="marca_select" name="flavour-3">

                                            <label for="marca-1">
                                                <b-form-checkbox class="label-chek-mass" :value="data.id">
                                                    <span>
                                                    </span>
                                                    {{data.nombre}}
                                                    <small>({{data.id}}})</small>

                                                </b-form-checkbox>

                                            </label>

                                        </b-form-checkbox-group>
                                    </div>
                                </b-collapse>

                            </div>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->

                        <div class="aside">
                            <h3 class="aside-title " type="button" v-b-toggle.collapse-5>Productos Nuevos</h3>
                            <b-collapse visible id="collapse-5">

                                <div class="product-widget" v-for="data in producto_nuevos" v-bind:key="data.id">
                                    <router-link :to="{ name: 'ShowProducto', params: { id: data.id }}">

                                        <div class="product-img">
                                            <img v-if="data.productoimagenuno" :src="'imagenes_files/'+data.productoimagenuno.nombre" alt="">
                                            <img v-else src="imagenes_files/null.png" alt="">
                                        </div>
                                    </router-link>
                                    <div class="product-body">
                                        <p class="product-category">Category</p>
                                        <h3 class="product-name"><a href="#">{{data.nombre}}</a></h3>
                                        <h4 class="product-price">$ {{ formatPrice(data.precio)}} </h4>
                                    </div>
                                </div>
                            </b-collapse>

                        </div>

                        <!-- /aside Widget -->
                    </div>
                    <!-- /ASIDE -->

                    <!-- STORE -->
                    <div id="store" class="col-md-9">
                        <!-- store top filter -->
                        <div class="store-filter clearfix">
                            <div class="store-sort">
                                <!--

<label>

Ordenar por:

<select class="input-select" v-model="input_orden">

<option value="1">Precio Mayor</option>

<option value="2">Precio Menor</option>

<option value="3">Mas Nuevo</option>

<option value="4">Mas Viejo</option>

</select>

</label>
-->
                                <label>
                                    Buscar Por:
                                    <input type="text" class="input-select" v-on:change="consulta()" v-model="input_consulta_data">

                                </label>
                            </div>
                            <!--
							<ul class="store-grid">
                                <li class="active"><i class="fa fa-th"></i></li>
                                <li><a href="#"><i class="fa fa-th-list"></i></a></li>
                            </ul>
							-->
                        </div>

                        <!-- /store top filter -->

                        <!-- store products -->
                        <div class="row">
                            <div class="col-md-12 col-xs-12">

                                <nav class="">
                                    <pagination class="" :data='consulta_datos' @pagination-change-page='consulta'></pagination>
                                </nav>
                            </div>

                            <!-- product -->
                            <div class="col-md-4 col-xs-6 align-self-end align-self-start" v-for="datas in consulta_datos.data" v-bind:key="datas.id">
                                <div class="product">
                                    <router-link :to="{ name:'ShowProducto_list',params:{ id: datas.id }}">

                                        <div class="product-img" >
                                            <img width="100%"   v-if="datas.productoimagenuno!=null" :src="'/imagenes_files/'+datas.productoimagenuno.nombre" alt="">
                                            <img v-else src="/imagenes_files/null.png" alt="">
                                            <div class="product-label">
                                                <span v-if="datas.descuento!=0" class="sale">{{datas.descuento}}</span>
                                                <span v-if="datas.is_nuevo==1" class="new">Nuevo</span>
                                            </div>
                                        </div>
                                    </router-link>
                                    <div class="product-body">
                                        <p class="product-category">Disponible</p>
                                        <h3 class="product-name productomass">
                                            <router-link :to="{ name: 'ShowProducto', params: { id: datas.id }}">{{datas.nombre}}</router-link>
                                        </h3>
                                        <h4 class="product-price">$ {{formatPrice(datas.precio)}}
                                            <!--
                                            <del class="product-old-price">$990.00</del>
                                            -->
                                        </h4>
                                        <div class="product-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product-btns">
                                            <button class="add-to-wishlist" v-on:click="favorito(datas.id)"><i class="fa fa-heart-o"></i><span class="tooltipp">Añadir a Favorito</span></button>

                                            <!--

<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>

<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>

-->
                                        </div>
                                    </div>
                                    <div class="add-to-cart">
                                        <router-link :to="{ name:'ShowProducto_list',params:{ id: datas.id }}">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Añadir al Carrito</button>
                                        </router-link>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- /store products -->

                        <!-- store bottom filter -->
                        <div class="store-filter clearfix">
                            <nav class="">
                                <pagination class="" :data='consulta_datos' @pagination-change-page='consulta'></pagination>
                            </nav>
                            <!--

<span class="store-qty">Showing 20-100 products</span>

<ul class="store-pagination">

<li class="active">1</li>

<li><a href="#">2</a></li>

<li><a href="#">3</a></li>

<li><a href="#">4</a></li>

<li><a href="#"><i class="fa fa-angle-right"></i></a></li>

</ul>

-->
                        </div>
                        <!-- /store bottom filter -->
                    </div>
                    <!-- /STORE -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- NEWSLETTER -->

        <!-- /NEWSLETTER -->
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
//import Select2 from "v-select2-component";
//https://www.npmjs.com/package/vue-toastr-2
import VueToastr2 from "vue-toastr-2";
import "vue-toastr-2/dist/vue-toastr-2.min.css";
window.toastr = require("toastr");
Vue.use(VueToastr2);

export default {
    components: {
        //  VueSingleSelect,
        VueToastr2,
        VueSlickCarousel
        //Select2
    },
    name: 'MyComponent',
    data() {

        return { marca_select: [],categoria_select: [],input_consulta_data: [],input_precio_min: 0,input_precio_max: 7000000,
            marca_id: [],
            categoria_id: [],
            consulta_datos: [],
            consulta_datos_s: [],
            errors: {},
            mensaje_formulario: "",
            page: 1,
            show_twitter: [],
            producto_nuevos: [],
            input_buscar: [],
            categoria_id: []   
        };
    },
    mounted() {

        //var categoria_id = 
        //var nombre = location.search.slice(1).split("&")[1].split("=")[1]
        try {
            this.input_consulta_data = location.search.slice(1).split("&")[1].split("=")[1]

            this.categoria_select = [location.search.slice(1).split("&")[0].split("=")[1]]

            this.input_consulta_data = this.input_consulta_data.replace('%20', ' ')
            //alert(categoria_id);
            //alert(nombre);
        } catch (error) {

        }

        if (this.$route.params.marca_id) {
            //alert('tipo');
            //this.categoria_select= ['All'];
            this.marca_select = [this.$route.params.marca_id];
        }
        if (this.$route.params.categoria_id) {
            //alert('tipo');
            //this.categoria_select= ['All'];
            this.categoria_select = [this.$route.params.categoria_id];
        }

        this.consulta();
        this.consulta_tipo();

        if (
            (navigator.userAgent.match(/Android/i)) ||
            (navigator.userAgent.match(/webOS/i)) ||
            (navigator.userAgent.match(/iPhone/i)) ||
            (navigator.userAgent.match(/iPod/i)) ||
            (navigator.userAgent.match(/iPad/i)) ||
            (navigator.userAgent.match(/BlackBerry/i))
        ) {
            this.movi()
        }
    },
    beforeRouteUpdate(to, from, next) {
        //alert('de');
        //this.marca_select= [this.$route.params.marca_id];
        //this.categoria_select= [this.$route.params.categoria_id]; 
        const categoria_id = to.params.categoria_id
        const marca_id = to.params.marca_id
        axios.get(`/index/sub_consulta/${categoria_id}/${marca_id}`).then(response => {

            this.consulta_datos = response.data;

            //this.productos_all = response.data;
            //this.categoria_id = response.data;
            //this.marca_id = response.data.marca_id;
            //this.producto_nuevos = response.data.producto_nuevos;

        });

        //alert(categoria_id);
        //this.getContent(to.params.uid);
        next();
        if (
            (navigator.userAgent.match(/Android/i)) ||
            (navigator.userAgent.match(/webOS/i)) ||
            (navigator.userAgent.match(/iPhone/i)) ||
            (navigator.userAgent.match(/iPod/i)) ||
            (navigator.userAgent.match(/iPad/i)) ||
            (navigator.userAgent.match(/BlackBerry/i))
        ) {
            this.movi()
        }
    },
    methods: {
        movi() {
            $('#collapse-3').collapse('hide');
            $('#collapse-4').collapse('hide');
            $('#collapse-5').collapse('hide');
            $('#collapse-6').collapse('hide');

        },
        consulta(page = 1) {
            //alert("The URL of this page is: " + window.location.href);
            if (localStorage.getItem("lista_producto")) {
                try {
                    this.items = JSON.parse(localStorage.getItem("lista_producto"));
                } catch (e) {
                    localStorage.removeItem("lista_producto");
                }
            }
            this.page = page;
            if (this.categoria_select == 'All') {
                this.categoria_select = ['All'];
            }
            setInterval(function () {
                //document.getElementById("testdiv").innerHTML=t++;
            }, 3000, "JavaScript");
            for (let index = 0; index < 1000; index++) {}
            const data = {
                marca_id: this.marca_select,
                categoria_id: this.categoria_select,
                precio_min: this.input_precio_min,
                precio_max: this.input_precio_max,
                categoria_id: this.categoria_select,
                marca_id: this.marca_select,

            }

            //axios.get("Twitter/consulta?page=" +page+"&consulta_data="+this.input_consulta_data)
            axios.post(`/Lista_producto/consulta_productos?page=${page}&consulta_data=${this.input_consulta_data}`, data)
                .then(response => {
                    this.consulta_datos = response.data;
                    const parsed = JSON.stringify(response.data);
                    localStorage.setItem("lista_producto", parsed);
                });
        },
        consulta_tipo() {
            axios.get(`/Lista_producto/consulta_tipo`).then(response => {
                //this.productos_all = response.data;
                this.categoria_id = response.data.categoria_id;
                this.marca_id = response.data.marca_id;
                this.producto_nuevos = response.data.producto_nuevos;

                this.categoria_id.unshift({
                    id: 'All',
                    nombre: 'TODOS'
                })
                this.marca_id.unshift({
                    id: 'All',
                    nombre: 'TODOS'
                })

            });
        },
        formatPrice(value) {
            let val = (value / 1).toFixed(0).replace(".", ",");
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
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
        favorito(id) {
            axios.get(`/Favorito/${id}`).then(response => {
                this.$toastr.info("Añadido a favoritos", "Añadido a favoritos");
            });
        },

        cancelar_registro() {
            this.formulario_Twitter = false;
        },
        $can(permissionName) {
            return true;
            //return Permissions.indexOf(permissionName) !== -1;
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

.input-checkbox label {
    font-size: 15px;
}

.checkbox-filter {
    font-size: 15px !important;
}

.page-link {

    background-color: #d10024 !important;
    border-color: #d10024 !important;
}

.section-titulo {
    padding-top: 30px;
    padding-bottom: 30px;

}

.product-body .product-rating>i.fa-star {
    color: #2fcc0e;
}
.productomass{
	min-height: 30px;
}
.product-img {
 
    min-height: 190px;
}
</style>
