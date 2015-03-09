// feed class with ArrayList<float> of intersect coordynate its nead to by sor befor
// class while check if ther any intersection in cut point on the edges of the page if ther is any
// class while add two extra cordinats to Array at exacli wher dhey shude be
// if not array whil youst pass ann change

// this class use geomerative libery to work and its a mess so for 99% i while re-write this one . I hope

class Cut_point_Test{

	RShape shp1;
	RShape shp2;

	ArrayList<Float> out;

	Cut_point_Test(ArrayList<Float> _in){

		out = new ArrayList<Float>();

		for(int i = 0; i < _in.size(); i++){
			out.add(_in.get(i));
		}

		for ( int i = 0; i < (_in.size()-1); i+=2 ){
			shp1 = RShape.createLine(0, _in.get(i),0,_in.get(i+1));
			shp2 = RShape.createLine(-100,cut_point[0],100,cut_point[0]);
			RPoint[] ps = shp1.getIntersections(shp2);
			if (ps != null) {
				for (int j = 0 ; j < ps.length; j++) {
					ellipse(ps[j].x, ps[j].y, 20, 20);
					out.add(ps[j].y);
					// out.add(ps[j].y);
				}
			}
		}

		for ( int i = 0; i < (_in.size()-1); i+=2 ){
			shp1 = RShape.createLine(0, _in.get(i),0,_in.get(i+1));
			shp2 = RShape.createLine(-100,cut_point[1],100,cut_point[1]);
			RPoint[] ps = shp1.getIntersections(shp2);
			if (ps != null) {
				for (int j = 0 ; j < ps.length; j++) {
					ellipse(ps[j].x, ps[j].y, 20, 20);
					out.add(ps[j].y);
					// out.add(ps[j].y);
				}
			}
		}

	}

	ArrayList<Float> get(){
		return out;
	}
}