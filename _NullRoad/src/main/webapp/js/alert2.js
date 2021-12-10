
$().ready(function () {
    $("#alertStart").click(function () {
        Swal.fire({
            icon: 'success',
            confirmButtonColor: '#7e3bc3',
            title: '문의가 전송되었습니다!',

            
        });
    });
});