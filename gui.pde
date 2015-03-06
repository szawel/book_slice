class Gui{
	Gui(){

	cp5.setColorLabel(#000000);
	cp5.setColorForeground(#000000);
	cp5.setColorBackground(#B4B4B4);
	cp5.setColorActive(#838383);

	
  	cp5.addNumberbox("page_nr")
     .setPosition(20,20)
     .setSize(100,14)
     .setScrollSensitivity(1000)
     .setDirection(Controller.HORIZONTAL)
     .setValue(50)
     ;

	cp5.addNumberbox("shape_cut_width")
     .setPosition(20,50)
     .setSize(100,14)
     .setMultiplier(0.5)
     .setScrollSensitivity(1)
     .setDirection(Controller.HORIZONTAL)
     .setValue(50)
     ;

	cp5.addNumberbox("shape_cut_height")
     .setPosition(130,50)
     .setSize(100,14)
     .setScrollSensitivity(1000)
     .setDirection(Controller.HORIZONTAL)
     .setValue(50)
     ;

	cp5.addSlider("page_clip")
	.setCaptionLabel("nr_line")
		.setPosition(20,80)
		.setSize(210,15)
		.setRange(0,1)
		;
	}
}