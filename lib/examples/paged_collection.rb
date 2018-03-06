class PagedCollection < Reporting::Job
  def initialize
  end

  setup do
  end

  source do
  end

  cursor name: :paged_api do
    setup do
      
    end

    fetch do

    end

    finalize do

    end
  end

  symbolize_keys

  transform do
  end

  # Destination that can immediately trigger multiple pipelines
  emitter do

  end

  destination do
  end

  finalize do
  end
end
