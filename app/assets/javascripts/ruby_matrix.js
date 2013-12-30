//Adjust canvas here to fit the entire screen
canvas.height = window.screen.height;
canvas.width = window.screen.width;

//one entry in the array per column of text
//each value represent the current y position of the column. (in canvas 0 is at the top and positive y values go downward)
var columns = [];
var character =0;
for (i = 0; i < 256; columns[i++] = 1);

//executed once per frame
function step() {
    //Slightly darkens the entire canvas by drawing a mostly transparent black rectangle over the entire canvas
    //this explains both the initial flash from white to black (by default the canvas is white and progressively becomes black) as well as the fading of characters.
    canvas.getContext('2d').fillStyle = 'rgba(0,0,0,0.05)';
    canvas.getContext('2d').fillRect(0, 0, canvas.width, canvas.height);
    
    //Set color Here:
      var colorcodes = new Array();
      colorcodes[0] = "#F7EB63";
      colorcodes[1] = "#CC0000";
      colorcodes[2] = "#960303";

      var randomColor = Math.floor(Math.random()*colorcodes.length);

    canvas.getContext('2d').fillStyle = colorcodes[randomColor];
    //for each column
    columns.map(function (value, index) {
         
      var rubymethods = new Array();
      rubymethods[0] = "b.uniq { |s| s.first }";
      rubymethods[1] = "a.sort! {|x,y| y <=> x }";
      rubymethods[2] = "a.sample";
      rubymethods[3] = "a.shuffle";
      rubymethods[4] = "a.transpose";
      rubymethods[5] = "Sam is mean!";
      rubymethods[6] = "Sam who?"

      var randomIndex = Math.floor(Math.random()*rubymethods.length);

      //draw the character
      canvas.getContext('2d').fillText(rubymethods[randomIndex], //text
                                       index * 150, //x
                                       value //y
                                      );

      //This is where you adjust the hight/margin of each word
      columns[index] = value > 758 + Math.random() * 1e4 ? 0 : value + 15;
    });
}

//1000/33 = ~30 times a second
setInterval(step, 50)