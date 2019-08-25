require "net/http"
require 'open-uri'

class InstagramScraper
    
    def self.scrape(nickname)
        url = "https://www.instagram.com/#{nickname}/"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri).body
        
        html_doc = Nokogiri::HTML(response)
        javascript = nil
        
        html_doc.search("/html/body/script").each do |script|
            
            content = script.text.strip
            
            
            if content["window._sharedData"]
                javascript = content
                break
            end
        end
        
        
        json = javascript.split("window._sharedData =")[1].strip.chomp(";")
        json = ExecJS.eval("JSON.stringify(#{json})")
        
        data = nil
        
        begin
            
            data = JSON.parse(json)
        rescue Exception => e
            nil
        end
        
        
        
        json_parsed = data["entry_data"]["ProfilePage"][0]["graphql"]["user"]["edge_owner_to_timeline_media"]["edges"]
        
        
        json_parsed.map do |nod|
            nod["node"]["display_url"]
        end
    end    
end