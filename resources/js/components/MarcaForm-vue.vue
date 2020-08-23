<template>
<div class="container-fluid">

    <div class="row">
        <div class="col-lg-12 ">
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
                                    <input type="hidden" v-model="input_Marca_id">

                                    <div class="form-group col-md-4 col-sm-12">
                                        <label for="exampleInputEmail1"><b>id</b></label>
                                        <input type="text" v-model="input_id" placeholder="id" class="form-control"  v-bind:class="{ 'is-invalid': validacion.id,'is-valid': validacion }"  >
                                        <div class="invalid-feedback" style ="display:block" v-for="data in validacion.id" v-bind:key="data.id" >
                                            <b>{{data}}</b>
                                        </div>

                                      
                                       
                                    </div>

                                    <div class="form-group col-md-4 col-sm-12">
                                        <label for="exampleInputEmail1"><b>nombre</b></label>
                                        <input type="text" v-model="input_nombre" placeholder="nombre" class="form-control" v-bind:class="{ 'is-invalid': validacion.nombre,'is-valid': validacion }">
                                        <div class="invalid-feedback" style ="display:block" v-for="data in validacion.nombre" v-bind:key="data.nombre" >
                                            <b>{{data}}</b>
                                        </div>
                                       
                                    </div>

                                    <div class="form-group col-md-4 col-sm-12">
                                        <label for="exampleInputEmail1"><b>logo</b></label>
                                        <input type="text" v-model="input_logo" placeholder="logo" class="form-control" v-bind:class="{ 'is-invalid': validacion.logo,'is-valid': validacion }">
                                        <div class="invalid-feedback" style ="display:block" v-for="data in validacion.logo" v-bind:key="data.logo" >
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
    </div>
</div>



</template>

<script>
import Vue from "vue";
//import VueSingleSelect from "vue-single-select";
   
//import VueToast from "vue-toast-notification";
//import "vue-toast-notification/dist/index.css";
import Select2 from "v-select2-component";
//https://www.npmjs.com/package/vue-toastr-2
import VueToastr2 from "vue-toastr-2";
import "vue-toastr-2/dist/vue-toastr-2.min.css";
window.toastr = require("toastr");
Vue.use(VueToastr2);

export default {
    components: {
        //VueSingleSelect,
        VueToastr2,
        Select2
    },
    //props: ["input"],
    data() {

        return {
            
            
            //input:null,
            validacion: [],
            editar_dato: false,
            data: [],
            datas: [],
            
            input_consulta_data: "",
            input_id:[],
            input_nombre:[],
            input_logo:[],
            
            //consulta_datos: [],
            errors: {},
            mensaje_formulario: "",
            page: 1,

        };
    },
    mounted() {
        //alert(this.$route.params.id);
        if(this.$route.params.id>0){
            this.show_registro(this.$route.params.id);    
        }else{
            this.anadir_registro()
        }
        //this.editar();
        //this.consulta();
        //this.data_foraneo();
    },
    methods: {

        data_foraneo() {
            axios.get(`Marca/create`).then(response => {
                this.productos_all = response.data;

            });
        },

        anadir_registro() {
            this.validacion = "";
            this.editar_dato = false;
            this.limpiar_form();
            this.mensaje_formulario = "Añadir un nuevo registro"
        },
        formulario() {

            const data = {
                id: this.input_id,
                nombre: this.input_nombre,
                logo: this.input_logo
            }

            if (this.editar_dato==true) {
                axios.put(`/Marca/${this.input_id}`, data)
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

                            }
                        },
                        (err) => {
                            console.log("Err", err);
                            this.$toastr.warning(err, "Error en el servidor");
                            this.$toastr.warning(err.message, "Error en el servidor");
                        });

            } else {
               // const data = this.input
                axios.post(`/Marca`, data).then(response => {
                        const datos = response.data;
                        if (response.data.errors) {
                            this.$toastr.warning("Verifique los datos", "Verifique los datos");
                            this.validacion = response.data.errors;
                        }
                        if (response.data.id) {
                            this.validacion = "";
                            this.$toastr.success("Operacio exitosa", "Datos modificados");
                            this.consulta(this.page);
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
            window.history.back();
        },
        $can(permissionName) {
            
            return Permissions.indexOf(permissionName) !== -1;
        },
        show_registro(data_id){
              axios.get(`/Marca/${data_id}`).then(response => {
                const data = response.data;
                if (!response.data) {
                    this.$toastr.warning("Operacio no exitosa", "Regitro no obtenido");
                } else {
                    this.$toastr.success("Operacio exitosa", "Regitro obtenido");
                    this.editar_dato = true;
                    this.input_Marca_id=data.id
                    this.input_id=data.id
                    this.input_nombre=data.nombre
                    this.input_logo=data.logo
                   

                    //this.input_user_id = data.id;
                    //this.input_name = data.name;
                }
            });
        },
        limpiar_form() {
            this.input = '';
            this.input_nombre = '';
            this.input_logo = '';

            this.validacion = "";

        },

    }
};
</script>
