

function openCart(){
    var open = document.getElementById("overlay_cart");
    var rgba = document.getElementById("mycart");
    rgba.style.width = "100%";
    open.style.width = "360px";
    open.style.transform = "none";
}

function closeCart(){
    var close = document.getElementById("overlay_cart");
    var rgba1 = document.getElementById("mycart");
    rgba1.style.width = "0px";
    // close.style.width = "0px";
    close.style.transform = "translateX(100%)";
  
}

