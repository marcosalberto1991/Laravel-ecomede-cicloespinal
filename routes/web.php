<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('Inicio');
});

Route::get('/home', function () {
    return view('Inicio');
});
Route::get('Lista_Producto', function () {
    return view('Inicio');
});
Route::get('Producto/{id}/ShowProducto', function () {
    return view('Inicio');
});



Auth::routes();
//Route::get('/home', 'HomeController@index')->name('home');

Route::get('Producto_Venta/consulta', 'Producto_VentaController@consulta');
Route::resource('Producto_Venta','Producto_VentaController');


Route::get('Estado_Venta/consulta', 'Estado_VentaController@consulta');
Route::resource('Estado_Venta','Estado_VentaController');



Route::get('index/sub_consulta/{categoria_id}/{marca_id}', 'IndexController@sub_consulta');
Route::get('Blog/consulta', 'BlogController@consulta');
Route::post('Blog/update/{id}', 'BlogController@update');
Route::post('Inicio/sucripcion', 'IndexController@sucripcion');
Route::resource('Blog','BlogController');



Route::get('/Venta/venta_procesar', function () {
    return view('Inicio');
});

Route::get('/Lista_Producto_Tipo/{categoria_id}/{marca_id}', function () {
    return view('Inicio');
});


Route::get('/MyBlogShow/{id}/Show', function () {
    return view('Inicio');
});



Route::get('/Sobre_Nosotros', function () {
    return view('Inicio');
});

Route::get('/MyBlog', function () {return view('Inicio');});
Route::get('/Contactenos', function () {return view('Inicio');});
Route::get('/Politica_de_privacidad', function () {return view('Inicio');});
Route::get('/Pedidos_y_Devoluciones', function () {return view('Inicio');});
Route::get('/Ofertas', function () {return view('Inicio');});
Route::get('/Mantenimiento', function () {return view('Inicio');});
Route::get('/Favorito', function () {return view('Inicio');});



Route::get('Favorito/consulta', 'FavoritoController@consulta');
Route::resource('Favorito','FavoritoController');


Route::get('index/ofectas', 'IndexController@ofectas');
Route::get('index/productos_nuevos', 'IndexController@productos_nuevos');
Route::get('index/Blog/consulta', 'IndexController@MyBlog');
Route::get('MyBlogShow/{id}/index', 'IndexController@MyBlogShow');
Route::get('Ventas/venta_procesar_funcion', 'VentaController@venta_procesar_funcion');
Route::get('Ventas/venta_procesar', 'VentaController@venta_procesar');
Route::get('Venta/consulta', 'VentaController@consulta');
Route::resource('Venta','VentaController');

Route::resource('users', 'UserController');
Route::resource('roles', 'RoleController');
Route::resource('permissions', 'PermissionController');
Route::get('/permission/{permissionName}', 'PermissionController@check');


//Route::get('/Lista_producto', 'HomeController@Lista_producto')->name('Lista_producto');
//Route::get('/home/{id}', 'HomeController@show')->name('show');

Route::get('ProductoImagen/consulta', 'ProductoImagenController@consulta');
Route::resource('ProductoImagen','ProductoImagenController');

//Route::get('Twitter/consulta', 'TwitterController@consulta');
//Route::resource('Twitter','TwitterController');
Route::resource('Producto','TwitterController');

Route::get('Categoria/consulta', 'CategoriaController@consulta');
Route::resource('Categoria','CategoriaController');


Route::get('Productos/data_foraneo', 'ProductoController@data_foraneo');
Route::get('Productos/consulta', 'ProductoController@consulta');
Route::resource('Producto','ProductoController');


Route::get('Estado/consulta', 'EstadoController@consulta');
Route::resource('Estado','EstadoController');

Route::get('Marca/consulta', 'MarcaController@consulta');
Route::resource('Marca','MarcaController');


Route::get('Marcav2/consulta', 'Marcav2Controller@consulta');
Route::resource('Marcav2','Marcav2Controller');

Route::get('Carrito_Compra/consulta', 'Carrito_CompraController@consulta');
Route::post('Carrito_Compra/add_carrito/{producto_id}/{cantidad}', 'Carrito_CompraController@add_carrito');
Route::post('Carrito_Compra/add_carrito/{producto_id}/{cantidad}/{talla}/{imagen_producto}', 'Carrito_CompraController@add_carrito');
Route::resource('Carrito_Compra','Carrito_CompraController');




Route::post('Lista_producto/consulta_productos', 'IndexController@consulta_productos');
Route::get('Lista_producto/consulta_tipo', 'IndexController@consulta_tipo');

Route::post('ProductoImagen_put/{producto_id}', 'ProductoImagenController@update');
Route::get('ProductoImagen/consulta_por/{producto_id}', 'ProductoImagenController@consulta_por');
Route::get('ProductoImagen/consulta', 'ProductoImagenController@consulta');
Route::resource('ProductoImagen','ProductoImagenController');

//Route::get('Producto/{id}/ShowProducto', 'ProductoImagenController@consulta');

Route::get('Producto/{id}/ShowProducto', function () {
    return view('Lista_Producto');
});

Route::get('index/consulta_producto/{id}', 'IndexController@consulta_producto');
Route::get('index/consulta_inicio/{nombre_categoria}/{nombre_marca}', 'IndexController@consulta_inicio');
Route::get('index/referencia', 'IndexController@referencia');


Route::get('/clear', function() {
    

    Artisan::call('key:generate');
    Artisan::call('cache:clear');
    Artisan::call('config:clear');
    Artisan::call('config:cache');
    Artisan::call('view:clear');

    return "configuracion actualizado en ENV!";

 });
Route::get('imagenes_file/{filename}', function($filename){

    $filePath = storage_path().'/app/public/'.$filename;
    //echo $filePath; exit();
    if ( ! File::exists($filePath) or ( ! $mimeType = getImageContentType($filePath)))
    {
        return Response::make("File does not exist.", 404);
    }
    $fileContents = File::get($filePath);
    return Response::make($fileContents, 200, array('Content-Type' => $mimeType));
});

Route::get('imagenes_files/{file}', function ($file) {
    //$filePath = storage_path().'/app/public/'.$filename;
    return Storage::response("/public/$file");
});
