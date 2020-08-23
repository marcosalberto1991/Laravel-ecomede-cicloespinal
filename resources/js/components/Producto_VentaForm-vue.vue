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
            <input type="hidden" v-model="input_Producto_Venta_id">
  

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1"><b>id</b></label>
                <input type="text" v-model="input_id" placeholder="id" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.id" v-bind:key="data.id" >
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
          
            <div class="form-group col-md-3 col-sm-12">
              <label for="exampleInputEmail1">venta_id</label>
              <Select2 v-model="input_venta_id" :options="data_foraneo_venta_id" :settings="{ settingOption: value, settingOption: value }"/>
              <small id="emailHelp" class="form-text text-muted"></small>
              <b-alert show v-for="data in validacion.venta_id" v-bind:key="data.venta_id" variant="danger">
                {{data}}
              </b-alert>

                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.venta_id" v-bind:key="data.venta_id" >
                                            <b>{{data}}</b>
                </div>
                </div>
          

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1"><b>cantidad</b></label>
                <input type="text" v-model="input_cantidad" placeholder="cantidad" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.cantidad" v-bind:key="data.cantidad" >
                    <b>{{data}}</b>
                </div>
            </div>
                

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1"><b>precio</b></label>
                <input type="text" v-model="input_precio" placeholder="precio" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.precio" v-bind:key="data.precio" >
                    <b>{{data}}</b>
                </div>
            </div>
                

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1"><b>is_iva</b></label>
                <input type="text" v-model="input_is_iva" placeholder="is_iva" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.is_iva" v-bind:key="data.is_iva" >
                    <b>{{data}}</b>
                </div>
            </div>
                

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1"><b>precio_iva</b></label>
                <input type="text" v-model="input_precio_iva" placeholder="precio_iva" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.precio_iva" v-bind:key="data.precio_iva" >
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
      formulario_Producto_Venta:false,
      validacion: [],
      editar_dato: false,
      data: [],
      datas: [],
      input_consulta_data:"",
      stickyHeader: true,
      noCollapse: false,



      input_Producto_Venta_id:[],
      data_foraneo_producto_id:[],data_foraneo_venta_id:[],
      input_id:[],
      input_producto_id:[],
      input_venta_id:[],
      input_cantidad:[],
      input_precio:[],
      input_is_iva:[],
      input_precio_iva:[],
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
      this.formulario_Producto_Venta=true;
      this.editar_dato = false;
      this.limpiar_form();
      this.mensaje_formulario="Añadir un nuevo registro"
    },
    formulario(){

      const data = {
        id: this.input_Producto_Venta_id,
        id :this.input_id,
        producto_id :this.input_producto_id,
        venta_id :this.input_venta_id,
        cantidad :this.input_cantidad,
        precio :this.input_precio,
        is_iva :this.input_is_iva,
        precio_iva :this.input_precio_iva,
        created_at :this.input_created_at,
        updated_at :this.input_updated_at,
        
        //name: this.input_name,
        //email: this.input_email
      };

      if(this.editar_dato == true){
        axios.put(`/Producto_Venta/${this.input_Producto_Venta_id}`, data)
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
              this.formulario_Producto_Venta=false;
              window.history.back();



            }
        },
        (err) => {
          console.log("Err", err);
            this.$toastr.warning(err, "Error en el servidor");
            this.$toastr.warning(err.message, "Error en el servidor");
        });

      }else{

        axios.post(`/Producto_Venta`, data).then(response => {
            const datos = response.data;
            if(response.data.errors){
              this.$toastr.warning("Verifique los datos", "Verifique los datos");
              this.validacion=response.data.errors;
            }
            if(response.data.id){
              this.validacion="";
              this.$toastr.success("Operacio exitosa", "Datos modificados");
              //this.consulta(this.page);
              this.formulario_Producto_Venta=false;
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
      //this.formulario_Producto_Venta=false;
      window.history.back();
    },
    $can(permissionName) {
        
        return Permissions.indexOf(permissionName) !== -1;
    },
    show_registro(data_id){//show_registro
      this.validacion="";
      this.formulario_Producto_Venta=true;
      this.mensaje_formulario="Editar un registro"


      axios.get(`/Producto_Venta/${data_id}`).then(response => {
            const data = response.data;
            if(!response.data){
              this.$toastr.warning("Operacio no exitosa", "Regitro no obtenido");
            }else{
              this.$toastr.success("Operacio exitosa", "Regitro obtenido");
              this.editar_dato = true;
              this.input_Producto_Venta_id = data.id
              this.input_id = data.id;
              this.input_producto_id = data.producto_id;
              this.input_venta_id = data.venta_id;
              this.input_cantidad = data.cantidad;
              this.input_precio = data.precio;
              this.input_is_iva = data.is_iva;
              this.input_precio_iva = data.precio_iva;
              this.input_created_at = data.created_at;
              this.input_updated_at = data.updated_at;
              

            }
        });
    },
    limpiar_form(){
      this.input_id = '';
      this.input_producto_id = '';
      this.input_venta_id = '';
      this.input_cantidad = '';
      this.input_precio = '';
      this.input_is_iva = '';
      this.input_precio_iva = '';
      this.input_created_at = '';
      this.input_updated_at = '';
      
      this.validacion="";

    },

  }
};


</script>



