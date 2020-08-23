<template>
<div class='container'>

    <div class='row'>
        <div class='col-lg-12'>
            <br>
          <h1 class="titulo">
            Terminos y condiciones
          </h1>
          <p class="texto-lectura">
             
            Cl. 8 #580, Espinal, Tolima


          </p>
          <p class="texto-lectura">

          </p>
          
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

        

        

        $can(permissionName) {
            return Permissions.indexOf(permissionName) !== -1;
        },

    }
};
</script>
