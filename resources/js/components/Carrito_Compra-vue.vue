<template>
<div class='container-fluid'>

    <div class='row'>
        <div class='col-lg-12'>
            <div class='main-card mb-3 card'>
                <div class='card-body'>
                    <h1 class=''>Lista de Carrito_Compra </h1>

                    <!--
                    <nav>
                        <pagination :data='consulta_datos.data' @pagination-change-page='consulta'></pagination>
                    </nav>
                    -->

                    <div class='col-12'>
                        <!--
        <b-button v-if="$can('Carrito_Compra Anadir')"  @click='anadir_registro()' type='button' class='btn btn-wangir btn-lg' data-toggle='button' size='sm' aria-pressed='false' variant='success' style='margin-bottom: 5px; margin: 5px;'>Añadir registro
        </b-button>
        -->
                        <!--
        <router-link v-if="$can('Carrito_Compra Anadir')" :to="{ name: 'carrito_compraformadd',params:{id:0} }">

        <a v-bind:href="'/Marca/create'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
              Añadir Registro
        </a>
        -->
                        </router-link>
                        <!--
                        <div class='flexbox  float-right'>
                            <form ref='form' v-on:submit.prevent='consulta()'>
                                <b-input-group size='sm' class='float-right  margin-bottom-0' prepend='' style='margin-bottom: 0px;'>
                                    <b-form-input type='text' v-model='input_consulta_data'></b-form-input>
                                    <b-input-group-append>
                                        <b-button @click='consulta()' size='sm' text='Button' variant='success'>Buscar</b-button>
                                    </b-input-group-append>
                                </b-input-group>
                            </form>
                        </div>
                        -->
                        <br><br>
                    </div>

                    <b-table :items='consulta_datos' :fields='fields' responsive='sm' :sticky-header='stickyHeader' :no-border-collapse='noCollapse'>

                        <template v-slot:cell(producto_id_precio)='data'>
                            <h4 class="product-price">${{ formatPrice(data.item.producto_id.precio)}}</h4>
                        </template>
                        <template v-slot:cell(producto_id_nombre)='data'>
                            <router-link :to="{ name:'ShowProducto_list',params:{ id: data.item.producto_id.id }}">
                                {{ data.item.producto_id.nombre}}
                            </router-link>
                        </template>


                        
                        <template v-slot:cell(producto_id_imagen)='data'>
                            
                            <img v-if="data.item.producto_imagen==0" width="40px" height="40px" :src="'/imagenes_files/'+data.item.producto_id.productoimagenuno.nombre" alt="">
                            <img v-else width="40px" height="40px" :src="'/imagenes_files/'+data.item.producto_imagen_pk.nombre" alt="">
                            
                    
                        </template>
                        
                        <template v-slot:cell(cantidad)='data'>
                            <h4 class="product-price">{{ formatPrice(data.item.cantidad)}}</h4>
                        </template>
                        <template v-slot:cell(total)='data'>
                            <h4 class="product-price color-total">$ {{ formatPrice(data.item.cantidad*data.item.producto_id.precio)}}</h4>
                        </template>

                        <template v-slot:cell(Acciones)='data'>

                            <b-button-group>

                                <router-link :to="{ name: 'carrito_compraform', params: { id: data.item.id }}">
                                    <a v-bind:href="'/Carrito_Compra/'+data.item.id+'/edit'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
                                        Editar
                                    </a>
                                </router-link>

                                <b-button v-if="$can('Carrito_Compra Eliminar')"  @click='eliminar_registro(data.item.id)' data-backdrop="false" class='btn-sm btn btn-danger mr-1' size='sm' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Eliminar
                                </b-button>

                            </b-button-group>

                        </template>
                        <template v-slot:head(Acciones)='scope'>
                            <div class='text-nowrap'>Acciones</div>
                        </template>
                    </b-table>
                    <div class='col-12'>
                                                <h3 class="product-price color-total">Valor Total  $ {{ formatPrice(valor_total)}}</h3>

                                                <router-link  class="btn btn-secondary btn-lg" v-if="$can('Producto Editar')" :to="{ name: 'venta_procesar'/*,params: { id: producto_id.id}*/ }">
                                                    <i class="fa fa-pencil-square-o fa-3" aria-hidden="true"></i> Procesar la Compra $ {{ formatPrice(valor_total)}}
                                                </router-link>

                    </div>
                </div>
            </div>
        </div>

    </div> 
  

    <b-modal id="moda-eliminar" class=""  ref="my-modal" size="xl" >
        <template slot="modal-title">Eliminar un Registro </template>
        <div class="d-block text-center">
            <h3>¿Desea eliminar el registro permanente?</h3>
            <b-button class="mt-3 btn btn-danger " @click="eliminar_registro_delete()">Eliminar</b-button>
        </div>
    </b-modal>


</div>
</template>

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
            formulario_Carrito_Compra: false,
            validacion: [],
            modalShow: false,

            editar_dato: false,
            data: [],
            datas: [],
            input_consulta_data: "",
            stickyHeader: true,
            noCollapse: false,
            fields: [{
                    key: "Acciones",
                    stickyColumn: true,
                    label: "Acciones",
                    sortable: false
                },
                {
                    key: 'producto_id_imagen',
                    label: 'Imagen',
                    sortable: true
                },
                {
                    key: 'producto_id_nombre',
                    label: 'Producto',
                    sortable: true
                },
                {
                    key: 'producto_id_precio',
                    label: 'Precio',
                    sortable: true
                },
                {key: 'talla',sortable: true},
                {key: 'cantidad',sortable: true},
                {
                    key: 'Total',
                    sortable: true
                }

            ],

            //input_Carrito_Compra_id:[],
            data_foraneo_producto_id: [],
            data_foraneo_users_id: [],

            consulta_datos: [],
            errors: {},
            mensaje_formulario: "",
            page: 1,
            valor_total:0

        };
    },
    mounted() {
        this.consulta();
        this.data_foraneo();
    },
    methods: {

        consulta(page = 1) {
            if (localStorage.getItem("Carrito_Compra")) {
                try {
                    this.items = JSON.parse(localStorage.getItem("Carrito_Compra"));
                } catch (e) {
                    localStorage.removeItem("Carrito_Compra");
                }
            }

            this.page = page;
            //axios.get("Carrito_Compra/consulta?page=" +page+"&consulta_data="+this.input_consulta_data)
            axios.get(`Carrito_Compra/consulta?page=${page}&consulta_data=${this.input_consulta_data}`)
                .then(response => {
                    this.consulta_datos = response.data.producto;
                    this.valor_total = response.data.valor_total;
                    const parsed = JSON.stringify(response.data);
                    localStorage.setItem("Carrito_Compra", parsed);
                });
        },
        formatPrice(value) {
            let val = (value / 1).toFixed(0).replace(".", ",");
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        },

        eliminar_registro(data_id) {
            this.input_Carrito_Compra_id = data_id;
            var r = confirm("Esta seguro que desea eliminar el producto");
            if (r == true) {
                this.eliminar_registro_delete()
            }
            
        },
        data_foraneo() {

        },
        eliminar_registro_delete() {
            var data_id = this.input_Carrito_Compra_id;
            axios.delete(`Carrito_Compra/${this.input_Carrito_Compra_id}`).then(response => {
                const data = response.data;
                if (response.data.id) {
                    this.validacion = "";
                    this.$toastr.info("Operacio exitosa", "Datos Eliminados");
                    this.consulta(this.page);
                    this.$refs['my-modal'].hide()

                }
            });

        },

        $can(permissionName) {
            return true;

         //   return Permissions.indexOf(permissionName) !== -1;
        },

    }
};
</script>
<style>

.color-total{
    color:#2cbd32;
}


</style>
