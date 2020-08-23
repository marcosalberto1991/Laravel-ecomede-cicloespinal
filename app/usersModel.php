<?php
	namespace App;

	use Illuminate\Database\Eloquent\Model;
    use OwenIt\Auditing\Contracts\Auditable;

	class usersModel extends Model implements Auditable {
        use \OwenIt\Auditing\Auditable;
		protected $table = 'Cliente';
		protected $fillable = [];

		
		public function municipios_id() {
        	return $this->belongsTo('App\MunicipiosModel', 'municipios_id');
		}
		public function lista_precio_id() {
        	return $this->belongsTo('App\Lista_PrecioModel', 'lista_precio_id');
		}
		
	}