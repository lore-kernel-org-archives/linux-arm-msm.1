Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868DB4A5EAE
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 09:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847302; cv=none; b=H/a3SrZyI5qOqA6bGL7LahqNiWWT/W3pCAkdBvib1i1mKAYWf+SGY0MdDCsFqnY8HqXCh47bi8xx0PG+bUYG5tNS9L1WpErWWgrIgrDMo9mrDITjlM7bLHQaUGceD89HCdCXJc0AhouF94n+21IJ0HeFZ4HkIFda3tK1lFR1EV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847302; c=relaxed/simple;
	bh=iNQmIDSXrGmGjsA9bytKf88+1+ZWCFHSPuqkOaKNV9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PCaAtR9IqWceVrDOtWWlAJJWWcCudwmwPvV7IN9UxyQ3jcMu+dZfU1FXh2R1GK8i30IFWSNmGnc8PkIr9aeSdv9sM6bN+8k+hXp+dfS9+C5EkUE57C11TG8cbUlEcaME4pOktwB53fZ7+SRNfTz383t7zF9kU6GBA82CdwKABgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lC5XEbHz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJMXhb7b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lC5XEbHz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJMXhb7b"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xaEo962446
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 09:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oHswaontdYeO7fcj4kXO4OIe9Mx/XFEmINXWY4ZCI/Y=; b=lC5XEbHzY42AbICf
	ibzMuruSjtwirzW5BACnlTGJUv7KerTgNu2YkTLVXaYjkWfrzAEkx1u0BccLJNZF
	H63bA7goqq96dXQACEwHW1kq53UjyO8tbtWmYg/OX4QDPWZURw8956E8t7ss5sUe
	W0TEHOrvpj0Ii5h/gwBdK+BAxi3HLTJVgK0YPA8n3QaoUow9xg3tkZWzlZTLD7B8
	LdAP2iJjeu2EhtCVNCPk++y6AU2zbiG4vJKpwp7gxqIjsg2MZ+sQWmxbWPIDi/Wf
	IKUk6WQbL3DSr4KyKRzB+XDj+sszfLS/c377LYHKQQgDbZ//oj/F1AkMUbzLIeHz
	bxeN6g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wcuc9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 09:35:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc435388657so7615835a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 02:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790847299; x=1791452099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHswaontdYeO7fcj4kXO4OIe9Mx/XFEmINXWY4ZCI/Y=;
        b=jJMXhb7bkbTJirtwRPKZH1Rhu3ldO90uRqrbhAI23+j1DryF+D3a+poYucOgjpm08l
         Lna+7qLmDMdwBdm639YlmmKvxjfbHnqH8VUMfQM2XBKj4JdZmizx+XHBHT68R1cJh22t
         IVy7rjWJrNYnzUfXHypxUs5BftuIk4NKEaCpuy6PKIaBBaFpHDd1QYb1dvjxdAf6uSUm
         LvjgZ0nAslPkOc2S2JCf2hUCPg6IwD5S3mUwa4E6Ve47muJmXLsJe6wlZZvgavi0KLfq
         kOzd0e/Md0iUFIUsZT/HRxK6yWNUcuOxfBZ+k384A3+uQND9e0mm+Y8EvuZADtOJYfLD
         swZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847299; x=1791452099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHswaontdYeO7fcj4kXO4OIe9Mx/XFEmINXWY4ZCI/Y=;
        b=cEL4Ulv5tVveO5da74CtVgmjHJ2ITskyWvI68/amJh2wrIKz7MXrpsLsXbKqSezbqK
         Xlu2rTwJmbMiwXZ9QMmJjl6NrGhpOmlkP3qkkXDI48ZV2o+q7MjQBjvzEGJ+kWUliwOd
         GUvr2Zy6PecyqSMasyycwtlAukIi6FVvRlZ5UprymjjgVwW/YuzVDbmRhf6f0w3BK4/J
         vIsYIKmx53abKDbNCcJokPbQ1bgTkWt6tjwDzMcd6hgSTsZjL9onjrtde+d/nGzcz12e
         ANFgHi0FDfVa5l6xuxgpYBMiHh5QYTfnyrR2jwOmTK3ChOjZuoFuYWXfqEHb4o4lGviX
         xDBQ==
X-Gm-Message-State: AFuF++nYpBF5zk8SbIWdFagygmbMMHCHcvgeJ+7ufW4A5qv+eMWkIGlq
	iE6nAldrKNCpcMZRqWa+LAiO0b3AoQDBjQq0I+WJnP14b7bfNlkCa3QJPvtvN5VsiNppU/2CIBk
	3Z1HyYs1gRJdDwflCLz1I+IM/1L7WpE80YzchmUU4YQaE67FvmpTHAgskAoxuo/34vURV
X-Gm-Gg: AYBFou3hVZ6G/Q1/kDy2Qiy5ycGCHexDZPW+0nFPeevJmolSy1e4E+Ct/NWjefDwFI0
	vVelvfZnH11kmGRhuDUhBQHGmw68PYugmLF9nuP85B5rH1hZ2+CIyw5Czr8yWUA4SRNb9nho4t3
	EVu1/UEOVkg/hOPGNZQ47GPB0rN+4Q6urhNAYHvWdbn5aYiASXURR+Tmv7xh9sglmuGzmdTUiCO
	EFJ55Idq8WQgbBZ1Q1dTluahh/YBRIaMVqf7cr0HWec7GUztPAwss9a8Gsv4spi1bnSCaN5a03S
	I55I+ey0LuxVrPzD8GYS57p/UTa+9hSDI7uD+ATyF22qasIyQfuFF2d0VQob/XNk/cp6NmBbRcF
	QK7sqz7sqvyBjhDeNH4rR/IreWwU=
X-Received: by 2002:a05:6a20:7344:b0:3dd:a196:69e5 with SMTP id adf61e73a8af0-3de9eb9ea11mr4146133637.64.1790847298893;
        Thu, 01 Oct 2026 02:34:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:7344:b0:3dd:a196:69e5 with SMTP id adf61e73a8af0-3de9eb9ea11mr4146111637.64.1790847298474;
        Thu, 01 Oct 2026 02:34:58 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e54bf4c4sm1152944a12.29.2026.10.01.02.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:34:57 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 15:04:18 +0530
Subject: [PATCH v5 01/11] phy: qualcomm: qmp-combo: Add DP COM v8 header
 and fix register layout
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-glymur-phy-v3-v5-1-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790847286; l=1867;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=M7Lao+vpZOpv7xNTelINIOIvTJLnHMEbQggsfN+FZ3U=;
 b=sSbtSC6NXVX78DMd4G1wswJcht/bTE3sbHDWz0i4/gKgIdDVkK3G65nMEzqUxaFmXRImUiJgw
 ZAzyqVpg5TzB86xj5ki5LME7NvSa06NesRbwKfq3ejpymQM0AU+o4ib
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX6Ctzt4vpk/Qv
 dekftM7vXM0Xa5khE+b8lij5LHNlHzRolek1Kc65k+c3ABkFm/0iMT/3YWB0UHg7AHReO/HTtwe
 u9tV7IcFk3OdJOBIqG1eOs/YHd4z7uLL7VzEf/tKjCbtu7k+AFj9nuizTym+uHvy1aVbl1/mjPT
 ZVt9zVer0UvKiBym1xToLirF6f5KpWCD2v3Ofmw6ttTJN6dytq41aWnIZdooYm7CC8jpOk5nF4+
 XucPfe7vqe23+lItAXdbod5JlL53CVzYeznojz8zkXJ3HM7lQs7Z8PvXlNzUk0gZMqvWyCAfINT
 /Mfs18o3ejnG44LVRQm6maf+N7rj26L6BgCmN5AT+kJRdw81vojqZoiUmsoBMfepGDcyAJwUbbC
 mS/NZJ0/sSzwm7fsVrUunk73ofjKE+NxLZvqzxemuzSA8e9UyKgLvm0lgu4JYsw1mWV3YTXVON0
 5fM+Hv+NsdI4L8OLVHQ==
X-Proofpoint-GUID: M6jvb9v_eG8WdwpYbL1TQvAysJsU_grD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX4JbHl9rRH55w
 q8eF1n+kMJH6/vbPEhgNxEHB6Za/UOFOnCcK7ngJpHOYkwR2FD7Cl9qbhaLfV+5PlzE8785HZ1t
 PVkkn//pj7in+q6PARRam29K9qmiAbA=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abe2944 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9hqLRW_DAkAp12WW2ZMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: M6jvb9v_eG8WdwpYbL1TQvAysJsU_grD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010038

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add the new DP-specific QSERDES COM v8 header file and update the
register layout to use DP-specific status register offsets for
C_READY_STATUS and CMN_STATUS registers.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Fixes: 5b289913959b ("phy: qualcomm: qmp-combo: Update QMP PHY with Glymur settings")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index a4f130fc33e3..dc9c30737ac9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -52,6 +52,7 @@
 #include "phy-qcom-qmp-dp-phy-v5.h"
 #include "phy-qcom-qmp-dp-phy-v6.h"
 #include "phy-qcom-qmp-dp-phy-v8.h"
+#include "phy-qcom-qmp-qserdes-dp-com-v8.h"
 #include "phy-qcom-qmp-dp-phy-v10.h"
 
 #include "phy-qcom-qmp-usb43-pcs-v8.h"
@@ -326,8 +327,8 @@ static const unsigned int qmp_v8_n3_usb43dpphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_DP_AON_TOGGLE_ENABLE]		= QPHY_V8_PCS_AON_DP_AON_TOGGLE_ENABLE,
 
 	[QPHY_COM_RESETSM_CNTRL]		= QSERDES_V8_COM_RESETSM_CNTRL,
-	[QPHY_COM_C_READY_STATUS]		= QSERDES_V8_COM_C_READY_STATUS,
-	[QPHY_COM_CMN_STATUS]			= QSERDES_V8_COM_CMN_STATUS,
+	[QPHY_COM_C_READY_STATUS]		= DP_QSERDES_V8_COM_C_READY_STATUS,
+	[QPHY_COM_CMN_STATUS]			= DP_QSERDES_V8_COM_CMN_STATUS,
 	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN,
 
 	[QPHY_DP_PHY_STATUS]			= QSERDES_V8_DP_PHY_STATUS,

-- 
2.34.1

