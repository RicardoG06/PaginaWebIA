var check = document.querySelector(".check");
check.addEventListener('click',idioma);

function idioma(){
    let id = check.checked;
    if (id==true){
        location.href="contenido-eng/Index-eng.html";
    }else{
        location.href="../Index.html";
    }
}
