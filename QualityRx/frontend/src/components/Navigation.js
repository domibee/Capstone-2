// ./src/components/Navigation.js
import React from 'react';
import { Link } from 'react-router-dom';
import '../styles/Navigation.css';
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbSeparator,
} from '@chakra-ui/react'

function Navigation() {
  return (
   
    <Breadcrumb separator='|'>
      <BreadcrumbItem>
        <BreadcrumbLink as={Link} to='/'>
          Home
        </BreadcrumbLink>
      </BreadcrumbItem>
      <BreadcrumbItem>
        <BreadcrumbLink as={Link} to='/login'>
          Login
        </BreadcrumbLink>
      </BreadcrumbItem >
      <BreadcrumbItem>
      <BreadcrumbLink as={Link} to='/register'>Register</BreadcrumbLink>
      </BreadcrumbItem>
    </Breadcrumb>
  );
}

export default Navigation;
