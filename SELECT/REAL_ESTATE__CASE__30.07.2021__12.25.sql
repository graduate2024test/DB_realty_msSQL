------------------------------------------
--CASE 1
------------------------------------------
SELECT
  RealEstateBrokerInfo,RealEstateBrokerCommission,RealEstateAgencyID,

  CASE
    WHEN RealEstateBrokerCommission >= 0.5 THEN 'Комисиионные >= 50%'
    WHEN RealEstateBrokerCommission >= 0.4 THEN '40% <= Комисиионные < 50%'
    ELSE 'Комисиионные < 40%'
  END CommissionType

FROM RealEstateBroker
GO


------------------------------------------
--CASE 2
------------------------------------------
SELECT
  RealEstateBrokerInfo,RealEstateBrokerCommission,RealEstateAgencyID,

  CASE RealEstateAgencyID
    WHEN 6 THEN '20%'
    WHEN 9 THEN '30%'
    ELSE '10%'
  END NewYearBonusPercent,

  RealEstateBrokerCommission * 1000 *
  CASE RealEstateAgencyID
    WHEN 6 THEN 20
    WHEN 9 THEN 30
    ELSE 10
  END BonusAmount

FROM RealEstateBroker
GO

