Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742075;
	b=FVxWZ3m80AMWmi0Lc0vdq+ce27lhdL8Eu9Qn7Vrrlc0zi6DCq+lxxMJIuFKTgDapQy5z
	 nJIw2TGZyMK+SY7HQrcQj0YhDru87cvOMg0Zmz8krFf1yotPIXTGnyGQveNOvZw6qiEQK
	 16KLOsP+zwzsu6ZNSLKOtDIur5iYiVQGj3Zz/ojP7ELxGojyXQ46RZNIvkk5jvz5vSgAr
	 tpC2bUB+XK80JjRryw+tpuFBy8GZE+o8cz7FBRfXlnE/OGo44ZnlqnxhQKTsKrK88dM1K
	 6dZPUMDAZFaOHAHGjGV3M0JzVxRKjm/Bpd91AtwISU0h0ZOOJ82J04w7F297DSAD8Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742075;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2Fa0kR+cjmFW5Y7hXPxRKQn44qIXe2+RhTOmwcbjOD0=;
	b=M4e73hPtgsamq/wjvxJcNfwtPBhGHoNOIps8XQQQRp02unCDqfNhhxnlzKjkuz0OpOP5
	 QRd9SwdG+XnmNAc/tCSQPDkmoDPQfh/KBC6QklrDkMcJiOIWvjFXANX65rpZ06pknUepB
	 TEauM/exX7x1DA1xAhzGD4nVsOsraNQwcS9WCHZwPULKLe/tsK8ZV4eqQDW10LLKQrZr3
	 o7dRWb9LLAvDAnikIC2+Lkyiycv4pynnNP8qIZbOdkjvr+cf9j6Xgvg/QgJohli0sEx/s
	 4vCZN6R2TOgcUZlrugRigW8jwBBx4PYay1EevH76UcExBF7TuT+z8wN/cb3HAkbQfCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ir8YYF/j";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NCoM2baz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB38606A326
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 21:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FB38606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ir8YYF/j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NCoM2baz
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKmCD4033362
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 21:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2Fa0kR+cjmF
	W5Y7hXPxRKQn44qIXe2+RhTOmwcbjOD0=; b=ir8YYF/jbjUITf/zxev7DwegQD2
	NB/nCAm/UsjzD/ggpYtKKEX1TlmSDNwvHA79EdjaB1oy1cM4btXyVSEodkCjnyea
	Qsg82tKeC77FZMCuG5PQJ7Uq7nNBpnVML8WAVk0ve5jgaDNqFcWnFXlIIpuA41a2
	MLkXdymvQWoCNrY9Cse3LJLs7V2ovq/yO6Yk5tnt47tnq5m8iWnhejkHE0o+Z7fa
	EBmF0hL579GikHoUkwSOT+6qqkIqYFauelMh61FRF+EMs0/5KrEIQCROSohw9GF6
	OhjpRjBUkAf4oKSaA0cnB80U/RGsVel0DhkmJiIv0ukto6HpPL8Nsy5YIXQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyphr2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 21:41:12 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a71dd190b0so294462c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 13:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793742072; x=1794346872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Fa0kR+cjmFW5Y7hXPxRKQn44qIXe2+RhTOmwcbjOD0=;
        b=NCoM2bazP8Q9nGmKacmbrRAIGU0uSAeFsA+n57VN8et8KMtpThy6Vbh6/ZZwV6GJq0
         +GZSk/vwFTM5tfOzvMmmTitW1q752kQhrBihZ1TspIsdSNs92tKP2gh36fizxp8b+xNS
         aaLkHAOV0E3gRyNpRMXP8BqRTdSLcWBRG5RbPqg1/5KTuoOiM9wqaPqOaaZSQVgLwHGw
         KXnkGmDW1dQadPxR9/95M1jYskCL6xJA16KwejbD89MDgDXw3P+zmTHvuPBZzOh49ESR
         9Kdcx4DkLadGu4ngGcciVkYzLe5tSTckfx2sAgbT8qLUd4KfV65OrEysczvvmz7f2MLT
         WnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742072; x=1794346872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Fa0kR+cjmFW5Y7hXPxRKQn44qIXe2+RhTOmwcbjOD0=;
        b=FFm/N9VM8sO9h2pA9tgVt4L4lJ/2XpXTx/XxfMpUHv7xc5hvchnQu4+3eb0b2YwuzY
         q50vSNLqLj7cBppiKjAJ8CrmgiIMBRGUj+gSLjdfI/cG8J81vdt0clxekCorK++wnWOB
         0sTaVyxisLvz79S6jN0QtLMfEOMEOzecEBl6YyJU40b53uMAHN4XVjRB9IJXsPZnGk+E
         SwfVCWG1mFiy/Yfp+qGH1VDZsqWYEC5/OPTE+kfv9DJ8JEr0hgKzK1iO2amZnDPPeTdz
         pRxlClIfJ4gPOW1P8xvheJHFYKQ/MBU7MtNKvU2Z35e37etMql/RsjqnLkoDVGUUFQyf
         YJpg==
X-Forwarded-Encrypted: i=1; AKwUvByQEqukAmbuJBZbXIocn6j7/ADbcUFF9IdM0a/WT4+Tz0sbjiVF+VrIDkGDIef/W8CrnWtnTOLCLg+HpWbs@vger.kernel.org
X-Gm-Message-State: APuU4Z90IqJ2cLxOBmwTQfCqIY9Eedc3TEfBas7Ua4Kqu1pOfk4wVB9Q
	i7EhwlAj9pOgWBG5zFQT0/uB7xNyIa+Wg9H7cbuUzNT1XY9LM0Pstu66v3IEMbq9jQZok7SD8PF
	/XA4wBr7SOlGapkyEyCuqFUD0l1uJecjyvAkS7FVcEp5GeNyq8DtDaIHEsZUmWUJA+nOl
X-Gm-Gg: AYBFou2Yslo7kmRG8QOX2BVxHQF5metUHjfSvcKgQ3WFaD/hi9kQVAuhg0iu3hR9Ab8
	fwNGtTVe2pWsqmodX/2vXskjf5GCgc3PUzvnlouYF5AiEpVt9HjoezFuklMbj4i6ez1KLvfMhni
	P9XpEkUjWFFihMx0pN2jL60wppJtoKtL72IJwbKyvCqSbmSA0+SF2Zh2htRkUXsiADs4XkouDAe
	E9BZcZUGe7JoyiavOZk8R4ogwGFe+njgza2r/o+Y5XZ8SlyByBHMSu5sFtPlm0ou9n47yZgrqVQ
	vlquVRajOTh+atrU1mCQmqlqWHimtpucnVzMUmF4e5fVJwCy2TvU0vyrroCPL891xXP3RU0w1lu
	5ACdVj8BKQsBDXiAf/ep7V9GHr7K7NBdtLuFVhGbygL4OweG1FxFhnBzriz2ZIhQsqPcixna0rQ
	GZ1Qiqc1mMsjDKZAoZ2OdeQfu7rok=
X-Received: by 2002:a05:7022:ec85:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-1ac59dd081cmr28266317c88.13.1793742071361;
        Tue, 03 Nov 2026 13:41:11 -0800 (PST)
X-Received: by 2002:a05:7022:ec85:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-1ac59dd081cmr28266277c88.13.1793742070726;
        Tue, 03 Nov 2026 13:41:10 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm1537440c88.8.2026.11.03.13.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:41:10 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] phy: qcom-mipi-csi2: Add sa8775p D-PHY support
Date: Tue,  3 Nov 2026 13:41:04 -0800
Message-Id: <20261103214105.3605181-5-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
References: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX/JU097sdVZCS
 BhmTfVLUu01MbxPna/YgxX+lmNhl0GFjd+knvqRzjwhcqxHOKGwMbqSVNjeQNPw+qQxKPOYSySB
 ECBvCq8P9nifxNuv1DsMqGzQImRAxHc=
X-Proofpoint-ORIG-GUID: _A_iK2aAy91jeaqfFMBoKcZMFN6fezpq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX/osSUqmCSDPW
 FuvamPqtpLnMoKviFEzBDNHk5o/e8NrQs4iBlKDTbxzx9ulLSbVibsWNCgoLg9E1IjqhMs48J81
 CGG2pADgOwsF8vD2y4WtZK0O5hEpsVwTXikxdFFOf6PxR8RLT+4/6/0xaBLTEW7vz40TWED+ML1
 ub9g3ylh0iePgnwJlcsKYUwjyAV8VBjGdwWDWcRfPBbVzQG1OYXhfvM2FLRr15QowpXEztGnWaq
 S87pGVL+vuyVFrtji7RvVnCfMQ63ggWU++kd6m5rU1XRfn355H9LpHK9fE1vtIkbPjqqTbUb6vK
 1icdA570UNvjcg/XxmSxfRmQw7ZrjPmi1JExDsIY7J8mN2QDJSedvDnKdSeELih41Qn942QtnCW
 altQgAPfeXAx85l5RMQ2/ccWFfN6NPS6NLoWk7+R1SgEfeu3wRi7gIKsealVpCdkGV4+zfRbVhF
 +8l9jO80WUH9zoxgoSQ==
X-Proofpoint-GUID: _A_iK2aAy91jeaqfFMBoKcZMFN6fezpq
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aea54f8 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=NbtrdQoedUgDOuZm1b4A:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030086

Add the SA8775P CSIPHY to the generic MIPI CSI2 PHY driver, 
bound to a new "qcom,sa8775p-csi2-phy" compatible
and reusing the existing D-PHY 2-phase hw ops
(phy_qcom_mipi_csi2_ops_3ph_1_0). The lane_regs_sa8775p[] init
sequence is the CSIPHY v1.3.0 2-phase 2.5Gbps 4-lane D-PHY register
set ported verbatim from the legacy in-tree camss-csiphy-3ph-1-0.c
table; common_regs_offset is 0x800.

SA8775P reuses the same "timer"/"core" clock names as x1e80100
(timer_clk_name/opp_clk_name added by a preceding patch). Like
x1e80100, its CSIPHY core clock is OPP-scaled against the sensor's
link frequency via the shared csiphy_opp_table in lemans.dtsi,
matching the legacy in-tree CSIPHY driver's own sa8775p_resources
OPP wiring.

SA8775P's CSIPHY has a single power-domain, the Titan Top GDSC,
matching the legacy in-tree CAMSS driver's sa8775p_resources.pd_name
= "top" and the existing lemans.dtsi camss node. Like x1e80100's own
"top" domain, it is not OPP-scaled, only kept enabled.

QCS8300 shares this same CSIPHY D-PHY hardware and does not need its
own of_device_id entry: the qcom,csi2-phy.yaml binding declares
"qcom,sa8775p-csi2-phy" as QCS8300's fallback compatible, so QCS8300
CSIPHY nodes bind through the "qcom,sa8775p-csi2-phy" match entry
added here.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 110 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   1 +
 3 files changed, 111 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 8f1939e81e13..3e93e0b49106 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -317,7 +317,6 @@ static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
 	writel(val, csi2phy->base +
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 7));
 
-	val = 0x00;
 	writel(val, csi2phy->base +
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 0));
 
@@ -385,3 +384,112 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.genpds = x1e_genpds,
 	.num_genpds = ARRAY_SIZE(x1e_genpds),
 };
+
+/* 5nm 2PH v1.3.0 2p5Gbps 4 lane DPHY mode */
+static const struct mipi_csi2phy_lane_regs lane_regs_sa8775p[] = {
+	{.reg_addr = 0x0724, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0728, .reg_data = 0x04, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0700, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x070c, .reg_data = 0xff, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0738, .reg_data = 0x1f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x072c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0734, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0710, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x071c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0714, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x073c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0704, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0720, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0708, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0024, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0000, .reg_data = 0x8d, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0038, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x002c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0034, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0010, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x001c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0014, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x003c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0004, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0020, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0008, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0224, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0200, .reg_data = 0x8d, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0238, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x022c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0234, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0210, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x021c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0214, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x023c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0204, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0220, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0208, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0424, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0400, .reg_data = 0x8d, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0438, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x042c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0434, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0410, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x041c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0414, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x043c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0404, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0420, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0408, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0624, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0600, .reg_data = 0x8d, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0638, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x062c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0634, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0610, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x061c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0614, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x063c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0604, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0620, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0608, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x005c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0060, .reg_data = 0xfd, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0064, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x025c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0260, .reg_data = 0xfd, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0264, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x045c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0460, .reg_data = 0xfd, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0464, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x065c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0660, .reg_data = 0xfd, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0664, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
+};
+
+static const char * const sa8775p_clks[] = {
+	"core",
+	"timer",
+};
+
+static const char * const sa8775p_supplies[] = {
+	"vdda-phy",
+	"vdda-pll",
+};
+
+static const struct mipi_csi2_genpd sa8775p_genpds[] = {
+	{ .name = "top", .scaled = false },
+};
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sa8775p = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_sa8775p,
+		.lane_array_size = ARRAY_SIZE(lane_regs_sa8775p),
+		.common_regs_offset = 0x800,
+	},
+	.supply_names = (const char **)sa8775p_supplies,
+	.num_supplies = ARRAY_SIZE(sa8775p_supplies),
+	.clk_names = (const char **)sa8775p_clks,
+	.num_clk = ARRAY_SIZE(sa8775p_clks),
+	.timer_clk_name = "timer",
+	.opp_clk_name = "core",
+	.genpds = sa8775p_genpds,
+	.num_genpds = ARRAY_SIZE(sa8775p_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 181813caf282..244e851ff24d 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -454,6 +454,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
+	{ .compatible	= "qcom,sa8775p-csi2-phy", .data = &mipi_csi2_dphy_sa8775p },
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
 	{ }
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 359b58660db8..5578741c0930 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -96,5 +96,6 @@ struct mipi_csi2phy_device {
 };
 
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sa8775p;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */
-- 
2.34.1

