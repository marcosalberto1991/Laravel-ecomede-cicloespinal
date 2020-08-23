<template>
<div class='container-fluid'>

    <div class='row'>
        <div class='col-lg-12'>
            <div class='main-card mb-3 card'>
                <div class='card-body'>
                    <h1 class=''>Mis pedidos </h1>

                    <div class='col-12'>
                        <!--
        <b-button v-if="$can('Producto_Venta Anadir')"  @click='anadir_registro()' type='button' class='btn btn-wangir btn-lg' data-toggle='button' size='sm' aria-pressed='false' variant='success' style='margin-bottom: 5px; margin: 5px;'>Añadir registro
        </b-button>
        -->
                        <!--
      <router-link v-if="$can('Producto_Venta Anadir')" :to="{ name: 'producto_ventaformadd',params:{id:0} }">

        <a v-bind:href="'/Marca/create'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
              Añadir Registro
        </a>
      </router-link>
-->

                    </div>
                    <div class='col-md-6'>

                        <b-table :items='consulta_datos' :fields='fields' responsive='sm' :sticky-header='stickyHeader' :no-border-collapse='noCollapse'>
                            <template v-slot:cell(precio)='data'>
                                <h4 class="product-price">$ {{ formatPrice(data.item.precio)}} </h4>
                            </template>
                            <template v-slot:cell(valor_total)='data'>
                                <h4 class="product-price-sum">$ {{ formatPrice(data.item.precio*data.item.cantidad )}} </h4>
                            </template>
                            <template v-slot:cell(Acciones)='data'>

                                <b-button-group>
                                    <!--
          <b-button v-if="$can('Producto_Venta Editar')" size='sm' variant='warning'  type='button' class='btn-sm btn btn-wangir mr-1' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Editar
            </b-button>
            -->
                                    <!--
            <router-link :to="{ name: 'producto_ventaform', params: { id: data.item.id }}">
                <a v-bind:href="'/Producto_Venta/'+data.item.id+'/edit'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
                    Editar
                </a>
            </router-link>

            <b-button v-if="$can('Producto_Venta Eliminar')"  v-b-modal.moda-eliminar @click='eliminar_registro(data.item.id)'
                type='button' class='btn-sm btn btn-danger mr-1' size='sm' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Eliminar
            </b-button>
            -->
                                    <!--
            <a v-bind:href=" data.item.id+'/Sucursale'"  class='btn-sm btn btn-success mr-1' size='sm'  style='margin-bottom: 5px; margin: 5px;'>Surcusales </a>
            -->
                                </b-button-group>

                            </template>
                            <template v-slot:head(Acciones)='scope'>
                                <div class='text-nowrap'>Acciones</div>
                            </template>
                        </b-table>
                        <h3 class="product-price-total"> Valor total $ {{ formatPrice(valor_total)}} </h3>

                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="section-title text-center">
                            <h3 class="title">Metodo de pago</h3>
                        </div>
                        <div class="payment-method">
                            <div class="input-radio">
                                <input type="radio" name="payment" id="payment-1">
                                <label for="payment-1">
                                    <span></span>
                                    Transferencia bancaria directa
                                </label>
                                <div class="caption">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>
                            </div>
                            <div class="input-radio">
                                <input type="radio" name="payment" id="payment-2">
                                <label for="payment-2">
                                    <span></span>
                                    Cheque Payment
                                </label>
                                <div class="caption">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>
                            </div>
                            <div class="input-radio">
                                <input type="radio" name="payment" id="payment-3">
                                <label for="payment-3">
                                    <span></span>
                                    Paypal System
                                </label>
                                <div class="caption">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-12 text-center">
                        <a href="#" class="primary-btn order-submit">
                            <font style="vertical-align: inherit;">
                                <font style="vertical-align: inherit;">Realizar pedido</font>
                            </font>
                        </a>

                    </div>
                </div>
            </div>
        </div>

    </div>

    <b-modal id="moda-eliminar" size="xl" hide-footer>
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
            formulario_Producto_Venta: false,
            validacion: [],
            editar_dato: false,
            data: [],
            datas: [],
            input_consulta_data: "",
            stickyHeader: true,
            noCollapse: false,
            fields: [
                //{ key: "Acciones",stickyColumn: true, label:"Acciones" ,sortable: false },
                //{ key: 'id', sortable:true},
                {
                    key: 'producto_id.nombre',
                    label: 'Producto',
                    sortable: true
                },
                //{ key: 'venta_id', sortable:true},
                {
                    key: 'cantidad',
                    tdClass: 'product-price',

                },
                {
                    key: 'precio',
                    sortable: true,
                    label: 'Valor Unitario'
                },
                {
                    key: 'valor_total',
                    sortable: true,
                    label: 'Valor Total'

                },
                //{ key: 'is_iva', sortable:true},
                //{ key: 'precio_iva', sortable:true},
                //{ key: 'created_at', sortable:true},
                //{ key: 'updated_at', sortable:true},

            ],

            //input_Producto_Venta_id:[],
            data_foraneo_producto_id: [],
            data_foraneo_venta_id: [],

            consulta_datos: [],
            errors: {},
            mensaje_formulario: "",
            page: 1,
            valor_total: [],

        };
    },
    mounted() {
        this.consulta();
        this.data_foraneo();
    },
    methods: {

        consulta(page = 1) {
            if (localStorage.getItem("Producto_Venta")) {
                try {
                    this.items = JSON.parse(localStorage.getItem("Producto_Venta"));
                } catch (e) {
                    localStorage.removeItem("Producto_Venta");
                }
            }

            this.page = page;
            //axios.get("Producto_Venta/consulta?page=" +page+"&consulta_data="+this.input_consulta_data)
            axios.get(`/Ventas/venta_procesar_funcion?page=${page}&consulta_data=${this.input_consulta_data}`)
                .then(response => {
                    this.consulta_datos = response.data.producto;
                    this.valor_total = response.data.valor_total;
                    const parsed = JSON.stringify(response.data);
                    localStorage.setItem("Producto_Venta", parsed);
                });
        },

        eliminar_registro(data_id) {
            this.input_Producto_Venta_id = data_id;
        },
        data_foraneo() {

        },
        formatPrice(value) {
            let val = (value / 1).toFixed(0).replace(".", ",");
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        },
        eliminar_registro_delete() {
            var data_id = this.input_Producto_Venta_id;
            axios.delete(`Producto_Venta/${this.input_Producto_Venta_id}`).then(response => {
                const data = response.data;
                if (response.data.id) {
                    this.validacion = "";
                    this.$toastr.info("Operacio exitosa", "Datos Eliminados");
                    this.consulta(this.page);
                }
            });

        },

        $can(permissionName) {
            

            return Permissions.indexOf(permissionName) !== -1;
        },

    }
};
</script>

<style lang="css">
.product-price {
    color: #2B2D42;
    font-weight: 700;
    margin: 0 0 10px;
}

.product-price-total {
    color: #2eb334;
    font-weight: 700;
    margin: 0 0 10px;
}

.product-price-sum {
    color: #252ad4
}
</style>
