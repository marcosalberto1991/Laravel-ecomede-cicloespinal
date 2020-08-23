<template>
<div>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="newsletter">
                    <p>Suscríbase a la <strong>Noticias</strong></p>
                    <form>
                        <input type="email" v-model="input_email" placeholder="Ingrese tu correo" class="input"> <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button></form>
                    <ul class="newsletter-follow">
                        <li><a href="https://es-la.facebook.com/ciclo.espinal"><i class="fa fa-facebook"></i></a></li>
                        <!--
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                        <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                        -->
                    </ul>
                </div>
            </div>
        </div>
    </div>

</div>
</template>

<style>

</style>

<script>
import Vue from "vue";

//import Select2 from "v-select2-component";
//https://www.npmjs.com/package/vue-toastr-2
import VueToastr2 from "vue-toastr-2";
import "vue-toastr-2/dist/vue-toastr-2.min.css";
window.toastr = require("toastr");
Vue.use(VueToastr2);

export default {
    components: {
        VueToastr2,
        //        Select2
    },
    data() {

        return {
            consulta_datos: [],
            input_email:[],
        };
    },
    mounted() {},
    methods: {

        consulta() {
            axios.get(`index/ofectas`)
                .then(response => {
                    this.consulta_datos = response.data;
                    //const parsed = JSON.stringify(response.data);
                    //localStorage.setItem("producto_inicio", parsed);
                });

        },

        $can(permissionName) {
            return Permissions.indexOf(permissionName) !== -1;
        },

        formatPrice(value) {
            let val = (value / 1).toFixed(0).replace(".", ",");
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        },
        formulario() {

             const data = {
                email: this.input_email,
            }

            //axios.get("Twitter/consulta?page=" +page+"&consulta_data="+this.input_consulta_data)
            axios.post(`/Inicio/sucripcion`,data)
                .then(response => {
                    if (response.data.id) {
                    //this.validacion = "";
                    this.$toastr.info("Operacio exitosa", "Operacio exitosa");
                    //this.$refs['my-modal'].hide()
                    //this.consulta(this.page);
                }
                });

        },

    }
};
</script>
