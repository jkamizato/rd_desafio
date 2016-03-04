module CampoExtrasHelper

  def build_campo_extra(campo, valor_extra)
    case campo.campo_tipo when 'text'
      text_field_tag "campo_extra[#{campo.id}][#{campo.chave.to_sym}]", valor_extra[campo.id], class: 'form-control'
    when 'textarea'
        text_area_tag "campo_extra[#{campo.id}][#{campo.chave.to_sym}]", valor_extra[campo.id], class: 'form-control'
    when 'combobox'
      @option = eval(campo.select_option)
      select_tag "campo_extra[#{campo.id}][#{campo.chave.to_sym}]",
                       options_for_select(@option, valor_extra[campo.id]), class: 'form-control'

    end
  end
end
