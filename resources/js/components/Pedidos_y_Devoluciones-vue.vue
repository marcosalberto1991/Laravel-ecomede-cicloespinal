<template>
<div class='container'>

    <div class='row'>
        <div class='col-lg-12'>
            <br>
          <h1 class="titulo">
            Pedidos y Devoluciones
          </h1>
          <p class="texto-lectura">
            <b>1.</b> Presentar la factura original de compra, en caso de no contar con ella, puede solicitar la copia en nuestra oficina, con tu cedula, en el caso de las bicicletas si no tiene factura puede presentar la tarjeta de propiedad.
            <br><br>
            <b>2.</b> La garantía de cualquier producto estará sujeta a un diagnóstico técnico en un tiempo máximo de quince (15) días hábiles. La cual puede tener una respuesta afirmativa o negativa.
            <br><br>
            <b>3.</b> Toda solicitud de los productos y componentes de las bicicletas será atendida en un tiempo máximo de quince (15) días hábiles siguientes a la recepción del producto, por ello, tenga en cuenta que el producto será remitido al proveedor o fabricante para su diagnóstico técnico y su respectiva reparación si este aplica. En el caso de los accesorios y repuestos como (suspensiones, frenos, palancas de cambios, descarriladores etc.) El proceso de reparación o reposición se realizará dentro de los treinta (30) días hábiles siguientes contados a partir del día de la recepción de la solicitud. Si el producto no admite reparación, se procederá al cambio por uno nuevo de similares características y del precio pagado.
            <br><br>
          </p>
          <p class="texto-lectura">

          </p>
          
        </div>
        <div class='col-lg-12'>
            <h1 class="titulo">
                POLÍTICAS DE DEVOLUCIONES
            </h1>
            <p class="texto-lectura">
                   <b>1.</b>  El producto debe estar en condiciones aptas para su venta (sin uso, en el empaque original, manuales y todas sus piezas).
            </p>
            <p class="texto-lectura">
               <b>2.</b> Debe presentar la factura original de compra, en caso de no contar con ella, puede solicitar la copia de la misma.
            </p>
            <p class="texto-lectura">
               <b>3.</b> El plazo máximo para solicitar el cambio de productos será de 8 días calendario a partir de la fecha de compra.
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
