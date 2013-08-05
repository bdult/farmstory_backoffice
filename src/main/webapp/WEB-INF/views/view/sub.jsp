<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#editor {
	overflow: scroll; 
	max-height: 300px
}
</style>

<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li>
				<i class="icon-home home-icon"></i>
				<a href="#">Home</a>

				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">Sub</li>
		</ul><!--.breadcrumb-->

		<div class="nav-search" id="nav-search">
			<form class="form-search">
				<span class="input-icon">
					<input type="text" placeholder="Search ..." class="input-small nav-search-input" id="nav-search-input" autocomplete="off" />
					<i class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div><!--#nav-search-->
	</div>

	<div class="page-content">
		<div class="page-header position-relative">
			<h1>
				Sub
				<small>
					<i class="icon-double-angle-right"></i>
					overview &amp; stats
				</small>
			</h1>
		</div><!--/.page-header-->

		<div class="row-fluid">
			<div class="span12">
				<!--PAGE CONTENT BEGINS-->
				<div class="wysiwyg-toolbar btn-toolbar center        wysiwyg-style1"> <div class="btn-group">  <a class="btn btn-small  dropdown-toggle" data-toggle="dropdown" title="" data-original-title="Font"><i class="icon-font"></i><i class="icon-angle-down icon-on-right"></i></a>  <ul class="dropdown-menu dropdown-light"> <li><a data-edit="fontName Arial" style="font-family:'Arial'">Arial</a></li>  <li><a data-edit="fontName Courier" style="font-family:'Courier'">Courier</a></li>  <li><a data-edit="fontName Comic Sans MS" style="font-family:'Comic Sans MS'">Comic Sans MS</a></li>  <li><a data-edit="fontName Helvetica" style="font-family:'Helvetica'">Helvetica</a></li>  <li><a data-edit="fontName Open Sans" style="font-family:'Open Sans'">Open Sans</a></li>  <li><a data-edit="fontName Tahoma" style="font-family:'Tahoma'">Tahoma</a></li>  <li><a data-edit="fontName Verdana" style="font-family:'Verdana'">Verdana</a></li>  </ul> </div> <div class="btn-group">  <a class="btn btn-small  dropdown-toggle" data-toggle="dropdown" title="" data-original-title="Font Size"><i class="icon-text-height"></i>&nbsp;<i class="icon-angle-down icon-on-right"></i></a>  <ul class="dropdown-menu dropdown-light">  <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>  <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>  <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>  </ul>  </div> <div class="btn-group">  <a class="btn btn-small btn-info" data-edit="bold" title="" data-original-title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>  <a class="btn btn-small btn-info" data-edit="italic" title="" data-original-title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>  <a class="btn btn-small btn-info" data-edit="strikethrough" title="" data-original-title="Strikethrough"><i class="icon-strikethrough"></i></a>  <a class="btn btn-small btn-info" data-edit="underline" title="" data-original-title="Underline"><i class="icon-underline"></i></a>  </div> <div class="btn-group">  <a class="btn btn-small btn-success" data-edit="insertunorderedlist" title="" data-original-title="Bullet list"><i class="icon-list-ul"></i></a>  <a class="btn btn-small btn-success" data-edit="insertorderedlist" title="" data-original-title="Number list"><i class="icon-list-ol"></i></a>  <a class="btn btn-small btn-purple" data-edit="outdent" title="" data-original-title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a>  <a class="btn btn-small btn-purple" data-edit="indent" title="" data-original-title="Indent (Tab)"><i class="icon-indent-right"></i></a>  </div> <div class="btn-group">  <a class="btn btn-small btn-primary active" data-edit="justifyleft" title="" data-original-title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>  <a class="btn btn-small btn-primary" data-edit="justifycenter" title="" data-original-title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>  <a class="btn btn-small btn-primary" data-edit="justifyright" title="" data-original-title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>  <a class="btn btn-small btn-inverse" data-edit="justifyfull" title="" data-original-title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>  </div> <div class="btn-group">  <a class="btn btn-small btn-pink dropdown-toggle" data-toggle="dropdown" title="" data-original-title="Hyperlink"><i class="icon-link"></i></a>  <div class="dropdown-menu dropdown-caret input-append pull-right">							<input placeholder="URL" type="text" data-edit="createLink">							<button class="btn btn-small btn-primary" type="button">Add</button>						</div>  <a class="btn btn-small btn-pink" data-edit="unlink" title="" data-original-title="Remove Hyperlink"><i class="icon-unlink"></i></a>  </div> <div class="btn-group">  <a class="btn btn-small btn-success dropdown-toggle" data-toggle="dropdown" title="" data-original-title="Insert picture"><i class="icon-picture"></i></a>  <div class="dropdown-menu dropdown-caret input-append pull-right">							<input placeholder="Image URL" type="text" data-edit="insertImage">							<button class="btn btn-small btn-primary" type="button">Insert</button> <div class="center">								<button class="btn btn-small btn-success wysiwyg-choose-file" type="button"><i class="icon-file"></i> Choose Image …</button>								<input type="file" data-edit="insertImage">							  </div> </div>  </div> <div class="btn-group">  <select class="hide wysiwyg_colorpicker" title="Change Color" style="display: none;">  <option value="#ac725e">#ac725e</option>  <option value="#d06b64">#d06b64</option>  <option value="#f83a22">#f83a22</option>  <option value="#fa573c">#fa573c</option>  <option value="#ff7537">#ff7537</option>  <option value="#ffad46">#ffad46</option>  <option value="#42d692">#42d692</option>  <option value="#16a765">#16a765</option>  <option value="#7bd148">#7bd148</option>  <option value="#b3dc6c">#b3dc6c</option>  <option value="#fbe983">#fbe983</option>  <option value="#fad165">#fad165</option>  <option value="#92e1c0">#92e1c0</option>  <option value="#9fe1e7">#9fe1e7</option>  <option value="#9fc6e7">#9fc6e7</option>  <option value="#4986e7">#4986e7</option>  <option value="#9a9cff">#9a9cff</option>  <option value="#b99aff">#b99aff</option>  <option value="#c2c2c2">#c2c2c2</option>  <option value="#cabdbf">#cabdbf</option>  <option value="#cca6ac">#cca6ac</option>  <option value="#f691b2">#f691b2</option>  <option value="#cd74e6">#cd74e6</option>  <option value="#a47ae2">#a47ae2</option>  <option value="#444444">#444444</option>  </select><div class="dropdown dropdown-colorpicker"><a data-toggle="dropdown" class="dropdown-toggle" href="#"><span class="btn-colorpicker" style="background-color:#ac725e" data-original-title="" title=""></span></a><ul class="dropdown-menu pull-right"><li><a class="colorpick-btn selected" href="#" style="background-color:#ac725e;" data-color="#ac725e"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#d06b64;" data-color="#d06b64"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#f83a22;" data-color="#f83a22"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#fa573c;" data-color="#fa573c"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#ff7537;" data-color="#ff7537"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#ffad46;" data-color="#ffad46"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#42d692;" data-color="#42d692"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#16a765;" data-color="#16a765"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#7bd148;" data-color="#7bd148"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#b3dc6c;" data-color="#b3dc6c"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#fbe983;" data-color="#fbe983"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#fad165;" data-color="#fad165"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#92e1c0;" data-color="#92e1c0"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#9fe1e7;" data-color="#9fe1e7"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#9fc6e7;" data-color="#9fc6e7"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#4986e7;" data-color="#4986e7"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#9a9cff;" data-color="#9a9cff"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#b99aff;" data-color="#b99aff"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#c2c2c2;" data-color="#c2c2c2"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#cabdbf;" data-color="#cabdbf"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#cca6ac;" data-color="#cca6ac"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#f691b2;" data-color="#f691b2"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#cd74e6;" data-color="#cd74e6"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#a47ae2;" data-color="#a47ae2"></a></li><li><a class="colorpick-btn" href="#" style="background-color:#444444;" data-color="#444444"></a></li></ul></div>  <input style="display:none;" disabled="" class="hide" type="text" data-edit="foreColor">  </div> <div class="btn-group">  <a class="btn btn-small btn-grey" data-edit="undo" title="" data-original-title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>  <a class="btn btn-small btn-grey" data-edit="redo" title="" data-original-title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>  </div> <input type="text" data-edit="inserttext" x-webkit-speech="" class="wysiwyg-speech-input" style="position: absolute; top: 212px; left: 1668px;"></div><div></div>
				<div class="wysiwyg-editor" id="editor" contenteditable="true"><div style="text-align: left;"></div></div>
				<!--PAGE CONTENT ENDS-->
			</div><!--/.span-->
		</div><!--/.row-fluid-->
	</div><!--/.page-content-->
</div>

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
	<i class="icon-double-angle-up icon-only bigger-110"></i>
</a>

<script>
$(function(){
});
</script>

		