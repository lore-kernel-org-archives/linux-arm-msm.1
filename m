Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A902331EA8
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 01:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125706; cv=none; b=G6dj2XjGCJqp+R2ZBJtdrC+ZIMYKZioN7JkoNF1LuctwHou8Dok1IO9/be6wkOxHzQaB8LZUurIi/dG2wGstJYueU+iXJ58ISd8a90u1LO98aTEgYhuYsYvcaw5nL8pru2luQs5V1uyQdlPSE4UdHigu0OMXVKXwtwcLese7sCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125706; c=relaxed/simple;
	bh=ec5frk+YtDQMLnumPZGZWsIFPqUU4OVg7LaYLxO10tQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AUTEMt50ltqUr72YY0vsd3iqsVXTuNYeBZxSIZC2XmW9wiFnhyvY1LfvOUF80o6uEAdAek/fGxdB02c3JesSJSiZw9YEUANKAZCvMTEhDv09FkBF5zUBvnC3IPNdFSolLY6E2GkpdzYtz3PZi1lsnNoTJ3Xds1rDBw3ugBQ12es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VO1kOw3s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IfmPv9MD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VO1kOw3s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IfmPv9MD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI74Et1153754
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 01:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pPuoSkJqnskwsDSUR3d4HyJ4r5DX3/yxD5kDVEbQS+g=; b=VO1kOw3s6TpM0iKO
	HXNEL83f//yG/H5EgWL0rMTymC9GpM6ATvGYmWu+mqkB+ES49+U9V9vsu+sWSUK1
	8UwriwBUDa35wO6KsR50bsPHP4DAZdPZYM+l/tm6ivc/sVEs5ljAV1DfyXcidEaW
	t0HxZ3APfu/gCLlP6ZrN+KiVE0ulionVeSoW5TWaGW+6B1p9/rfFGWKFnV2pn/sn
	7yGvaHPgx2K/SWUAvT558C+ollfT7xuV7D1t+sd19qO80JfrnicJOA9L9zAfc3Sl
	yPkdYv52Dewg9/pdrv8ILBTWt87o64aF18YyECUuTlkhEfT0ngFez046VL0lhTQU
	uGP7Ow==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guvw7jc9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 01:08:23 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c14fa512aso253699eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 18:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790125703; x=1790730503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPuoSkJqnskwsDSUR3d4HyJ4r5DX3/yxD5kDVEbQS+g=;
        b=IfmPv9MDrH3m+PDtPWbhx70AlApNY92Qpk6LbyMnCvx5ESLkfFrkXNXwKX5JtXa1e0
         zvPgy7LqYokoKOrEvD6SsWSNd3KUyyLSfcabhRP/Wth4YOz8i4E8mfRtO260Oq6Q2e9s
         CtghL9fFXWybk65BEhxQUaleJUnxddVPGGGQ+mGthr/GULyXIKOJdMbfYHss0+u4LIBo
         YGqhq41CmDGCB7dKeZ6B5j0qEV1o2GuJYMK7xyXLB+Mx900Ulz7yYg8/nDR9+QJIkC3H
         QAAXWSKSKGf8C/TSkT5aoVjPA4/IuSdLUdN8NeJYZjhi2xQA7hVO59Yso4l4l0pWY+So
         sk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125703; x=1790730503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPuoSkJqnskwsDSUR3d4HyJ4r5DX3/yxD5kDVEbQS+g=;
        b=Ew4ZNyyb7ewn+1gQBV0ZjRO70Hv7FHTC93QRJT9uacJfa3Yr92J8UxbXlyUYBV7xHl
         Oh3cKrFiIVOGo1gNu9ArtuCIolTz6okVX+u+aJyDl6Zwef3xmEg8HBqEYZuaYbOywRGl
         R7hc9jkA4i4Ay9bxc1WGQzc9gjSkC3yrKgASfJ9QxjD1IaZPZ/dVOjcYP9fy6M5AA34O
         1E8GvHE9umkpyHpgOGtVa2x80+qmUiNU1eT4EPDuEgrXva+xfyPaKmAKUtFpfL1eoWhY
         GM86P+s30YaZ+gx9P3T1TTfUE+CtiMKEtWBGArZAz+mHdpEY318n/i8xrcYnUWCMJ4IJ
         Yp8w==
X-Forwarded-Encrypted: i=1; AKwUvBxXPB1YwWHmfpECA2+XBFjFHdEzujNhNM1mlvCzh1rBO93A+ew4NPhojv+qrvNepf9Zh71mbPGwcnDF4dTd@vger.kernel.org
X-Gm-Message-State: AFuF++lJR9BXgCDBF+vdzKv6QtRNm+McLcZsE8mwKR9FFp6aAC7RafaR
	aofo8OR0b9HTwfs9iGg2UPegtVDcIIS2BOCMyef8CUyVsdWkvB07pXV15eA9VPM/4PuKLL61wD1
	Try802Qcbf0p6CV3NlLj0/+7C3+vzoWAD/sISIBWvOR+WB+v5O178Xg+gCczG0Sv/Kp94
X-Gm-Gg: AYBFou3+9Q/1LJc9BixkI18++pp1xJSDX2c9tBSeMUgzbDaBHfgo+YPOSz1kvIJlqJ0
	zaI+nlIVGKkzkfDbtChy68WaOp80aXfLj3DHqecfekGMCyJZG27ELvtncB7OiojzRgrsUER+3CL
	u2rIrfmLrO3kUOOQE3zjvFm9R8rK0Gs0oHIuRqQI4kJ8DyZ/GZ1Mk+gqTIYnZj9pT1g2XaCroKE
	aJuYWbSjku8dVEur6z/uLTW/lCdPhlnwUPi2w0PiNb+Q67Gu3AgFqn/8UCepbQUtWQNS9vh0CLE
	hbeYQEtyueVKFAm5uS4aZ0fOlTpGMSeHABUixhY9+uizu9pLPxoEIxBtQofNJegL7rzpm/nASa5
	gjC0zgUfv+DlfBdkbJL7GXzDlTBLk
X-Received: by 2002:a05:701b:458e:10b0:143:1bb1:3307 with SMTP id a92af1059eb24-144ef207dbemr1143998c88.24.1790125702872;
        Tue, 22 Sep 2026 18:08:22 -0700 (PDT)
X-Received: by 2002:a05:701b:458e:10b0:143:1bb1:3307 with SMTP id a92af1059eb24-144ef207dbemr1143959c88.24.1790125702234;
        Tue, 22 Sep 2026 18:08:22 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98ca0edsm1651831c88.15.2026.09.22.18.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:08:21 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 06:37:28 +0530
Subject: [PATCH RFC net-next 2/9] net: pcs: xpcs: add USXGMII Clause 37
 autoneg support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom_xpcs_nord_emac-v1-2-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790125674; l=7650;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=ec5frk+YtDQMLnumPZGZWsIFPqUU4OVg7LaYLxO10tQ=;
 b=Oe2dGKX5HImnogO3tEsFXNOVtvfzBGrsRPstHAhtUaSNg2Y/WyV5elH2n/DazKr0XJ9avzejN
 NzAt93U2jOAD2PcZlv9wQDR54sdI4vmZyVYij5lJIyA/l013If1HqL/
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX/rdx5/Mn4YD4
 LyXFrEq5bhrnhdj//M9hap+Y2UvXhRI+jxQe8CCghbP2/z0pown7jDLUelyS1/K2Nee53C1TvIt
 QtOEe5GfZIfftuWBySugrVoxSOW1Gkc=
X-Authority-Analysis: v=2.4 cv=ZYqIpcVA c=1 sm=1 tr=0 ts=6ab32687 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CxBzW-8FhjC1KXsKZjIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: hmGFvX9-AOk-bSW8Gr69R6jNlIv_Ec9U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfXz3TzeHu45zNo
 Pw6OEMH9B2ZYbZTpfLOqdVPLGGb67g5aBywxfP0AXSaXCPZpkQTbeLsLtj0YkiYwIzXtVrP0bTF
 z5JSxRnevBYopM/UFTjhmZGwVmCm+dfeR0QF/mt9xb+0yKFQj9GAcaBXKMTZyXaWN6UuW8AUGSZ
 TrwAUZ8XU5wqE9v9TcTn8ff6EzeoN5BU88AHC80VPM3lVkTdPk2uCtNFoI6Nufh+SbuWrjLKdo2
 A4kd5GMZjBZs/6PcWKj+r9gHFD4ffITApl4bm0a3AObiURsqXO0MlyjZkCWLaf9m3D59ICL6ZJQ
 UU17gMfeKUY7cmoIr8uypp4Zjk7Yj+2H9PpJg2HPDBeEu2OYQqzwk3zsB5Nuy61+SQVHdiLdJs0
 qSm+fdsyZkcehPoMY/t82D+OwgBV3AnxLaMBScqX3UjYE69CsYKTnF0cjkHWNjPn813XG00TKcm
 hLCj4HdR7GRcDBkB5OQ==
X-Proofpoint-GUID: hmGFvX9-AOk-bSW8Gr69R6jNlIv_Ec9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230004

The generic DesignWare XPCS support currently associates USXGMII with
Clause 73 auto-negotiation. The XPCS integration on Qualcomm Nord
instead uses the vendor MII register block and Clause 37 control and
status for USXGMII.

Add a separate Clause 37 USXGMII mode which configures the PCS for
BASE-R, enables single-port 10G-SXGMII operation and enables
PHY-side Clause 37 auto-negotiation.

Also decode the negotiated link, speed and duplex from the vendor
Clause 37 status register. This supports 10 Mbps through 10 Gbps link
rates exposed by the USXGMII status fields.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/pcs/pcs-xpcs.c   | 113 +++++++++++++++++++++++++++++++++++++++++++
 drivers/net/pcs/pcs-xpcs.h   |  15 ++++++
 include/linux/pcs/pcs-xpcs.h |   1 +
 3 files changed, 129 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 0337e2bcc01258e102a649e3b7fce41c65a3dd05..7f5c7a275630f2b064e4b9abdd6c3619e9346cec 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -283,6 +283,7 @@ static int xpcs_soft_reset(struct dw_xpcs *xpcs,
 	switch (compat->an_mode) {
 	case DW_AN_C73:
 	case DW_10GBASER:
+	case DW_AN_C37_USXGMII:
 		dev = MDIO_MMD_PCS;
 		break;
 	case DW_AN_C37_SGMII:
@@ -355,6 +356,54 @@ static int xpcs_read_fault_c73(struct dw_xpcs *xpcs,
 	return 0;
 }
 
+static int xpcs_config_aneg_c37_usxgmii(struct dw_xpcs *xpcs)
+{
+	u16 mask, val;
+	int ret;
+
+	/* Select BASE-R PCS mode. */
+	ret = xpcs_modify(xpcs, MDIO_MMD_PCS, MDIO_CTRL2,
+			  DW_PCS_TYPE_SEL, MDIO_PCS_CTRL2_10GBR);
+	if (ret < 0)
+		return ret;
+
+	/* Enable USXGMII before accessing the MII MMD registers. */
+	ret = xpcs_modify_vpcs(xpcs, DW_VR_XS_PCS_DIG_CTRL1,
+			       DW_USXGMII_EN, DW_USXGMII_EN);
+	if (ret < 0)
+		return ret;
+
+	/* Select single-port 10G-SXGMII mode. */
+	ret = xpcs_modify_vpcs(xpcs, DW_VR_XS_PCS_KR_CTRL,
+			       DW_USXG_MODE_SEL,
+			       FIELD_PREP(DW_USXG_MODE_SEL,
+					  DW_USXG_MODE_10G_SXGMII));
+	if (ret < 0)
+		return ret;
+
+	/* Disable Clause 37 AN before changing its configuration. */
+	ret = xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR,
+			  BMCR_ANENABLE, 0);
+	if (ret < 0)
+		return ret;
+
+	/* Configure USXGMII per XPCS databook section 7.6. */
+	mask = DW_VR_MII_AN_CTRL_8BIT | DW_VR_MII_SGMII_LINK_STS |
+	       DW_VR_MII_TX_CONFIG_MASK | DW_VR_MII_PCS_MODE_MASK |
+	       DW_VR_MII_AN_INTR_EN;
+	val = FIELD_PREP(DW_VR_MII_TX_CONFIG_MASK,
+			 DW_VR_MII_TX_CONFIG_PHY_SIDE_SGMII) |
+	      DW_VR_MII_SGMII_LINK_STS;
+
+	ret = xpcs_modify(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_CTRL,
+			  mask, val);
+	if (ret < 0)
+		return ret;
+
+	return xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR,
+			   BMCR_ANENABLE, BMCR_ANENABLE);
+}
+
 static void xpcs_link_up_usxgmii(struct dw_xpcs *xpcs, int speed)
 {
 	int ret, speed_sel;
@@ -687,6 +736,7 @@ static unsigned int xpcs_inband_caps(struct phylink_pcs *pcs,
 
 	case DW_10GBASER:
 	case DW_2500BASEX:
+	case DW_AN_C37_USXGMII:
 		return LINK_INBAND_DISABLE;
 
 	default:
@@ -950,6 +1000,11 @@ static int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 		if (ret)
 			return ret;
 		break;
+	case DW_AN_C37_USXGMII:
+		ret = xpcs_config_aneg_c37_usxgmii(xpcs);
+		if (ret)
+			return ret;
+		break;
 	case DW_2500BASEX:
 		ret = xpcs_config_2500basex(xpcs);
 		if (ret)
@@ -1158,6 +1213,58 @@ static int xpcs_get_state_2500basex(struct dw_xpcs *xpcs,
 	return 0;
 }
 
+static int xpcs_get_state_c37_usxgmii(struct dw_xpcs *xpcs,
+				      struct phylink_link_state *state)
+{
+	u16 speed;
+	int ret;
+
+	state->link = false;
+	state->an_complete = false;
+	state->speed = SPEED_UNKNOWN;
+	state->duplex = DUPLEX_UNKNOWN;
+	state->pause = 0;
+
+	ret = xpcs_read(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS);
+	if (ret < 0)
+		return ret;
+
+	state->an_complete = !!(ret & DW_VR_MII_AN_STS_C37_ANCMPLT_INTR);
+	state->link = !!(ret & DW_VR_MII_USXG_LINK);
+	if (!state->link)
+		return 0;
+
+	speed = FIELD_GET(DW_VR_MII_USXG_SPEED, ret);
+	switch (speed) {
+	case DW_VR_MII_USXG_SPEED_10:
+		state->speed = SPEED_10;
+		break;
+	case DW_VR_MII_USXG_SPEED_100:
+		state->speed = SPEED_100;
+		break;
+	case DW_VR_MII_USXG_SPEED_1000:
+		state->speed = SPEED_1000;
+		break;
+	case DW_VR_MII_USXG_SPEED_10000:
+		state->speed = SPEED_10000;
+		break;
+	case DW_VR_MII_USXG_SPEED_2500:
+		state->speed = SPEED_2500;
+		break;
+	case DW_VR_MII_USXG_SPEED_5000:
+		state->speed = SPEED_5000;
+		break;
+	default:
+		state->link = false;
+		return 0;
+	}
+
+	state->duplex = ret & DW_VR_MII_USXG_FULL ?
+			DUPLEX_FULL : DUPLEX_HALF;
+
+	return 0;
+}
+
 static void xpcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 			   struct phylink_link_state *state)
 {
@@ -1191,6 +1298,12 @@ static void xpcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 			dev_err(&xpcs->mdiodev->dev, "%s returned %pe\n",
 				"xpcs_get_state_c37_1000basex", ERR_PTR(ret));
 		break;
+	case DW_AN_C37_USXGMII:
+		ret = xpcs_get_state_c37_usxgmii(xpcs, state);
+		if (ret)
+			dev_err(&xpcs->mdiodev->dev, "%s returned %pe\n",
+				"xpcs_get_state_c37_usxgmii", ERR_PTR(ret));
+		break;
 	case DW_2500BASEX:
 		ret = xpcs_get_state_2500basex(xpcs, state);
 		if (ret)
diff --git a/drivers/net/pcs/pcs-xpcs.h b/drivers/net/pcs/pcs-xpcs.h
index 929fa238445ed550677850b9b89149e952ac9fd6..cbf583ff55ba0884efb9c8b63a07154628ee5ea2 100644
--- a/drivers/net/pcs/pcs-xpcs.h
+++ b/drivers/net/pcs/pcs-xpcs.h
@@ -13,6 +13,7 @@
 #define DW_VENDOR			BIT(15)
 
 /* VR_XS_PCS */
+#define DW_PCS_TYPE_SEL			GENMASK(3, 0)
 #define DW_USXGMII_RST			BIT(10)
 #define DW_USXGMII_EN			BIT(9)
 #define DW_VR_XS_PCS_DIG_CTRL1		0x0000
@@ -20,6 +21,9 @@
 #define DW_EN_VSMMD1			BIT(13)
 #define DW_CL37_BP			BIT(12)
 #define DW_VR_XS_PCS_DIG_STS		0x0010
+#define DW_VR_XS_PCS_KR_CTRL		0x0007
+#define DW_USXG_MODE_SEL		GENMASK(12, 10)
+#define DW_USXG_MODE_10G_SXGMII		0
 #define DW_RXFIFO_ERR			GENMASK(6, 5)
 #define DW_PSEQ_ST			GENMASK(4, 2)
 #define DW_PSEQ_ST_GOOD			FIELD_PREP(GENMASK(4, 2), 0x4)
@@ -68,6 +72,7 @@
 #define DW_VR_MII_PCS_MODE_C37_1000BASEX	0x0
 #define DW_VR_MII_PCS_MODE_C37_SGMII		0x2
 #define DW_VR_MII_AN_INTR_EN			BIT(0)
+#define DW_VR_MII_SGMII_LINK_STS		BIT(4)
 
 #define DW_VR_MII_AN_INTR_STS		0x8002
 #define DW_VR_MII_AN_STS_C37_ANCMPLT_INTR	BIT(0)
@@ -78,6 +83,16 @@
 #define DW_VR_MII_C37_ANSGM_SP_1000		0x2
 #define DW_VR_MII_C37_ANSGM_SP_LNKSTS		BIT(4)
 
+#define DW_VR_MII_USXG_LINK		BIT(14)
+#define DW_VR_MII_USXG_FULL		BIT(13)
+#define DW_VR_MII_USXG_SPEED		GENMASK(12, 10)
+#define DW_VR_MII_USXG_SPEED_10		0
+#define DW_VR_MII_USXG_SPEED_100	1
+#define DW_VR_MII_USXG_SPEED_1000	2
+#define DW_VR_MII_USXG_SPEED_10000	3
+#define DW_VR_MII_USXG_SPEED_2500	4
+#define DW_VR_MII_USXG_SPEED_5000	5
+
 #define DW_VR_MII_EEE_MCTRL0		0x8006
 #define DW_VR_MII_EEE_LTX_EN			BIT(0)  /* LPI Tx Enable */
 #define DW_VR_MII_EEE_LRX_EN			BIT(1)  /* LPI Rx Enable */
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index 36073f7b6bb40e02c523112f79b3c55838a778e2..4ea995b70150e33e1e1a47cc7aa324c53742fbdc 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -20,6 +20,7 @@
 #define DW_2500BASEX			3
 #define DW_AN_C37_1000BASEX		4
 #define DW_10GBASER			5
+#define DW_AN_C37_USXGMII		6
 
 enum dw_xpcs_pcs_id {
 	DW_XPCS_ID_NATIVE = 0,

-- 
2.34.1

