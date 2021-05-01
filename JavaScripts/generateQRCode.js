function getClassData(){
	var newClassID = localStorage.getItem("newClassKey");
    console.log(newClassID);
    const post = $.post('http://localhost:3000/QRCode', {classID :newClassID});
    post.done(processRows);
    post.fail(processErrors);
}

// Displays character information as a button.
function processRows(rows, status, xhr) {
    console.log("Inside processRows func");

	var data = rows;

    console.log(data[0]);

	$("#qrCode").ClassyQR({
        create: true,
        type: 'text',
        text: data[0].classID
    });
}

// Returns an error in console if a field is invalid.
function processErrors() {
    console.log('Validation errors');
}

function classIDFunction(classID) {
    var newClassID = classID;
    localStorage.setItem("newClassKey", newClassID);

    location.href = "/QRCode";    
}