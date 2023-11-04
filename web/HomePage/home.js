const log = document.getElementById('log');
// const a = {"log":0}


localStorage.setItem('log',1)


function check(){

    if (localStorage.getItem('log') == 0) {
        log.innerHTML = "sign in"
    }else {
        log.innerHTML = "log out"
    }
}


check()