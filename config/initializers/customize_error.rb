# frozen_string_literal: true

ActionView::Base.field_error_proc = proc do |html_tag, _instance|
  if html_tag =~ /^<label/
    html_tag.html_safe
  else
    "<div class=\"field_with_errors form-control is-invalid\">#{html_tag}</div>".html_safe
  end
end
