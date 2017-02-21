import React, { Component } from 'react'
import { OAuthSignInButton } from "redux-auth/default-theme"

export default class App extends Component {
  render() {
    return (
      <div>
        <OAuthSignInButton provider="github" />
        {this.props.children}
      </div>
    )
  }
}
