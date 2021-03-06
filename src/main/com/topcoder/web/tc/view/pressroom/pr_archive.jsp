<%--
  - Author: TCSASSEMBER
  - Version: 1.1
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page is the press release archive page in press room.
  -
  - Version 1.1 (Central content management generating JSP pages automatically Assembly) changes:
  - Use AJAX to get RSS feed dynamic and render the data to JSP page.
--%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder Press Room</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_pressroom"/>
    </jsp:include>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <script type="text/javascript" src="/js/home/jquery-1.2.6.min.js"></script>
    <script type="text/javascript" src="/js/rssArticles.js"></script>
    
    <script type="text/javascript">
    $(document).ready(function() {
        getRssArticles('<%=Constants.RELEASE_ARCHIVE_RSS%>', renderReleaseArchive, '<%=Constants.RELEASE_ARCHIVE_CATEGORY%>');
    });
    </script>
</head>
<body>

<jsp:include page="../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div align="center">
<%-- YOUR WORK GOES HERE --%>

<%-- pr_wrapper begin --%>
<div id="pr_wrapper">

    <%-- pr_header begin --%>
    <div id="pr_header">
        <h1><a onFocus="this.blur();" href="/tc?module=Static&amp;d1=pressroom&amp;d2=index" name="pr_top">Press Room</a></h1>
    </div>
    <%-- pr_header end --%>
    
    <%-- pr_menu begin --%>
    <div id="pr_menu">
        <ul>
        <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=index" title="Current News"><span>Current News</span></a></li>
        <li id="pr_menuactive"><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_archive" title="Press Release Archive"><span>Press Release Archive</span></a></li>
        <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_archive" title="Articles Archive"><span>Articles Archive</span></a></li>
        <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=mediaResources" title="Media Resources"><span>Media</span></a></li>
        <li><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=mediaRequestForm" title="Media Request Form"><span>Media Request Form</span></a></li>
        </ul>
    </div>
    <%-- pr_menu end --%>
    <div class="pr_clear"></div>
    
    
    <%-- content rounded frame wrapper --%>
    <div id="pr_frame"><div id="pr_frame2"><div id="pr_frame3">
 
        <div id="pr_content" align="left">
            <div id="loading"><img src="/i/loading.gif" /></div>
        </div>
        <%-- pr_content end --%>

    </div></div></div>
    <%-- pr_frame_inner pr_frame --%>

</div>
<%-- pr_wrapper end --%>

<%-------------------------%>
            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../foot.jsp" />
</body>
</html>