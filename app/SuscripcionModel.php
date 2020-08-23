<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;
    use OwenIt\Auditing\Contracts\Auditable;

	class SuscripcionModel extends Model implements Auditable {
        use \OwenIt\Auditing\Auditable;
		protected $table = 'suscripcion';
    protected $fillable = [];
    //public $timestamps = false;
    
    /*
    public function cartera_lista_all(){
      return $this->HasMany('App\Cartera_ListaModel', 'cartera_sam_id');
    }
    */
	}