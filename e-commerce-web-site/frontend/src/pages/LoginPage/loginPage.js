
import React, { useRef, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { loginUser, registerUser } from '../../store/auth';
import './loginPage.scss'; // Import the CSS file

const LoginPage = () => {
  
  const containerRef = useRef(null);
  const [message, setMessage] = useState(null);
  const [isError, setIsError] = useState(false);
  const [isLoginLoading, setIsLoginLoading] = useState(false);
  const [isRegisterLoading, setIsRegisterLoading] = useState(false);
  const navigate = useNavigate();

  // Initialize state for form inputs
  const [registerData, setRegisterData] = useState({
    name: '',
    email: '',
    phone: '',
    password: '',
  });

  const [loginData, setLoginData] = useState({
    email: '',
    password: '',
  });

  // Update state when form inputs change
  const handleInputChange = (e, setData) => {
    setData(prevData => ({
      ...prevData,
      [e.target.name]: e.target.value,
    }));
  };

  const handleSignUpClick = async (e) => {
    e.preventDefault();
    
    if (containerRef.current) {
      containerRef.current.classList.add("right-panel-active");
    }
  
    setMessage(null);
  
    // Check if the form data is empty
    if (!registerData.name || !registerData.email || !registerData.phone || !registerData.password) {
      return;
    }
  
    try {
      setIsRegisterLoading(true);
      const data = await registerUser(registerData);
      console.log('Registration successful', data);
      setIsRegisterLoading(false);
      setMessage('Registration successful');
      setRegisterData({ name: '', email: '', phone: '', password: '' });
      setIsError(false);
      // Delay the tab change
    setTimeout(() => {
      handleSignInClick(e);
    }, 2000);
    } catch (error) {
      console.error('Registration failed', error);
      setMessage('Registration failed', error);
      setIsRegisterLoading(false);
      setIsError(true);
    }
    setTimeout(() => {
      setMessage(null);
    }, 4000);
  
  };
  
  const handleSignInClick = async (e) => {
    e.preventDefault();
    
    if (containerRef.current) {
      containerRef.current.classList.remove("right-panel-active");
    }
  
    setMessage(null);
  
    // Check if the form data is empty
    if (!loginData.email || !loginData.password) {
      return;
    }
  
    try {
      setIsLoginLoading(true);
      const data = await loginUser(loginData);
      console.log('Login successful', data);
      
    
      // Save the token and user data to the local storage or context
      localStorage.setItem('token', data.token);
      localStorage.setItem('user', JSON.stringify(data.user));
      setLoginData({ email: '', password: '' });
      setIsError(false); // Clear the input fields
      setIsLoginLoading(false);
      setMessage('Login successful');

      setTimeout(() => {
        navigate('/');
      }, 2000);
      

    } catch (error) {
      console.error('Login failed', error);
      setMessage('Login failed', error);
      setIsError(true);
      setIsLoginLoading(false);
      setLoginData({ email: '', password: '' }); // Clear the input fields
    }
    setTimeout(() => {
      setMessage(null);
    }, 4000);
  };
  
  

  return (
    <div className="loginPage">
      {message && <p className={`message ${isError ? 'error' : ''}`}>{message}</p>} {/* Modify this line */}
      <div className="container" id="container" ref={containerRef}>
        <div className="form-container sign-up-container">
          <form onSubmit={handleSignUpClick}>
            <h1>Create Account</h1>
            <div className="social-container">
              <a href="#" className="social"><i className="fab fa-facebook-f"></i></a>
              <a href="#" className="social"><i className="fab fa-google-plus-g"></i></a>
              <a href="#" className="social"><i className="fab fa-linkedin-in"></i></a>
            </div>
            <span>or use your email for registration</span>
            <input type="text" placeholder="Name" name="name" value={registerData.name} onChange={(e) => handleInputChange(e, setRegisterData)} />
  <input type="email" placeholder="Email" name="email" value={registerData.email} onChange={(e) => handleInputChange(e, setRegisterData)} />
  <input type="phone" placeholder="Phone" name="phone" value={registerData.phone} onChange={(e) => handleInputChange(e, setRegisterData)} />
  <input type="password" placeholder="Password" name="password" value={registerData.password} onChange={(e) => handleInputChange(e, setRegisterData)} />
  {isRegisterLoading ? (
    <div className="spinner"></div>
  ) : (
    <button type="submit">Sign Up</button>
  )}
          </form>
        </div>
        <div className="form-container sign-in-container">
          <form onSubmit={handleSignInClick}>
            <h1>Sign in</h1>
            <div className="social-container">
              <a href="#" className="social"><i className="fab fa-facebook-f"></i></a>
              <a href="#" className="social"><i className="fab fa-google-plus-g"></i></a>
              <a href="#" className="social"><i className="fab fa-linkedin-in"></i></a>
            </div>
            <span>or use your account</span>
            <input type="email" placeholder="Email" name="email" value={loginData.email} onChange={(e) => handleInputChange(e, setLoginData)} />
  <input type="password" placeholder="Password" name="password" value={loginData.password} onChange={(e) => handleInputChange(e, setLoginData)} />
            <a href="#">Forgot your password?</a>
            {isLoginLoading ? (
    <div className="spinner"></div>
  ) : (
    <button type="submit">Sign In</button>
  )}
          </form>
        </div>
        <div className="overlay-container">
          <div className="overlay">
            <div className="overlay-panel overlay-left">
              <h1>Welcome Back!</h1>
              <p>To keep connected with us please login with your personal info</p>
              <button className="ghost" onClick={handleSignInClick}>Sign In</button>
            </div>
            <div className="overlay-panel overlay-right">
              <h1>Hello, Friend!</h1>
              <p>Enter your personal details and start journey with us</p>
              <button className="ghost" onClick={handleSignUpClick}>Sign Up</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default LoginPage;
