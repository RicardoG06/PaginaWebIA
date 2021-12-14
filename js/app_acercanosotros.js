var check = document.querySelector(".check");
check.addEventListener('click',idioma);

function idioma(){
    console.log(check.checked);
    let id = check.checked;
    if (id==true){
        location.href="../contenido-eng/acerca_nosotros-eng.html";
    }else{
        location.href="../contenido-es/acerca_nosotros.html";
    }
}