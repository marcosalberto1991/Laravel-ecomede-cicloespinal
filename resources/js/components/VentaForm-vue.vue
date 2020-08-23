<template>
<div class="row">
    <div class="col-lg-12 ">
        <div class="main-card mb-3 card formulario">
            <div class="card-body"><h1 class="card-title"></h1>
                  <h2>Formulario </h2>
                    <div class="col-md-12 row">
                      <div class="form-group col-md-12 col-sm-12" style="margin-bottom: 6px;">
                        <button type="submit"  @click="formulario()" class="btn btn-primary">Guardar </button>
                        <a class="btn btn-warning" @click="cancelar_registro()" >Cancelar</a>
                      </div>
                    </div>
                    <div class="col-lg-12">

      <form ref="form"   v-on:submit.prevent="formulario()">
        <div class="row">
          <div class="col-md-12 row">
            <input type="hidden" v-model="input_Venta_id">
  

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1"><b>id</b></label>
                <input type="text" v-model="input_id" placeholder="id" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.id" v-bind:key="data.id" >
                    <b>{{data}}</b>
                </div>
            </div>
                
            <div class="form-group col-md-3 col-sm-12">
              <label for="exampleInputEmail1">users_id</label>
              <Select2 v-model="input_users_id" :options="data_foraneo_users_id" :settings="{ settingOption: value, settingOption: value }"/>
              <small id="emailHelp" class="form-text text-muted"></small>
              <b-alert show v-for="data in validacion.users_id" v-bind:key="data.users_id" variant="danger">
                {{data}}
              </b-alert>

                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.users_id" v-bind:key="data.users_id" >
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
                
            <div class="form-group col-md-3 col-sm-12">
              <label for="exampleInputEmail1">estado_venta_id</label>
              <Select2 v-model="input_estado_venta_id" :options="data_foraneo_estado_venta_id" :settings="{ settingOption: value, settingOption: value }"/>
              <small id="emailHelp" class="form-text text-muted"></small>
              <b-alert show v-for="data in validacion.estado_venta_id" v-bind:key="data.estado_venta_id" variant="danger">
                {{data}}
              </b-alert>

                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.estado_venta_id" v-bind:key="data.estado_venta_id" >
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
      formulario_Venta:false,
      validacion: [],
      editar_dato: false,
      data: [],
      datas: [],
      input_consulta_data:"",
      stickyHeader: true,
      noCollapse: false,



      input_Venta_id:[],
      data_foraneo_users_id:[],data_foraneo_estado_venta_id:[],
      input_id:[],
      input_users_id:[],
      input_created_at:[],
      input_updated_at:[],
      input_estado_venta_id:[],
      
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
      this.formulario_Venta=true;
      this.editar_dato = false;
      this.limpiar_form();
      this.mensaje_formulario="Añadir un nuevo registro"
    },
    formulario(){

      const data = {
        id: this.input_Venta_id,
        id :this.input_id,
        users_id :this.input_users_id,
        created_at :this.input_created_at,
        updated_at :this.input_updated_at,
        estado_venta_id :this.input_estado_venta_id,
        
        //name: this.input_name,
        //email: this.input_email
      };

      if(this.editar_dato == true){
        axios.put(`/Venta/${this.input_Venta_id}`, data)
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
              this.formulario_Venta=false;
              window.history.back();



            }
        },
        (err) => {
          console.log("Err", err);
            this.$toastr.warning(err, "Error en el servidor");
            this.$toastr.warning(err.message, "Error en el servidor");
        });

      }else{

        axios.post(`/Venta`, data).then(response => {
            const datos = response.data;
            if(response.data.errors){
              this.$toastr.warning("Verifique los datos", "Verifique los datos");
              this.validacion=response.data.errors;
            }
            if(response.data.id){
              this.validacion="";
              this.$toastr.success("Operacio exitosa", "Datos modificados");
              //this.consulta(this.page);
              this.formulario_Venta=false;
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
      //this.formulario_Venta=false;
      window.history.back();
    },
    $can(permissionName) {
        
        return Permissions.indexOf(permissionName) !== -1;
    },
    show_registro(data_id){//show_registro
      this.validacion="";
      this.formulario_Venta=true;
      this.mensaje_formulario="Editar un registro"


      axios.get(`/Venta/${data_id}`).then(response => {
            const data = response.data;
            if(!response.data){
              this.$toastr.warning("Operacio no exitosa", "Regitro no obtenido");
            }else{
              this.$toastr.success("Operacio exitosa", "Regitro obtenido");
              this.editar_dato = true;
              this.input_Venta_id = data.id
              this.input_id = data.id;
              this.input_users_id = data.users_id;
              this.input_created_at = data.created_at;
              this.input_updated_at = data.updated_at;
              this.input_estado_venta_id = data.estado_venta_id;
              

            }
        });
    },
    limpiar_form(){
      this.input_id = '';
      this.input_users_id = '';
      this.input_created_at = '';
      this.input_updated_at = '';
      this.input_estado_venta_id = '';
      
      this.validacion="";

    },

  }
};


</script>



