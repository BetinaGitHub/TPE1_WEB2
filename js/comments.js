"use strict";

const app = new Vue({
    el: "#app",
    data: {
<<<<<<< HEAD
        rol = 2,
        comments: [], // esto es como un assign de smarty
=======
        comments: [],
        roluser: 0,
>>>>>>> e5d079093cd592f07ee357e9f49d5aff8129c739
    },

    methods: {
        rmComment: async function(idcom) {

            try {
                const response = await fetch((urlapi + idcom), { 'method': 'DELETE' })
                    .then(response => {
                        console.log(response);
                        response.text();
                        getCommentsbyIdTool();
                    });
            } catch (e) {
                console.log(e);
            }
        }
    }

});

const urlapi = '../api/comentarios/';
const idmaq = document.querySelector("#idtool").value;

document.addEventListener('DOMContentLoaded', e => {

    let roluser = document.querySelector("#roluser").value;
    let iduser = document.querySelector("#iduser").value;

    console.log('roluser', roluser);
    getCommentsbyIdTool();
    e.preventDefault();
});

async function getCommentsbyIdTool() {

    try {
        const response = await fetch(urlapi + idmaq);
        const datos = await response.json();
        app.comments = datos;
<<<<<<< HEAD
        //app.rol = $_SESSION[USER_ROL];
        console.log(app.rol);
=======
        app.roluser = roluser;
>>>>>>> e5d079093cd592f07ee357e9f49d5aff8129c739

    } catch (e) {
        console.log(e);
    }

}