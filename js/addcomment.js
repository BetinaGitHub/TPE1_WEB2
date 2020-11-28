"use strict";

/* const app = new Vue({
    el: "#app",
    data: {
        comments: [], // esto es como un assign de smarty
    },
 

}); */


document.addEventListener('DOMContentLoaded', e => {
    //  getCommentsbyIdTool();
    //   e.preventDefault();

    let form_alta_comment = document.querySelector("#form_alta_comment");
    let score = document.querySelector("input[name=r_button_score]:checked");
    //   document.querySelector('input[name=nameOfradio]:checked').value;
    let det_comment = document.querySelector("#det_comment");
    const idmaq = document.querySelector("#idtool").value;

    getCommentsbyIdTool();
    let iduser = 1;
    console.log(idmaq);



    //e.preventDefault();
    form_alta_comment.addEventListener("submit", function(e) {
        console.log('Entro al alta');
        let score = document.querySelector("input[name=r_button_score]:checked").value;
        e.preventDefault();
        const comentario = {
            "comentario": det_comment.value,
            "puntaje": score,
            "idmaq": idmaq,
            "iduser": iduser
        }
        console.log(comentario);
        addComment(comentario);
        getCommentsbyIdTool();
    });

    async function addComment(comentario) {

        try {
            const response = await fetch('../api/comentarios', {
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
        //    e.preventDefault();
    }

    async function getCommentsbyIdTool() {
        //   const urlapi = 'api/comentarios/';
        console.log('aca entra');
        //console.log(idmaq);
        try {
            const response = await fetch('../api/comentarios/' + idmaq);
            //        console.log(response);
            const datos = await response.json();
            //        console.log(datos);
            // imprimo los comentarios
            app.comments = datos;

        } catch (e) {
            console.log(error);
        }

    }
})