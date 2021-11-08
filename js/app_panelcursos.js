var check = document.querySelector(".check");
check.addEventListener('click',idioma);

function idioma(){
    console.log(check.checked);
    let id = check.checked;
    if (id==true){
        location.href="../contenido-eng/panel_cursos-eng.html"
    }else{
        location.href="../contenido-es/panel_cursos.html";
    }
}