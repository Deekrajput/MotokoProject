import {dbank_backend} from "/home/deeksha/ic-projects/dbank/src/declarations/dbank_backend";
window.addEventListener("load", async function (){
    update();
});
document.querySelector("form").addEventListener("submit", async function(){
    event.preventDefault();
const button=event.target.querySelector("#submit-btn");

    const inputam=parseFloat(document.getElementById("input-amount").value);
    const outam=parseFloat(document.getElementById("withdrawal-amount").value);
    button.setAttribute("disabled",true);
    if (document.getElementById("input-amount").value.length != 0){
    await dbank_backend.topup(inputam);}

        
    if (document.getElementById("withdrawal-amount").value.length != 0){
        await dbank_backend.withdraw(outam);}

    await dbank_backend.compound();

        update();

    document.getElementById("input-amount").value="";
    document.getElementById("withdrawal-amount").value="";
    button.removeAttribute("disabled");


});
async function update(){
     const curramount=await dbank_backend.checkbal();
    document.getElementById("value").innerText=Math.round(curramount * 100)/100;
}