require 'tmail'

module TMail
  class Mail 
    def plainest_body
      plain, html = find_plain_and_html(self)
      plain.blank? ? html : plain
    end
    
    private 
    
    def find_plain_and_html(mail)
      plain = ''
      html = ''
      
      if mail.multipart?
        mail.parts.each do |part|
          p, h = find_plain_and_html(part)
          plain += p
          html += h
        end
      else
        if mail.content_type =~ /text\/plain/
          plain += mail.body
        elsif mail.content_type =~ /text\/html/
          html += mail.body
        end
      end
      
      [plain, html]
    end
  end
end
