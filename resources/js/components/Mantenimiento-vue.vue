<template>

<div class="container-fluid" style="padding-right: 0px;padding-left: 0px;s">
			    <div class="row">
					<div class="col-md-12">
				       <img  src="/img/cabecera-categoria-mantenimiento-01(1).png" class="img-fluid" alt="Responsive image" width="100%" height="20%px" >
					</div>
			    </div>
    <div class='row'>
        <div class='col-lg-12'>
            <br>
          <h1 class="titulo">
            
          </h1>
          <article class="card mb-4">
            <header class="card-header">
              <div class="card-meta">
                <b >Mantenimientos correctivo o preventivo  </b>
              </div>
             
            </header>
              <img class="card-img" src="img/mantenimiento.png" alt="">
            <div class="card-body">
              <p class="card-text hidden"></p>
            </div>
          </article>
          
        </div>

    </div>


</div>
</template>

<style>
.texto-lectura{
    font-size: 18px;

}
.titulo{


    text-align: center;
    color: #ffffff;
    background: #2fcc0e;
    font-size: 2em;
    _font-family: 'helvcondensedbold';
    margin: 0 auto 15px;
    font-weight: 100;  
    padding: 12px;
    letter-spacing: 2px;
    padding: 14px 12px;
    letter-spacing: 2px;
    width: 45%;
}
</style>
<script>
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
           
        };
    },
    mounted() {
        $('html, body').animate({scrollTop:0}, 'slow');
    },
    methods: {


    }
};
</script>
