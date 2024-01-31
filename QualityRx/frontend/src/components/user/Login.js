import React, { useState } from 'react';
import axios from 'axios';
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

function Login() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('http://localhost:3001/api/users/login', { email, password });
      console.log(response.data);
      navigate('/');
      // Handle login success, store token, redirect, etc.
    } catch (err) {
      setError('Invalid credentials');
    }
  };
  

  return (
    <div className='login-form'>
      <Navigation/>
      <Circle bg='#0056b3' position='relative' h='800px'>
        <AbsoluteCenter  p='10' color='white' axis='both'>
          <Center><h2><strong>Login</strong></h2></Center>
          <FormControl>
          <FormLabel>Email</FormLabel>
          <Input type='email' value={email} onChange={(e) => setEmail(e.target.value)} />
          <FormLabel>Password</FormLabel>
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
  );
}

export default Login;
