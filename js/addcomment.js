'use strict';

document.addEventListener('DOMContentLoaded', e => {
    let idmaq = document.querySelector('param[name=idmaq]').value;
    getComments(idmaq);
    document.querySelector('#comment-form').addEventListener('submit', e => {
        e.preventDefault();
        addComment(idmaq);
    });
});

//Inserta un comentario a una maquina
async function addComment(idMaq) {
    const comment = {
        user: document.querySelector('param[name=username]').value,
        id_user: document.querySelector('param[name=user]').value,
        comment: document.querySelector('textarea[name=comment]').value,
        puntaje: document.querySelector('#valoracion').innerHTML,
    }
    try {
        const response = await fetch('../api/comments/' + idmaq, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(comment)
        });

        const c = await response.json();
        document.querySelector('textarea[name=comment]').value = '';
        getComments(idSkin);
    } catch (e) {
        console.log(e);
    }