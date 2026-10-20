Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515311;
	b=RWOf13+kG+k7sXozYuUOfIJBjAVXcSA7sSyaOAI6uD5xgKoxK11iiRwtNCA0BkTlhkwg
	 NdOtkTc32zs2kuXEFZgM3p5uS3eFI04bBzvKnmI1vkCtdVEpa+b6a1IurTgTatx0n+SCU
	 nH+A7HHqQk8p7vApiWr4zE3JIxnH4bnfUuj7UcmcTAIPqwgqyaxxNNc1XDcIXCLiNJxNL
	 bfGC1nlkwB+ZvdeHc5vklHGRC5ER++RQOibz0bcveoSns7Kgdbk5RYFzI9JJkebN7jGSI
	 m9v5gdr84qOirDw45I9Yt7HHK6s5t9cMq1vAht1DkcejmP0h5vXfQT9aWNHH05gpXnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515311;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CPaEUoMb2iGL+4LGBe5tLnE2RdF5I33qahzfAPr8iHo=;
	b=GsRVHKFHX0KmIQk8oeB2AxE3WMutonYQTPYQMva5tHoa6hmXo6rre7UKeNgCV8kZYiJd
	 d9va59ceGTRgK5vLZ745n4oSIkYoovDZLjTib/vCaN3LDA54X0Un1pstEihS/jw2MUkca
	 GUhIueejHz/xHiHyVDCV7t0uK9g9cihcbD/juvuW1kzgibIRzEWwKIbG4zerymyBXxMcG
	 O2dArQ/CCMZ3He43Hg0DSkzLP/NSoCyiecDCwHTAJOTQ9ZGuLo7olJ9bmgFcCL4qrOgZb
	 ghYIlN4QrtKaFQ7alIOAVBR3D+2dyDtfXKD+pYyx8jr9pYF23S9jU+o8ahJ4AEcQRDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LN1LJ6Lk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PY15J5KR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B4A60A2600
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08B4A60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LN1LJ6Lk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PY15J5KR
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA1iM1209355
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CPaEUoMb2iGL+4LGBe5tLnE2RdF5I33qahzfAPr8iHo=; b=LN1LJ6LkF3Q3cEnS
	CZ+j1cMLZpA51vhZB11FFRFYM6KtoCtdvUIHYzJNNqS8XsfDX+qvZqC0fG35zNj2
	L2rL0/WtZnVvfBwdbpGqU5JxHNvZkrV0Sk7/8QwCVyfXSWdmhyJskOHN9sl/Tsn1
	p9G2nET0FuOHEwTtixlNCA9SdLuepfos9R0XhmlqxfGMXjqcNVVySxL2+Exx8/VZ
	qj3Wplnf9nIMw/47WJJptuYBtRvA+doFpsBMLyPJLSic5nscZhyUipjs4S4ZotCP
	ThKCTVN04jc4WbjPK/J3EHLD4wym2+F8q5m7ADXn+DNklqBIwjQr/I1U/72Z5/JI
	3fB+9A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pbh2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:55:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35d4538fd74so11221812eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 09:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792515309; x=1793120109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPaEUoMb2iGL+4LGBe5tLnE2RdF5I33qahzfAPr8iHo=;
        b=PY15J5KRObp3Z0cIESCHOBkqUGgzOsLfSqDcWvpmwSi8KLCw5wV0oosqNtCEheuKvp
         Ksurf76Lseus+wc9sdHqpOI2B+w9Id8b0hespWiyw3O7ZZ8nl/SzMbsxA9ZPH6pLfY9o
         ygUs3hVOH81XgM3Sg16/wb9rp1VSUOaSe+MK0NTw6dqCoSC3/QvoTm63hLhAiYa+e8ED
         yQ/se/oqYznA9reKI9Kq7O9EntAJ+0ZGERGPDl8Yqj+pH77cv2AGj5E3mo7NYZqwx2cz
         Be8BwC93OwsE43e5r+X5U3sUZSdCHlu++Jtw2GDSaaDUGiCOyWzXSZvZz56yTEexj3jD
         p64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515309; x=1793120109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPaEUoMb2iGL+4LGBe5tLnE2RdF5I33qahzfAPr8iHo=;
        b=a0Z7Vt+Ef31b8WW2NosQ7ORV1g0miZCBqiTGEC7Y7gT+pv/XLvjMwvTMEUn0Yf1yBu
         nPlCzxDa8hlhPAMBlqsQffkhBuuueZnbu3UZY5PXhrUmwu+iP4ZU2i539lGLHM4kWKoU
         B3zGJ9l6G5K1vrYOzqBtB1H9CTe/O2HjWV+FDcoWFqbahxGcEJddCr6IUgqyI7D/Mjk3
         DJk5M6ZmoMcVvDmwqUdHVhmjRZx0JSpr76joEeDrZ0ewtONVshDmjOeMeWabeYliH12o
         mVRQXHcoxBgTmKyUK8uYoi9b4djDq9lXUF5WwzAvUXKFAgSKh1/mtN5MVAk2S/ARMQWn
         0Uhg==
X-Gm-Message-State: AFq9FYIYj3nCqjp5ydvjy7bsn024cqJ8dtKKKTdC+jGv3BJGoUDgBNay
	TvQOL6YNzx78rFVOMBGmcLrvghaQ1st3JgqaZQ7bFwVkM67wwQB9gwTb42Dwe95GP9nJDrdq99P
	8Wdbpchg1bRJTs1SmU9Y2a/G6PUoquMiUd6RPOQgS7ufFEYWwr1VUyKNYSMvVXITqZFUX
X-Gm-Gg: AYBFou2+NlAI6fPZj4NSqehZZriwi5eR3JNdtRRL+0+lcP+vygwZaxkfpgbqtCDp5NH
	mtd7Z2qz7na8BphFUbfdqU8kOEoiI+9I1CChKb3ABrAcVSG3Tn4iL9Tavf/temLzEJnGjmtFfst
	EW5HdiCL0RwZMwC+yjEVjjx1vAaN5DsEWY/PrlWJKVLrjcM1V87LW2ik7ggeOUzmXsIXi4rJkUz
	GvC4m60WvdUqTD3XAZSv6McS5KNTxorpjZqiAexBUWQNCCfkT1Kgs/R+4p72D6Zz0s1k7uVS7Va
	1kQipcVgV++i5wgyPIzeZJEfnZ6Bsqrwed8wADlCaghqeozjhs+EaCbutFOW8oU7Yw+8d0B9kBI
	l5vjOAm/2eNonwQqJh9uREPM43V0LbauEJOzctrIztw5sBXEAr/sxPawkWbF07zSzkuDN1hCjSr
	OVqMqA0SclnPtOQRhYzAQKMCZgAiA7I71D7w==
X-Received: by 2002:a05:7301:db07:b0:366:c497:610c with SMTP id 5a478bee46e88-366c4976309mr1750026eec.33.1792515309057;
        Tue, 20 Oct 2026 09:55:09 -0700 (PDT)
X-Received: by 2002:a05:7301:db07:b0:366:c497:610c with SMTP id 5a478bee46e88-366c4976309mr1749928eec.33.1792515307298;
        Tue, 20 Oct 2026 09:55:07 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm43204868eec.23.2026.10.20.09.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:55:06 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 22:24:50 +0530
Subject: [PATCH 1/2] soc: qcom: llcc-qcom: Use lowercase hex consistently
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
Message-Id: <20261020-lower_case_hex-v1-1-bfac89824646@oss.qualcomm.com>
References: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
In-Reply-To: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 7N9FJmGAVTynUqARYrXL-2-Wqr3yp7DA
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad79cee cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XfqRfzRSknG9cwVfMr8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2NyBTYWx0ZWRfX7h93z2zdzM6y
 g5K9QG5yLqdmHAtZ/XMl4s7AVMDhQ0zTkfNAMxiyL8j1pvv+IZNsPChbiy/aZv9g4LYzZX5NN9G
 yIMrQCLLkTBwPDp6YRfHJzKFQoGaUW3jxHJAYzu0Vcx+raB7bi+tPCAfDACy7BqHG+xzKnXXJk9
 fTPoCc58CA3EYmEFRXZ97Wv0KOHYlcMGuKTgXMPEiGa8ouLcDry0RoS6fwswWGeuXVYioJmtaOD
 SkhF5KFMN71Tf2bv7IfxeL8Z60HfN8yHC5KpfO4CXwXSrbhxf9FMPMclT+SGj7n0drstBSuyrsw
 jn/ZkzP7cLLSu1++I6OF4yzVC/yiWhzPlImrbH5+D+t7jCFDm8FMRekaMlb74U423G6AzAWxGwd
 zwf3u5F91EMdUtKEaR3yZdaZEPduamGb73sPOQlkcisYkRjVK7ohxj77BlF1InEObi5i0e5iX73
 rPg3EOVXTv4LnRG/ESA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2NyBTYWx0ZWRfX8NFbKxY+DNFD
 Fwq40oPI7h5VDtrppa+yS+kCwTymrfbJzaLRpgi4VU7O3bayQ8ibhdxNuiR6wKgQC4TfinJZkNx
 gRF9TOMjVT6O8acY/bpJZIf94rT5ZKA=
X-Proofpoint-ORIG-GUID: 7N9FJmGAVTynUqARYrXL-2-Wqr3yp7DA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200067

Convert the hex values in the Glymur and IPQ5424 configurations to
lowercase so that they are consistent with the rest of the driver.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index d7a42a8040a1..2edc5ec31249 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -439,7 +439,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.slice_id = 1,
 		.max_cap = 7680,
 		.priority = 1,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 		.activate_on_init = true,
@@ -449,7 +449,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 512,
 		.priority = 3,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -458,7 +458,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 1024,
 		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -467,7 +467,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 512,
 		.priority = 3,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -476,7 +476,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 7680,
 		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -485,7 +485,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 512,
 		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -493,7 +493,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.slice_id = 9,
 		.max_cap = 7680,
 		.priority = 1,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.write_scid_en = true,
 		.write_scid_cacheable_en = true,
@@ -505,7 +505,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 768,
 		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 		.activate_on_init = true,
@@ -515,7 +515,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 1024,
 		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -524,7 +524,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 64,
 		.priority = 3,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -533,7 +533,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 1536,
 		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 		.activate_on_init = true,
@@ -543,7 +543,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 256,
 		.priority = 3,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -552,7 +552,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 768,
 		.priority = 3,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.alloc_oneway_en = true,
 		.vict_prio = true,
@@ -563,7 +563,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 3072,
 		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.cache_mode = 2,
 		.vict_prio = true,
@@ -582,7 +582,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 256,
 		.priority = 3,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -590,7 +590,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.slice_id = 5,
 		.max_cap = 512,
 		.priority = 1,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}, {
@@ -608,7 +608,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 256,
 		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 		.activate_on_init = true,
@@ -618,7 +618,7 @@ static const struct llcc_slice_config glymur_data[] = {
 		.max_cap = 256,
 		.priority = 3,
 		.fixed_size = true,
-		.bonus_ways = 0xFFF,
+		.bonus_ways = 0xfff,
 		.res_ways = 0x0,
 		.vict_prio = true,
 	}
@@ -630,7 +630,7 @@ static const struct llcc_slice_config ipq5424_data[] =  {
 		.slice_id = 1,
 		.max_cap = 128,
 		.priority = 3,
-		.bonus_ways = 0x0FFF,
+		.bonus_ways = 0xfff,
 		.retain_on_pc = true,
 		.activate_on_init = true,
 		.write_scid_cacheable_en = true,
@@ -647,7 +647,7 @@ static const struct llcc_slice_config ipq5424_data[] =  {
 		.max_cap = 768,
 		.priority = 1,
 		.fixed_size = true,
-		.bonus_ways = 0x0FFF,
+		.bonus_ways = 0xfff,
 		.retain_on_pc = true,
 		.activate_on_init = true,
 		.write_scid_cacheable_en = true,
@@ -659,7 +659,7 @@ static const struct llcc_slice_config ipq5424_data[] =  {
 		.slice_id = 5,
 		.max_cap = 128,
 		.priority = 3,
-		.bonus_ways = 0x0FFF,
+		.bonus_ways = 0xfff,
 		.retain_on_pc = true,
 		.activate_on_init = true,
 		.write_scid_cacheable_en = true,
@@ -675,7 +675,7 @@ static const struct llcc_slice_config ipq5424_data[] =  {
 		.slice_id = 6,
 		.max_cap = 128,
 		.priority = 3,
-		.bonus_ways = 0xC000,
+		.bonus_ways = 0xc000,
 		.retain_on_pc = true,
 		.activate_on_init = true,
 		.write_scid_cacheable_en = true,

-- 
2.34.1

