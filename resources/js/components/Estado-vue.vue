<template>
<div class="container-fluid">

    <div class="row">
    <div v-if="formulario_Estado" class="col-lg-12 ">
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
            <input type="hidden" v-model="input_Estado_id">


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1"><b>id</b></label>
                <input type="text" v-model="input_id" placeholder="id" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                <b-alert show v-for="data in validacion.id" v-bind:key="data.id" variant="danger">
                {{data}}
              </b-alert>
              <!--
                <b-alert show  v-if="validacion.id" variant="danger" >{{validacion.id[0]}}</b-alert>
                -->
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1"><b>nombre</b></label>
                <input type="text" v-model="input_nombre" placeholder="nombre" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                <b-alert show v-for="data in validacion.nombre" v-bind:key="data.nombre" variant="danger">
                {{data}}
              </b-alert>
              <!--
                <b-alert show  v-if="validacion.nombre" variant="danger" >{{validacion.nombre[0]}}</b-alert>
                -->
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1"><b>class</b></label>
                <input type="text" v-model="input_class" placeholder="class" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                <b-alert show v-for="data in validacion.class" v-bind:key="data.class" variant="danger">
                {{data}}
              </b-alert>
              <!--
                <b-alert show  v-if="validacion.class" variant="danger" >{{validacion.class[0]}}</b-alert>
                -->
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1"><b>nota</b></label>
                <input type="text" v-model="input_nota" placeholder="nota" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                <b-alert show v-for="data in validacion.nota" v-bind:key="data.nota" variant="danger">
                {{data}}
              </b-alert>
              <!--
                <b-alert show  v-if="validacion.nota" variant="danger" >{{validacion.nota[0]}}</b-alert>
                -->
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
  <div class='card-body'><h1 class=''>Lista de Estado </h1>

    <nav>
      <pagination :data='consulta_datos' @pagination-change-page='consulta'></pagination>
    </nav>

    <div class='col-12'>
      <b-button v-if="$can('Estado Anadir')"  @click='anadir_registro()' type='button' class='btn btn-wangir btn-lg' data-toggle='button' size='sm' aria-pressed='false' variant='success' style='margin-bottom: 5px; margin: 5px;'>Añadir registro
      </b-button>
      <div class='flexbox  float-right' >
        <form ref='form'    v-on:submit.prevent='consulta()'>
          <b-input-group size='sm' class='float-right  margin-bottom-0' prepend=''  style='margin-bottom: 0px;'>
            <b-form-input type='text' v-model='input_consulta_data' ></b-form-input>
            <b-input-group-append>
              <b-button @click='consulta()' size='sm' text='Button' variant='success'>Buscar</b-button>
            </b-input-group-append>
          </b-input-group>
        </form>
      </div><br><br>
    </div>

      <b-table :items='consulta_datos.data' :fields='fields'
      responsive='sm' :sticky-header='stickyHeader' :no-border-collapse='noCollapse'>
      <template v-slot:cell(Acciones)='data'>

          <b-button-group>
            <b-button v-if="$can('Estado Editar')"  v-b-modal.moda-registro size='sm' variant='warning' @click='editar_registro(data.item)' type='button' class='btn-sm btn btn-wangir mr-1' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Editar
            </b-button>
            <b-button v-if="$can('Estado Eliminar')"  v-b-modal.moda-eliminar @click='eliminar_registro(data.item.id)'
                type='button' class='btn-sm btn btn-danger mr-1' size='sm' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Eliminar
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




<b-modal id="moda-eliminar"  size="xl" hide-footer >
  <template slot="modal-title">Eliminar un Registro </template>
  <div class="d-block text-center">
    <h3>¿Desea eliminar el registro permanente?</h3>
    <b-button class="mt-3 btn btn-danger " @click="eliminar_registro_delete()">Eliminar</b-button>
  </div>
</b-modal>


</div>
</div>
</template>




<script type="application/javascript">
import Vue from "vue";

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
    
    VueToastr2,
    Select2
  },
  data() {

    return {
      formulario_Estado:false,
      validacion: [],
      editar_dato: false,
      data: [],
      datas: [],
      input_consulta_data:"",
      stickyHeader: true,
      noCollapse: false,
      fields: [
      { key: "Acciones",stickyColumn: true, label:"Acciones" ,sortable: false },
      { key: 'id', sortable:true},
      { key: 'nombre', sortable:true},
      { key: 'class', sortable:true},
      { key: 'nota', sortable:true},

      ],


      input_Estado_id:[],

      input_id:[],
      input_nombre:[],
      input_class:[],
      input_nota:[],

      consulta_datos:[],
      errors: {},
      mensaje_formulario: "",
      page:1,

    };
  },
  mounted() {
    this.consulta();
    this.data_foraneo();
  },
  methods: {

    consulta(page = 1){
      if (localStorage.getItem("Estado")) {
        try { this.items = JSON.parse(localStorage.getItem("Estado"));
        } catch (e) { localStorage.removeItem("Estado");}
      }

      this.page=page;
      //axios.get("Estado/consulta?page=" +page+"&consulta_data="+this.input_consulta_data)
      axios.get(`Estado/consulta?page=${page}&consulta_data=${this.input_consulta_data}`)
      .then(response => {
        this.consulta_datos = response.data;
        const parsed = JSON.stringify(response.data);
        localStorage.setItem("Estado", parsed);
      });
    },
    data_foraneo(){
      axios.get(`Estado/create`).then(response => {
        this.productos_all = response.data;

      });
    },
    eliminar_registro(data_id){
    this.input_Estado_id=data_id;
    },
    eliminar_registro_delete(){
      var data_id=this.input_Estado_id;
      axios.delete(`Estado/${this.input_Estado_id}`).then(response => {
        const data = response.data;
        if(response.data.id){
          this.validacion="";
          this.$toastr.info("Operacio exitosa", "Datos Eliminados");
          this.consulta(this.page);
        }
      });

    },
    anadir_registro(){
      this.validacion="";
      this.formulario_Estado=true;
      this.editar_dato = false;
      this.limpiar_form();
      this.mensaje_formulario="Añadir un nuevo registro"
    },
    formulario(){

      const data = {
        id: this.input_Estado_id,
        id :this.input_id,
        nombre :this.input_nombre,
        class :this.input_class,
        nota :this.input_nota,

        //name: this.input_name,
        //email: this.input_email
      };

      if(this.editar_dato == true){
        axios.put(`Estado/${this.input_Estado_id}`, data)
        .then(response => {

            const datos = response.data;
            if(response.data.errors){
              this.$toastr.warning("Verifique los datos", "Verifique los datos");
              this.validacion=response.data.errors;
            }
            if(response.data.id){
              this.validacion="";
              this.$toastr.success("Operacio exitosa", "Datos modificados");
              this.consulta(this.page);
              this.formulario_Estado=false;


            }
        },
        (err) => {
          console.log("Err", err);
            this.$toastr.warning(err, "Error en el servidor");
            this.$toastr.warning(err.message, "Error en el servidor");
        });

      }else{

        axios.post(`Estado`, data).then(response => {
            const datos = response.data;
            if(response.data.errors){
              this.$toastr.warning("Verifique los datos", "Verifique los datos");
              this.validacion=response.data.errors;
            }
            if(response.data.id){
              this.validacion="";
              this.$toastr.success("Operacio exitosa", "Datos modificados");
              this.consulta(this.page);
              this.formulario_Estado=false;
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
    cancelar_registro(){
      this.formulario_Estado=false;
    },
    $can(permissionName) {
      return Permissions.indexOf(permissionName) !== -1;
    },
    editar_registro(data){//show
      this.validacion="";
      this.formulario_Estado=true;
      this.mensaje_formulario="Editar un registro"
      this.input_id = data.id;
              this.input_nombre = data.nombre;
              this.input_class = data.class;
              this.input_nota = data.nota;


      axios.get(`Estado/${data.id}`).then(response => {
            const data = response.data;
            if(!response.data){
              this.$toastr.warning("Operacio no exitosa", "Regitro no obtenido");
            }else{
              this.$toastr.success("Operacio exitosa", "Regitro obtenido");
              this.editar_dato = true;
              this.input_Estado_id = data.id
              this.input_id = data.id;
              this.input_nombre = data.nombre;
              this.input_class = data.class;
              this.input_nota = data.nota;

              //this.input_user_id = data.id;
              //this.input_name = data.name;
            }
        });
    },
    limpiar_form(){
      this.input_id = '';
      this.input_nombre = '';
      this.input_class = '';
      this.input_nota = '';

      this.validacion="";

    },

  }
};


</script>