var table = document.getElementById('tableNames');

for (var i = 1; i < table.rows.length; i++) {
    table.rows[i].onclick = function () {

        document.getElementById("name").innerHTML = this.cells[1].innerHTML;

    };
}