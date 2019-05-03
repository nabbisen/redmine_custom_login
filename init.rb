Redmine::Plugin.register :redmine_custom_login do
  name 'Redmine Custom Login plugin'
  author 'nabbisen'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'https://github.com/nabbisen'
end

class CustomFooterHookViewListener < Redmine::Hook::ViewListener
  def view_layouts_base_html_head(context={})
    [
      "<style>@media screen and (max-width: 899px){body.action-login #header{display:flex;flex-direction:row-reverse;justify-content:space-b    etween;align-items:center;}body.action-login #header>h1{display:block !important;margin-left:54px;font-size:1.2em;}}</style>",
    ]
  end
  def view_account_login_top(context={})
    plugin_name = File.basename(__dir__)
    login_header_content = image_tag('logo.jpg', :plugin => plugin_name, :style => 'border-radius: 1em;')
    [
      "<div style=\"text-align:center;padding:2.4em 0 0.5em;\">#{login_header_content}</div>",
    ]
  end
end
