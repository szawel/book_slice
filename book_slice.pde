// program napisany na potrzeby projektu książki patterns of europe	 | kilku.com |

// zmienne przesuwania i skalownaia przestrzenią roboczą
float zoom;
PVector offset;
PVector poffset;
PVector mouse;
boolean drag = false;

void setup(){
	println("el mundo es loco");


// ustawianie początkowe przesztzreni roboczej wycentrowane bez skalowania
	zoom = 1.0;
	offset = new PVector((displayWidth-250)/2,500);
	poffset = new PVector(0, 0);
}


void draw(){
	background(255);

	// sklalowanie przesuwanie przestrzenią roboczą [ START ]
	pushMatrix();
	scale(zoom);
	translate(offset.x/zoom, offset.y/zoom);


	popMatrix();
// sklalowanie przesuwanie przestrzenią roboczą [ STOP ]


}




/*
to do

prosty intulicyjny interface

*/