// program napisany na potrzeby projektu książki patterns of europe | kilku.com |

// [ external liberys ]

import geomerative.*;
import controlP5.*;

//	[ declare class ] 

RShape grp;							//	declare class to  import *.svg							
RPoint[][] pointPaths;	//	declare class array to store point coordinate
Line slider;						//	declare class draw and stor slider line
Line constract[];				//	declare class draw and stor importet line

ControlP5 cp5;

Gui gui;



//	[ declare variables ] 

//	zmienne przesuwania i skalownaia przestrzenią roboczą
float zoom;
PVector offset;
PVector poffset;
PVector mouse;
boolean drag = false;

// zmienne 

float shape_cut_width  = 200;
float shape_cut_height  = 200;
int page_nr = 200;
float page_clip = 0;


void setup(){

	// GUI CP5
	noStroke();
	cp5 = new ControlP5(this);
	gui = new Gui();

	size(displayWidth,displayHeight);
	
		

// opcje biblioteki geomerative / init libery / ignor style / poigon interpretation / file to import
	RG.init(this);
	RG.ignoreStyles(false);
	RG.setPolygonizer(RG.ADAPTATIVE);
	grp = RG.loadShape("shape.svg");

	pointPaths = grp.getPointsInPaths();

	constract = new Line[pointPaths.length];



// init workscpace setup 
	zoom = 1.0;
	offset = new PVector((displayWidth-250)/2,500);
	poffset = new PVector(0, 0);
}


void draw(){
	background(255);

	float clip_pos = lerp(0,((shape_cut_width/page_nr)*page_nr),page_clip);

	slider = new Line( new PVector(clip_pos,0), new PVector(clip_pos,shape_cut_height));
	slider.draw();


//	sklalowanie przesuwanie przestrzenią roboczą [ START ]
	pushMatrix();
	scale(zoom);
	translate(offset.x/zoom, offset.y/zoom);

//	opcje podgladu 
	strokeWeight(0.5);
	stroke(0);
	textSize(5);
	smooth();


	for(int i = 0; i < pointPaths.length; i++){
		constract[i] = new Line ( new PVector(pointPaths[i][0].x,pointPaths[i][0].y), new PVector(pointPaths[i][1].x,pointPaths[i][1].y));
		constract[i].draw();
	}

	noFill();
	for( int i = 0; i < pointPaths.length; i++){
		PVector intersection = slider.intersects_at(constract[i]);
			if( intersection != null){
				ellipse(intersection.x, intersection.y, 5, 5);
				point(intersection.x, intersection.y);
				text(i,intersection.x+10, intersection.y);
			 }
	}


	border();
	popMatrix();
// sklalowanie przesuwanie przestrzenią roboczą [ STOP ]
	info_top();
	info_bootom();
}

