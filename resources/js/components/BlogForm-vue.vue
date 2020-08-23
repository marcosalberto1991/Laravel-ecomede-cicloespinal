<template>
<div class="row">
    <div class="col-lg-12 ">
        <div class="main-card mb-3 card formulario">
            <div class="card-body"><h1 class="card-title"></h1>
                  <h2>Formulario </h2>
                    <div class="col-md-12 row">
                      <div class="form-group col-md-12 col-sm-12" style="margin-bottom: 6px;">
                        <button type="submit" v-if="$can('Blog Anadir')"  @click="formulario()" class="btn btn-primary">Guardar </button>
                        <button type="submit" v-else-if="$can('Blog Editar')"  @click="formulario()" class="btn btn-primary">Guardar </button>
                        <a class="btn btn-warning" @click="cancelar_registro()" >Cancelar</a>
                      </div>
                    </div>
                    <div class="col-lg-12">

      <form ref="form"   v-on:submit.prevent="formulario()">
        <div class="row">
          <div class="col-md-12 row">
            <input type="hidden" v-model="input_Blog_id">
  
            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1"><b>Fecha</b></label>
                <b-form-datepicker id="example-datepicker" v-model="input_fecha" class="mb-2"></b-form-datepicker>
<!--
                <input type="text" v-model="input_fecha" placeholder="fecha" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
   -->             
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.fecha" v-bind:key="data.fecha" >
                    <b>{{data}}</b>
                </div>
            </div>
                

            <div class="form-group col-md-9 col-sm-12">
                <label for="exampleInputEmail1"><b>Titulo</b></label>
                <input type="text" v-model="input_tiulo" placeholder="Titulo" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.tiulo" v-bind:key="data.tiulo" >
                    <b>{{data}}</b>
                </div>
            </div>
                

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1"><b>Imagen</b></label>
                 <b-form-file  v-model="input_imagen" type="file" accept="image/jpeg, image/png" placeholder="imagen" class="form-control" ></b-form-file>
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.imagen" v-bind:key="data.imagen" >
                    <b>{{data}}</b>
                </div>
            </div>
            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1"><b>Categoria</b></label>
                <input type="text" v-model="input_categoria" placeholder="categoria" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >

                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.categoria" v-bind:key="data.categoria" >
                    <b>{{data}}</b>
                </div>
            </div>
                

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1"><b>Tag</b></label>
                <input type="text" v-model="input_tag" placeholder="tag" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.tag" v-bind:key="data.tag" >
                    <b>{{data}}</b>
                </div>
            </div>
                

            <div class="form-group col-md-12 col-sm-12">
                <label for="exampleInputEmail1"><b>Descripción o Texto</b></label>
                <ckeditor v-model="input_descricion"></ckeditor>
                
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.descricion" v-bind:key="data.descricion" >
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
import CKEditor from 'ckeditor4-vue';
Vue.use(CKEditor);
export default {
  components: {

    VueToastr2,
    Select2
  },
  data() {

    return {
      formulario_Blog:false,
      validacion: [],
      editar_dato: false,
      data: [],
      datas: [],
      input_consulta_data:"",
      stickyHeader: true,
      noCollapse: false,



      input_Blog_id:[],
      data_foraneo_users_id:[],
      input_id:[],
      input_fecha:[],
      input_tiulo:[],
      input_imagen:'',
      input_descricion:[],
      input_users_id:[],
      input_created_at:[],
      input_updated_at:[],
      input_categoria:[],
      input_tag:[],
      
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
      this.formulario_Blog=true;
      this.editar_dato = false;
      this.limpiar_form();
      this.mensaje_formulario="Añadir un nuevo registro"
    },
    formulario(){

      const data = {
        id: this.input_Blog_id,
        id :this.input_id,
        fecha :this.input_fecha,
        tiulo :this.input_tiulo,
        imagen :this.input_imagen,
        descricion :this.input_descricion,
        users_id :this.input_users_id,
        categoria :this.input_categoria,
        tag :this.input_tag,
        
        //name: this.input_name,
        //email: this.input_email
      };
      const formData = new FormData();
        formData.append("id", this.input_id);
        formData.append("fecha", this.input_fecha);
        formData.append("tiulo", this.input_tiulo);
        formData.append("imagen", this.input_imagen);
        
        formData.append("descricion", this.input_descricion);
        formData.append("categoria", this.input_categoria);
        formData.append("tag", this.input_tag);


      if(this.editar_dato == true){
        //axios.put(`/Blog/${this.input_Blog_id}`, formData)
        //axios.put(`/Blog/${this.input_Blog_id}`,formData,{ headers:{'Content-Type':'multipart/form-data'}})
        //axios.post(`/ProductoImagen`, formData,{ headers:{'Content-Type':'multipart/form-data'} } ).then(response => {
        axios.post(`/Blog/update/${this.input_Blog_id}`, formData,{ headers:{'Content-Type':'multipart/form-data'}})
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
              this.formulario_Blog=false;
              window.history.back();



            }
        },
        (err) => {
          console.log("Err", err);
            this.$toastr.warning(err, "Error en el servidor");
            this.$toastr.warning(err.message, "Error en el servidor");
        });

      }else{

        axios.post(`/Blog`, formData,{ headers:{'Content-Type':'multipart/form-data'} }).then(response => {
            const datos = response.data;
            if(response.data.errors){
              this.$toastr.warning("Verifique los datos", "Verifique los datos");
              this.validacion=response.data.errors;
            }
            if(response.data.id){
              this.validacion="";
              this.$toastr.success("Operacio exitosa", "Datos modificados");
              //this.consulta(this.page);
              this.formulario_Blog=false;
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
      //this.formulario_Blog=false;
      window.history.back();
    },
    $can(permissionName) {
        return true;
        return Permissions.indexOf(permissionName) !== -1;
    },
    show_registro(data_id){//show_registro
      this.validacion="";
      this.formulario_Blog=true;
      this.mensaje_formulario="Editar un registro"


      axios.get(`/Blog/${data_id}`).then(response => {
            const data = response.data;
            if(!response.data){
              this.$toastr.warning("Operacio no exitosa", "Regitro no obtenido");
            }else{
              this.$toastr.success("Operacio exitosa", "Regitro obtenido");
              this.editar_dato = true;
              this.input_Blog_id = data.id
              this.input_id = data.id;
              this.input_fecha = data.fecha;
              this.input_tiulo = data.tiulo;
             // this.input_imagen = data.imagen;
              this.input_descricion = data.descricion;
              this.input_users_id = data.users_id;
              this.input_created_at = data.created_at;
              this.input_updated_at = data.updated_at;
              this.input_categoria = data.categoria;
              this.input_tag = data.tag;
              

            }
        });
    },
    limpiar_form(){
      this.input_id = '';
      this.input_fecha = '';
      this.input_tiulo = '';
      this.input_imagen = '';
      this.input_descricion = '';
      this.input_users_id = '';
      this.input_created_at = '';
      this.input_updated_at = '';
      this.input_categoria = '';
      this.input_tag = '';
      
      this.validacion="";

    },

  }
};


</script>



