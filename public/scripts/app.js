//creating my namespace
var app = {};

// MODEL
app.FoodModel = Backbone.Model.extend();

// TEMPLATE
// app.FoodTemplate = $('#food-template').html()

// MODEL VIEW
// app.FoodView = Backbone.View.extend({
//   template = _.template(app.FoodTemplate),
//   initialize: function(){
//     this.listenTo(this.model, "change", this.render);
//   },
//   render: function(){
//     var data = this.model.attributes;
//     this.$el.html(this.template(data));
//     $("#food-container").append(this.$el.html());
//   }
// })

// COLLECTION
app.FoodList = Backbone.Collection.extend({
  url: '/app/foods',
  model: app.FoodModel
});

$(document).ready(function(){
  app.foodList = new app.FoodList();
  app.foodList.fetch();
});
