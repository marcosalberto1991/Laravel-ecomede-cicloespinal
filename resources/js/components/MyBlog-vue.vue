

  <template>

<div class="container-fluid" style="padding-right: 0px;padding-left: 0px;s">
			    <div class="row">
					<div class="col-md-12">
				       <img  src="/img/cabecera-categoria-blog-01.png" width="100%" height="140px" alt="" srcset="">
					</div>
			    </div>
    <div class='row'>
  <div class='col-lg-12'>
  <div class='main-card mb-3 '>
  <div class='card-body row'><h1 class=''> </h1>

    <nav>
      <pagination :data='consulta_datos' @pagination-change-page='consulta'></pagination>
    </nav>

    <div class='col-12'>
        <!--
        <b-button v-if="$can('Blog Anadir')"  @click='anadir_registro()' type='button' class='btn btn-wangir btn-lg' data-toggle='button' size='sm' aria-pressed='false' variant='success' style='margin-bottom: 5px; margin: 5px;'>Añadir registro
        </b-button>
        -->
      <router-link v-if="$can('Blog Anadir')" :to="{ name: 'blogformadd',params:{id:0} }">

        <a v-bind:href="'/Blog/create'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
              Añadir Registro
        </a>
      </router-link>
      <div class='flexbox  float-right' >
        <form ref='form'    v-on:submit.prevent='consulta()'>
          <b-input-group size='sm' class='float-right  margin-bottom-0' prepend=''  style='margin-bottom: 0px;'>
            <b-input-group-append>
            <b-form-input type='text' v-model='input_consulta_data' ></b-form-input>
            
              <b-button @click='consulta()' size='sm' text='Button' variant='success'>Buscar</b-button>
            </b-input-group-append>
          </b-input-group>
        </form>
      </div><br><br>
    </div>
    <div class='col-12'>
            <div class="offset-md-3  col-md-6 borde-topm" v-for="data in  consulta_datos.data" v-bind:key="data.id">
                <div class=" row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                    <div class="col p-4 d-flex flex-column position-static ">
                    <strong class="d-inline-block mb-1 text-danger text-right ">{{data.fecha}}</strong>
                    <strong class="d-inline-block mb-1 text-danger ">Publicado por: {{data.users_id}}</strong>
                    <h3 class="mb-0 indigo">{{data.tiulo}}</h3>
                    <div class="mb-1 text-muted"><br><br></div>
                    <p class="card-text mb-auto demo-1 text-blog" v-html="data.descricion.substring(0, 250)"></p>
                    <br><br>
                     <router-link  :to="{ name: 'MyBlogShow', params: { id: data.id }}">
                          <a v-bind:href="'/Blog/'+data.id+'/Show'" class="stretched-link color-red">
                              <b>Continua Leyendo</b>
                          </a>
                      </router-link>
                    </div>
                    <div class="col-auto d-none d-lg-block">
                      <img v-if="data.productoimagenuno" class="img-fluid img-thumbnail" :src="'/imagenes_files/'+data.productoimagenuno.nombre" alt="">
				              <img class="img-fluid img-thumbnail" v-else src="/imagenes_files/null.png" alt="">
                    </div>
                </div>
            </div>
    </div>


      <!--  
      <b-table :items='consulta_datos.data' :fields='fields'
      responsive='sm' :sticky-header='stickyHeader' :no-border-collapse='noCollapse'>
      <template v-slot:cell(Acciones)='data'>

          <b-button-group>
         
            <router-link :to="{ name: 'blogform', params: { id: data.item.id }}">
                <a v-bind:href="'/Blog/'+data.item.id+'/edit'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
                    Editar
                </a>
            </router-link>



            <b-button v-if="$can('Blog Eliminar')"  v-b-modal.moda-eliminar @click='eliminar_registro(data.item.id)'
                type='button' class='btn-sm btn btn-danger mr-1' size='sm' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Eliminar
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

</div>




<b-modal id="moda-eliminar"  size="xl" hide-footer >
  <template slot="modal-title">Eliminar un Registro </template>
  <div class="d-block text-center">
    <h3>¿Desea eliminar el registro permanente?</h3>
    <b-button class="mt-3 btn btn-danger " @click="eliminar_registro_delete()">Eliminar</b-button>
  </div>
</b-modal>


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
      formulario_Blog:false,
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
      { key: 'fecha', sortable:true},
      { key: 'tiulo', sortable:true},
      { key: 'imagen', sortable:true},
      { key: 'descricion', sortable:true},
      { key: 'users_id', sortable:true},
      { key: 'created_at', sortable:true},
      { key: 'updated_at', sortable:true},
      { key: 'categoria', sortable:true},
      { key: 'tag', sortable:true},
      
      ],


      //input_Blog_id:[],
      data_foraneo_users_id:[],

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
      if (localStorage.getItem("Blog")) {
        try { this.items = JSON.parse(localStorage.getItem("Blog"));
        } catch (e) { localStorage.removeItem("Blog");}
      }

      this.page=page;
      //axios.get("Blog/consulta?page=" +page+"&consulta_data="+this.input_consulta_data)
      axios.get(`index/Blog/consulta?page=${page}&consulta_data=${this.input_consulta_data}`)
      .then(response => {
        this.consulta_datos = response.data;
        const parsed = JSON.stringify(response.data);
        localStorage.setItem("Blog", parsed);
      });
    },

    eliminar_registro(data_id){
    this.input_Blog_id=data_id;
    },
    data_foraneo(){

    },
    eliminar_registro_delete(){
      var data_id=this.input_Blog_id;
      axios.delete(`Blog/${this.input_Blog_id}`).then(response => {
        const data = response.data;
        if(response.data.id){
          this.validacion="";
          this.$toastr.info("Operacio exitosa", "Datos Eliminados");
          this.consulta(this.page);
        }
      });

    },

    $can(permissionName) {
      

      return Permissions.indexOf(permissionName) !== -1;
    },


  }
};


</script>
<style lang="css">
.demo-1 {
  overflow: hidden;
  display: -webkit-box;
  -webkit-line-clamp: 4;
  -webkit-box-orient: vertical;
  max-height: 135px;
}
.wrapper {
  padding: 20px;
  background: #eaeaea;
  max-width: 400px;
  margin: 50px auto;
}
.color-red{
  color: #D10024;
  font-size: 16px;
}
.borde-topm{
  box-shadow: 10px 10px 10px black;
  margin-top: 30px;
}

</style>



