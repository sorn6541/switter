(function() {
  var SweetList, WriteForm;

  WriteForm = React.createClass({
    render: function() {
      return React.createElement("div", {
        "className": "container-fluid"
      }, React.createElement("form", {
        "action": "index.html",
        "method": "post"
      }, React.createElement("div", {
        "className": "form-group col-xs-12 col-sm-6 col-md-4"
      }, React.createElement("input", {
        "type": "text",
        "placeholder": "nick",
        "className": "form-control"
      })), React.createElement("div", {
        "className": "form-group col-xs-12 col-md-10"
      }, React.createElement("textarea", {
        "rows": "3",
        "className": "form-control",
        "placeholder": "140"
      })), React.createElement("div", {
        "className": "form-group col-xs-12 col-md-2"
      }, React.createElement("button", {
        "className": "btn btn-default btn-block"
      }, "\uae00 \uc4f0\uae30"))));
    }
  });

  SweetList = React.createClass({
    render: function() {
      return React.createElement("ul", {
        "className": "list-group"
      }, React.createElement("li", {
        "className": "list-group-item"
      }, React.createElement("h4", null, "nickname"), React.createElement("p", null, "Cupidatat minim ut non cupidatat tempor do voluptate. Id do laboris nulla fugiat minim ipsum pariatur cupidatat sint occaecat nostrud sint. Esse nisi laborum incididunt amet deserunt amet ea minim do officia sint adipisicing excepteur. Reprehenderit amet deserunt consectetur fugiat velit tempor proident consectetur excepteur. Elit voluptate fugiat ex consequat incididunt do veniam. Ea velit eiusmod occaecat veniam sunt dolor tempor. Anim exercitation irure excepteur aute ad amet sint ex. Qui excepteur aute esse tempor aute consectetur minim et ad excepteur incididunt. Ullamco culpa excepteur minim culpa in consequat.")), React.createElement("li", {
        "className": "list-group-item"
      }, React.createElement("h4", null, "nickname"), React.createElement("p", null, "Est sit amet minim id tempor.")));
    }
  });

  React.render(React.createElement(WriteForm, null), $('writeform')[0]);

  React.render(React.createElement(SweetList, null), document.getElementById('sweetlist'));

}).call(this);
