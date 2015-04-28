var app = app || {};

app.foods = new FoodCollection({
  model: app.foodModel
});

app.foods.fetch();
