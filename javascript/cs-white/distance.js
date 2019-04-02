function Point(x, y) {
	this.x = x;
	this.y = y;
}

var getDistance = function(p1, p2) {
	var pow = Math.pow;
	var dsquare = pow(p2.x - p1.x, 2) + pow(p2.y - p1.y, 2);
	return Math.sqrt(dsquare);
}

var p1 = new Point(10,10);
var p2 = new Point(20,20);
console.log(getDistance(p1,p2));


//reference: http://steadypost.net/post/lecture/id/13/
