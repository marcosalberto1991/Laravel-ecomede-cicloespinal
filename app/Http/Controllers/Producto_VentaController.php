<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;

use App\Producto_VentaModel;
use View;
use App\HasRoles;
use App\Roles;
use App\User;
use Spatie\Permission\Namecontrollers\Role;
use Spatie\Permission\Namecontrollers\Permission;

class Producto_VentaController extends Controller {
	public function __construct(){
		$this->middleware('auth');
	}

	protected $rules =
	[
    'id' => 'required|min:2|max:255',
	   			'producto_id' => 'required|min:1|max:99999999',
	   			'producto_id' => 'required|min:2|max:255',
          'venta_id' => 'required|min:1|max:99999999',
	   			'venta_id' => 'required|min:2|max:255',
          'cantidad' => 'required|min:2|max:255',
	   			'precio' => 'required|min:1|max:99999999',
	   			'precio' => 'required|min:2|max:255',
          'is_iva' => 'required|min:1|max:99999999',
	   			'is_iva' => 'required|min:2|max:255',
          'precio_iva' => 'required|min:1|max:99999999',
	   			'precio_iva' => 'required|min:2|max:255',
          'created_at' => 'required|min:2|max:255',
          'updated_at' => 'required|min:2|max:255',
          
    //regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/

	];

	public function index(){
		return view('Producto_Venta.index', [] );
  }
  public function consulta(Request $request){
    $consulta_data=$request->get("consulta_data");
    if($consulta_data==""){
      $data=Producto_VentaModel::paginate(20);
    }else{
      $data=Producto_VentaModel::where("id",1)
      ->orwhere("id","like","%". $consulta_data."%")
        ->orwhere("producto_id","like","%". $consulta_data."%")
        ->orwhere("venta_id","like","%". $consulta_data."%")
        ->orwhere("cantidad","like","%". $consulta_data."%")
        ->orwhere("precio","like","%". $consulta_data."%")
        ->orwhere("is_iva","like","%". $consulta_data."%")
        ->orwhere("precio_iva","like","%". $consulta_data."%")
        ->orwhere("created_at","like","%". $consulta_data."%")
        ->orwhere("updated_at","like","%". $consulta_data."%")
        
      ->paginate(20);
    }

    return response()->json($data);
  }

    public function data_foraneos(){
        $data_foraneos = [
            "producto_id" => Producto_VentaModel::select("id","id as nombre","id as text")->get(),
        "venta_id" => Producto_VentaModel::select("id","id as nombre","id as text")->get(),
        
            //"departamento_id" => DepartamentoModel::select("id_departamento as id","departamento as text")->get(),
            ];
            return response()->json($data_foraneos);

    }
	public function create(){
        return view("Producto_Venta.index", [] );
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

      $Producto_Venta = new Producto_VentaModel();

			 $Producto_Venta->producto_id=$request->producto_id;
				 $Producto_Venta->venta_id=$request->venta_id;
				 $Producto_Venta->cantidad=$request->cantidad;
				 $Producto_Venta->precio=$request->precio;
				 $Producto_Venta->is_iva=$request->is_iva;
				 $Producto_Venta->precio_iva=$request->precio_iva;
				 $Producto_Venta->created_at=$request->created_at;
				 $Producto_Venta->updated_at=$request->updated_at;
				
			$Producto_Venta->save();
			return response()->json($Producto_Venta);
		}
	}
  public function show($id){
        return response()->json(Producto_VentaModel::findOrFail($id));
    }


    public function edit($id){
        return view("Producto_Venta.index", [] );

    }

    public function update(Request $request, $id){
		$validator = Validator::make($request->all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {
			$Producto_Venta = Producto_VentaModel::findOrFail($id);

			 $Producto_Venta->producto_id=$request->producto_id;
				 $Producto_Venta->venta_id=$request->venta_id;
				 $Producto_Venta->cantidad=$request->cantidad;
				 $Producto_Venta->precio=$request->precio;
				 $Producto_Venta->is_iva=$request->is_iva;
				 $Producto_Venta->precio_iva=$request->precio_iva;
				 $Producto_Venta->created_at=$request->created_at;
				 $Producto_Venta->updated_at=$request->updated_at;
				

			$Producto_Venta->save();
			return response()->json($Producto_Venta);
		}
	}

	public function destroy($id){
		$Producto_Venta = Producto_VentaModel::findOrFail($id);
		$Producto_Venta->delete();
		return response()->json($Producto_Venta);
	}

}


