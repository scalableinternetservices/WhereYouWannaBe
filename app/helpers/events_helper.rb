require 'net/http'
module EventsHelper
    def google_map(center)
        "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17"
    end

    def remote_file_exists?(url)
      !url.match?(/^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.jpg)?$/ix)

    # url = URI.parse(url)
    # Net::HTTP.start(url.host, url.port) do |http|
    #   return http.head(url.request_uri)['Content-Type'].start_with? 'image'
    # end
    end
end
