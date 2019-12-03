import React from "react"
import PropTypes from "prop-types"
import AudioFeatures from './Audio_Features'
class Home extends React.Component {

  constructor(props) {
    super(props);
    this.state = { song: this.props.song,
      audio_features: this.props.audio_features
    }
  }

  flashLights() {
    fetch("/hue/flash_lights",
    {
        method: "POST",
        headers: {
          'X-CSRF-Token': this.props.auth_token,
          "Content-Type": "application/json"
        },
        body: JSON.stringify({tempo: this.state.audio_features.tempo})
    })
  }

  async refreshSong() {
    try {
      const response = await fetch("/spotify/refresh_song",
      {
          method: "POST",
          headers: {
            'X-CSRF-Token': this.props.auth_token,
            "Content-Type": "application/json"
          },
          body: JSON.stringify({omniauth_auth: this.props.omniauth_auth})
      })
      const data = await response.json();
      this.setState({
        song: data.song,
        audio_features: data.audio_features
      })
    } catch (error) {
      console.log(error)
    }
  }

  componentDidMount() {
    setInterval(() => { this.refreshSong() }, 60000);
  }

  render () {
    return (
      <React.Fragment>
      <h2> Welcome </h2>
      <ul>
        <li> User: {this.props.user.display_name} </li>
        <li> Artist: {this.state.song.artists[0].name} </li>
        <li> Song: {this.state.song.name} </li>
        <AudioFeatures audio_features={JSON.stringify(this.state.audio_features)} />
      </ul>

      <button onClick={() => this.refreshSong()}> Refresh Song </button>

      <button onClick={() => this.flashLights()}> Flash Lights </button>
      </React.Fragment>
    );
  }
}

Home.propTypes = {
  user: PropTypes.object,
  song: PropTypes.object,
  audio_features: PropTypes.object,
  omniauth_auth: PropTypes.object,
  auth_token: PropTypes.string
};
export default Home
