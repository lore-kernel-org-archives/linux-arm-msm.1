Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB97054B1DE
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 14:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876100; cv=none; b=N45h4T5Kq66hWlEHJdP5Dgwalk3wsGKghYeUpBAG0zzhbMP4NqrZa7LgnuMv4Y1tP8U37ET1+NC2ppUe/lchr/Hjo6Fke/bf9HJiBijWnn2UMGowIKwxVCeG/Kr6o9L4eftJB8I7pNgPZTMwqE+kNp0wDZwFwXh5132Xc1CIfRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876100; c=relaxed/simple;
	bh=WaKGCsUJt3uTgeCP0U3PYXnsu1NpCnTLxXsrahFqEBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ELpPg4D1fXV4i8cyugzGSYndjx232bq9JeQC/1RqYFJtS6qlzt5AWU+ymTvZtEQ0mLO/Mev4YPi4W+7R+EUz6pEUJ/TUM6iXaGYlDLcjmLv9iLeyYI76ECqYkOl/4q7Q9t4nq8vwzOGR1BIUGMmkJdAx4ajiITmM4KhjEJxz4go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OQYYxlA+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bdz6JuMr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQYYxlA+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bdz6JuMr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688CkmZu3363918
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 14:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G0PZhPYBSdYv03XNJ7TA4w+vPBHYNvgmKmM+Ke7q93c=; b=OQYYxlA+QswhWC64
	jEiCozI8CVArltvd7LGyUB5SQxshoPMVeLsU16LUEHYbc3kic9gyea35d9fw497G
	IrSs8UeRYTfDOApUykxqc7sqJViIKusGw7zlxLd83JMNcPbGWXVSOJ75xy/kYgOp
	O1h0Fn9NyxserVgdSX8YGJ9Msmr0p4UFjv5G0PHYVJo0pNuQT//16Jg9kWI6QjKa
	/veO62kmwZ1jmGDsea+cBzv4RBVXfrarCHtpsjJ8KOmlyeGl8ii7SDg/K1YE5jS3
	NF4T3EiogZQWt58e0ufi2p22PdnasNp8gTWa/NDfbZSuB/j+HToMLPmf8tAJbR+o
	ii4wgw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7hw1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 14:01:23 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-455ad408573so7373985fac.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788876082; x=1789480882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0PZhPYBSdYv03XNJ7TA4w+vPBHYNvgmKmM+Ke7q93c=;
        b=Bdz6JuMrEb7iArUqH3Min35rvQhmQJYkOdkQrxSLM1b1eP9cIcmJL71/SwpOj+cZz8
         JL6Bp606NP1m/bBYZhSXWA/N+hShTzTgKNCoAhCGQjHGVODplyTWhqPxLyR7KDeRKLnl
         9QUOiRVt8ufLtBmPgtDRmadQfVI827LZ6SYSD/kyRwum2RvBvJVfpTElmsZQPHrEzDX/
         TY7vb3QbxfGk2F6y/tMgnxmKZH9d2VW3nxnTeP9UQ8l9/WF7MZ1F7r35ccB3XwsjBR6N
         ZBmN8bx7wLD4YzTbWxQhSw0TjuYLxa98Cu6GXRv7VHXKqnvktAUe+9TqZ3X7tQ/0IZWz
         FShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876082; x=1789480882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0PZhPYBSdYv03XNJ7TA4w+vPBHYNvgmKmM+Ke7q93c=;
        b=pmFTEOMWEGAX1DRBxZE6cY3Lh2lX5PQj5GI5VXnEatmO5liT41bmy6TrAnMoxFHhJn
         5sWW50HlD1rRNw/sxv9xHA1QzrqEJ07Lzwkyxowy9vSRJpIV6BKoy9sIJG9AfDh6mDSp
         O5BXucIUfGLumrMvI+yis5O2zz+BO7s1feSYs0TO2STgeaYW/+oWYvi43vxGrnW6g0Z7
         wyOaHPh4/EKGogSCgb3KPzsS/0K5NuzlAP8HxmwRdiUPmAVuU9783rCrHkKIdJ+Jc9/U
         YKCPsHRagBBRsQ65oFEl3F9jzXoycwolv+j/5nIxNC4PGDT870u/NpNaaAWavzFK73Nn
         MXAw==
X-Gm-Message-State: AFuF++kivy8u8Grin5josSfABwt322iR0ixprdqb2P1Ll48yFYujAPdY
	YmFSehaC39M1oP7V/qjdLWCAYSN7KOR0NUSqD4u9g8RCf6PpsjaX/+TuhzK717VBXOh4Msw0t6p
	WxuForRfPzs8gb3q/Z92hfVpp3LJyBedD7ABreseNQAnhgrcg2kRdM6REI87BK62xx3fG
X-Gm-Gg: AYBFou2SsDkvkPwFsYfo6ziHOlq5nBJC+PbfyfTG0wvZFzAi8OsPdzmA7xFNd0+4P04
	xYPMe/Vw+Gh29Vrcjfx+HjUr8XOjTRrf9iCv6o9CDuAcLLWN7s3YG/dORaVdORL9QPlvl0pa2pg
	y+Vmx19sSWdJxDe2kuu+NHGm/McgTGFy+xcutO1SUnvbP25ysOGQo2xYzU9rny+DmxL2tMMDy8l
	N1KY1j4AA09WnNvJ4Kga08x1BVvnZsEHCFu3Jp+pXzC/FVm2EYWcnLFBQwWbF7KG+38HOjf9gde
	sjUIv73xGcJY1XixJtcTt7C9SThLM5oaBDVOjsV4V24B4w00b8xjSjd6+D+2TwCiD2cq6BPlSbh
	LgxwV7/QuDiljSHgusNmpciuZpC8=
X-Received: by 2002:a05:6820:c91:b0:6b1:535a:eb8 with SMTP id 006d021491bc7-6b6fa8e02aamr15676841eaf.2.1788876081191;
        Tue, 08 Sep 2026 07:01:21 -0700 (PDT)
X-Received: by 2002:a05:6820:c91:b0:6b1:535a:eb8 with SMTP id 006d021491bc7-6b6fa8e02aamr15676661eaf.2.1788876079847;
        Tue, 08 Sep 2026 07:01:19 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm57506667eec.16.2026.09.08.07.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:01:19 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 19:30:54 +0530
Subject: [PATCH v4 1/9] phy: qualcomm: qmp-combo: Add DP COM v8 header and
 fix register layout
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-glymur-phy-v3-v4-1-ff22e5150538@oss.qualcomm.com>
References: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
In-Reply-To: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788876071; l=1867;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=5KZuYwwIpuENfuIkXJlkVdcGxo+rr2inFXunMZRoIpk=;
 b=rb3Wf0GFEwzaY+juWsk5XTEMYXhYd2BthP70cxh2ZGFjXn62rWClRBT4GJ5hFPphuONUC6Q7K
 4vaXhA5qGQHCFd05D+0fasxMqX7rTrXtM9vMioW0L6xCZ5vIOnTgQYx
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6aa01533 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9hqLRW_DAkAp12WW2ZMA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX0rFevwCF8igA
 d6IOLcRJRxNYPuwkQK+tDabE4T1nVuuJElGRwDhrbDS2Rj4bgqv4UrKBIppqGrv0mAnfYQVVxFc
 lEFQPOE+62ZIhhXyLhbFWcH4GtI5cxI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX8qQWuYQ9LeO0
 LFXoqTrjs1ETb2P0VXHK4uvaOt/gS3+1H+23GfhITTBhOxSpFBKdLZH9rBUetyR8Z450k1o3mH2
 j4DwtP0j5CDLJKrS6O6f3fizPnWqUTPTGNG0SAER7neexIVVW7mroucISLdjxJOErj5CFWX4DCB
 inbRGwOldZ9UmNRJcHKt29L3Yji1NDZoCTkYZhw1fUMigUdvsO6OjuZMwoww2sTpDr2f2uG4YF/
 kjY2koJx6/iNPjhXE2rYguFYGInHOLy5pD+w+lK83BywOXgMjvfU1AIhT7r+/MNfo2vok2AeHuj
 DuXD2bdxtv0un1riBoIJbCeSKGzVXztMS9oAcy+UN0SW3YywQ2vzlOSAfRU32nFg4fyHJLFGTkZ
 JTDLBoOOtCq75bQUtbWrk5YZ4yJFDQ==
X-Proofpoint-ORIG-GUID: pyhTkitoF4-sGFXmtQY-rRuJx9O68fZM
X-Proofpoint-GUID: pyhTkitoF4-sGFXmtQY-rRuJx9O68fZM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609080151

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
index c39ced168d03..4d31637f1dce 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -51,6 +51,7 @@
 #include "phy-qcom-qmp-dp-phy-v5.h"
 #include "phy-qcom-qmp-dp-phy-v6.h"
 #include "phy-qcom-qmp-dp-phy-v8.h"
+#include "phy-qcom-qmp-qserdes-dp-com-v8.h"
 #include "phy-qcom-qmp-dp-phy-v10.h"
 
 #include "phy-qcom-qmp-usb43-pcs-v8.h"
@@ -318,8 +319,8 @@ static const unsigned int qmp_v8_n3_usb43dpphy_regs_layout[QPHY_LAYOUT_SIZE] = {
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

