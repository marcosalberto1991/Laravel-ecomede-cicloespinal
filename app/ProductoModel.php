<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;
    use OwenIt\Auditing\Contracts\Auditable;

	class ProductoModel extends Model implements Auditable {
        use \OwenIt\Auditing\Auditable;
		protected $table = 'producto';
    protected $fillable = [];
    //public $timestamps = false;

    public function productoimagenuno(){
      return $this->hasOne('App\ProductoImagenModel', 'producto_id');
      //return $this->belongsTo('App\ProductoImagenModel', 'producto_id');
    }
    public function estado_id(){
      return $this->belongsTo('App\EstadoModel', 'estado_id');
    }
    public function favorito_id(){
      return $this->belongsTo('App\FavoritoModel', 'producto_id');
    }
    
    
    public function categoria_id(){
      return $this->HasMany('App\Producto_has_CategoriaModel', 'producto_id');
    }
    
	}
