$(function(){$("select").select2()}),$(document).ready(function(){return $("#organizacion_estado_id").change(function(){var i=$(this).val();$.get("organizaciones/actualizar_select_municipios?estado_id="+i,function(i){$("#municipioSelectDiv").html(i)})})});