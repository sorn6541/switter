(function() {
  var Sweet, SweetList, WriteForm, sweetList, writeForm;

  WriteForm = React.createClass({
    handleSubmit: function(e) {
      var content, getValue, nick, setValue;
      e.preventDefault();
      getValue = (function(_this) {
        return function(ref) {
          return _this.refs[ref].getDOMNode().value.trim();
        };
      })(this);
      setValue = (function(_this) {
        return function(ref, value) {
          return _this.refs[ref].getDOMNode().value = value;
        };
      })(this);
      nick = getValue('nick');
      content = getValue('content');
      setValue('nick', '');
      setValue('content', '');
      return $.post('/api/sweet', {
        nick: nick,
        content: content
      }, function(data) {
        return sweetList.setState({
          data: data
        });
      });
    },
    render: function() {
      return React.createElement("div", {
        "className": "container-fluid"
      }, React.createElement("form", {
        "onSubmit": this.handleSubmit
      }, React.createElement("div", {
        "className": "form-group col-xs-12 col-sm-6 col-md-4"
      }, React.createElement("input", {
        "type": "text",
        "placeholder": "nick",
        "className": "form-control",
        "ref": "nick"
      })), React.createElement("div", {
        "className": "form-group col-xs-12 col-md-10"
      }, React.createElement("textarea", {
        "rows": "3",
        "className": "form-control",
        "placeholder": "140",
        "ref": "content"
      })), React.createElement("div", {
        "className": "form-group col-xs-12 col-md-2"
      }, React.createElement("button", {
        "className": "btn btn-default btn-block"
      }, "\uae00 \uc4f0\uae30"))));
    }
  });

  SweetList = React.createClass({
    getInitialState: function() {
      return {
        data: []
      };
    },
    componentDidMount: function() {
      return $.getJSON('/api/sweet', (function(_this) {
        return function(data) {
          return _this.setState({
            data: data
          });
        };
      })(this));
    },
    render: function() {
      var sweetNodes;
      sweetNodes = this.state.data.map(function(sweet, index) {
        return React.createElement(Sweet, {
          "key": index,
          "nick": sweet.nick,
          "content": sweet.content
        });
      });
      return React.createElement("ul", {
        "className": "list-group"
      }, sweetNodes);
    }
  });

  Sweet = React.createClass({
    render: function() {
      return React.createElement("li", {
        "className": "list-group-item"
      }, React.createElement("h4", null, this.props.nick), React.createElement("p", null, this.props.content));
    }
  });

  writeForm = React.render(React.createElement(WriteForm, null), document.getElementById('writeform'));

  sweetList = React.render(React.createElement(SweetList, null), document.getElementById('sweetlist'));

  console.log(writeForm);

  console.log(sweetList);

}).call(this);
