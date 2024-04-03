SELECT
	an.Name
	,an.Species
	,an.Breed
	,an.Primary_Color
	,v.Vaccination_Time
	,v.Vaccine
	,v.First_Name
	,v.Last_Name
	,v.Role
FROM [dbo].[Animals] AS an
	LEFT JOIN (
		SELECT
			v.Name
			,v.Species
			,v.Vaccination_Time
			,v.Vaccine
			,p.First_Name
			,p.Last_Name
			,sa.Role
		FROM  [dbo].[Vaccinations] AS v
			INNER JOIN [dbo].[Persons] AS p ON
				p.Email = v.Email
			INNER JOIN [dbo].[Staff_Assignments] AS sa ON
				sa.Email = v.Email
	) AS v ON
		v.Name = an.Name
		AND v.Species = an.Species
