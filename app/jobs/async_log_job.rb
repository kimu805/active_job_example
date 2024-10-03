class AsyncLogJob < ApplicationJob
  queue_as do
    case self.arguments.first[:message]
    when "to async_log"
      :async_log
    else
      :default
    end
  end

  def perform(message: "hello")
    AsyncLog.create!(message: message)
  end

  retry_on 
end
