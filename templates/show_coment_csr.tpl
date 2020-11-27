{include 'header.tpl'}
    <div class="container"> 
        <div class="row">
            <div class="col-md-8">
                <h2 class="text-white bg-dark"> Comentarios</h2>
             
                {include file="vue/comments.vue"}
            </div>
        </div>
    </div>

    <!--  JS para CSR -->
    <script src="js/comments.js"></script> 

    {include file="footer.tpl"}
</body>
</html>    