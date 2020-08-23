<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ProductoModel;
use App\CategoriaModel;
use App\MarcaModel;
use App\ProductoImagenModel;
use App\Producto_has_CategoriaModel;
use App\Producto_has_MarcaModel;
use App\BlogModel;
use App\FavoritoModel;
use App\SuscripcionModel;
use Auth;



class IndexController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }
    public function consulta_productos(Request $request){
        $consulta_data=$request->get("consulta_data");

        $categoria_id=$request->categoria_id;
        $marca_id=$request->marca_id;
        $precio_max=$request->precio_max;
        $precio_min=$request->precio_min;
        //echo array_count_values ($categoria_id);
        //print_r(count($categoria_id));
        //exit();

        
        //var_dump($categoria_id);

        if((count($categoria_id))==0){
          $categoria_id=CategoriaModel::get()->pluck('id');
          //var_dump($categoria_id);
        }
        try {
          if($categoria_id[0]=="All"){
            $categoria_id=CategoriaModel::get()->pluck('id');
          }
          //code...
        } catch (\Throwable $th) {
        }
        try {
          if($marca_id[0]=="All"){
            $marca_id=MarcaModel::get()->pluck('id');
          }
        } catch (\Throwable $th) {
          //throw $th;
        }
        //var_dump($categoria_id);
        
        if((count($marca_id))==0){
          $marca_id=MarcaModel::get()->pluck('id');
        }
        //var_dump($categoria_id);
        //var_dump($marca_id);
        
        if($precio_max==0){
          $precio_max=9999999999999;
        }
        if($precio_min==0){
          $precio_min=0;
        }
        $producto_id_categoria=Producto_has_CategoriaModel::wherein('categoria_id',$categoria_id)->pluck('producto_id');
        $producto_id_marca=Producto_has_MarcaModel::wherein('marca_id',$marca_id)->pluck('producto_id');
        //var_dump($producto_id_categoria);
        //echo "<br>";echo "<br>";echo "<br>";echo "<br>";
        //var_dump($producto_id_marca);

        $producto_id_all=$producto_id_categoria->merge($producto_id_marca);
        
        //var_dump($producto_id_all);exit();
        if($consulta_data==""){
       

          $data=ProductoModel::with('productoimagenuno','favorito_id')
          ->select('id','nombre','precio','descuento','estado_id','is_nuevo')
          //->wherein('id',$producto_id_all)
          ->wherein('id',$producto_id_categoria)
          ->wherein('id',$producto_id_marca)
          //->whereBetween('precio', array($precio_min,$precio_max))
          //->paginate(30);
          ;
          $data=$data->whereBetween('precio', array($precio_min,$precio_max))->paginate(21);
          

        }else{
          $data=ProductoModel::with('productoimagenuno')
          ->select('id','nombre','precio','descuento','estado_id','is_nuevo')
          //->wherein('id',$producto_id_all)
          ->wherein('id',$producto_id_categoria)
          ->wherein('id',$producto_id_marca)
          
          ->whereBetween('precio', array($precio_min,$precio_max))
          ->where("nombre","like","%". $consulta_data."%");
          //->paginate(30);

          $data=$data->whereBetween('precio', array($precio_min,$precio_max))->paginate(21);

        }
        return response()->json($data);


    }
    public function consulta_tipo(){
        $data_foraneos = [
          "categoria_id" => CategoriaModel::select("id","nombre")->get(),
          "marca_id" => MarcaModel::select("id","nombre")->get(),
          "producto_nuevos" => ProductoModel::limit(10)->with('productoimagenuno')->orderBy('created_at','desc')->limit(10)->get(),
          "consulta_datos_descuentos" => ProductoModel::limit(20)->with('productoimagenuno')->where('descuento','>=',1)->orderBy('created_at','desc')->get(),


          //"departamento_id" => DepartamentoModel::select("id_departamento as id","departamento as text")->get(),
            ];
            return response()->json($data_foraneos);

    }
    public function sub_consulta($categoria_id,$marca_id){
      $producto_id_categoria=Producto_has_CategoriaModel::where('categoria_id',$categoria_id)->get()->pluck('producto_id');

      $data=ProductoModel::with('productoimagenuno')
      //->wherein('id',$producto_id_marca)
      ->wherein('id',$producto_id_categoria)
      ->orderBy('nombre','asc')
      //->limit(8)
      ->paginate(20);

///      ->get();
      return response()->json($data);

    }
    public function consulta_inicio($nombre_categoria='All',$nombre_marca='All'){

        if($nombre_categoria=='All'){
            $categoria_id=CategoriaModel::get()->pluck('id');
        }else{
            $categoria_id=CategoriaModel::where('nombre',$nombre_categoria)->get()->pluck('id');
        }
        //echo $categoria_id;

        if($nombre_marca=='All'){
            $marca_id=MarcaModel::get()->pluck('id');
        }else{
            $marca_id=MarcaModel::where('nombre',$nombre_marca)->get()->pluck('id');
        }
        //echo $marca_id;


        $producto_id_categoria=Producto_has_CategoriaModel::wherein('categoria_id',$categoria_id)->get()->pluck('producto_id');
        $producto_id_marca=Producto_has_MarcaModel::wherein('marca_id',$marca_id)->get()->pluck('producto_id');

        //var_dump($producto_id_marca);var_dump($producto_id_categoria); exit();
        $data=ProductoModel::with('productoimagenuno')
        ->wherein('id',$producto_id_marca)
        ->wherein('id',$producto_id_categoria)
        ->orderBy('created_at','desc')
        ->limit(8)
        ->get();
        return response()->json($data);
    }

    public function productos_nuevos(){
      $data=ProductoModel::with('productoimagenuno')
        ->orderBy('created_at','desc')
        ->limit(8)
        ->get();
        return response()->json($data);
    }
    public function ofectas(){
      $data=ProductoModel::with('productoimagenuno')
      
      ->where('descuento','>=',1)
      ->orderBy('created_at','desc')
        ->limit(8)
        ->get();
        return response()->json($data);
    }
    
    public function sucripcion(Request $request){
      $data = new SuscripcionModel();
      $data->email=$request->email;
      $data->save();
      //$Producto = new ProductoModel();

      return response()->json($data);

    }
    public function consulta_producto($id){
      $datas = ProductoModel::with('categoria_id.nombre_categoria')->where('id',$id)->get()->first()->toarray();
      $datas['tallas'] = str_replace('"', ' ', $datas['tallas']);
      $datas['tallas'] = str_replace('[', ' ', $datas['tallas']);
      $datas['tallas'] = str_replace(']', ' ', $datas['tallas']);
      $datas['tallas'] =explode(",",$datas['tallas']);
      
      //if(auth()->user()->id){
        $favoritos=false;

        if (Auth::check()){

        $favoritos=FavoritoModel::where('producto_id',$id)->where('users_id',auth()->user()->id)->get()->first();
        if($favoritos){
          $favoritos=true;
        }else{
          $favoritos=false;
        }
    }
      $data = [
            "favoritos"=>$favoritos,
            "producto_id" => $datas,
            "imagen_id" => ProductoImagenModel::where('producto_id',$id)->get(),

            //"departamento_id" => DepartamentoModel::select("id_departamento as id","departamento as text")->get(),
              ];
        return response()->json($data);

    }
    public function MyBlogShow($id){
      $data=BlogModel::where('id',$id)->get();
      return response()->json($data);

    }
    public function MyBlog(Request $request){
      $consulta_data=$request->get("consulta_data");
      if($consulta_data==""){
        $data=BlogModel::paginate(20);
      }else{
        $data=BlogModel::where("id",1)
        ->orwhere("id","like","%". $consulta_data."%")
          ->orwhere("tiulo","like","%". $consulta_data."%")
          ->orwhere("descricion","like","%". $consulta_data."%")
          ->orwhere("categoria","like","%". $consulta_data."%")
          ->orwhere("tag","like","%". $consulta_data."%")
        ->paginate(20);
      }
      return response()->json($data);
    }


}
