const handBookNameList = document.querySelectorAll(".handbook_list_li");
const handBookList = document.querySelectorAll(".handbook");

handBookNameList.forEach(element => {
    element.addEventListener('click', function() {
        handBookNameList.forEach(element3 => {
            element3.classList.remove('li_active');
        })
        element.classList.add('li_active');
        let handbookName = element.innerHTML;

        handBookList.forEach(element2 => {
            if(element2.id == handbookName){
                element2.classList.add("handbook_active");
            }
            else{
                element2.classList.remove("handbook_active");
            }
        })
    });
})