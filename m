Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6952466B11
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810876; cv=none; b=p0StQH+1a8aITVvie71lZDDoBQx9dbb33yCYICUR384+ye17KqqDO9TsszbtH1ndC/Anm4TIhXVGNmt8ahCrAXscHf1KuhqWL3TGXjUiK21plhGwAbILrS15jPts6y0VNgxB3Ces60T6+tH9UzxtWy2LASKYs9lNGaLEp3vH6PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810876; c=relaxed/simple;
	bh=/OOWqM+/ChEU9d8362G66BOwQk9kGeX/ndon4wIIahQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HQhE9WgLAjdGKY7LBVRpjFna6Vk85T/lODbCcZ3Hf4Yve19TzC7Z/4a3ZII5V3y43VLy5F+zX2rLb/TrooWDqeJtvfByCg9l3txJIXM0vLP+MmUnCLpWgtN636d8WP5mZigqy5aMi4EZzKuzWfLkb6FLJO6jNw4kT8pJAe0NYWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZVFISBcO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f5EG9ZUY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZVFISBcO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f5EG9ZUY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qbtK3606122
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TxDUiGp8SHaAPcdouNgR23yANnHbyiCldl9
	AoUt6zEI=; b=ZVFISBcOEB6VCAVDLMRI3ohYazPQ6fjJbMy69rfg1wQrpGaqIhg
	HdAAofDt1I+GqKrtdCD1JhdfYfIuLkD0+VGqncoOyA0goQo/Aeb6wzi/1wWkwVBW
	Zr7La5jnytK2WzMt2AvNruMd8ZLkQ2NfNn4D9e+yWtO2pa6+6nOmcS7KaQte6iuo
	LavT4d40zp3zbJzGF7Jl5O3tVh9UZeAFb7yQnNdzN+dy3QaBT0I1v5T2bsglYGSX
	cnWGCZY2/vbyfXMM8CHXwRjWWTnRclTTwCKD3xPB1ByukdVyiknWgC191UT2s92w
	auaOI30HTBptaMfGOxhDsI7radPXLiLaZ9Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke7qhbg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:47:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811279d51aso1111392a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 05:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784810873; x=1785415673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TxDUiGp8SHaAPcdouNgR23yANnHbyiCldl9AoUt6zEI=;
        b=f5EG9ZUYK418qxhxRUTWRuVWJ9J7Ajcg+bJMllyAQa4qwuh40vWYPZTqe4bT4b1Lu+
         S0qEupmL+q+zsLRqGjp6vAtVft5EehUW6r6l9G4jv2t80sHjGyErt0hMkHuLMo/L3IHg
         PuZkq5vJzcniMD0GmLppJx0pHVnAP5mR5OFnF9ZwuKLzOOmNnJJvNz3yLceVSpZZIswn
         475yVuGv7hpfst9df87kAOHIJAPwBq1+26GnNiwy6NVSDXSDzeraDaDOVoiIJiD/j6Nj
         nVpviwuH/QkwYm/gJIBFXgfXUKGUdd3A9zde0gyZi2t+dPvTVEim4o/EH/m8xXk+04JU
         cKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810873; x=1785415673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxDUiGp8SHaAPcdouNgR23yANnHbyiCldl9AoUt6zEI=;
        b=I2nVQHU5EIh1sl32iPAGpJHt10ZSQUu4iD6cFH2+u6whgy9MnD+/yLiGr8UrA4t+nX
         jxC41KOIqan20WuiJ+dkf47n3Vfw7bTs8sG4GfAi/oj+Q27pFXK8vKMhfyYOL0Y9N9mM
         AG7GgoVIaCEQ+2SrL66ISsFEVjuhIPkXpfbxaP8ZIcDzjrUR9Gg/fQEZ/IujvUJxH1JX
         fa5d57vVb42fvGn5TW+/hDlX01R5gch/a1w+B6uNEflB9uES/VCkI50kUBLvhUjbJYib
         P05d5TGYds/PawiZXYV3t5YPXBMm9OTZWHR+lI7XruzDgkgNindQLUQ03mvB47aU15e3
         kGAw==
X-Forwarded-Encrypted: i=1; AHgh+RoEnIXFm4hOSd1V3vdIi71VwMhWqQb7vNPiLQeAWWcnrA/PQJ9qF6HfTfmCEZrd9ZcuBKEyqH8Ac4c/gMF2@vger.kernel.org
X-Gm-Message-State: AOJu0YwfMno2C/UhaqO6mn1hviqjL5b/lT6kvpcabBmBNs51nXorc/6q
	0nTL+LYwS0qc7TmRARg/KfKDCATqBAHRSlLvE83g2MM30MECl9FM7aqTBPmjKHOAVagqDvg68Z2
	6N792rP+Z1bNskVxQlqKiV+FPZpOJq5NWyUmqguyKVPNg2hPBoDOPSDi4l8NelTY2C/CsADI9YK
	wQ
X-Gm-Gg: AR+sD11Sk0iYMT3iUOCyv1xk7fE2JkeN4OktmmLeKVDNGwV2t1Tc017W6bkA3u33NEm
	dDxf8KL9VH/ZL+aPFZM/tvSdL0+tkNgCC8tdHeXnm9NZMVmZ+bzs2wq7LjJRsEkK9f90qMh+OJg
	huEQtM7KDdHqKA/vF1b7K7QDxwiq8PjK79rGqrHaUFXF4Hh093FUr+ywDpSqbVEZCYANNxv70Fs
	9IJTns5jV8BsxtGbx2+oVXbeTK23Ebbl5OwYXMImNbrLGHWKYUkzdluPm4W26vmxHZf9ZrP6fhu
	xYHrBMxLJcEdoLq+1ouQQeL4IqXnIpWVrYZJPIi3ERiq3xKIrAfhs+jxgOfeCgJ7DNJuV7Axbo1
	6a0xq832V0l8eDmEKocsZSygyKIBXN3Tmrqnf6NMXX/txHWyxow==
X-Received: by 2002:a05:6a20:7483:b0:3b2:8685:1473 with SMTP id adf61e73a8af0-3c44afb58c5mr3374573637.7.1784810872730;
        Thu, 23 Jul 2026 05:47:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:7483:b0:3b2:8685:1473 with SMTP id adf61e73a8af0-3c44afb58c5mr3374545637.7.1784810872316;
        Thu, 23 Jul 2026 05:47:52 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.60.139.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c9289sm20350504eec.29.2026.07.23.05.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:47:51 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: alim.akhtar@samsung.com, avri.altman@sandisk.com, bvanassche@acm.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] Revert "scsi: ufs: core: Remove unnecessary block I/O quiesce for clock scaling"
Date: Thu, 23 Jul 2026 14:47:33 +0200
Message-ID: <20260723124733.341789-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfX8w4RANTVpd9X
 T1X+sFXvR0GK5QPGfzHw89RCneKJZXN7B36ex26bFc3qXCE1G4yjYibNk9r7NfgPYxzpjswreoD
 jGRfUUziSlCeQbeJNYUYYbF0XUKUXg4=
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a620d79 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fabVTapF7hbH8ecADQZKXA==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KsTwQG257LBwhBlho30A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 7d0AvS5ccMEi1oq-UAF_ZePR9yxJ2RiF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfX7786AhTImw2d
 rTUuGvLblyqGXhijKxCv5upObyD9sop56eJb4+WJmNluNMvbDsPjJN5LQbAZxtpGtjAAz6YuObL
 IfG+C33BLJGxNZHaqIOslIMJEDz6L35bRJZDKpcRQp2uDruqNRjVjYLNypMxF6VsfU59vpOX9tz
 9GHr5WXsvee4lrXAP4MVvMU/gZi6x8l/mOOknoMGXWnq1DUaJe/SqT0oqSQ9m5g5TLuzh1QV1BQ
 kjlnWwxPs/oQ+DMvh9G3OzXsGPlYaVwxcbNGWkYlEBXN3Qhmr8KRcMMuuqcMNafejOfQRPVglG2
 yA+7OeWRvDpCk06tsOc63ZgLnWyUsASM3ySENJ9kDBUW9qVPrpC4UhORa+ZHLLGy7qANYU8MXRL
 NLmbzUkNxoCSmBbfzYeBU6/X0277KKhXkpj7AdavVqxey9wJnz67iSKenXf6lSEoiNG9IPr/12Q
 r6hBdgMaIkuhTlwnGNg==
X-Proofpoint-ORIG-GUID: 7d0AvS5ccMEi1oq-UAF_ZePR9yxJ2RiF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230126

This reverts commit 85b2b966285498e1b551ac85f02c79cd06c0cff0.

Qcom UFS Host Controllers do not support scaling clocks when the traffic is
ongoing. But the offending commit removed the block I/O quiesce in the
clock scaling path, which causes below UFS failures during clock scaling:

ufshcd-qcom 1d84000.ufshc: ufshcd_check_errors: saved_err 0x80 saved_uic_err 0x0
ufshcd-qcom 1d84000.ufshc: ufshcd_err_handler started; HBA state eh_fatal; powered 1; shutting down 0; saved_err = 0x80; saved_uic_err = 0x0; force_reset = 0
ufshcd-qcom 1d84000.ufshc: pwr ctrl cmd 0x2 with (MIBattribute 0x1571, mode 0x11) completion timeout
ufshcd-qcom 1d84000.ufshc: UFS Host state=3
ufshcd-qcom 1d84000.ufshc: 7 outstanding reqs, tasks=0x0
ufshcd-qcom 1d84000.ufshc: saved_err=0x80, saved_uic_err=0x0
ufshcd-qcom 1d84000.ufshc: Device power mode=1, UIC link state=1
ufshcd-qcom 1d84000.ufshc: PM in progress=0, sys. suspended=0
ufshcd-qcom 1d84000.ufshc: Auto BKOPS=0, Host self-block=0
ufshcd-qcom 1d84000.ufshc: Clk gate=1
ufshcd-qcom 1d84000.ufshc: last_hibern8_exit_tstamp at 196451913 us, hibern8_exit_cnt=20
ufshcd-qcom 1d84000.ufshc: error handling flags=0x0, req. abort count=0
ufshcd-qcom 1d84000.ufshc: hba->ufs_version=0x300, Host capabilities=0x1587031f, caps=0x124f
ufshcd-qcom 1d84000.ufshc: quirks=0x0, dev. quirks=0x310c4
ufshcd-qcom 1d84000.ufshc: UFS dev info: SAMSUNG  KLUDG4UHDB-B2D1  rev 0400
ufshcd-qcom 1d84000.ufshc: clk: core_clk, rate: 300000000
ufshcd-qcom 1d84000.ufshc: clk: core_clk_unipro, rate: 300000000

Hence, revert the commit to bring back UFS on all Qcom platforms.

Reported-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Closes: https://lore.kernel.org/linux-scsi/al8YkXydXJQZrl_Y@QCOM-aGQu4IUr3Y
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/ufs/core/ufshcd.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 79331c2bd38d..1a5a851d43b2 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1445,7 +1445,7 @@ static int ufshcd_scale_gear(struct ufs_hba *hba, u32 target_gear, bool scale_up
  *
  * Return: 0 upon success; -EBUSY upon timeout.
  */
-static int ufshcd_clock_scaling_prepare(struct ufs_hba *hba)
+static int ufshcd_clock_scaling_prepare(struct ufs_hba *hba, u64 timeout_us)
 {
 	int ret = 0;
 	/*
@@ -1453,13 +1453,16 @@ static int ufshcd_clock_scaling_prepare(struct ufs_hba *hba)
 	 * clock scaling is in progress
 	 */
 	mutex_lock(&hba->host->scan_mutex);
+	blk_mq_quiesce_tagset(&hba->host->tag_set);
 	mutex_lock(&hba->wb_mutex);
 	down_write(&hba->clk_scaling_lock);
 
-	if (!hba->clk_scaling.is_allowed) {
+	if (!hba->clk_scaling.is_allowed ||
+	    ufshcd_wait_for_pending_cmds(hba, timeout_us)) {
 		ret = -EBUSY;
 		up_write(&hba->clk_scaling_lock);
 		mutex_unlock(&hba->wb_mutex);
+		blk_mq_unquiesce_tagset(&hba->host->tag_set);
 		mutex_unlock(&hba->host->scan_mutex);
 		goto out;
 	}
@@ -1475,6 +1478,7 @@ static void ufshcd_clock_scaling_unprepare(struct ufs_hba *hba, int err)
 {
 	up_write(&hba->clk_scaling_lock);
 	mutex_unlock(&hba->wb_mutex);
+	blk_mq_unquiesce_tagset(&hba->host->tag_set);
 	mutex_unlock(&hba->host->scan_mutex);
 
 	/* Enable Write Booster if current gear requires it else disable it */
@@ -1502,7 +1506,7 @@ static int ufshcd_devfreq_scale(struct ufs_hba *hba, unsigned long freq,
 
 	new_gear = ufshcd_vops_freq_to_gear_speed(hba, freq);
 
-	ret = ufshcd_clock_scaling_prepare(hba);
+	ret = ufshcd_clock_scaling_prepare(hba, 1 * USEC_PER_SEC);
 	if (ret)
 		return ret;
 
-- 
2.43.0

