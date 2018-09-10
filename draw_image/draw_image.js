var ctx;
  let tbl = document.getElementById("tbl");
  for (let i = 0; i < 3; i++) {
    let tr = document.createElement("tr");
    for (let j = 0; j < 3; j++) {
      let td = document.createElement("td");
        td.onclick = () => {
          alert("a");
        }
      td.innerHTML = 'こんにちは' + j;
      tr.appendChild(td);
      }
      tbl.appendChild(tr);
   }

  draw();

// canvasに対してdrawimageする
function draw() {
  ctx = document.getElementById("canvas").getContext("2d");
  var imageName = new Image();
  imageName.src = "./bg.png";
  ctx.drawImage(imageName ,0, 0);

  requestAnimationFrame(draw);
}
