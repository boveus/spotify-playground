import React from "react"
import PropTypes from "prop-types"
class Show extends React.Component {
  render () {
    return (
      <React.Fragment>
        Greeting: {this.props.greeting}
        <a href='/auth/spotify'> Sign in with Spotify </a>
      </React.Fragment>
    );
  }
}

Show.propTypes = {
  greeting: PropTypes.string
};
export default Show
