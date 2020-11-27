"use strict";

const app = new Vue({
    el: "#app",
    data: {
        comments: [], // esto es como un assign de smarty
    },
});

/*
let list = [{
        descripcion: 'Es un producto  vendible',
        score: 5,
    },
    {
        descripcion: 'Usado reparado a nuevo',
        score: 4,
    },
    {
        descripcion: 'Se puede canjear por cereal',
        score: 5,
    },
    {
        descripcion: 'Lo último en el mercado',
        score: 3,
    }

];

console.log(list);*/

let idmaq = document.querySelector("#idtool").value;

console.log(idmaq);

document.addEventListener('DOMContentLoaded', e => {
    console.log('paso 1');
    //getComments();
    getCommentsbyIdTool();
    // document.querySelector('#task-form').addEventListener('submit', e => {
    e.preventDefault();
    //    addTask();
    // });

});


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
}

async function getCommentsbyIdTool() {
    //   const urlapi = 'api/comentarios/';
    console.log('aca entra'),
        console.log(idmaq);
    try {
        const response = await fetch('../api/comentarios/' + idmaq);
        console.log(response);
        const datos = await response.json();
        console.log(datos);
        // imprimo los comentarios
        app.comments = datos;

    } catch (e) {
        console.log('paso 4');
    }

}

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