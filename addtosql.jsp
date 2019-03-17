<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.tuhol.webside.users.tposs.*" %>
<%
response.setContentType( "text/html" );
response.setCharacterEncoding( "UTF-8" );
String coverpicid="";
String level="";
String type="";
String contextarea="";
String article="";
String title="";
String page_tips="";
String uptabs="";
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	DiskFileItemFactory factory = new DiskFileItemFactory();
	ServletContext servletContext = this.getServletConfig().getServletContext();
	File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
	factory.setRepository(repository);
	ServletFileUpload upload = new ServletFileUpload(factory);
	try{
		List<FileItem> list=upload.parseRequest(request); 
		Iterator<FileItem> itr=list.iterator();
		while(itr.hasNext()){
			FileItem item=itr.next();
			if(item.isFormField()){  
                String name = item.getFieldName();  //得到名称
                if(name.equals("coverpicid")){coverpicid=item.getString("UTF-8");}
                if(name.equals("level")){level=item.getString("UTF-8");}
                if(name.equals("type")){type=item.getString("UTF-8");}
                if(name.equals("contextarea")){contextarea=item.getString("UTF-8");}
                if(name.equals("article")){article=item.getString("UTF-8");}
                if(name.equals("title")){title=item.getString("UTF-8");}
                if(name.equals("page_tips")){page_tips=item.getString("UTF-8");}
                if(name.equals("uptabs")){uptabs=item.getString("UTF-8");}
               }
		}
		list.clear();
	}catch(Exception e){
		e.printStackTrace();
		System.out.println("sth wrong");
	}
%> 