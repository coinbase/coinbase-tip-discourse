# name: coinbase tip
# about: add a button at the end of every post allowing users to tip the author
# version: 0.1
# authors: Coinbase

register_asset "javascripts/initializers/coinbase-tip.js.es6"

after_initialize do
  load File.expand_path("../controllers/coinbase_controller.rb", __FILE__)

  Discourse::Application.routes.prepend do
    get 'coinbase/get_tip_id' => 'coinbase#get_tip_id'
  end
end

register_css <<CSS

.topic-body {
  z-index: auto;
}

.cb-tip-button {
  margin-right: 70px;
  margin-left: 3px;
  display: inline-block;
  padding: 8px 10px;
  text-align: left;
}

CSS
