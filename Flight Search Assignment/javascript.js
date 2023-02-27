let content='<input type="text" name="" id="LeftAsideFilterOriginCity" placeholder="Enyer Origin City"/>';
function oneWay() {
    document.getElementByClass("Filter").innerHTML +=
    "<h3>This is the text which has been inserted by JS</h3>";



  //alert("Hello! I am  ");
  // document.getElementsByClassName("Filter").innerHTML='<input type="text" name="" id="LeftAsideFilterOriginCity" placeholder="Enyer Origin City"/>';
  // document.getElementById('Filter').innerHTML='<input type="text" name="" id="LeftAsideFilterOriginCity" placeholder="Enyer Origin City"/>';
  // const h2 = document.getElementById("Filter");
  // let html = '<input type="text" name="" id="LeftAsideFilterOriginCity" placeholder="Enyer Origin City"/>';
  // h2.insertAdjacentHTML("afterend", html);
}
window.oneWay();

function Return() {
  alert("Hello! I am jitu!");
}

const element = document.getElementById("id01");
element.innerHTML = "<h6>New Heading</h6>";

const h2 = document.getElementById("myH2");
  let html = "<span style='color:red'>My span</span>";
  h2.insertAdjacentHTML("afterbegin", html);