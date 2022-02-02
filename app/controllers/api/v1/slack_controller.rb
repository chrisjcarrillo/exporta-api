

class Api::V1::SlackController < ApplicationController

    require 'slack-ruby-client'

            
    Slack.configure do |config|
        config.token = 'xoxb-321225659618-3039247589043-YuFi3K8pberAFDMX5owx2g9T'
        raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
    end

    def index
    end
    # postData(`https://5cf6-2601-589-4102-40b0-d64-7a67-bb5f-70f7.ngrok.io/api/v1/slack/send_notification?source=${sourceParam}&medium=${mediumParam}&campaign=${campaignParam}&term=${termParam}&contentParam=${contentPram}`)
    def send_notification
        client = Slack::Web::Client.new
        @source = params[:source]
        @medium = params[:medium]
        @campaign = params[:campaign]
        @term = params[:term]
        @content = params[:contentParam]

        @campaignId = params[:campaignId]
        @adGroupId = params[:adGroupId]
        @ad = params[:ad]
        @targetId = params[:targetId]
        @keywords = params[:keywords]
        @matchtype = params[:matchtype]

        client.auth_test
        client.chat_postMessage(channel: '#paramater-testing', text: "A user visited https://wholesale.exporta.io with the Paramaters:\n• Source: #{@source}\n• Medium: #{@medium}\n• Campaign ID: #{@campaignId}\n• Campaign: #{@campaign}\n• Ad: #{@ad}\n• Adgroup ID: #{@adGroupId}\n• Target Id: #{@targetId}\n• Term: #{@term}\n• Keywords: #{@keywords}\n• Content: #{@content}\n• Matchtype: #{@matchtype}", as_user: true)
    end
end
