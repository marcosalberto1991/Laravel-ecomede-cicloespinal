<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Validator;
use Response;

use App\BlogModel;
use View;
use App\HasRoles;
use App\Roles;
use App\User;
use Spatie\Permission\Namecontrollers\Role;
use Spatie\Permission\Namecontrollers\Permission;

class BlogController extends Controller {
	public function __construct(){
		$this->middleware('auth');
	}

	protected $rules =
	[
  
		'fecha' => 'required|min:2|max:255',
		'tiulo' => 'required|min:2|max:255',
		'imagen' => '',
		'descricion' => 'required|min:2',
		'categoria' => 'min:2|max:255',
		'tag' => 'min:2|max:255',
	   			
    //regex:/^([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-])+((\s*)+([0-9a-zA-ZñÑáéíóúÁÉÍÓÚ.,()_-]*)*)+$/

	];

	public function index(){
		return view('Blog.index', [] );
  }
  public function consulta(Request $request){
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

    public function data_foraneos(){
        $data_foraneos = [
            "users_id" => BlogModel::select("id","id as nombre","id as text")->get(),
        
            //"departamento_id" => DepartamentoModel::select("id_departamento as id","departamento as text")->get(),
            ];
            return response()->json($data_foraneos);

    }
	public function create(){
        return view("Blog.index", [] );
    }

	public function store(Request $request){
		$validator = Validator::make($request->all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {

		$nombre='';
      	$file2 = $request->file('imagen');
        if (isset($file2)) {
            $nombre=\Storage::disk('public')->put('',$request->file('imagen'));
        }
      

      	$Blog = new BlogModel();

		$Blog->fecha=$request->fecha;
		$Blog->tiulo=$request->tiulo;
		$Blog->imagen=$nombre;
		$Blog->descricion=$request->descricion;
		$Blog->users_id=auth()->user()->id;
				
		$Blog->categoria=$request->categoria;
		$Blog->tag=$request->tag;
				
		$Blog->save();
		return response()->json($Blog);
		}
	}
  public function show($id){
        return response()->json(BlogModel::findOrFail($id));
    }


    public function edit($id){
        return view("Blog.index", [] );

    }

    public function update(Request $request, $id){
		$validator = Validator::make($request->all(), $this->rules);
		if ($validator->fails()) {
			return Response::json(array('errors' => $validator->getMessageBag()->toArray()));
		} else {
			$Blog = BlogModel::findOrFail($id);

			
			$file2 = $request->file('imagen');
			if (isset($file2)) {
				$nombre=\Storage::disk('public')->put('',$request->file('imagen'));
				$Blog->imagen=$nombre;
			}
			$Blog->fecha=$request->fecha;
			$Blog->tiulo=$request->tiulo;
			$Blog->descricion=$request->descricion;
			//$Blog->users_id=$request->users_id;
			$Blog->categoria=$request->categoria;
			$Blog->tag=$request->tag;

			$Blog->save();
			return response()->json($Blog);
		}
	}

	public function destroy($id){
		$Blog = BlogModel::with('users_id')->findOrFail($id);
		$Blog->delete();
		return response()->json($Blog);
	}

}


