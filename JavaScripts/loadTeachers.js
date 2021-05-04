// Sends an empty post to the server to get the character information.
function viewTeachers(){
    const post = $.post('http://localhost:3000/Teachers', 0);
    console.log("Inside viewAdminModules func");
    post.done(processRows);
    post.fail(processErrors);
    
}

// Displays character information as a button.
function processRows(rows, status, xhr) {
    console.log("Inside processRows func");
    for (let i = 0; i < rows.length; i++) {

        var div = $(
            `<div class="card text-center " id="teacherCard"">
                <div class="card-body">
                    <p class="card-text">${rows[i].name}</p>
                    <p class="card-text">${rows[i].id}</p>
                </div>
            </div>`);

        $(div).appendTo("#listHeader");
    }
}

// Returns an error in console if a field is invalid.
function processErrors() {
    console.log('Validation errors');
}

// Calls viewChar function when the page opens.
viewTeachers();