<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;
    use OwenIt\Auditing\Contracts\Auditable;

	class Producto_VentaModel extends Model implements Auditable {
        use \OwenIt\Auditing\Auditable;
		protected $table = 'producto_has_venta';
    protected $fillable = [];
    //public $timestamps = false;
    
    public function producto_id(){
      return $this->belongsTo('App\ProductoModel', 'producto_id');
    }
    /*
    public function cartera_lista_all(){
      return $this->HasMany('App\Cartera_ListaModel', 'cartera_sam_id');
    }
    */
	}