<template>
<div class="row">
    <div class="col-lg-12 ">
        <div class="main-card mb-3 card formulario">
            <div class="card-body"><h1 class="card-title"></h1>
                  <h2>Formulario </h2>
                    <div class="col-md-12 row">
                      <div class=" col-md-12 col-sm-12" style="margin-bottom: 6px;">
                        <button type="submit"  @click="formulario()" class="btn btn-primary">Guardar </button>
                        <a class="btn btn-warning" @click="cancelar_registro()" >Cancelar</a>
                      </div>
                    </div>
                    <div class="col-lg-12">

      <form ref="form"   v-on:submit.prevent="formulario()">
        <div class="row">
          <div class="col-md-12 row">
            <input type="hidden" v-model="input_ProductoImagen_id">
  

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1"><b>id</b></label>
                <input type="text" v-model="input_id" placeholder="id" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.id" v-bind:key="data.id" >
                    <b>{{data}}</b>
                </div>
            </div>
                

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1"><b>nombre</b></label>
                <input type="text" v-model="input_nombre" placeholder="nombre" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.nombre" v-bind:key="data.nombre" >
                    <b>{{data}}</b>
                </div>
            </div>
                

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1"><b>orden</b></label>
                <input type="text" v-model="input_orden" placeholder="orden" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.orden" v-bind:key="data.orden" >
                    <b>{{data}}</b>
                </div>
            </div>
                
            <div class="form-group col-md-3 col-sm-12">
              <label for="exampleInputEmail1">producto_id</label>
              <Select2 v-model="input_producto_id" :options="data_foraneo_producto_id" :settings="{ settingOption: value, settingOption: value }"/>
              <small id="emailHelp" class="form-text text-muted"></small>
              <b-alert show v-for="data in validacion.producto_id" v-bind:key="data.producto_id" variant="danger">
                {{data}}
              </b-alert>

                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.producto_id" v-bind:key="data.producto_id" >
                                            <b>{{data}}</b>
                </div>
                </div>
          

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1"><b>subido_por</b></label>
                <input type="text" v-model="input_subido_por" placeholder="subido_por" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.subido_por" v-bind:key="data.subido_por" >
                    <b>{{data}}</b>
                </div>
            </div>
                

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1"><b>created_at</b></label>
                <input type="text" v-model="input_created_at" placeholder="created_at" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.created_at" v-bind:key="data.created_at" >
                    <b>{{data}}</b>
                </div>
            </div>
                

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1"><b>updated_at</b></label>
                <input type="text" v-model="input_updated_at" placeholder="updated_at" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.updated_at" v-bind:key="data.updated_at" >
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




<script type="application/javascript">
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
      formulario_ProductoImagen:false,
      validacion: [],
      editar_dato: false,
      data: [],
      datas: [],
      input_consulta_data:"",
      stickyHeader: true,
      noCollapse: false,



      input_ProductoImagen_id:[],
      data_foraneo_producto_id:[],
      input_id:[],
      input_nombre:[],
      input_orden:[],
      input_producto_id:[],
      input_subido_por:[],
      input_created_at:[],
      input_updated_at:[],
      
      consulta_datos:[],
      errors: {},
      mensaje_formulario: "",
      page:1,

    };
  },
  mounted() {
    //this.consulta();
    //this.data_foraneo();
    if(this.$route.params.id>0){
        this.show_registro(this.$route.params.id);
    }else{
        this.anadir_registro()
    }
  },
  methods: {



    anadir_registro(){
      this.validacion="";
      this.formulario_ProductoImagen=true;
      this.editar_dato = false;
      this.limpiar_form();
      this.mensaje_formulario="Añadir un nuevo registro"
    },
    formulario(){

      const data = {
        id: this.input_ProductoImagen_id,
        id :this.input_id,
        nombre :this.input_nombre,
        orden :this.input_orden,
        producto_id :this.input_producto_id,
        subido_por :this.input_subido_por,
        created_at :this.input_created_at,
        updated_at :this.input_updated_at,
        
        //name: this.input_name,
        //email: this.input_email
      };

      if(this.editar_dato == true){
        axios.put(`/ProductoImagen/${this.input_ProductoImagen_id}`, data)
        .then(response => {

            const datos = response.data;
            if(response.data.errors){
              this.$toastr.warning("Verifique los datos", "Verifique los datos");
              this.validacion=response.data.errors;
            }
            if(response.data.id){
              this.validacion="";
              this.$toastr.success("Operacio exitosa", "Datos modificados");
              //this.consulta(this.page);
              this.formulario_ProductoImagen=false;
              window.history.back();



            }
        },
        (err) => {
          console.log("Err", err);
            this.$toastr.warning(err, "Error en el servidor");
            this.$toastr.warning(err.message, "Error en el servidor");
        });

      }else{

        axios.post(`/ProductoImagen`, data).then(response => {
            const datos = response.data;
            if(response.data.errors){
              this.$toastr.warning("Verifique los datos", "Verifique los datos");
              this.validacion=response.data.errors;
            }
            if(response.data.id){
              this.validacion="";
              this.$toastr.success("Operacio exitosa", "Datos modificados");
              //this.consulta(this.page);
              this.formulario_ProductoImagen=false;
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
    cancelar_registro(){
      //this.formulario_ProductoImagen=false;
      window.history.back();
    },
    $can(permissionName) {
        return Permissions.indexOf(permissionName) !== -1;
    },
    show_registro(data_id){//show_registro
      this.validacion="";
      this.formulario_ProductoImagen=true;
      this.mensaje_formulario="Editar un registro"


      axios.get(`/ProductoImagen/${data_id}`).then(response => {
            const data = response.data;
            if(!response.data){
              this.$toastr.warning("Operacio no exitosa", "Regitro no obtenido");
            }else{
              this.$toastr.success("Operacio exitosa", "Regitro obtenido");
              this.editar_dato = true;
              this.input_ProductoImagen_id = data.id
              this.input_id = data.id;
              this.input_nombre = data.nombre;
              this.input_orden = data.orden;
              this.input_producto_id = data.producto_id;
              this.input_subido_por = data.subido_por;
              this.input_created_at = data.created_at;
              this.input_updated_at = data.updated_at;
              

            }
        });
    },
    limpiar_form(){
      this.input_id = '';
      this.input_nombre = '';
      this.input_orden = '';
      this.input_producto_id = '';
      this.input_subido_por = '';
      this.input_created_at = '';
      this.input_updated_at = '';
      
      this.validacion="";

    },

  }
};


</script>



