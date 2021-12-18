$().ready(function () {
    $("#alertStart").click(function () {
        Swal.fire({
            icon: 'success',
            confirmButtonColor: '#7e3bc3',
            title: '주차장 등록이 신청되었습니다!',
            text: '2-3일 내에 결과가 안내됩니다.',
            closeOnClickOutside : false
        })
        });
});