
export const registerUser = async (registerData) => {
    const dataToSend = {
      ...registerData,
      ConfirmPassword: registerData.password, // ConfirmPassword is the same as password
      address: '123 Main St', // Dummy address
      dob: '2000-01-01', // Dummy date of birth
      device_name: 'Web', // Dummy device name
    };
  
    const response = await fetch('http://127.0.0.1:8000/api/register', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(dataToSend),
    });
  
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
  
    const data = await response.json();
  
    console.log('Registration successful', data);
    return data;
  }; 
  
  
  export const loginUser = async (loginData) => {
    const response = await fetch('http://127.0.0.1:8000/api/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        ...loginData,
        device_name: 'web', // Replace 'web' with the actual device name
      }),
    });
  
    if (!response.ok) {
      throw new 
  Error('Login failed');
    }
  
    const data = await response.json();
    return data;
  };
  

  export const logoutUser = async () => {
    const token = localStorage.getItem('token');
    const actualToken = token.split('|')[1];
  
    const response = await fetch('http://127.0.0.1:8000/api/logout', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${actualToken}`,
      },
    });
  
    if (!response.ok) {
      // If the response status is 401 (Unauthorized), it means the token was invalid
      if (response.status === 401) {
        console.error('The token is invalid or expired');
      } else {
        throw new Error('Logout failed...................');
      }
    }
  
    localStorage.removeItem('token');
    localStorage.removeItem('user');
  };
  