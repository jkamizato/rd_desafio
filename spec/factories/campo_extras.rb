FactoryGirl.define do
  factory :campo_extra, class: CampoExtra do |f|
    f.label 'Idade'
    f.chave 'idade'
    f.campo_tipo 'text'
  end

  factory :campo_extra_text, class: CampoExtra do |f|
    f.label 'Text'
    f.chave 'text'
    f.campo_tipo 'text'
  end

  factory :campo_extra_textarea, class: CampoExtra do |f|
    f.label 'Textarea'
    f.chave 'textarea'
    f.campo_tipo 'textarea'
  end

  factory :campo_extra_combobox, class: CampoExtra do |f|
    f.label 'Combobox'
    f.chave  'combobox'
    f.campo_tipo 'combobox'
    f.select_option "[['Text1', 'item1'], ['Text2', 'item2']]"
  end
end
