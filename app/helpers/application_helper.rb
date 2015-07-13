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
         "#EB7A65;"
      when "pro" 
         "#F73753;"
      when "laptop" 
         "#6E68D1;"
       when "success"
         "#43AC6A;"
       when "notice"
         "#a0d3e8;"
      else "#c6c6cf"
    end
  end
  
  def bar_link(text, path)
    options = current_page?(path) ? { class: "active"} : {}
    content_tag(:dd, options) do 
      link_to text, path
    end
  end

  def display 
    
  end
  
end
