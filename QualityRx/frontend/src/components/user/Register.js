import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import Navigation  from  '../Navigation';
import {
  FormControl,
  FormLabel,
  FormErrorMessage,
  FormHelperText,
  Input,
  Button,
} from '@chakra-ui/react'
import { Center, Square, Circle,AbsoluteCenter, Box } from '@chakra-ui/react'

function Register() {
  const [username, setUsername] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('http://localhost:3001/api/users', { username, email, password });
      console.log(response.data);
      navigate('/');
      // Handle registration success (e.g., redirect to login page or show success message)
    } catch (err) {
      // Check if the error response contains a specific message
      if (err.response && err.response.data.error) {
        setError(err.response.data.error);
      } else {
        setError('Error registering user');
      }
    }
  };
  

  return (
    <div>
      <Navigation/>
      <div className='login-form'>
      <Circle bg='#0056b3' position='relative' h='800px' onSubmit={handleSubmit}>
        <AbsoluteCenter  p='10' color='white' axis='both'>
          <Center><h2><strong>Login</strong></h2></Center>
          <FormControl>
          <FormLabel>Username:</FormLabel>
          <Input type='text' value={username} onChange={(e) => setUsername(e.target.value)} />
          <FormLabel>Email:</FormLabel>
          <Input type='email' value={email} onChange={(e) => setEmail(e.target.value)} />
          <FormLabel>Password:</FormLabel>
          <Input type='password' value={password} onChange={(e) => setPassword(e.target.value)} />
          </FormControl>
          <Button
                mt={4}
                colorScheme='gray'
                
                type='submit'
              >
                Submit
              </Button>
            </AbsoluteCenter>
          </Circle>
    </div>
    </div>
  );
}

export default Register;
