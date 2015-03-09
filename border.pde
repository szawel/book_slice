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

	stroke(255,150,0);
	rect(-110, 0, 20, page_width);
	rect(-110, page_width, 20, page_hight);
	rect(-110, ( page_width + page_hight ), 20, page_width);

	line(-110,page_width,shape_cut_width,page_width);
	line(-110,page_width+page_hight,shape_cut_width,page_width+page_hight);


	pushMatrix();
	rotate(-PI/2);
	translate(-(page_width/2),-95);
	text("top",0,0);
	popMatrix();

	pushMatrix();
	rotate(-PI/2);
	translate( -(page_width + ( page_hight / 2)),-95);
	text("side",0,0);
	popMatrix();

	pushMatrix();
	rotate(-PI/2);
	translate( -((page_width + page_hight) + ( page_width / 2)),-95);
	text("bootom",0,0);
	popMatrix();
}	