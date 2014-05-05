module DashboardHelper

  require 'bundler'
  def bundled_gems
    Bundler.load.specs
  end

  def all_gems
    cnt = 0
    others = "<table class='table'><tr><td>"
    bundled_gems.sort { |gem_a, gem_b|gem_a.name <=> gem_b.name }.each do |spec|
      cnt += 1
      others += "#{spec.name} #{spec.version}<br />"
      others += '</td><td>' if (cnt % 18) == 0
    end
    others +  '</td></tr></table>'
  end

  def display_devise_version
    gem = bundled_gems.find { |str| str.name =~ /devise/ }
    "#{gem.name} #{gem.version}<br />"
  end

  def display_bootstrap_version
    gem = bundled_gems.find { |str| str.name =~ /bootstrap/ }
    "#{gem.name} #{gem.version}<br />"
  end

  def display_cancan_version
    gem = bundled_gems.find { |str| str.name =~ /cancan/ }
    "#{gem.name} #{gem.version}<br />"
  end

end
