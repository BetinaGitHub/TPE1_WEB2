"use strict";

const app = new Vue({
    el: "#app",
    data: {
        comments: [],
        roluser: 0,
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
        app.roluser = roluser;

    } catch (e) {
        console.log(e);
    }

}