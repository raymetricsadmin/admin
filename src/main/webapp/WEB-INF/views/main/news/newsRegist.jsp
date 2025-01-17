<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../../includes/header.jsp"%>
<!-- 에디터 플러그인 -->

<script type="text/javascript" src="/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>


<div class="row" style="margin-bottom:20px; margin-left:1px;">
    <div class="col-lg-12">
        <h1 class="page-header">News 등록 페이지</h1>
    </div>
</div>

<div class="panel" style="margin-left:1px;">
    <div id="contAreaBox">
        <div class="panel">
            <div class="panel-body">
                <form role="form" action="/board/create_action" method="post">
                    <div class="table-responsive" style="text-align:center;">
                        <table id="datatable-scroller"
                               class="table table-bordered tbl_Form">
                            <caption></caption>
                            <colgroup>
                                <col width="250px" />
                                <col />
                            </colgroup>
                            <tbody>
                            <tr>
                                <th class="active" >작성자</th>
                                <td class="form-inline"><input type="text" id="board_writer"
                                                               name="board_writer" class="form-control" style="width: 200px" value="관리자" />
                                </td>
                            </tr>
                            <tr>
                                <th class="active">제목</th>
                                <td class="form-inline"><input type="text" id="board_title"
                                                               name="board_title" class="form-control" style="width: 840px" />
                                </td>
                            </tr>
                            <tr>
                                <th class="active" >내용</th>
                                <td class="form-inline"><textarea
                                        id="smartEditor" name="smartEditor" cols="100" rows="10"
                                        class="form-control"></textarea></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="margin-right:100px; float: right">
                        <button type="button" class="btn btn-primary" onclick="submitPost()">등록</button>
                        <a href="/board/list" class="btn btn-danger">취소</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%--<form action="/resources/smarteditor/sample/viewer/index.php" method="post">--%>
<%--    <textarea name="smartEditor" id="smartEditor" rows="10" cols="100" style="width:766px; height:412px; display:none;"></textarea>--%>
<%--    <!--textarea name="smartEditor" id="smartEditor" rows="10" cols="100" style="width:100%; height:412px; min-width:610px; display:none;"></textarea-->--%>
<%--    <p>--%>
<%--        <input type="button" onclick="pasteHTML();" value="본문에 내용 넣기" />--%>
<%--        <input type="button" onclick="showHTML();" value="본문 내용 가져오기" />--%>
<%--        <input type="button" onclick="submitContents(this);" value="서버로 내용 전송" />--%>
<%--        <input type="button" onclick="setDefaultFont();" value="기본 폰트 지정하기 (궁서_24)" />--%>
<%--    </p>--%>
<%--</form>--%>

<script type="text/javascript" src="/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
    var oEditors = [];

    // 추가 글꼴 목록
    //var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "smartEditor",
        sSkinURI: "/resources/smarteditor/SmartEditor2Skin.html",
        htParams : {
            bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            //bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
            //aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
            fOnBeforeUnload : function(){
                //alert("완료!");
            }
        }, //boolean
        fOnAppLoad : function(){
            //예제 코드
            //oEditors.getById["smartEditor"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
        },
        fCreator: "createSEditor2"
    });

    function pasteHTML() {
        var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
        oEditors.getById["smartEditor"].exec("PASTE_HTML", [sHTML]);
    }

    function showHTML() {
        var sHTML = oEditors.getById["smartEditor"].getIR();
        alert(sHTML);
    }

    function submitContents(elClickedObj) {
        oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.

        // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("smartEditor").value를 이용해서 처리하면 됩니다.

        try {
            elClickedObj.form.submit();
        } catch(e) {}
    }

    function setDefaultFont() {
        var sDefaultFont = '궁서';
        var nFontSize = 24;
        oEditors.getById["smartEditor"].setDefaultFont(sDefaultFont, nFontSize);
    }

    function submitPost(){
        oEditors.getById['editorTxt'].exec("UPDATE_CONTENTS_FIELD", [])
        let content = document.getElementById('editorTxt').value

        if(content == ''){
            alert("내용을 입력해주세요")
            oEditors.getById['editorTxt'].exec("FOCUS")
            return;
        } else {
            console.log(content)
        }
    }
</script>

<%@include file="../../includes/footer.jsp"%>
