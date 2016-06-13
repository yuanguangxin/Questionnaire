window.onload = function(){
    $(document).keydown(function(e){
        if( e.ctrlKey  == true && e.keyCode == 83 ){
            if(document.getElementsByClassName("question")[0].innerHTML==""){
                alert("请添加内容！")
            }else {
                if(confirm("是否保存添加到题库")){
                    location.reload();
                }
            }
        }
    });

    var create_table = document.getElementById("create_table");
    create_table.onclick = function () {
        var tab_width = document.getElementById("tab_width").value+"px";
        var tab_height = document.getElementById("tab_height").value+"px";
        var tab_row = document.getElementById("tab_row").value;
        var tab_col = document.getElementById("tab_col").value;
        var tab_colspan = document.getElementById("tab_colspan").value.split(";")[0];
        var colspan_pos_x = tab_colspan[1];
        var colspan_pos_y = tab_colspan[3];
        var colspan_pos_len = tab_colspan[5];
        var s = "<table class='table-bordered'>";
        for(var i=0;i<tab_row;i++){
            s = s + "<tr>";
            for(var j=0;j<tab_col;j++){
                if(i==colspan_pos_x&&j==colspan_pos_y){
                    s = s + "<td colspan="+colspan_pos_len+">"+i+","+j+"</td>";
                }else {
                    s = s + "<td>"+i+","+j+"</td>";
                }
            }
            s = s + "</tr>"
        }
        s=s+"</table>"
        alert(s);
    };
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
                    if(dragging.style.left.split("px")[0]>650){
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