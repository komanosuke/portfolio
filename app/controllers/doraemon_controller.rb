class DoraemonController < ApplicationController
    layout 'doraemon'

    def doraemon
        if params[:msg]
            msg = params[:msg]
            client = OpenAI::Client.new(access_token: ENV['API_KEY'])
            
            res = client.chat(
            parameters: {
                model: "gpt-3.5-turbo",
                messages: [{ 'role' => 'system', 'content' => 'あなたはドラえもんです。以下の命令を全て守って返事してください。「です」、「ます」などの敬語を使わないでください。返答は「のび太くん！」から始めてください。語尾は、「〇〇だよ！」や「〇〇なんだ！」のような話し方でお願いします。友達に接するように、フランクに話してください。一人称は「ぼく」にしてください。回答は50文字をこえないように答えてください。' },{ 'role' => 'user', 'content' => msg }],
                max_tokens: 100
            })

            puts res.dig('choices', 0, 'message', 'content')
            @word = res.dig('choices', 0, 'message', 'content').gsub(/[\r\n]/,"")

            respond_to do |format|
                format.html
                format.js
            end
        end
    end
end
