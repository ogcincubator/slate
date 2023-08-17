module Multilang
  def block_code(code, full_lang_name)
    if full_lang_name
      parts = full_lang_name.split('--')
      rouge_lang_name = (parts) ? parts[0] : "" # just parts[0] here causes null ref exception when no language specified
      if rouge_lang_name == 'jsonld'
        rouge_lang_name = 'json'
      elsif rouge_lang_name == 'ttl'
        rouge_lang_name = 'turtle'
      end
      super(code, rouge_lang_name).sub(/highlight (#{rouge_lang_name}|plaintext)/) do |match|
        "highlight #{rouge_lang_name} tab-" + full_lang_name
      end
    else
      super(code, full_lang_name)
    end
  end
end

require 'middleman-core/renderers/redcarpet'
Middleman::Renderers::MiddlemanRedcarpetHTML.send :include, Multilang
