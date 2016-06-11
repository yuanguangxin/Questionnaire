window.onload = function(){
    var DragDrop = function DragDrop(){
        var dragging = null;
        var diffX = 0;
        var diffY = 0;
        function handleEvent(event){
            var target = event.target;
            switch (event.type){
                case "mousedown":
                    if(target.className.indexOf("draggable")>-1){
                        dragging = target;
                        diffX = event.clientX - target.offsetLeft;
                        diffY = event.clientY - target.offsetTop;
                    }
                    break;
                case "mousemove":
                    if(dragging!=null){
                        dragging.style.left = (event.clientX-diffX) + "px";
                        dragging.style.top = (event.clientY-diffY) + "px";
                    }
                    break;
                case "mouseup":
                    var ofTop = window.getComputedStyle(document.getElementsByClassName("question")[0],null)["height"];
                    if(dragging.style.left.split("px")[0]>750){
                        target.remove();
                    }
                    dragging = null;
                    break;
            }
        };
        return{
            enable:function (){
                document.addEventListener("mousedown",handleEvent);
                document.addEventListener("mousemove",handleEvent);
                document.addEventListener("mouseup",handleEvent);
            },
            disable:function(){
                document.removeEventListener("mousedown",handleEvent);
                document.removeEventListener("mousemove",handleEvent);
                document.removeEventListener("mouseup",handleEvent);
            }
        }
    };
    DragDrop().enable();
};