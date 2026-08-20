Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9B63B71CC
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 19:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787255351; cv=none; b=Cm5zp+Cv5O+7xQchkHyn7OnReHWDeBSrYzoaxC9R4WLG7/gxGiPzdHxI1QcsWVIXPsg2lfVi7dJ8X3R2shi1M3xNd0gAfW5aLYf3s1+4d4H4x+rM+oO1UFgJhqiVuiERQ5C31pb7/I5RJw8PhtM5nHDkb2s2rjlxiaRlWAbSHa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787255351; c=relaxed/simple;
	bh=Lf0DV6zqTiNRbRqg0PwFD+T9VOrPKtziLfLRHxcXw+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eZm8hk5xRY0eTDQ1Y58FoakI87OwNzAhZ2FhvLRBw4X4tB4VbOsGpCO3B/UAehtIvXj2QH/9sVuTKAQfi+mdEMTRxQ3XxFp8fWk6aAs6IfWMwBN/fS6s/CJw6RpF38KrdrKL2JuJVaJ4ytXbmuNCmbP6dytKAOuHfMHwmsRzRu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3O/WUVI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qgn2ruhi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3O/WUVI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qgn2ruhi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIIuis571524
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 19:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gbJ+FmOGmDz
	b9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=; b=C3O/WUVIys4ElKd4LJDGfaih8am
	CMM4C5GhUxPMgEVmQHnGmtChtz6W9H1+0BzjPj8WFolQKvn1EyoiTw9luB1CodGd
	cqF5E/RX5CyEyqkKEHkZLzMlQ/s+RBH+rSf+ktOBKxwTRx082kHzxg1ZiCepKQ6d
	7/mM906fhyR9D+f5ql5NNNWsnJzco4NDlUtdCA5vTAHRCElDYMhFuAo0AIPj9BBH
	GXZiTYo0qXri8xXVMWGuXtnwKKJNSruEMUhu3MFFKA57gC1CPCm7FKgdj/eOgBvP
	ihtOAjiCkF46+7wNxCxXWO/BbxnRj1Ala3KN0UBpzdFxL42NGu6Aiq+I/BA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgcb0d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 19:49:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so18244785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 12:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787255341; x=1787860141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbJ+FmOGmDzb9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=;
        b=Qgn2ruhiwsQGbmCM8cyMqtfvl59o/Gce6MkZXHj0RdAjRq/0qbZvbRQPYUqM4pYuxI
         UEOkkEAyCZ+XczWOYVr5T7aEFap7HXVcvsBbBedv3x8VaWZW3/S/f7hVqnFYtBe4LLIw
         8PgDB+OxIkwzaMtiWHWO4euvY7vx/Dledde4BSfY1sXxKQiaJQOinUlJIpv1gfThd1tg
         Ikj6ROi4mRAsJdVYK+eBCgJQC/Qv9WsIDTkGTRFbX2epRIy4Jq8ZfqFkuKWURCO1lEEn
         B/9LAzGcl6YQIfDydNUC+Qed2/9r/YxHHA0G1qbtcmDjQKtQXbrOYfrvdvgGtnNQmOE3
         zl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787255341; x=1787860141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gbJ+FmOGmDzb9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=;
        b=S/5bybte8Rg+1QiZ4ly5nfha3jioBK+lMIL++21hm9Z2RlVVcBOzPtSi87exHKmHzZ
         4jo/oKH1Gp0aGbD9+WBJK4TWYfteW5FrWhIsCWKev2jRkZx6jx/cfLDt2lA4uc9oZmkl
         tOG+OvhkSHl6BQiWyWiVVRvwaE7JdyvQL3yQwNqJDrs1fAcdbX32E5AGONBrlayamrql
         CXxTxe4PMGxeDdKvwrNGsTzs2jvJRrLBLEGpcWBluN8s6Rosfdo+lp1pCCVwqASQT/WH
         1gVvbmfhQRf6OHJeCJt5wrVxMaR/OZd3F0ysoccw0d+KFiwwWO9Gy5kch3r1pmP31jfx
         O/7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqXZf+FTqXIj00jj84gzwwvKebpUFhkJPEJXMzgnPomYup9eCYZce1dDdBn/0QWoT23NWLVf/GBSSe2dwpu@vger.kernel.org
X-Gm-Message-State: AOJu0YzFWe0cW9np6N7A6wxQRNPCJXLuCygNnWMzinMck10DhJja4xhF
	Xkty99q2X0dDQx2JhtusfMUmEeTKcfG7ZtQ9IryngkbiYmZ3KmmIO/zN2qipriKZKDMF+p5hvUj
	6EwHaxb/KdtLE2kZfN0ywHGywnWIyJYKW6rgVKG+ErTtvRkjG1T3Blkg984QC6FoKs+5d
X-Gm-Gg: AR+sD13RdY99pfVb0aGkUnA7CPSTLuYmN3se3b5kCQuwabdokFUaYryKYVjWYmNJcoc
	98TcFeVFwb06G5Qo0hkaXa9IXlIA/0LRIpLki7fwVSuQ8c5YdMZLY0TjJ1EuBDRy0tjuhlzRwGj
	ErG/G2Mu9eSQ6hoilr+xEd99xYMLuR7sMnCpqUZjS+tDSmtp4HhsTb9FP4IrTQz1sgFH22z7LE7
	FasIFWGkzao1zLeU1bpYC6txNAM79IwgcvlAXJmohwXiW1fEiHaeQjRBY/ZnNHpRDC25RztzxBo
	ca9mSYpnCh/gWto8JZ6Iwmb3+2OUB3Snroz9KWRG3TktDE/+PInZ/e+n2NMgGqFbi8RjSXdeNeK
	DhwTdLgO2TZHb
X-Received: by 2002:a05:620a:268f:b0:92b:6e09:b0d9 with SMTP id af79cd13be357-9372858eaaemr977539285a.21.1787255340210;
        Thu, 20 Aug 2026 12:49:00 -0700 (PDT)
X-Received: by 2002:a05:620a:268f:b0:92b:6e09:b0d9 with SMTP id af79cd13be357-9372858eaaemr977533285a.21.1787255339638;
        Thu, 20 Aug 2026 12:48:59 -0700 (PDT)
Received: from shalem ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459198ec5sm113433266b.34.2026.08.20.12.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:48:58 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] firmware: arm_scmi: Pre-register protocol, name tupples for IMX protocols
Date: Thu, 20 Aug 2026 21:48:50 +0200
Message-ID: <20260820194850.459739-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
References: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a875a2d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=88Q6Yv8u5fullXUEwxUA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: g03KX3D6VDZAmxsKV-bs-whi9cTTgx0d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX/T9WNqbHG/yp
 A0c5B7sUPMgf4nPfXYSo6lk/InaRmqADHqh0/SdUsWTP7iKSUCfR0nv+6D5kWYu6GON1oxt+gJ5
 G1hVIeWFziZ4n+2utgt0C7Hb22gTiAl/rZWDYc1LHqjc1r0oFuTjeiWBARphSX0n4UZhDjLMwSo
 aWlwJ2tvTOa1Av8lxq0EpKvi8RLEbPLlsxvN0pEf1tW9tGwrt0tCx6EDo7QXcICbqSy7pKiGzeW
 H7em8cVaLyIjlGfprtRNsAh5tpfzSUPz/o/D+9uHNhmd1adkRnbPUD6AIlSvBsZSEKNSE9qW+wD
 679K+3fFkAhFAtWTkgOZeuTpYAAq0VhVeMNPBvLi4lrfxOiqESy8YGEGpR5VPB1oZQEP+3GWlYC
 tmjLZmAr1m3u+pS0oSeeFRP4OvhyeawBGA3JwO0UMZwZfySjvdDJp4XTldCitatycA00xcM6JCM
 EnyOaZsel+9sYfyIK9w==
X-Proofpoint-GUID: g03KX3D6VDZAmxsKV-bs-whi9cTTgx0d
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfXwPomdO9cARj6
 i4YoRVLQjwDVVZecIDV0W/93P9N1DIjGy1lLzi+Iiz7DP+WKIqVnQHZwp4EI4qWYwmRgX2zV+RG
 8442NfgYO4Bb7yJheBYJi34vBljoFGU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200149

There are in tree drivers for various IMX vendor protocols, also
pre-register the { protocol, name } tupples for these to make module
auto-loading work for these in tree drivers.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v3:
- New patch in v3 of this patch-set
---
 drivers/firmware/arm_scmi/bus.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 111727904a89..9f5740dc606f 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/device.h>
+#include <linux/scmi_imx_protocol.h>
 
 #include "common.h"
 
@@ -580,8 +581,8 @@ static void scmi_devices_unregister(void)
 	bus_for_each_dev(&scmi_bus_type, NULL, NULL, __scmi_devices_unregister);
 }
 
-/* Standard protocols table */
 static const struct scmi_device_id scmi_std_id_table[] = {
+	/* Standard protocols */
 	{ SCMI_PROTOCOL_POWER, "genpd" },
 	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
 	{ SCMI_PROTOCOL_PERF, "perf" },
@@ -594,6 +595,12 @@ static const struct scmi_device_id scmi_std_id_table[] = {
 	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
 	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
 	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	/* Vendor protocols with in tree drivers */
+	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-key" },
+	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-rtc" },
+	{ SCMI_PROTOCOL_IMX_CPU, "imx-cpu" },
+	{ SCMI_PROTOCOL_IMX_LMM, "imx-lmm" },
+	{ SCMI_PROTOCOL_IMX_MISC, "imx-misc-ctrl" },
 	{ },
 };
 
-- 
2.55.0

