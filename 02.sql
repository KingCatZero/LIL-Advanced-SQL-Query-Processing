SELECT
	an.Name
	,an.Species
	,an.Primary_Color
	,an.Breed
	,COUNT(v.Name) AS Vaccine_Count
FROM [dbo].[Animals] AS an
	LEFT JOIN [dbo].[Vaccinations] AS v ON
		v.Name = an.Name
		AND v.Species = an.Species
		AND v.Vaccine != 'Rabies'
		AND v.Vaccination_Time < '2019-10-01'
WHERE
	an.Species != 'Rabbit'
GROUP BY
	an.Name
	,an.Species
	,an.Primary_Color
	,an.Breed
