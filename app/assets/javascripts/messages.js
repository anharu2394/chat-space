$(function(){
    function buildHTML(ms){
        var html = `<div class="message">
<p class="message__user-name">
${ms.name}
</p>
<p class="message__time">
${ms.created_at}
</p>
<p class="message__text">
${ms.body}
</p>

</div>`
        return html;
    }
    $(".ms-form").on("submit",function(e){
        e.preventDefault();
        console.log("Submited!");
        var formData = new FormData(this);
        console.log(formData);
        var url = location.href
        console.log(url);
        $.ajax({
            url: url,
            data: formData,
            type:"POST",
            dataType: "json",
            processData: false,
            contentType: false
        })
        .done(function(data){
            console.log("done?");
            var html = buildHTML(data);
            $(".right-content__main").append(html);
            $("html,body").animate({scrollTop: $('.right-content').height()}, 800);
            console.log("done!!!!");
        })
        .fail(function() {
            alert("投稿に失敗しました");
        })
    });
});
