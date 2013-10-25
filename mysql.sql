select SpotsId,CampaignId,TargetContent from st_sp where (TargetContent != '0' and TargetContent!='') and IsDeleted='0';
