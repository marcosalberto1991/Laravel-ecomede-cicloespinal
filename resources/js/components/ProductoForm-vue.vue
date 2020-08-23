<template>
<div class="row">
    <div class="col-lg-12 ">
        <div class="main-card mb-3 card formulario">
            <div class="card-body">
                <h1 class="card-title"></h1>
                <h2>Formulario </h2>
                <div class="col-md-12 row">
                    <div class="col-md-12 col-sm-12" style="margin-bottom: 6px;">
                        <b-button @click="formulario()" variant="success">Guardar</b-button>
                        <a class="btn btn-warning" v-on:click="cancelar_registro()">Cancelar</a>
                    </div>
                </div>
                <div class="col-lg-12">

                    <form ref="form" v-on:submit.prevent="formulario()">
                        <div class="row">
                            <div class="col-md-12 row">
                                <input type="hidden" v-model="input_Producto_id">

                                <div class="form-group col-md-2 col-sm-12">
                                    <label for="exampleInputEmail1"><b>codigo</b></label>
                                    <input type="text" v-model="input_codigo" placeholder="codigo" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <div class="invalid-feedback" style="display:block" v-for="data in validacion.codigo" v-bind:key="data.codigo">
                                        <b>{{data}}</b>
                                    </div>
                                </div>

                                <div class="form-group col-md-4 col-sm-12">
                                    <label for="exampleInputEmail1"><b>nombre</b></label>
                                    <b-form-textarea v-model="input_nombre" placeholder="Enter something..." rows="1" max-rows="6"></b-form-textarea>
                                    <div class="invalid-feedback" style="display:block" v-for="data in validacion.nombre" v-bind:key="data.nombre">
                                        <b>{{data}}</b>
                                    </div>
                                </div>

                                <div class="form-group col-md-2 col-sm-12">
                                    <label for="exampleInputEmail1"><b>Precio</b></label>
                                     <money v-model="input_precio" v-bind="money" class="form-control" ></money>
                                    <div class="invalid-feedback" style="display:block" v-for="data in validacion.precio" v-bind:key="data.precio">
                                        <b>{{data}}</b>
                                    </div>
                                </div>

                                <div class="form-group col-md-1 col-sm-12">
                                    <label for="exampleInputEmail1"><b>Descuento</b></label>
                                    <input type="text" v-model="input_descuento" placeholder="descuento" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <div class="invalid-feedback" style="display:block" v-for="data in validacion.descuento" v-bind:key="data.descuento">
                                        <b>{{data}}</b>
                                    </div>
                                </div>

                                <div class="form-group col-md-1 col-sm-12">
                                    <label for="exampleInputEmail1"><b>Stock</b></label>
                                    <input type="text" v-model="input_stock" placeholder="stock" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <div class="invalid-feedback" style="display:block" v-for="data in validacion.stock" v-bind:key="data.stock">
                                        <b>{{data}}</b>
                                    </div>
                                </div>
                                <div class="form-group col-md-2 col-sm-12">
                                    <label for="exampleInputEmail1">Estado</label>
                                    <Select2 v-model="input_estado_id" :options="data_foraneo_estado_id" :settings="{  }" />
                                    <small id="emailHelp" class="form-text text-muted"></small>
                                    <b-alert show v-for="data in validacion.estado_id" v-bind:key="data.estado_id" variant="danger">
                                        {{data}}
                                    </b-alert>

                                    <div class="invalid-feedback" style="display:block" v-for="data in validacion.estado_id" v-bind:key="data.estado_id">
                                        <b>{{data}}</b>
                                    </div>
                                </div>

                                <div class="form-group col-md-2 col-sm-12">
                                    <label for="exampleInputEmail1"><b>Tiene IVA</b></label>
                                    <b-form-checkbox-group stacked id="checkbox-group-2" v-model="input_is_iva" name="flavour-2">
                                        <b-form-checkbox value="1">Si</b-form-checkbox>
                                        <b-form-checkbox value="0">No</b-form-checkbox>
                                    </b-form-checkbox-group>

                                    <div class="invalid-feedback" style="display:block" v-for="data in validacion.is_iva" v-bind:key="data.is_iva">
                                        <b>{{data}}</b>
                                    </div>
                                </div>
                                <div class="form-group col-md-2 col-sm-12">
                                    <label for="exampleInputEmail1"><b>Sección ofecta</b></label>
                                    <b-form-checkbox-group stacked id="checkbox-group-2" v-model="input_is_ofecta" name="flavour-2">
                                        <b-form-checkbox value="1">Si</b-form-checkbox>
                                        <b-form-checkbox value="0">No</b-form-checkbox>
                                    </b-form-checkbox-group>

                                    <div class="invalid-feedback" style="display:block" v-for="data in validacion.is_ofecta" v-bind:key="data.is_ofecta">
                                        <b>{{data}}</b>
                                    </div>
                                </div>

                                <div class="form-group col-md-1 col-sm-12">
                                    <label for="exampleInputEmail1"><b>IVA</b></label>
                                    <input type="text" v-model="input_iva" placeholder="iva" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <div class="invalid-feedback" style="display:block" v-for="data in validacion.iva" v-bind:key="data.iva">
                                        <b>{{data}}</b>
                                    </div>
                                </div>

                                <!--
                                <div class="form-group col-md-2 col-sm-12">
                                    <label for="exampleInputEmail1"><b>is_nuevo</b></label>
                                    <input type="text" v-model="input_is_nuevo" placeholder="is_nuevo" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <div class="invalid-feedback" style="display:block" v-for="data in validacion.is_nuevo" v-bind:key="data.is_nuevo">
                                        <b>{{data}}</b>
                                    </div>
                                </div>
                                -->
                                <div class="form-group col-md-2 col-sm-12">
                                    <label for="exampleInputEmail1"><b>Es Nuevo</b></label>
                                    <b-form-checkbox-group stacked id="checkbox-group-2" v-model="input_is_nuevo" name="flavour-2">
                                        <b-form-checkbox value="1">Si</b-form-checkbox>
                                        <b-form-checkbox value="0">No</b-form-checkbox>
                                    </b-form-checkbox-group>

                                    <div class="invalid-feedback" style="display:block" v-for="data in validacion.is_iva" v-bind:key="data.is_iva">
                                        <b>{{data}}</b>
                                    </div>
                                </div>

                                <div class="form-group col-md-3 col-sm-12">
                                    <label for="exampleInputEmail1">Categoria</label>
                                    <Select2 v-model="input_categoria_id" :options="data_foraneo_categoria_id" :settings="{ multiple: true }" />
                                    <small id="emailHelp" class="form-text text-muted"></small>
                                    <div class="invalid-feedback" style="display:block" v-for="data in validacion.categoria_id" v-bind:key="data.categoria_id"> <b>{{data}}</b>
                                    </div>
                                </div>

                                <div class="form-group col-md-3 col-sm-12">
                                    <label for="exampleInputEmail1">Marca</label>
                                    <Select2 v-model="input_marca_id" :options="data_foraneo_marca_id" :settings="{ multiple: true }" />
                                    <small id="emailHelp" class="form-text text-muted"></small>
                                    <div class="invalid-feedback" style="display:block" v-for="data in validacion.marca_id" v-bind:key="data.marca_id"> <b>{{data}}</b>
                                    </div>
                                </div>
                                <div class="form-group col-md-3 col-sm-12">
                                    <label for="exampleInputEmail1">Talla</label>
                                    <b-form-tags input-id="tags-basic" separator=" ,;" v-model="input_tallas" class="mb-2"></b-form-tags>
                                    <small id="emailHelp" class="form-text text-muted"></small>
                                    <div class="invalid-feedback" style="display:block" v-for="data in validacion.tallas" v-bind:key="data.tallas"> <b>{{data}}</b>
                                    </div>
                                </div>

                                    

                                <div class="form-group col-md-12 col-sm-12" v-if="editar_dato==false">
                                    <label for="exampleInputEmail1"><b>Subir el archivo de la imagen </b></label>
                                <b-form-file v-model="input_archivo" browse-text='Archivo' class="color-back" id="file-default">Archivo</b-form-file>
                                </div>
                                <div class="form-group col-md-12 col-sm-12">
                                    <label for="exampleInputEmail1"><b>Descripcion</b></label>
                                    <!--
                                        <ckeditor :editor="editor" v-model="input_descripcion" :config="editorConfig"></ckeditor>
    -->
                                    <ckeditor v-model="input_descripcion"></ckeditor>

                                    <div class="invalid-feedback" style="display:block" v-for="data in validacion.descripcion" v-bind:key="data.descripcion">
                                        <b>{{data}}</b>
                                    </div>
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
    <div class="col-lg-12 " v-if="editar_dato==true">

        <vue-productoimagen :input_producto_ids=$route.params.id></vue-productoimagen>
    </div>
</div>
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

//import ClassicEditor from '@ckeditor/ckeditor5-build-classic';

//import CKEditor from '@ckeditor/ckeditor5-vue';
import CKEditor from 'ckeditor4-vue';
Vue.use(CKEditor);
  import {Money} from 'v-money'

//Vue.use( CKEditor );

export default {
    components: {

        VueToastr2,
        Select2,Money

    },
    data() {

        return {
            //editor: ClassicEditor,
            editorConfig: {
                // The configuration of the editor.
            },
            formulario_Producto: false,
            validacion: [],
            editar_dato: false,
            data: [],
            datas: [],
            input_consulta_data: "",
            stickyHeader: true,
            noCollapse: false,

            input_Producto_id: [],
            data_foraneo_users_id: [],

            input_id: [],
            input_users_id: [],
            input_codigo: [],
            input_nombre: [],
            input_nombre_slud: [],
            input_precio: [],
            input_descuento: [],
            input_stock: [],
            input_descripcion: [],
            input_estado_id: [],
            input_created_at: [],
            input_updated_at: [],
            input_is_iva: [],
            input_iva: [],
            input_is_ofecta:[],
            input_tallas:[],
            input_is_nuevo: [],
            input_archivo:[],
            consulta_datos: [],
            errors: {},
            mensaje_formulario: "",
            page: 1,
            data_foraneo_marca_id: [],
            data_foraneo_categoria_id: [],
            data_foraneo_estado_id: [],
            input_categoria_id: {},
            input_marca_id: {},
            money: {
                decimal: ',',
                thousands: '.',
                prefix: '$ ',
                suffix: '',
                precision: 0,
                masked: false
            }

        };
    },
    mounted() {
        //this.consulta();

        if (this.$route.params.id > 0) {
            this.show_registro(this.$route.params.id);
        } else {
            this.anadir_registro()
        }
        this.data_foraneo();
    },
    methods: {

        data_foraneo() {
            axios.get("/Productos/data_foraneo").then(response => {
                this.data_foraneo_categoria_id = response.data.categoria_id
                this.data_foraneo_estado_id = response.data.estado_id
                this.data_foraneo_marca_id = response.data.marca_id
                //this.data_foraneo_nivel_cuenta_dos_id= response.data.nivel_cuenta_dos_id
                //this.data_foraneo_nivel_cuenta_tres_id= response.data.nivel_cuenta_tres_id

            });
        },
        anadir_registro() {
            this.validacion = "";
            this.formulario_Producto = true;
            this.editar_dato = false;
            this.limpiar_form();
            this.mensaje_formulario = "Añadir un nuevo registro"
        },

        formulario() {

            const data = {
                id: this.input_Producto_id,
                id: this.input_id,
                users_id: this.input_users_id,
                codigo: this.input_codigo,
                nombre: this.input_nombre,
                nombre_slud: this.input_nombre_slud,
                precio: this.input_precio,
                descuento: this.input_descuento,
                stock: this.input_stock,
                descripcion: this.input_descripcion,
                estado_id: this.input_estado_id,
                created_at: this.input_created_at,
                updated_at: this.input_updated_at,
                is_iva: this.input_is_iva,
                iva: this.input_iva,
                is_nuevo: this.input_is_nuevo,
                categoria_id: this.input_categoria_id,
                marca_id: this.input_marca_id,
                is_ofecta: this.input_is_ofecta,
                tallas: this.input_tallas,
            
                //name: this.input_name,
                //email: this.input_email
            };

            if (this.editar_dato == true) {
                axios.put(`/Producto/${this.input_Producto_id}`, data)
                    .then(response => {

                            const datos = response.data;
                            if (response.data.errors) {
                                this.$toastr.warning("Verifique los datos", "Verifique los datos");
                                this.validacion = response.data.errors;
                            }
                            if (response.data.id) {
                                this.validacion = "";
                                this.$toastr.success("Operacio exitosa", "Datos modificados");
                                //this.consulta(this.page);
                                this.formulario_Producto = false;
                                window.history.back();

                            }
                        },
                        (err) => {
                            console.log("Err", err);
                            this.$toastr.warning(err, "Error en el servidor");
                            this.$toastr.warning(err.message, "Error en el servidor");
                        });

            } else {

                axios.post(`/Producto`, data).then(response => {
                        const datos = response.data;
                        if (response.data.errors) {
                            this.$toastr.warning("Verifique los datos", "Verifique los datos");
                            this.validacion = response.data.errors;
                        }
                        if (response.data.id) {
                            this.validacion = "";
                            this.$toastr.success("Operacio exitosa", "Datos modificados");
                            //this.consulta(this.page);
                            this.formulario_Producto = false;


                             const formData = new FormData();
               
                        formData.append("orden", 1);
                        formData.append("producto_id", response.data.id);
                        formData.append("input_archivo", this.input_archivo);

                        //()
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

                                    }
                                },
                                (err) => {
                                    console.log("Err", err);
                                    this.$toastr.warning(err, "Error en el servidor");
                                    this.$toastr.warning(err.message, "Error en el servidor");
                                }

                            );

/////////////////////////
                            this.limpiar_form();
                            window.history.back();

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
            //this.formulario_Producto=false;
            window.history.back();
        },
        $can(permissionName) {
            
            return Permissions.indexOf(permissionName) !== -1;
        },
        show_registro(data_id) { //show_registro
            this.validacion = "";
            this.formulario_Producto = true;
            this.mensaje_formulario = "Editar un registro"

            axios.get(`/Producto/${data_id}`).then(response => {
                const data = response.data;
                if (!response.data) {
                    this.$toastr.warning("Operacio no exitosa", "Regitro no obtenido");
                } else {
                    this.$toastr.success("Operacio exitosa", "Regitro obtenido");
                    this.editar_dato = true;
                    this.input_Producto_id = data.id
                    this.input_id = data.id;
                    this.input_users_id = data.users_id;
                    this.input_codigo = data.codigo;
                    this.input_nombre = data.nombre;
                    this.input_nombre_slud = data.nombre_slud;
                    this.input_precio = data.precio;
                    this.input_descuento = data.descuento;
                    this.input_stock = data.stock;
                    this.input_descripcion = data.descripcion;
                    this.input_estado_id = data.estado_id;
                    this.input_created_at = data.created_at;
                    this.input_updated_at = data.updated_at;
                    this.input_is_iva = data.is_iva;
                    this.input_iva = data.iva;
                    this.input_is_nuevo = data.is_nuevo;
                    this.input_categoria_id = data.categoria_id;
                    this.input_marca_id = data.marca_id;
                    this.input_tallas = data.tallas;
                    this.input_is_ofecta = data.is_ofecta;

                }
            });
        },
        limpiar_form() {
            this.input_id = '';
            this.input_users_id = '';
            this.input_codigo = '';
            this.input_nombre = '';
            this.input_nombre_slud = '';
            this.input_precio = 0;
            this.input_descuento = 0;
            this.input_stock = 0;
            this.input_descripcion = '';
            this.input_estado_id = '';
            this.input_is_iva = '';
            this.input_iva = '';
            this.input_is_nuevo = '';
            this.input_tallas = [];
            this.input_is_ofecta = '';

            this.validacion = "";

        },

    }
};
</script>
