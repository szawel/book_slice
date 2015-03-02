class Line {
	PVector start, end; // poczatek i koniec linie

	Line(PVector _start, PVector _end) {
		start = _start;
		end = _end;
	}

	void set_start(PVector _start){
		start = _start;
	}

	void set_end(PVector _end){
		end = _end;

	}

	PVector get_start() {
		return start;
	}

	PVector get_end() {
		return end;
	}

	void draw(){
		// stroke(0);
		// strokeWeight(1);
		line(start.x,start.y,end.x,end.y);
	}
	PVector intersects_at(Line other) {
	return line_itersection(this, other);
}
}


// funkcja zwraca random cordynaty w PVetocr w granicach wielkośc okna projektui 
PVector random_bounded_vector() {
  return new PVector(random(width), random(height));
}


// funkcja wyznacza punk przeciecia dwuch lini
PVector line_itersection(Line one, Line two) {
	float x1 = one.get_start().x;
	float y1 = one.get_start().y;
	float x2 = one.get_end().x;
	float y2 = one.get_end().y;

	float x3 = two.get_start().x;
	float y3 = two.get_start().y;
	float x4 = two.get_end().x;
	float y4 = two.get_end().y;


	// distans / długośc linie 
	float bx = x2 - x1;			
	float by = y2 - y1;
	float dx = x4 - x3;
	float dy = y4 - y3;

	// sprawdz czy linia to linia
	float b_dot_d_perp = bx * dy - by *dx;
	if(b_dot_d_perp == 0) return null;



	float cx = x3 - x1;
	float cy = y3 - y1;
	
	float t = (cx * dy - cy * dx) / b_dot_d_perp;
    if(t < 0 || t > 1) return null;
    
    float u = (cx * by - cy * bx) / b_dot_d_perp;
    if(u < 0 || u > 1) return null;

    return new PVector(x1+t*bx, y1+t*by);
    // return PVector(x1+t*bx, y1+t*by);

}