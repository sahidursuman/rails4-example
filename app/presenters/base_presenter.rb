# http://railscasts.com/episodes/287-presenters-from-scratch

class BasePresenter
  def initialize(object, template)
    @object = object
    @template = template
  end

  def self.presents(name)
    define_method(name) do
      @object
    end
  end

  def respond_to_missing?(*)
    true
  end

  def method_missing(*args, &block)
    @template.send(*args, &block)
    super
  end
end
