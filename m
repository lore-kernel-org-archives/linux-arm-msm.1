Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FEE3093A6
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 01:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790817401; cv=none; b=BQWvc7DQcozo1+EoWxpQWfPt9XJEfDH8A62m0iD0rnpduoWg2KRpBGqodQtsHK9d5FTOuyYieuJ1YvW5qbigrhtF+pXUTxFRJKjNp4E00IqYCrwNayIaFgnlb0AE2vempcYEYdIcb4ceNEI89vrZWyYcDG0ok59J8Z7E6n9HNX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790817401; c=relaxed/simple;
	bh=tjcWt2seiedt957fPkP3qjPCH/MwWJfOxFdhOfaqiNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NwF30TITYs9HWjASGXGPDUm0SfwB3eHZX6hh9YEwXEoQOYnyNjG11tNQMYwSUpyoRHgptJxvuaI+n9/hWRE4OQgAfi+z/WI/DhZMV8qYYgBcsVfxEhJABVhPvgorzcqJR3OwXJ10JFKxiYowKKhOyj1cEuGbOKnDrhG7riU3ZS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c9G1vDL0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmRZHJOx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c9G1vDL0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmRZHJOx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910jVSh271257
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 01:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8LTwY7IbNj9bE+34TwGiIF
	xUUUMboXxjX5o58rh98Fg=; b=c9G1vDL003HrgYM8gEmL6SUiRKFm2A714lEBNV
	OJEDmdFIlPkZL2Zv0JJDX7imO17aDtQexMn2dCSsC8OFpDZ5BRM4tkD0XpGBSReN
	s/Ba5fu3GV2JQeOazEZUvRvO+nivSgvsbu/Scn478LwbN9q+2ZKzI73JQpgO9GqE
	NqW5hsyJxKNkbPbBIsK17yBO0yjhWnLoYYKynfe25drtd0oVP1qLhMFg+3l3iGrH
	zI5mmOKGBt4EYa1ZjsMjIg+OYncJW3Hcr8iWPfUuINlJssA0MFJCEtdqJeZv6Gtg
	RKJwCefomM2J6CiYq+uA9vKgST+YMkXayORlc5D5BtzVfmjQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvscq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 01:16:36 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1384427c3efso9010110c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790817396; x=1791422196; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8LTwY7IbNj9bE+34TwGiIFxUUUMboXxjX5o58rh98Fg=;
        b=gmRZHJOxDG3/iPYaddzeyzSpDhYT0RPvsb99Ov507i9xD66YBqRmEC5wOQCxRAiBS2
         fccLLGP5Y0vFiiqDmMJUJn+vNwyyW1wBGMNfDxkwa7T8BQgaMqi1WHyaksE/W6cmBADM
         J90Zw8N2SOBhmrFH0mtkcyMYBap2p+ULTZC0zQEv7RR9hnrKixbgkMZLgKpEgqjfKc6x
         +N9ctJPuIEevarUF125PClJRvzjbHqa16y7g4va767xxFtUZhxfNFiTBnOJb8m0Uc5tx
         iKgXPMfkPZvTldnXfMY77ADe2dNE85noxs58X9w3oohrCwicrka8A0I9ctQGorXS2ldO
         WDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790817396; x=1791422196;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8LTwY7IbNj9bE+34TwGiIFxUUUMboXxjX5o58rh98Fg=;
        b=Ql/CZpUBj1uJpYqcMMco2BWC1gvqB+/VRI2d01oaPz53qeTS29wgWrcT75ACtAStNE
         bQUo7gwiI38YIzoJyX/FrV+IJJxCrvFyGaPZCJafIAEIHIqYrJCRv8uXSTlYPnAmnZ2y
         63gg3z/CsXT7YgNpdC4qRrHjmpG+GCcIUEWjxg4C4Qw4anT/AXiFvM4+Px6ctu0o3pFD
         RcRS3VpoIKpCtkTFF3/mwuAMTyooISMVu3hqUAtYCynovBtHg8NIPpdPoDbhlbs/gk3I
         efFtx6kWxSloEMkS/9QyiOL0xjKPpZlDhULaIQE77fIV+xD9UchIgozNXW9DhKDyTSn7
         Vpew==
X-Gm-Message-State: AFuF++mQzCJseLkaZcGfF06GADuEa42qqsdgU1UySpvgDaSRkL1anZtp
	YS0UqsaXR7F4YiHscko3ZkS6g0IBT/as2mNOLRmbkXZjrJmdjQ9Ae2Jjo/qsezDbQx541P/kXZk
	DqQ0I41ACmcmqGu9LZad16XQOHer1DV5rF2bQjwn7kZDAqjDwE399Gz6aoqgBQlwN6qfnTi+46Y
	Yf
X-Gm-Gg: AYBFou30ThiKLvQoBH2v3m16jEJnLSak0iJlMQGM48cobeKnUczmVChq+RUX20PYCgN
	jY1AYsdbDf6Gu1/DYGRIJx2Efod4iZ9RO0x1hE5UAL+GzoZlBux00O1f/0kd1mLyEph446a094a
	zgu3oqz6ji7bQjl29iAe46ar2xgESDPXsogJ/KAoQgwJVeTAofzENLsHNlgggbX1lw2BXeh5xYr
	0OHg06wNnDo+1q/niSqEW+CYoEGcCRIY3oSBIbevbA17sh+TX6bLo9NfFTujTwG9NFZibePfgDR
	siSb4/vvKtw09BxzT1pQLpBTSlow88LuieoJfoF/yb5lIgqpXmTGK00YdrgsZ4GKKP/MIv4l3As
	1WgR9ExXklb/CgByeVdYEhOYtLfKXANjVk8evaQ4uRYFy+JvGbWau
X-Received: by 2002:a05:7022:3a89:b0:14d:b813:852d with SMTP id a92af1059eb24-14db822c86emr1313980c88.6.1790817395583;
        Wed, 30 Sep 2026 18:16:35 -0700 (PDT)
X-Received: by 2002:a05:7022:3a89:b0:14d:b813:852d with SMTP id a92af1059eb24-14db822c86emr1313954c88.6.1790817394799;
        Wed, 30 Sep 2026 18:16:34 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3750765sm2190286eec.12.2026.09.30.18.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 18:16:34 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 18:16:31 -0700
Subject: [PATCH] phy: qualcomm: qmp-combo: Differentiate clocks related to
 the USB block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-qmp_phy_usb_clks_v1-v1-1-d4dccc9eb263@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG60vWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS2MD3cLcgviCjMr40uKk+OSc7OL4MkNdI9MkS2NzEwMLsyQjJaDOgqL
 UtMwKsKnRsRB+cWlSVmpyCcgopdpaADC08D53AAAA
X-Change-ID: 20260930-qmp_phy_usb_clks_v1-25b9374086b2
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, jason.pettit@oss.qualcomm.com,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 4vatC8ODyiJJldeHuP_LyIMh-_IgqWQX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwNCBTYWx0ZWRfX21JAWhIm//SP
 jq0wlbmWhZNIZKRfEvYlv6wRxSxVP5M7Fv0ViZBPVkQ4UMiz1rkAs9BQQFmXGwwb4Qpgk3DiKpM
 2+4GhbPSB4uCSd9DZpruad7UN7saxmmrFTQKs/IdB56TChKR2dwhLz1pR0Y7kF35Qeb1M5L7jA/
 q6GjKmxvm0pBGCOlZDijsrNBcxae53KNIVC2oFISi+5A0f4U4FzG2U9TXJHHQrLpmEgqxxk/5l6
 76tDB4gxQMgwOYUuvHsjXtFnp5ha5/Ooo7LDQe7rKHRhlK5Fmaro072gybzAF2VMWOecaGFVwG4
 yODQ5KZclq7E4BPivrYw/plnTYiulNzeh/0eq8ITjNW1h198jI14ZsVJ0eJ/gRXIQGrarzQGDSk
 s+otpkPe72ZGfilIfL1lsreNRkGiQOOx+TOlOL1P5bO3SFagleGH1BfpVu3+eK/8azx683iw31j
 jECj43DsInkphtVg3mQ==
X-Proofpoint-GUID: 4vatC8ODyiJJldeHuP_LyIMh-_IgqWQX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwNCBTYWx0ZWRfXw+5O1FIIAz9J
 rjMVNx58Xwx2+iC6JIifli61kFc9CMI0nAqvwCfqVGgqjCYdCxQE+E5A3SbWG9WfkywtT7zXCwC
 Zyab+ZdQh4/Z+4VG6rfOSgKPovTeAnc=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abdb474 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KCRQXf5DRPPkNQcuQH4A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010004

The Qualcomm QMP combo PHY has a USB and Displayport block that is
sourced with different clocks.  In situations where the USB path is not
utilized, and only Displayport is active, unnecessary clocks are enabled
and not used.  Split the current clock list into USB specific clocks,
which will be enabled whenever the USB initialization routine is
executed.

In addition, move autonomous mode control specifically when USB is
active, as its primary purpose is to detect RX detection and LFPS
signals, which occurs only when USB is active.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 56 ++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index a4f130fc33e3..f14fb8ef9028 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2607,6 +2607,8 @@ struct qmp_combo {
 	struct clk_bulk_data *clks;
 	struct clk *p2rr2p_pipe_clk;
 	int num_clks;
+	struct clk_bulk_data *usb_clks;
+	int num_usb_clks;
 	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
@@ -2678,7 +2680,11 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
 
 /* list of clocks required by phy */
 static const char * const qmp_combo_phy_clk_l[] = {
-	"aux", "cfg_ahb", "ref", "com_aux",
+	"cfg_ahb", "ref",
+};
+
+static const char * const qmp_combo_usb_phy_clk_l[] = {
+	"aux", "com_aux",
 };
 
 /* list of resets */
@@ -4403,13 +4409,20 @@ static int qmp_combo_usb_init(struct phy *phy)
 		return 0;
 	}
 
-	ret = qmp_combo_com_init(qmp, false);
+	ret = clk_bulk_prepare_enable(qmp->num_usb_clks, qmp->usb_clks);
 	if (ret)
 		return ret;
 
+	ret = qmp_combo_com_init(qmp, false);
+	if (ret) {
+		clk_bulk_disable_unprepare(qmp->num_usb_clks, qmp->usb_clks);
+		return ret;
+	}
+
 	ret = qmp_combo_usb_power_on(phy);
 	if (ret) {
 		qmp_combo_com_exit(qmp, false);
+		clk_bulk_disable_unprepare(qmp->num_usb_clks, qmp->usb_clks);
 		return ret;
 	}
 
@@ -4440,6 +4453,8 @@ static int qmp_combo_usb_exit(struct phy *phy)
 	if (ret)
 		return ret;
 
+	clk_bulk_disable_unprepare(qmp->num_usb_clks, qmp->usb_clks);
+
 	qmp->usb_init_count--;
 
 	return 0;
@@ -4670,7 +4685,10 @@ static int __maybe_unused qmp_combo_runtime_suspend(struct device *dev)
 		return 0;
 	}
 
-	qmp_combo_enable_autonomous_mode(qmp);
+	if (qmp->usb_init_count) {
+		qmp_combo_enable_autonomous_mode(qmp);
+		clk_bulk_disable_unprepare(qmp->num_usb_clks, qmp->usb_clks);
+	}
 
 	clk_disable_unprepare(qmp->pipe_clk);
 	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
@@ -4701,7 +4719,12 @@ static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	qmp_combo_disable_autonomous_mode(qmp);
+	if (qmp->usb_init_count) {
+		ret = clk_bulk_prepare_enable(qmp->num_usb_clks, qmp->usb_clks);
+		if (ret)
+			return ret;
+		qmp_combo_disable_autonomous_mode(qmp);
+	}
 
 	return 0;
 }
@@ -4736,19 +4759,34 @@ static int qmp_combo_reset_init(struct qmp_combo *qmp)
 static int qmp_combo_clk_init(struct qmp_combo *qmp)
 {
 	struct device *dev = qmp->dev;
-	int num = ARRAY_SIZE(qmp_combo_phy_clk_l);
+	int num_clks = ARRAY_SIZE(qmp_combo_phy_clk_l);
+	int num_usb_clks = ARRAY_SIZE(qmp_combo_usb_phy_clk_l);
 	int i;
+	int ret;
 
-	qmp->clks = devm_kcalloc(dev, num, sizeof(*qmp->clks), GFP_KERNEL);
+	qmp->clks = devm_kcalloc(dev, num_clks, sizeof(*qmp->clks), GFP_KERNEL);
 	if (!qmp->clks)
 		return -ENOMEM;
 
-	for (i = 0; i < num; i++)
+	for (i = 0; i < num_clks; i++)
 		qmp->clks[i].id = qmp_combo_phy_clk_l[i];
 
-	qmp->num_clks = num;
+	qmp->num_clks = num_clks;
+
+	qmp->usb_clks = devm_kcalloc(dev, num_usb_clks, sizeof(*qmp->usb_clks), GFP_KERNEL);
+	if (!qmp->usb_clks)
+		return -ENOMEM;
+
+	for (i = 0; i < num_usb_clks; i++)
+		qmp->usb_clks[i].id = qmp_combo_usb_phy_clk_l[i];
+
+	qmp->num_usb_clks = num_usb_clks;
+
+	ret = devm_clk_bulk_get_optional(dev, num_clks, qmp->clks);
+	if (ret)
+		return ret;
 
-	return devm_clk_bulk_get_optional(dev, num, qmp->clks);
+	return devm_clk_bulk_get_optional(dev, num_usb_clks, qmp->usb_clks);
 }
 
 static void phy_clk_release_provider(void *res)

---
base-commit: c7f2322431cb6d108b18fb4154606b49e2bc50f7
change-id: 20260930-qmp_phy_usb_clks_v1-25b9374086b2

Best regards,
--  
Wesley Cheng <wesley.cheng@oss.qualcomm.com>

