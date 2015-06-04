$ =>
  WriteForm = React.createClass
    handleSubmit: (e)->
      e.preventDefault()
      getValue = (ref) =>
        this.refs[ref].getDOMNode().value.trim()
      setValue = (ref,value) =>
        this.refs[ref].getDOMNode().value = value
      
      nick = getValue 'nick'
      content = getValue 'content'
      setValue 'nick',''
      setValue 'content',''
      $.post '/api/sweet',
        nick: nick
        content: content,
        (data)->
          sweetList.setState data:data
      
    render: ->
      <div className="container-fluid">
        <form onSubmit={this.handleSubmit}>
          <div className="form-group col-xs-12 col-sm-6 col-md-4">
            <input type="text" placeholder="nick" className="form-control" ref="nick" />
          </div>
          <div className="form-group col-xs-12 col-md-10">
            <textarea rows="3" className="form-control" placeholder="140" ref="content" ></textarea>
          </div>
          <div className="form-group col-xs-12 col-md-2">
            <button className="btn btn-default btn-block">글 쓰기</button>
          </div>
        </form>
      </div>

  SweetList = React.createClass
    getInitialState: ->
      data:[]

    componentDidMount: ->
      $.getJSON '/api/sweet', (data) =>
        this.setState data:data
    
    render: ->
      sweetNodes = this.state.data.map (sweet,index) ->
        <Sweet key={index} nick={sweet.nick} content={sweet.content} />
      
      <ul className="list-group">
        {sweetNodes}
      </ul>

  Sweet = React.createClass
    render: ->
      <li className="list-group-item">
        <h4>
          {this.props.nick}
        </h4>
        <p>
          {this.props.content}
        </p>
      </li>

  writeForm = React.render <WriteForm />, document.getElementById 'writeform'
  sweetList = React.render <SweetList />, document.getElementById 'sweetlist'

  console.log writeForm
  console.log sweetList