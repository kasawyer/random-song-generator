import React, { Component } from 'react';
import Song from './Song';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    return(
      <div className="row">
        <Song
        />
      </div>
    )
  }
}

export default App;
