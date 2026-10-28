Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183951;
	b=z/3aBzbVX/rXv/pXTjFroG+FEnGQVe16LMNIT4Ghx4fUOG8e/EEmiVqRVqYzi+xnhQDV
	 uHZx6mcX7MbxGX6OlD5WNXWxAJA2oZCudRgm1Y/2eVC5VGS1MIa6xYbgWLHoJCAij6U11
	 nKKd8la478NhSYNpg1iM5g4XCt4COasylGHvPhmkvu3oWF8Px2iCh2JbWM2PQCNzLO/Fv
	 Zy/G3bJF0xWVmQh+eA8MkYKvPyVgsng9/PeQYXvsDZH8P1/jP20jtjpPQsEELlOkfVeQS
	 uZ0+MVXFF8RYfUlkyrSDSX6kDg4E0AIHndR5cBkaqVzuVKWcSkJhYgpVVVF03bCDPXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wUQTjkDzyiR26kHqxoaWKUzMBK2BQSYa4Q6O+asJ7Zg=;
	b=mMotLVhypu+/Q0daOUpEJ8U8BYfYx37NT1ymtOwDjTg9DND3kEqwCF88iGRkUkVIBN/a
	 atX1PYtOLz+YGcqE4FrEwERnoieCv6SXRb/ti6AucS7IF4iCTB5e12fH9kiPiZrMmQLgQ
	 aXAVgmAnxsAwgDJ17xfax7C9Xuv7airUHcd+lWeA+HbFIfDXeEM0L+1FWMlQgorrGow/5
	 MYOTwc7FYgoT4My5F0HDylL4tEIGrzI3LiCPJAYaSzzkCb/cWMm+FKeh4nCSYzed1gDK2
	 Vo0iIuzt21x60WXB7gX2cy95qKkFozyTGnp4wUZRSHDzQzEwvyn82LZMR2M8hkzeP9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HLi+4NaD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="NsdhX/Mn";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEBB60A2605
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FEBB60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HLi+4NaD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NsdhX/Mn
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KmVD1101705
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wUQTjkDzyiR26kHqxoaWKUzMBK2BQSYa4Q6O+asJ7Zg=; b=HLi+4NaDhre4kezv
	guy4gMMrd1Yzah2t+qt9eswiqjiGzYVaqEKG2TN7DRZfLHiH3LR3XWJnJOWhTCvn
	LhHDdX5xZwE4Zl5mM7SvUMM3DsTaPwe8q+PG5o9oYf5MMCXXL8cfsuudddXHCb0N
	Ahb+ajDoJrDBZ0Dp6flXhCaX+Fp5B3MLGrU7aLtjdk45pUjnn8w6moIvE9xJZ4il
	EThM4QkKGykvRjbVxwGRBZz23A0VzNOXjrBBqxc1LBOTg+m34403baZWwmfr1lCV
	D8jTqnFLWPlSEiHT5KvzHLVy0Om5R9ZymprO/ntz4HeTXTqqxW2QrkXr0gNqGKSc
	TcrqtQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7rg5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:38:58 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso1646330c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 03:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183937; x=1793788737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wUQTjkDzyiR26kHqxoaWKUzMBK2BQSYa4Q6O+asJ7Zg=;
        b=NsdhX/Mn4WS3FAGajOwL0w+Eopi9WVYtUryRevhTXxbn+Uiw6SWRrr/fSn7ZXxMBCL
         lZfXMaUzPKw3gibl6i6eSOdTst5srfFgsVCDRZp+RinGr8Ijpeml+BCdWZZprISB+g8R
         I3qV27jn+c3V46sIZsBzCIoAM7pMt/9jyoQCRQeo+6q2hddxYvf/s92RrCCBH9nmrqCG
         zXMHJTnt3z1gW7reMRGb/HjmTJ3mJR+GnL67PKE+yvU79A6hXsgIv7bOuxQnXi+AvEYT
         nql8c5n7s1dXK/xcpK4ZEfrMQkAZQKB+Qu/m4spOjXgZrHjrUZCPZYTupz3GzpiZh2K0
         F1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183937; x=1793788737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wUQTjkDzyiR26kHqxoaWKUzMBK2BQSYa4Q6O+asJ7Zg=;
        b=QGl0MSm48iZrvqmw9No1uGstWebAcPorQk0s52fQ2zPaTPuQpyZ5hGjNhwcruqC3aM
         cIyXHkNd1q7vrsLKbJv1mmvFySptwGnIHPHo59wtNFxE9Ml+hGhb+8PyiKGrnux9jpgE
         j013Dy3aurF/bxcLGoWcrKJ3ejBuCzQ1fEh5R6IZmgVLi5C7Wwu6mmvqZ09EBPNoZYAH
         r8z344dP+VZrS6PjCvz8jA5JMXcBgyAhjaOo/IHHAGVobBJENZrikSc909+++4OfbdCs
         pVnEwBTxVesLZXZGh7nhOhgltRhtYGKYZnRDHQn73u4/sg76n71Qi+685UAveR93oa4O
         akAg==
X-Gm-Message-State: AFq9FYLwPsBKFbTYWPNeBvNWyL2WS9C4RqrDZ2Sz8BOKnl2vbvycsmhN
	XQ/9MAfpjVkrYsm+xC1ek3RTLyjGNH22cthxS85Sv1jN3phcYKw5zO2cG8orBXzVlfwYjZB0UuS
	LtvMJPh900K899E3CpqKQV5d/nLyHWSW17upWpVo/4BR97ECpazkFMYk6GVD13yAcfC7d
X-Gm-Gg: AYBFou1KV1cnDxZ6PV1griW5OlH1pSZUzzstqdVA6iJnYim7COOgDRqoQridm+U+Kou
	SCiVe0bymR4MLtZbB/MIWK4FeoCsVH8U2uA6zUYGrQ0Sh8p3D9BRDote2RzHLpcpfykf704T3ks
	YfrBvqi5ydj2JLviOde0nfqKcNA8vj1EOpkDRa5p0ibRwbp9Cl47UBPc3ESriTXyyYA9EKDxkAo
	c0JNNUBmEJPnR7Tz2fM5T5SsoUqXaMOUkv0eU5/kkqC6/T54JuboHOVp5qj1V7SHf2o6a1MuRGH
	5yWl+Lq0TlPiOfci1EzteSyz0Y7r7xeqH6BPlkaDWioBJ0pURxFio0FoKkJCr6nrvS69hNpIFpF
	E9+2WiBxD31DR3QmU899nV5cxsVtWSDjqsTm36w/+sHe/1UR930xFBKgaas/lCC6O3Tdnxe+nKy
	U=
X-Received: by 2002:a05:701b:4552:20b0:176:2095:1ac4 with SMTP id a92af1059eb24-1a6ce01d7a7mr2588371c88.18.1793183937047;
        Wed, 28 Oct 2026 03:38:57 -0700 (PDT)
X-Received: by 2002:a05:701b:4552:20b0:176:2095:1ac4 with SMTP id a92af1059eb24-1a6ce01d7a7mr2588322c88.18.1793183936324;
        Wed, 28 Oct 2026 03:38:56 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm8340186c88.14.2026.10.28.03.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:38:55 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:08:01 +0530
Subject: [PATCH v6 05/11] phy: qualcomm: qmp-combo: Add hardware-specific
 dp_aux_cfg2 and dp_phy_cfg1 fields
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-glymur-phy-v3-v6-5-1f1d2e565a66@oss.qualcomm.com>
References: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
In-Reply-To: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Jeff Roach <jeff.roach0@gmail.com>, Luke Macken <luke@phorex.org>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183900; l=6731;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=rMsGkUOi3jW+Cmzrcyr2oF4G5Pju1fC9P/6RDgMrr7M=;
 b=NS/n33FFzjoFjq93E5+emMcssjue2oUSgMEjfJW9h61gY6Zx50LedrOacqmg/0ngni7EG3h32
 fl7l6m48L7ZDeSea5sxfPH57XyEo+FOZZJDHHJ6gZDqQdlHWyQgNysD
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1d0c2 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=mO8_gwkcAAAA:8 a=AZ7O3MIRyL_cLquugRgA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-GUID: BU0l1zCtodahxBpD2dsFwBnXyt7ckKnp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX1mIP88JYovmk
 16W+tbI/vJY9rYvaDGecBAW7DHdg7WKF7nNAO+bGh2LBBZbdKwCDRXdsGYiuiJubmCKM46DNyVs
 tON7Ecag2RGKP8DofAaEviUSq75jt3s=
X-Proofpoint-ORIG-GUID: BU0l1zCtodahxBpD2dsFwBnXyt7ckKnp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX1uOuulrbtrJq
 GeAOMVAGR+cuyXzHmhtdSzOXAVViqZDCYWLiKw3TWLGoc4uARaof6JeNLl5jnyg416jLjabkqwi
 Cu8sC3IaQYegP80w5yCgtC0IomaXmCpgs71AcvGfN1UZ7Sb1IknVYFnmGSEHa7xBw9gpOlnCFbx
 lxEf/21jtzxKo86ukfmfSSZ82c4yevt8wle11IyzivHCNNeUPZTJ4ByyRMb9dMNhRlCpkWaLTrC
 ZdG7G+l/hJA1+tjpcTsQWnM0LooIYlv5gE8PJHF7fSX2KRtD19j6fbrev83pFdngfgwTvse/esz
 bbVi5W/ZfSuzMRkli73DKu2fTFYPiBpXlj1s+mx8aaLzYujeH3ivuOWBcfKQe4WUhAPaV4lny7+
 mwzb0U6PSBtPwK3NFX8QilWNvj0moPX7Kl68V2jqRSuMoYUfZVw8VwbPF7dz2Sdn2G3YocKSX9z
 JOEafTjX4UQifk4Hr7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add dp_aux_cfg2 and dp_phy_cfg1 fields to qmp_phy_cfg to allow
hardware-specific DP PHY register values to be specified per-platform
rather than hardcoded in the configure functions.

Define named constants QSERDES_DP_PHY_AUX_CFG2_V456/V8 and
QSERDES_DP_PHY_CFG1_V456/V8 for better readability and maintainability.

Populate the new fields in all existing DP PHY cfg structures:
- V456-based platforms (sar2130p, sc8180x, sc8280xp, x1e80100, sm8250,
  sm8350, sm8475, sm8550, sm8650, sm8750) use V456 constants
- Glymur (V8) uses V8 constants

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 37 ++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 062ee4397171..2a4cc45d6daa 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2500,6 +2500,14 @@ static const struct qmp_combo_lane_mapping dp_data_lanes[] = {
 
 struct qmp_combo;
 
+/* DP PHY AUX_CFG2 register values for different hardware versions */
+#define QSERDES_DP_PHY_AUX_CFG2_V456		0xa4
+#define QSERDES_DP_PHY_AUX_CFG2_V8		0x06
+
+/* DP PHY CFG_1 register values for different hardware versions */
+#define QSERDES_DP_PHY_CFG1_V456		0x0f
+#define QSERDES_DP_PHY_CFG1_V8			0x2f
+
 struct qmp_combo_offsets {
 	u16 com;
 	u16 txa;
@@ -2565,6 +2573,12 @@ struct qmp_phy_cfg {
 	int (*calibrate_dp_phy)(struct qmp_combo *qmp);
 	void (*dp_aux_init)(struct qmp_combo *qmp);
 
+	/* DP PHY AUX_CFG2 register value (hardware-specific) */
+	unsigned int dp_aux_cfg2;
+
+	/* DP PHY CFG_1 register value (hardware-specific) */
+	unsigned int dp_phy_cfg1;
+
 	/* Set if DP mode configuration should ignore TypeC orientation */
 	bool dp_mode_ignore_reverse;
 
@@ -2820,6 +2834,8 @@ static const struct qmp_phy_cfg sar2130p_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -2956,6 +2972,8 @@ static const struct qmp_phy_cfg sc8180x_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3002,6 +3020,8 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3047,6 +3067,8 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3156,6 +3178,8 @@ static const struct qmp_phy_cfg sm8250_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3204,6 +3228,8 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3251,6 +3277,8 @@ static const struct qmp_phy_cfg sm8475_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3296,6 +3324,8 @@ static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3341,6 +3371,8 @@ static const struct qmp_phy_cfg sm8650_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3386,6 +3418,8 @@ static const struct qmp_phy_cfg sm8750_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v8_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3431,7 +3465,8 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v8_configure_dp_phy,
-
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V8,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V8,
 	.dp_mode_ignore_reverse	= true,
 
 	.regs			= qmp_v8_n3_usb43dpphy_regs_layout,

-- 
2.34.1

