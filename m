Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B716313E30
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637992; cv=none; b=uFlf7r6+WrcZyr1B8hUiUM4YgoK6RCgD45udrODdIFDLRyXPEcRsHj0NyYZftSCF+H5H7PrSwNJjceQJuJ26wqhjIxnZWBTb21nM9sjj1vVqUL53VSW0a5zLfBzrbf8AKp92OM+0+E4gt1T+cfI7x+S0/xxYqEvJEU+9+GQolnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637992; c=relaxed/simple;
	bh=p7vtux02QoFwqCNEJzN6NRAoZiRLHO8Kp0lGki6fE6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iQ2IhQmOG9jxjEkkkGV4/N61IKmQCOatJy6A+hWHU6W9dnMzoX69++6/O5uJG64h7Ocuc5IDWW5e+y+XHnexvYC1Rip/4R8ygeOUpQrdDG1p0Mc3SmDY1NZZ5dNE8QcLwAk8nMTrQgLODXnPYQqbslBmjt7cU5FjlO0NQ3kMCb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hsO6mgxr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dIBaJSYV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hsO6mgxr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dIBaJSYV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARQM11230011
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cVSVHPoR7dq9raMoJUWzKBbvK9v9gA3XKgTQ8sktK+w=; b=hsO6mgxrzmpnfWTM
	iuO9eOcJahrYyRNz8+obj/Cf/VtxZSAb59t3Rklcw3aQYrydiSgKdZbyMboUVtPs
	eX63fXU9DTI7Z/5RL3W5m5CeKuP/+2kXJ3kKc1G0rgk1L0rHliRKTA1hevqbdhc6
	yD/r0S4HFuquSouhrSk7Jd+xlB669L7m7O7Iwfye27eadI2yfEbOGC+SV5AIGKHu
	RkWy0VYcUEbjDDD/WFq4w430b91OjpRelPMTCkXNxsRku3XzebSCCbbTCHkAcpJv
	eEApBATC9zJGfKwU8Pga+q8X/V84SVF56ez4k4lP5g7N8ffMDCfaTXV8C7SuQ9DD
	jDMQtQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj01aar3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:46:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso6587757a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 05:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784637988; x=1785242788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVSVHPoR7dq9raMoJUWzKBbvK9v9gA3XKgTQ8sktK+w=;
        b=dIBaJSYV5P8UbaYw9SlePWIYebTBBHfQcqYw9P/chQvWBKIJyos/cnebUp6ftjmKzb
         LfkYKdf4h2MM/KOTNOo4nhC0oZADeGMKEb0fv8EuEviw24pCdR1MCKM/iYo+K5ZTP4fF
         m5YhxMkwB0BSW+FZ72fCoGZCRSiJ52Q7QGr2mh7Ak6tz+igIF1E4sur57pvqfSljqcHB
         31tSTrw5YNVtnFJMVKgMHWawugKKQKAOLgKwFXpQx1KOAIE+krX2x9T6+hlfquBzOA1P
         GemRRki0x7HK/PxBKBco0V9RhIHCM37Cw7glyyuY+4CU/CXm30SJ/ukg/XolrXWC4tPf
         XTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784637988; x=1785242788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVSVHPoR7dq9raMoJUWzKBbvK9v9gA3XKgTQ8sktK+w=;
        b=GNeUf8eVCRV1rU8tCeXK9Ycl+DI2V4H9OgZSQUk7gJYytG375kk6buIEV6Ckcm54MX
         HQyPbDVtQjf9hxA+89Q1f3QjSrHhjFsXQv3h9U8nt35sQufbQmfz3Gh++CieDfcf440H
         Cg/el8ixcBkioLLREsdTR1mviVQElE91Gtdgi0HE31m6jE0hNFqupCG3QQDoPN/0i/3M
         ofJJK6zJ/M/61rey4rAQrAbZijcngtW8q6GMuk6wDgvhW2+bHe6fH8+tr2PlWghcMGjA
         KkMOq6zJ3j+Sx64IPGzjSvwxa2KD0fZf6QsIvSUWpy6KSLh3mBT2lUwEUKrhDtAfBKVI
         vExw==
X-Forwarded-Encrypted: i=1; AHgh+RpI01ejAKuQn7EkdDOLyHPc4kcHdQsQ0cuHFBqCtS1Q2Xqq3jYmukRM3ZXbFJsqZM44lnU0wgDzqiyrYF+y@vger.kernel.org
X-Gm-Message-State: AOJu0YzbcWzKsvWyLGzw5bIlM6gnI9mcHfVmoBP9Acw3o79WNQXmegzu
	dZFhDod2Qc1VSgf5sd9jKK7cRNRlPcutY7MNn4t3csCDIjZ843zUx7iW5GHHF/kHxgQZRfLZqlS
	Trmb/7JU7cHjFvBlskpR8V+UU/n4dIxkRgb1T/W3kCw41243QrgMzJE7Md/czhJF7KW3H
X-Gm-Gg: AfdE7ckOL3L7om8HpoHpvG9xEdUB1BWZJi+FP5akz7lftue47FRC4x8vcgX0Ciq9/13
	8jIFR9of1wAkuopLJ9193i6899SBciayoWODjJvZrEGpTcPpkXKIuC0WoPNoNzWNh+cIYnSQsPs
	Cpuscgt+QCVVsXJWZAW74BmvCBtfeQeEySByT7VvStSGpPvK0Zi0h2xAwu8TLBUl3IqdTnPApAi
	petozJHHFwA4VcHqlE5hmPjVN3TxFFrTwCQVuQL3iRMbrxCl6kejs737YqKTt4NoYUxhW71dR1c
	Z9PI+zmfbr0ein8uUpJjA2+a5ki+d62V3WH8NyKb/ElnhZDdwfjhdoR2MiX/xJG+kE7s+DN8JbJ
	IBk51lmUi1Y5BAhdyfU2REY1+RRLUOnHwOZH0bJwHdCD15eRCrlI+ce4=
X-Received: by 2002:a05:6a21:a347:b0:3b4:71c1:ab29 with SMTP id adf61e73a8af0-3c3ad7a3204mr20651330637.16.1784637988227;
        Tue, 21 Jul 2026 05:46:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:a347:b0:3b4:71c1:ab29 with SMTP id adf61e73a8af0-3c3ad7a3204mr20651291637.16.1784637987799;
        Tue, 21 Jul 2026 05:46:27 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bb62sm45258359eec.2.2026.07.21.05.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 05:46:25 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 05:46:06 -0700
Subject: [PATCH v6 7/7] media: qcom: camss: tpg: Add support for v2.3.0 TPG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-add-support-for-camss-on-sm8750-v6-7-a5f841061d18@oss.qualcomm.com>
References: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
In-Reply-To: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <quic_vtumati@quicinc.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=BL6DalQG c=1 sm=1 tr=0 ts=6a5f6a25 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=idD7zpNBPGs6u6YxcA8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzNSBTYWx0ZWRfX5ikuDxcCIioi
 UdTKMZIJ5OnLEpR6wVQNiZlrMCitaFYMKRmw4mmBum8QDTakaXlBbr4qJMiMXd618GXJqKFxhu2
 r4sa333qY0VBZ682CsIraZetH1MyGJO/1B3spl9xXYVPxl5GQB5pf1fulhx00sN+I0L0VslTtoz
 kfXxTO+smxDi6nLcczN5DrVdV8g94kd4Y8Tg5OBecp2MOIvWupoIeJ+ySrVjRB/vR5RdDm1BLRA
 dVZPiw7MXnrFQILv8J5MIhoF/53KphVGu6K7z89UIbT+gxcXs6qgH10rJbWIwqymX4T2CsBqEWN
 iVcjT4tsBBf1H59jn+Pdn6WdMCGz0V/Kd1yvjNCxtJUIn63K+QQKa5a4UtWh/fhQv51tg7N1E1T
 jEcmuR2yvllLrfoYedAUs89l8K8Oh0NKLtoj/RPd0hOBxbUb07OMkvxQXoIpkafHQ0gsdAHYIZm
 jSDVbjHgDGfil13gCeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzNSBTYWx0ZWRfXyEOmnXUMgI/m
 W5rEIDpR4+yMgx+GbunHA1f/dZgW+j79zVfKvWTmHxdRWJBcGWXkcKHM266x3DIFyIoaJOf3K43
 KYoB6Wy2QP70/eLJSoXBLKO2CJFLSQg=
X-Proofpoint-ORIG-GUID: 5B7bBsU2MLVqkoJGo2dx5lEzboMNtk4T
X-Proofpoint-GUID: 5B7bBsU2MLVqkoJGo2dx5lEzboMNtk4T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210135

Add support for the TPG found on SM8750. This TPG uses hardware version
2.3.0, which drives test-enable and reset through a separate
TPG_CTRL_CMD register instead of TPG_CTRL, and routes its output into
the CSID 980 RX via the CSI2 TPG mux.

The 2.3.0 and 2.4.0 (Kaanapali) TPGs share the same programming model,
so reuse the Kaanapali TPG resources for SM8750 and lower the hardware
version gate in the TPG gen1 driver from 2.4.0 to 2.3.0.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-980.c | 15 +++++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c |  9 +++++----
 drivers/media/platform/qcom/camss/camss.c          |  2 ++
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-980.c b/drivers/media/platform/qcom/camss/camss-csid-980.c
index 6714b8aa8c2a..16184fe69398 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-980.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-980.c
@@ -68,6 +68,8 @@
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_TPG_MUX_EN			BIT(27)
+#define		CSI2_RX_CFG0_TPG_MUX_SEL		GENMASK(29, 28)
 #define CSID_CSI2_RX_CFG1			(csid_is_lite(csid) ? 0x204 : 0x404)
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
 #define		CSI2_RX_CFG1_VC_MODE			BIT(2)
@@ -183,12 +185,21 @@ static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
 static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy)
 {
+	struct camss *camss = csid->camss;
 	int val;
 
 	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
-	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
-	       << CSI2_RX_CFG0_PHY_NUM_SEL;
+
+	if (camss->tpg && csid->tpg_linked &&
+	    camss->tpg[phy->csiphy_id].testgen.mode != TPG_PAYLOAD_MODE_DISABLED) {
+		val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
+		val |= CSI2_RX_CFG0_TPG_MUX_EN;
+	} else {
+		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+			<< CSI2_RX_CFG0_PHY_NUM_SEL;
+	}
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index 770a9e5d5ba5..5c452f7a412d 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_3_0                TPG_HW_VER(2, 3, 0)
 #define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
 
 #define TPG_HW_STATUS		0x4
@@ -170,7 +171,7 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
 
-	if (tpg->hw_version >= TPG_HW_VER_2_4_0) {
+	if (tpg->hw_version >= TPG_HW_VER_2_3_0) {
 		writel(val, tpg->base + TPG_CTRL);
 		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
 	} else {
@@ -184,10 +185,10 @@ static int tpg_stream_on(struct tpg_device *tpg)
 static int tpg_reset(struct tpg_device *tpg)
 {
 	/*
-	 * On TPG older than v2.4.0 test-enable lives in TPG_CTRL, so clear it
-	 * first; v2.4.0+ drives both test-enable and reset through TPG_CTRL_CMD.
+	 * On TPG older than v2.3.0 test-enable lives in TPG_CTRL, so clear it
+	 * first; v2.3.0+ drives both test-enable and reset through TPG_CTRL_CMD.
 	 */
-	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+	if (tpg->hw_version < TPG_HW_VER_2_3_0)
 		writel(0, tpg->base + TPG_CTRL);
 
 	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 011ece0a7692..418deb74cd98 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -6159,10 +6159,12 @@ static const struct camss_resources sm8750_resources = {
 	.version = CAMSS_8750,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_kaanapali,
+	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_sm8750,
 	.vfe_res = vfe_res_kaanapali,
 	.icc_res = icc_res_sm8750,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
 	.csid_num = ARRAY_SIZE(csid_res_sm8750),
 	.vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),

-- 
2.34.1

