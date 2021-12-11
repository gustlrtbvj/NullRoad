
$().ready(function () {
    $("#alertStart").click(function () {
        Swal.fire({
            icon: 'success',
            confirmButtonColor: '#7e3bc3',
            title: '댓글이 등록되었습니다!',

            
        });
    });
});