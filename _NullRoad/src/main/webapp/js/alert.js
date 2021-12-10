
$().ready(function () {
    $("#alertStart").click(function () {
        Swal.fire({
            icon: 'success',
            confirmButtonColor: '#7e3bc3',
            title: '예약이 완료되었습니다!',
            text: '30분 내에 입차해주세요.',
        });
    });
});