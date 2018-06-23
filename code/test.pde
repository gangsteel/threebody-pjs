float radius = 50.0;
int X, Y;
int nX, nY;
int X1, Y1;
int X2, Y2;
float vx, vy, vx1, vx2, vy1, vy2;
int delay = 1000;
int W = 1000;
int H = 300;

void setup(){
	size(W,H);
	strokeWeight(3);
	frameRate(30);
	X = width/2;
	Y = height/2;
	X1 = width/4;
	Y1 = height/2;
	X2 = width*3/4;
	Y2 = height/2;
	nX = width/2;
	nY = height/2;
	vx = 0;vy=0;vx1=0;vx2=0;vy1=0;vy2=0;
}

void draw(){
	background(100);
	fill(0,121,184);
	stroke(255);
	calc();
	ellipse(X,Y,radius,radius);
	fill(121,184,0);
	ellipse(X1,Y1,radius,radius);
	fill(184,0,121);
	ellipse(X2,Y2,radius,radius);
	fill(0,0,0)
	ellipse(nX,nY,20,20)
	stroke(0);
	
	line(X,Y,nX,nY);
	text("Black hole",nX+10,nY+10)
}

void calc(){
	float dist1 = sqrt((X-X1)*(X-X1)+(Y-Y1)*(Y-Y1));
	float dist2 = sqrt((X-X2)*(X-X2)+(Y-Y2)*(Y-Y2));
	float dist12 = sqrt((X1-X2)*(X1-X2)+(Y1-Y2)*(Y1-Y2));
	float forceX = -(X-X1)*(dist1-100)/dist1-(X-X2)*(dist2-100)/dist2 - vx;
	float forceY = -(Y-Y1)*(dist1-100)/dist1-(Y-Y2)*(dist2-100)/dist2 - vy;
	forceX+=(nX-X)*3;
	forceY+=(nY-Y)*3;
	vx = vx + forceX/delay;
	vy = vy + forceY/delay;
	forceX = -(X1-X)*(dist1-100)/dist1 - (X1-X2)*(dist12-100)/dist12 -vx1;
	forceY = -(Y1-Y)*(dist1-100)/dist1 - (Y1-Y2)*(dist12-100)/dist12 -vy1;
	vx1 = vx1 + forceX/delay;
	vy1 = vy1 + forceY/delay;
	forceX = -(X2-X)*(dist2-100)/dist2 - (X2-X1)*(dist12-100)/dist12 -vx2;
	forceY = -(Y2-Y)*(dist2-100)/dist2 - (Y2-Y1)*(dist12-100)/dist12 -vy2;
	vx2 = vx2 + forceX/delay;
	vy2 = vy2 + forceY/delay;
	X+=vx;
	Y+=vy;
	X1+=vx1;
	Y1+=vy1;
	X2+=vx2;
	Y2+=vy2;

	if (X>W){
		vx = -vx;
		X=W-1;
	}
	if (X1>W){
		vx1 = -vx1;
		X1=W-1;
	}
	if (X2>W){
		vx2 = -vx2;
		X2=W-1;
	}
	if (Y>H){
		vy = -vy;
		Y=H-1;
	}
	if (Y1>H){
		vy1 = -vy1;
		Y1=H-1;
	}
	if (Y2>H){
		vy2 = -vy2;
		Y2=H-1;
	}
	if (X<0){
		vx = -vx;
		X=0+1;
	}
	if (X1<0){
		vx1 = -vx1;
		X1=0+1;
	}
	if (X2<0){
		vx2 = -vx2;
		X2=0+1;
	}
	if (Y<0){
		vy = -vy;
		Y=0+1;
	}
	if (Y1<0){
		vy1 = -vy1;
		Y1=0+1;
	}
	if (Y2<0){
		vy2 = -vy2;
		Y2=0+1;
	}


	
}

void mouseMoved(){
	nX = mouseX;
	nY = mouseY;
}
