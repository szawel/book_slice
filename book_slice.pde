// program napisany na potrzeby projektu książki patterns of europe	 | kilku.com |

//biblioteki zewnetrzne
import geomerative.*;
RShape grp;
RPoint[][] pointPaths;

Line slider;
Line constract[];

Stamp stamp;
// zmienne przesuwania i skalownaia przestrzenią roboczą
float zoom;
PVector offset;
PVector poffset;
PVector mouse;
boolean drag = false;

void setup(){
	size(displayWidth,displayHeight);
	RG.init(this);
	RG.ignoreStyles(false);
	RG.setPolygonizer(RG.ADAPTATIVE);
	grp = RG.loadShape("shape.svg");
	// println("aaa");
	grp.centerIn(g, 0, 0, 0);
	pointPaths = grp.getPointsInPaths();

	constract = new Line[pointPaths.length];


// ustawianie początkowe przesztzreni roboczej wycentrowane bez skalowania
	zoom = 1.0;
	offset = new PVector((displayWidth-250)/2,500);
	poffset = new PVector(0, 0);
}


void draw(){
	background(255);

	slider = new Line( new PVector(mouseX,-100), new PVector(mouseX,9200));
	slider.draw();




	// sklalowanie przesuwanie przestrzenią roboczą [ START ]
	pushMatrix();
	scale(zoom);
	translate(offset.x/zoom, offset.y/zoom);
	// grid();
	strokeWeight(0.1);
	textSize(5);
	smooth();

	stamp = new Stamp(pointPaths);

	for ( int i = 0; i < pointPaths.length; i++){
		if (pointPaths[i] != null){
			for ( int j = 0; j < pointPaths[i].length; j++){
				// text("i- " + i + " j- " + j ,pointPaths[i][j].x,pointPaths[i][j].y);	
				// ellipse(pointPaths[i][j].x,pointPaths[i][j].y, 1, 1);
			}
		}
	}

	for(int i = 0; i < pointPaths.length; i++){
		constract[i] = new Line ( new PVector(pointPaths[i][0].x,pointPaths[i][0].y), new PVector(pointPaths[i][1].x,pointPaths[i][1].y));
		constract[i].draw();
		// for( int j = 0; j < (pointPaths[i].length-1); j++){
		// }
	}
	
	noFill();
	for( int i = 0; i < pointPaths.length; i++){
		PVector intersection = slider.intersects_at(constract[i]);
		// for( int j = 0; j < pointPaths[i].length; j++){
			if( intersection != null){
				ellipse(intersection.x, intersection.y, 5, 5);
				point(intersection.x, intersection.y);
			 }
		// }
	}


	popMatrix();
// sklalowanie przesuwanie przestrzenią roboczą [ STOP ]
	info_top();
	info_bootom();
}


class Stamp {
	RPoint  in[][];

	Stamp(RPoint[][] _in){
		in = _in;
		println( " in - " + in.length);
	}
}
