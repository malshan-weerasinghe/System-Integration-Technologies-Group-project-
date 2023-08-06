
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
        device_name: 'web', 
      }),
      
    });

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();

    console.log('Registration successful', data);
    return data;
  
    
    
  };


  
  
 