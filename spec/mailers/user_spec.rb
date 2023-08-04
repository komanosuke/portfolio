require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user) { FactoryBot.create(:user) }

  describe 'send_mail' do
    let(:mail) { UserMailer.send_mail(user) }

    it 'renders the subject' do
      expect(mail.subject).to eq('お問い合わせ通知')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['toshihiko.komai616@gmail.com'])
    end

    it 'assigns @user' do
        expect(mail.body.encoded).to match(user.email)
    end
  end

  describe 'account_activation' do
    let(:mail) { UserMailer.account_activation(user) }

    it 'renders the subject' do
      expect(mail.subject).to eq('アカウント有効化')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['toshihiko.komai616@gmail.com'])
    end

    it 'assigns @user' do
      expect(mail.body.encoded).to match(user.email)
    end
  end

  describe 'password_reset' do
    let(:mail) { UserMailer.password_reset(user) }

    it 'renders the subject' do
      expect(mail.subject).to eq('パスワード再設定')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['toshihiko.komai616@gmail.com'])
    end

    it 'assigns @user' do
      expect(mail.body.encoded).to match(user.email)
    end
  end
end
