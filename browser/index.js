(function() {
  "use strict";
  var request = require('ahr2')
    ;

  /* Event Handlers */
  function someEvent(ev) {

  }

  /* Assign Event Handlers */
  $.domReady(assignHandlers);

  function assignHandlers() {
    prepInterface();
    // e.g.:
    //$('body').delegate('#some-id', 'click', someEvent);
  }

  /* Helpers */

  function prepInterface() {

  }

}());
