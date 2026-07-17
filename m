Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2B132D45B
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 05:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784266338; cv=none; b=G0Dz0QOYWN4RNKN5eWJY8UDQaK0wIcBe8merqGsDpRGKbvD5IILQFrQ2+4fFqjiMZajn90IgCfbTL8r+SteqUXSNBrwKczVMjOk80REpGeX1SLGPPLOIKqb9o7VPTN/hEOi6Suh7qKP+HVGE3+NGsWF6ix2b+fyuSCne5YsAWVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784266338; c=relaxed/simple;
	bh=Vrq29aRX/6IcoQWJku5ttZIZMz378bhwF8V95noopMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ozTUf/5qPAaei3S1Q6kWk+XHiPV2oxpQ2xzOvuWC5+Chdbeett+9rfN6YVlDYAhKiJdXVvT0vyFAzdb+juWutWcadX/GD+JP7gGoXjMPH3Yl6/e8j8lcCWli86RdV1ZiCV0mc7kMPLvgvqadu7x6wn9mfNrIzD2iVVKFgy2rCh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBtOKXSy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K9h3hlH+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBtOKXSy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9h3hlH+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33sUU1617291
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 05:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z2v8+OC56PeMGr4eGEr6Q4zuebXtUQl24KS2e3bDzx8=; b=RBtOKXSyBdwMUHLo
	9ATpPyETIAdEvhnaYBbnyCPjpDkeljd+33DETQL1ClhyZcvey204gsg2rOt0U3GB
	6giiEWLdGArdU5wYec1FCGQYN5NpGd0vtpOa2kwjmQ3OOdHejShokuYrDRPK14xO
	YQCtk/G28srie+MSZ5uyrlwfNvPk4Hkcb50LfehYKiZZZGVTepxd+mtA2WtQGSMO
	K8DcDZBSSyJ2PLuplefpFcOe0rqRhnm1/HO2rfHuu2H8I+AtdeyqQLlHQWGsoHD6
	pgLKC/l4OkezY9YldymM/EykhAEFAl+Sey5fiKdzNrlnbKJNj+Rtw2fUsei1vlu/
	PvhWTA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6j4rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 05:32:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacf17c7e0so59978995ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 22:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784266335; x=1784871135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2v8+OC56PeMGr4eGEr6Q4zuebXtUQl24KS2e3bDzx8=;
        b=K9h3hlH+BKBSb13DA8Tm12CO/BqOkEyh4NMrsT0wdrX8be845ypXIuc4oEOQJTYHhc
         4HbWFHA4+zzg1M0sWRQwyzJBM/6dCwZ6t8bpoj2EAmNzf8OqRCoS0iMPReYBcxonu1Sl
         OvGK0rawYndnmtd4Cns8I7MVSBmonHajSnzkrJPPCPMsvyFVK3HhWbd8VgarPdJvJF9M
         0WcjzSxaJ31jxWpTmucJpFuwPrihhHy3Gyz60IwYXD6T641cVUj7Huc9+ZvZvcCvR/rG
         Fkq5ALgjpONuhQEg4NdUEgodP3ZDF7YCqbtUE5wPDZkPPTFZVEADBu4QaajVMgkPk9FK
         C9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784266335; x=1784871135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2v8+OC56PeMGr4eGEr6Q4zuebXtUQl24KS2e3bDzx8=;
        b=D3zcsh1apyREGgTChCKjd/uq6tvUJWG2MuTgXY63y+rYWdBRnaXsILhb+G9wuCZuRb
         BFup0BdlkyvEaMkQN7ic/CMwac91/2+VS3O8VmYRpBE15CM50LF0qgPE4z/oMum2w+ux
         w6Rw+s38ihgHpSDosBHSY3IFF4QUEIsrdHoFx4xbCNFuzG9RnahlXbk5s9TbWwsAzJ10
         9yQZSOe0ZQ6gjqIZfvhLnr7OkEsV2EAHcuShTTtMC6hmN/SukA1kwreVBPI5ECAEf0F2
         q6H/NJTxjn8TbGYaOcDb0BgYOJ0tErDTntKKeHgomRk8yeJ9+0ph7Zl/JOH75AHCg+dj
         HSRA==
X-Gm-Message-State: AOJu0YzcLiMpXrnLJNU8eAHvZ5oXvJPRa8vyYC+Zip7TUTPs72zvNlmv
	E4jIZxwYPBEy9QzqPHetwWD0kjiRIbFKECOJO13UluR4gk4xkkxVneX5ZiBoiDnHAZlsSZQ3NMY
	blgRK4WZ9vZ/VqSjGEDipVU/8t1zsUcJNvoD3RTfL3JNBsd+/i3UOtXZpLtIl31897ws=
X-Gm-Gg: AfdE7cmEKraRSY99AxVWUEWg2IyW+rhDFyIxzwrglM2br0BH4+bRQvOVNYdQgXBDjVV
	M5geAeq8x95T92PYaziGwkAGrWvYw+2vMb7b/7dV65QuTru9uoR4EDz2QD/+MssHbZu9lkccan4
	g5Ak1JRgi5MozTNo8AlvlQ674Ok7TS6TH/lHjZsv1aH0ksTlivzpt4xVXpRv7rHNfDJ6YfpXHD2
	mq1thx6sTWOPblX64I9MIVb4uzK9MyDb6+XVmF/tZQaDcIIdufoFKGN3sBs9Sfr9EPSq4PiLYZW
	UEsFd0oGJTkcZeWISWKilS1OJnQSIwuxO6rnOXCENWU6+hwWLwooSGPNZ1uUkvWUJFPZ/2hLrzR
	p+HTOMAr4FPj7kVrsg3nF5Ep/HosrGA==
X-Received: by 2002:a17:903:3805:b0:2c6:6424:c79f with SMTP id d9443c01a7336-2cf34850d13mr12768045ad.8.1784266334690;
        Thu, 16 Jul 2026 22:32:14 -0700 (PDT)
X-Received: by 2002:a17:903:3805:b0:2c6:6424:c79f with SMTP id d9443c01a7336-2cf34850d13mr12767755ad.8.1784266334125;
        Thu, 16 Jul 2026 22:32:14 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ef6asm4189885ad.9.2026.07.16.22.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 22:32:13 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:02:00 +0530
Subject: [PATCH 2/3] arm64: dts: qcom: qrb2210: fix PM4125 regulator supply
 parent mappings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-pm2250-fix-supply-parent-v1-2-a6213a42a3b5@oss.qualcomm.com>
References: <20260717-pm2250-fix-supply-parent-v1-0-a6213a42a3b5@oss.qualcomm.com>
In-Reply-To: <20260717-pm2250-fix-supply-parent-v1-0-a6213a42a3b5@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784266321; l=2902;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=Vrq29aRX/6IcoQWJku5ttZIZMz378bhwF8V95noopMU=;
 b=FANAdxF9acmB7V21krtw99nFcjpubMymbB0mDYr/MWzn6IzMsvePsIwBwlrydwFLuTXtqmkZ9
 v/K5wL1cFlEAPLZ1YbS3q7CZ+nZLcF9Z6Ly2aakiQamqwdqpLFw8JtT
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA1MSBTYWx0ZWRfX4fU7E2++VQQV
 bbpG0Y+2TYUUnyPMcUJ5/JsKkLtIfkN/3GZOaMvWpNHhyq8JSKUHh2WfkBjUse8VdEuJoihJcq9
 greVXvAfFT+tpvD0bcmjC4J1CasP5vNsugKfKeh24cbts0gLWaFUaNXndzFSAP2h038qo+VDgP0
 SaCSzkcbrAnb78m8TiqAJ9mFSv+uDV1R5b7R14jkBvuyohh3JJRPM7nRvwnuQEEln8Lj9jY/zpV
 jAtjFIV3GLJDYliTXwlFbLL+V2YVrM0SzLmskE1UBR3biZdXbKdV2dXUjVOhHXPCHWBapPAhZjK
 bdbUdXnkR6FKjvIdb+iN9q5iU08RCn533WxXBcM8vkfkhWrDdWDK5UKAcdrbbyXqicXREZrxxwi
 /Hc/uxn3QhCLVMDziIfBaqRblsCwPBUrYaLVE6S1y4+A4td6UCVNLI9S5uEC28Mo63/KVibdkOF
 9hvfn8TCrm5LzGy/yMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA1MSBTYWx0ZWRfX7C7X4NKkgitA
 r5t2oDdZZ0tBdb9L2+Sz6q7fog2rWIfBCWdsnk5SftTV+09VoDBVZJUFhWy0Owk2Nij/3NQH41B
 s3tI70B+4BKEqiJ70O7p7Ce2or2xJec=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59be5f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=srU4aMJgQ0IWwv6as9EA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: r_r6ckhBL_7D9qScLCemaET7mVlyMRBh
X-Proofpoint-ORIG-GUID: r_r6ckhBL_7D9qScLCemaET7mVlyMRBh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170051

The qrb2210-arduino-imola and qrb2210-rb1 DTS files used coarsely
grouped supply parent names that do not reflect the actual physical
pin connections on the PM4125 PMIC. Since supply rail connections
to PMIC pins are fixed in hardware, these grouped names were
inaccurate descriptions of the hardware topology.

Replace them with the correct per-group supply properties matching
the actual PM4125 pin connections, and align with the companion
driver change that sets supply names to NULL in the qcom_smd-regulator
descriptor so that the correct supply topology is captured in DT.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 13 ++++++++++---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 13 ++++++++++---
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index c472e13fceca..90e6eb284a66 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -262,9 +262,16 @@ regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
 		vdd_s3-supply = <&vph_pwr>;
 		vdd_s4-supply = <&vph_pwr>;
-		vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12-supply = <&pm4125_s3>;
-		vdd_l4_l17_l18_l19_l20_l21_l22-supply = <&vph_pwr>;
-		vdd_l13_l14_l15_l16-supply = <&pm4125_s4>;
+		vdd_l1-supply =  <&pm4125_s3>;
+		vdd_l2_l3-supply =  <&pm4125_s3>;
+		vdd_l5_l6_l7_l11_l12-supply =  <&pm4125_s3>;
+		vdd_l8_l9-supply =  <&pm4125_s3>;
+		vdd_l10-supply =  <&pm4125_s3>;
+		vdd_l13_l14-supply =  <&pm4125_s4>;
+		vdd_l15_l16-supply =  <&pm4125_s4>;
+		vdd_l17_l22-supply = <&vph_pwr>;
+		vdd_l18_l19-supply = <&vph_pwr>;
+		vdd_l4_l20_l21-supply = <&vph_pwr>;
 
 		pm4125_s3: s3 {
 			/* 0.4V-1.6625V -> 1.3V (Power tree requirements) */
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index bf6fb12ad990..3432022274d8 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -465,9 +465,16 @@ regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
 		vdd_s3-supply = <&vph_pwr>;
 		vdd_s4-supply = <&vph_pwr>;
-		vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12-supply = <&pm4125_s3>;
-		vdd_l4_l17_l18_l19_l20_l21_l22-supply = <&vph_pwr>;
-		vdd_l13_l14_l15_l16-supply = <&pm4125_s4>;
+		vdd_l1-supply =  <&pm4125_s3>;
+		vdd_l2_l3-supply =  <&pm4125_s3>;
+		vdd_l5_l6_l7_l11_l12-supply =  <&pm4125_s3>;
+		vdd_l8_l9-supply =  <&pm4125_s3>;
+		vdd_l10-supply =  <&pm4125_s3>;
+		vdd_l13_l14-supply =  <&pm4125_s4>;
+		vdd_l15_l16-supply =  <&pm4125_s4>;
+		vdd_l17_l22-supply = <&vph_pwr>;
+		vdd_l18_l19-supply = <&vph_pwr>;
+		vdd_l4_l20_l21-supply = <&vph_pwr>;
 
 		/*
 		 * S1 - VDD_APC

-- 
2.34.1

