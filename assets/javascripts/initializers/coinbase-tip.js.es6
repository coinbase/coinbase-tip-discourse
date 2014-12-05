import { Button } from "discourse/views/post-menu";

export default {
  name: "coinbase-tip",

  initialize: function (container) {
    var PostMenuView = container.lookupFactory("view:post-menu");

    PostMenuView.reopen({
      buttonForTip: function (post, buffer) {
        return new Button("tip", uid);
      },

      clickTip: function () {
        //do stuff
      }
    });

  } 
}; 
