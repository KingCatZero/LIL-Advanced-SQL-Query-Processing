WITH
	cteVaccinations AS (
		SELECT
			v.Species
			,v.Vaccination_Time
			,YEAR(v.Vaccination_Time) AS Vaccination_Year
			,CONCAT(p.First_Name, ' ', p.Last_Name) AS Staff_Member
		FROM [dbo].[Vaccinations] AS v
			INNER JOIN [dbo].[Persons] AS p ON
				p.Email = v.Email
	)
SELECT
	ISNULL(CAST(Vaccination_Year AS VARCHAR(4)), '*') AS Vaccination_Year
	,ISNULL(Species, '*') AS Species
	,ISNULL(Staff_Member, '*') AS Staff_Member
	,COUNT(1) AS Vaccination_Count
	,MAX(Vaccination_Year) AS Max_Vaccination_Year
FROM cteVaccinations
GROUP BY GROUPING SETS (
	Vaccination_Year
	,Species
	,Staff_Member
	,(Vaccination_Year, Species)
	,(Staff_Member, Species)
	,()
)
ORDER BY
	Vaccination_Year
	,Species
	,Staff_Member
