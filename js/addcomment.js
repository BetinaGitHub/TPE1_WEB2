"use strict";

/* const app = new Vue({
    el: "#app",
    data: {
        comments: [], // esto es como un assign de smarty
    },
 

}); */

//const urlapi = '../api/comentarios/';

document.addEventListener('DOMContentLoaded', e => {
    getCommentsbyIdTool();

    let form_alta_comment = document.querySelector("#form_alta_comment");
    let det_comment = document.querySelector("#det_comment");
    const idmaq = document.querySelector("#idtool").value;
    let iduser = 1;
    form_alta_comment.addEventListener("submit", function(e) {
        let score = document.querySelector("input[name=r_button_score]:checked");
        const comentario = {
            "comentario": det_comment.value,
            "puntaje": score.value,
            "idmaq": idmaq,
            "iduser": iduser
        }
        console.log(comentario);
        addComment(comentario);
        getCommentsbyIdTool();
    });

    async function addComment(comentario) {

        try {
            const response = await fetch(urlapi, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(comentario)
            });
            console.log(response);
            const datos = await response.json();
            console.log(datos);
            app.tareas.push(datos);


        } catch (error) {
            console.log(error);
        }
        e.preventDefault();
    }

    async function getCommentsbyIdTool() {

        try {
            const response = await fetch(urlapi + idmaq);
            const datos = await response.json();

            /* imprimo los comentarios*/
            app.comments = datos;

        } catch (e) {
            console.log(error);
        }

    }
})