module ApplicationHelper

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
     extensions = {
       autolink: true,
       tables: true,
       no_intraemphasis: true,
       hard_wrap: true    
     })
    markdown.render(text).html_safe
  end


  def lab(attr)
    case attr 
      when "Mini" 
        "#148DC8;"
      when "Mid" 
         "#F1684D;"
      when "Pro" 
         "#D94B61;"
      when "Laptop" 
         "#6E68D1;"
      else "#c6c6cf"
    end
  end
end
