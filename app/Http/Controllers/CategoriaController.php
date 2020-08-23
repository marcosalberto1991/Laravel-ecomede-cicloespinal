<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;

use App\CategoriaModel;
use View;
use App\HasRoles;
use App\Roles;
use App\User;
use Spatie\Permission\Namecontrollers\Role;
use Spatie\Permission\Namecontrollers\Permission;

class CategoriaController extends Controller {
	public function __construct(){
		$this->middleware('auth');
	}

	protected $rules =
	[
  
          'nombre' => 'required|min:2|max:255',
	   			'class' => 'required|min:2|max:255',
	   			
    //regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/

	];

	public function index(){
		return view('Categoria.index', [] );
  }
  public function consulta(Request $request){
    $consulta_data=$request->get("consulta_data");
    if($consulta_data==""){
      $data=CategoriaModel::paginate(20);
    }else{
      $data=CategoriaModel::where("id",1)
      ->orwhere("id","like","%". $consulta_data."%")
        ->orwhere("nombre","like","%". $consulta_data."%")
        ->orwhere("class","like","%". $consulta_data."%")
        
      ->paginate(20);
    }

    return response()->json($data);
  }

    public function data_foraneos(){
        $data_foraneos = [
            
            //"departamento_id" => DepartamentoModel::select("id_departamento as id","departamento as text")->get(),
            ];
            return response()->json($data_foraneos);
          
    }
	public function create(){
        return view("Categoria.index", [] );
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

      $Categoria = new CategoriaModel();

			 $Categoria->nombre=$request->nombre;
				 $Categoria->class=$request->class;
				
			$Categoria->save();
			return response()->json($Categoria);
		}
	}
  public function show($id){
        return response()->json(CategoriaModel::findOrFail($id));
    }


    public function edit($id){
        return view("Categoria.index", [] );

    }

    public function update(Request $request, $id){
		$validator = Validator::make($request->all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {
			$Categoria = CategoriaModel::findOrFail($id);

			 $Categoria->nombre=$request->nombre;
				 $Categoria->class=$request->class;
				

			$Categoria->save();
			return response()->json($Categoria);
		}
	}

	public function destroy($id){
		$Categoria = CategoriaModel::findOrFail($id);
		$Categoria->delete();
		return response()->json($Categoria);
	}

}


