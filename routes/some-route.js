(function() {
  "use strict";

  function someThing(app) {
    app.get('/whatever', whatever);

    function whatever(req,res) {

    }

  }

  module.exports = someThing;

}());
