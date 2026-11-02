Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616144;
	b=3+8Ig9ZJBKm5P8FZJ8btKWOxH+PstCGTJcK83DBkgKEReupZfblfX4P5TrpXhUaJaOyD
	 gwICXovZFU/xd1M6C4S+WpIrCJl+TtTci7IALEmE1SfLkyd3bT6HPy7zp4xoBTm6Sl++n
	 s/oh+dXzT6mLMxyMY0J/CyI69l/evK5r1291i6MXkRKX5WJCjxx3bua03N/3sTgWTK698
	 spZCmhTZk8qJlC5fz/fZ5l5tzuzHAgzViKnwr5X2kEuan64AZjgQewook3c38jLk5xCe0
	 U1sX9ZYIvQ3QnKj4Py403FQ7pur8hZKg2MmYaKTdc+vfQVEZEn1WqyXUFc2MyMGnuiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MID0gSdRFYEtOdMRf2Fnw6acFNQMV+62kE4jNStcaWI=;
	b=aITg9oSMOk7EH1Ua+NAgR5PxDYz81tH5cBnkzHjLch3XK1t6ZRNQT2uAmQcgY5pOVuZ5
	 iAiaNJY9GzB5NM5qiPKWmLlwd0pg0uaAtmeNPPa9O6Jra4L1DAcS+fxHfAzFAC+jMd6s9
	 pbqKUcHNODjjVT2q2tVR9gHoK3xlyjqe5x4riOBnlUUf+c5fpkLBuyrGwR34NxqtCeCML
	 LMJiHZk/8NJsfMMvXim7iHa94LBipvNDPdUqykWeqJ8uJksuNq5JCfI3OUyYiwuW1idSy
	 9K9WTfPS3Z3x1HLbkMU8G+nyMPg7pvR/XXYk+1UXi1DYfUEQeM/C9zHc9ZwS72kV+dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pJUbaKvP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqGmYOtZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B6160A2617
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98B6160A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pJUbaKvP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqGmYOtZ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A7uZ214022
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MID0gSdRFYEtOdMRf2Fnw6acFNQMV+62kE4jNStcaWI=; b=pJUbaKvPrrcSeGWp
	Fpdcp3GwLwIwJTuFEuG9cwnvINisD9IPIgcsII4SdQyGFX9xf6HahdObMi4g6XWu
	wcZ5OvC1vRXtFTk4RRwKgz0qz1Ycdgs1RpNX1/UQse7ItspMfZJwog593Wee7XZX
	xn6gICP5YSKNdURe/zwvfw1Jg47C9rR8bBJ2ap2E5ij9s+aAskQu3tJp7yEUKeGu
	ssg0XeQi6Kd7aMddybhXfM0lAq1PO2JMvg6C9W6AJZmu6N3qh52lqccPTQehqD1g
	9X2Xlz3nmcWG9ofUdq/unY5FE+Enb/Kb5WmbCyqAuTnQQERt81mgY4MLQHbKtOeb
	7X7k+g==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1s6e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:42:22 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c734afb8deso3645120b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616142; x=1794220942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MID0gSdRFYEtOdMRf2Fnw6acFNQMV+62kE4jNStcaWI=;
        b=iqGmYOtZXJo/+xupZeV8JrfLw973pMHZB6ERSEAK0C5ZZif2Zs4tFyoK7DHV4UX8NT
         Qocw7vt0Xpkc+tHNeWK5E/0VWiOsiv9O8cLH4GPxGc47nF6QX8GEOEs0byB5sksmYzoU
         AojvrRfXDqFb94lmYQDjPAwWS5ImsXLzhAB4gj+RUgk46g5NzSGFLJ0m4tajiihR0HNt
         jHm7y+DdlR2Sw78UMjjlxwHucZMoEErpaky8HThBa0F89b1va4A4RteKhpmC0v28+93D
         VkmB69g4DsU5IEenJP1GDtjaCmu9hTl51/KECaMCVeNYUSbBp5lIKn8F6EVF2UktSq8O
         RRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616142; x=1794220942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MID0gSdRFYEtOdMRf2Fnw6acFNQMV+62kE4jNStcaWI=;
        b=whk90GeU+40uyvKZnCj1i1I9Us6BKHFNNHFy+h9Lo/o4lykESqOSQjVVJLq+1Hj7eB
         RHa/aSbDroY36zWgJOZDNT7SyujOi/iE9B7YdzRJHcJsMDDkF7O6NVbB+XmtovpClbuv
         I6D0RdSIGP1qO3EqBLRT2VYFmj0KCTsGmsuJNjlkAs3AiHDq+DYy5b0Tb76W28udU7Gs
         aDRHRZ95uHx52eabNeDpJMN1noabY8g1hN4iCTCKIYhpUwh4E4ntZ75tlWNFLs16N9cV
         oxDnz2LmzU9yEfSidsJoUygV2ukLQbY7JgPltsoiiEdrfO37U9SvoXs2+Ll64n5d4bEl
         cHZg==
X-Forwarded-Encrypted: i=1; AKwUvByzgI199sUH4OoMNrV3zy59IQcCi9J67WDWf75u4zyV8jNk93GBJAKGZAQIno9gsA1Bn0xy5/Cp8d2V97ey@vger.kernel.org
X-Gm-Message-State: AFq9FYKHmzFK2uLhK7J6/wCLgFe+kgQ6MJuAGqnU7imydJZ0snNeLyhE
	iGha01VsiKBj2e7o3r+/ZMWRmXavtU+NbEeWQDdjh/UEFZYPpWy3fQ1239EPx7NMUv71j5fgWRx
	ZVsj+wLmB5r6Cq7iEH7rw9mQb9pBb914/wiWL5Rp3QlNewYfC7HIdkhBrnmVi9/BBYzhwz/khBQ
	P22iU=
X-Gm-Gg: AYBFou0xrUMql9FSTz/LGuWhN62NMqgldxC69NlKkCT15jd9Dx1oNm8Zfb2R/DNtqZw
	9q9orLTJ8Q/8xE32tjLfiwyiE1TQvg51oCfx9dQiaeVpljxJwdbzYIzdlp/bGa4a3jfdJtZXVr5
	/cAhlXj/V8Md4xgcR1BzwQv/m1ugMM1oeOp9tQ8NTx2uyq5CBNxCcJxHbgMKHzlkMQ2IKVhOdQC
	ErW4AYCWNF7VpGUggjT2pbt3UL1vDKsULmw7Iqzr1XEf0LgiWPuhcmLPEknNwIPAfG8lSu4Y7nw
	w7EGq8/njrg9DoF0ScpYOzjYv2PmymqCVdpZg3T3hSRnwLSC3gHkbh/LBlz3DF4eadD238RPEWI
	CzQPH0vFzm6077Q03Ct9hDrg8c6LTkt+xY0mIyM6KVfEtiIIDFJ2dut7zU6UKf8M9R+Xl86JPI8
	sbaFOU8vaLwO90E8vIyi230cKHQkmcgdA4gQeQyUQeCLsaMMK5ORVKuYoq4nA=
X-Received: by 2002:a05:6808:6508:b0:4f3:36ff:e521 with SMTP id 5614622812f47-5640df1c54bmr5861966b6e.58.1793616142092;
        Mon, 02 Nov 2026 02:42:22 -0800 (PST)
X-Received: by 2002:a05:6808:6508:b0:4f3:36ff:e521 with SMTP id 5614622812f47-5640df1c54bmr5861941b6e.58.1793616141658;
        Mon, 02 Nov 2026 02:42:21 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:21 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:11 -0800
Subject: [PATCH v24 03/15] phy: qcom-mipi-csi2: Add Kaanapali support
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
Message-Id: <20261102-kaanapali-camss-v24-3-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: jxP_K8eiEVRBsLJe83Tvpqrz3_so_dNr
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8690e cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1e3Zegj4IIqRqDCgfwkA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXwEtCdzsDgc8j
 r90lA1UCeFezPuzYyGrHCBnWJTuPGiAASGDjju0pEO5EYMn3PB0QkGBvmfT3UM6LYXiLihH3cLl
 ABwgs1bXvn5PZuLdURx5mIoiO4GC0XmT6Ow99J/wLVInVGVymDTxZMJ/oBIFaYU3IrBbBDNGfbJ
 Oxx1Lue1yN58JtOEh6LRDffTUmKaDP7CTpYp9J0EmdzRAJOvLE97nGCc8e4UOgz/U5u/jGjGJ8X
 d76urOzB3iYGfZGiDVGJcFnrLsgqfFjBlNpA+7Rkm2CLJNd4wJl0SWVMn0KA2e1rBjoRJ9IA26c
 S1EDRR+I7Q4XNUthI1cGUfcz0PWTH2f/JSAKJeaTwBgck9miA9Xa0ReyVfuA+THd9ytkNn1hEmx
 j6cKw77XM9jwM3+hv+hPzT/3FIEen9Dmf8YfLTFHlKknHZ8cOLIknHhktyT5EA1iQYUhEggu66X
 3nnscjpCTFq0CsXOXOQ==
X-Proofpoint-GUID: jxP_K8eiEVRBsLJe83Tvpqrz3_so_dNr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX4XUQGh+CZVc6
 luvyIBx8xQ1lV1kDv1pH9WK9UPTKjk1h56ZyrSWYySC8pXlUge3xBYessy0OLBpJ779NDo0BPsr
 WFdF6J5Pq6VGpZQFUMbAXusYftXreVc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
driver, including the Kaanapali common status offset and power domain.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 3 files changed, 18 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 8cd331cfb4b3..ed40934d67ea 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -374,6 +374,22 @@ static struct mipi_csi2_genpd x1e_genpds[] = {
 	{ .name = "mx", .scaled = true },
 };
 
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_x1e80100,
+		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
+		.common_regs_offset = 0x1000,
+		.common_status_offset = 0x138,
+	},
+	.supply_names = (const char **)x1e_supplies,
+	.num_supplies = ARRAY_SIZE(x1e_supplies),
+	.clk_names = (const char **)x1e_clks,
+	.num_clk = ARRAY_SIZE(x1e_clks),
+	.genpds = x1e_genpds,
+	.num_genpds = ARRAY_SIZE(x1e_genpds),
+};
+
 const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
 	.reg_info = {
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0..941f8b920b1d 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -443,6 +443,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
+	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
 	{ }
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index d6366f809e51..832c8d048b77 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -93,6 +93,7 @@ struct mipi_csi2phy_device {
 	u32 hw_version;
 };
 
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */

-- 
2.34.1

