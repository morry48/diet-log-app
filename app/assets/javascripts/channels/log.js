$(document).ready(function() {

  $("#form_add").click(function(){
    var count = (".text_form").length
    var html = `<div class="card text_form">
                  <label for="log_食品名" class="active">食品名</label>
                  <input placeholder="    food" type="text" name="log[name]-${count}" id="log_name">
                  <label for="log_タンパク質" class="active">タンパク質</label>
                  <input placeholder="    protein(g)" type="text" name="log[protein]-${count}" id="log_protein">
                  <label for="log_脂質" class="active">脂質</label>
                  <input placeholder="    fat(g)" type="text" name="log[fat]-${count}" id="log_fat">
                  <label for="log_炭水化物" class="active">炭水化物</label>
                  <input placeholder="    carbohydrate(g)" type="text" name="log[carbohydrate]-${count}" id="log_carbohydrate">
                </div>`
    $('.main_content').append(html);
  });
});


