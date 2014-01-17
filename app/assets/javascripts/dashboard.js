(function(){

  document.addEventListener( "page:change", function( e ){

  // CANVAS NUMBER ONE (New vs. Returning Visitors pie chart)

    var canvas = document.querySelector( "#canvas" );
    var context = canvas.getContext( '2d' );

    // var x = canvas.width/2;
    // var y = canvas.height/2;
    // var getRadius = function( orgX, orgY ){
    //   if ( orgX > orgY ) {
    //     return orgY - 15;
    //   }
    //   return orgX - 15;
    // };
    // var radius = getRadius( x, y );
    // var counterClockwise = true;

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

    var newPercCoords = radToCart( 100, newInRad );
    var retPercCoords = radToCart( 100, retInRad );

    // New Visitors pie wedge

    context.beginPath();
    context.moveTo( 115, 115 );
    context.arc( 115, 115, 100, 0, newInRad, true );
    context.closePath();
    context.fillStyle = 'purple';
    context.fill();
    context.stroke();

    // Returning Visitors pie wedge

    context.beginPath();
    context.moveTo( 115, 115 );
    context.arc( 115, 115, 100, newInRad, Math.PI*2, true );
    context.closePath();
    context.fillStyle = 'orange';
    context.fill();
    context.stroke();

    // Pie Chart Key

    var drawKeyBox = function( context, x, y, color ){
      context.beginPath();
      context.moveTo( x, y );
      context.rect( x, y, 20, 20 );
      context.closePath();
      context.fillStyle = color;
      context.fill();
      context.stroke();
    };

    drawKeyBox( context, 250, 75, "purple");
    drawKeyBox( context, 250, 110, "orange");

    // Pie Chart Text

    context.fillStyle = 'black';
    context.font = '14pt Helvetica';

    context.fillText( newVisPerc + "%" , 115+newPercCoords.x, 115+newPercCoords.y );
    context.fillText( retVisPerc + "%" , 115+retPercCoords.x, 115-retPercCoords.y );

    context.font = '10pt Helvetica';
    context.fillText( "Returning Visitors" , 278, 90 );
    context.fillText( "New Visitors" , 278, 125 );

  // CANVAS NUMBER TWO (Browser bar graph)

    var canvas2 = document.querySelector( "#canvas2" );
    var context2 = canvas2.getContext( '2d' );

    context2.beginPath();
    context2.moveTo( 0, 232 );
    context2.lineWidth = 2;
    context2.lineTo(275, 232);
    context2.stroke();
    context2.closePath();

    context2.lineWidth = 1;

    var drawBarRect = function( height, color, xCoord ){
      context2.beginPath();
      var rectWidth = 35;
      var rectHeight = height;
      var x = xCoord;
      var y = canvas2.height - rectHeight;
      
      context2.rect( x, y , rectWidth, rectHeight );
      context2.fillStyle = color;
      context2.fill();
      context2.stroke();
    };

    var firefoxEl = document.querySelector( "#firefox");
    var chromeEl = document.querySelector( "#chrome");
    var safariEl = document.querySelector( "#safari");
    var ieEl = document.querySelector( "#ie");
    var otherEl = document.querySelector( "#other");
    var firefox = parseInt( firefoxEl.innerHTML, 10);
    var chrome = parseInt( chromeEl.innerHTML, 10);
    var safari = parseInt( safariEl.innerHTML, 10);
    var ie = parseInt( ieEl.innerHTML, 10);
    var other = parseInt( otherEl.innerHTML, 10);
    var browserTotal = firefox + chrome + safari + ie + other;

    var firefoxPer = firefox / browserTotal * 227 + 3;
    var chromePer = chrome / browserTotal * 227 + 3;
    var safariPer = safari / browserTotal * 227 + 3;
    var iePer = ie / browserTotal * 227 + 3;
    var otherPer = other / browserTotal * 227 + 3;

    // Browser Bars

    drawBarRect( firefoxPer , "orangered", 10 );
    drawBarRect( chromePer , "purple", 65 );
    drawBarRect( safariPer , "lightseagreen", 120 );
    drawBarRect( iePer , "orange", 175 );
    drawBarRect( otherPer , "orchid", 230 );

    // Bar Graph Key

    drawKeyBox( context2, 295, 50, "orangered");
    drawKeyBox( context2, 295, 80, "purple");
    drawKeyBox( context2, 295, 110, "lightseagreen");
    drawKeyBox( context2, 295, 140, "orange");
    drawKeyBox( context2, 295, 170, "orchid");

    context2.font = '10pt Helvetica';
    context2.fillStyle = "black";
    context2.fillText( "Firefox" , 325, 65 );
    context2.fillText( "Chrome" , 325, 95 );
    context2.fillText( "Safari" , 325, 125 );
    context2.fillText( "Internet Explorer" , 325, 155 );
    context2.fillText( "Other" , 325, 185 );

    // Text

    

  });

}());