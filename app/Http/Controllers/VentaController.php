<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;
use Carbon\Carbon;
use App\VentaModel;
use App\Carrito_CompraModel;
use App\Producto_VentaModel;
use View;
use App\HasRoles;
use App\Roles;
use App\User;
use Spatie\Permission\Namecontrollers\Role;
use Spatie\Permission\Namecontrollers\Permission;

class VentaController extends Controller {
	public function __construct(){
		$this->middleware('auth');
	}

	protected $rules =
	[
    'id' => 'required|min:1|max:99999999',
	   			'id' => 'required|min:2|max:255',
          'users_id' => 'required|min:1|max:99999999',
	   			'users_id' => 'required|min:2|max:255',
          'created_at' => 'required|min:2|max:255',
          'updated_at' => 'required|min:2|max:255',
          'estado_venta_id' => 'required|min:1|max:99999999',
	   			'estado_venta_id' => 'required|min:2|max:255',
          
    //regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/

	];

	public function index(){
		return view('Venta.index', [] );
  }
  public function consulta(Request $request){
    $consulta_data=$request->get("consulta_data");
    if($consulta_data==""){
      $data=VentaModel::paginate(20);
    }else{
      $data=VentaModel::where("id",1)
      ->orwhere("id","like","%". $consulta_data."%")
        ->orwhere("users_id","like","%". $consulta_data."%")
        ->orwhere("created_at","like","%". $consulta_data."%")
        ->orwhere("updated_at","like","%". $consulta_data."%")
        ->orwhere("estado_venta_id","like","%". $consulta_data."%")
        
      ->paginate(20);
    }

    return response()->json($data);
  }

    public function data_foraneos(){
        $data_foraneos = [
            "users_id" => VentaModel::select("id","id as nombre","id as text")->get(),
        "estado_venta_id" => VentaModel::select("id","id as nombre","id as text")->get(),
        
            //"departamento_id" => DepartamentoModel::select("id_departamento as id","departamento as text")->get(),
            ];
            return response()->json($data_foraneos);

    }
	public function create(){
        return view("Venta.index", [] );
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

      		$Venta = new VentaModel();

			$Venta->users_id=$request->users_id;
			$Venta->created_at=$request->created_at;
			$Venta->updated_at=$request->updated_at;
			$Venta->estado_venta_id=$request->estado_venta_id;
				
			$Venta->save();
			return response()->json($Venta);
		}
	}
  public function show($id){
        return response()->json(VentaModel::findOrFail($id));
    }


    public function edit($id){
        return view("Venta.index", [] );

    }

    public function update(Request $request, $id){
		$validator = Validator::make($request->all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {
			$Venta = VentaModel::findOrFail($id);

			$Venta->users_id=$request->users_id;
			$Venta->estado_venta_id=$request->estado_venta_id;
				

			$Venta->save();
			return response()->json($Venta);
		}
	}

	public function destroy($id){
		$Venta = VentaModel::findOrFail($id);
		$Venta->delete();
		return response()->json($Venta);
	}
	public function venta_procesar_funcion(){
		
		$today = Carbon::now();
		$fecha_hoy=$today->format('Y-m-d');
		//echo $fecha_hoy;

		$venta = VentaModel::where('estado_venta_id',1)->where('users_id',auth()->user()->id )->get()->first();
		if($venta){

			$venta_id=$venta->id;
			
				
			}else{
				$Venta = new VentaModel();
				$Venta->users_id=auth()->user()->id;
				$Venta->estado_venta_id=1;
				$Venta->fecha=$fecha_hoy;
				$Venta->save();
				$venta_id=$Venta->id;
				$carrito_compra = Carrito_CompraModel::with('producto_id')->where('users_id',auth()->user()->id )->get()->toarray();
				//var_dump($carrito_compra);
				$valor_total=0;
				foreach($carrito_compra as $key => $va) {
					//$va['producto_id']['id'];
					$Producto_Venta = new Producto_VentaModel();
					$Producto_Venta->producto_id=$va['producto_id']['id'];
					$Producto_Venta->venta_id=$venta_id;
					$Producto_Venta->cantidad=$va['cantidad'];
					$Producto_Venta->precio=$va['producto_id']['precio'];
					$Producto_Venta->is_iva=$va['producto_id']['is_iva'];
					$Producto_Venta->precio_iva=$va['producto_id']['iva'];
					$Producto_Venta->save();
				}
				Carrito_CompraModel::with('producto_id')->where('users_id',auth()->user()->id )->delete();
					
			}

			$producto_data = Producto_VentaModel::with('producto_id')->where('venta_id',$venta_id)->get();
			$valor_total = 0;
			foreach ($producto_data as $key => $data) {
				$valor_total = $valor_total+($data['precio']*$data['cantidad']);
			}


		$datas = [
		  'producto'=>$producto_data,
		  'valor_total'=>$valor_total,
		];

	
		return response()->json($datas);
	}

	

}


