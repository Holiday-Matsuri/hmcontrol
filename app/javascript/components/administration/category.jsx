import React from 'react';
class CategorySet extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <div>
        <h1>{this.props.event_name}</h1>
        <p>{this.props.name}</p>
      </div>
    )
  }
}
export default CategorySet;