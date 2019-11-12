import React from "react"
import PropTypes from "prop-types"
class Home extends React.Component {
  render () {
    return (
      <React.Fragment>
      <h2> Welcome </h2>
      <ul>
        <li> User: {this.props.user.display_name} </li>
        <li> Artist: {this.props.song.artists[0].name} </li>
        <li> Song: {this.props.song.name} </li>
        <li> Tempo: {this.props.audio_features.tempo} </li>
      </ul>
      </React.Fragment>
    );
  }
}

Home.propTypes = {
  user: PropTypes.object,
  song: PropTypes.object,
  audio_features: PropTypes.audio_features
};
export default Home
