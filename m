Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270DC42D740
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786441819; cv=none; b=UHHncs2YEWwOZ6B4ktJ6bxJX8a04Fed1hRtZDcBtgaSfYkxFiG+lDB/MnWMDhm6WdAMOm2IoAyMMaYm6tUnu1kJ8oRC+gDlpDmrF0DcF3PLwiuch9/QIySmaHWQ+qdSX1cEcQUSXlcBT0tZxSYF8asTcNAJt4Kku8JIqFyJd8LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786441819; c=relaxed/simple;
	bh=Pl2kUdKJ+qYOpSfTxMWy1zQLAiaqKA2y+j5AXFxthao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kaDMdSPdMAa/tuk/HuJCymNfDE8FHvcv/FA+mxhL8ucFi6fbWcovQTSJCKSoDeLDqHrIwxcO5OorOZLW5OzEKnzXwlJi9J3swqljDxQNva9xsVnQNNHWyBvzPC+4HLmkkyAZLqUkKRjSZHJ4OKxA52T7HkY0bHyjwj3FmYZlTj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OT40Z+3b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MuZ0ifAh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OT40Z+3b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MuZ0ifAh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B9Zw9c3320729
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=W29QAFLCXAWo2HXPQA3yl6dvDbG9PPbbnxu
	UkjonBlM=; b=OT40Z+3bMb9EzJc4sDC57sACN/E5HP0ULhrInLvC4ad1dA5bErK
	YpoVy5Ym4GrbaoYBx7yswvZRwxIYzOaY7FoedzHNHVugUZJ8uUGfFbrQZNy8TZ/b
	iHUXUIS1so4hwz/pyEt00pHmU4GECebf5bkhT6UOGVUyPkeCg9eUPLDMe3czihs5
	Mjsh7PUsnHYAkJC/xpCB9FwysMwsZuOVmABJiOs6hA+8SL2cTUPNDfUtqyo+BONO
	W6IfxD64Vu7bpkkEVp3J0W/b/weVJ9iWkx5mIh7QoVffgAW9siw+kSeJlUCsi9g1
	cpaePL61BjAfnH3GX4efh+zXaWP+W3lC0sw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyvcr97xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:50:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a97644aso32452921cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 02:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786441816; x=1787046616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W29QAFLCXAWo2HXPQA3yl6dvDbG9PPbbnxuUkjonBlM=;
        b=MuZ0ifAhmpk5Iv8tnxo6JyqBoaJ/EBDEnufwR1b/97n93rxKoglzYB6JMy+zY0HEqZ
         mywwx2s+tBIxFKoM2m0cmJRKMZGOs6IuygO4BXNbmr2dDFi+zIjGAm1Zc9KNFaXW0Zsq
         V72HsHK080iNF6TabvIIypfqyIy6YcjS/oyf+zQC2F+LoOlIzn+/aig9vLU95inp+e7P
         bTurpWjJd5GRNMx8sxhpH41WEIvSLLAPW+01P9twiplVfxdMp3w5+FqQeIy8TuOgqKI2
         xcHJDdejvnqsk70RR6C4PVtt0cnmSovaWfoFxiwfdN3ptzWuy7ee/h265SuIa+zP3ja/
         lqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786441816; x=1787046616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W29QAFLCXAWo2HXPQA3yl6dvDbG9PPbbnxuUkjonBlM=;
        b=egVIakwg4xq4Ij86wTdVYeylqJMifLT7QdVg3jtnB9IC5usddSyOFD4+q5U8WxYUlT
         sC0sCwTbTUrJM+dfo7RFlKMH+cXwJj9fGG1q9WfJqhxGw0NBxbsZTAHpZyr1TqbudVZK
         Gl+3XBZ0dz3NNHJY4kthHdi5alyNMXTDzPhzPggV5AVrbpQpv6klIQycaEbkSgTnfzMc
         bxVcXLp8Hs94Pa4XQ6UziitcjtQFI1SlC9bNZPir54jFsl5itM6J9Sx02GNwbR8R+Rzd
         3hLpU1w/69ldWPGaFcfKofkZ2XNewYtQ5XzeCz9zmmZmo3BTI1FVSlrF06eXqxOC233T
         oKag==
X-Forwarded-Encrypted: i=1; AHgh+Rq8KcSif1OhuSvV98yroUdIktPIRNUAHkQGVsqIQ8FUlPrSPutVV1whW0b+n/Lapi8pbUu7aE01OvJZ18iN@vger.kernel.org
X-Gm-Message-State: AOJu0YwMVlJ3QqXM4QumVPJZ1rLP2M8SsWzGMdAWC9n4gzS6UO8eRF3n
	nDt83fpacD9wBlar9IBtfTvou4pQO3mMVv2qxRI8711t3Kxcm6siGzEtSfFe56eVXl/OXQ5owRe
	pewTypWZntF2cH/Gp7Woqu8B2ChVi298wd+/+PFK7uaa6RBSXRXBHwY9koiQ1rjQHaoDb
X-Gm-Gg: AR+sD13XkD307FIzKNW9AdbCWzMmI+aNY8oVlNLBJo+BLN+lQ3Nj7cUuqiLq3xRR1Zp
	jVCrcDiMrCXZOHzMreoxorrFPtAisD6t4QhkYGpj2Y5HnKKLAbm4GObnYwStd/3Ty7eQb7uxiLg
	tuXaZpgwRmRc/cPTryw15pGL+szhJnTYVApNHX8cUwvVB7aqJ1lqFbyuRJf+ZU09oW6RUrOigoz
	Xs8MpEjiIxmFfvXfFMPuaFRFSoosf0lleRHFF6Cf14KYrJ3ah09bnhh/xqgGrBclLICUPLPIKRa
	kFnP53xWQaKKdWv8b0oD2+bnQndPhx4n5GxwCwf1qEm+my7fnagfgX53AEQas5d7m8fana71gk5
	NYZ+2UDMbCXSStyU3QDmP
X-Received: by 2002:a05:622a:4c06:b0:51c:f3:34d9 with SMTP id d75a77b69052e-52d58617feemr15048601cf.27.1786441816124;
        Tue, 11 Aug 2026 02:50:16 -0700 (PDT)
X-Received: by 2002:a05:622a:4c06:b0:51c:f3:34d9 with SMTP id d75a77b69052e-52d58617feemr15048301cf.27.1786441815626;
        Tue, 11 Aug 2026 02:50:15 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:b467:f322:cd3a:615c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977e89d68sm25843225e9.3.2026.08.11.02.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:50:14 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
X-Google-Original-From: Daniel Lezcano <daniel.lezcano@kernel.org>
To: rafael@kernel.org, daniel.lezcano@kernel.org
Cc: quic_skakitap@quicinc.com, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org (open list:QUALCOMM TSENS THERMAL DRIVER)
Subject: [PATCH] thermal/drivers/qcom/spm mbg tm: Fix missing bitfield header
Date: Tue, 11 Aug 2026 11:49:35 +0200
Message-ID: <20260811094935.2941313-1-daniel.lezcano@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4MSBTYWx0ZWRfX7SBLUMqOMujs
 AM7nTfg0OtOEpdPxN5dZskHXQkjR272u0b5OQDyvCKzSpFmX0GQ2mQ+9pT2+eJKrCkFuAUlO9OB
 P/7QWktmbOBxvwQo+1j/8TD+YMGzBVDfKiMyh/LI0WiofKi6xJcdw4D0Om9D2MAUv/nsi7lm0wW
 75QRdV84qlDPf51R2+UJ4eRDgpyKrqhzh5Gk5zEK7Ri51dodMWt5XsM5xJdBRnlX8qcLuKXQ7G6
 pWgtrx9UvoCJyCNRNnHxuiSuCRgccjIE3O7PrjU4CkFIBN8RmWaOLKK3OMxmanF/42DoYT9HUAk
 lUdmD2Sf0vkAYd2zzDtEnJop2ZhAYyazvgxEl9TyMoEL771BnKqXMqqaMGytwXownW1OeJGcJpi
 BWFe/9jMGnyPvyJ4W0g2/xiwbyqd3jcPZpzcHI6/McBT5GBBtg6xzO42wZfPW19ae/AFXy72uf0
 TF6SFa1/MxSQYuSahCg==
X-Authority-Analysis: v=2.4 cv=e/A2j6p/ c=1 sm=1 tr=0 ts=6a7af059 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=DMto2hupFwl-eosNTDkA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: WRB1J2yL2etA5XxRCDvSWLcTggfmP8os
X-Proofpoint-ORIG-GUID: WRB1J2yL2etA5XxRCDvSWLcTggfmP8os
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4MSBTYWx0ZWRfXyCSUHTSvvJ9T
 L4AoeCIrjkHBSO9HcWEeXQnl69/DXYhuOw9qc12OMY3AL33f2mXYAg2Qh8BcPrLMh0t59wPQ5G9
 bUvkJPcdvwAonlFO7WLIUY9Nx0+Xudw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110081

From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Add missing bitfield header leading to the error:

>> drivers/thermal/qcom/qcom-spmi-mbg-tm.c:184:21: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     184 |                 if (FIELD_GET(MON_FAULT_STATUS_MASK, val) == MON_FAULT_LVL1_UPR)
         |                     ^~~~~~~~~

Fixes: c3dce117333c ( "thermal/drivers/qcom: Add support for Qualcomm MBG thermal monitoring")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608080800.RfxKb9uR-lkp@intel.com/
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/qcom/qcom-spmi-mbg-tm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-mbg-tm.c b/drivers/thermal/qcom/qcom-spmi-mbg-tm.c
index fa2f10002253..0492d5eeca01 100644
--- a/drivers/thermal/qcom/qcom-spmi-mbg-tm.c
+++ b/drivers/thermal/qcom/qcom-spmi-mbg-tm.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
-
+#include <linux/bitfield.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/module.h>
-- 
2.43.0

