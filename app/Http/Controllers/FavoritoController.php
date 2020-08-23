<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;

use App\FavoritoModel;
use View;
use App\ProductoModel;
use App\HasRoles;
use App\Roles;
use App\User;
use Spatie\Permission\Namecontrollers\Role;
use Spatie\Permission\Namecontrollers\Permission;

class FavoritoController extends Controller {
	public function __construct(){
		$this->middleware('auth');
	}

	protected $rules =
	[
    'id' => 'required|min:1|max:99999999',
	   			'id' => 'required|min:2|max:255',
          'users_id' => 'required|min:1|max:99999999',
	   			'users_id' => 'required|min:2|max:255',
          'producto_id' => 'required|min:1|max:99999999',
	   			'producto_id' => 'required|min:2|max:255',
          
    //regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/

	];

	public function index(){
		return view('Favorito.index', [] );
  }
  public function consulta(Request $request){
    $consulta_data=$request->get("consulta_data");
	
	if($consulta_data==""){
      $producto_id=FavoritoModel::where('users_id',auth()->user()->id)->pluck('producto_id');    //paginate(20);
	  $data=ProductoModel::with('productoimagenuno')->wherein('id',$producto_id)->get();

	}else{
    
    }

    return response()->json($data);
  }

    public function data_foraneos(){
        $data_foraneos = [
            //"users_id" => FavoritoModel::select("id","id as nombre","id as text")->get(),
        //"producto_id" => FavoritoModel::select("id","id as nombre","id as text")->get(),
        
            //"departamento_id" => DepartamentoModel::select("id_departamento as id","departamento as text")->get(),
            ];
            return response()->json($data_foraneos);

    }
	public function create(){
        return view("Favorito.index", [] );
    }

	public function store(Request $request){
		

      	
	}
  	public function show($id){
		$data=FavoritoModel::where('producto_id',$id)->where('users_id',auth()->user()->id)->get();
		//if($data){
			if(count($data) == 0){ 
			$Favorito = new FavoritoModel();
			$Favorito->users_id=auth()->user()->id;
			$Favorito->producto_id=$id;
			$Favorito->save();
		
		}else{
			$Favorito = FavoritoModel::where('producto_id',$id)->delete();

		}
		return response()->json($Favorito);
		
    }


    public function edit($id){
        return view("Favorito.index", [] );

    }

    public function update(Request $request, $id){
		

			$Favorito = FavoritoModel::findOrFail($id);
			$Favorito->users_id=$request->users_id;
			$Favorito->producto_id=$request->producto_id;
			$Favorito->save();
			return response()->json($Favorito);
		
	}

	public function destroy($id){
		$Favorito = FavoritoModel::findOrFail($id);
		$Favorito->delete();
		return response()->json($Favorito);
	}

}


