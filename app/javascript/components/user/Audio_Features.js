import React from "react"
import PropTypes from "prop-types"
class AudioFeatures extends React.Component {

  printAudioFeatures() {
    var audioFeatures = JSON.parse(this.props.audio_features)
    var string = ''
    for (var feature in audioFeatures) {
      string = string + `<li> ${feature}: ${audioFeatures[feature]} </li>`
    }
    return string
  }

  render () {
    return (
      <React.Fragment>
      <ul dangerouslySetInnerHTML={{__html: this.printAudioFeatures()}} />
      </React.Fragment>
    );
  }
}

AudioFeatures.propTypes = {
  audio_features: PropTypes.string,
};
export default AudioFeatures
