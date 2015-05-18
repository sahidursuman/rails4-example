class ListGems
  require 'bundler'

  attr_accessor :gems

  def initialize
    @gems = Bundler.load.specs
  end

  def all_gems_table
    cnt = 0
    others = "<table class='table'><tr><td>"
    sorted_gems.each do |spec|
      cnt += 1
      others += "#{spec.name} #{spec.version}<br />"
      others += '</td><td>' if (cnt % 18) == 0
    end
    (others + '</td></tr></table>').html_safe
  end

  def display_version(regex)
    gem = gems.find { |str| str.name =~ regex }
    "#{gem.name} #{gem.version}<br />".html_safe
  end

  private

  def sorted_gems
    self.gems.sort { |gem_a, gem_b| gem_a.name <=> gem_b.name }
  end
end