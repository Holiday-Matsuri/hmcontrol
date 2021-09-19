import React from 'react';

class AppReviews extends React.Component {
  constructor(props) {
    super(props);
  }
  render() {
    return(
      <div>
        <h1>{this.props.name}</h1>
        <p>{this.props.name}</p>
      </div>
    )
  }
}
export default AppReviews;