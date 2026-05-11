const inputTugas = document.getElementById("inputTugas");
const btntambah = document.getElementById("btnTambah");
const daftarTugas = document.getElementById("daftarTugas");
const inputTanggal = document.getElementById("inputTanggal");
const inputStatus = document.getElementById("inputStatus");

let dataEdit = null;

btntambah.addEventListener("click", function() {

    const tugas = inputTugas.value;
    const tanggal = inputTanggal.value;
    const status = inputStatus.value;

    if(tugas === "" || tanggal === "") {
        alert("Data harus dimasukkan!");
        return;
    }