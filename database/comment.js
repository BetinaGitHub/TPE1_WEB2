'use strict';
// document.addEventListener("DOMContentLoaded", 
// getComments);

document.addEventListener('DOMContentLoaded', e => {
    let comentarios = [];
    let user = {};
    let idSkin = document.querySelector("#idskin").innerHTML;
    getComments(idSkin, comentarios, user);
    document.querySelector('#comment-form').addEventListener('submit', e => {
        e.preventDefault();
        addComment(idSkin);
    });

});


async function getComments(idSkin, comentarios, user) {
    try {
        // Me encargo de traer unicamente los comentarios de la skin que estamos viendo.
        const response = await fetch(`api/comments/${idSkin}`);
        const comments = await response.json();
        comentarios = comments;

        for (let index = 0; index < comentarios.length; index++) {
            // Una vez obtengo el ID de quien escribio, le busco el nombre.
            try {
                const response = await fetch(`api/user/${comentarios[index].id_user}`);
                const usuario = await response.json();

                user = usuario;
            } catch (e) {
                console.log(e);
            }
            // Escribo el comentario en la caja de comentarios.
            document.querySelector('#commentbox').innerHTML +=
                `<div class="d-flex flex-row bg-info col">
            <div class="p-2 col-2">${user.usuario}</div>
            <div class="p-2 col-2 text-center">${comentarios[index].valoracion}</div>
            <div class="p-2 col-8 text-center">${comentarios[index].comentario}</div>
            </div>`;
        }
    } catch (e) {
        console.log(e);
    }
};
// add comment sin termina
async function addComment(idSkin) {
    const comment = {
        id_user: document.querySelector('param[name=user]').value,
        comentario: document.querySelector('textarea[name=comment]').value,
        valoracion: document.querySelector('select[name=valoracion]').value,
    }
    try {
        const response = await fetch(`api/comments/${idSkin}`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(comment)
        });

        const c = await response.json();
        // app.comentarios.push(c);
        console.log(c);

    } catch (e) {
        console.log(e);
    }
}
