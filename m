Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E79F4DDB29
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553858; cv=none; b=hC+ppo08GcgYp94IeBjJjHuYcP24MU1L01IkNWaVvHp24bZhqJFpizXyrJ5nBzCASfYWWa3eYPN1YYJ2LwKbolBcOUbNgHGqYUfHWG4/uPyWiTY0zxNwFqbG9GfNyF3OYFsKime5/Nu2scsI6KhBHk8RZUGABhSUbpVZ5SoPJU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553858; c=relaxed/simple;
	bh=6vr1l0zbegY6Y48Goh0CgOxnw56JseVU40THCRas/tU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VcuPeqNpCJ8UcMmGgpowc04IcWDzwR2tndUPgo2mEPSvzir4iNZukkx3MgM9CjYs4wnydjrD+Luey7GimNwQTcTtyWsPYhiFa2mGgbrJrGMYCp7BrksZVUbFgz/ahC4ypBdGP2og5bwYRlRiR6lpIOD+kWPPyhiJermtFltQIf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cjcvu9Kn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UbUKSNsJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjcvu9Kn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UbUKSNsJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DK8mJ1754533
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 13:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CGRjpNIMCxUovL4A9JmT3arAkaDar1+JrxyiUuuQolg=; b=cjcvu9KnBrWzPntj
	54aeOgx7HockMp9AdOqDxBN7oA38D0Uc55yE669DBX9aOG15dZQ4zVSp4sC5dHQB
	nYZ2+NfplrBlQ5t+/9y3j41KbISW/noECrIQYBce/kjARYEBi/ewAtV7ZEVNeMzX
	jdI9R4nYADp8F3icQTGOxzD3dwH1Aaoax8NF+cwFtk03xbMDB2SjjEB7KkV4uyiS
	v5c9Q0fALQ8xcDl7JmBJh75APwJbVQ8/Y/3pkT16ncHGapMI33okY4uyYjwnOG0x
	FHMylB4wInJFXlvu1PKA3yZTJl6HtnObm/1QHZIwa08UdyJ5c3lBI1sXsRzW+NWH
	Iaz+cw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6x6wgrpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 13:50:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dc7337e2a7so61999105ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 06:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791553853; x=1792158653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CGRjpNIMCxUovL4A9JmT3arAkaDar1+JrxyiUuuQolg=;
        b=UbUKSNsJ0udNxFRszIVkSLeZw1skKUIKiUn//o4kLzqScvu8UMXCNRpAqkEqkjpCgV
         RziuOcKt3EDO8fV5mIAjh4pKgr4IL4MxrFW3K3G+mfbb/kbQOLcx6v4dBrFA3PoKyoP/
         iKdEhXuiQ5aC14PJRajhl+did2naDK3ZljpOZhVTSiTNFwT5LEqmhOHOuLET6Nh7pvqx
         zBIzEXEN5y83Ao+/7tPahA1mONX1/sPMyvFxuOKG5P5zB9wWKDTWZNE2ylnepJQOoWjE
         mdDnqa9nu6MhTIITSA3T1k0FyDnxQQDazE68CGIel64WDmJvgTa7LsNR5PaTaf+PB80m
         KYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553853; x=1792158653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CGRjpNIMCxUovL4A9JmT3arAkaDar1+JrxyiUuuQolg=;
        b=H6FxBdlbWR4pZ/+R+CZwYbt+LOVl08W/bZtdT+3yQMhBnXpSHx+gC6u3SPK2XCU2+A
         8jFlxyEP1iyULfQ5LWuEubdlu9avvBV540ZhAfDDOtCMqwJmFeNVSqeT83L1auQNdXRg
         nFbr+BhCej/XHBK1eL1zzod5u742qh2EKZSCrJUHT7BIMrCz8P90V3+5vYgfr17HJXpR
         0mgr6yJ8ilYEaoIklNj/dT4/ayocgAo7IUrStHvVHj6oScgziSxOn/TiiN757dCMsFst
         PLf/loubyDY8wLD7guYlvLYhSH4vDeXlV/0DUK68DtFPvLyo5T8ktBFCl8Qb3tSFeZXt
         ATbg==
X-Gm-Message-State: AFq9FYLkrhrY1VLe8XPiQtR/HWcyliGm26X8hQSlWLkiY2jMo+5rucqR
	/nJW1ne5Y0Si4967jEQKaxR2e14563AqXub5gqdZTteggkZHj0iuA6fbH8rs/DnfQvOfm9IdMeN
	ltRch1I6WxOSoMACKjV1FC8GJcRDqnnBUrczYW7QC3RuJ9JLWDt+52OQHPaPZ1HgQWMdI
X-Gm-Gg: AYBFou3oz0r204DMV5kWf2G0dDfCIlWwYNdefxVodqlclOvPK80+7hXaUSYT15F7zT+
	UdU5XP85auGU527gHQPcWCDzN5JL/DHXFyJRwnKLBRob86sTiKnjywybbB2kzDKxjCqIE2IEubR
	2yRv76Fr16J5y/V0uoP+XO5FZFiZbWIIa6fCTlqJnqn46yYNsLRFBT3Pk1aAL5FXEijpaw+Mb9S
	cvRGQz2jAsNbVDjJFsUwzx7BAccwRCF7Y8dv4lDCsuOR0TAkUqrvW17PnkA87HqEmGeilgagtOT
	bjnqPRDMUEUy6nQISLRjpcXOnK4j///VedYqIivZ+yF2QnV7f5Vtik6mfa49c0Z6F0en6qLXFWl
	Rx8r0R0iW8Z9UYcmI6n7Cf3durH+YMqWbkwrPv0M0Q57/XbioKvGmij5mGpo8AP1FcI6nfk9Ywv
	lsBOjYuvh+pNg6+zs9shJtKiFVLkZ0hrKIFq8=
X-Received: by 2002:a17:903:3504:b0:2df:9d04:403b with SMTP id d9443c01a7336-2e842cd1499mr16744195ad.32.1791553853411;
        Fri, 09 Oct 2026 06:50:53 -0700 (PDT)
X-Received: by 2002:a17:903:3504:b0:2df:9d04:403b with SMTP id d9443c01a7336-2e842cd1499mr16743995ad.32.1791553852881;
        Fri, 09 Oct 2026 06:50:52 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422c9944sm9574135ad.64.2026.10.09.06.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:50:51 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 19:20:32 +0530
Subject: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for IPQ9650
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-ipq9650_llcc-v1-2-572e40b18522@oss.qualcomm.com>
References: <20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com>
In-Reply-To: <20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfX0lbyorWeJyMy
 /OzionV1/Gg5DiF1EWfO3R7icUPyaeiOkvzI7DfOFrynmWARYmVb4R7+OCmoWcpu3u5u6rYwz79
 x/7TKzsbrjZ9uUwQ+A/wKW16u+gqvco=
X-Proofpoint-ORIG-GUID: Nkv2AKD9IaENmJsTHjSgFOD723Id_H06
X-Proofpoint-GUID: Nkv2AKD9IaENmJsTHjSgFOD723Id_H06
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfX64haRkQP/T0Q
 UtkMliINV10fvG8Da/ojCmfdLljdfTg8sXN849UuHlif97ZxBjXXuG8BUqxauEd8c+Uvxz6U1Wx
 +iMMrWDtWcBo8yTLWnTEPXTkih/DBXvUoN/fMVoU4fGQyOXmBhP4Nz73E3Rj1g4tAvCy+y0XFej
 DvedgxtduC0WZWk7SneUU9zjSEB5zARr2cUvdH2xd1aqeq9fQF5sCvLpIVnNVKpA3uD7Wpw3l3X
 r3VAAENdFCkupXT+hsSqzLbcjekq6K7lyMvRWH5wakLzMCH0DsR79BwJLsd4P5slrvYW/ATGt95
 X+LjgaSEDLckp8+Hz4V4cXvAskRDFRaxOfBFN5eHPbmqwBwjZoosWL66tmOmz6DeY1th+lswSOJ
 gZRhXLWV/rxCS7adAKnwzYq2s0nY6mWphcr0DIQyhLFjn6LaPXfrblMFkh/OrBiyF2ib49Eyx8z
 2OzgLWNxw+BsOA9jafw==
X-Authority-Analysis: v=2.4 cv=ad30Dhot c=1 sm=1 tr=0 ts=6ac8f13e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=g86QhdraO39nIfxGWTwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090055

Add the system cache table and configuration for IPQ9650. The LLCC
hardware version in IPQ9650 is v7.1, but similar to IPQ5424, there is
no broadcast region since there is only one LLCC instance.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c       | 76 ++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h |  1 +
 2 files changed, 77 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index d7a42a8040a1..7ffe6b9019d8 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -696,6 +696,66 @@ static const struct llcc_slice_config ipq5424_data[] =  {
 	},
 };
 
+static const struct llcc_slice_config ipq9650_data[] = {
+	{
+		.usecase_id = LLCC_PPE_RXFILL,
+		.slice_id = 1,
+		.max_cap = 128,
+		.priority = 1,
+		.bonus_ways = 0x007F,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+		.alloc_oneway_en = true,
+		.ovcap_en = true,
+		.ovcap_prio = true,
+		.vict_prio = true,
+	},
+	{
+		.usecase_id = LLCC_CPUSS,
+		.slice_id = 2,
+		.max_cap = 384,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0x007F,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+	},
+	{
+		.usecase_id = LLCC_PPE_RXDESC,
+		.slice_id = 5,
+		.max_cap = 192,
+		.priority = 3,
+		.bonus_ways = 0x0380,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+		.alloc_oneway_en = true,
+		.ovcap_en = true,
+		.ovcap_prio = true,
+		.vict_prio = true,
+	},
+	{
+		.usecase_id = LLCC_WLAN_2G,
+		.slice_id = 8,
+		.max_cap = 384,
+		.priority = 3,
+		.bonus_ways = 0xFC00,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+	},
+};
+
 static const struct llcc_slice_config kaanapali_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
@@ -4673,6 +4733,16 @@ static const struct qcom_llcc_config ipq5424_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config ipq9650_cfg[] = {
+	{
+		.sct_data       = ipq9650_data,
+		.size           = ARRAY_SIZE(ipq9650_data),
+		.reg_offset	= llcc_v6_reg_offset,
+		.edac_reg_offset = &llcc_v6_edac_reg_offset,
+		.no_broadcast_register = true,
+	},
+};
+
 static const struct qcom_llcc_config sa8775p_cfg[] = {
 	{
 		.sct_data	= sa8775p_data,
@@ -4909,6 +4979,11 @@ static const struct qcom_sct_config ipq5424_cfgs = {
 	.num_config	= ARRAY_SIZE(ipq5424_cfg),
 };
 
+static const struct qcom_sct_config ipq9650_cfgs = {
+	.llcc_config	= ipq9650_cfg,
+	.num_config	= ARRAY_SIZE(ipq9650_cfg),
+};
+
 static const struct qcom_sct_config sa8775p_cfgs = {
 	.llcc_config	= sa8775p_cfg,
 	.num_config	= ARRAY_SIZE(sa8775p_cfg),
@@ -5830,6 +5905,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,glymur-llcc", .data = &glymur_cfgs },
 	{ .compatible = "qcom,hawi-llcc", .data = &hawi_sct_cfgs },
 	{ .compatible = "qcom,ipq5424-llcc", .data = &ipq5424_cfgs},
+	{ .compatible = "qcom,ipq9650-llcc", .data = &ipq9650_cfgs},
 	{ .compatible = "qcom,kaanapali-llcc", .data = &kaanapali_cfgs},
 	{ .compatible = "qcom,nord-llcc", .data = &nord_cfgs},
 	{ .compatible = "qcom,qcs615-llcc", .data = &qcs615_cfgs},
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 713cb0221b14..b0ce1a7d5d8d 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -92,6 +92,7 @@
 #define LLCC_PPE_RXFILL		 102
 #define LLCC_WLAN_5G		 103
 #define LLCC_WLAN_6G		 104
+#define LLCC_WLAN_2G		 105
 
 /**
  * struct llcc_slice_desc - Cache slice descriptor

-- 
2.34.1

