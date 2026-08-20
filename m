Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE47123ED60
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787216040; cv=none; b=LjAI3m6EHV8Q9sc3pGMZeY7TuWX5p5pWSgQkvCSZMkqNKXRrJDxEdnByZHJNc2JMArRU44hkUFsYtRpGmtGZTATqhrrq2FdY4pSEif7+SmN4fWbnZCxFjeKwkxjJ3U8hb/q7oiDsfXDDts4skboKIj4FE7LjKtRJR/lY3V0qiD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787216040; c=relaxed/simple;
	bh=n7Zs+sfj3JVKbeDjlNAC6tOKobXagwDkJLMc/UeWY/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BPZpVrgkSacy38ZY0sAublMr5omU/w4iwQ46bn9UxA5RwnxG9c9LBWfdJTHxZB1PjVsoOcyanBbzoVSirmKVtFcBwrwpRpMusFAGMOvPpYmLmvnD4HQrtE8JfhWCC6Rkqa4M8iIm8CFODU6TYXvW9RbrtTJqST2FlsXsuMoAlBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WnjVshFV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CydCZS6R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WnjVshFV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CydCZS6R"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6edEY2161218
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=G6rSLeSwhh0joHC9IB21m9Hfs8vxaMS/tmh
	xtXJXReo=; b=WnjVshFVQAzQ8ekq3BBtJtmNaqgiEf8IVE8Rs8f0KJqquwMpibg
	Z9NInt0DGBEQF+hgjc5Lqmiw9PVJi60lF1j7GTJjpWHObHvhQ1iL8x4anPmFYrSV
	9WSEzbNqRY5GUcp9rue0wqoRCdyE0Rq2KaVuclMNrEibg7X2cqk/VhfYyyymT/JE
	+11kaF9j4B4JfNlOF1HMNROE7F5t07BuQiTGqPhpfD5bifqRES7JPvvxAew7HsVH
	Gt1VQP+POGwjJlybBFPLSlQxjCMpeVr/X5YGVOvSDDoSJ4ODevwUrGp8nT6BN9Qh
	xLiLNOuqkbSRcsWNqUhQQsmxCisGfKSZApQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7rffu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:53:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee1ec30f2so26780835ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 01:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787216037; x=1787820837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G6rSLeSwhh0joHC9IB21m9Hfs8vxaMS/tmhxtXJXReo=;
        b=CydCZS6RbLwfdACyQsAwgsNBXTw/Ci32En8y1y3y9n9b6r7qs+OX+MmT6iEIWzjeKz
         E6PSQfuY5GTPn9LeHubtXFQS9CeQ5YmIIzFT8QMvcjNrYHKhzWyojqw7hdUPN0kNisJ9
         NyJKRkWnYDX8Lp7eXcP8Txb+TPZT977hAb6Wm3wLtHqANMzjtUTX7h8f1D7XjQF+N2tF
         5vfyFdBAQWM3I9xb8iCUYugTkYsNQptFshP9lQaWC+tdswloK+P+XlzNYvt0JcSRd8Qp
         4+XP9mqpDaURuXhD6dJSB8iKYMlF4X1SHqksUobN8SWmQIPsiF21HWLb417pthvDzrQA
         TJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787216037; x=1787820837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G6rSLeSwhh0joHC9IB21m9Hfs8vxaMS/tmhxtXJXReo=;
        b=oxYQxOjgEmPDBYvAZygmpb92tAerfJwD/05IcqP54AIuCZz53gB/+li6K7HVTU6wNB
         fzBiBlDMegjV1tycSGL94lf2/u7n0/XEhRBuRWQBN4dhr9IPiixcp1Z6gewOkh5opx1D
         qrE/S5nHEUbm7L5xZNnS3vSsnWk8yv8DB5cazR4UXBb1Z46SulX/KOmWL0mcHM6pRxOx
         cAQagjDyUQMqiAL6HhF78cwooeuROXzpotw5B0HHlS0AA5IbRd3HGr9nrwHRYH3866Cf
         O/vvhdqonq1QThSYzfikOxI8zWadsqqQED7vV/E8HTD4p5+AbYTZSGrX58qMPDBKNKJe
         JNww==
X-Gm-Message-State: AFuF++mhYVOh+K+5U/j4G6eHqHzUoIHdMOuRIBY8xRBvp+uK4sg5/SeU
	2YxiMO+d42nFoBzMax24wbM0wenJ98x5fD5WwsObV06VkBiZTZRpkBz18E4jm+OkZvPRD4FISKm
	R6PEb8L8B196whSpU27C5TcaSgQXHYpF0K7DithNzFFF2zIXOo8fo4mEvIzwB3fgyyvVg
X-Gm-Gg: AR+sD13e77ncqqnoLPuMSCWUoBdIlpbHc7McRpiYlzs51ZbRjJmv81bxH3BVUQyy6ig
	vDOrwBUGEUKyicHsY9YPMDEuUKtBBkWA97IggEaxlbfMzZndCmw4D8cvkcEccOG3hg1JHMdhe/H
	siBlB3R++8YpQ0H77zoygupMEE/5ukq9exkK0e89NIUOVIfhirnUsUOT410jdZyOqWTN1dWw7bx
	KtjzwQpkkNafsnNvZ3Mey1YmTHaHTIPJbmgkcYax1rrkMH3oIfpdkFMpOPyGauVqHlLxK8B26F3
	7G19LMuskBGFN+n4uNbr3TWQJJxOWYlIXFVm+BlYd36H8jKaz88kPUO8sHkpdJLCexcYQC3RSDz
	MUx6CHcDSe+JdDZrrv+X2u+N6+V147S1+7b/KpA3NInEQlAoCWg6LwbkOkaKys5JhszUdAw==
X-Received: by 2002:a17:902:ef43:b0:2bf:27b2:4b80 with SMTP id d9443c01a7336-2d5fd7121cdmr217454335ad.14.1787216037412;
        Thu, 20 Aug 2026 01:53:57 -0700 (PDT)
X-Received: by 2002:a17:902:ef43:b0:2bf:27b2:4b80 with SMTP id d9443c01a7336-2d5fd7121cdmr217453565ad.14.1787216036900;
        Thu, 20 Aug 2026 01:53:56 -0700 (PDT)
Received: from QCOM-FNWBis4jZR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d353556sm4059325ad.0.2026.08.20.01.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 01:53:56 -0700 (PDT)
From: Xueyao An <xueyao.an@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: qcom: shikra: Unreserve GPIOs 14-17 blocking SPI5 access
Date: Thu, 20 Aug 2026 16:53:47 +0800
Message-ID: <20260820085347.822-1-xueyao.an@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA2NCBTYWx0ZWRfX8qEaeELcU30b
 ikirxUqKvtJ1Gdv02JePKkMfum6PTYBmuhV1vvg3j7AHMN+QW8MPtH0QG+1ZpGDK2Khrg0PbrEk
 wSH8Tuniuk3hAFjNMNMCfHNJah1iClMVcMjwzAZCvuFgg6Pe0waUclYLGLKmMtWe4PGrmLshN5G
 /V1lvUTLdBUAJ9IpFS47G2eY+P0XSaeHHrt4J5z8UCntTT3WmKJb3+ThHnZcEnL2PWe2wfxTXzV
 OEQBm+78mWiXUZgO9827FKcXkTa364JFanADJLmj7ic8ZCRhLXakKXgZE3m8RN531NDEmAxV8T3
 6tJuSx8aFoWLEEfRc1KnYoKEYtwsBHmttwgolj5BfFl7484cB7KVTymnV87R6SUt4rzc3A1C4hT
 oca+o8SsDuf42uX/ertyq4E/FNAfThZOCqDIyr/R7jLPgFFmxsx1XpzID5JWl07L4QkzJnGuWkm
 Y6WEk+DyJpIielZ+big==
X-Proofpoint-ORIG-GUID: mDa3VqtPLNDszL6j7Hqb-1tJuMqbtBly
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a86c0a6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=AHVglHzCgFTiPKyIrRAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA2NCBTYWx0ZWRfX8M8sYKFqmBtR
 Fo9wt991nLYh/EWFUtZNIJh6Rhz002qPaPHVqQT9y4wWzAJrULjYPE8jPxCy2du9iS9TcFhKkRV
 HARr4XP9TqAR1QLIrUMhyJgOUG88hvk=
X-Proofpoint-GUID: mDa3VqtPLNDszL6j7Hqb-1tJuMqbtBly
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200064

GPIOs 14-17 were previously reserved in the tlmm gpio-reserved-ranges,
preventing Linux from accessing SPI5. Since there is no TZ use case for
these pins on Linux, they can be safely unreserved. Removing them from
the reserved list across all three Shikra EVK variants (CQM, CQS, IQS)
resolves the SPI5 access issue.

Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 1 -
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..fde7fc035bf5 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -197,7 +197,6 @@ pm4125_l22: l22 {
 
 &tlmm {
 	gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
-			       <14 4>, /* eSE SPI */
 			       <30 2>, /* NFC SPI */
 			       <138 1>, /* NFC Secure IO */
 			       <155 11>; /* eMMC Boot */
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 4ff97945274d..e119ace54e58 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -219,7 +219,6 @@ pm8150_l18: l18 {
 
 &tlmm {
 	 gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
-			       <14 4>, /* eSE SPI */
 			       <30 2>, /* NFC SPI */
 			       <138 1>, /* NFC Secure IO */
 			       <155 11>; /* eMMC Boot */
-- 
2.43.0

