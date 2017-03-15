import React, { Component } from 'react';
import NewSongButton from './NewSongButton';

class Song extends Component {
  constructor(props) {
    super(props);
    this.state = {
      songs: [],
      numberSongs: 0,
      selectedSongIndex: 0
    };

    this.handleButtonClick = this.handleButtonClick.bind(this);
  }

  handleButtonClick() {
    let newSelectedSongIndex = Math.floor(Math.random() * 50);
    this.setState({
      selectedSongIndex: newSelectedSongIndex
    });
  }

  componentDidMount () {
    fetch(`http://ws.audioscrobbler.com/2.0/?method=chart.gettoptracks&api_key=7005d0482caf069930f4fb05cbc03ea3&format=json`)
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status}, (${response.statusText})`;
          let error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        let newSongs = body.tracks.track;
        let newNumberSongs = newSongs.length;
        let newSelectedSongIndex = Math.floor(Math.random() * newNumberSongs);
        this.setState({
          songs: newSongs,
          numberSongs: newNumberSongs,
          selectedSongIndex: newSelectedSongIndex
        });
      });
  }

  render() {
    let song, name, image, artist, url;
    if (this.state.numberSongs) {
      song = this.state.songs[this.state.selectedSongIndex];
      name = <h1> { song.name } </h1>;
      // image = <img src={song.image.last.text}/>;
      artist = <h2> { song.artist.name } </h2>;
      url = <a href={song.url} target="_blank">Listen on Last.fm</a>;
    }
    debugger;

    return (
      <div className="small-12 columns callout primary center">
        <div>
          { name }
          { image }
          { artist }
          { url }
        </div>
        < NewSongButton
          handleButtonClick = { this.handleButtonClick }
        />
      </div>
    );
  }
}

export default Song;
