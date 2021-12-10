var memberCountConTxt= 123456;
  
  $({ val : 0 }).animate({ val : memberCountConTxt }, {
   duration: 2000,
  step: function() {
    var num = numberWithCommas(Math.floor(this.val));
    $(".memberCountCon1").text(num);
  },
  complete: function() {
    var num = numberWithCommas(Math.floor(this.val));
    $(".memberCountCon1").text(num);
  }
});

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

var memberCountConTxt= 8000;
  
  $({ val : 0 }).animate({ val : memberCountConTxt }, {
   duration: 2000,
  step: function() {
    var num = numberWithCommas(Math.floor(this.val));
    $(".memberCountCon2").text(num);
  },
  complete: function() {
    var num = numberWithCommas(Math.floor(this.val));
    $(".memberCountCon2").text(num);
  }
});

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}