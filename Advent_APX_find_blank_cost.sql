SELECT  t.Quantity, t.TradeDate, t.SecTypeCode1, s.Symbol, b.PortfolioManager, b.Custodian, b.AccountNumber
FROM dbo.AdvPortfolioTransaction T 
INNER Join dbo.AdvSecurity  s
	ON	s.SecurityID = t.SecurityID1
INNER JOIN dbo.AdvPortfolioBase p
       ON P.PortfolioBaseID = T.PortfolioID    
INNER Join dbo.AdvPortfolioBaseExt b
		ON p.PortfolioBaseID = b.PortfolioBaseID
WHERE TransactionCode IN ('li','ti')
AND T.SecTypeCode1 != 'ca'
And t.Quantity IS NOT NULL
AND (T.OriginalCost IS NULL )
AND DATEDIFF(MONTH,T.TradeDate,GETDATE()) = 0 
ORDER BY b.AccountNumber
