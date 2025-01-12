USE [SWP391]
GO
/****** Object:  Table [dbo].[account]    Script Date: 6/4/2024 8:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[accountID] [int] IDENTITY(1,1) NOT NULL,
	[user] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL,
	[isAdmin] [int] NULL,
	[isSeller] [int] NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 6/4/2024 8:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[cartID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NULL,
	[totalAmount] [decimal](18, 2) NULL,
	[accountID] [int] NULL,
	[totalQuantity] [int] NULL,
 CONSTRAINT [PK_cart1] PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 6/4/2024 8:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[catID] [int] NOT NULL,
	[category] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[catID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 6/4/2024 8:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](10) NULL,
	[address] [nvarchar](max) NULL,
	[accountID] [int] NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delivery]    Script Date: 6/4/2024 8:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delivery](
	[deliveryID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[employeeID] [int] NULL,
	[delivery_date] [datetime] NULL,
	[status] [nvarchar](100) NULL,
 CONSTRAINT [PK_delivery] PRIMARY KEY CLUSTERED 
(
	[deliveryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 6/4/2024 8:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[employeeID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](10) NULL,
	[position] [nvarchar](50) NULL,
	[accountID] [int] NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[employeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedBack]    Script Date: 6/4/2024 8:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedBack](
	[feedBackID] [int] IDENTITY(1,1) NOT NULL,
	[customerID] [int] NULL,
	[orderID] [int] NULL,
	[rating] [int] NULL,
	[comments] [nvarchar](max) NULL,
 CONSTRAINT [PK_feedBack] PRIMARY KEY CLUSTERED 
(
	[feedBackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 6/4/2024 8:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[customerID] [int] NULL,
	[orderDate] [datetime] NULL,
	[totalAmount] [decimal](18, 2) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetail]    Script Date: 6/4/2024 8:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetail](
	[orderDetail_ID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[productID] [int] NULL,
	[quantiy] [int] NULL,
	[image] [nvarchar](max) NULL,
 CONSTRAINT [PK_orderDetail] PRIMARY KEY CLUSTERED 
(
	[orderDetail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 6/4/2024 8:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[paymentID] [int] IDENTITY(1,1) NOT NULL,
	[paymentMethod] [nvarchar](50) NULL,
	[totalPrice] [decimal](18, 2) NULL,
	[cartID] [int] NULL,
 CONSTRAINT [PK_payment1] PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 6/4/2024 8:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
	[price] [decimal](18, 2) NULL,
	[category] [nvarchar](50) NULL,
	[image] [nvarchar](max) NULL,
	[catID] [int] NULL,
	[SellID] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (1, N'g6-se1822', N'12345678', 1, 1)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (2, N'g6', N'12345678', 0, 1)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (3, N'tranh', N'12345678', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (4, N'hoang', N'12345678', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (5, N'lam', N'12345678', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (6, N'se1822', N'12345678', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (7, N'swp', N'12345678', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (8, N'swp391', N'12345678', 0, 1)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (9, N'trung anh', N'12345678', 0, 1)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (10, N'loc', N'12345678', 0, 1)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (11, N'locdz', N'duclocdl03', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (12, N'ducloc', N'12345678', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (13, N'loc2k3', N'12345678', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (14, N'team 6', N'12345678', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (15, N'tranhcuteo', N'12345678', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (16, N'lamcute', N'12345678', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (17, N'tranhcutehaha', N'12345678', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (18, N'trunganh123', N'CuloLSLS20152003@', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (19, N'trunganh', N'Trunganh123@', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (20, N'trunganh12', N'Trunganh123@@', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (21, N'trungdz', N'Trunganh123456@', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (22, N'trungdz12', N'Trunganh123456@@', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (23, N'trung123', N'trung12345678', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (24, N'1234555', N'12345678', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (25, N'tranhdz', N'12345678', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (26, N'trunganhsan', N'12345678', 0, 0)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
INSERT [dbo].[category] ([catID], [category]) VALUES (1, N'Cafe')
INSERT [dbo].[category] ([catID], [category]) VALUES (2, N'Nước giải khát')
INSERT [dbo].[category] ([catID], [category]) VALUES (3, N'Trà')
INSERT [dbo].[category] ([catID], [category]) VALUES (4, N'Sinh tố')
GO
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (1, N'Nguyên Văn A', N'nguyenvana@gmail.com', N'0328788328', N'tại quầy', 1)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (2, N'ABC', N'ABC@gmail.com', N'0654789123', N'tại quầy', 2)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (3, N'Nguyễn Thị B', N'nguyenthib@gmail.com', N'0987654321', N'123 Đường ABC', 3)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (4, N'Lê Văn C', N'levanc@gmail.com', N'0123456789', N'456 Đường XYZ', 4)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (5, N'Trần Thị D', N'tranthid@gmail.com', N'0934567890', N'789 Đường MNO', 5)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (6, N'Phạm Văn E', N'phamvane@gmail.com', N'0901234567', N'321 Đường DEF', 6)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (7, N'Hoàng Thị F', N'hoangthif@gmail.com', N'0912345678', N'654 Đường GHI', 7)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (8, N'Nguyên Văn A', N'hoangthif@gmail.com', N'0912345678', N'654 Đường GHI', 8)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (9, N'Nguyên Văn A', N'hoangthif@gmail.com', N'0912345678', N'654 Đường GHI', 9)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (10, N'Nguyên Văn A', N'hoangthif@gmail.com', N'0912345678', N'654 Đường GHI', 10)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (11, N'Bùi Đức Lôc', N'buiducloc2003@gmail.com', N'0986486843', N'Lang Chánh - Thanh Hóa', 11)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (12, N'Nguyên Văn A', N'hoangthif@gmail.com', N'0912345678', N'654 Đường GHI', 12)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (13, N'Nguyên Văn A', N'hoangthif@gmail.com', N'0912345678', N'654 Đường GHI', 13)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (14, N'Nguyên Văn A', N'hoangthif@gmail.com', N'0912345678', N'654 Đường GHI', 14)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (15, N'Nguyên Văn A', N'hoangthif@gmail.com', N'0912345678', N'654 Đường GHI', 15)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (16, N'TrungAnh', N'donhattrunganh2003@gmail.com', N'0123456789', N'Hà Nội -hanoio noi noi noi ', NULL)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (17, N'TrungAnh', N'donhattrunganh2003@gmail.com', N'0123456789', N'Hà Nội- sóc sơn- sóc sơn', NULL)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (18, N'TrungAnh12', N'anhdnthe171790@fpt.edu.vn', N'0866719337', N'Hà nội- kakakak', NULL)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (19, N'TrungAnh123', N'anhdnthe171790@fpt.edu.vn', N'0866719337', N'Hà Nội - kkkkkkkk', NULL)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (20, N'TrungAnh', N'donhattrunganh2003@gmail.com', N'0123456789', N'Hà Nội - aaaaaaaaa', NULL)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (21, N'TrungAnh', N'tronanhlung@gmail.com', N'0866719337', N'hihiiiaaaaaaaaaa', NULL)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (22, N'TrungAnh', N'donhattrunganh2003@gmail.com', N'0123456789', N'hà nội - sóc sơn ', NULL)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (23, N'TrungAnh7', N'anhdnthe171790@fpt.edu.vn', N'0971066539', N'Hà Nội - sóc sơn ', NULL)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (24, N'TrungAnh55', N'anhdnthe171790@fpt.edu.vn', N'0971066539', N'Hà Nội - thanh hóa ', NULL)
SET IDENTITY_INSERT [dbo].[customer] OFF
GO
SET IDENTITY_INSERT [dbo].[delivery] ON 

INSERT [dbo].[delivery] ([deliveryID], [orderID], [employeeID], [delivery_date], [status]) VALUES (1, 1, 3, CAST(N'2024-06-15T09:30:00.000' AS DateTime), N'Completed')
INSERT [dbo].[delivery] ([deliveryID], [orderID], [employeeID], [delivery_date], [status]) VALUES (2, 2, 3, CAST(N'2024-06-16T10:30:00.000' AS DateTime), N'Completed')
INSERT [dbo].[delivery] ([deliveryID], [orderID], [employeeID], [delivery_date], [status]) VALUES (3, 3, 3, CAST(N'2024-06-15T11:30:00.000' AS DateTime), N'Completed')
INSERT [dbo].[delivery] ([deliveryID], [orderID], [employeeID], [delivery_date], [status]) VALUES (4, 4, 3, CAST(N'2024-06-16T02:20:00.000' AS DateTime), N'Completed')
INSERT [dbo].[delivery] ([deliveryID], [orderID], [employeeID], [delivery_date], [status]) VALUES (5, 5, 3, CAST(N'2024-07-15T12:30:00.000' AS DateTime), N'Completed')
INSERT [dbo].[delivery] ([deliveryID], [orderID], [employeeID], [delivery_date], [status]) VALUES (6, 6, 3, CAST(N'2024-07-15T01:30:00.000' AS DateTime), N'Completed')
INSERT [dbo].[delivery] ([deliveryID], [orderID], [employeeID], [delivery_date], [status]) VALUES (7, 7, 3, CAST(N'2024-07-15T05:30:00.000' AS DateTime), N'Completed')
SET IDENTITY_INSERT [dbo].[delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([employeeID], [name], [email], [phone], [position], [accountID]) VALUES (1, N'Trần Hoàng Hà', N'hoangha@gmail.com', N'012345678', N'Nhân Viên', 8)
INSERT [dbo].[employee] ([employeeID], [name], [email], [phone], [position], [accountID]) VALUES (2, N'Nguyễn Bá Nhật Anh', N'nhatanh@gmail.com', N'098765432', N'Nhân Viên', 9)
INSERT [dbo].[employee] ([employeeID], [name], [email], [phone], [position], [accountID]) VALUES (3, N'Việt Hoàng Nguyễn', N'viethoang@gmail.com', N'09858425', N'shiper', 10)
SET IDENTITY_INSERT [dbo].[employee] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (1, 1, CAST(N'2024-06-15T09:30:00.000' AS DateTime), CAST(70000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (2, 2, CAST(N'2024-06-16T10:30:00.000' AS DateTime), CAST(35000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (3, 3, CAST(N'2024-06-15T11:30:00.000' AS DateTime), CAST(50000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (4, 4, CAST(N'2024-06-16T02:20:00.000' AS DateTime), CAST(45000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (5, 5, CAST(N'2024-07-15T12:30:00.000' AS DateTime), CAST(60000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (6, 6, CAST(N'2024-07-15T01:30:00.000' AS DateTime), CAST(65000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (7, 7, CAST(N'2024-07-15T05:30:00.000' AS DateTime), CAST(40000.00 AS Decimal(18, 2)), N'Completed')
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[orderDetail] ON 

INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (1, 1, 1, 2, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-asm/posts/uong-ca-phe-den-2.webp')
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (2, 2, 2, 1, N'https://product.hstatic.net/1000287491/product/4._ca_phe_sua_da.jpg')
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (3, 3, 3, 1, N'https://product.hstatic.net/1000075078/product/1697450407_tx-frosty_effb42ad21a54240b26ea1118c8d9d44.jpg')
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (4, 4, 4, 1, N'https://getngo.vn/wp-content/uploads/2023/04/cacao-tra-sua-sua-tuoi-tran-chau-duong-den-h1.jpg')
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (5, 5, 5, 1, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-asm/posts/uong-ca-phe-den-2.webp')
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (6, 6, 6, 1, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-asm/posts/uong-ca-phe-den-2.webp')
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (7, 7, 7, 1, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-asm/posts/uong-ca-phe-den-2.webp')
SET IDENTITY_INSERT [dbo].[orderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (1, N'Trà Xanh Espresso Marble', N'ngọt', CAST(48000.00 AS Decimal(18, 2)), NULL, N'https://product.hstatic.net/1000075078/product/1696220139_tra-xanh-espresso-marble_26a0eb92bfd649508d0e93173e9b3083.jpg', 1, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (2, N'Cafe Đen Đá', N'đắng', CAST(35000.00 AS Decimal(18, 2)), NULL, N'https://product.hstatic.net/1000075078/product/1639377797_ca-phe-den-da_6f4766ec0f8b4e929a8d916ae3c13254_large.jpg', 1, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (3, N'Americano', N'đắng', CAST(60000.00 AS Decimal(18, 2)), NULL, N'https://product.hstatic.net/1000075078/product/classic-cold-brew_791256_d4d8388a3d724f879845680c0239ff68.jpg', 1, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (4, N'Cafe Sữa Nóng', N'ngọt', CAST(45000.00 AS Decimal(18, 2)), N'Cafe', N'https://product.hstatic.net/1000075078/product/1639377770_cfsua-nong_9a47f58888e7444a9979e0d117d49ad3_large.jpg', 1, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (5, N'Cappuccino Nóng', N'ngọt và đắng', CAST(60000.00 AS Decimal(18, 2)), N'Cafe', N'https://product.hstatic.net/1000075078/product/cappuccino_621532_f42ec557eda145b5958374ca67e65ff2.jpg', 1, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (6, N'Cappuccino Đá', N'ngọt và đắng', CAST(50000.00 AS Decimal(18, 2)), N'Cafe', N'https://product.hstatic.net/1000075078/product/capu-da_487470_e06d3835cbc84e51bd635b04d541494e.jpg', 1, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (7, N'Bạc Xỉu', N'ngọt và đắng', CAST(40000.00 AS Decimal(18, 2)), N'Cafe', N'https://product.hstatic.net/1000075078/product/1639377904_bac-siu_525b9fa5055b41f183088c8e479a9472.jpg', 1, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (8, N'Cold Brew Phúc Bồn Tử', N'ngọt', CAST(75000.00 AS Decimal(18, 2)), N'Cafe', N'https://product.hstatic.net/1000075078/product/1675329120_coldbrew-pbt_127e09b0000c4027992bc3168899a656.jpg', 1, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (9, N'Dứa', N'nước ép tươi mát', CAST(40000.00 AS Decimal(18, 2)), N'Nước giải khát', N'https://crowncoffeevietnam.com/wp-content/uploads/2020/08/8-300x300.gif', 2, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (10, N'Dâu Tây Đá Xay', N'ngọt mát', CAST(30000.00 AS Decimal(18, 2)), N'Sinh tố', N'https://crowncoffeevietnam.com/wp-content/uploads/2020/08/u-300x300.jpg', 4, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (11, N'Cam', N'ngọt thanh', CAST(25000.00 AS Decimal(18, 2)), N'Nước giải khát', N'https://crowncoffeevietnam.com/wp-content/uploads/2020/08/9-300x300.gif', 2, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (12, N'Sinh Tố Bơ', N'béo ngậy của bơ', CAST(40000.00 AS Decimal(18, 2)), N'Sinh tố', N'https://kfehouse.vn/wp-content/uploads/2020/12/Sinh-to-bo-300x300.png', 4, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (13, N'Oolong Tứ Quý', N'Vị nước cốt kim quất tươi', CAST(45000.00 AS Decimal(18, 2)), N'Trà', N'https://product.hstatic.net/1000075078/product/1709005899_kimquat-xuan-1_3badf4c6bbc04a15ba38b68bf396c0f8.jpg', 3, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (14, N'Trà Đào Cam Sả', N'ngọt thanh', CAST(45000.00 AS Decimal(18, 2)), N'Trà', N'https://product.hstatic.net/1000075078/product/1669736819_tra-dao-cam-sa-da_63defc32ce214da487850604a63ff281.png', 3, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (15, N'Oolong Tứ Quý Sen', N'vị olong thanh mát cùng vị bùi của sen', CAST(50000.00 AS Decimal(18, 2)), N'Trà', N'https://product.hstatic.net/1000075078/product/tra-sen_905594_fc1c22441b1540bf90e853c8d0316368.jpg', 3, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (16, N'Oolong Tứ Quý Vải', N'ngọt thanh', CAST(40000.00 AS Decimal(18, 2)), N'Trà', N'https://product.hstatic.net/1000075078/product/1709004168_vai-xuan-1_07af236b854e4cf3868f8522dced19f2_large.jpg', 3, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (17, N'Táo Xanh', N'ngọt thanh', CAST(45000.00 AS Decimal(18, 2)), N'Trà', N'https://crowncoffeevietnam.com/wp-content/uploads/2020/08/o-1-300x300.jpg', 3, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (18, N'Sinh Tố Xoài ', N'vị xoài tươi', CAST(45000.00 AS Decimal(18, 2)), N'Sinh tố', N'https://bizweb.dktcdn.net/thumb/grande/100/438/465/products/22ab96083245f11ba854.jpg?v=1655371159900', 4, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (19, N'Sinh Tố Chuối Củ Dền', N'vị củ dền chuối và bơ', CAST(30000.00 AS Decimal(18, 2)), N'Sinh tố', N'https://kfehouse.vn/wp-content/uploads/2020/12/Sinh-to-chuoi-cu-den-ca-rot-300x300.png', 4, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (20, N'Sinh Tố Dâu', N'vị dâu tươi', CAST(35000.00 AS Decimal(18, 2)), N'Sinh tố', N'https://kfehouse.vn/wp-content/uploads/2020/12/Sinh-to-dau-300x300.png', 4, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (21, N'Sinh Tố Mãng Cầu', N'vị mãng cầu tươi', CAST(35000.00 AS Decimal(18, 2)), N'Sinh tố', N'https://deltadtl.dasogroup.vn/wp-content/uploads/2023/03/soursop-puree.webp', 4, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (22, N'Chanh Dây', N'vị chanh dây tươi', CAST(35000.00 AS Decimal(18, 2)), N'Nước giải khát', N'https://kfehouse.vn/wp-content/uploads/2020/12/Nuoc-ep-chanh-day-300x300.png', 2, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (23, N'Ổi Hồng', N'vị ổi tươi mát', CAST(35000.00 AS Decimal(18, 2)), N'Nước giải khát', N'https://kfehouse.vn/wp-content/uploads/2020/12/Nuoc-ep-oi-hong-300x300.png', 2, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (24, N'Táo', N'vị táo xanh', CAST(25000.00 AS Decimal(18, 2)), N'Nước giải khát', N'https://kfehouse.vn/wp-content/uploads/2020/12/Nuoc-ep-tao-300x300.png', 2, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (25, N'Nho', N'vị nho tim', CAST(30000.00 AS Decimal(18, 2)), N'Nước giải khát', N'https://product.hstatic.net/200000768759/product/nuoc-ep-nho_4a2d888fc2eb4b9cad0b0f406bb233ca_1024x1024.png', 2, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (26, N'Trà Đào Dầm', N'tươi mát', CAST(20000.00 AS Decimal(18, 2)), N'Nước giải khát', N'https://quynhtea.io.vn/wp-content/uploads/2024/05/tradaodam-e1714739962253.png', 3, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (27, N'Trà Chanh Xí Muội', N'tươi mát', CAST(25000.00 AS Decimal(18, 2)), N'Nước giải khát', N'https://quynhtea.io.vn/wp-content/uploads/2024/05/trachanhximuoi-e1714740778924.png', 3, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (28, N'Trà Vải', N'vải tươi mát', CAST(18000.00 AS Decimal(18, 2)), N'Trà', N'https://quynhtea.io.vn/wp-content/uploads/2024/05/travai-e1714741795353.png', 3, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (29, N'Trà Xoài', N'xoài tươi mát', CAST(30000.00 AS Decimal(18, 2)), N'Trà', N'https://crowncoffeevietnam.com/wp-content/uploads/2020/08/y.jpg', 3, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (30, N'Trà Mãng Cầu', N'mãng cầu tươi', CAST(35000.00 AS Decimal(18, 2)), N'Trà', N'https://kitecoffee.vn/wp-content/uploads/2023/06/tra-mang-cau-xiem.png', 3, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (1034, N'cứt to ', N'123', CAST(10000.00 AS Decimal(18, 2)), NULL, N'https://didongviet.vn/dchannel/wp-content/uploads/2022/01/chup-xoa-phong-didongviet.jpg', 2, 1)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_account] FOREIGN KEY([accountID])
REFERENCES [dbo].[account] ([accountID])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_account]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_product] FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([productID])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_product]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [FK_customer_account] FOREIGN KEY([accountID])
REFERENCES [dbo].[account] ([accountID])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [FK_customer_account]
GO
ALTER TABLE [dbo].[delivery]  WITH CHECK ADD  CONSTRAINT [FK_delivery_employee] FOREIGN KEY([employeeID])
REFERENCES [dbo].[employee] ([employeeID])
GO
ALTER TABLE [dbo].[delivery] CHECK CONSTRAINT [FK_delivery_employee]
GO
ALTER TABLE [dbo].[delivery]  WITH CHECK ADD  CONSTRAINT [FK_delivery_order] FOREIGN KEY([orderID])
REFERENCES [dbo].[order] ([orderID])
GO
ALTER TABLE [dbo].[delivery] CHECK CONSTRAINT [FK_delivery_order]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_account] FOREIGN KEY([accountID])
REFERENCES [dbo].[account] ([accountID])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_account]
GO
ALTER TABLE [dbo].[feedBack]  WITH CHECK ADD  CONSTRAINT [FK_feedBack_customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[customer] ([customerID])
GO
ALTER TABLE [dbo].[feedBack] CHECK CONSTRAINT [FK_feedBack_customer]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[customer] ([customerID])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_customer]
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD  CONSTRAINT [FK_orderDetail_order] FOREIGN KEY([orderID])
REFERENCES [dbo].[order] ([orderID])
GO
ALTER TABLE [dbo].[orderDetail] CHECK CONSTRAINT [FK_orderDetail_order]
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD  CONSTRAINT [FK_orderDetail_product] FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([productID])
GO
ALTER TABLE [dbo].[orderDetail] CHECK CONSTRAINT [FK_orderDetail_product]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [FK_payment_cart] FOREIGN KEY([cartID])
REFERENCES [dbo].[cart] ([cartID])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [FK_payment_cart]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([catID])
REFERENCES [dbo].[category] ([catID])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
