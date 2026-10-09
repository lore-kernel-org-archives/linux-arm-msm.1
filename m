Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C4F497B61
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 08:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533534; cv=none; b=lXeUwoQtUZcVL+EiTsPFa4kGzxwECS+0ovlltuTIvjWkEAwClQ/+mJjR6HrHxED/70aTv2KyjP0XJAYGf8qmysXkIVjbKTs/T6v+4sJhH5+x41sFu9ynFiyTW0eUzirD9z32zUnIwEQ22ehpUW2RYtfvIz0pRsislnCPfOlrtEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533534; c=relaxed/simple;
	bh=rTCST+7sqBBrq6ruQYxtFTmrHfOVNRBFiHZW+TJjlpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AqIPaLFhFmjCT/gOZ4tGlTBMvC842RH2RqynCn7Y6mXPQOwe/vR/ZZgrBh5hNupE3G2Y0EUqTxfxFcmMLiUna6PvaFCRjWlfxYt6UPSpTahZw2rsl2zHq8luvCL57hTSxvvXa7yTM80gOEu7y7e23RolINYAK7EyASxDGpLWGok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pjL3rOr7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TV9sGbMq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pjL3rOr7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TV9sGbMq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HTql966602
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 08:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z1HW/reaPNDDv/4OeWQwL4+zw64Lrh92bcsok/k8fIY=; b=pjL3rOr7cyMf2P95
	UylCGWu0JG+9Y37hJjTauNZBili5JiL2ZnO41WR6WOOMS9udYSstj8mrA9V7XZlj
	HTZG3nEpJmwcq5x+7z+uuGXMBfFP8n8DeSAO5PLIPLJDhSzm4lKW7pX1M2r3NDTT
	jYofeHQzcONB1O5+CMDOc1EnKuTHwA71lQRzW2zJl0NlcTKpY4XXFJqf7WLCMEVQ
	qzG+SQcIhwp6RSKLPw+9BQ7hRLbwV4wVGTa2wubeobmD4VqwjlKxMZWw9Bg//AZI
	y8V9WVa9elHmNHWP4FDzfG5JowvcSlcZginCyO7fqTmnUTWcStorbqa2z1VkdnlM
	ERbyQg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj2k6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 08:12:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so1307060785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 01:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791533523; x=1792138323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1HW/reaPNDDv/4OeWQwL4+zw64Lrh92bcsok/k8fIY=;
        b=TV9sGbMqtZqk0jD7uDR9vuGg+mJfesjtl/46P1TmykRrByfgvl/U1jitHKhMFgS9Qn
         SK2+oCPT9Ao2uoUSemSO3K1B8SLXFgct8S5PKYVAmi8YsN+ttwxoQNhfW2Cif23aa28v
         kxfY8kg4aKaPeSZ0Zo0yMMb0WxTfZND7YQ257RG3PSsXBDwKoCIvd0iIrZKvNZ4A4sfA
         kDh25Yd4wqylt8yizwuQp82z0uNuphgXzr+yXpM42X/GMJ+AYdC66ZPlkFAzxglD1QV1
         juN/2ALg8TAgEejV3RKU5k2PAYI+0grO4Ny/9qbfrDLtGUlbclmyjoH0+DFHE/hJXlWW
         RVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533523; x=1792138323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1HW/reaPNDDv/4OeWQwL4+zw64Lrh92bcsok/k8fIY=;
        b=XZUNgO6xWZ8mwcCUc/nOVXBYOG8r7mWq+kCW76Fh4qSbpkquRh14LxedX+D83D2BNJ
         0VONg6nwRluUUzsOq/jBbnCm006VuBQkBpOQQQBEd5OHBoGl0SLOfn+sTfkb7ztinyaD
         y0MuRODub5mQtdwrDe7S7O4Cj7PJtc0TXBBiQWwsXmKdqqCeswBDvU+jfCk1vcY2tMJF
         Oe67qD9M0ZE31H24/k+ESbw679Ivic/Zrp3WnTdqtmfBVZPh/xXiJSOs8wMcN2UaIBgY
         6eayFWWpJfS/uTHTGCSYZj4bwmfgB279sZYqzvQtsX9h2v2qNg43hw8aX/UNd6aDC2oE
         3UOw==
X-Forwarded-Encrypted: i=1; AKwUvByk9KlYC5LV0qFIHDe4i1ipNvv72Ivcbn2PE1a8UEGQzZUJMC+SSQfsuCfqjbIAjH1gzbDyEQz6Y0OEsYxO@vger.kernel.org
X-Gm-Message-State: AFuF++le6GYSfN3TT6edasxVVMS8HjEp1JEYQ3nPNjBNqdZMOqfItGa0
	8UocSrdTVky145nAEUL4iBL+WmhIuHJwww+ytgdCHn7dJtbeAsCx0JcZEtgd7Ldtx5kszjeJ0O4
	XkxguRqECfZ9GoLKPx12SlRHuUbzLBXNKSgKtkIupulmvVqJICvjo/V/E0qS4B6cpWQEV
X-Gm-Gg: AYBFou2UQ+yZPqpCQKAEoS1YawTRlnOD00GcHsIJu9DN0Sjo10q4CbZ4OvUXh9v8VAi
	WP/iuIgZgbUQH6wwhDhFn4HAB3KsqJ0ud40baJ/D6zhGXlsxKYZqc/a+I2BGiTJrvqg5KXev+4F
	dWCX4ke/9Iikr8+QIChNc+qxF4+hTGLWZlgQzJ045d/Oh6VOelLeXbAhu/6DMNbusCxtNTKjy5y
	nHcsQR/St/PDV6vdVosVmBQgbrddn+8vHGKq5vVQrBp9yz1u9Lrev8/Hr7xCA/WyOxMhfpWxqWq
	1QOAhVNz+jEDeJwUVD/CoGgYEWaI7G8mJeCAZDup1nr+sEREGE5X/9EgPqr3UXYqeM72GSma9CK
	BUpfeehlHqnVwMrSgpoInOBVwdf+QbxM0bBtgPmkXWiqGmdcUUTArYskBKJerdWcb92I7
X-Received: by 2002:a05:620a:46a9:b0:93e:62a4:be72 with SMTP id af79cd13be357-93ebd227321mr154087385a.24.1791533522950;
        Fri, 09 Oct 2026 01:12:02 -0700 (PDT)
X-Received: by 2002:a05:620a:46a9:b0:93e:62a4:be72 with SMTP id af79cd13be357-93ebd227321mr154083785a.24.1791533522382;
        Fri, 09 Oct 2026 01:12:02 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb986c0c4sm130780685a.18.2026.10.09.01.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:12:01 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 16:11:22 +0800
Subject: [PATCH v5 3/3] media: qcom: camss: Add support for X1P42100 CAMSS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-purwa_camss-v5-3-58c13dc7c4d2@oss.qualcomm.com>
References: <20261009-purwa_camss-v5-0-58c13dc7c4d2@oss.qualcomm.com>
In-Reply-To: <20261009-purwa_camss-v5-0-58c13dc7c4d2@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791533502; l=9264;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=rTCST+7sqBBrq6ruQYxtFTmrHfOVNRBFiHZW+TJjlpM=;
 b=A0xGAk0HhnXsQr7RBdGNHSdrkIL3uZ1/iDhNqM8/f4C/L0Q3oJ+KmaFqWDptBgUcV2MH76e4/
 N30NSrGTgqxC7QV84OW7gcrvCTeZkSDG+dvnDg25DBxLm10V2NDxCjS
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac8a1d3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_EnZp5DVjqLkTwXhGVAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: nQfQ-dEB14eq9GyxRKITKOX4mmcSLHYE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX0jbtY3IfRQ6v
 6MlZUxY2NJ9cNpHn50/+f0cFnd7VnHItyt2vtD4gicqAZBo8r/LMsNwUgv5ykgNEd+FR4tQ2QqQ
 H2x5tz8jVwIOYC4Y5mJUbs7iuF60+t73hyK1/EyGNvrTtClKdo4hEkpeQcVSweUzNd7abfhmXuH
 wDUuq6HhIiYbwKwYNO7DCWWVPsfJ2p4njIIzJDQHxXdc3acemj8zT5/ZV60B5NZAtUrcr7Avb8P
 amcZrurigMJzFXFMGOToR92DADYUGbp57KNgxx9ItB/IaG7m7mDJyFAoWtQI0VES32EjbcAYohe
 F3NE7xDK6faW6EH9TBiMv/RwKMSAuG23DOadLRElfUeaZXGLurASjBvadXh4JOJVwTTtzLzVcsR
 wzBVD4XlhexN+ST5qyPXSO0C12nBYq+/ZT7MckY+Do4TVzJ4iSzkYQ5rdnG0al8xgb0u5rBVRN3
 To1GkFdEBDU+55js7Rg==
X-Proofpoint-GUID: nQfQ-dEB14eq9GyxRKITKOX4mmcSLHYE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX0aE6InTe3PGE
 0XKCa7B94fsgdWFNIDcETwqTs7FECRpL5v1Y5tbHsB8CGMBBysw4oa15jM7gyjT88ZMKZclBIfB
 8C2ZbKmOGounkpOkAISjzGn2GJu+ybE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090032

Add CAMSS support for the Qualcomm X1P42100 (Purwa) SoC.

The X1P42100 CAMSS is a cut-down variant of the X1E80100 (Hamoa)
CAMSS. Compared to X1E80100 it has:
- 2 x CSIPHY (CSIPHY0 and CSIPHY4) instead of 4
- 1 x IFE instead of 2
- only the ahb and hf_mnoc interconnect paths

The CSID, CSID Lite, IFE Lite and TPG blocks are the same as on
X1E80100, so reuse the existing CSID/VFE 680 ops and the X1E80100
TPG and CSID wrapper resources.

The CSIPHYs are handled through the PHY API, so no CSIPHY
resources other than the lane format are needed.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c |   1 +
 drivers/media/platform/qcom/camss/camss.c     | 215 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 3 files changed, 217 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index b1d9fe0010e119059c539c20c238c3e050ff7036..81cb4377586994727006d0ec83e53ac57233f765 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1997,6 +1997,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	case CAMSS_8650:
 	case CAMSS_8775P:
 	case CAMSS_X1E80100:
+	case CAMSS_X1P42100:
 		ret = 16;
 		break;
 	default:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a98fc6a20fdb8e0f9f8e61bc41058..5f0e5cadc06d51e16668d23ef9a3d8f13be81724 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -36,6 +36,13 @@
 /* Top-level CAMSS version register */
 #define CAMSS_HW_VERSION		0x0
 
+/* CSIPHY resources for PHY API devices, only id and formats are needed */
+#define CAMSS_CSIPHY_RES_PHY_API(_id, _formats)		\
+	.csiphy = {					\
+		.id = (_id),				\
+		.formats = (_formats),			\
+	}
+
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
@@ -4452,6 +4459,197 @@ static const struct resources_wrapper csid_wrapper_res_x1e80100 = {
 	.reg = "csid_wrapper",
 };
 
+static const struct camss_subdev_resources csiphy_res_x1p42100[] = {
+	/* CSIPHY0 */
+	{
+		CAMSS_CSIPHY_RES_PHY_API(0, &csiphy_formats_sdm845),
+	},
+	/* CSIPHY4 */
+	{
+		CAMSS_CSIPHY_RES_PHY_API(4, &csiphy_formats_sdm845),
+	},
+};
+
+static const struct camss_subdev_resources csid_res_x1p42100[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		},
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		},
+	},
+	/* CSID2 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		},
+	},
+	/* CSID_LITE0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+};
+
+static const struct camss_subdev_resources vfe_res_x1p42100[] = {
+	/* IFE0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "cpas_fast_ahb",
+			   "cpas_vfe0", "vfe0_fast_ahb", "vfe0" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 345600000, 432000000, 594000000, 675000000,
+				  727000000 }, },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
+			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 }, },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_1 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
+			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 }, },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+};
+
+static const struct resources_icc icc_res_x1p42100[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -5809,6 +6007,22 @@ static const struct camss_resources x1e80100_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
 };
 
+static const struct camss_resources x1p42100_resources = {
+	.version = CAMSS_X1P42100,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_x1p42100,
+	.tpg_res = tpg_res_x1e80100,
+	.csid_res = csid_res_x1p42100,
+	.vfe_res = vfe_res_x1p42100,
+	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
+	.icc_res = icc_res_x1p42100,
+	.icc_path_num = ARRAY_SIZE(icc_res_x1p42100),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_x1p42100),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
+	.csid_num = ARRAY_SIZE(csid_res_x1p42100),
+	.vfe_num = ARRAY_SIZE(vfe_res_x1p42100),
+};
+
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
@@ -5828,6 +6042,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
+	{ .compatible = "qcom,x1p42100-camss", .data = &x1p42100_resources },
 	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0dc2ded8e4a603d6cfec4d8e6a62b..523050295209d84e7f72f54bce9a96ed9df442aa 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -97,6 +97,7 @@ enum camss_version {
 	CAMSS_8650,
 	CAMSS_8775P,
 	CAMSS_X1E80100,
+	CAMSS_X1P42100,
 };
 
 enum icc_count {

-- 
2.34.1

