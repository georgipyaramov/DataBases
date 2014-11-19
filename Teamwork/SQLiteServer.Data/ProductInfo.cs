﻿namespace SQLiteServer.Data
{
    public class ProductInfo
    {
        public ProductInfo(int code, string productName, int productTax, double expenses)
        {
            this.ProductCode = code;
            this.ProductName = productName;
            this.TaxPercent = productTax;
            this.Expenses = expenses;
        }

        public int ProductCode { get; set; }

        public string ProductName { get; set; }

        public int TaxPercent { get; set; }

        public double Expenses { get; set; }
    }
}
