Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905217;
	b=qqJdHQiJT3vCUmdwR4kgMJoujzDntYiXuyTcciXqU3g5VQnZ0cgp8WnxsvrbJUnKwY3o
	 NKWkeOTnayvs+eGfnLnDroIPGONavzTvq9K/2NKVhwzXPzPA9CPBxDHR7zgKr2uJDimoU
	 1FaJ4dJCQpqV7zbxoxkfl23/aJmA5usq164JeBp70oMOmzDs9VfGgIqxhbkMOrXY8qvui
	 clI9u7jF0P+yAbY19Rn5UUENqlZUzd1SRZtEJQh2Cn3NsdsASrsA8aqpdFKHxf8B2Od+f
	 mI9V8GxE6s38o7LV3x4LFN5UhF/zkqkxxgNdcwkTmq4e+w/1bHY+Lla1kRqgaRAawTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=;
	b=ZYaTSUrLKgHzyMVuZPrPEQzQVgYs5pbA5hP2QaoZsWxLSVFlYoNmVQTfV7OHnS2yjnce
	 Kh1NwqoxyvMb3BVKfRzpp17yOI29j65O6mrEz2OO3d2EAGMUCHulmVhgx0tqLM+OMJ7rE
	 wJ7o5tjDlb3i2IPXMQEgYDt0GaceA7pDlWcyvkhXZ2hngNEERLu0A4jiqx59VBXwbFOGt
	 XVcFzTN5b5jrWXxSHTefXUwQA851uFn0delvJdlnocsUrtMFOCPOXXKxsK8jXyfUf+zqa
	 rVRnI4xvcaKZA+CnM4i7sJKuvzh4K+E4kzQmaO5LsLsRjsqIhAtYKLSYpaM4pBk/NyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NrY26mzQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KgRakVzp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED18360A2601
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED18360A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NrY26mzQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KgRakVzp
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6LrwX3980793
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=; b=NrY26mzQEiC4p5OS
	QrlLTzR7eu+G0a6BDStDdlA6yyJWltOfruzJ5X9OsWQi/RdQaUxQ3GSY93axuTN9
	xOHelC4J0oZ5xhUiool4Uude2cu6gT0HWJ9um6drPk0y+4gHAHKyBl92cXAsr6sO
	gaHSnuvgB0ha8P9MyjqsuCX/zCJPmbDVIRnvkvqbhmH4SIiW16ASEcXlWq+u28+A
	9ojJOzNMro5o3ojWSuUhM/z37achDooJVyJ6N8tYBjf6r2ajKg0MgsEvusWwXbth
	SdMyEAJ274Ix5Uwzt3oxBjg2nt6+JF/TkYeVkF5756I6dzi5Sx1mpkHD+m+l6i1Z
	s2w25g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd0hj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:46:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b60129a46eso5603562b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 00:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905214; x=1795510014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=;
        b=KgRakVzpMfwbA8NSA2GXLqOZAAA0Pi3a3e2prrO6SFcrLj2vxT7fS+gNq1jm5Mb9pS
         nr7+x9jikZ1hAdNsa8zKemRbt0/gqOv3cYSOJHu8x2c8k8zUIqyR/nk/5ZHFIqCPvwqo
         tijL1bNcc4tEzTdKFi+XWJF6MQOnuEZJ275yIA15WD12vVhw8O13dqzLdEwpEHNbJhpX
         cYq0aKGWGxIwMumXHf07dZzwAlX3gAjf5dIHquvy48LhJFmCRpRpboP4erua2uGJM7lO
         T2COuGiBT3JyVF5MrvEqBsU+ooXWhfKJ7fiBBwNa5pL3PEUJDCaREXgtTLfQCk763JNa
         2PLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905214; x=1795510014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=;
        b=C5Cp9nM62WRptMICk3+wECUQBR7O3GvpLlRCn+3ghBzIrLp6tlU+rZ2VFV6A2trPHX
         D6F71a988YlBGkADcGJ3kjvBe174z0fnw9I+BtZ+9dPiq1Ijx5lj2DZ5111wyKDbG5wl
         AKK03EWBYx1BaYj7LeW2mrJ1pUuiR7G1lSBZMPcUDBRsz7/hPv5zrMsrWFGI1Mu77PnE
         PEOyfz34XX2Q7VZbrbtnS37rkJyAH5m4LIKUThbZDAunYrdXt4sBQ6Rk+8vujnw24cb2
         Ja5Qrks+7//QHW03XlC/jSW1Pl9nfSoIIPv8TPicMMokQx05CXF1g4UtUyxa7291RwlY
         r0cw==
X-Forwarded-Encrypted: i=1; AL+hErGSkmG1behKpePLXj3qrRGJMYi/w8pu16SZpB1723gfwC/dsh/t67vrvcsjrZz4zWM3+azMckGITKCizO3+@vger.kernel.org
X-Gm-Message-State: APuU4Z/oRsOm9s42OdhsftZIEdnYYErZ6CCBklQh45KbWmhUdYMZDAFE
	OhxOnz1DjG6i/M2/158SL9dEecjVwGfOnXPp4f79Zm3LCt2nCW8xkt5+3RfPPYPq1C0ED1y3go1
	Ed7Zk+ZCLAWkSrO1JkPbLN2EdVS3iMlywBphIulkKT4EyRQZfxSK32B/vlGD3ZBKWVFAt
X-Gm-Gg: AYBFou0V18cEjlmW56sas0kvZtmCaSf3ITGi1pbQ7FMZdaehvR2jq+9ImJFNhxa5Cmc
	AO6J0dlyt6GMqe4Z7Wz4Zia8d5jbVXsM0hBpIhg8mPZ160U9tDyH2le+zf37PTXOSbWlcGpnjp/
	h3qewcxYrb+UK8HLxaPSiasw5Z+mlR281OlwZmXp/7JRmXgebNETwUTTQXCvylj1LfirBH7DxtH
	Z0XtZxv/4ZMCCEC4n6JjsE6jecov2bIRbtv9zw1aH+GBcO4O7ytRN2D4xjXiUPmgrsXCqV2m5IS
	7cSYGVGNep1zFXStVP23yO63ewcBfhhhhAE3qDpP4Z0opRF6NBOwSCZzJpLBxNm6Fox5+7Wz+/D
	i4TRC2FjD5rsHozZ40UxvYbbeJpwBT2VKCg5Z3ctk+2yNR4jFxJiDUm+Os2Ajzw7VHvq9NVuPem
	41Jg==
X-Received: by 2002:a05:6a21:9204:b0:3fa:64d4:c0a with SMTP id adf61e73a8af0-3fa64d40e8bmr7092190637.56.1794905213710;
        Tue, 17 Nov 2026 00:46:53 -0800 (PST)
X-Received: by 2002:a05:6a21:9204:b0:3fa:64d4:c0a with SMTP id adf61e73a8af0-3fa64d40e8bmr7092149637.56.1794905213189;
        Tue, 17 Nov 2026 00:46:53 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:52 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:27 +0530
Subject: [PATCH net-next v4 07/10] net: stmmac: qcom-ethqos: share common
 GMAC4 address table
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
Message-Id: <20261117-shikra_ethernet-v4-7-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=4888;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=n+OVBcpYDnfu1RAZNpTORwUsJk5/4Iz/XkRVvIn0LX8=;
 b=U0W33hjrN/xoSEpZUs1mBMAieyrO6ADIruqEMBfhJQAtg9FHals35UP7LllUCRBIJs2QGASlA
 BADkHSDqHYcDqu/Vh0Cgae7f6aUXUnWpw6HwAu6F4RhjdjIjqI8XA8h
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc147e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=koHM5ydvv4bFC7S24qUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX2JjXriT3/D3O
 KMlZssT5ywV4X3Z6AjZtf7Ua9ecuSHOB3fQzLyBUwLaSs3WPSsNabOA4RaLGxW7UvWf4Muln1cp
 bo8Az1K3eL9vZgJnFhXSPDnNPgVGisA=
X-Proofpoint-GUID: 7FZcPO6OPmWuiGi2rB1Cm-lRW_e1Q4p5
X-Proofpoint-ORIG-GUID: 7FZcPO6OPmWuiGi2rB1Cm-lRW_e1Q4p5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX3biQxJW/+HBu
 dlqexReS6HA3RykxmzvpNXBx1ERhK8EP2nT2tnwEjBk8UwSVHscrMVLQutXaBuD4Wl2EdO5azBE
 nxThi6SBES5YLsi8vnNcFfRwJHdDGQGv2vY3CyLwK7Xpr2XOeFrmcQ64HOD9xRxO/cJT0fBhsnf
 FDS8ZUk5RF3ek6BM2cC2zoYsjd+tukOhKDN5K8DV4cKuxZ9lp9ERUz2r9DxLG1ltYllc1YeV+5a
 8OGKLeTT8rm/DUmqit1v4H6tMFDia8Y40WzeEEDSAc42kF8w1dADwhgszKz6xK0eyr1EYtyDntt
 eXswg1shqtMt26zQyLxqfZH98N9B+IEGWfPufmVcq4t53DXjuCsJ4FuIkQfwK5Xr/sAr73Crvq3
 fqnTKskrDs97Vmo58Jx+l5kNMYbFKtHg4EhbIwpcHXFBdRPEB+p3iC3plHbcIWSZD5dolBoyyvs
 pazV+kiOKKumoeQ6OkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170034

Several ETHQOS versions use identical GMAC4 DMA and MTL address offsets.
Store the descriptor once and let per-compatible data reference it.

Use its presence, rather than has_emac_ge_3, when passing it to stmmac
core. This keeps address-table ownership independent of the feature
flag.

No functional change intended.

Suggested-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 74 +++++++---------------
 1 file changed, 23 insertions(+), 51 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 192788e00dfa..bc443793539b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -100,7 +100,7 @@ struct ethqos_emac_driver_data {
 	bool has_emac_ge_3;
 	u8 dma_addr_width;
 	const char *link_clk_name;
-	struct dwmac4_addrs dwmac4_addrs;
+	const struct dwmac4_addrs *dwmac4_addrs;
 	bool needs_sgmii_loopback;
 	/* Fixed PTP reference clock rate, used on SCMI platforms where
 	 * firmware does not implement the clock protocol allowing linux to
@@ -262,6 +262,23 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct dwmac4_addrs ethqos_dwmac4_addrs = {
+	.dma_chan = 0x00008100,
+	.dma_chan_offset = 0x1000,
+	.mtl_chan = 0x00008000,
+	.mtl_chan_offset = 0x1000,
+	.mtl_ets_ctrl = 0x00008010,
+	.mtl_ets_ctrl_offset = 0x1000,
+	.mtl_txq_weight = 0x00008018,
+	.mtl_txq_weight_offset = 0x1000,
+	.mtl_send_slp_cred = 0x0000801c,
+	.mtl_send_slp_cred_offset = 0x1000,
+	.mtl_high_cred = 0x00008020,
+	.mtl_high_cred_offset = 0x1000,
+	.mtl_low_cred = 0x00008024,
+	.mtl_low_cred_offset = 0x1000,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -276,22 +293,7 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v3_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.dwmac4_addrs = {
-		.dma_chan = 0x00008100,
-		.dma_chan_offset = 0x1000,
-		.mtl_chan = 0x00008000,
-		.mtl_chan_offset = 0x1000,
-		.mtl_ets_ctrl = 0x00008010,
-		.mtl_ets_ctrl_offset = 0x1000,
-		.mtl_txq_weight = 0x00008018,
-		.mtl_txq_weight_offset = 0x1000,
-		.mtl_send_slp_cred = 0x0000801c,
-		.mtl_send_slp_cred_offset = 0x1000,
-		.mtl_high_cred = 0x00008020,
-		.mtl_high_cred_offset = 0x1000,
-		.mtl_low_cred = 0x00008024,
-		.mtl_low_cred_offset = 0x1000,
-	},
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 	.setup = ethqos_hlos_setup,
 };
 
@@ -312,22 +314,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
-	.dwmac4_addrs = {
-		.dma_chan = 0x00008100,
-		.dma_chan_offset = 0x1000,
-		.mtl_chan = 0x00008000,
-		.mtl_chan_offset = 0x1000,
-		.mtl_ets_ctrl = 0x00008010,
-		.mtl_ets_ctrl_offset = 0x1000,
-		.mtl_txq_weight = 0x00008018,
-		.mtl_txq_weight_offset = 0x1000,
-		.mtl_send_slp_cred = 0x0000801c,
-		.mtl_send_slp_cred_offset = 0x1000,
-		.mtl_high_cred = 0x00008020,
-		.mtl_high_cred_offset = 0x1000,
-		.mtl_low_cred = 0x00008024,
-		.mtl_low_cred_offset = 0x1000,
-	},
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 	.setup = ethqos_hlos_setup,
 };
 
@@ -336,22 +323,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.ptp_clk_rate = 230400000,
-	.dwmac4_addrs = {
-		.dma_chan = 0x00008100,
-		.dma_chan_offset = 0x1000,
-		.mtl_chan = 0x00008000,
-		.mtl_chan_offset = 0x1000,
-		.mtl_ets_ctrl = 0x00008010,
-		.mtl_ets_ctrl_offset = 0x1000,
-		.mtl_txq_weight = 0x00008018,
-		.mtl_txq_weight_offset = 0x1000,
-		.mtl_send_slp_cred = 0x0000801c,
-		.mtl_send_slp_cred_offset = 0x1000,
-		.mtl_high_cred = 0x00008020,
-		.mtl_high_cred_offset = 0x1000,
-		.mtl_low_cred = 0x00008024,
-		.mtl_low_cred_offset = 0x1000,
-	},
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 	.setup = ethqos_scmi_setup,
 };
 
@@ -999,8 +971,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = ethqos;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
-	if (data->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+	if (data->dwmac4_addrs)
+		plat_dat->dwmac4_addrs = data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (of_property_read_bool(np, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;

-- 
2.34.1

