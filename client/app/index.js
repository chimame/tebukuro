import React from 'react'
import ReactDOM from 'react-dom'
import { Provider } from 'react-redux'
import { configure } from 'redux-auth'

import App from './containers/App'
import configureStore from './store'

const store = configureStore()

store.dispatch(configure({
  apiUrl:                'http://localhost:3000',
  authProviderPaths: {
    github:    "/auth/github",
    facebook:  "/auth/facebook",
    twitter:   '/auth/twitter'
  }
})).then(// ... render your app ... //
  ReactDOM.render(
    <Provider store={store}>
      <App />
    </Provider>,
    document.getElementById('root')
  )
)
