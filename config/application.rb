require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Naganocake
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]


    #バリデーションのエラーを各入力欄下に表示する設定
    #Proc.new do ~ end まででブロック
    #if エラーが発生していない場合
    #else 内部変数class_nameにインスタンス～クラスをunderscore処理までで型を返す代入 method_nameに変数
    #結果としてエラーの数だけ<label>(現在のhtml)</label><br><span>(エラーメッセージ)</span>が返される。

    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      if instance.kind_of?(ActionView::Helpers::Tags::Label)
        html_tag.html_safe
      else
        class_name = instance.object.class.name.underscore
        method_name = instance.instance_variable_get(:@method_name)
        "<label class=\"formcolor\">#{html_tag}</label><br>
          <span class=\"error_field alert-danger errormsg\">
            #{I18n.t("activerecord.attributes.#{class_name}.#{method_name}")}
            #{instance.error_message.first}
          </span>".html_safe
      end
    end
  end
end
