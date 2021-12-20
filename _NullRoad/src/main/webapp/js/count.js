var memberCountConTxt= 115600;
  
  $({ val : 0 }).animate({ val : memberCountConTxt }, {
   duration: 6000,
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

var memberCountConTxt= 600;
  
  $({ val : 0 }).animate({ val : memberCountConTxt }, {
   duration: 6000,
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