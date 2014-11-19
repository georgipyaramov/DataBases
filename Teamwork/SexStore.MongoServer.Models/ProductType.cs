﻿namespace SexStore.MongoServer.Models
{
    using MongoDB.Bson;
    using MongoDB.Bson.Serialization.Attributes;

    public class ProductType
    {
        [BsonConstructor]
        public ProductType(string name)
        {
            this.Name = name;
        }

        [BsonId]
        public ObjectId Id { get; set; }

        // Unique
        [BsonRequired]
        public string Name { get; set; }
    }
}
