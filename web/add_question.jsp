<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/add_question.css">
    <script src="js/add_question.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div style="border-right: 1px solid #ccc" class="pull-left col-md-2">
    <br/>
    <div class="form-group">
        <button type="button" style="outline: none;" class="btn btn-success btn-group-sm">
            可拖拽组件
        </button>
    </div>
    <hr/>
    <div class="form-group">
        <button type="button" style="outline: none;" class="btn btn-primary btn-group-sm">
            下划线(Input)
        </button>
    </div>
    <div class="input">
        <input id="u1" draggable="true" ondragstart="drag(event)" type="text" class="size_1 under" readonly/>
    </div>
    <div class="input">
        <input id="u2" draggable="true" ondragstart="drag(event)" type="text" class="size_2 under" readonly/>
    </div>
    <div class="input">
        <input id="u3" draggable="true" ondragstart="drag(event)" type="text" class="size_3 under" readonly/>
    </div>
    <div class="input">
        <input id="u4" draggable="true" ondragstart="drag(event)" type="text" class="size_4 under" readonly/>
    </div>
    <div class="input">
        <input id="u5" draggable="true" ondragstart="drag(event)" type="text" class="size_5 under" readonly/>
    </div>
    <br/>
    <div class="form-group">
        <button type="button" style="outline: none;" class="btn btn-primary btn-group-sm">
            答案框(Input)
        </button>
    </div>
    <div class="input_normal" >
        <div class="input" style="display: inline-block;vertical-align: bottom" >
            <input id="drag1" type="text" class="nsize_1" ondragstart="drag(event)" draggable="true" readonly/>
        </div>
        <div class="input" style="display: inline-block;vertical-align: bottom">
            <input id="drag2" type="text" class="nsize_2" ondragstart="drag(event)" draggable="true" readonly/>
        </div>
        <div class="input" style="display: inline-block;vertical-align: bottom">
            <input id="drag3" type="text" class="nsize_3" ondragstart="drag(event)" draggable="true" readonly/>
        </div>
        <div class="input" style="display: inline-block;vertical-align: bottom">
            <input id="drag4" type="text" class="nsize_4" ondragstart="drag(event)" draggable="true" readonly/>
        </div>
    </div>
    <br/>
    <div class="form-group">
        <button type="button" style="outline: none;" class="btn btn-primary btn-group-sm">
            表格(Table)
        </button>
    </div>
    <p><b>自定义表格设置</b></p>
    <table class="table">
        <tr>
            <td colspan="2">表格大小(每个小块大小):</td>
        </tr>
        <tr>
            <td colspan="2">宽: <input id="tab_width" type="text" style="width: 50%;cursor:inherit">&nbsp;px</td>
        </tr>
        <tr>
            <td colspan="2">高: <input id="tab_height" type="text" style="width: 50%;cursor:inherit">&nbsp;px</td>
        </tr>
        <tr>
            <td colspan="2">示例(宽70px,高30px):</td>
        </tr>
        <tr>
            <td colspan="2" style="border: 0"><input style="width: 70px;height: 30px" type="text" placeholder=" 示例" disabled="disabled"/></td>
        </tr>
        <tr>
            <td colspan="2">行列数</td>
        </tr>
        <tr>
            <td style="border: 0"><input id="tab_row" style="width: 70%;cursor:inherit" type="text"/>&nbsp;行</td>
            <td style="border: 0"><input id="tab_col" style="width: 70%;cursor:inherit" type="text"/>&nbsp;列</td>
        </tr>
        <tr>
            <td colspan="2">合并列</td>
        </tr>
        <tr>
            <td colspan="2" style="font-size:16px;border: 0">格式: [行号,列号,合并数];</td>
        </tr>
        <tr>
            <td style="border: 0;" class="2"><input id="tab_colspan" style="cursor:inherit;width: 200%" type="text"/></td>
        </tr>
        <tr>
            <td colspan="2">合并行</td>
        </tr>
        <tr>
            <td colspan="2" style="font-size:16px;border: 0">格式: [行号,列号,合并数];</td>
        </tr>
        <tr>
            <td style="border: 0;" class="2"><input id="tab_rowspan" style="cursor:inherit;width: 200%" type="text"/></td>
        </tr>
    </table>
    <div class="form-group">
        <button type="button" id="create_table" style="cursor: pointer;outline: none;width: 100%" class="btn btn-warning btn-group-sm">
            生成表格
        </button>
    </div>
</div>

<div class="pull-right col-md-3"  style="border-left: 1px solid #ccc">
    <br/>
    <div class="form-group">
        <img src="img/Tips.jpg" width="26%" height="26%"/>
    </div>
    <table class="table">
        <tr>
            <td>
                1.编辑区可进行文本编辑，可自行排版
            </td>
        </tr>
        <tr>
            <td>
                2.若要加粗字体，请在文字左右包含&lt;b&gt;&lt;/b&gt;标签
                <br/>
                <b>如：&lt;b&gt;您的年龄是&lt;/b&gt;</b>
            </td>
        </tr>
        <tr>
            <td>3.左侧组件可拖拽，可根据需求自选组件</td>
        </tr>
        <tr>
            <td>4.若要删除已拖拽的组件，直接将组件拖出文本编辑区外即可</td>
        </tr>
        <tr>
            <td>5.编辑中可按Ctrl+del快速删除表格</td>
        </tr>
        <tr>
            <td>6.编辑完成可按Ctrl+s保存添加到题库</td>
        </tr>
        <tr>
            <td><b>表格自定义说明</b></td>
        </tr>
        <tr>
            <td>(1)根据示例可自定义表格大小(最大宽度133px)和表格规格(行,列)</td>
        </tr>
        <tr>
            <td>(2)生成的表格同编辑区相同具有可编辑性</td>
        </tr>
        <tr>
            <td>
                (3)表格可拖拽(按住表格右下角)
            </td>
        </tr>
        <tr>
            <td>(4)可拖拽组件可拖拽于表格内</td>
        </tr>
        <tr>
            <td>(5)合并行,和并列举例</td>
        </tr>
        <tr>
            <td>原始状态: 5行5列,大小为40px*40px的表格</td>
        </tr>
        <tr>
            <td>
                <table class="table-bordered">
                    <tr>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                    <tr>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                    <tr>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                    <tr>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                    <tr>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>合并列,输入格式[0,0,2];[2,2,2]</td>
        </tr>
        <tr>
            <td>
                <table class="table-bordered">
                    <tr>
                        <td colspan="2" style="width: 40px;height: 40px;background: #ccc"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                    <tr>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                    <tr>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td colspan="2" style="width: 40px;height: 40px;background: #ccc"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                    <tr>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                    <tr>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>合并行,输入格式[0,0,2];[2,2,2]</td>
        </tr>
        <tr>
            <td>
                <table class="table-bordered">
                    <tr>
                        <td rowspan="2" style="width: 40px;height: 40px;background: #ccc"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                    <tr>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                    <tr>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td rowspan="2" style="width: 40px;height: 40px;background: #ccc"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                    <tr>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                    <tr>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>合并行[0,0,3],和并列[0,0,3]</td>
        </tr>
        <tr>
            <td>
                <table class="table-bordered">
                    <tr>
                        <td colspan="3" rowspan="3" style="width: 40px;height: 40px;background: #ccc"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                    <tr>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                    <tr>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                    <tr>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                    <tr>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                        <td style="width: 40px;height: 40px"></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td><b>注:</b></td>
        </tr>
        <tr>
            <td style="border: 0">
                <b>由于表格本身跟根据输入自动改变大小,并考虑表格使用的复杂性,推荐较少使用合并功能</b>
            </td>
        </tr>
    </table>
</div>

<div class="col-md-7">
    <br/>
    <div class="form-group">
        <button type="button" style="outline: none;" class="btn btn-success btn-group-sm">
            编辑区
        </button>
        <input style="margin-left: 30px" id="male" value="1" type="radio" name="sex"/><label for="male">&nbsp;男</label>
        <input style="margin-left: 10px" id="female" value="2" type="radio" name="sex"/><label for="female">&nbsp;女</label>
        <input style="margin-left: 10px" value="3" id="both" type="radio" name="sex"/><label for="both">&nbsp;通用</label>
    </div>
    <div id="div1" contenteditable="true" class="question" ondrop="drop(event)"
         ondragover="allowDrop(event)">
        请在这里编辑
        <div id="table_test" ondrop="drop(event)"
             ondragover="allowDrop(event)"></div>
    </div>
</div>

<script>
    $(function(){
        if(${sessionScope.admin.username eq null}){
            window.location.href="login.html";
        }
    });
    function allowDrop(ev)
    {
        ev.preventDefault();
    }

    function drag(ev)
    {
        ev.dataTransfer.setData("Text",ev.target.id);
    }

    function drop(ev)
    {
        ev.preventDefault();
        var data=ev.dataTransfer.getData("Text");
        var a = document.getElementById(data).cloneNode(true);
        a.style.position = "absolute";
        a.style.left="10px";
        $(a).addClass("draggable");
        a.setAttribute("draggable","false");
        ev.target.appendChild(a);
    }
</script>
</body>
</html>