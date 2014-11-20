# encoding: UTF-8
module ResumenesHelper

  def notas_estructuradas resumen, url=nil, informe_id=nil
    
    # Se agregan los botones de editar y eliminar resumen
    mensaje = ""
    mensaje += crud_botones resumen, url unless (controller_name=="informes" and (action_name=="paso4" or action_name=="show"))
    mensaje += " <strong> #{resumen.vocero.nombre} </strong>"
    mensaje += resumen.contenido if resumen.contenido
    mensaje += enlaces_notas resumen 
		sub_resumenes = resumen.resumenes
		sub_resumenes.each do |sub_resumen|
		  if action_name.eql? "paso2"
		    mensaje += link_to "separar", {:controller => 'resumenes', :action => "separar", :id => sub_resumen.id, :informe_id => informe_id},  {:class => 'btn btn-mini'} 	#if (not informe_id.nil? and action_name!="paso4")
	    else
	      mensaje += " / "
      end
			mensaje +=  "<strong> / #{sub_resumen.vocero.nombre}: </strong>" if not resumen.vocero_id.eql? sub_resumen.vocero_id
			mensaje += sub_resumen.contenido
			mensaje += enlaces_notas sub_resumen
		end		
		
    raw mensaje
  end
  
  def crud_botones resumen, url=nil # Agregan los botones de editar y eliminar resumen
    url_val = url.nil? ? "" : "?url=#{url}"
    mensaje = "<a href='/resumenes/#{resumen.id}#{url_val}' class='btn btn-mini btn-danger' data-confirm='¿Esta Seguro?' data-method='delete' rel='nofollow'>
    						<i class='icon-trash icon-black'></i>
    </a> | "
    mensaje += "<a href='/wizard/paso3/#{resumen.id}#{url_val}' class='btn btn-mini btn-info'>
    						<i class='icon-edit icon-black'></i>
    </a>"
    return mensaje
  end
  
   # Agrega enlaces de notas 
  def enlaces_notas resumen
    mensaje = ""
    if resumen.notas
			resumen.notas.each_with_index do |nota,i|
				mensaje += link_nota nota
				mensaje += "-" if i < resumen.notas.count-1
			end
		end
		return mensaje
  end
  
end
