module AlertHelper
  def parse_flash(type)
    if type == 'notice'
      'alert alert-success'
    elsif type == 'warning'
      'alert alert-danger'
    else
      'alert alert-info'
    end
  end
end
