﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by the ContextGenerator.ttinclude code generation file.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------
using System;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using System.Data.Common;
using System.Collections.Generic;
using Telerik.OpenAccess;
using Telerik.OpenAccess.Metadata;
using Telerik.OpenAccess.Data.Common;
using Telerik.OpenAccess.Metadata.Fluent;
using Telerik.OpenAccess.Metadata.Fluent.Advanced;
using MySQLServer;

namespace MySQLServer	
{
	public partial class MySQLContext : OpenAccessContext, IMySQLContextUnitOfWork
	{
		private static string connectionStringName = @"MySQLConnStrDKostov";
			
		private static BackendConfiguration backend = GetBackendConfiguration();
				
		private static MetadataSource metadataSource = XmlMetadataSource.FromAssemblyResource("EntitiesModel.rlinq");
		
		public MySQLContext()
			:base(connectionStringName, backend, metadataSource)
		{ }
		
		public MySQLContext(string connection)
			:base(connection, backend, metadataSource)
		{ }
		
		public MySQLContext(BackendConfiguration backendConfiguration)
			:base(connectionStringName, backendConfiguration, metadataSource)
		{ }
			
		public MySQLContext(string connection, MetadataSource metadataSource)
			:base(connection, backend, metadataSource)
		{ }
		
		public MySQLContext(string connection, BackendConfiguration backendConfiguration, MetadataSource metadataSource)
			:base(connection, backendConfiguration, metadataSource)
		{ }
			
		public IQueryable<sexStoreReports> sexStoreReports 
		{
			get
			{
				return this.GetAll<sexStoreReports>();
			}
		}
		
		public static BackendConfiguration GetBackendConfiguration()
		{
			BackendConfiguration backend = new BackendConfiguration();
			backend.Backend = "MySql";
			backend.ProviderName = "MySql.Data.MySqlClient";
		
			CustomizeBackendConfiguration(ref backend);
		
			return backend;
		}
		
		/// <summary>
		/// Allows you to customize the BackendConfiguration of MySQLContext.
		/// </summary>
		/// <param name="config">The BackendConfiguration of MySQLContext.</param>
		static partial void CustomizeBackendConfiguration(ref BackendConfiguration config);
		
	}
	
	public interface IMySQLContextUnitOfWork : IUnitOfWork
	{
		IQueryable<sexStoreReports> sexStoreReports
		{
			get;
		}
	}
}
#pragma warning restore 1591