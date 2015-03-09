// gurna belka z informacjami o skrutach klawiatórowych itd

void info_top(){
	textAlign(LEFT);
	textSize(12);
	fill(0);
	noSmooth();
	// text("intersection nr - " + intersection.size(),20,20);

}

// dolna belka z informacja olisciach elemenów i parametrach
void info_bootom(){
	fill(255);
	noStroke();
	rect(0,height-20,displayWidth,50);
	fill(0);
	text("fps = " + int(frameRate),20,height-5);
	text("intersection nr = " + intersection.size(),120,height-5);
	text("part_top = " + part_top.size(), 250,height-5);
	text("part_middle = " + part_middle.size(), 350,height-5);
	text("part_bottom = " + part_bottom.size(), 450,height-5);
}	