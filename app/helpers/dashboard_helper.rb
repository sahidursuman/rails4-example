module DashboardHelper

  require 'bundler'
  def bundled_gems
    Bundler.load.specs
  end

  def all_gems
    cnt = 0
    others = "<table class='table'><tr><td>"
    bundled_gems.sort{|a,b|a.name<=>b.name}.each do |spec|
      cnt += 1
      others += "#{spec.name} #{spec.version}<br />"
      others += "</td><td>" if (cnt % 18) == 0
    end
    others +  "</td></tr></table>"
  end

  def display_devise_version
    g = bundled_gems.find{|s| s.name =~ /devise/}
    "#{g.name} #{g.version}<br />"
  end
  def display_bootstrap_version
    g = bundled_gems.find{|s| s.name =~ /bootstrap/}
    "#{g.name} #{g.version}<br />"
  end
  def display_cancan_version
    g = bundled_gems.find{|s| s.name =~ /cancan/}
    "#{g.name} #{g.version}<br />"
  end

end
