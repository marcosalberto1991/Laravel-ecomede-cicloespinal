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
            <input type="hidden" v-model="input_Marcav2_id">   
  



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
      formulario_Marcav2:false,
      validacion: [],
      editar_dato: false,
      data: [],
      datas: [],
      input_consulta_data:"",
      stickyHeader: true,
      noCollapse: false,
  


      input_Marcav2_id:[],
      
      input_id:[],
      input_nombre:[],
      input_logo:[],
      
      consulta_datos:[],
      errors: {},
      mensaje_formulario: "",
      page:1,
      
    };
  },
  mounted() {
    //this.consulta();
    //this.data_foraneo();
  },
  methods: {
    
    
    
    anadir_registro(){
      this.validacion="";
      this.formulario_Marcav2=true;
      this.editar_dato = false;
      this.limpiar_form();
      this.mensaje_formulario="Añadir un nuevo registro"
    },
    formulario(){

      const data = {
        id: this.input_Marcav2_id,
        id :this.input_id,
        nombre :this.input_nombre,
        logo :this.input_logo,
        
        //name: this.input_name,
        //email: this.input_email
      };
      
      if(this.editar_dato == true){
        axios.put(`Marcav2/${this.input_Marcav2_id}`, data)
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
              this.formulario_Marcav2=false;
              window.history.back();



            }
        },
        (err) => {
          console.log("Err", err);
            this.$toastr.warning(err, "Error en el servidor");
            this.$toastr.warning(err.message, "Error en el servidor");
        });

      }else{
        
        axios.post(`Marcav2`, data).then(response => {
            const datos = response.data;
            if(response.data.errors){
              this.$toastr.warning("Verifique los datos", "Verifique los datos");
              this.validacion=response.data.errors;
            }
            if(response.data.id){
              this.validacion="";
              this.$toastr.success("Operacio exitosa", "Datos modificados");
              //this.consulta(this.page);
              this.formulario_Marcav2=false;
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
      //this.formulario_Marcav2=false;
      window.history.back();
    },
    $can(permissionName) {
        
        return Permissions.indexOf(permissionName) !== -1;
    },
    show_registro(data){//show_registro 
      this.validacion="";
      this.formulario_Marcav2=true;  
      this.mensaje_formulario="Editar un registro"
      this.input_id = data.id;
              this.input_nombre = data.nombre;
              this.input_logo = data.logo;
                
      
      axios.get(`Marcav2/${data.id}`).then(response => {
            const data = response.data;
            if(!response.data){
              this.$toastr.warning("Operacio no exitosa", "Regitro no obtenido");
            }else{
              this.$toastr.success("Operacio exitosa", "Regitro obtenido");
              this.editar_dato = true;
              this.input_Marcav2_id = data.id
              this.input_id = data.id;
              this.input_nombre = data.nombre;
              this.input_logo = data.logo;
              
              
            }
        });
    },
    limpiar_form(){
      this.input_id = '';
      this.input_nombre = '';
      this.input_logo = '';
      
      this.validacion="";

    },
   
  }
};


</script>



