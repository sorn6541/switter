WriteForm = React.createClass
  render: ->
    <div className="container-fluid">
      <form action="index.html" method="post">
        <div className="form-group col-xs-12 col-sm-6 col-md-4">
          <input type="text" placeholder="nick" className="form-control" />
        </div>
        <div className="form-group col-xs-12 col-md-10">
          <textarea rows="3" className="form-control" placeholder="140" ></textarea>
        </div>
        <div className="form-group col-xs-12 col-md-2">
          <button className="btn btn-default btn-block">글 쓰기</button>
        </div>
      </form>
    </div>

SweetList = React.createClass
  render: ->
    <ul className="list-group">
      <li className="list-group-item">
        <h4>nickname</h4>
        <p>
          Cupidatat minim ut non cupidatat tempor do voluptate. Id do laboris nulla fugiat minim ipsum pariatur cupidatat sint occaecat nostrud sint. Esse nisi laborum incididunt amet deserunt amet ea minim do officia sint adipisicing excepteur. Reprehenderit amet deserunt consectetur fugiat velit tempor proident consectetur excepteur. Elit voluptate fugiat ex consequat incididunt do veniam. Ea velit eiusmod occaecat veniam sunt dolor tempor. Anim exercitation irure excepteur aute ad amet sint ex. Qui excepteur aute esse tempor aute consectetur minim et ad excepteur incididunt. Ullamco culpa excepteur minim culpa in consequat.
        </p>
      </li>
      <li className="list-group-item">
        <h4>nickname</h4>
        <p>
          Est sit amet minim id tempor.
        </p>
      </li>
    </ul>

React.render <WriteForm />, $('writeform')[0]
React.render <SweetList />, document.getElementById 'sweetlist'
