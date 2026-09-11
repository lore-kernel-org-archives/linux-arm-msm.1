Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFF44766A5
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141184; cv=none; b=h1As7aqu08S/WbR9AeneD2E8SGT/6V/+0qtLS50ONNGqA/xy8d/P3vky5ej2GywjCwUoAXVUj06Cp/xiNtQxtpeJfmAlwqrNTZ6SZWC+zpSUCMwX3KLTn+jKJ9zMlTunumK+iMfkvEPyJrzxJGT/1SjYikXJfaPWpNIVTBeVL4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141184; c=relaxed/simple;
	bh=RyzijeQOzFCR4BUqwVap4hBjD3WwtYW4cP4P/BfFqns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oijwxmGujz02dGDLvSC0ti7jIkeu09W8eb1MBDKzPCKuLaDYimVWBc+ccFWJVr5xlOd9yrc6AQlNlhnVoanuMqB8X4tgFMCLzSdUoRfw/HgUOjFGnnsXba10I0SgZ5jT6OVWB2A+yN6emY2fTek4PToTK0OHTojZujD8rkiUOGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KUfMlGKD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/9gHzvo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KUfMlGKD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/9gHzvo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmFeA3780696
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TYKeXTa8aTR0bTBB6X/4VXQLUl7NXF2imUYHRSL6L6Y=; b=KUfMlGKDCYJUkNK9
	krs5AoW76Ydwk168/8HaKacxnVBbJwBkxOnwJbZLFnOqGLRigS/emZ85a9bHCdMj
	k0fuvdHDWf2T6JDb67KoF58rpj/dm9q6rsGX9WwcRmSUeBJ5mPvFFmGfFcwq/Z5l
	lNCitP0sZucMOzBzOlZyeIkbHK4iedThKhW8Dcb03G6n15biYDgVnDX6ZV5fRpPp
	e2mY8MowwTmW4yjJ5XX+yMUt/xDMX95c7YtmnigDMUn8uciuinlr1AOpzYsWrmkj
	4Bw5MaZ75BX+keYvX83+ZcKSyaWrVJGd8QTRLrVrtkF2IaZ4/o7cqW/RGqFeVNvq
	DFWZ8g==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfj7yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:39:37 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-455cf15f8b5so1717126fac.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141177; x=1789745977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYKeXTa8aTR0bTBB6X/4VXQLUl7NXF2imUYHRSL6L6Y=;
        b=V/9gHzvoTqgRVZ0RP8K+tdgUWwSfcnfjHLLEjL70HGWYW9dmUzDbtY4HsNslxOYfkH
         6qWuGk2rS7kaoSr6ysMHsJ7EFvay10Pyi44takVdHnBUtq50qBDjuwAcvnD7WHZxYQxb
         mEUdWSUuHtgB1wYQzmS28pfhtzLveCNcxZl4/J4Yb50KvbJ3L4wZHmhMiwcbNCAC22w1
         l2/8pXJ7H1TywS0pHz3R5QG/oDGPEzlMu/rHbwnDg1+MW134V2gpkFq3hFMIgseXNLbG
         NS4BS9MtW61nw/cv8p/WlojoMqEy8DQrQEB+7gWeDaepYjfC3iilNWgeU0Qwc0iyxxYz
         4BEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141177; x=1789745977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TYKeXTa8aTR0bTBB6X/4VXQLUl7NXF2imUYHRSL6L6Y=;
        b=UsP+ZtU9Ll9+DI9sb3EIMBO9NpmvMDyJdrCD80680UhH+1l4SoL60m4i34AZ3Dpx7m
         X0Lg0+GFMX98qL6G/N/c4R4yhuusrUseYHV6yc4zVemLvApDAikZngntv8a+wfgOG/iN
         yXk2r/owflbtnbKhzFLrIyj0+mZ8nJanPC8A2fmvBISKtY549/Ybr1r3sfOittJSaOwM
         oatSZ1uNjBAQYpZxGMMzUOJr+BtYBGTlAdfTz/jY0H7qf32Z1gLm7IpI96/jh6QgenI4
         oDPj1Ph9deJhUU51n/cHbpvvNmrVe32gm7Rqd1OByNiO9x1jbDNO/+whWesnCkSw/fTC
         hxRQ==
X-Gm-Message-State: AFuF++nGZZzwuZ2MfnX1WELqwWUdTe/MEAha8wqt15WNwp0DD2OjexPB
	B9Bfo7n6HhE+gl+ZQvTvYsjDkFLvhPHdurFW3xxc++0d8Y1mXBHWCBS1d8vCaezCVO6waafD5cU
	n7vvbCG4KCoqV4TN7rqsNYJycYj7vgucIJSxMqiDSLskd2poxmlSeFrhWGOqt5XCuULX+
X-Gm-Gg: AYBFou0iABCtiFa6U73yKRbU55vcfde59diOGskopv8jtE7E6HHyfKJ+v3VchJAszzt
	uVlnL+9gtOM2SiEdIhbIMQBatsrNh3vZDF3Wmua7cuS+TQMSe6ZuUQ/qSSYshNMZQd9yvWFLFVl
	8czuHWtZ8RhV2pg04H7AyANY1Co9v7HEszFTxM+3trpRv0PecTzmch6Bh9bBIdUh+EXOJRPtxDI
	PLRhbW9n5T6bywm7qrMRP4w3Rh7M+Lk4vGIndCVE1K49ALVuocXjEJo4V7YjOQVdEqfUa8w70hp
	AIsxX/CC93qw4m0rtCZIE+eBGDtNJxZXJnoM5zsaM+WWofS7vPX7IbBQUw8r+6UeuiIN1R6rMWb
	pAcCH2TnpVDp2a4FcFKUDugfWsAQ=
X-Received: by 2002:a05:6870:180b:b0:42f:f3b2:e2c9 with SMTP id 586e51a60fabf-47dcdbbb17emr2893696fac.0.1789141177112;
        Fri, 11 Sep 2026 08:39:37 -0700 (PDT)
X-Received: by 2002:a05:6870:180b:b0:42f:f3b2:e2c9 with SMTP id 586e51a60fabf-47dcdbbb17emr2893597fac.0.1789141174947;
        Fri, 11 Sep 2026 08:39:34 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:39:34 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:47 +0530
Subject: [PATCH 16/17] phy: qcom: edp: Introduce Nord phy_ver_ops and
 phy_cfg descriptor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-16-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=1972;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=94rmdeySxa5fJHfAGld0di57h9zUDb4Ov4YG7k/0YKI=;
 b=6FCW2hLlHDUGqMX0JBT6HvN4i3iC42y74fuKbeKZlV000G80lciwX8BRZBP8TXys2iqxrET60
 2aPAk+8qpgFBX7hOiipgM7AllTxJBIHmy2S9y05wfDnVnAl+d3FZOnR
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX3VAqLz6AXZTg
 pNr/7kTcIlTRsv5fQV582eSqWVR89L/gHjZTOZp17G5/WM/eVMmt1ZjO/suItrJTo+gCoe3/eu0
 PbO3lqj7Nck6zic8s+NJcNErBVXDybyXtiVHs4d/pLjLXapnMt5y4NDPkI7eSfKd6pSrFQK6tEt
 2e0t1xkiCkdjSgYoNkjqNg+2NUKcqUUTFc/WdkKRP9gqU5Z7L5YpPSDOpLZt3Rza5L9DCkVkgDk
 6A+OLbn368Y9SFOwHa1UkaWwFoKntjBUqxb5z7qnSNHOjh0hmeBa3FcF4YM6uktyZdWqrQovbV5
 TpIVGQxKsrRSFOgkZxhN1aBsLuNi8ATL7JfF6AjReasVb+gvnktrQxn/HKiXGAT2U2lLSghnVsP
 apJZOEvcL1YM/kfg+CGmHHLRTN8iUnU5LVMbeS+dKWi9Is10B7bUj7CloaG5bZYAdMwbhnFXCm9
 8a/a13XpsCM1rWmn7Uw==
X-Proofpoint-GUID: 6b0EuSnq5Yev-KD7uRPsj8iuxEb96PzY
X-Proofpoint-ORIG-GUID: 6b0EuSnq5Yev-KD7uRPsj8iuxEb96PzY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfXwrdNp9UD8Nyd
 yjNzwzBYPAAcElsDx8bXACe9zpZgIXJqv4JjScTf1BKcFgHPXUxmnZdcAuU/mcebVsTlQahfB5l
 tHqnfaEJLu68vbQEAUq/EGhLxrrd2TY=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa420b9 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=hnKCH8YYcLMkF2FFhooA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add qcom_edp_phy_ops_nord wiring all eight Nord-specific callbacks and
nord_edp_phy_cfg collecting the Nord AUX, VCO divider, swing/pre-emphasis
tables and ver_ops, with phy_status_reg overridden to DP_PHY_STATUS_NORD
(0x0110) and bias1_en_2lane set to 0x03 for correct 2-lane operation.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 361f4e467351..338f28cb404f 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1847,6 +1847,29 @@ static int qcom_edp_phy_tx_res_cfg_nord(const struct qcom_edp *edp)
 }
 
 
+static const struct phy_ver_ops qcom_edp_phy_ops_nord = {
+	.com_power_on		= qcom_edp_phy_power_on_nord,
+	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_nord,
+	.com_bias_en_clkbuflr	= qcom_edp_com_bias_en_clkbuflr_nord,
+	.com_configure_pll	= qcom_edp_com_configure_pll_nord,
+	.com_configure_ssc	= qcom_edp_com_configure_ssc_nord,
+	.com_ldo_config		= qcom_edp_ldo_config_nord,
+	.phy_tx_lane_cfg	= qcom_edp_phy_tx_lane_cfg_nord,
+	.phy_tx_res_cfg		= qcom_edp_phy_tx_res_cfg_nord,
+};
+
+static const struct qcom_edp_phy_cfg nord_edp_phy_cfg = {
+	.is_edp			= false,
+	.aux_cfg		= edp_phy_aux_cfg_nord,
+	.vco_div_cfg		= edp_phy_vco_div_cfg_nord,
+	.dp_swing_pre_emph_cfg	= &nord_dp_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg	= &nord_edp_swing_pre_emph_cfg,
+	.ver_ops		= &qcom_edp_phy_ops_nord,
+	.phy_status_reg		= DP_PHY_STATUS_NORD,
+	.bias1_en_2lane		= 0x03,
+};
+
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },

-- 
2.34.1

