;$(document).ready(function(){
var canvas = document.getElementbyId('canvas');
var ctx = canvas.getContext('2d');
var save = document.getElementbyId('Save');
var restore = document.getElementbyId('Restore');
var clear = document.getElementByI('Clear');
var colorPicker = document.getElementbyId('colorPicker');

var flag = 0;

var state = {
  time: 0,
  x: 0,
  y: 0
}

canvas.addEventListener('mousedown', function(e){
  flag = 1;
  ctx.beginPath();
  ctx.moveTo(e.offsetX, e.offsetY);
  ctx.fillStyle = colorPicker.value;
  ctx.fillRect(e.offsetX,e.offsetY,2,2);
  ctx.strokeStyle = colorPicker.value;
});

cavas.addEventListener('mouseup', function(){
  flag = 0;
});

save.addEventListener('click', function(e){
  e.preventDefault();
  var dataurl = canvas.toDataurl();
    $.ajax({
      type: 'POST',
      url: $(this).attr('data-url'),
      data: {data: dataurl}
    })
});

clear.addEventListener('click', function() {
  var image = new Image();
  image.onload = function() {
    ctx.drawImage(image,0,0);
  }
  image.src = dataurl;
});



})