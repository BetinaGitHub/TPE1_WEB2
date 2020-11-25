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


document.addEventListener('DOMContentLoaded', e => {
    console.log('paso 1');
    getComments();

    // document.querySelector('#task-form').addEventListener('submit', e => {
    e.preventDefault();
    //    addTask();
    // });

});


async function getComments() {
    //    app.comments = list;
    console.log('paso 2');
    try {
        console.log('paso 3');
        const response = await fetch('api/comentarios');
        console.log(response);
        console.log('paso 3 y medio');
        const comments = await response.json();
        console.log(comments);

        // imprimo los comentarios
        app.comments = comments;

    } catch (e) {
        console.log('paso 4');
    }

}





/* async function getComments() {
    app.comments = list;

     try {
         const response = await fetch('api/tareas');
         const tasks = await response.json();
         // imprimo las tareas
         app.tareas = tasks;
     } catch (e) {
         console.log(e);
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