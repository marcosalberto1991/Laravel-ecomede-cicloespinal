<template>
<div class="container-fluid">
    <div class="row">
        <div class='col-lg-12'>
            <div class='main-card mb-3 card'>
                <div class='card-body'>
                    <h1 class=''>Lista de Marca </h1>

                    <nav>
                        <pagination :data='consulta_datos' @pagination-change-page='consulta'></pagination>
                    </nav>

                    <div class='col-12'>
                        <!-- 
                            <router-link :to="{ name: 'Orden_Servicio_Proceso', params: { id: data.item.id }}">
                        -->
                            <router-link v-if="$can('Marcav2 Anadir')" :to="{ name: 'marcaformadd',params:{id:0} }">

                                <a v-bind:href="'/Marca/create'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
                                        Nueva Marca
                                </a>
                            </router-link>

                        

                        <div class='flexbox  float-right'>
                            <form ref='form' v-on:submit.prevent='consulta()'>
                                <b-input-group size='sm' class='float-right  margin-bottom-0' prepend='' style='margin-bottom: 0px;'>
                                    <b-form-input type='text' v-model='input_consulta_data'></b-form-input>
                                    <b-input-group-append>
                                        <b-button @click='consulta()' size='sm' text='Button' variant='success'>Buscar</b-button>
                                    </b-input-group-append>
                                </b-input-group>
                            </form>
                        </div><br><br>
                    </div>

                    <b-table :items='consulta_datos.data' :fields='fields' responsive='sm' :sticky-header='stickyHeader' :no-border-collapse='noCollapse'>
                        <template v-slot:cell(Acciones)='data'>

                            <b-button-group>
                                
                                <router-link :to="{ name: 'marcaform', params: { id: data.item.id }}">
                                    <a v-bind:href="'/Marca/'+data.item.id+'/edit'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
                                        Editar
                                    </a>
                                </router-link>
                                <!--
                                <b-button v-if="$can('Marca Editar')"  size='sm' variant='warning' @click='editar_registro(data.item)' type='button' class='btn-sm btn btn-wangir mr-1' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Editar
                                </b-button> 
                                -->
                                <b-button v-if="$can('Marca Eliminar')" v-b-modal.moda-eliminar @click='eliminar_registro(data.item.id)' type='button' class='btn-sm btn btn-danger mr-1' size='sm' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Eliminar
                                </b-button>
                                <!--
            <a v-bind:href=" data.item.id+'/Sucursale'"  class='btn-sm btn btn-success mr-1' size='sm'  style='margin-bottom: 5px; margin: 5px;'>Surcusales </a>
            -->
                            </b-button-group>

                        </template>
                        <template v-slot:head(Acciones)='scope'>
                            <div class='text-nowrap'>Acciones</div>
                        </template>
                    </b-table>

                </div>
            </div>
        </div>
    </div>

    <b-modal id="moda-eliminar" ref="my-modal" size="xl" hide-footer>
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
import VueToastr2 from "vue-toastr-2";//https://www.npmjs.com/package/vue-toastr-2
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
            formulario_Marca: false,
            validacion: [],
            //editar_dato: false,
            data: [],
            datas: [],
            input_consulta_data: "",
            stickyHeader: true,
            noCollapse: false,
            fields: [
                { key: "Acciones", stickyColumn: true, label: "Acciones", sortable: false },
                { key: 'id', sortable: true },
                { key: 'nombre', sortable: true },
                { key: 'logo', sortable: true },

            ],

            consulta_datos: [],
            errors: {},
            //mensaje_formulario: "",
            page: 1,

        };
    },
    mounted() {
        this.consulta();
        //this.data_foraneo();
    },
    methods: {

        consulta(page = 1) {
            if (localStorage.getItem("Marca")) {
                try {
                    this.items = JSON.parse(localStorage.getItem("Marca"));
                } catch (e) { localStorage.removeItem("Marca"); }
            }

            this.page = page;
            //axios.get("Marca/consulta?page=" +page+"&consulta_data="+this.input_consulta_data)
            axios.get(`Marca/consulta?page=${page}&consulta_data=${this.input_consulta_data}`)
                .then(response => {
                    this.consulta_datos = response.data;
                    const parsed = JSON.stringify(response.data);
                    localStorage.setItem("Marca", parsed);
                });
        },
        eliminar_registro(data_id) {
            this.input_Marca_id = data_id;
        },
        eliminar_registro_delete() {
            var data_id = this.input_Marca_id;
            axios.delete(`Marca/${this.input_Marca_id}`).then(response => {
                const data = response.data;
                if (response.data.id) {
                    this.validacion = "";
                    this.$toastr.info("Operacio exitosa", "Datos Eliminados");
                    this.consulta(this.page);         
                     this.$refs['my-modal'].hide()

                }
            });

        },
        anadir_registro() {
            this.validacion = "";
            this.formulario_Marca = true;
            this.editar_dato = false;
            this.limpiar_form();
            this.mensaje_formulario = "Añadir un nuevo registro"
        },

        cancelar_registro() {
            this.formulario_Marca = false;
        },
        $can(permissionName) {
            
            return Permissions.indexOf(permissionName) !== -1;
        },


    }
};
</script>
