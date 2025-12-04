--List patients in Kingston



select

  AdmittedDate,
  Datediff(Day, AdmittedDate,DischargeDate) AS LengthofStay,
  DATEADD(WEEK,-2,AdmittedDate) as 'ReminderDate', --- ---2 weeks before admitted
  DATEADD(MONTH,3,DischargeDate) as 'AppointmntDate', -- ---3 months before admitted  date
  DischargeDate,
  Hospital ,
  Ward
  FROM 
  PATIENTSTAY
 WHERE HOSPITAL IN ('Kingston','PRUH')
 ----ORDER BY Hospital asc,Ward asc,Tariff DESC,
 order by PatientId DESC 
--and ward IN ('DAY SURGERY','GENERAL SURGERY')
--AND AdmittedDate BETWEEN '2024-02-27' AND '2024-03-02'
--AND Tariff < 6

SELECT 
Hospital, 
ward,
count (*) as numberofpatients,
sum (tariff) as TotalTariff

from PatientStay

group by hospital,Ward

select PS.PatientId,PS.AdmittedDate,H.HospitalType,H.HospitalSize ,H.hospital,PS.Hospital
from PatientStay ps FULL OUTER join DimHospitalBad H on ps.Hospital=H.Hospital
--where HospitalType= 'Teaching'


SELECT *
FROM DimHospitalBad


