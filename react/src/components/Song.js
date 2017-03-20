import React, { Component } from 'react';
import NewSongButton from './NewSongButton';

const API_KEY=process.env.LAST_FM_KEY;
const API_URL = 'http://ws.audioscrobbler.com/2.0/?method=chart.gettoptracks&format=json&limit=100&api_key=';
const REQUEST_URL = API_URL + API_KEY;

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
    fetch(REQUEST_URL)
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
    let imageKey = '#text';
    if (this.state.numberSongs) {
      song = this.state.songs[this.state.selectedSongIndex];
      name = <h1> { song.name } </h1>;
      image = <img src={song.image[song.image.length - 1][imageKey]}/>;
      artist = <h2> { song.artist.name } </h2>;
      url = <a href={song.url} target="_blank">Listen on Last.fm</a>;
    }

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
