import { BrowserRouter, Route, Routes } from 'react-router-dom';
import './App.scss';
// pages
import { Cart, Category, Home } from "./pages/index";
// components
import { Provider } from 'react-redux';

import CheckoutPage from './pages/CheckoutPage/Checkout';
import ConfirmPage from './pages/ConfirmPage/Confirm';
import LoginPage from './pages/LoginPage/loginPage';
import RegisterPage from './pages/RegisterPage/RegisterPage';
import UserPage from './pages/User/user';
import store from "./store/store";

function App() {
  return (
    <div className="App">
      <Provider store = {store}>
        <BrowserRouter>
          
          <Routes>
            <Route path = "/" element = {<Home />} />
            <Route path = "/category/:name" element = {<Category />} />
            <Route path = "/cart" element = {<Cart />} />
            <Route path = "/login" element = {<LoginPage />} />
            <Route path = "/register" element = {<RegisterPage />} />
            <Route path = "/user" element = {<UserPage />} />
            <Route path = "/checkout" element = {<CheckoutPage />} />
            <Route path = "/confirm" element = {<ConfirmPage />} />
          </Routes>
          
        </BrowserRouter>
      </Provider>
    </div>
  );
}

export default App;
