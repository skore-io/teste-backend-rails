module Contents
  class ShowService
    attr_reader :content

    def initialize(content)
      @content = content
    end

    def perform
      update_to_watched unless content.watched

      ContentPresenter.new(content)
    end

    private

    def update_to_watched
      content.update_attribute(:watched, true)
    end
  end
end