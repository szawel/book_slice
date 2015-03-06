void border(){
	float w = shape_cut_width;
	float h = shape_cut_height;
	float sep = 50;
	stroke(255,0,0);
	noFill();

	textAlign(CENTER);
	textSize(12);
	rect(0, 0, w, h);
	line(0,-sep,w,-sep);
	text(w,w/2,-sep-5);
	line(-sep,0,-sep,h);
	pushMatrix();
	rotate(-PI/2);
	translate(-h/2,0);
	text(h,0,-sep-5);
	popMatrix();
}