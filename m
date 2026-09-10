Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98213493D4B
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046977; cv=none; b=RHXTUZtRws+BOMuGAh84g4M6K0YhoJiLA54kpE0z/OYwo1xwGjckOuoGyfwZToB4MRfuElKHM117Z1HMgyda60pYm4O2dpwQJXnHvVFWTU/q88rJzfd9qXu9r7gsZ6L0o8El/YOC5KJAnbJnL7CtcdCoxqqSZ8dfHwdifr0sdy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046977; c=relaxed/simple;
	bh=GcNG7DWryYR7zq+rPZ4MedCY8PT8P2uvYLsRVBOtgpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iErPvt8VGvdkBrBMn2aWvc3TqS1+5P9xoxLpZ5oy+lbkGyXOi6a1BoO4Mg/V0Tp4ggBHAQnNW9qkhFcxK3wFRJQJIanOKiUrSeq2Q2MomsPXwxZsvYh7fO+/UbPV2XM2SFjFz8lHfVW7FphxQtptBvvDgeG3fyLKxNh18VJPMbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CniCpISV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bl9SpWgK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CniCpISV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bl9SpWgK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7jRU383777
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0xnt/0NbDaGwVlbud7WJZWXSHceVMLMKGtzJpWOacDI=; b=CniCpISVMbKe/33m
	mqxab6YE4iTwResZJOneXqqhgfarTgtgF4tGVqKKTji1/9uPegHAT9Y4mcVyBlzU
	EUh4CmJlzWB8T/z3XHQDzhIaI4rnzZbP+RdbUOdApRyxDp0mkwUPuUypW/BgdD4U
	XPaTeNCmOafdxxmzT51VwueBbz5p1OHPEDIjF83Jss0XrF5gKGtFekmK++lYCmQO
	x7EX5h7RoDYzzeGoxfBGbTebUeoxM4XSTPD4UxWmRYrrjoZP1t8F5+B10CYAJ54X
	eGxMYq4GtOCM67y9SyAksGCLCEKiMMqehVyrze0uNQcHgZykMVbiuMeyygKw6rGK
	Z22MSw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydv01t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:35 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b1abf73d1fso3912754eaf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046975; x=1789651775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0xnt/0NbDaGwVlbud7WJZWXSHceVMLMKGtzJpWOacDI=;
        b=Bl9SpWgKjyTrLtNxh12D8sfNCY4V5E2X2nfUMRwH16Xby1YqzMiLkIYRYpLBpG9i1p
         JlxPJBmHQHIS2zt48lsRvYgMlrNe9uMxPludk04Rxg9KWfMhWtLmb7uPc4GKTLRAs/ta
         yfHDBs6gNmHIZsZ4soyfw+JG9ynSKAue+YgfDVabu121Gknil7WalmoYFCYNBDlDx3kb
         keWSR1xd1wTXWZ7bT+CIYo+iFAJUABmUhrMm6aZfESEoH1YLOw2MpsVW/bsCr+WVy+pA
         2EgURX0Nvto2Z7T3Fk924SjmhtxwWZ/XAwgkElUZLBPFq9A5wG0LSiWx4Ng/h33zhRlG
         Fc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046975; x=1789651775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xnt/0NbDaGwVlbud7WJZWXSHceVMLMKGtzJpWOacDI=;
        b=dorF4ngPzVtqBpcz6Js6ayzuuc8QhanvkgUuEmm0nFMqxmQQ3hn2O30ZKo7rFEDbcj
         yHwyPS8kkmryEPp471vh8UOxmv6VWZZoIoqzEHvzWX8dN6de0bjjSz22f/N43EP/cIxK
         KuD/bSzEmxc+EpMCUmnTcmR/g5HNBSo745/GXEJC9VqHgfNDWAx2HL9TgYBRT7vG9zPk
         Am/dkP2JQ2rIqMCtKuYnuUPGvAP5B6T1BuzM0l9r0wHxBfKzJwHCZWYgozDPw8uOUPr4
         pC7J1Ri6M8uvUbG9K6sKgR1LSsJZw1VqWKonLtr3xyilmfmNcXcgAijb4ophzCj0ufJQ
         up9A==
X-Forwarded-Encrypted: i=1; AKwUvBwjw2tJdbatwAkCitvQI0ofQJGrE0QoimpMbrJ2AN3zy/gQaLvl/aORWVtAetMxMYf+IxzA1YHy1TjytjC5@vger.kernel.org
X-Gm-Message-State: AFuF++l+YrDGdzRYM5OTLlcG1Tpk4hCr2Ku9XiE2VengnDgMDfiLw3R3
	xErkpf1lO7uc6RucTiHT57edOcNq9p+0WsbvQlrxd8eLWmg4f/gLVWLr0GTCJFogGQ+aAMkRpGs
	LCJ/mfhFRulnadFuG2SWRm25u9CZkKZDyzHUGvOOpmJoD9FZnTDIwkMUGjcXYK4DPuLLD
X-Gm-Gg: AYBFou3+vEAhohT0j9bEa6u2uKAUgSXgaPo1EmluJV/jveuyr6glRTZnthHScwDzOyB
	GX7uABaMQAz7Hi3+ytZPzNBUBNGhSA9kWAqK+oLncqarkavzWu76r0uojmn6DSLHyb/uVnSM+/X
	hh6xeVc++eUHIY27K/oQKObSgGTKcyf4RPrcF0sXo2MNBsLJcMdsasE1T2LMEeJPPYmIsEeFK/u
	udUdFDjEGfpE+OfijXuMV4xjVCGYzIcxybdnLsfmYuyGg47/0xsPowgZCdunoVXdIwGmHKX5N+i
	d5UnGJKS9rpoh44MH/rRWSWoH5/YXtQ4/L9FGD+xjhIz4HS7lwMt0IpCC8/pB7D/sCunl/a1qN6
	eBbCvg/YK26yj4FRMUV08xMZ9AKDe8uMC/GM=
X-Received: by 2002:a05:6820:4dc7:b0:6b7:8396:f3d4 with SMTP id 006d021491bc7-6b78396f84amr20415133eaf.54.1789046975237;
        Thu, 10 Sep 2026 06:29:35 -0700 (PDT)
X-Received: by 2002:a05:6820:4dc7:b0:6b7:8396:f3d4 with SMTP id 006d021491bc7-6b78396f84amr20415104eaf.54.1789046974602;
        Thu, 10 Sep 2026 06:29:34 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:34 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:55 +0530
Subject: [PATCH 06/34] arm64: dts: qcom: sm8250: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-6-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1575;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=GcNG7DWryYR7zq+rPZ4MedCY8PT8P2uvYLsRVBOtgpM=;
 b=83x/iSlYN8EUrNy7PF4GayGOrSrjcE3ZHjgi6pQr/rsQM3maRXCuqV3WW7mAfRyqChzlTUtlR
 Hjg28MxX5L1BIM8AxEHEKI5AZU5JpIOqmnPkNPGLY6PbpZqI9ehOFKC
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa2b0c0 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: gKPN1s6IjmbjCNs4-kc50BlANN2pf7FK
X-Proofpoint-ORIG-GUID: gKPN1s6IjmbjCNs4-kc50BlANN2pf7FK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX1kGmEfWe7DSB
 7ZSd8T5XATNdYb8LLTEIvrfwrm/v4T41uE5T1zRuaL70dO1MMEdjCQA3koqh1rfIY+iLUN37TUt
 XI/lq22RtAFH/aujZJw2cvFY3Ls+f4g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX1D66uxMri6qX
 BevhXLecBlJRwL2I5ZmF7rMyV2b9CXse8IufTHmH4YYDoXB3eBgu5Dar+VBrs1fIqYYgtyzmnQp
 KIuOQ2/EsX7tWCVxMIOigzmcGZ8FE8yVLHlIepjYULsWHSihaeIAo1nmmgEkUzuuSuAlEVH+i3b
 fwY40esggnW40fh1nQ+nh0Eyo+/79BLxYU7jKE4OkFc5VflhGhAOQdXs0oQLEBC7YfQ0QpkT4sI
 DaXZ/MIW9hF/ejK/IsMQoMOu6JhSJSRC2tj30b64t4TAW4M3dyO92VTYT966Pcvjp4NRNbhYZmX
 B95JMMCP/rIrG5x+K4VjnddzBBq19lwSepMzL/WRdajtNFz+jdPx0mYcjMVAf/0E3eE9lh74gku
 M57c2gv32W3gNA8O61oM9nuOGQ7gk0sClwZyINApEpTMKqvxDb88D7XGPiFWKuIcWyvYeB0q5rI
 Hyp8qLoWFjnnM2N/4xg==
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
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 90f8b091634e..e0c357222bc7 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2211,7 +2211,7 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 81 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
@@ -2338,7 +2338,7 @@ pcie1: pcie@1c08000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 84 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
@@ -2465,7 +2465,7 @@ pcie2: pcie@1c10000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie2_default_state>;

-- 
2.34.1

