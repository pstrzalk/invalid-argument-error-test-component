module InvalidArgumentErrorTestComponent
  module Messages
    module Commands
      class DoSomething
        include Messaging::Message

        Details = Struct.new(:id, :name, keyword_init: true)

        attribute :something_id, String
        attribute :details, Details, default: -> { Details.new }

        def transform_read(data)
          pp "transform_read data[:details] class name", data[:details].class.name

          return unless data[:details]

          data[:details] = Details.new(data[:details])
        end

        def transform_write(data)
          data[:details] = data[:details].to_h
        end
      end
    end
  end
end
