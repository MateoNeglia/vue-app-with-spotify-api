//https://lchoicedb.000webhostapp.com/api/todo-albumes.php

export async function getAlbumIds() {
    try {
        const response = await fetch('https://lchoicedb.000webhostapp.com/api/todo-albumes.php');
        
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();
        
        const albumCharids = data.map(item => item.album_charid);
        const result = albumCharids.join(',');

        return result;

    } catch (error) {
        console.error(error);        
        return null;
    }
}

