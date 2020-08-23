

  <template>

  <div class='container-fluid'>

    <div class='row'>
  <div class='col-lg-12'>
  <div class='main-card mb-3 card'>
  <div class='card-body'><h1 class=''>Lista de Producto </h1>

    <nav>
      <pagination :data='consulta_datos' @pagination-change-page='consulta'></pagination>
    </nav>

    <div class='col-12'>
      <router-link v-if="$can('Producto Add')" :to="{ name: 'productoformadd',params:{id:0} }">
      <a v-bind:href="'/Marca/create'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
              Añadir Registro
      </a>
      </router-link>
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
      <template v-slot:cell(precio)='data'>$
      {{ formatPrice(data.item.precio )}}
      </template>
      
      <template v-slot:cell(Acciones)='data'>

          <b-button-group class="one-linea">
          <!--
          <b-button v-if="$can('Producto Editar')" size='sm' variant='warning'  type='button' class='btn-sm btn btn-wangir mr-1' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Editar
            </b-button>
            -->
            <router-link v-if="$can('Producto Editar')" :to="{ name: 'productoform', params: { id: data.item.id }}">
                <a v-bind:href="'/Producto/'+data.item.id+'/edit'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
                    Editar
                </a>
            </router-link>



            <b-button v-if="$can('Producto Delete')"  @click='eliminar_registro(data.item.id)'
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

</div>




<b-modal id="moda-eliminar" ref="my-modal"  size="xl" hide-footer >
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
      formulario_Producto:false,
      validacion: [],
      editar_dato: false,
      data: [],
      datas: [],
      input_consulta_data:"",
      stickyHeader: true,
      noCollapse: false,
      fields: [
      { key: "Acciones",stickyColumn: true, label:"Acciones" ,sortable: false },
     // { key: 'users_id', sortable:true},
      { key: 'codigo', sortable:true},
      { key: 'nombre', sortable:true},
      //{ key: 'nombre_slud', sortable:true},
      { key: 'precio', sortable:true},
      { key: 'descuento', sortable:true},
      { key: 'stock', sortable:true},
      //{ key: 'descripcion', sortable:true},
      { key: 'estado_id.nombre', sortable:true},
    //  { key: 'created_at', sortable:true},
     // { key: 'updated_at', sortable:true},
      { key: 'is_iva', sortable:true},
      { key: 'iva', sortable:true},
      { key: 'is_nuevo', sortable:true},

      ],


      //input_Producto_id:[],
      data_foraneo_users_id:[],
      data_foraneo_estado_id:[],

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
      if (localStorage.getItem("Producto")) {
        try { this.items = JSON.parse(localStorage.getItem("Producto"));
        } catch (e) { localStorage.removeItem("Producto");}
      }

      this.page=page;
      //axios.get("Producto/consulta?page=" +page+"&consulta_data="+this.input_consulta_data)
      axios.get(`Productos/consulta?page=${page}&consulta_data=${this.input_consulta_data}`)
      .then(response => {
        this.consulta_datos = response.data;
        const parsed = JSON.stringify(response.data);
        localStorage.setItem("Producto", parsed);
      });
    },

    eliminar_registro(data_id){
    this.input_Producto_id=data_id;
        var r = confirm("Esta seguro que desea eliminar el producto");
            if (r == true) {
                this.eliminar_registro_delete()
        }
    },
    data_foraneo(){

    },
    eliminar_registro_delete(){
      var data_id=this.input_Producto_id;
      axios.delete(`Producto/${this.input_Producto_id}`).then(response => {
        const data = response.data;
        if(response.data.id){
          this.validacion="";
          this.$toastr.info("Operacio exitosa", "Datos Eliminados");
          this.consulta(this.page);
          this.$refs['my-modal'].hide()

        }
      });

    },
    formatPrice(value) {
            let val = (value / 1).toFixed(0).replace(".", ",");
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
      },

    $can(permissionName) {
       // return true

      return Permissions.indexOf(permissionName) !== -1;
    },


  }
};


</script>



