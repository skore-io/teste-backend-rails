class ContentPresenter < Draper::Decorator
  delegate_all

  def expired
    return true if object.expires_at < Time.current

    false
  end
end