<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;
    use OwenIt\Auditing\Contracts\Auditable;

	class Producto_has_CategoriaModel extends Model implements Auditable {
        use \OwenIt\Auditing\Auditable;
		protected $table = 'producto_has_categoria';
    protected $fillable = [];
    public $timestamps = false;
    
    public function nombre_categoria(){
      return $this->belongsTo('App\CategoriaModel', 'categoria_id');
    }/*
    public function cartera_lista_all(){
      return $this->HasMany('App\Cartera_ListaModel', 'cartera_sam_id');
    }
    */
	}