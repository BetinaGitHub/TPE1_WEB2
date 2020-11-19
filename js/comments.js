"use strict";

const app = new Vue({
    el: "#app",
    data: {
        comments: [], // esto es como un assign de smarty
    },
});


let list = [{
        descripcion: 'Es un producto altamente vendible',
        score: 9,
    },
    {
        descripcion: 'Usado reparado a nuevo',
        score: 7,
    },
    {
        descripcion: 'Se puede canjear por cereal',
        score: 8,
    },
    {
        descripcion: 'Lo último en el mercado',
        score: 8,
    }

];

console.log(list);


document.addEventListener('DOMContentLoaded', e => {
    getComments();

    // document.querySelector('#task-form').addEventListener('submit', e => {
    e.preventDefault();
    //    addTask();
    // });

});

async function getComments() {
    app.comments = list;

    /*  try {
         const response = await fetch('api/tareas');
         const tasks = await response.json();

         // imprimo las tareas
         app.tareas = tasks;

     } catch (e) {
         console.log(e);
     } */
}


async function addTask() {

    // armo la tarea
    const task = {
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