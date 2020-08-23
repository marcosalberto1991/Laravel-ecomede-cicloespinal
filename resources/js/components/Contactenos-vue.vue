<template>
<div class='container'>

    <div class='row'>
        <div class='col-md-12'>
            <br>
            <h1 class="titulo">
                Contactenos
            </h1>
        </div>
        <div class='col-md-5 col-sm-12'>
            <ul class="headers-linkss">
                <li><a href="#"><i class="fa fa-phone"></i> +8-2483455</a></li>
                <li><a target="_blank" href="https://wa.me/573183874469?text=Me%20gustaría%20saber%20el%20precio%20de%20un%20producto"><i class="fa fa-whatsapp"></i> +57 318 387 4469</a></li>
                <li><a target="_blank" href="https://wa.me/573168263171?text=Me%20gustaría%20saber%20el%20precio%20de%20un%20producto"><i class="fa fa-whatsapp"></i> +57 316 826 3171</a></li>
                <li><a href="#"><i class="fa fa-envelope-o"></i> info@cicloespinal.com</a></li>
                <li><a target="_blank" href="https://www.google.com/maps/place/Ciclo+Espinal/@4.151561,-74.883547,15z/data=!4m5!3m4!1s0x0:0x6f8bc02a6cc7ae07!8m2!3d4.151561!4d-74.883547"><i class="fa fa-map-marker"></i> Cl. 8 #580, Espinal, Tolima</a></li>
            </ul>

        </div>
        <div class='col-md-7 col-sm-12'>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3979.3491880947545!2d-74.88573568523965!3d4.151560996981581!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e3ed3e679c5a375%3A0x6f8bc02a6cc7ae07!2sCiclo%20Espinal!5e0!3m2!1ses-419!2sco!4v1596584527633!5m2!1ses-419!2sco" width="100%" height="450" frameborder="0" style="border:2;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        </div>

    </div>

</div>
</template>

<style>
.texto-lectura {
    font-size: 18px;

}
.headers-linkss li a {
    color: #2fcc0e;
    font-size: 22px;
}

.titulo {

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
        $('html, body').animate({
            scrollTop: 0
        }, 'slow');
    },
    methods: {

        $can(permissionName) {
            return Permissions.indexOf(permissionName) !== -1;
        },

    }
};
</script>
