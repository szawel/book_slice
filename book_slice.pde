// program napisany na potrzeby projektu książki patterns of europe | kilku.com |

// [ external liberys ]

import geomerative.*;
import controlP5.*;
import java.util.*;

//	[ declare class ] 

RShape load_shape;		//	declare class form geomerative external libery to import *.svg

//	declare class
Gui gui;


//	declare variables 
//	zmienne przesuwania i skalownaia przestrzenią roboczą
float zoom;
PVector offset;
PVector poffset;
PVector mouse;
boolean drag = false;

float shape_cut_width  = 200;
float shape_cut_height  = 500;
int page_nr = 200;
float page_clip = 0;

// 
ArrayList<Float> intersection;

void setup(){

	size(displayWidth,displayHeight);
	if (frame != null) {
		frame.setResizable(true);
  }

// gui
	noStroke();
	cp5 = new ControlP5(this);
	gui = new Gui();

// opcje biblioteki geomerative / init libery / ignor style / poigon interpretation / file to import
	RG.init(this);
	RG.setPolygonizer(RG.ADAPTATIVE);
	load_shape = RG.loadShape("shape.svg");
	RG.ignoreStyles();

// init workscpace setup 
	zoom = 1.0;
	offset = new PVector((displayWidth-250)/2,500);
	poffset = new PVector(0, 0);

}


void draw(){
	background(255);

	noFill();
	stroke(0);
	strokeWeight(0.5);
	smooth();


	intersection = new ArrayList<Float>();			// zaincjalizuj pust 'ArrayList'

	float clip_pos = lerp(0,((shape_cut_width/page_nr)*page_nr),page_clip);


//	sklalowanie przesuwanie przestrzenią roboczą [ START ]
	pushMatrix();
	scale(zoom);
	translate(offset.x/zoom, offset.y/zoom);

// display shape | imported *.svg
	RG.shape(load_shape);

	RShape cuttingLine = RG.getLine(clip_pos,0,clip_pos, shape_cut_height);
	RG.shape(cuttingLine);

	RPoint[] ps = load_shape.getIntersections(cuttingLine);
		if (ps != null) {
			for (int i=0; i<ps.length; i++) {
				ellipse(ps[i].x, ps[i].y, 5, 5);
				intersection.add(ps[i].y);
    }
  }

	
	border();
	popMatrix();
// sklalowanie przesuwanie przestrzenią roboczą [ STOP ]
	info_top();
	info_bootom();
}

