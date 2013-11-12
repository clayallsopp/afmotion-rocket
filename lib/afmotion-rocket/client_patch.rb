module AFMotion
  module Rocket
    def self.included(klass)
      klass.send(:alias_method,"headers_without_wrapper", "headers")
      klass.send(:alias_method,"headers", "headers_with_wrapper")
    end

    def rocket_client
      @rocket_client ||= begin
        client = AFRocketClient.alloc.init
        self.all_headers.each do |header, value|
          client.requestSerializer.headers[header] = value
        end
        client
      end
    end

    def subscribe(url, &callback)
      url_string = NSURL.URLWithString(url, relativeToURL: self.baseURL).absoluteString
      error_ptr = Pointer.new(:object)
      event_source = rocket_client.SUBSCRIBE(url_string, usingBlock: ->(operations, error) {
        callback.call operations.map(&:to_h)
      }, error: error_ptr)

      # .retain because event_source will otherwise be autoreleased.
      # see also: https://github.com/AFNetworking/AFRocketClient/issues/3 .
      [error_ptr[0], event_source.retain]
    end

    # Synchronize headers between clients
    class HeaderWrapper
      def initialize(source)
        @source = WeakRef.new(source)
      end

      def [](key)
        @source.headers_without_wrapper[key]
      end

      def []=(key, value)
        @source.headers_without_wrapper[key] = value
        @source.rocket_client.requestSerializer.headers[key] = value
      end
    end

    def headers_with_wrapper
      @headers_wrapper ||= HeaderWrapper.new(self)
    end
  end
end

class AFHTTPRequestOperationManager
  include AFMotion::Rocket
end

class AFHTTPSessionManager
  include AFMotion::Rocket
end