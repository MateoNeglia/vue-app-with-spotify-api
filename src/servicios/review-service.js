//https://lchoicedb.000webhostapp.com/api/todo-resenas.php

export async function getReviews() {
    try {
        const response = await fetch('https://lchoicedb.000webhostapp.com/api/todo-resenas.php');
        
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();
               

        return data;

    } catch (error) {
        console.error(error);        
        return null;
    }
}

