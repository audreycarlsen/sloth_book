(function(){

// CANVAS NUMBER ONE

  document.addEventListener( "page:change", function( e ){

    var canvas = document.querySelector( "#canvas" );
    var context = canvas.getContext( '2d' );

    var x = canvas.width/2;
    var y = canvas.height/2;
    var getRadius = function( orgX, orgY ){
      if ( orgX > orgY ) {
        return orgY - 15;
      }
      return orgX - 15;
    };
    var radius = getRadius( x, y );
    var counterClockwise = true;

    var newVisEl = document.querySelector( "#new_vis");
    var retVisEl = document.querySelector( "#ret_vis" );
    var newVis = parseInt( newVisEl.innerHTML, 10);
    var retVis = parseInt( retVisEl.innerHTML, 10);
    var totalVis = newVis + retVis;
    
    var newVisPerc = Math.round((newVis/totalVis) * 100);
    var retVisPerc = 100 - newVisPerc;

    var newInRad = (newVis/totalVis) * 2 * Math.PI;
    var retInRad = (retVis/totalVis) * 2 * Math.PI;

    var radToCart = function( radiuslength, radians ){
      var coords = {
        x: radiuslength/2 * Math.cos( radians/2 ),
        y: radiuslength/2 * Math.sin( radians/2 )
      };
      return coords;
    };

    var newPercCoords = radToCart( radius, newInRad );
    var retPercCoords = radToCart( radius, retInRad );

    // New Visitors Wedge

    context.beginPath();
    context.moveTo( x, y );
    context.arc( x, y, radius, 0, newInRad, counterClockwise );
    context.closePath();
    context.fillStyle = 'purple';
    context.fill();
    context.stroke();

    // Returning Visitors Wedge

    context.beginPath();
    context.moveTo( x, y );
    context.arc( x, y, radius, newInRad, Math.PI*2, counterClockwise );
    context.closePath();
    context.fillStyle = 'orange';
    context.fill();
    context.stroke();

    context.fillStyle = 'black';
    context.font = '12pt Helvetica';

    context.fillText( newVisPerc + "%" , x+newPercCoords.x, y+newPercCoords.y );
    context.fillText( retVisPerc + "%" , x+retPercCoords.x, y-retPercCoords.y );



// CANVAS NUMBER TWO

   //  var canvas = document.querySelector( "#canvas" );
   //  var context = canvas.getContext( '2d' );

   // // var radToCart = function( radiuslength, radians ){
   // //    var coords = {
   // //      x: radiuslength/2 * Math.cos( radians/2 ),
   // //      y: radiuslength/2 * Math.sin( radians/2 )
   // //    };
   // //   return coords;
   // // };

   //  var x = canvas.width/2;
   //  var y = canvas.height/2;
   //  var getRadius = function( orgX, orgY ){
   //    if ( orgX > orgY ) {
   //      return orgY - 15;
   //    }
   //    return orgX - 15;
   //  };
   //  var radius = getRadius( x, y );
   //  var counterClockwise = true;
   //  var fillcolor = 'purple';
   //  var startDeg = 0;
   //  var endDeg = Math.PI*2;

   //  var firefox = document.querySelector( "#firefox");
   //  var chrome = document.querySelector( "#chrome");
   //  var safari = document.querySelector( "#safari");
   //  var ie = document.querySelector( "#ie");
   //  var totalVis = firefox + chrome + safari + ie

   //  // var newEl = document.querySelector( '#new');
   //  // var returnEl = document.querySelector( "#return" );
   //  // var newVis = parseInt( newEl.innerHTML, 10);
   //  // var retVis = parseInt( returnEl.innerHTML, 10);
   //  // var totalVis = newVis + retVis;

   //  // var newPerc = Math.round((newVis/totalVis)* 100);
   //  // var retPerc = 100 - newPerc;

   //  // var newInRad = (newVis/totalVis) * 2 * Math.PI;
   //  // var retInRad = (newVis/totalVis) * 2 * Math.PI;


   //  context.beginPath();
   //  context.moveTo( x, y );
   //  context.arc( x, y, radius, startDeg, endDeg, counterClockwise );
   //  context.closePath();
   //  context.fillStyle = fillcolor;
   //  context.fill();

   //  // fillcolor = 'chartreuse';
   //  // startDeg = endDeg;
   //  // endDeg = 0;

   //  // context.beginPath();
   //  // context.moveTo( x, y );
   //  // context.arc( x, y, radius, startDeg, endDeg, counterClockwise );
   //  // context.closePath();
   //  // context.fillStyle = fillcolor;
   //  // context.fill();

   //  // context.strokeStyle = 'black';
   //  // context.fillStyle = 'white';
   //  // context.font = '24pt Comic Sans';

   //  // var newPercCoords = radToCart( radius, newInRad );
   //  // context.fillText( newPerc + "%" , x+newPercCoords.x, y+newPercCoords.y );
   //  // context.strokeText( newPerc + "%" , x+newPercCoords.x, y+newPercCoords.y );

   //  // var retPercCoords = radToCart( radius, retInRad );
   //  // context.fillText( retPerc + "%" , x+retPercCoords.x, y-retPercCoords.y );
   //  // context.strokeText( retPerc + "%" , x+retPercCoords.x, y-retPercCoords.y );

  });

}());