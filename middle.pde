// clas to display middle proces of shape generatio

class Middle{
	float x;
	float sep;
	color fc;



	Middle(ArrayList<Float> in, float ofset){

		
		
		// display points and point nr
		noStroke();
		fill(0);

		x = ofset;
		for ( int i = 0; i < in.size(); i++ ){
			ellipse(x, in.get(i), 3, 3);
			text(i,x+5, in.get(i)+5);
		}

		// display line representation of groops ( groops two points)
		strokeWeight(1);
		stroke(0); 
		noFill();	

		x = ofset+20;
		for ( int i = 0; i < ( in.size()-1 ); i+=2 ){
			line(x,in.get(i),x,in.get(i+1));
		}

	// display shape representation of groops ( groops two points)
		noStroke(); 
		fill(0);	

		x = ofset+40;
		sep = 20;
		for ( int i = 0; i < ( in.size()-1 ); i+=2 ){
		beginShape();
		vertex(x,in.get(i));
		vertex(x+sep,in.get(i));
		vertex(x+sep,in.get(i+1));
		vertex(x,in.get(i+1));
		endShape(CLOSE);
		}
	}


	Middle(ArrayList<Float> in, float ofset,color color_in){

		
		
		// display points and point nr
		noStroke();
		fill(color_in);

		x = ofset;
		for ( int i = 0; i < in.size(); i++ ){
			ellipse(x, in.get(i), 3, 3);
			text(i,x+5, in.get(i)+5);
		}

		// display line representation of groops ( groops two points)
		strokeWeight(1);
		stroke(color_in); 
		noFill();	

		x = ofset+20;
		for ( int i = 0; i < ( in.size()-1 ); i+=2 ){
			line(x,in.get(i),x,in.get(i+1));
		}

	// display shape representation of groops ( groops two points)
		noStroke(); 
		fill(color_in);	

		x = ofset+40;
		sep = 20;
		for ( int i = 0; i < ( in.size()-1 ); i+=2 ){
		beginShape();
		vertex(x,in.get(i));
		vertex(x+sep,in.get(i));
		vertex(x+sep,in.get(i+1));
		vertex(x,in.get(i+1));
		endShape(CLOSE);
		}
	}

}

