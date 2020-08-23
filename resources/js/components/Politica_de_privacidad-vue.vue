<template>
<div class='container'>

    <div class='row'>
        <div class='col-lg-12'>
            <br>
          <h1 class="titulo">
            POLÍTICAS DE PRIVACIDAD
          </h1>
          <p class="texto-lectura">
             
            De conformidad con la Ley 1581 de 2012 “por la cual se dictan disposiciones generales para la protección de datos personales” y su Decreto , informamos que para Ciclo Espinal mantener estrictos procedimientos y políticas para la salvaguardar los datos personales que hayan sido o sean recolectados en desarrollo de nuestras actividades, es de vital importancia, por lo tanto lo invitamos a conocer nuestra Política de Protección y Tratamiento de Datos Personales


          </p>
          <p class="texto-lectura"><br>
            <h3>AUTORIZACIÓN PARA EL TRATAMIENTO DE DATOS PERSONALES </h3>
          </p> 
          <p class="texto-lectura">
            Manifiesto que he leído el presente aviso de privacidad y que he tenido acceso a las políticas de protección de datos contenidas en el Manual de Políticas para la Protección y Tratamiento de Datos Personales. En consecuencia, otorgo mi autorización expresa para el tratamiento de mis datos personales, incluida la autorización expresa de transferencia y transmisión internacional de mis datos personales, dentro de las finalidades comunicadas en el presente aviso y en el manual de políticas mencionado. En caso de querer presentar una solicitud o queja respecto del tratamiento de datos personales, le pedimos hacer llegar una comunicación a nuestras oficinas ubicadas en la admin@cicloespinal.com, en la dirección  Cl. 8 #580, Espinal, Tolima
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
