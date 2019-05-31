
<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap 模板</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>


<body>

<div class="container">

    <div class="row" >

        <div class="col-md-6"
             style="background-color: #dedef8;
         box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">

            <p>以下实例包含了4个网格，但是我们在小设备浏览时无法确定网格显示的位置。 </p>

            <p class="text-left">居中文本文案</p>

            <abbr title="World Wide Web">WWW</abbr>


            <table class="table table-bordered" style="border-color: #0ea432">

                <caption>城市名称表格</caption>
                <thead>
                <tr>
                    <td>省</td>
                    <td>市</td>
                    <td>乡</td>
                </tr>
                </thead>

                <tbody>
                <tr>
                    <td>北京</td>
                    <td>北京</td>
                    <td>海淀</td>
                </tr>

                <tr>
                    <td>辽宁</td>
                    <td>沈阳</td>
                    <td>三好街</td>
                </tr>

                </tbody>
            </table>

        </div>

        <div>
            <p>
                <button type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-sort-by-attributes"></span>
                </button>
                <button type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-sort-by-attributes-alt"></span>
                </button>
                <button type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-sort-by-order"></span>
                </button>
                <button type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-sort-by-order-alt"></span>
                </button>
            </p>
            <button type="button" class="btn btn-default btn-lg">
                <span class="glyphicon glyphicon-user"></span> User
            </button>
            <button type="button" class="btn btn-default btn-sm">
                <span class="glyphicon glyphicon-user"></span> User
            </button>
            <button type="button" class="btn btn-default btn-xs">
                <span class="glyphicon glyphicon-user"></span> User
            </button>

        </div>



    </div>

</div>

<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="https://code.jquery.com/jquery.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="js/bootstrap.min.js"></script>

</body>
</html>
