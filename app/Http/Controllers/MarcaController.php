<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;

use App\MarcaModel;
use View;
use App\HasRoles;
use App\Roles;
use App\User;
use Spatie\Permission\Namecontrollers\Role;
use Spatie\Permission\Namecontrollers\Permission;

class MarcaController extends Controller {
	public function __construct(){
		$this->middleware('auth');
	}

	protected $rules =
	[
    'id' => 'required|min:0|max:99999999',
    'nombre' => 'required|min:2|max:255',
	'logo' => 'required|min:2|max:255',

    //regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/

	];

	public function index(){
		return view('Marca.index', [] );
  }
  public function consulta(Request $request){
    $consulta_data=$request->get("consulta_data");
    if($consulta_data==""){
      $data=MarcaModel::paginate(20);
    }else{
      $data=MarcaModel::where("id",1)
      ->orwhere("id","like","%". $consulta_data."%")
        ->orwhere("nombre","like","%". $consulta_data."%")
        ->orwhere("logo","like","%". $consulta_data."%")

      ->paginate(20);
    }

    return response()->json($data);
  }
	public function create(){
        //{id: ["The id field is required."], nombre:

        return view('Marca.form', ["id"=>'{}'] );
    

    //    $data_foraneos = [

      //"departamento_id" => DepartamentoModel::select("id_departamento as id","departamento as text")->get(),
	//	];
	//	return response()->json($data_foraneos);

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

            $Marca = new MarcaModel();
		    $Marca->nombre=$request->nombre;
			$Marca->logo=$request->logo;
			$Marca->save();
			return response()->json($Marca);
		}
	}
  public function show($id){
        return response()->json(MarcaModel::findOrFail($id));
    }


    public function edit($id){
        //return response()->json(MarcaModel::findOrFail($id));
        return view('Marca.form', ["id"=>MarcaModel::findOrFail($id)] );
    }

    public function update(Request $request, $id){
		$validator = Validator::make($request->all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {
			$Marca = MarcaModel::findOrFail($id);

			 $Marca->nombre=$request->nombre;
				 $Marca->logo=$request->logo;


			$Marca->save();
			return response()->json($Marca);
		}
	}

	public function destroy($id){
		$Marca = MarcaModel::findOrFail($id);
		$Marca->delete();
		return response()->json($Marca);
	}

}


