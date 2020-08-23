<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;

use App\ProductoImagenModel;
use View;
use App\HasRoles;
use App\Roles;
use App\User;
use Spatie\Permission\Namecontrollers\Role;
use Spatie\Permission\Namecontrollers\Permission;
use Illuminate\Support\Facades\Auth;

class ProductoImagenController extends Controller {
	public function __construct(){
		$this->middleware('auth');
	}

	protected $rules =
	[
          'input_archivo' => 'required|min:1|max:2550',
	   			'orden' => 'required|min:1|max:255',
	   			'producto_id' => 'required|min:1|max:255',

    //regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/

	];

	public function index(){
		return view('ProductoImagen.index', [] );
  }
  public function consulta(Request $request){
    $consulta_data=$request->get("consulta_data");
    if($consulta_data==""){
      $data=ProductoImagenModel::paginate(20);
    }else{
      $data=ProductoImagenModel::where("id",1)
      ->orwhere("id","like","%". $consulta_data."%")
        ->orwhere("nombre","like","%". $consulta_data."%")
        ->orwhere("orden","like","%". $consulta_data."%")
        ->orwhere("producto_id","like","%". $consulta_data."%")
        ->orwhere("subido_por","like","%". $consulta_data."%")
        ->orwhere("created_at","like","%". $consulta_data."%")
        ->orwhere("updated_at","like","%". $consulta_data."%")

      ->paginate(20);
    }

    return response()->json($data);
  }
    public function consulta_por(Request $request,$producto_id){
        $consulta_data=$request->get("consulta_data");
        if($consulta_data==""){
        $data=ProductoImagenModel::where('producto_id',$producto_id)->paginate(20);
        }else{
        $data=ProductoImagenModel::where("id",1)
        ->orwhere("id","like","%". $consulta_data."%")
            ->orwhere("nombre","like","%". $consulta_data."%")
            ->orwhere("orden","like","%". $consulta_data."%")
            ->orwhere("producto_id","like","%". $consulta_data."%")
            ->orwhere("subido_por","like","%". $consulta_data."%")
            ->orwhere("created_at","like","%". $consulta_data."%")
            ->orwhere("updated_at","like","%". $consulta_data."%")

        ->paginate(20);
        }

        return response()->json($data);
    }
	public function create(){
    $data_foraneos = [
      "producto_id" => ProductoImagenModel::select("id","id as nombre","id as text")->get(),

      //"departamento_id" => DepartamentoModel::select("id_departamento as id","departamento as text")->get(),
		];
		return response()->json($data_foraneos);

  }

	public function store(Request $request){
    
    
    $validator = Validator::make($request->all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {


            $file2 = $request->file('input_archivo');
                    if (isset($file2)) {
                        $nombre=\Storage::disk('public')->put('',$request->file('input_archivo'));
            }


            $ProductoImagen = new ProductoImagenModel();

			$ProductoImagen->nombre=$nombre;
			$ProductoImagen->color_p=$request->color_p;
			$ProductoImagen->color_s=$request->color_s;
			$ProductoImagen->orden=$request->orden;
			$ProductoImagen->producto_id=$request->producto_id;
			$ProductoImagen->subido_por = auth()->user()->id;
			$ProductoImagen->save();
			return response()->json($ProductoImagen);
		}
	}
  public function show($id){
        return response()->json(ProductoImagenModel::findOrFail($id));
    }


  public function edit($id){}

    public function update(Request $request, $id){
      $rules=$this->rules;
      unset($rules['input_archivo']);
		$validator = Validator::make($request->all(), $rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {

      $ProductoImagen = ProductoImagenModel::findOrFail($id);


            $file2 = $request->file('input_archivo');
            if (isset($file2)) {
                $nombre=\Storage::disk('public')->put('',$request->file('input_archivo'));
                $ProductoImagen->nombre=$nombre;

              }
              if($request->color_p!='undefined'){
                $ProductoImagen->color_p=$request->color_p;
              } 
              if(!$request->color_s!='undefined'){
                $ProductoImagen->color_s=$request->color_s;
              
              }
			
          
				$ProductoImagen->orden=$request->orden;
				$ProductoImagen->producto_id=$request->producto_id;
				$ProductoImagen->subido_por=auth()->user()->id;
			    $ProductoImagen->save();
			return response()->json($ProductoImagen);
		}
	}

	public function destroy($id){
		$ProductoImagen = ProductoImagenModel::findOrFail($id);
		$ProductoImagen->delete();
		return response()->json($ProductoImagen);
	}

}


