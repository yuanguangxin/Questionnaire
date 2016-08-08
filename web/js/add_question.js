window.onload = function(){
    $(document).keydown(function(e){
        if( e.ctrlKey  == true && e.keyCode == 8 ){
            document.getElementsByClassName("able_del")[0].remove();
        }
        if( e.ctrlKey  == true && e.keyCode == 83 ){
            if(document.getElementsByClassName("question")[0].innerHTML==""){
                alert("请添加内容！")
            }else {
                if(confirm("是否保存添加到题库")){
                    //location.reload();
                    var radio = document.getElementsByName("sex");
                    var value=-1;
                    for(let i=0;i<radio.length;i++){
                        if(radio[i].checked){
                            value = radio[i].value;
                        }
                    }
                    if(value==-1){
                        alert("请选择题目适用范围!");
                        return;
                    }
                    var div = document.getElementById("div1");
                    div.removeAttribute("contenteditable");
                    div.removeAttribute("ondrop");
                    div.removeAttribute("ondragover");
                    document.getElementById("table_test").removeAttribute("ondrop");
                    document.getElementById("table_test").removeAttribute("ondragover");
                    $("#table_test").removeClass("draggable");
                    var input = document.getElementsByTagName("input");
                    for(let i=0;i<input.length;i++){
                        input[i].style.cursor = "inherit";
                        input[i].removeAttribute("ondragstart");
                        input[i].removeAttribute("draggable");
                        input[i].removeAttribute("readonly");
                        $(input[i]).removeClass("draggable");
                    }
                    var ofTop = window.getComputedStyle(document.getElementsByClassName("question")[0],null)["height"];
                    document.getElementById("div1").style.height = ofTop;
                    var div = document.getElementById("div1").outerHTML;
                    $.post("/addQuestion.action",{format:div,sex:value},function (data,textStatus) {
                    });
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

        var tab_colspan = document.getElementById("tab_colspan").value.split(";");
        var collen = tab_colspan.length;
        var colspan_pos_x = [];
        var colspan_pos_y = [];
        var colspan_pos_len = [];
        for(let i=0;i<collen;i++){
            colspan_pos_x.push(tab_colspan[i][1]);
            colspan_pos_y.push(tab_colspan[i][3]);
            colspan_pos_len.push(tab_colspan[i][5]);
        }

        var tab_rowspan = document.getElementById("tab_rowspan").value.split(";");
        var rowlen = tab_rowspan.length;
        var rowspan_pos_x = [];
        var rowspan_pos_y = [];
        var rowspan_pos_len = [];
        for(let i=0;i<rowlen;i++){
            rowspan_pos_x.push(tab_rowspan[i][1]);
            rowspan_pos_y.push(tab_rowspan[i][3]);
            rowspan_pos_len.push(tab_rowspan[i][5]);
        }
        

        var needRow = [];
        for(let j=0;j<rowlen;j++){
            needRow[j]=[];
            for(let i=1;i<rowspan_pos_len[j];i++){
                let a=[parseInt(rowspan_pos_x[j])+i,1];
                needRow[j].push(a);
            }
        }


        var s = "<table style='border:5px;position: absolute;top: 0px;left: 0px' id='table_able' contenteditable='true' class='table-bordered draggable able_del'>";
        for(let i=0;i<tab_row;i++){
            s = s + "<tr>";
            var sign=0;
            for(let j=0;j<tab_col;j++){
                var fc=0;
                var fr=0;
                for(let k=0;k<collen;k++){
                    var kk=0;
                    if(i==colspan_pos_x[k]&&j==colspan_pos_y[k]){
                        for(let w=0;w<rowlen;w++){
                            if(i==rowspan_pos_x[w]&&j==rowspan_pos_y[w]){
                                s = s + "<td rowspan='"+rowspan_pos_len[w]+"'  colspan='"+colspan_pos_len[k]+"' width='"+tab_width+"' height='"+tab_height+"' >"+"</td>";
                                fr=1;
                                for(var u=0;u<needRow[w].length;u++){
                                    needRow[w][u][1]=colspan_pos_len[k];
                                }
                                kk=1;
                                break;
                            }
                        }
                        if(kk==0){
                            s = s + "<td width='"+tab_width+"' height='"+tab_height+"'  colspan='"+colspan_pos_len[k]+"'>"+"</td>";
                        }
                        j=j+parseInt(colspan_pos_len[k])-1;
                        fc=1;
                        break;
                    }
                }

                if(fr==0){
                    for(let d=0;d<rowlen;d++){
                        if(i==rowspan_pos_x[d]&&j==rowspan_pos_y[d]){
                            s = s + "<td rowspan='"+rowspan_pos_len[d]+"' width='"+tab_width+"' height='"+tab_height+"' >"+"</td>";
                            fr=1;
                            break;
                        }
                    }
                }

                if(sign==0){
                    for(let f=0;f<rowlen;f++){
                        for(let h=0;h<needRow[f].length;h++){
                            if(i==needRow[f][h][0]){
                                j=j+parseInt(needRow[f][h][1]);
                                sign=1;
                                break;
                            }
                        }
                    }
                }
                if(fc==0&&fr==0){
                    s = s + "<td width='"+tab_width+"' height='"+tab_height+"' >"+"</td>";
                }
            }
            s = s + "</tr>"
        }
        s=s+"</table>"
        var table_test = document.getElementById("table_test");
        table_test.innerHTML = s;
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