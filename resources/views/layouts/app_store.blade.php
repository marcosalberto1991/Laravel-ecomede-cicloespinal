<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
	<head>



		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Ciclo Espinal</title>
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <link href="{{ asset('css/app.css') }}" rel="stylesheet">

		<link rel="Shortcut Icon" href="{{ asset('img/LOGO_CICLO.ico')}}" type="image/x-icon" />

 		<!-- Google font -->
 		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

 		<!-- Bootstrap -->
 		<link type="text/css" rel="stylesheet" href="{{ asset('dist/css/bootstrap.min.css') }}"/>

 		<!-- Slick -->


         <link type="text/css" rel="stylesheet" href="{{ asset('dist/css/slick.css') }}"/>
         <link type="text/css" rel="stylesheet" href="{{ asset('dist/css/slick-theme.css') }}"/>

 		<!-- nouislider -->

 		<!-- Font Awesome Icon -->
 		<link rel="stylesheet" href="{{ asset('dist/css/font-awesome.min.css') }}">

 		<!-- Custom stlylesheet -->
 		<link type="text/css" rel="stylesheet" href="{{ asset('dist/css/style.css') }}"/>

 		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
 		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
 		<!--[if lt IE 9]>
 		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
 		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
 		<![endif]-->

    </head>
	<body >
        <!-- HEADER -->
        <div id="app">
		<!--
		<header>
            <div class="fixed-top">
         
			<div id="top-header">
				<div class="container">
					<ul class="header-links pull-left">
						<li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
						<li><a href="#"><i class="fa fa-envelope-o"></i> email@email.com</a></li>
						<li><a href="#"><i class="fa fa-map-marker"></i> 1734 Stonecoal Road</a></li>
					</ul>
					<ul class="header-links pull-right">
                        @guest
                            <li><a href="{{ route('login') }}"><i class="fa fa-user-o"></i> {{ __('Login') }}</a></li>
                            <li><a href="{{ route('register') }}"><i class="fa fa-user-o"></i> {{ __('Registrarte - Ciclo Espinal') }}</a></li>
                            @if (Route::has('register'))

                            @endif
                        @else
						
                        <li>
							<router-link  :to="{ name: 'Carrito_Compra'}">
								<i class="fa fa-shopping-cart"></i></i> Mi Carrito
							</router-link>
                        <li><a href="#"><i class="fa fa-user-o"></i> {{ Auth::user()->name }}</a>
                        </li>
                        <li>
                            <i class="fa fa-user-o"></i>
                            <a  href="{{ route('logout') }}"
                                    onclick="event.preventDefault();
                                                    document.getElementById('logout-form').submit();">
                                    {{ __('Salir') }}
                            </a>

                                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                    @csrf
                                </form>
                        </li>
                        @endguest

                    </ul>
				</div>
			</div>
			
		 
			
					
			<nav class="navbar navbar-expand-lg  navbar-dark  bg-dark">
			<a class="navbar-brand" href="#">
				<img src="/img/logo.png" width="100"  class="d-inline-block align-top" alt="" loading="lazy">
				Ciclo Espinal
			</a>
           
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
					<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item active">
							<router-link class="nav-link" :to="{ name: 'Inicio'}">Inicio</router-link>
						</li>
						<li class="nav-item active">
							<router-link class="nav-link" :to="{ name: 'Lista_Producto'}">Lista Producto</router-link>
						</li>
						
						<li class="nav-item active">
							<router-link class="nav-link" :to="{ name: 'Carrito_Compra'}">Mi Carrito</router-link>
						</li>
						
						<li>
                                @role('Administrado')
                            <b-dropdown  id="dropdown-1" text="Administrador" class="m-md-3">
                                <b-dropdown-item><router-link :to="{ name: 'Marca'}"><a href="">Marca</a></router-link></b-dropdown-item>
                                <b-dropdown-item><router-link :to="{ name: 'Producto'}"><a href="">Producto</a></router-link></b-dropdown-item>
                                <b-dropdown-item><router-link :to="{ name: 'Categoria'}"><a href="">Categoria</a></router-link></b-dropdown-item>
                                <b-dropdown-item><a href="/roles">Roles</a></b-dropdown-item>
                                <b-dropdown-item><a href="/permissions">Permiso</a></b-dropdown-item>
                                <b-dropdown-item><a href="/users">Usuario</a></b-dropdown-item>
                            </b-dropdown>
                              @endrole

                            </li>
						

					</ul>
					</nav>
					
					
					
					

          
            </div>
        </header>
		 -->
		 <header class="">
			<!-- TOP HEADER -->
			
			<div id="top-header">
				<div class="container">
					<ul class="header-links pull-left">
						<li><a href="#"><i class="fa fa-phone"></i> +8-2483455</a></li>
						<li><a target="_blank" href="https://wa.me/573183874469?text=Me%20gustaría%20saber%20el%20precio%20de%20un%20producto"><i class="fa fa-whatsapp"></i> +57 318 387 4469</a></li>
						<li><a target="_blank" href="https://wa.me/573168263171?text=Me%20gustaría%20saber%20el%20precio%20de%20un%20producto"><i class="fa fa-whatsapp"></i> +57 316 826 3171</a></li>
						<!--
						href="https://wa.me/573118343456?text=Me%20gustaría%20saber%20el%20precio%20de%20un%20producto" class="whatsapp" target="_blank"
						-->
						<li><a href="#"><i class="fa fa-envelope-o"></i> info@cicloespinal.com</a></li>
						<li><a target="_blank" href="https://www.google.com/maps/place/Ciclo+Espinal/@4.151561,-74.883547,15z/data=!4m5!3m4!1s0x0:0x6f8bc02a6cc7ae07!8m2!3d4.151561!4d-74.883547"><i class="fa fa-map-marker"></i> Cl. 8 #580, Espinal, Tolima</a></li>
					</ul>
					<ul class="header-links pull-right">
					@guest
                            <li><a href="{{ route('login') }}"><i class="fa fa-user-o"></i> {{ __('Login') }}</a></li>
                            <li><a href="{{ route('register') }}"><i class="fa fa-user-o"></i> {{ __('Registrarte - Ciclo Espinal') }}</a></li>
                            @if (Route::has('register'))

                            @endif
                        @else
						
                        <li>
							<router-link  :to="{ name: 'Carrito_Compra'}">
								<i class="fa fa-shopping-cart"></i></i> Mi Carrito
							</router-link>
                        <li><a href="#"><i class="fa fa-user-o"></i> {{ Auth::user()->name }}</a>
                        </li>
                        <li>
                            <i class="fa fa-user-o"></i>
                            <a  href="{{ route('logout') }}"
                                    onclick="event.preventDefault();
                                                    document.getElementById('logout-form').submit();">
                                    {{ __('Salir') }}
                            </a>

                                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                    @csrf
                                </form>
                        </li>
                        @endguest
					</ul>
				</div>
			</div>
			<!-- /TOP HEADER -->

			<!-- MAIN HEADER -->
			<div id="header">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<!-- LOGO -->
						<div class="col-md-3">
							<div class="header-logo">
								<a href="#" class="logo">
								<router-link class="logo" :to="{ name: 'Inicio'}">

									<img src="/img/LOGO_CICLO.png" class="text-center" style="margin-left: 50%;" width="120px" alt="">
									</router-link>
								</a>
							</div>
						</div>
						<!-- /LOGO -->

						<!-- SEARCH BAR -->
						<div class="col-md-6">
							<div class="header-search">
								<form action="/Lista_Producto" method="get" >
									<select name="categoria_id" class="input-select">
										<option value="All">Categoria</option>
										<option value="2">ACCESORIOS</option>
										<option value="3">BICI NIÑOS</option>
										<option value="4">BICICLETA TURISMO</option>
										<option value="13">BICICLETA PLAYERA</option>
										<option value="5">PATINETAS - TABLAS</option>
										<option value="15">CADENA</option>
										<option value="16">CARAMAÑOLA</option>
										<option value="17">CASCO</option>
										<option value="18">LLANTAS</option>
										<option value="30">CAMISA</option>
									</select>
									<input name="nombre" class="input" placeholder="Buscar aqui">
									<button class="search-btn">Buscar</button>
								</form>
							</div>
						</div>
						<!-- /SEARCH BAR -->

						<!-- ACCOUNT -->
						<div class="col-md-3 clearfix">
							<div class="header-ctn">
								<!-- Wishlist -->
								<div>
								<router-link class="nav-link  borde-menu" :to="{ name: 'favorito'}">
										<i class="fa fa-heart-o"></i>
										<span>Mis_Favoritos</span>
										<div class="qty"></div>
										</router-link>
								

								</div>
								<div>
									<a href="/Carrito_Compra">
										<i class="fa fa-shopping-cart"></i>
										<span>Tu Carrito</span>
										<div class="qty"></div>
									</a>
								</div>
								<!-- /Wishlist -->

								<!-- Cart -->
								
								<!-- /Cart -->

								<!-- Menu Toogle -->
								<div class="menu-toggle">
									<a class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation" href="#">
										<i class="fa fa-bars"></i>
										<span>Menu</span>
									
									</a>
								</div>
								<!-- /Menu Toogle -->
							</div>
						</div>
						<!-- /ACCOUNT -->
					</div>
					<!-- row -->
				</div>
				<!-- container -->
			</div>
			<!--
			<nav id="navigation">
				<div class="container">
					<div id="responsive-nav">
						<ul class="main-nav nav navbar-nav">
							<li class="active"><a href="#">Home</a></li>
							<li><a href="#">Hot Deals</a></li>
							<li><a href="#">Categories</a></li>
							<li><a href="#">Laptops</a></li>
							<li><a href="#">Smartphones</a></li>
							<li><a href="#">Cameras</a></li>
							<li><a href="#">Accessories</a></li>
						</ul>
					</div>
				</div>
			</nav>
			-->			
			<div id="header" class="">
				<!-- container -->
				<div class="container">
				<nav class="navbar navbar-expand-md  navbar-dark  bg-dark navlinea flex-nowrap  ">
				
           
					
					<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav navbar-nav center-nav justify-content-center w-100 justify-content-center mx-auto">
						<li class="nav-item">
							<router-link class="nav-link  borde-menu" :to="{ name: 'Inicio'}">Inicio</router-link>
						</li>
						<li class="nav-item">
							<router-link class="nav-link  borde-menu" :to="{ name: 'Ofertas'}">Ofertas</router-link>
						</li>
					
						<li class="nav-item dropdown ">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Bicicletas
							</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'35',marca_id:'All'}}">Bicicletas de Ruta</router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'14',marca_id:'All'}}">Bicicletas de Montaña</router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'3',marca_id:'All'}}">Bicicletas de Niños </router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'13',marca_id:'All'}}">Bicicletas de Playeras </router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'4',marca_id:'All'}}">Bicicletas de Turismo </router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'5',marca_id:'All'}}">Tablas - Patinetas </router-link>
						
							</div>
						</li>
						<li class="nav-item dropdown ">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Accesorios
							</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'33',marca_id:'All'}}">LUBRICANTE</router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'31',marca_id:'All'}}">DIRECCIÓN</router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'30',marca_id:'All'}}">CAMISA </router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'29',marca_id:'All'}}">BOMBA </router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'28',marca_id:'All'}}">BOLSO </router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'27',marca_id:'All'}}">GUANTES </router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'26',marca_id:'All'}}">CICLOCOMPUTADOR </router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'23',marca_id:'All'}}">ZAPATILLA </router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'22',marca_id:'All'}}">SILLIN </router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'21',marca_id:'All'}}">PEDAL </router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'20',marca_id:'All'}}">PACHA </router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'19',marca_id:'All'}}">MANGO </router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'18',marca_id:'All'}}">LLANTA </router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'17',marca_id:'All'}}">CASCO </router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'16',marca_id:'All'}}">CARAMAÑOLA </router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'15',marca_id:'All'}}">CADENA </router-link>
							<router-link class="dropdown-item" :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'6',marca_id:'All'}}">ROPA </router-link>
						
							</div>
						</li>


					
						<li class="nav-item ">
							<router-link class="nav-link borde-menu" :to="{ name: 'Mantenimiento'}">Mantenimiento</router-link>
						</li>
						
						<li class="nav-item  borde-menu">
							<router-link class="nav-link" :to="{ name: 'MyBlog'}">Blog</router-link>
						</li>
						<!--
						<li class="nav-item active borde-menu">
							<router-link class="nav-link"  :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'4',marca_id:'All'}}">Ciclas Carreras</router-link>
						</li>
						<li class="nav-item active borde-menu">
							<router-link class="nav-link"  :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'5',marca_id:'All'}}">Ciclas Todo terreno</router-link>
						</li>
						<li class="nav-item active borde-menu">
							<router-link class="nav-link"  :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'6',marca_id:'All'}}">Lista Producto</router-link>
						</li>
						<li class="nav-item active borde-menu">
							<router-link class="nav-link"  :to="{ name: 'Lista_Producto_Tipo', params: { categoria_id:'7',marca_id:'All'}}">Acesorios</router-link>
						</li>
						-->
						@role('Empleado')
						<li class="nav-item dropdown ">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Administrador
							</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							@can('Categoria Menu')
							<router-link class="dropdown-item" :to="{ name: 'Categoria'}">Categoria</router-link>
							@endcan
							@can('Producto Menu')
							<router-link class="dropdown-item" :to="{ name: 'Producto'}">Producto</router-link>
							@endcan
							@can('Marca Menu')
							<router-link class="dropdown-item" :to="{ name: 'Marca'}">Marca</router-link>
							@endcan
							@can('blog Menu')
							<router-link class="dropdown-item" :to="{ name: 'blog'}">Blog</router-link>
							@endcan
							@role('Administrado')
							<a class="dropdown-item" href="/roles">Roles</a>
							<a class="dropdown-item" href="/permissions">Permiso</a>
							<a class="dropdown-item" href="/roles">Roles</a>
							<a class="dropdown-item" href="/users">Usuario</a>
							@endrole
							</div>
						</li>
						@endrole
					
						

					</ul>
					</nav>
				<!-- container -->
			</div>
			<!-- /MAIN HEADER -->
		</header>
	
        <div style="margin-top: 0px;"></div>
		<div class="section" style="padding-top: 0px!important;">
            <!-- container -->
            <router-view></router-view>

            @yield('content')

            <div class="container">
				<!-- row -->
				<div class="row">

				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- NEWSLETTER -->
		<div id="newsletter" class="section">
			<!-- container -->
			<suscripcion-web></suscripcion-web>
			<!--
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="newsletter">
							<p>Suscríbase a la <strong>Noticias</strong></p>
							<form>
								<input class="input" type="email" placeholder="Enter Your Email">
								<button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
							</form>
							<ul class="newsletter-follow">
								<li>
									<a href="#"><i class="fa fa-facebook"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-twitter"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-instagram"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-pinterest"></i></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		 -->
			<!-- /container -->
		</div>
		<!-- /NEWSLETTER -->

		<!-- FOOTER -->
		<footer id="footer">
			<!-- top footer -->
			<div class="section fondo-foo">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-md-4 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">SOBRE NOSOTROS
                                </h3>
								<p></p>
								<ul class="footer-links">
									<li><a href="https://www.google.com/maps/place/Ciclo+Espinal/@4.151561,-74.883547,15z/data=!4m5!3m4!1s0x0:0x6f8bc02a6cc7ae07!8m2!3d4.151561!4d-74.883547"><i class="fa fa-map-marker"></i>Cl. 8 #580, El Espinal, Tolima</a></li>
									<li><a target="_blank" href="https://wa.me/573183874469?text=Me%20gustaría%20saber%20el%20precio%20de%20un%20producto"><i class="fa fa-whatsapp"></i> +57 318 387 4469</a></li>
									<li><a target="_blank" href="https://wa.me/573168263171?text=Me%20gustaría%20saber%20el%20precio%20de%20un%20producto"><i class="fa fa-whatsapp"></i> +57 316 826 3171</a></li>
						
									<li><a href="#"><i class="fa fa-envelope-o"></i>info@cicloespinal.com</a></li>
								</ul>
							</div>
						</div>

                        <!--
                        <div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">CATEGORIAS</h3>
								<ul class="footer-links">
									<li><a href="#">Hot deals</a></li>
									<li><a href="#">Laptops</a></li>
									<li><a href="#">Smartphones</a></li>
									<li><a href="#">Cameras</a></li>
									<li><a href="#">Accessories</a></li>
								</ul>
							</div>
                        </div>
                    -->

						<div class="clearfix visible-xs"></div>

						<div class="col-md-4 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">INFORMACIÓN</h3>
								<ul class="footer-links">
									<li>
										<a href="/Sobre_nosotros"><router-link  :to="{ name: 'Sobre_Nosotros'}">Sobre nosotros</router-link></a>
									</li>
									<li>
										<a href="/Contactenos"><router-link  :to="{ name: 'Contactenos'}">Contactenos</router-link></a>
									</li>
									<li>
										<a href="/Politica_de_privacidad"><router-link  :to="{ name: 'Politica_de_privacidad'}">Política de privacidad</router-link></a>
									</li>
									<li>
										<a href="/Pedidos_y_Devoluciones"><router-link  :to="{ name: 'Pedidos_y_Devoluciones'}">Pedidos y Devoluciones</router-link></a>
									</li>
							<!--
									<li>
										<a href="/Terminos_y_condiciones"><router-link  :to="{ name: 'Terminos_y_condiciones'}">Términos_y_condiciones</router-link></a>
									</li>
								-->	
								
								</ul>
							</div>
						</div>

						<div class="col-md-4 col-xs-6">
							<div class="footer">
								<!--
								<h3 class="footer-title">Servicios</h3>
								<ul class="footer-links">
									<li><a href="#">Mi cuenta</a></li>
									<li><a href="#">Ver carrito</a></li>
									<li><a href="#">Lista de deseos</a></li>
                                    </a></li>
								</ul>
								-->
							</div>
						</div>
					</div>
					<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /top footer -->

			<!-- bottom footer -->
			<div id="bottom-footer" class="section">
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-md-12 text-center">
							<ul class="footer-payments">
								
								<li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
								<!--
								<li><a href="#"><i class="fa fa-credit-card"></i></a></li>
		 						-->
								<li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
								<!--
								<li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
		 						-->
							</ul>
							<span class="copyright">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy; Todos los derechos resevados |  <i class="fa fa-heart-o" aria-hidden="true"></i> por <!--<a href="https://colorlib.com" target="_blank">-->Digital Monkey<!--</a>-->
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</span>


						</div>
					</div>
						<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /bottom footer -->
		</footer>
		<!-- /FOOTER -->

		<!-- jQuery Plugins -->

		<a href="https://wa.me/573183874469?text=Me%20gustaría%20saber%20el%20precio%20de%20un%20producto" class="whatsapp" target="_blank"> <i class="fa fa-whatsapp whatsapp-icon"></i></a>

    </div>
		<script src="{{ asset('dist/js/jquery.min.js')}}"></script>
		<script src="{{ asset('dist/js/bootstrap.min.js')}}"></script>

        <script src="{{ asset('dist/js/slick.min.js')}}"></script>

        <script src="{{ asset('dist/js/nouislider.min.js')}}"></script>
        <script src="{{ asset('dist/js/jquery.zoom.min.js')}}"></script>
        <script>
            @auth
              window.Permissions = {!! json_encode(Auth::user()->allPermissions, true) !!};
            @else
              window.Permissions = [];
            @endauth
          </script>
   
		<script src="{{ asset('dist/js/main.js')}}"></script>
		<script src="{{ asset('js/app.js') }}" defer></script>        

    </body>
<style rel="stylesheet" type="text/css">
@media (min-width: 768px){
    ._navbar-nav>li {
        __float: left!important;
    }


}
._bg-dark {
  background-color: #15161d !important;
}
._main-nav>li>a {
    color: white;
}.whatsapp {
  position:fixed;
  width:60px;
  height:60px;
  bottom:40px;
  right:40px;
  background-color:#25d366;
  color:#FFF;
  border-radius:50px;
  text-align:center;
  font-size:30px;
  z-index:100;
}

.whatsapp-icon {
  margin-top:13px;
}
.one-linea {
        white-space: nowrap;
}
.navlinea {
    margin-bottom: 0px;
    padding-bottom: 0px;
}
.navbar-brand__{
	padding-top: 0px;
    padding-bottom: 0px;

}
.headernav{
	padding-top: 0px!important;
    padding-bottom: 0px!important;
}
.navbar {
    
	background-color:#15161d!important;

}
#header {
    padding-top: 0px;
    padding-bottom: 0px;
    background-color: #15161D;
	_border-top: 3px solid #D10024;
}
#header {
  
    
}
.header-search form .input {
    width: calc(100% - 301px);
    margin-right: -4px;
}
.container {
    position: relative;
}
@media (min-width: 768px) {
.navbar-brand.abs
    {
        position: absolute;
        width: 100%;
        left: 0;
        text-align: center;
    }
}
li.nav-item {
    margin-right: auto;
    margin-left: auto;
}

.borde-menu:hover{
	color:#2fcc0e
}
.nav-item:hover{
	color:#2fcc0e

}
.nav-link:hover {
    color: #2fcc0e;
}
@media (min-width: 768px) { 
	.fondo-foo{
	

	background-image: url('/img/hotdeal.png');
	background-size: 100% 100%;
}
 }


.navbar-dark .navbar-nav .nav-link:hover, .navbar-dark .navbar-nav .nav-link:focus {
    color: #2fcc0e;
}
..nav-item > a{
	color:#fff;
}
.dropdown-item{
	color:#ffffff;
	background-color: #15161d;
}
.dropdown-item:hover{
	color:#2fcc0e;
	background-color: #15161d;
	
}
.input-select{
	width:33%!important;
}
    </style>
</html>
