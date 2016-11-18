import React, { Component }   from 'react'
import { OAuthSignInButton } from "redux-auth/default-theme"

class App extends Component {
  constructor(props) {
    super(props)
//    this.state = {data: {}}
  }

  render() {
    return <OAuthSignInButton />
  }
}

export default App
