

  <template>



<div>
    <!--
    <div class="container-fluid" style="padding-right: 0px;padding-left: 0px;s">
        <div class="row">
            <div class="col-md-12">
                <img src="/img/OFERTAS-01.png" class="img-fluid" alt="Responsive image" width="100%" height="20%px">
            </div>
        </div>
    </div>
    -->
    <div class='container'>

        <div class='row'>
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">Mis Favoritos</h3>
                </div>
            </div>
            <div class="col-md-3 col-xs-6" v-for="data in consulta_datos" v-bind:key="data.id">
                <div class="product">
                    <router-link :to="{ name: 'ShowProducto', params: { id: data.id }}">
                        <div class="product-img">
                            <img v-if="data.productoimagenuno!=undefined" :src="'imagenes_files/'+data.productoimagenuno.nombre" alt="">
                            <img v-else src="imagenes_files/null.png" alt="">
                            <div class="product-label">
                                <span v-if="data.descuento!=0" class="sale">{{data.descuento}}</span>
                                <span v-if="data.is_nuevo==1" class="new">Nuevo</span>
                            </div>
                        </div>
                    </router-link>
                    <div class="product-body">
                        <p class="product-category">Disponible</p>
                        <h3 class="product-name"><a href="#">{{data.nombre}}</a></h3>
                        <h4 class="product-price">${{ formatPrice(data.precio)}}

                        </h4>
                        <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-btns">
											
                        <button class="add-to-wishlist" v-on:click="favorito(data.id)"><i class="fa fa-heart-o"></i><span class="tooltipp">Añadir a Favorito</span></button>

                            <!--
                                                    <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                    -->
                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                        </div>
                    </div>
                    <div class="add-to-cart">
                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Añadir al Carrito</button>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <!--
<b-modal id="moda-eliminar"  size="xl" hide-footer >
  <template slot="modal-title">Eliminar un Registro </template>
  <div class="d-block text-center">
    <h3>¿Desea eliminar el registro permanente?</h3>
    <b-button class="mt-3 btn btn-danger " @click="eliminar_registro_delete()">Eliminar</b-button>
  </div>
</b-modal>
-->
</div>





<!--
  <div class='container-fluid'>

    <div class='row'>
  <div class='col-lg-12'>
  <div class='main-card mb-3 card'>
  <div class='card-body'><h1 class=''>Lista de Favorito </h1>

    <nav>
      <pagination :data='consulta_datos' @pagination-change-page='consulta'></pagination>
    </nav>

    <div class='col-12'>
        
      <router-link v-if="$can('Favorito Anadir')" :to="{ name: 'favoritoformadd',params:{id:0} }">

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
      <template v-slot:cell(Acciones)='data'>

          <b-button-group>
          
          <b-button v-if="$can('Favorito Editar')" size='sm' variant='warning'  type='button' class='btn-sm btn btn-wangir mr-1' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Editar
            </b-button>
            
            <router-link :to="{ name: 'favoritoform', params: { id: data.item.id }}">
                <a v-bind:href="'/Favorito/'+data.item.id+'/edit'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
                    Editar
                </a>
            </router-link>



            <b-button v-if="$can('Favorito Eliminar')"  v-b-modal.moda-eliminar @click='eliminar_registro(data.item.id)'
                type='button' class='btn-sm btn btn-danger mr-1' size='sm' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Eliminar
            </b-button>
         
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




-->


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
      formulario_Favorito:false,
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
      { key: 'users_id', sortable:true},
      { key: 'producto_id', sortable:true},
      
      ],


      //input_Favorito_id:[],
      data_foraneo_users_id:[],data_foraneo_producto_id:[],

      consulta_datos:[],
      errors: {},
      mensaje_formulario: "",
      page:1,

    };
  },
  mounted() {
    this.consulta();
    //this.data_foraneo();
  },
  methods: {

    consulta(page = 1){
      if (localStorage.getItem("Favorito")) {
        try { this.items = JSON.parse(localStorage.getItem("Favorito"));
        } catch (e) { localStorage.removeItem("Favorito");}
      }

      //this.page=page;
      //axios.get("Favorito/consulta?page=" +page+"&consulta_data="+this.input_consulta_data)
      axios.get(`Favorito/consulta`)
      .then(response => {
        this.consulta_datos = response.data;
        const parsed = JSON.stringify(response.data);
        localStorage.setItem("Favorito", parsed);
      });
    },

    eliminar_registro(data_id){
    this.input_Favorito_id=data_id;
    },
    data_foraneo(){

    },
     formatPrice(value) {
            let val = (value / 1).toFixed(0).replace(".", ",");
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        },
    eliminar_registro_delete(){
      var data_id=this.input_Favorito_id;
      axios.delete(`Favorito/${this.input_Favorito_id}`).then(response => {
        const data = response.data;
        if(response.data.id){
          this.validacion="";
          this.$toastr.info("Operacio exitosa", "Datos Eliminados");
          this.consulta(this.page);
        }
      });

    },
   

    $can(permissionName) {
        return true;

      return Permissions.indexOf(permissionName) !== -1;
    },
    favorito(id){
      		axios.get(`/Favorito/${id}`).then(response => {
          this.$toastr.info("Añadido a favoritos", "Añadido a favoritos");
          this.consulta(this.page);

			  });      
    	},


  }
};


</script>



