// gurna belka z informacjami o skrutach klawiatórowych itd

void info_top(){
	textAlign(LEFT);
	textSize(12);
	fill(0);
	noSmooth();
	text("intersection nr - " + intersection.size(),20,20);


}

// dolna belka z informacja olisciach elemenów i parametrach
void info_bootom(){
	fill(255);
	noStroke();
	rect(0,height-20,displayWidth,50);
	fill(0);
	text("intersection nr - " + intersection.size(),20,height-5);
}