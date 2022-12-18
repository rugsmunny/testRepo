window.addEventListener("load", checkForCookie);



function formAction() {
    const x = document.getElementById("inputform");
    const y = document.getElementById("city");
    const z = document.getElementById("country");
    if (y.value === "" && z.value === "") {
        alert("Something is missing!")
    } else {
        x.addEventListener('animationend', ev => {
            ev.animationName = 'formanimation';
            document.getElementById("OWServlet").submit();



        });
        document.getElementById("inputform").style.animation = "formanimation 4s ease-out forwards";
        document.getElementById("inputform").removeEventListener("animationend", ev => {
            ev.animationName = 'formanimation';
        })

    }


}
function formAction2() {
    const x = document.getElementById("inputform2");
    const y = document.getElementById("city");
    const z = document.getElementById("country");
    if (y.value === "" && z.value === "") {
        alert("Something is missing!")
    } else {
        x.addEventListener('click', ev => {

            document.getElementById("OWServlet").submit();




        })

    }

}



function hideCookieModal() {
    document.getElementById('indexCookieModal').style.display = "none";
    document.getElementById('cookieModal').style.display = "none";
    document.getElementById("inputform").style.display = "flex";
    document.getElementById("inputform").style.animation = "animateforegroundreverse 3s ease-in forwards";

}

function setCookie(name, value) {
    const oneMinute = 60;
    const expires = new Date((new Date()).valueOf() + oneMinute * 1000);
    document.cookie = `${encodeURIComponent(name)}=${encodeURIComponent(value)}; expires=${expires.toUTCString()}; path=/`;
}


function checkForCookie(){
    if (document.cookie.indexOf('acceptCookie') !== -1) {
        hideCookieModal()
    } else {
        document.getElementById('cookieChoiceYes').addEventListener('mouseup', ev => {
            setCookie('acceptCookie', '');
            modalFormAnimation()
        });
        document.getElementById('cookieChoiceNo').addEventListener('mouseup', ev => {
            modalFormAnimation()
        });


    }

}

function modalFormAnimation(){
    document.getElementById("indexCookieModal").style.animation = "animatebackgroundreverse 4s ease-out forwards";
    document.getElementById("cookieModal").style.animation = "animatetopreverse 2s ease-out forwards";
    document.getElementById("inputform").style.animation = "animateforegroundreverse 3s ease-in forwards";
    document.getElementById("inputform").style.display = "flex";

}
