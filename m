Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088681;
	b=Q5FDVTm341zTrlz4EZzeBY+JM10meGbFMpQKsJNRQRB4NYrWLo3hSZwrzCMFVnpX7gfi
	 7+anmdzdrAqe+iro3Tb1avvcvxnr9a76BAPhItwodZKFiy0l/uVE2Fb4bxes2SZUhb4P3
	 rcXbcj86OdaW4R3yFGF9xHKOV5d6qGQntR25kR9ZQdM2ERU/sGadXVXu18Sp194DEQFte
	 L6q6lyqwcNionXmU0lvUHUYY+8iRXPJNGHPRQf9vRAg/l3lvpVMQEcQoOLRSygETcMZuH
	 qQztUJozWVr26n5FcF2loWP059ij6NaAOfwCrFyfmfitQA64ulEgH72l5DfxVTXy5xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088681;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EPBHSlrIX/Ukixyt4fly1MDx5yiI9ET3jcaIVsEYQ6o=;
	b=HrH7+xinu6lxCKrEnLO7shtgPIo24JOOTbO72CZa2I3hT16g5FLm8WO611FZM+UDnYs5
	 4+7zGrPN5ral/PlwNpscTneSgfEnsrnml32usAGUGr2MThZdtdIWb2oo/xUNQNudmdGmM
	 360jHhzgPqVWnV7q8P1hG8SzD7dLqxgwkbOW3adekQ273THDmSE25kYqoMVnZ9LF/l4b4
	 hzqpLw9fCzd4iXQDyYBRp0emgB25fxpuzqNW3x8EBZCnjvR5dgZzHxefx+K2bD9QHp4a7
	 ODJYNSg/MgZEGsWA1yb/0NFTJ9z1WbBTWj3NFsIR1utVjj/vEH2AMxT9Nep8n3PHPDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SuOmisgp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C7A606A324;
	Thu, 19 Nov 2026 11:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7C7A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SuOmisgp
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJB53mx2093164;
	Thu, 19 Nov 2026 11:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EPBHSlrIX/Ukixyt4fly1M
	Dx5yiI9ET3jcaIVsEYQ6o=; b=SuOmisgphJfsJNdVpRifEb1oGo68WpR8qoaKT/
	/IHywKOBUggX1I2yob9r7eJ7KbtFslkTjsbpc+2oWaw38kisLl6PEDNiPksvPq2l
	btP92mKdKnQOJR91t8zD74BkJLuTmQhzyUhwIGzZ4gXPO1PYHJJvkpayR9/WNliT
	TMMyrZFWpMArdIAhXwOWdGrV5DjmwXpaeEFI1zY0IOt9ENbdLs3ZtYTJ5McVWY95
	UGs8v7bs7cgfvie+5Fhs4XKNAU2uw5Rg7zWOvuqlec3SCtjJ990ziq3jo8Uw7K2F
	HyWsj7fT4eN51DpFktNzwXO7cixJWAN3chNF8XWiJPef4Ukg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1yx68440-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 11:44:38 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBiZ6X2696398;
	Thu, 19 Nov 2026 11:44:35 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pussin-hyd.qualcomm.com [10.147.247.182])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AJBiZXt2696391
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 11:44:35 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4706513)
	id AA6893C8; Thu, 19 Nov 2026 17:14:34 +0530 (+0530)
From: Pushpendra Singh <pushpendra.singh@oss.qualcomm.com>
To: krzk@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        abelvesa@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pushpendra Singh <pushpendra.singh@oss.qualcomm.com>
Subject: [PATCH v4] devfreq: qcom: bwmon: Reduce zone1 threshold count to 3
Date: Thu, 19 Nov 2026 17:14:26 +0530
Message-Id: <20261119114426.4050161-1-pushpendra.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: IGlwpvQJFtqPimmFM0brx462KCqfUXHx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX9pJdJF+PuKQu
 SBcuImTFHXOFcgYeRp8WvsMoQt82lnD1lTBrAahsr92wCDcky8tO0eLIdTzwPGEDB6UwyPGj4x1
 Dt1loASFzf2jtzhvq6DPP+kWIDLFfeY=
X-Proofpoint-ORIG-GUID: IGlwpvQJFtqPimmFM0brx462KCqfUXHx
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6afee126 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=RGsjnBcAIkQE9p9hHc4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX6TZhxr/76Fem
 6UXpUTHAGKQS8Ra372/Llf6TEfJwWzocFgE16h103fRAv+XwjylIubQU8N7r5V8jbWPoiX3AkNs
 ew5qMfc9je5RvbRLEC44eZPdWCsyMtIXADpEPfrOG6zMeLktVzAYM3ImbySiyGhqUe4LwPeetQp
 g04zjKFVLeSBbxGF0qulpaJm8p4bsalREphKfHD2LH8huxOPQMpc0wl8jV+OsjZWg3mgBx8SAhF
 UcX08W7Mi/nREv2/CZHFJiLq684N/CuRoaIS5efC+EbkUKeq8wGobRGEJ7wf/wLfEAL4D9yvFaA
 W8dtrmzVMNwgtksMO22jC4ZeIciAUZEZ8tPzQ0qJWIH6/aa5JIEHPBcEzkjFrTN4+PqcpmJD3FX
 zdyOjUe6SZwKbnQULpv/LOEtZ8vX32g8mjYqTKQcdb2xyeRaRA7tTosQ7tDSFsFBGkoL6JWYVZD
 9ijnpIpWe4mO/5FkLhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190046

Reduce zone1_thres_count from 16 to 3 so the driver can lower the bus
vote after 3 sample windows instead of waiting for 16. The previous
16‑window delay (~64 ms) is too long at higher FPS workloads,
causing delayed decision making and measurable power regression.

Power and performance measurements were collected for
zone1_thres_count = 3 and 16, with the following results:

Usecase                         zone1_cnt=16	zone1_cnt=3       Delta
YouTube streaming (power)	4126.49 mW	3991.30 mW      -3.28%
Google Meet audio (power)	3058.79 mW	2929.73 mW      -4.22%
Speedometer 3.1(perf)		25.8		26.5            +2.7%
Geekbench 6.5 ST(perf)		3907		3905            -0.1%
Geekbench 6.5 MT(perf)		18636		18680           +0.2%

The reduced threshold therefore allows BWMON to react sooner to falling
bandwidth demand, providing measurable power savings in the tested
workloads without a meaningful performance regression.

Signed-off-by: Pushpendra Singh <pushpendra.singh@oss.qualcomm.com>

Changes in v4:
- Rework the commit message to clarify why reducing zone1_thres_count
  improves BWMON downscaling responsiveness.
- Clarify the empirical selection of 3 compared with lower and higher
  threshold values.
- Add power and performance measurements comparing zone1_thres_count=16
  and zone1_thres_count=3.
- Link to V3 : https://lore.kernel.org/lkml/14d9e262-c3e6-41b4-a408-3d12185b0d48@oss.qualcomm.com/

Chages in v3:
- Update commit message
- Link to v2: https://lore.kernel.org/lkml/d72182bc-f8d4-4314-b2f1-c9242618eb67@quicinc.com/

Changes in v2:
- Update commit message
- Link to v1: https://lore.kernel.org/lkml/463eb7c8-00fc-4441-91d1-6e48f6b052c8@quicinc.com
---
 drivers/soc/qcom/icc-bwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
index 1ee9f5ce35cd..4cf1bf30d6d2 100644
--- a/drivers/soc/qcom/icc-bwmon.c
+++ b/drivers/soc/qcom/icc-bwmon.c
@@ -830,7 +830,7 @@ static const struct icc_bwmon_data msm8998_bwmon_data = {
 static const struct icc_bwmon_data sdm845_cpu_bwmon_data = {
 	.sample_ms = 4,
 	.count_unit_kb = 64,
-	.zone1_thres_count = 16,
+	.zone1_thres_count = 3,
 	.zone3_thres_count = 1,
 	.quirks = BWMON_HAS_GLOBAL_IRQ,
 	.regmap_fields = sdm845_cpu_bwmon_reg_fields,
@@ -849,7 +849,7 @@ static const struct icc_bwmon_data sdm845_llcc_bwmon_data = {
 static const struct icc_bwmon_data sc7280_llcc_bwmon_data = {
 	.sample_ms = 4,
 	.count_unit_kb = 64,
-	.zone1_thres_count = 16,
+	.zone1_thres_count = 3,
 	.zone3_thres_count = 1,
 	.quirks = BWMON_NEEDS_FORCE_CLEAR,
 	.regmap_fields = sdm845_llcc_bwmon_reg_fields,
-- 
2.34.1

