<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;

use App\ProductoImagenModel;
use App\Carrito_CompraModel;
use View;
use App\HasRoles;
use App\Roles;
use App\User;
use Spatie\Permission\Namecontrollers\Role;
use Spatie\Permission\Namecontrollers\Permission;
use Illuminate\Support\Facades\Auth;

class Carrito_CompraController extends Controller {
	public function __construct(){
		//$this->middleware('auth');
	}

	protected $rules =
	[
          'producto_id' => 'required|min:1|max:99999999',
          'precio_comprado' => 'required|min:1|max:99999999',
          'cantidad' => 'required|min:1|max:99999999',
          'users_id' => 'required|min:1|max:99999999',

    //regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/

	];

	public function index(){
		return view('Carrito_Compra.index', [] );
  }
  public function consulta(Request $request){
    //$consulta_data=$request->get("consulta_data");
    //if($consulta_data==""){
      $data=Carrito_CompraModel::with('producto_id.productoimagenuno','producto_imagen_pk')
      //->select(DB::raw("cantidad*valor_unitario*numeros_dias as valor")
      ->where('users_id',auth()->user()->id )->get()->toarray();
    //}
    $valor_total=0;
    foreach ($data as $key => $va) {
			$valor_total=$valor_total + $va['producto_id']['precio']*$va['cantidad'];
		}



    $datas = [
      'producto'=>$data,
      'valor_total'=>$valor_total,
    ];

    return response()->json($datas);
  }

    public function data_foraneos(){
        $data_foraneos = [
            "producto_id" => Carrito_CompraModel::select("id","id as nombre","id as text")->get(),
        "users_id" => Carrito_CompraModel::select("id","id as nombre","id as text")->get(),

            //"departamento_id" => DepartamentoModel::select("id_departamento as id","departamento as text")->get(),
            ];
            return response()->json($data_foraneos);

    }
	public function create(){
        return view("Carrito_Compra.index", [] );
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

      $Carrito_Compra = new Carrito_CompraModel();

			 $Carrito_Compra->producto_id=$request->producto_id;
				 $Carrito_Compra->precio_comprado=$request->precio_comprado;
				 $Carrito_Compra->cantidad=$request->cantidad;
				 $Carrito_Compra->users_id=$request->users_id;

			$Carrito_Compra->save();
			return response()->json($Carrito_Compra);
		}
	}
  public function show($id){
        return response()->json(Carrito_CompraModel::findOrFail($id));
    }


    public function edit($id){
        return view("Carrito_Compra.index", [] );

    }

    public function update(Request $request, $id){
		$validator = Validator::make($request->all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {
			$Carrito_Compra = Carrito_CompraModel::findOrFail($id);

			$Carrito_Compra->producto_id=$request->producto_id;
				 $Carrito_Compra->precio_comprado=$request->precio_comprado;
				 $Carrito_Compra->cantidad=$request->cantidad;
				 $Carrito_Compra->users_id=$request->users_id;


			$Carrito_Compra->save();
			return response()->json($Carrito_Compra);
		}
	}

	public function destroy($id){
		$Carrito_Compra = Carrito_CompraModel::findOrFail($id);
		$Carrito_Compra->delete();
		return response()->json($Carrito_Compra);
    }

    public function add_carrito(Request $request,$producto_id,$cantidad,$talla=0,$producto_imagen=0){
        
        if(!Auth::check()){
            //return redirect('/login');
		        return response()->json(false);

        }
        if($producto_imagen==0){
          $producto_imagen=ProductoImagenModel::where('producto_id',$producto_id)->get()->first();
          $producto_imagen=$producto_imagen->id;
        }


        $Carrito_Compra = new Carrito_CompraModel();
        
        
        $Carrito_Compra->talla=$talla;
        $Carrito_Compra->producto_imagen=$producto_imagen;
        $Carrito_Compra->producto_id=$producto_id;
		    $Carrito_Compra->precio_comprado=0;
		    $Carrito_Compra->cantidad=$cantidad;
        $Carrito_Compra->users_id=auth()->user()->id;
        $Carrito_Compra->save();
		return response()->json($Carrito_Compra);
    }

}


