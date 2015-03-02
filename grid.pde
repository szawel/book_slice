void grid(){
	float x;
	float y;
	int sep = 20;
	int n = 500;
	strokeWeight(0.1);
	for ( int i = 0; i < ((n+1)/sep); i++){
		x = i * sep;
		y = i * sep;
		line(0,y,n,y);
		line(x,0,x,n);
	}
	x = 0;
	for(int i = 0; i < (n/(sep*2)); i++){
		x = i * (sep*2);
		text(int(x),x,-5);
		text(int(x),-30,x);
	}	
}