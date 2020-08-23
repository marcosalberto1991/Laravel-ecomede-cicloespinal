<template>
<div class="row">
    <div v-if="formulario_ProductoImagen" class="col-lg-12 ">
        <div class="main-card mb-3 card formulario">
            <div class="card-body">
                <h1 class="card-title"></h1>
                <h2>Formulario </h2>
                <div class="col-md-12 row">
                    <div class="form-group col-md-12 col-sm-12" style="margin-bottom: 6px;">
                        <button type="submit" @click="formulario()" class="btn btn-primary">Guardar </button>
                        <a class="btn btn-warning" @click="cancelar_registro()">Cancelar</a>
                    </div>
                </div>
                <div class="col-lg-12">

                    <form ref="form" v-on:submit.prevent="formulario()">
                        <div class="row">
                            <div class="col-md-12 row">
                                <input type="hidden" v-model="input_ProductoImagen_id">



                                <!--
                                <div class="form-group col-md-4 col-sm-12">
                                    <label for="exampleInputEmail1"><b>nombre</b></label>
                                    <input type="files" v-model="input_nombre" placeholder="nombre" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <b-alert show v-for="data in validacion.nombre" v-bind:key="data.nombre" variant="danger">
                                        {{data}}
                                    </b-alert>

                                </div>
                                -->
                                <div class="form-group col-md-4 col-sm-12">
                                <label for="exampleInputEmail1"><b>Subir el archivo de la imagen </b></label>
                                <b-form-file v-model="input_archivo" browse-text='Archivo' class="color-back" id="file-default">Archivo</b-form-file>
                                <!--
                                <file-pond
                                    name="test"
                                    ref="pond"
                                    v-model="input_nombre"
                                    class-name="my-pond"
                                    label-idle="Arrastra la imagen..."
                                    allow-multiple="false"
                                    accepted-file-types="image/jpeg, image/png"
                                    v-bind:files="myFiles"
                                    v-on:init="handleFilePondInit"/>
                                    -->


                                </div>
                                <div class="form-group col-md-2 col-sm-12">
                                    <label for="exampleInputEmail1"><b>orden</b></label>

                                    <input type="text" v-model="input_orden" placeholder="orden" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <b-alert show v-for="data in validacion.orden" v-bind:key="data.orden" variant="danger">
                                        {{data}}
                                    </b-alert>
                                </div>
                                

                                <div class="form-group col-md-12 col-sm-12">
                                </div>
                                
                                <div class="form-group col-md-4 col-sm-12">
                                    <label for="exampleInputEmail1"><b>Color Primario</b></label>
                                    <input type="text" v-model="input_color_p" placeholder="nombre" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <chrome-picker v-model="input_color_p" />
                                    <photoshop-picker v-model="input_color_p" />
                                   
                                </div>
                                <div class="form-group col-md-4 col-sm-12">
                                    <label for="exampleInputEmail1"><b>Color Segundario</b>{{input_color_s.hex}}</label>
                                    <input type="text" v-model="input_color_s" placeholder="nombre" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <chrome-picker v-model="input_color_s" />
                                    <photoshop-picker v-model="input_color_s" />

                                </div>
                                <div class="form-group col-md-2 col-sm-12">
                                    <img :src="'/imagenes_files/'+input_nombre" width="160%">
                                </div>






                                <div class="form-group col-md-12 col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary">Enviar</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div v-else class='col-lg-12'>
        <div class='main-card mb-3 card'>
            <div class='card-body'>
                <h1 class=''>Lista de imagenes </h1>

                <nav>
                    <pagination :data='consulta_datos' @pagination-change-page='consulta'></pagination>
                </nav>

                <div class='col-12'>
                    <b-button v-if="$can('ProductoImagen Anadir')" @click='anadir_registro()' type='button' class='btn btn-wangir btn-lg' data-toggle='button' size='sm' aria-pressed='false' variant='success' style='margin-bottom: 5px; margin: 5px;'>Añadir registro
                    </b-button>
                   
                </div>
                                <div class='col-12'>

                <span class="row" >

                <b-card v-for="data in consulta_datos.data" v-bind:key="data.id"
                    
                    :img-src="'/imagenes_files/'+data.nombre"
                    img-alt="Image"
                    img-top
                    tag="article"
                    style="max-width: 40rem;"
                    class="mb-2"
                >
                  
                    <b-button v-if="$can('ProductoImagen Editar')" v-b-modal.moda-registro size='sm' variant='warning' @click='editar_registro(data)' type='button' class='btn-sm btn btn-wangir mr-1' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Editar
                    </b-button>
                    <b-button v-if="$can('ProductoImagen Eliminar')" v-b-modal.moda-eliminar @click='eliminar_registro(data.id)' type='button' class='btn-sm btn btn-danger mr-1' size='sm' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Eliminar
                    </b-button>
                    <button                  class='btn'   :style="'background:'+data.color_p+''"           > P</button>
                    <button                 class='btn'     :style="'background:'+data.color_s+''"           >S </button>
                </b-card>
                </span>
                                </div>
<!--
                <b-table :items='consulta_datos.data' :fields='fields' responsive='sm' :sticky-header='stickyHeader' :no-border-collapse='noCollapse'>
                    <template v-slot:cell(nombre)='data'>
                       <img :src="'/imagenes_files/'+data.item.nombre" alt="Girl in a jacket" width="255" height="255" />
                    </template>
                    <template v-slot:cell(Acciones)='data'>

                        <b-button-group>
                            <b-button v-if="$can('ProductoImagen Editar')" v-b-modal.moda-registro size='sm' variant='warning' @click='editar_registro(data.item)' type='button' class='btn-sm btn btn-wangir mr-1' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Editar
                            </b-button>
                            <b-button v-if="$can('ProductoImagen Eliminar')" v-b-modal.moda-eliminar @click='eliminar_registro(data.item.id)' type='button' class='btn-sm btn btn-danger mr-1' size='sm' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Eliminar
                            </b-button>
                        </b-button-group>

                    </template>
                    <template v-slot:head(Acciones)='scope'>
                        <div class='text-nowrap'>Acciones</div>
                    </template>
                </b-table>
-->
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

//import VueToast from "vue-toast-notification";
//import "vue-toast-notification/dist/index.css";
import Select2 from "v-select2-component";
//https://www.npmjs.com/package/vue-toastr-2
import VueToastr2 from "vue-toastr-2";
import "vue-toastr-2/dist/vue-toastr-2.min.css";
window.toastr = require("toastr");
Vue.use(VueToastr2);

import vueFilePond from 'vue-filepond';
import FilePondPluginFileValidateType from 'filepond-plugin-file-validate-type';
import FilePondPluginImagePreview from 'filepond-plugin-image-preview';

// Import styles
import 'filepond/dist/filepond.min.css';
import 'filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.css';

// Create FilePond component
const FilePond = vueFilePond( FilePondPluginFileValidateType, FilePondPluginImagePreview );
//import ColorPicker from '@radial-color-picker/vue-color-picker';
import { ColourPicker } from 'vue-colour-picker'
import { Photoshop } from 'vue-color'

/*
new Vue({
  components: {
    'colour-picker': ColourPicker
  },

  data(){
      return{
          colour: '#000000'
      }
  }
})
*/
export default {
    components: {

        VueToastr2,
        Select2,
        //ColorPicker ,
        //'colour-picker': ColourPicker,
        //ColourPicker,
        'photoshop-picker': Photoshop,
        'chrome-picker': chrome,



        FilePond
    },
    props:['input_producto_ids'],
    data() {

        return {
            colors:[],
            myFiles: [],
            formulario_ProductoImagen: false,
            validacion: [],
            editar_dato_imag: false,
            data: [],
            datas: [],
            input_consulta_data: "",
            stickyHeader: true,
            noCollapse: false,
             color_p: {
                hue: 50,
                saturation: 100,
                luminosity: 50,
                alpha: 1
            },
            color_s: {
                hue: 50,
                saturation: 100,
                luminosity: 50,
                alpha: 1
            },
                      colour: '#000000',

            fields: [{
                    key: "Acciones",
                    stickyColumn: true,
                    label: "Acciones",
                    sortable: false
                },
                {
                    key: 'nombre',
                    sortable: true
                },
                {
                    key: 'orden',
                    sortable: true
                },

                {
                    key: 'subido_por',
                    sortable: true
                },
                {
                    key: 'created_at',
                    sortable: true
                },
                {
                    key: 'updated_at',
                    sortable: true
                },

            ],

            input_ProductoImagen_id: [],
            data_foraneo_producto_id: [],
            input_id: [],
            input_nombre: [],
            input_orden: '2',
            input_archivo:[],
          //  input_producto_id: [],
            input_subido_por: [],
            input_created_at: [],
            input_updated_at: [],
            input_color_p: [],
            input_color_s: [],
            //input_producto_ids:[],
            consulta_datos: [],
            errors: {},
            mensaje_formulario: "",
            page: 1,

        };
    },
    mounted() {

        this.consulta();
        //this.data_foraneo();
    },
    methods: {
        handleFilePondInit: function() {
            console.log('FilePond has initialized');

            // example of instance method call on pond reference
            this.$refs.pond.getFiles();
        },
        onInput_p(hue) {
            //this.color.hue = hue;
            this.color_p.hue = hue;
            this.color_p.hue = hue;
            //alert(hue)
            
        },
        onInput_s(hue) {
            //this.color.hue = hue;
            this.color_s.hue = hue;
            this.color_s.hue = hue;
            //alert(hue)
            
        },
        consulta(page = 1) {
            if (localStorage.getItem("ProductoImagen")) {
                try {
                    this.items = JSON.parse(localStorage.getItem("ProductoImagen"));
                } catch (e) {
                    localStorage.removeItem("ProductoImagen");
                }
            }

            this.page = page;
            //pro=this.input_producto_ids;
            //axios.get("ProductoImagen/consulta?page=" +page+"&consulta_data="+this.input_consulta_data)
            axios.get(`/ProductoImagen/consulta_por/${this.input_producto_ids}/?page=${page}&consulta_data=${this.input_consulta_data}`)
                .then(response => {
                    this.consulta_datos = response.data;
                    const parsed = JSON.stringify(response.data);
                    localStorage.setItem("ProductoImagen", parsed);
                });
        },
        data_foraneo() {
            axios.get(`/ProductoImagen/create`).then(response => {
                this.productos_all = response.data;
                this.data_foraneo_producto_id = response.data.producto_id

            });
        },
        eliminar_registro(data_id) {
            alert(data_id)
            this.input_ProductoImagen_id = data_id;

        },
        eliminar_registro_delete() {
            var data_id = this.input_ProductoImagen_id;
            axios.delete(`/ProductoImagen/${this.input_ProductoImagen_id}`).then(response => {
                const data = response.data;
                if (response.data.id) {
                    this.validacion = "";
                    this.$toastr.info("Operacio exitosa", "Datos Eliminados");
                    this.consulta(this.page);
                }
            });

        },
        anadir_registro() {
            this.validacion = "";
            this.formulario_ProductoImagen = true;
            this.editar_dato_imag = false;
            this.limpiar_form();
            this.input_orden=2;
            this.mensaje_formulario = "Añadir un nuevo registro"
        },
        formulario() {

            const data = {
                id: this.input_ProductoImagen_id,
                id: this.input_id,
                nombre: this.input_nombre,
                orden: this.input_orden,
                producto_id: this.input_producto_ids,
                subido_por: this.input_subido_por,

                //name: this.input_name,
                //email: this.input_email
            };
                const formData = new FormData();
                formData.append("id", this.input_id);
                formData.append("id", this.input_ProductoImagen_id);
                formData.append("nombre", this.input_nombre);
                formData.append("orden", this.input_orden);
                formData.append("producto_id", this.input_producto_ids);
                formData.append("myFiles", this.myFiles);
                formData.append("input_archivo", this.input_archivo);
                formData.append("color_p", this.input_color_p.hex);
                formData.append("color_s", this.input_color_s.hex);




            if (this.editar_dato_imag == true) {
                //axios.put(`/ProductoImagen/${this.input_ProductoImagen_id}`, data)
                //alert('editar');
                axios.post(`/ProductoImagen_put/${this.input_ProductoImagen_id}`, formData,{ headers:{'Content-Type':'multipart/form-data'}})

                    .then(response => {

                            const datos = response.data;
                            if (response.data.errors) {
                                this.$toastr.warning("Verifique los datos", "Verifique los datos");
                                this.validacion = response.data.errors;
                            }
                            if (response.data.id) {
                                this.validacion = "";
                                this.$toastr.success("Operacio exitosa", "Datos modificados");
                                this.consulta(this.page);
                                this.formulario_ProductoImagen = false;

                            }
                        },
                        (err) => {
                            console.log("Err", err);
                            this.$toastr.warning(err, "Error en el servidor");
                            this.$toastr.warning(err.message, "Error en el servidor");
                        });

            } else {
                axios.post(`/ProductoImagen`, formData,{ headers:{'Content-Type':'multipart/form-data'} } ).then(response => {

                //axios.post(`/ProductoImagen`, data).then(response => {
                        const datos = response.data;
                        if (response.data.errors) {
                            this.$toastr.warning("Verifique los datos", "Verifique los datos");
                            this.validacion = response.data.errors;
                        }
                        if (response.data.id) {
                            this.validacion = "";
                            this.$toastr.success("Operacio exitosa", "Datos modificados");
                            this.consulta(this.page);
                            this.formulario_ProductoImagen = false;
                            this.limpiar_form();

                        }
                    },
                    (err) => {
                        console.log("Err", err);
                        this.$toastr.warning(err, "Error en el servidor");
                        this.$toastr.warning(err.message, "Error en el servidor");
                    }

                );

            }

        },
        cancelar_registro() {
            this.formulario_ProductoImagen = false;
        },
        $can(permissionName) {
            return true;
            return Permissions.indexOf(permissionName) !== -1;
        },
        editar_registro(data) { //show
            this.validacion = "";
            this.editar_dato_imag=true;
            this.formulario_ProductoImagen = true;
            this.mensaje_formulario = "Editar un registro"
            this.input_id = data.id;
            this.input_nombre = data.nombre;
            this.input_orden = data.orden;
            this.input_producto_id = data.producto_id;
            this.input_subido_por = data.subido_por;
            this.input_created_at = data.created_at;
            this.input_updated_at = data.updated_at;

            axios.get(`/ProductoImagen/${data.id}`).then(response => {
                const data = response.data;
                if (!response.data) {
                    this.$toastr.warning("Operacio no exitosa", "Regitro no obtenido");
                } else {
                    this.$toastr.success("Operacio exitosa", "Regitro obtenido");
                    this.editar_dato_imag = true;
                    this.input_ProductoImagen_id = data.id
                    this.input_id = data.id;
                    this.input_nombre = data.nombre;
                    this.input_orden = data.orden;
                    this.input_producto_id = data.producto_id;
                    this.input_subido_por = data.subido_por;
                    this.input_created_at = data.created_at;
                    this.input_updated_at = data.updated_at;
                    this.input_color_p = data.color_p;
                    this.input_color_s = data.color_s;

                    //this.input_user_id = data.id;
                    //this.input_name = data.name;
                }
            });
        },
        limpiar_form() {
            this.input_id = '';
            this.input_nombre = '';
            this.input_orden = '';
            this.input_producto_id = '';
            this.input_subido_por = '';
            this.input_created_at = '';
            this.input_updated_at = '';

            this.validacion = "";

        },

    }
};
</script>
<style>
@import '~@radial-color-picker/vue-color-picker/dist/vue-color-picker.min.css';

.fade {
    opacity: 4;
}
</style>

