//creating my namespace
var app = {};

// MODEL
app.FoodModel = Backbone.Model.extend();

// TEMPLATE
// app.FoodTemplate = $('#food-template').html()

// MODEL VIEW
app.FoodView = Backbone.View.extend({
  tagName: "h2"
  template: _.template("<%= name %>"),
  initialize: function(){
    this.listenTo(this.model, "change", this.render);
  },
  render: function(){
    var data = this.model.attributes;
    var renderedTemplate = this.template(data);
    this.$el.html(renderedTemplate);
    // $("body").append(this.$el.html());
  }
})

// COLLECTION
app.FoodCollection = Backbone.Collection.extend({
  url: '/api/foods',
  model: app.FoodModel
});

$(document).ready(function(){
  app.foodList = new app.FoodList();
  app.foodList.fetch();
});







var app = app || {};

$(document).ready(function(){


  app.foods = new app.FoodCollection({
    model: app.FoodModel
  })

  app.parties = new app.PartyCollection({
    model: app.PartyModel
  })

  app.foodListPainter = new app.GeneralListView({
    modelView: app.FoodView,
    collection: app.foods,
    el: $('#menu-list'),
  });

  app.partyListPainter = new app.GeneralListView({
    modelView: app.PartyView,
    collection: app.parties,
    el: $('#party-list'),
  });

  app.parties.fetch();
  app.foods.fetch();

});
