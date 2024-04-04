SELECT
	an1.Species
	,an1.Breed
	,an1.Name AS Male
	,an2.Name AS Female
FROM [dbo].[Animals] AS an1
	INNER JOIN [dbo].[Animals] AS an2 ON
		an2.Species = an1.Species
		AND an2.Breed = an1.Breed
		AND an2.Gender = 'F'
		AND an1.Gender = 'M'
ORDER BY
	an1.Species
	,an1.Breed
