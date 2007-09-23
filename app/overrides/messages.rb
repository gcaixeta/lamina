module ActiveRecord
  class Errors
     @@default_error_messages = {
       :inclusion => "não está incluído na lista",
       :exclusion => "está reservado",
       :invalid => "é inválido.",
       :confirmation => "não corresponde á confirmação",
       :accepted => "deve ser aceito",
       :empty => "não pode estar sem conteúdo",
       :blank => "não pode estar em branco",
       :too_long => "muito longo (máximo %d caracteres)",
       :too_short => "muito curto (mínimo %d caracteres)",
       :wrong_length => "de comprimento errado (deveria ter %d caracteres)",
       :taken => "já está em uso",
       :not_a_number => "não é um número"
     }
  end
end
