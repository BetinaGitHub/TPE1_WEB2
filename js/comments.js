"use strict";

const app = new Vue({
    el: "#app",
    data: {
        comments: [], // esto es como un assign de smarty
    },
    methods: {
        rmComment: async function(idcom) {

            let url = '../api/comentarios/' + idcom;

            try {
                const response = await fetch(url, { 'method': 'DELETE' })
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


const idmaq = document.querySelector("#idtool").value;

document.addEventListener('DOMContentLoaded', e => {
    console.log('paso 1');
    getCommentsbyIdTool();
    e.preventDefault();
});

/* 
async function getComments() {
    const urlapi = 'api/comentarios';
    try {
        const response = await fetch(urlapi);
        console.log(response);
        if (response.status == 200) {
            const datos = await response.json();
            console.log(datos);
            // imprimo los comentarios
            app.comments = datos;
        }
    } catch (e) {
        console.log('paso 4');
    }
} */

async function getCommentsbyIdTool() {
    //   const urlapi = 'api/comentarios/';
    // console.log('aca entra'),
    //console.log(idmaq);
    try {
        const response = await fetch('../api/comentarios/' + idmaq);
        //        console.log(response);
        const datos = await response.json();
        //        console.log(datos);
        // imprimo los comentarios
        app.comments = datos;

    } catch (e) {
        console.log(e);
    }

}
/* async function removeComment(idcom) {
    //   const urlapi = 'api/comentarios/';
    console.log('aca entra');
    console.log(idcom);

    /*    try {
           const response = await fetch('../api/comentarios/' + idcomment);
           console.log(response);
           const datos = await response.json();
           console.log(datos);
           // imprimo los comentarios
           app.comments = datos;

       } catch (e) {
           console.log('paso 4');
       } 

} */
async function addComment() {

    //cargo el comentario
    const comment = {
        titulo: document.querySelector('input[name=titulo]').value,
        descripcion: document.querySelector('textarea[name=descripcion]').value,
        prioridad: document.querySelector('select[name=prioridad]').value,
        finalizada: false
    }

    try {
        const response = await fetch('api/tareas', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(task)
        });

        const t = await response.json();
        app.tareas.push(t);

    } catch (e) {
        console.log(e);
    }


}