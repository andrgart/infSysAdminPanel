
const handBookNameList2 = document.querySelectorAll(".handbook_list_li");

const loadTable = async function(event) {
    const data_div = document.querySelector('.table_data');
    data_div.innerHTML = "";

    if(document.querySelector(".li_active").innerHTML == "client"){
        const response = await fetch("draw_client_data.php");
        if (response.ok) { //если запрос удачно выполнился и вернул resultat
            const res = await response.text();
            data_div.innerHTML = res;
        }
    }
    if(document.querySelector(".li_active").innerHTML == "cars"){
        const response = await fetch("draw_cars.php");
        if (response.ok) { //если запрос удачно выполнился и вернул resultat
            const res = await response.text();
            data_div.innerHTML = res;
        }
    }
    if(document.querySelector(".li_active").innerHTML == "car_client"){
        const response = await fetch("draw_client_cars.php");
        if (response.ok) { //если запрос удачно выполнился и вернул resultat
            const res = await response.text();
            data_div.innerHTML = res;
        }
    }
}

const loadBtn = document.querySelector(".load_table_btn");
loadBtn.addEventListener('click', loadTable);

handBookNameList2.forEach(element => {
    element.addEventListener('click', loadTable);
})

document.addEventListener("DOMContentLoaded", loadTable);

/* ---------------------- */
const addCarsGet = async function(event){
    const data_div = document.querySelector('.table_data');
    data_div.innerHTML = "";

    var form = document.querySelector(".handbook_form_cars");

    var car_country_value= form.elements.car_country.value; 
    var car_brand_value= form.elements.car_brand.value; 
    var car_model_value= form.elements.car_model.value; 
    var availability_value= form.elements.availability.value; 
    var price_value= form.elements.price.value;

    const response = await fetch("add_cars_get.php?cc="+car_country_value+"&cb="+car_brand_value+"&cm="+car_model_value+"&av="+availability_value+"&p="+price_value);
    if (response.ok) {
        const res = await response.text();
        data_div.innerHTML = res;
    }
};

const carsBtn = document.querySelector(".cars_btn");
carsBtn.addEventListener('click', addCarsGet);

/* -- DELETE --*/

const dataTableRow = document.querySelector(".table_data");

dataTableRow.addEventListener('click', (event) => {
    if(event.target.classList.contains("data_line_cross"))  {
        let row = event.target.closest(".data_table_row");
        let row_id = row.querySelector(".p_id").innerHTML;

        if(document.querySelector(".li_active").innerHTML == "client"){
            var bd_name = "client";

        }
        if(document.querySelector(".li_active").innerHTML == "cars"){
            var bd_name = "cars";
        }
        if(document.querySelector(".li_active").innerHTML == "car_client"){
            var bd_name = "client_cars";
        }

        window.currentUser = {
            _row_id: row_id,
            _bd_name: bd_name
        };

        del();
        loadTable();
    }  
})

const del = async function(event){
    const data_div = document.querySelector('.table_data');
    data_div.innerHTML = "";

    const response = await fetch("delete_row.php?row_id="+currentUser._row_id+"&bd_name="+currentUser._bd_name);
    if (response.ok) {
        const res = await response.text();
        data_div.innerHTML = res;
    }
};