<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;

use App\ProductoModel;
use App\Producto_has_CategoriaModel;

use View;
use App\HasRoles;
use App\Roles;
use App\EstadoModel;
use App\CategoriaModel;
use App\MarcaModel;
use App\Producto_has_MarcaModel;
use App\User;
use Spatie\Permission\Namecontrollers\Role;
use Spatie\Permission\Namecontrollers\Permission;

class ProductoController extends Controller {
	public function __construct(){
		$this->middleware('auth');
	}

	protected $rules =
	[
       // 'users_id' => 'required|min:1|max:99999999',
        'codigo' => 'required|min:2|max:255',
	   	'nombre' => 'required|min:2|max:255',
	   	//'nombre_slud' => 'required|min:2|max:255',
	   	'precio' => 'required|min:1|max:99999999',
	   	'descuento' => 'required|min:0|max:255',
        'stock' => 'required|min:1|max:99999999',
        'descripcion' => 'required',
        'estado_id' => 'required|min:0|max:99999999',
        'is_iva' => 'required|min:0|max:99999999',
        'iva' => 'required|min:0|max:99999999',
        'is_nuevo' => 'required|min:0|max:99999999',
        'marca_id' => 'required|min:1|max:99999999',
        'categoria_id' => 'required|min:1|max:99999999',
          
    //regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/

	];

	public function index(){
		return view('Producto.index', [] );
  }
  public function consulta(Request $request){
    $consulta_data=$request->get("consulta_data");
    if($consulta_data==""){
      $data=ProductoModel::with('estado_id')->paginate(20);
    }else{
      $data=ProductoModel::with('estado_id')->where("id",1)
      ->orwhere("id","like","%". $consulta_data."%")
        ->orwhere("users_id","like","%". $consulta_data."%")
        ->orwhere("codigo","like","%". $consulta_data."%")
        ->orwhere("nombre","like","%". $consulta_data."%")
        ->orwhere("nombre_slud","like","%". $consulta_data."%")
        ->orwhere("precio","like","%". $consulta_data."%")
        ->orwhere("descuento","like","%". $consulta_data."%")
        ->orwhere("stock","like","%". $consulta_data."%")
        ->orwhere("descripcion","like","%". $consulta_data."%")
        ->orwhere("estado_id","like","%". $consulta_data."%")
        ->orwhere("created_at","like","%". $consulta_data."%")
        ->orwhere("updated_at","like","%". $consulta_data."%")
        ->orwhere("is_iva","like","%". $consulta_data."%")
        ->orwhere("iva","like","%". $consulta_data."%")
        ->orwhere("is_nuevo","like","%". $consulta_data."%")
        
      ->paginate(20);
    }

    return response()->json($data);
    }
	public function create(){
        return view('Marca.form', ["id"=>'{}'] );
  }
    public function data_foraneo(){
        $data_foraneos = [
            "estado_id" => EstadoModel::select("id","id as nombre","nombre as text")->get(),
            "categoria_id" => CategoriaModel::select("id","id as value","nombre as text")->get(),
            "marca_id" => MarcaModel::select("id","id as value","nombre as text")->get(),
        ];
        return response()->json($data_foraneos);
    }

	public function store(Request $request){
		$validator = Validator::make($request->all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {

      /*
      $file2 = Input::file('archivo');
			if (isset($file2)) {
				$codigo=str_random(5);
				$nombre_original=$file2->getClientOriginalName();
				$nombres = $nombre_original.$codigo. '.' . $file2->getClientOriginalExtension();
        \Storage::disk('intervenir')->put($nombres, \File::get($file2));
      }
      */

      $Producto = new ProductoModel();

			$Producto->users_id=1;
			$Producto->codigo=$request->codigo;
			$Producto->nombre=$request->nombre;
			$Producto->nombre_slud='null';
			$Producto->precio=$request->precio;
				 $Producto->descuento=$request->descuento;
				 $Producto->stock=$request->stock;
				 $Producto->descripcion=$request->descripcion;
				 $Producto->estado_id=$request->estado_id;
				 $Producto->created_at=$request->created_at;
				 $Producto->updated_at=$request->updated_at;
				 $Producto->is_iva=$request->is_iva;
				 $Producto->iva=$request->iva;
				 $Producto->is_nuevo=$request->is_nuevo;
				 $Producto->tallas=$request->tallas;
				 $Producto->is_ofecta=$request->is_ofecta;
				
			$Producto->save();
			return response()->json($Producto);
		}
	}
  public function show($id){

    $data = ProductoModel::findOrFail($id)->toarray();
    // substr_replace($data['tallas'], '"', '') . "<br />\n";
    //$data['tallas'] = str_replace($data['tallas'], '"', " ");
    $data['tallas'] = str_replace('"', ' ', $data['tallas']);
    $data['tallas'] = str_replace('[', ' ', $data['tallas']);
    $data['tallas'] = str_replace(']', ' ', $data['tallas']);
    $data['tallas'] =explode(",",$data['tallas']);
    $data['categoria_id']=Producto_has_CategoriaModel::where('producto_id',$id)->get()->pluck('categoria_id'); 
    $data['marca_id']=Producto_has_MarcaModel::where('producto_id',$id)->get()->pluck('marca_id'); 
        return response()->json($data);
    }


  public function edit($id){
    return view('Marca.index', [] );

  }

    public function update(Request $request, $id){
		$validator = Validator::make($request->all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {
			$Producto = ProductoModel::findOrFail($id);

			 //$Producto->users_id=$request->users_id;
			$Producto->codigo=$request->codigo;
            $Producto->nombre=$request->nombre;
            $Producto->nombre_slud=$request->nombre_slud;
            $Producto->precio=$request->precio;
            $Producto->descuento=$request->descuento;
            $Producto->stock=$request->stock;
            $Producto->descripcion=$request->descripcion;
            $Producto->estado_id=$request->estado_id;
            $Producto->created_at=$request->created_at;
            $Producto->updated_at=$request->updated_at;
            $Producto->is_iva=$request->is_iva;
            $Producto->iva=$request->iva;
            $Producto->is_nuevo=$request->is_nuevo;
            $Producto->tallas=$request->tallas;
            $Producto->is_ofecta=$request->is_ofecta;
			      $Producto->save();


            Producto_has_CategoriaModel::where('producto_id',$id)->delete();
            foreach($request->categoria_id as $key => $value) {
                $pc = new Producto_has_CategoriaModel();
                $pc->producto_id= $id;
                $pc->categoria_id= $value;
                $pc->save();
            }
            Producto_has_MarcaModel::where('producto_id',$id)->delete();
            foreach($request->marca_id as $key => $value) {
              $pc = new Producto_has_MarcaModel();
              $pc->producto_id= $id;
              $pc->marca_id= $value;
              $pc->save();
            }



            return response()->json($Producto);
		}
	}

	public function destroy($id){
    Producto_has_MarcaModel::where('producto_id',$id)->delete();
    Producto_has_CategoriaModel::where('producto_id',$id)->delete();
		$Producto = ProductoModel::findOrFail($id);
		$Producto->delete();
		return response()->json($Producto);
	}

}


