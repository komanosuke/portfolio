class Contact < ApplicationRecord
    enum subject: {
        'キャンセルについて' => 0,
        '新商品について' => 1,
        'サービスについて' => 2
    }
end