Payjp.api_key = ENV['PAYJP_SECRET_KEY']

# 開発環境でのみSSL検証をスキップ（本番では実行されない）
if Rails.env.development?
  require 'openssl'
  OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)
end