Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4795332EAE
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 08:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091906; cv=none; b=t7sH2iliz4onI5ecglLKiCB5CK0KvMBbranXFtF3YgMk1UBLUEV2NEUWomADFC7h+XjGqKg1OHkSNfnXoeU4QuW1YV5CNtmr9s1kdclt3Rmjwqfmh2VJ5w7EFbkQEzq3E518ndnNFNZVVCBZrkymDy9ZKTvbYf0e2HcLK+N41qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091906; c=relaxed/simple;
	bh=dplMJ1/DErM9k5J0cvQc4PllYMsurV9YUctfeKl1KCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IrjRxIiOENZkwV8bo1zeNvhBHPbqebNhbVEfPishfs+uc/E94hvCUUSPGQMfTXaa/V82B2iBIS9GqMeYqmGZ7uClx9j7kWxdd3VM2Be1yL6CHOYObojBWaAx82VvoeXGAkqz4rJ4+JvLCAX1Krgum83e2D53Z0kMgRj5EHIntX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ad+sBVz+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJlhdyyF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ad+sBVz+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJlhdyyF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777ltNr493134
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 08:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5sxJ3GPqR92zlfe4Anekr/
	7V6Q8VQuSzMUrn4PnZrJA=; b=Ad+sBVz+F963kdiUuenag+qrDXgIgHGv8pVOKr
	z10tJo+zUPYEGdGKETCXcKcGN9HCwyzvyE00WLg3jZS5ACZMap7pCz1469aTVPrc
	yZV0BEc0UJlpxBs9sdE1lGR7ajVtbC5czZoaeg8NQzTNxyleK9EjDw1X6vwn+ry4
	emK630nX9VfXsboxZF5j76alGC11R/o8FsdLyuo0odPOhvJvUq02/48EHiaK0NEU
	ZPU0v99if+wuOWjVv/ptCbQI24AyCUm0NMhF2gyVLPC6JqDF5Wgih5S5DJd3Tys2
	MEHzI9hW2rNfliHXS4vRBGsMwS+RAbG0z4RhTZduYhTClLWQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6rb079-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 08:38:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbe62e01567so2692219a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 01:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091902; x=1786696702; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5sxJ3GPqR92zlfe4Anekr/7V6Q8VQuSzMUrn4PnZrJA=;
        b=CJlhdyyFqbjgXLQaGIifL2uhYrqpW4Xo+7YCAPNsrndk351yMxBpNbx1Or6O/2jt5R
         yZvH9D3evGCjxNbbPsBikFcPvYcwtZtfV3avQ5GYKlTx86SHpMUWKTkaIOEuZI7mjVul
         oZxrK+6T3t9TtvP3iMGg2Vtig6CJRRNBmdTBgTWZjJvSKO9paIQhKrC2ckg9Uki57paI
         8p7TV35arH53Mh2OrKsByIsHvtfnBTBpjJ11KNAn1D5PS9KfQZYU5tqJhhdfhl7hN0vr
         0PtGTZBiIMl14vA/lktfVNRBSWVC+XAHVWbeL0mnlCmUC33oYdgASnR/SXX+k0+4OdsM
         IIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091902; x=1786696702;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5sxJ3GPqR92zlfe4Anekr/7V6Q8VQuSzMUrn4PnZrJA=;
        b=TFPHSkVZN9dddgcAGYVEj94HoaQqauLCOS0uXo8E27Q1YJ/NTtXUYlL2aLUAYXPFzx
         C99nS8tRZmAU65/FFQWiXOZxhvjCUmX5E/coRimrW1UbJcd2xPLNW/LDeEpvxpW53Y8V
         lD0JMpGK3Ey+qlntN70FcZrUnCO/tSJkO7sMfXMfY1/cCHYfDhE3uHBtZ5GQaBrz4AbQ
         0Pdpxn+rfQ7sFE1Xo6dqHhyFddLhd9uNtIAlVTYhXqU7bnzh0T8sBQ3/MCyz2mUlfhvw
         DL+6be6lR9dpC8vsYQWDZYO59LoY50KrKkCvXFhs3bUBJJ8UNPTM+fyrhFmfRHkQXiao
         jInQ==
X-Gm-Message-State: AOJu0Yzu6f1ijeDM/M4qqG9qehM30oJGeBctW/N811p5dYNEKnAAJ3Zt
	xw5aJ7uqKd6MNTyjjS5g9lPlnnyxIdfr5pHS47XXSCgFMqiXkBt3gJAfFu05WJK4spEdnKT86PY
	5WYBHCqEPhgWxfLOxyhyrN6JcnTJHsg+sFDWDQUpjhW7zQ73Vamu8voKFivkwYnccsusJ
X-Gm-Gg: AR+sD11w4aZggVinZ3CNHycBphFmTrIX7jzcEyyXRZC6Ya6Boa9/DQyLNBEIK0yFgZX
	UWeJr1c7dHfprYHllAEfy1lUT+DSmotQiup8qJYL+QucfF4hyT3pdIGtNEV0lFLt4/brWsdZMQw
	nbvK10w9szwCNXqtR+/3vfxedMkuvKuiVSNzbnSg4ZEdthsmcissI3SuGnOe22lcVnfl5nnAAr8
	5ox48GLrtDkZOwr8Fw+s9f5ioO4ZyDK/oBqqvOKmmT+V/+hfmHwcZfZg1hxX3zCRcDHBDAjJX5h
	ovMA9Qhd50zgWGNdMTWztmJVTuLMxFw34ycmWlF+jD9W3jh/bSd2IVEeYAI8jDWXmmNOdr8He+V
	h9OuSYYRb5QQUSvAtjxcj3x3+wbnXP5KYYAq+9aytWGXT3pbRTKRcEd1b8g9RVuBKeCh9J58YMb
	1N++ugfSGozhHofm9LvuwRn432/PGoZPY0zSM=
X-Received: by 2002:a05:6a20:43a9:b0:3c3:7e9c:e292 with SMTP id adf61e73a8af0-3cb85f49477mr25030871637.25.1786091902078;
        Fri, 07 Aug 2026 01:38:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a9:b0:3c3:7e9c:e292 with SMTP id adf61e73a8af0-3cb85f49477mr25030821637.25.1786091901584;
        Fri, 07 Aug 2026 01:38:21 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86d3fcsm5093067eec.4.2026.08.07.01.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:38:20 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 14:08:16 +0530
Subject: [PATCH] soc: qcom: llcc: Update the SCT table for IPQ5424
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-ipq5424_llcc_updates-v1-1-1f56362ff687@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHeZdWoC/yXM0Q5EMBBA0V+Red4m1dCUX9lshHYwInQ7iET8u
 +LxPNx7AGMgZCiTAwJuxDRPEeknAdvXU4eCXDQoqbQ0Ugvy/zxTWTWO1lard/WCLNrC5KnTrjF
 GQ0x9wJb2Z/v9vea1GdAu9wvO8wKrqURQeAAAAA==
X-Change-ID: 20260806-ipq5424_llcc_updates-f9851d6db886
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MyBTYWx0ZWRfX5r3Rapj94LWn
 hgnuUQcrrua9ulVb/RNiaYxJuVMydZ5an9+KTx1H5YCbRO5QrHpjlmoGk/FWZX8bRo3nRtk1kr6
 RYCuEiIv3cepppwBrzFPN7a8dywvReKom1kkhszKI0Whjurv5uALDCI9cMCRpTI5ImVnTFm6rYQ
 P+boepKBptq433pFlPzE9Y8QzN/huZQb1cbP/vEoqWmxIEYTz5CId3WgUO8h4F3lyXkmAC6ooY8
 tKxFKfeFNPt0nbvQTvHI9tJxvePCWBTSe6WU6Bwawywvc7R8PUFhSSaJfU0ZSxCwUbFDuOXWe/v
 MtoXdSBVJ+PFbV2ZYYyB1JbJJayZxg1HDXhumhP7LRxYvmcEF55Jj08ZGwK4WyLSYoq3ZU0dAsu
 SccuXju61x14zXo7kQYKMxG5lfO4UlM4zmP/0WRdYftz+zDaJP7/FWZglw3v2t6hjWz6NdIP8kU
 b7NiUndSF4j1NdOWgbg==
X-Authority-Analysis: v=2.4 cv=HPXz0Itv c=1 sm=1 tr=0 ts=6a75997f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=EQIC69WgoSIuKX-Q-KsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: sBLmqCa4CZu2f_j2oCETXzGDuc88Nj0q
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MyBTYWx0ZWRfX++3cSC+WQXy7
 e7vcyKKSRohAP0OvQ5n1BAw4t5olTTaLXDd6zEZcNgHxhQ+hctM5SdMdatX+Ib/+hI9nkVbRMO0
 HNR8+QJWJrSkTDe/pD+xHVcDkpzPELk=
X-Proofpoint-GUID: sBLmqCa4CZu2f_j2oCETXzGDuc88Nj0q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070063

Update the IPQ5424 LLCC slice configuration table to match the intended
cache consumers on the SoC.

Assign slice IDs 1 and 5 to the PPE RX descriptor and RX fill use cases,
slice IDs 6 and 7 to the Wi-Fi radios connected over PCIe, and slice ID
2 to the CPU subsystem. Adjust the corresponding capacities, priorities,
and way masks for these consumers.

Rename the usecase IDs for slice IDs 1 and 2 because LLCC_CPUSS and
LLCC_VIDSC0 do not describe the actual users of those slices.

Assisted-by: LLM
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c       | 56 ++++++++++++++++++++++++++++++++------
 include/linux/soc/qcom/llcc-qcom.h |  4 +++
 2 files changed, 52 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 733999867bbf..d60431ace50f 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -626,11 +626,11 @@ static const struct llcc_slice_config glymur_data[] = {
 
 static const struct llcc_slice_config ipq5424_data[] =  {
 	{
-		.usecase_id = LLCC_CPUSS,
+		.usecase_id = LLCC_PPE_RXDESC,
 		.slice_id = 1,
-		.max_cap = 768,
-		.priority = 1,
-		.bonus_ways = 0xFFFF,
+		.max_cap = 128,
+		.priority = 3,
+		.bonus_ways = 0x0FFF,
 		.retain_on_pc = true,
 		.activate_on_init = true,
 		.write_scid_cacheable_en = true,
@@ -642,12 +642,52 @@ static const struct llcc_slice_config ipq5424_data[] =  {
 		.vict_prio = true,
 	},
 	{
-		.usecase_id = LLCC_VIDSC0,
+		.usecase_id = LLCC_CPUSS,
 		.slice_id = 2,
-		.max_cap = 256,
-		.priority = 2,
+		.max_cap = 768,
+		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0xF000,
+		.bonus_ways = 0x0FFF,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+	},
+	{
+		.usecase_id = LLCC_PPE_RXFILL,
+		.slice_id = 5,
+		.max_cap = 128,
+		.priority = 3,
+		.bonus_ways = 0x0FFF,
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
+		.usecase_id = LLCC_WLAN_5G,
+		.slice_id = 6,
+		.max_cap = 128,
+		.priority = 3,
+		.bonus_ways = 0xC000,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+	},
+	{
+		.usecase_id = LLCC_WLAN_6G,
+		.slice_id = 7,
+		.max_cap = 128,
+		.priority = 3,
+		.bonus_ways = 0x3000,
 		.retain_on_pc = true,
 		.activate_on_init = true,
 		.write_scid_cacheable_en = true,
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index f3ed63e475ab..1ccc429401e8 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -86,6 +86,10 @@
 #define LLCC_CPUSS_HEU	 94
 #define LLCC_PCIE_TCU	 97
 #define LLCC_MDM_PNG_FIXED	 100
+#define LLCC_PPE_RXDESC		 101
+#define LLCC_PPE_RXFILL		 102
+#define LLCC_WLAN_5G		 103
+#define LLCC_WLAN_6G		 104
 
 /**
  * struct llcc_slice_desc - Cache slice descriptor

---
base-commit: ea2bff00da89d7767d677bb68470130ba96f4928
change-id: 20260806-ipq5424_llcc_updates-f9851d6db886

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

