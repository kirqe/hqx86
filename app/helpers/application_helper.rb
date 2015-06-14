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
      when "mini" 
        "#44D1FF;"
      when "mid" 
         "#FFA227;"
      when "pro" 
         "#F73753;"
      when "laptop" 
         "#6E68D1;"
      else "#c6c6cf"
    end
  end
  
  def bar_link(text, path)
    options = current_page?(path) ? { class: "active"} : {}
    content_tag(:dd, options) do 
      link_to text, path
    end
  end
  
end
