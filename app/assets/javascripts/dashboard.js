(function(){

  document.addEventListener( "DOMContentLoaded", function( e ){
    var canvas = document.querySelector( "#canvas" );
    var context = canvas.getContext( '2d' );

   // var radToCart = function( radiuslength, radians ){
   //    var coords = {
   //      x: radiuslength/2 * Math.cos( radians/2 ),
   //      y: radiuslength/2 * Math.sin( radians/2 )
   //    };
   //   return coords;
   // };

    var x = canvas.width/2;
    var y = canvas.height/2;
    var getRadius = function( orgX, orgY ){
      if ( orgX > orgY ) {
        return orgY;
      }
      return orgX;
    };
    var radius = getRadius( x, y );
    var counterClockwise = true;
    var fillcolor = 'purple';
    var startDeg = 0;
    var endDeg = Math.PI;

    // var newEl = document.querySelector( '#new');
    // var returnEl = document.querySelector( "#return" );
    // var newVis = parseInt( newEl.innerHTML, 10);
    // var retVis = parseInt( returnEl.innerHTML, 10);
    // var totalVis = newVis + retVis;

    // var newPerc = Math.round((newVis/totalVis)* 100);
    // var retPerc = 100 - newPerc;

    // var newInRad = (newVis/totalVis) * 2 * Math.PI;
    // var retInRad = (newVis/totalVis) * 2 * Math.PI;


    context.beginPath();
    context.moveTo( x, y );
    context.arc( x, y, radius, startDeg, endDeg, counterClockwise );
    context.closePath();
    context.fillStyle = fillcolor;
    context.fill();

    // fillcolor = 'chartreuse';
    // startDeg = endDeg;
    // endDeg = 0;

    // context.beginPath();
    // context.moveTo( x, y );
    // context.arc( x, y, radius, startDeg, endDeg, counterClockwise );
    // context.closePath();
    // context.fillStyle = fillcolor;
    // context.fill();

    // context.strokeStyle = 'black';
    // context.fillStyle = 'white';
    // context.font = '24pt Comic Sans';

    // var newPercCoords = radToCart( radius, newInRad );
    // context.fillText( newPerc + "%" , x+newPercCoords.x, y+newPercCoords.y );
    // context.strokeText( newPerc + "%" , x+newPercCoords.x, y+newPercCoords.y );

    // var retPercCoords = radToCart( radius, retInRad );
    // context.fillText( retPerc + "%" , x+retPercCoords.x, y-retPercCoords.y );
    // context.strokeText( retPerc + "%" , x+retPercCoords.x, y-retPercCoords.y );

  });

}());