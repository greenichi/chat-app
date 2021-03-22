FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    association :user
    association :room

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      # io: File.openで設定したパスのファイル（public/images/test_image.png）を、test_image.pngというファイル名で保存をしています。
      # after(:build)だとテキストと画像が同時に保存され、after(:create)だとテキストは別で画像のみ先に保存されてしまう
      # 独立して保存されるのは今回望ましくない
    end
  end
end