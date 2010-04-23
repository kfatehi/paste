module PastesHelper

  def languages
    %w(
Ruby
C
C++
CSS
Delphi
diff
Groovy
HTML
Java
JavaScript
JSON
Nitro-XHTML
PHP
Python
RHTML
Scheme
SQL
XML
YAML
    )
  end
  
  def html_title(id=nil)
    id.nil? ? "pastebot: #mindynamics @ irc.freenode.net" : "paste ##{id}"
  end
  
  def toggle(switch)
    switch ||= '0'
    switch.to_i > 0 ? '?' : '?line_numbers=1'
  end
  
  def paste_title(s)
    s.nil? || s.empty? || s == 'untitled' ? return : "entitled \"#{s}\""
  end
  
end

