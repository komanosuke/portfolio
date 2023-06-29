class SocketController < ApplicationController
    layout 'socket'

    def socket
        @user = current_user
    end

    def send_msg
        socket_message(params[:cmd])
    end

    def socket_message(msg)
        maxlen = 400
        TCPSocket.open("localhost", 4000) do |socket|
            t1 = Thread.start do #送信スレッド
                socket.write(msg)
            end

            t2 = Thread.start do #受信スレッド
                begin
                    loop do
                        buf = socket.readpartial(maxlen) # サーバから受信 String型として取得
                        pp 'サーバからの返答：' + buf.force_encoding("UTF-8") # 動作確認のためクライアント側標準出力
                    end
                rescue EOFError => e
                    $stdout.write("eof\n") # 切断
                end
            end
            sleep(0.1)
            t1.kill
            t2.kill
        end
    end
end
