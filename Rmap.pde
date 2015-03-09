class Rmap{

	PVector out[];
	PVector line_cor_norm[];

	float omin;
	float omax;

	Rmap(PVector[] _pos, PVector[] _line_cor, float _old_min, float _old_max ){
		out = new PVector[_pos.length];
		line_cor_norm = new PVector[_pos.length];

		omin = _old_min;
		omax = _old_max;

		for ( int i = 0; i < _pos.length; i++){
			line_cor_norm[i] = new PVector( map( _pos[i].x, omin, omax, 0, 1), map( _pos[i].y, omin, omax, 0, 1) );
		}

		for ( int  i = 0; i < _pos.length; i++ ){
			out[i]	= new PVector( lerp( _line_cor[0].x, _line_cor[1].x, line_cor_norm[i].y), lerp( _line_cor[0].y, _line_cor[1].y, line_cor_norm[i].y ));	
			ellipse(out[i].x,out[i].y, 5,5);
		}

	}
}