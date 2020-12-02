"use strict";

document.addEventListener('DOMContentLoaded', e => {
    const idmaq = document.querySelector("#idtool").value;
    let roluser = document.querySelector("#roluser").value;
    let iduser = document.querySelector("#iduser").value;

    console.log(idmaq, roluser, iduser);
    getCommentsbyIdTool();
    let form_alta_comment = document.querySelector("#form_alta_comment");
    let det_comment = document.querySelector("#det_comment");


    form_alta_comment.addEventListener("submit", function(e) {
        let score = document.querySelector("input[name=r_button_score]:checked");
        const comentario = {
            "comentario": det_comment.value,
            "puntaje": score.value,
            "idmaq": idmaq,
            "iduser": iduser
        }

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
            app.tareas.push(datos);

        } catch (e) {
            console.log(e);
        }
        e.preventDefault();
    }

    async function getCommentsbyIdTool() {

        try {
            const response = await fetch(urlapi + idmaq);
            const datos = await response.json();
            /* imprimo los comentarios*/
            app.comments = datos;
            app.roluser = roluser;
        } catch (e) {
            console.log(e);
        }

    }
})