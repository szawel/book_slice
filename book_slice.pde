// program napisany na potrzeby projektu książki patterns of europe | kilku.com |

// [ external liberys ]

import geomerative.*;
import controlP5.*;
import java.util.*;

//	[ declare class ] 

RShape load_shape;		//	declare class form geomerative external libery to import *.svg

//	declare class
Gui gui;
Middle middle;


//	declare variables 
//	zmienne przesuwania i skalownaia przestrzenią roboczą
float zoom;
PVector offset;
PVector poffset;
PVector mouse;
boolean drag = false;

float shape_cut_width  = 200;
float shape_cut_height  = 800;
int page_nr = 200;
float page_clip = 0;

float clip_pos = 0;

int page_width = 200;
int page_hight = 400;

float pat_margin = 10;

Cut_point_Test cut_point_Test;

Float cut_point[];

// 
ArrayList<Float> intersection;
ArrayList<Float> part_top;
ArrayList<Float> part_middle;
ArrayList<Float> part_bottom;


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

	cut_point = new Float[2];

	cut_point[0] = float(page_width);
	cut_point[1] = float( page_width + page_hight );

	noFill();
	stroke(0);
	strokeWeight(0.5);
	smooth();



	intersection = new ArrayList<Float>();			// zaincjalizuj pust 'ArrayList'
	part_top = new ArrayList<Float>();			// zaincjalizuj pust 'ArrayList'
	part_middle = new ArrayList<Float>();			// zaincjalizuj pust 'ArrayList'
	part_bottom = new ArrayList<Float>();			// zaincjalizuj pust 'ArrayList'




	clip_pos = lerp(0,((shape_cut_width/page_nr)*page_nr),page_clip);



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
				// ellipse(ps[i].x, ps[i].y, 5, 5);
				intersection.add(ps[i].y);
    }
  }


  Collections.sort(intersection);
	middle = new Middle(intersection,600);
  cut_point_Test = new Cut_point_Test(intersection);
  intersection = cut_point_Test.get();
	Collections.sort(intersection);


	// set group top
	for ( int  i=0; i < intersection.size(); i++ ){
		if( intersection.get(i) <= cut_point[0] ){
			part_top.add(intersection.get(i));
		}
	}

	// set group middle
	for ( int  i=0; i < intersection.size(); i++ ){
		if( intersection.get(i) >= cut_point[0] && intersection.get(i) <= cut_point[1] ){
			part_middle.add(intersection.get(i));
		}
	}

// set group middle
	for ( int  i=0; i <= ( intersection.size()-1 ); i++ ){
		if( intersection.get(i) >= cut_point[1]){
			part_bottom.add(intersection.get(i));
		}
	}
 
 middle = new Middle(part_top,700,color(255,0,0));
 middle = new Middle(part_middle,700,color(0,255,0));
 middle = new Middle(part_bottom,700,color(0,0,255));


	
	border();
	popMatrix();
// sklalowanie przesuwanie przestrzenią roboczą [ STOP ]
	info_top();
	info_bootom();
}