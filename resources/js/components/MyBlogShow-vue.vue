

  <template>

  <div class='container-fluid'>

    <div class='row'>
  <div class='col-lg-12'>
  <div class='main-card mb-3 '>
  <div class='card-body row'><h1 class=''> </h1>

    <div class='col-12'>
        <!--
        <b-button v-if="$can('Blog Anadir')"  @click='anadir_registro()' type='button' class='btn btn-wangir btn-lg' data-toggle='button' size='sm' aria-pressed='false' variant='success' style='margin-bottom: 5px; margin: 5px;'>Añadir registro
        </b-button>
        -->
      <router-link v-if="$can('Blog Anadir')" :to="{ name: 'blogformadd',params:{id:0} }">

        <a v-bind:href="'/Blog/create'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
              Crear Blog
        </a>
      </router-link>
      
     
    </div>
    <div class='col-12'>
             <div class="offset-md-3  col-md-6 borde-topm" v-for="data in  consulta_datos" v-bind:key="data.id">
                
                <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                
                    <div class="col p-4 d-flex flex-column position-static ">
                         <router-link :to="{ name: 'blogform', params: { id: data.id }}">
                        <a v-bind:href="'/Blog/'+data.id+'/edit'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
                            Editar Blog
                        </a>
                    </router-link>
                    <strong class="d-inline-block mb-1 text-danger text-right ">{{data.fecha}}</strong>
                    <strong class="d-inline-block mb-1 text-danger ">Publicado por: {{data.users_id}}</strong>
                    <h3 class="mb-0 indigo">{{data.tiulo}}</h3>
                      <img v-if="data.productoimagenuno" class="img-fluid img-thumbnail" :src="'/imagenes_files/'+data.productoimagenuno.nombre" alt="">
				              <img class="img-fluid img-thumbnail" v-else src="/imagenes_files/null.png" alt="">
                   
                    <div class="mb-1 text-muted"><br><br></div>
                    <p class="card-text mb-auto text-blog " v-html="data.descricion"></p>
                    <br><br>
                   
                    </div>
                    <div class="col-auto d-none d-lg-block">
                     </div>
                </div>
            </div>
            <!--
            <div class="col-md-12" v-for="data in  consulta_datos" v-bind:key="data.id">
                


                <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
               
                <div class="col-md-6 col-sm-12">
                    <img v-if="data.productoimagenuno" class="img-fluid img-thumbnail" :src="'/imagenes_files/'+data.productoimagenuno.nombre" alt="">
				    <img class="img-fluid img-thumbnail" v-else src="/imagenes_files/null.png" alt="">
                </div>
                <div class="col-md-6 col-sm-12">
                    <router-link :to="{ name: 'blogform', params: { id: data.id }}">
                        <a v-bind:href="'/Blog/'+data.id+'/edit'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
                            Editar Blog
                        </a>
                    </router-link>
                    <div class="col p-4 d-flex flex-column position-static">
                    <strong class="d-inline-block mb-2 text-primary">{{data.fecha}}</strong>
                    <h3 class="mb-0">{{data.tiulo}}</h3>
                    <div class="mb-1 text-muted">{{data.fecha}}</div>
                    <p class="card-text mb-auto" v-html="data.descricion"></p>
                    <br><br>
                   
                    </div>
                    </div>
                   
                </div>
            </div>
            -->
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
      axios.get(`index`)
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
<style >
.text-blog p{
font-size: 17px;
text-align: justify;

}
</style>



