"use strict";

const app = new Vue({
    el: "#app",
    data: {
        comments: [], // esto es como un assign de smarty
    },
    methods: {
        rmComment: async function(idcom) {
            //          let url = urlapi + idcom;

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
    getCommentsbyIdTool();
    e.preventDefault();
});

async function getCommentsbyIdTool() {

    try {
        const response = await fetch(urlapi + idmaq);
        const datos = await response.json();
        app.comments = datos;

    } catch (e) {
        console.log(e);
    }

}