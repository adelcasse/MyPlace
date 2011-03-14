module ApplicationHelper
  def nl2br text
    sanitize(text.gsub(/\n/, '<br />'), :tags => %w(br))
  end
end
