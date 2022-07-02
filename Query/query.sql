SELECT YEAR(orders.Date) AS `Years`,
SUM(IIF(CategoryName='Blueprints', orders.Quantity, 0)) AS `Blueprints`,
SUM(IIF(CategoryName='Drone Kits', orders.Quantity, 0)) AS `Drone Kits`,
SUM(IIF(CategoryName='Drones', orders.Quantity, 0)) AS `Drones`,
SUM(IIF(CategoryName='eBooks', orders.Quantity, 0)) AS `eBooks`,
SUM(IIF(CategoryName='Robot Kits', orders.Quantity, 0)) AS `Robot Kits`,
SUM(IIF(CategoryName='Robots', orders.Quantity, 0)) AS `Robots`,
SUM(IIF(CategoryName='Training Videos', orders.Quantity, 0)) AS `Training Videos`,
SUM(orders.Quantity) AS `Total Order`,
SUM(products.Price) AS `Total Price Order`
FROM (productCategory INNER JOIN products ON productCategory.CategoryID = products.Category) 
INNER JOIN (customers INNER JOIN orders ON customers.CustomerID = orders.CustomerID) ON products.ProdNumber = orders.ProdNumber
GROUP BY YEAR(orders.Date);
