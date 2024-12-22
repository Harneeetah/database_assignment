// created collections
db.createCollection('items')
db.createCollection("users")
db.createCollection('orders')
db.createCollection('category')
db.createCollection('admin')

// insert data
db.items.insertOne({id:1, name:'book', description:'for writing',item_category:'general',quantity:'10',price:'15',item_size:'medium',created_at: Date() });

// query data
db.items.find({ _id: 1 });

db.orders.find({_id:1});
