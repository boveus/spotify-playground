import React from "react"
import PropTypes from "prop-types"
class Home extends React.Component {

  constructor(props) {
    super(props);
    this.state = {tempo: this.props.audio_features.tempo}
  }

  flashLights() {
    fetch("/hue/flash_lights",
    {
        method: "POST",
        headers: {
          'X-CSRF-Token': this.props.auth_token,
          "Content-Type": "application/json"
        },
        body: JSON.stringify({tempo: this.state.tempo})
    })
  }

  render () {
    return (
      <React.Fragment>
      <h2> Welcome </h2>
      <ul>
        <li> User: {this.props.user.display_name} </li>
        <li> Artist: {this.props.song.artists[0].name} </li>
        <li> Song: {this.props.song.name} </li>
      </ul>

      <button onClick={() => this.flashLights()}> Flash Lights </button>
      </React.Fragment>
    );
  }
}

Home.propTypes = {
  user: PropTypes.object,
  song: PropTypes.object,
  audio_features: PropTypes.object,
  auth_token: PropTypes.string
};
export default Home
