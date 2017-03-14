import React, { Component } from 'react';

class NewSongButton extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    return(
      <div className="button" onClick = { this.props.handleButtonClick } >
        New song <i className="fa fa-music" aria-hidden="true"></i>
      </div>
    )
  }
}

export default NewSongButton;
