MoneyWash = {};

MoneyWash.EventManager = function(event) {
    let data = event.data;
    MoneyWash[data.event] && MoneyWash[data.event](data.data || {});
};

MoneyWash.OpenWindow = function(bool) {
    $("#wrapper").show();
}

MoneyWash.CloseWindow = function(bool) {
    $("#wrapper").hide();
}

$("#close").click(function() {
    MoneyWash.CloseWindow();
    MoneyWash.PostManager("Exit");
    return;
});

$("#submit").click(function() {
    let inputValue = parseInt($("#input").val());
    if (!inputValue) {
        MoneyWash.PostManager("Error", "Du måste ange en summa!");
        MoneyWash.CloseWindow();
        return;
    } else if (inputValue <= 0) {
        MoneyWash.PostManager("Error", "Du måste tvätta mer än 0 SEK!");
        MoneyWash.CloseWindow();
        return;
    } else {
        MoneyWash.PostManager("WashMoney", inputValue);
        MoneyWash.CloseWindow();
        return;
    };
});

MoneyWash.PostManager = function(event, data) {
    $.post("https://p1_moneywash/EventManager", JSON.stringify({
        event: event,
        data: data || {}
    }));
};

window.addEventListener("message", MoneyWash.EventManager);