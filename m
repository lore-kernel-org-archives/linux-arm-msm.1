Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31238493643
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047021; cv=none; b=jjHE9aMNE6IaKWkfkb4p6fRL2/rRcNYLWOit+JGYsECzVV5tD7UI+ZqfxR1V9XkWcl2e8AjqoeC5QxfbhrF47vqdBhvovOx5dKZOuGw4xGW7Sj9yo08WyFfIIEY4S/AOmPPqN6sV6g88eolmY7H7FhlYKTwirdGXBrQ/eoctrQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047021; c=relaxed/simple;
	bh=8Y/Yryr+3XGTC2KDLJAw3X2zoXN+s0VBq8d1yH/B5P0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRO1/mQMzgdrpfwgX6x/d+kft62JPOOd/I6ZqxB3Y7gcFg3HVPpddSwo/lidzt/wITOdtC0SvXefV/dcNJhLIgC/A4Qe1hO77RqSv3zJxwvEQyo0HTZUOBa90Iw5Xb7WXHzyJVNPMpIkk6Lc4V31ZglLGxyW1BSeOpdvd0jvYL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUS/2Wtj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OP3xQ92M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUS/2Wtj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OP3xQ92M"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7ktm383785
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YX/BsQHJpnY8xAxQH/LA2hxSGp9XpFZNKiB39FJZvKA=; b=dUS/2WtjVBYBuo5v
	bLodGv7OyqgHEoc8j4D/xL+jKJJ8OF8w1l5fLaioRRiuhvx9dJwEd9cJC+kHzPEk
	VqMkZRy7+MDXFaaqb+YjXmVsbnAdhMYxcvGYjDprn0CylMib+66KKrDA789oeVE7
	gJbBxkSZtTLcjF/I4dxoe/t4MBSlS4hJ7pmztLlPY5jmR6G+Y4MBG4sh6DIrqRIF
	Y3l1VzVXz9y3+RBqnuBV8bQpFhwHQCRUwbCMokwApjHI14eqoOOrpAJKokPfy3XN
	miVIIUB1jCrsGGsH0tcoIeU1A4QLnLyejSU+N2Fnbg6qD3ctLppTmqPaHEUYUhHp
	s9U+rA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydv04m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so13357389a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047014; x=1789651814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YX/BsQHJpnY8xAxQH/LA2hxSGp9XpFZNKiB39FJZvKA=;
        b=OP3xQ92MghOKNKgFhlqEFa0+gihTFReq9EbLBP3Yam1J0JzyLGWZIfNzxYmqhRBDyf
         d1dnpa0ufo/Yr9OTV+XcyzP614webPl2hTZnFToSAlizOM/EkfkLWtUtskgmLBNmDvfG
         OwKgxSEj0hmkHk0G3uTn+5aw3dnAMPRb+cB8CHVjQDn77pJJKKS3jn/vcdxsO3rWaa7o
         jW1Un9HNh1i02btP4oh5RTOFsUg47imcSXcsqYE+2+no79/yh16eK1j3i4a38j7CvH4q
         5X6DICWq2N5a8EYW44jnAtbhzUOJuMM5v4qEG8otAtJsNl6TJ+V2xkSEhNpjpdS0vIJi
         6S6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047014; x=1789651814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YX/BsQHJpnY8xAxQH/LA2hxSGp9XpFZNKiB39FJZvKA=;
        b=i49BsOJrU+wjGXHFqN3tWhhcyexqJf0vL9F9IocLy6c8mPBzxYywXiQS/YoaJo5BVy
         lvqvgfJ9cRb3c9GmkuhPJD20Sk9fdWyUcY0ohTrmtdKyB9KVSrYz4bVtSL3GNce0ilDg
         PwVAyHPLIcq6FeAXNKlxjrRW0t9wzrU2lwR63kfk+JqAot9wpEsOnKExMtwWM7IniR+N
         XVhfO8tTxOGoRFcG6rdbzfEGHU4o0203cJN3ZVE7RR22ns2kbkLC7M9JZIXjg4JAQmjC
         0SYofl7dM/z8+1RYzBxwxHk+sMPBYyZJyo+QzkdvnEmb6vDvNPxr0+X70yQ5/UIMRwaE
         q7BQ==
X-Forwarded-Encrypted: i=1; AKwUvByssJXH6vohOQLeVK8iiqRwWeJh49aGI3gOLDMZRjqMeMCKm2Mdfgs+2ZDT4J/3GyZCBPlhoVHkkAo+/j9e@vger.kernel.org
X-Gm-Message-State: AFuF++ndzSdAfqQI3CyABW/i52vGBifnfoZucXfrMRlslt3vPO/enlS9
	4xjt01FruSsxvPSPYPWP05ee1j0cLLAd2vnPyvvaSWj/CkUA3rx/JEgQuCm/1i2j8jEbrJw13m1
	SQPS8iWENCu9yVdsZqQhG+DDMVVzGpCjNDB6NNHj3NejnsHFqgK+ceVi1sU0NbXvoNCOA
X-Gm-Gg: AYBFou1Fcp0TM0jbRolORyMDc+pbXA0nnDOoSiEE05712TJCHqFbeEqnlwHIov1Clyy
	2dKTjCcTHqvR38Nz4WmYnCe55lWv6//KsX7kW4Y2A+EJNa9WuOsuB/va69YtufTxCNtSoo9Pup1
	Mv0xiva6K5wCoqBLq9L3xXe6aUBh8I3j8+oq4k4syPefdmg4fIQKlw1gKIarl6+VQEk3QqmZ33Y
	Of4/0Imu/4fyI9zTXS7TFbqqL2eYJcCpkoMk8YIMsas/MmoFFEAZoJKsw0jGcmHCGHJ1dQF+UwI
	EoRFj/IZ9QzA1P7X008xoEc38JtWnD5O36wGbs9hlZfWXYgWUZop5GSorDhdC2tXJClN7m+2UiQ
	9A5BHMxzVBe5fuNwmrGwUyRHIVbFnMh3EsoE=
X-Received: by 2002:a17:90b:1d52:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39b260d338bmr62054943a91.5.1789047013258;
        Thu, 10 Sep 2026 06:30:13 -0700 (PDT)
X-Received: by 2002:a17:90b:1d52:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39b260d338bmr62054828a91.5.1789047012640;
        Thu, 10 Sep 2026 06:30:12 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:12 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:04 +0530
Subject: [PATCH 15/34] arm64: dts: qcom: monaco: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-15-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1812;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=8Y/Yryr+3XGTC2KDLJAw3X2zoXN+s0VBq8d1yH/B5P0=;
 b=NM0PidlXbCvMGDgRuEXv/UI4Xf25mzRKm7177MUv64iatMNQIwTTJoPPTv1BLvV8nZG5ocNft
 pscQLHf3uNRD8ekCzLkzhtz/fEmDvMmJmhRLyg1XqGhrpytUu6pGZM9
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa2b0eb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 3s5l0Mn6HYrxAeyiOA7IG2wostj9FoJ7
X-Proofpoint-ORIG-GUID: 3s5l0Mn6HYrxAeyiOA7IG2wostj9FoJ7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX7M53SL/4S2I7
 lqF3+qXf4B+r+h4XMySf43i1rwaoBUrU4Q6EAM2YucoZ6yba5hBKdR9UPO8O0RIAxZAbyO1Mz5D
 2S+NjCHJCyFwNrBo7w43VitG4tRYkTg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX0N48IKrbATAS
 sqT3k87Xa0AgFknbFBuWzbWeWn1iZmabJZqepqIY/gAIQP7FoocmclAKSXZ39+FseoEbCy5h0do
 q2Bjd6oK3CE+GVXPXPB9eCH7UlmF6torBt/K1JDabWvOmNwQsaORjWah7H497XD9glZ9F7Cka0m
 uHdg18ppoZ6T+1OhwNGX17drDHl4UJeB6GVtJB56FsC37HdR9g/kqQjeUHZhb6pNlSnLNqq43re
 S/bIE/Q/fwGu4qPJ8NSIMqu+tAIkzZeyJyU/iNjoXeQhNAa+7m3+cd1MczPuNoOGoALO3xzYNvf
 ZPL/siYsB+1bWqkz+06QcXCFXgeOHwPFrYGXA6faZ958EA2KfTOUq6loCE9c0OfGwNy7GkS4Awi
 y8bpZWs6I++4GV47VA7LppG4wEvXS95ovqUvKohUCdrBleNgqASwGoqQ1mFX1tq7LBsu1/MEz8s
 WHoegahCl+jGqblP0rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 4 ++--
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..b30fc7ecdf32 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -643,12 +643,12 @@ &pcie1_phy {
 
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 };
 
 &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
 };
 
 &pmm8620au_0_gpios {
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 1ff39530ea3d..2472df47a0ea 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -615,7 +615,7 @@ &pcie0 {
 
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {
 		compatible = "pci17cb,1103";
@@ -651,7 +651,7 @@ &pcie1 {
 
 &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1_phy {

-- 
2.34.1

