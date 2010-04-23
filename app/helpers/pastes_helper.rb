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
  
  def toggle(switch)
    switch ||= '0'
    switch.to_i > 0 ? '?' : '?line_numbers=1'
  end
  
  def paste_title(s)
    s.nil? || s.empty? || s == 'untitled' ? return : "entitled \"#{s}\""
  end
  
  def set_form_focus # target first form
    javascript_tag("Event.observe(window, 'load', function() {
    var firstForm = $A(document.getElementsByTagName('form'))[0];
    Form.focusFirstElement(firstForm);
    });")
  end
  
  def set_focus(id) # for formless input fields
    javascript_tag("Event.observe(window, 'load', $('#{id}').focus());")
  end
  
end

