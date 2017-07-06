module ApplicationHelper

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  def spinner_tag(id)
    # Assuming spinner image is called "spinner.gif"
    image_tag('spinner.gif', id: id, alt: t('label.loading'), style: 'display:none')
  end

  def spaces(num)
    "\u{0020}" * num
  end

end
