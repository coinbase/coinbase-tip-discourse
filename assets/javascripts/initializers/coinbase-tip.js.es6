import { Button } from "discourse/views/post-menu";

export default {
  name: "coinbase-tip",

  initialize: function (container) {
    var PostMenuView = container.lookupFactory("view:post-menu");

    var postID = '123'; //TODO get URL to this post
    var postUserId = 'Josh'; //TODO get UID for this post

    PostMenuView.reopen({
      buttonForTip: function (post, buffer) {
        return new Button("tip", "Tip post", "", {
          className: "cb-tip-container",
          disabled: true,
          innerHTML:
            '<div class="cb-tip-button" data-content-location=' + postID + ' data-href="//www.coinbase.com/tip_buttons/show_tip" data-to-user-id=' + postUserId + ' data-src="discourse-plugin"></div><script>!function(d,s,id) {var js,cjs=d.getElementsByTagName(s)[0],e=d.getElementById(id);if(e){return;}js=d.createElement(s);js.id=id;js.src="https://www.coinbase.com/assets/tips.js";cjs.parentNode.insertBefore(js,cjs);}(document, \'script\', \'coinbase-tips\');</script>'
          }
        )
      }
    });
  } 
}; 
