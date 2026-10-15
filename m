Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC3D52D2D9
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071339; cv=none; b=hfsQOjhtA1gT47mFNUDouLk0e92pi5l43uUg7NxCHUWdBb9ZXgUv0W8ZbyaTscX3hM06nUtC/WzpQLPuoGeAbRGduqD/N1891zsAdBD0557hj4hlu+avzsAYBgDTvaO0OS2KB2hQiPKEBdTAPZm2Y2p/eSIFk0FXImefQjZtiSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071339; c=relaxed/simple;
	bh=dt3WAmmD9fsSJCwfPnXNxdleKZCCqAAB3XpOQXy6mVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A5n78KdUPqhFIzP5TNslwRp+VmrOpps86ekI57z+LwE8nIrYoozRITcA8XoOf8zS3qn48W/ZpJ1h+u7+2+mXKKicZH35VRkU6Uiip3oVmsMXSu0kL5w3itA5m1cv8u1pLWC02tcO71y6OhNoo6gxGh0w7YqPGqQlRH4ERXPncpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDIp4efM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HmBAoFXQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDIp4efM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HmBAoFXQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jpnw3408892
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3/HshOl9GEqL2i7rNuzJco4AlqLUiGFsUMhKpCILovE=; b=hDIp4efMJsCCuCF7
	Fq03dh67foxicLtRSqwtPxD8q6wlc9Gow/LGlyh1biSj6XbckyDXUWkKyqW64oo3
	GCqlJfsAIVIos+pUZfqO8znzkG6/UrLfVE6T8C3Ibxl1OBHHjWvTpfEXorB4Gb4O
	Wdzhg7bSN3rRObIZggbX/Jy/PX1SN0DA/sTi8dioXv6SWMtOv8NukT/yvgBMTsyK
	Pprge7w8hiypTD2bbTrpd2RGGDjCcAz9nj/sAYhMQ1SiJN/4bJ0Fa4nP4qP4tr19
	YWtL1W6NBxmuPFrlI9BNInqnUphXKHntU9LJhPjuKu2lv9ya3FsoDDbdHMyvZzbM
	5OBqlg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn2yyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:35:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-898f641684aso6281822b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 06:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071336; x=1792676136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/HshOl9GEqL2i7rNuzJco4AlqLUiGFsUMhKpCILovE=;
        b=HmBAoFXQ4IJfPBB77luUnJKQZQFeHBCWOQFAwpqRnyii3Eu2p+yjrcVL1fcSl8OBZa
         Eax3cxmqH/Gs0HqvOpVq2/iKF6xAVkfGRabDGb9y4lPb2AbfUD/VrKmzhfxNUGOJdhnl
         D9DO93zeAqoJnC0muGAkno9vhhW4iUOX3ATKy4rIhT3eejRJKpqwAtr8PDi/NmrPhOEj
         khIkFVz2IOG+oudEtmqmX4pAd2j98UD9szXBaoBoZuuAhz6EALs25PSmTboEpdhcRXv7
         ATlIxpMiyKu0zo2LMyQblSG96vNwtNX6odz+ydHF0JJmBHFrXy5uS1UhwijfyB/szX86
         Zfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071336; x=1792676136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/HshOl9GEqL2i7rNuzJco4AlqLUiGFsUMhKpCILovE=;
        b=CvAjJrB1VfcfPYsh0EG3oxkV1f+VHWvTo1fuwBO7aOVL050zylL9G/Q6xQjcP7oBYB
         2/C99UMmHero3ueqg3aIZsCwAgS9wL5tkgPwyHUuLOoG0SWinGsD1WeiXmgocDE3wf82
         4Q6VqOFtcKu0ZDaK6Q/+6tUd+RHEC9gRxCQM1DCtssxqsO3LAClKX3w+3eD4Vctqft8O
         Cbj+Ziwzu64GQLSvpnu76tcNFszcgw8rfhYnW8WrvlsJtlAtW1/qqZ+5kvLi5Jyh3TG9
         1MTW+Jwpj0LzUG3lBp3EF6itRGzBJUYJANtuijZ8dcYEF1UhLqffKiJvfFxQsMbJTB8G
         k3eQ==
X-Forwarded-Encrypted: i=1; AKwUvByBAB6Jk1B0Ten/CK55Agv05Z1PXF2rt09+kYAL2lypBCsk2oOCZxBO+Dy/nZt4GwbEg/krMpDVKi6sjTAz@vger.kernel.org
X-Gm-Message-State: AFq9FYIoUMY9s3o2ut+nVWuK1gYdt63mz0LArbyoGlIjBnHuTybRwhn+
	oYPM3WJ4Z/sizufB2lx6TObIlhrJMd8O9Ou0sks0SPF/YTNekVXJoz78yGw01yHcGD6xwwb6r6Y
	xgivvLvxVpXKyVFtJTkAZw+SWOIlzBf4XO+nWLbGs1miZ8BAWYy1ap5NAg9iOyWKDTn9C
X-Gm-Gg: AYBFou3CHhYY/WnJYLVXNRs3M+sHcoVN+RqTVzB0gDFPAT77RPUVQ/6T/MTddpIcsWD
	ffaGtoMxfa4K+VQRWjKoIN42TPYEm4bkGxcVZmF/0p7EDvXcF410kG7mGvb9IZcG/ildzQR65ZL
	lbuCONowAxQpo3MHJG7oIG7GLt11j+nJHVnC7ybv7OHvVmBsbM7TsvDSMifWkiJuT4pt1ZRv9zk
	L4upSzSofrVdvRGPa2D9M2YB9DrQH9Xrwmj/N3Qi5i4VFlem2phVaSLpeY6FN0DmkglJ23lnSRx
	BbTMGOvAs6boIIEJKCs11ToWCnLLgFBADrW8L9V5yVi+PX0fCOTSOeZo5J4Gw2ygTyR5yw+6F3w
	Cf2ow8Ib6li3deoFiLmcEdG9oH9uZnA==
X-Received: by 2002:a05:6a00:4099:b0:89e:37b1:b81e with SMTP id d2e1a72fcca58-89e37b1bb3cmr3011288b3a.31.1792071335798;
        Thu, 15 Oct 2026 06:35:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:4099:b0:89e:37b1:b81e with SMTP id d2e1a72fcca58-89e37b1bb3cmr3011247b3a.31.1792071335331;
        Thu, 15 Oct 2026 06:35:35 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89ec1705f5dsm476617b3a.53.2026.10.15.06.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:35:34 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:05:01 +0530
Subject: [PATCH 1/4] clk: qcom: gcc-glymur: Mark GCC AV1E AHB and XO clocks
 as critical
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur-av1ecc-v1-1-448a476d54af@oss.qualcomm.com>
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
In-Reply-To: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX2ImP42hLwsfH
 q7UUYpFhGj/RDWULtrOF7+hzS40hbHgIhuK8Axcs5mA1/G1J2HFOhXdJx+SOFD8PVVIGKRg5YyJ
 qVcCdxQpVmC4CdRT88CRh+0/mEh+I0myQRHjbDvw1q2qOQZGheXaBUAk0ww3CzUQqi2VTutj0e1
 t8vgfpewILwYxqy97R/CGHOaXiCqDjdIlt93v85UVhKf1grAUx7jYNB1tkCyZMwZUtOJSs79391
 AKG6TI8lp4dnukRvva33Eaod8+zZNDm8HGUJirVM/MfzP3/kQSnyJ97aPP/3W2Z98Pq4e82RTd1
 Wlm5SaTgKIZfvKC3vXDIVEvfMjQFkXpmeMOvZJmVZY68V5a4+I+RxQBivY81WPbgu0YY/05ZBHT
 vRmVwfb8rWd7BswdQpt+0VQbVM9nnMirdwXtZP8xsUMMsCqtCCnn78h7T4grMtFRlTiq6+8ny04
 /1M4A3ldS3XdOFYRNVg==
X-Proofpoint-GUID: u33ZgZytn5tDZS0vuXSb0sWQI4hgmcOC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX/qtt+pOY0r2l
 58uMCTreIAT1tLPB8ZFDMOCa6LUYibePeRaUbB5yR4EcMPyzhtRPHv8QX4Un32I9GJm/N3RnwPj
 TwxnVPVzCMA6VsyaMp16rD7HqmfB9xM=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0d6a8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4K9S_alWPkThguqFwX8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: u33ZgZytn5tDZS0vuXSb0sWQI4hgmcOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150054

The GCC AV1E AHB and XO clocks are required for AV1ECC register access.
Hence remove their clock modelling and add them to the GCC critical
clock list.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index be18a555fe314a41e5335ce8cc100ae8ed226ccb..9418a9b2bbde4be8a28b6ba4405baa780de654e8 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -3373,21 +3373,6 @@ static struct clk_branch gcc_aggre_usb4_2_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_av1e_ahb_clk = {
-	.halt_reg = 0x9b02c,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x9b02c,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x9b02c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_av1e_ahb_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_av1e_axi_clk = {
 	.halt_reg = 0x9b030,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -3403,19 +3388,6 @@ static struct clk_branch gcc_av1e_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_av1e_xo_clk = {
-	.halt_reg = 0x9b044,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x9b044,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_av1e_xo_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_boot_rom_ahb_clk = {
 	.halt_reg = 0x34038,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -7915,9 +7887,7 @@ static struct clk_regmap *gcc_glymur_clocks[] = {
 	[GCC_AGGRE_USB4_0_AXI_CLK] = &gcc_aggre_usb4_0_axi_clk.clkr,
 	[GCC_AGGRE_USB4_1_AXI_CLK] = &gcc_aggre_usb4_1_axi_clk.clkr,
 	[GCC_AGGRE_USB4_2_AXI_CLK] = &gcc_aggre_usb4_2_axi_clk.clkr,
-	[GCC_AV1E_AHB_CLK] = &gcc_av1e_ahb_clk.clkr,
 	[GCC_AV1E_AXI_CLK] = &gcc_av1e_axi_clk.clkr,
-	[GCC_AV1E_XO_CLK] = &gcc_av1e_xo_clk.clkr,
 	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
 	[GCC_CAMERA_HF_AXI_CLK] = &gcc_camera_hf_axi_clk.clkr,
 	[GCC_CAMERA_SF_AXI_CLK] = &gcc_camera_sf_axi_clk.clkr,
@@ -8483,6 +8453,8 @@ static const u32 gcc_glymur_critical_cbcrs[] = {
 	0x32058, /* GCC_VIDEO_XO_CLK */
 	0x9b004, /* GCC_EVA_AHB_CLK */
 	0x9b024, /* GCC_EVA_XO_CLK */
+	0x9b02c, /* GCC_AV1E_AHB_CLK */
+	0x9b044, /* GCC_AV1E_XO_CLK */
 };
 
 static const struct regmap_config gcc_glymur_regmap_config = {

-- 
2.34.1

