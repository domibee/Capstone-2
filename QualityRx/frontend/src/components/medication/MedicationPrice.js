import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { Card, CardHeader, CardBody, CardFooter, Heading, Stack, StackDivider, Box, Text } from '@chakra-ui/react'

function MedicationPrice({ medicationName }) {
    const [prices, setPrices] = useState(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchPrices = async () => {
            setLoading(true);
            try {
                const response = await axios.get(`http://localhost:3001/api/prices/${medicationName}`);
                setPrices(response.data.prices);
            } catch (error) {
                console.error('Error fetching prices:', error);
            } finally {
                setLoading(false);
            }
        };

        fetchPrices();
    }, [medicationName]);

    if (loading) return <div>Loading...</div>;
    if (!prices) return <div>No pricing information available.</div>;

    return (
        
        <Card>
            <CardHeader>
            <Heading size='md'><h2>Prices for {medicationName}</h2></Heading>
            </CardHeader>

            <CardBody>
            <Stack divider={<StackDivider />} spacing='4'>
                <Box>
                <Heading size='xs' textTransform='uppercase'>
                    Overview
                </Heading>
                <Text pt='2' fontSize='sm'>
                {Object.entries(prices).map(([pharmacyName, priceInfo], index) => (
                <div key={index}>
                    <h3>{pharmacyName}</h3>
                    <p>Retail Price: ${priceInfo.retailPrice}</p>
                    <p>Discounted Price: ${priceInfo.discountedPrice}</p>
                    {/* Display additional details like BIN, PCN, etc. */}
                </div>
            ))}
                </Text>
                </Box>
            </Stack>
            </CardBody>
        </Card>
        
    );
}

export default MedicationPrice;
