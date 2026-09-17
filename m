Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3B04E06DA
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646125; cv=none; b=T6zXroUzeSRMzSpBKMo9cKk+EW/fJs0700ZcLz8VBaaTPCkZ3ivQuECkfXB9mrIogHkf/A/2hGbNEMuAfwxbIW2JZAnh/ycCInL4s39zRsHZzoZ7T6t13QwP4YI6ZZ8NyRCajD71mJ5GRa2Ndi8hoOFzJaVcgrAe3aeI5HDynws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646125; c=relaxed/simple;
	bh=8+4xmLOkorsEWAkmC/1FUibHOZhU94NEBX0Mwvgx1z4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ppr1Ya6DNnpYVM7wXz24uTWf2bupo2tSLbQKBe8goVAltymZovFwbl1a5gU3iVV5HCjnJB1Gefusc324lmRv0ZX1UQkAFhz6MnuD1PebNyRuWGxwObzwqtnIjaAHqOtOBBsoj3Uw4FWHEMwUxUohQFzZfGYnjlLVp2+MiUtTSuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fHC1UiMD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UKISleHd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fHC1UiMD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UKISleHd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZrkN1863441
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3VP2laIwY2KMI10T3FmBbFvr4EihrkUSqLsipKOh/v4=; b=fHC1UiMDeOjye1kK
	CCxuLMtmJdz8iyqLZhDsn7+PdlroGV9Y+HTz0RC8Y3KK11vK8sjeyY0akZUWairw
	PW0+jkf5iFt5r4yaeP8j5Yz5RAUym8um2p8RSfyXtvoy7Eb71LhoPy3NghWNpW65
	hNquWMjveJMsKiMRSwYNDsg/iZ+Bo2vgBQjsGQBy8IF3lJre+BDJuA4Mu7tbcLJ6
	nxMXkX1FGpr6k5BOc0nY9uwROhAetQtoqM9eg2b+R9ljqdBdTUEU3v4ES47Qks34
	1gsfrpS42+2DOXvWWkf6YwZJ27AEpYhVbxlcncrRcT/jfa2QDNnJ0XVYbBwsZImo
	nwT2Zw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6av2t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so1674852a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646109; x=1790250909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VP2laIwY2KMI10T3FmBbFvr4EihrkUSqLsipKOh/v4=;
        b=UKISleHdAgAT0aWizjAUIJ1DAWzqa3zHFxKy/MTpUj9yYHeV1S5aGAIfzT1c36AX27
         D1HcLMrteK750uh191jD48ZYIRQ3WXyqj4Kas+2BjdmGmLaD25TVMAubPVUoSa+Sjbmj
         RG+L5OPb9qiiZDWdfaL3NlYU3ABtJqzERoMM9GX7ITDMC/JmmT6nf+c6LpK71hGrMvu9
         LhTerdMrtThY0BrNQozesvCDANlUTCdbEcRVCuax/r6AFeludYDZfYdz+4frM/eY/UW2
         Euy3PLrMNoQlSp3r2EFULM7wVrDD9wqxyUx25BzAYHAUx/p12gSIoTplFc22G3S/iyxA
         PTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646109; x=1790250909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VP2laIwY2KMI10T3FmBbFvr4EihrkUSqLsipKOh/v4=;
        b=Y/6nKuibkIKWbk0XOUWfcD+4fbenkQUsqBaEdyfRb+XE3qZQctl1MFPUh8nhDGb1Qz
         3iowFYbx+FVuUa18PkCWMrnaf+guWTUIKzXYJYIT8ulxuuLWlghouHFQstRhUXn5y4Y6
         7hY4ll1HxW6iIhFMjK87ZsAdSIN+ZVIMTAT1Oja0r+2M3QoxiKSwR0zdMBmBJgNEZoM1
         DTzmcAP8+d0ZAycvR11NYvb2gyBbYFZnz1m10SniI5EnqSjRJvMXc9ZiAzOZ4MXtwxTk
         iq+MTUj7YoYitU+hnVWZnmjCKVGgCjWsx0N+B+mF3TtGNzXiE3x7TQsnm0nH+ZEgpNd5
         s3nw==
X-Forwarded-Encrypted: i=1; AKwUvBzO6Vmqhtn1tjArVhk9LEFuS/WeKsKqYS5RBODr8B/sZbEkVUB4HGpDy570h/urZtqkhQQuB1x7QBKMh1FB@vger.kernel.org
X-Gm-Message-State: AFuF++mtj1C6SOei/JecGK+SLGQzLUyHIok1jWCxgo+g749UQKTYU+YB
	EFvlfKnnwyajWD893rSBEcMPV61draQ2PKH17cXgRAwAE4yOYF6wiuq2vtfoXkdAhmCJlnPwsLy
	EqNb/TPF9WIXL54nwN3TUbZcJhHpLrkR6Exd9PnCMpjcAbVj14sQ8bdRiXgVzx/u9RJ3p
X-Gm-Gg: AYBFou03U2uutzgy+cjsZwOLf3hNcZIyKZ9D3Lm6do77l/QoGW80kr2QzDy/tHNRfr4
	yQUzFnZFsJ0O3dOZUldF9/rMdxskL9EKvDLMQTC97Xr4vAU/N8A51PDl59+y+d7UMhSj2VBEmFV
	ZoHSxN6caO/2NFSEyQ3kkSKCftbycNkOzK1vO1BT2+qp6+6wE5dKFKIKjJ+CBe8JEoQKUrhmv9k
	ruH5UseRkDG1aascYvqfkMQHi1LqEy95XGjL7bQb7jQhyyGUFAdEfhBMQJQZbNlU+uNQOcOnJf3
	Bpf4i3QnscetzxVqIg6HL0QN6H1LRVrkWuEdZ0jlX6nCUtoZiZot94UKZFqTK9Dc1sPteyFK8Pi
	F1W+P2HwR92KhdHD1dTX5gJuqef/19BGuuQ==
X-Received: by 2002:a17:90b:314c:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-39e1e4e3559mr13395634a91.19.1789646108583;
        Thu, 17 Sep 2026 04:55:08 -0700 (PDT)
X-Received: by 2002:a17:90b:314c:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-39e1e4e3559mr13395582a91.19.1789646107982;
        Thu, 17 Sep 2026 04:55:07 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:07 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:16 +0530
Subject: [PATCH v2 08/18] arm64: dts: qcom: sm8450: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-8-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=1321;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=8+4xmLOkorsEWAkmC/1FUibHOZhU94NEBX0Mwvgx1z4=;
 b=LrTvj2wOIANwPEHXzyOOL03h6hSUqSpSeNbKHpN0FyXijkh+pfvgaYSMOx15fZfC7fzc1JfH3
 mHZ+9ir/yB5AWHg9xfOAdzoi/XzKzZPeLEwFL6nQI0M/2O1rI8iQRC2
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: ZANaJFHjiCBC3eJ4K2aKEbAELL8vQwPY
X-Proofpoint-ORIG-GUID: ZANaJFHjiCBC3eJ4K2aKEbAELL8vQwPY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX3s3cYVtoOsEb
 AbC6Nig5KRcyr1kAzCVGLHl0N1HC9biRDEzkwIuwWTrPPKc6jvwn0TgM4TdyUW0z8kNYN/mAtp9
 /FQ6HCvEP0esgENetnjFd3rXPXXnidsiD3hU8hTsWqRi5UQu+sL10j6/WNSU8MouNuLS+YeSygw
 ENvt/I3ZPp8PUYqKw4KILlL96WbK+j/N3/YjvTEqW2euk07BgdvLRxBvojVZm+TOelUWOrXPOJV
 2UKSF2nHk/5FfcKT2U2P+taiN4l4ao6P5nLORMP91yv6Nv65R8z7YOqey8RwZXgxwhjoC8iJ38I
 DD089rmcnoy39E6tw9CyZ36Ws1ME0Vu6fJ9VWeofSy7zXQjH6Kc4zOASjC/qijIunfKSw0rVVhB
 R/Dvpjom7clc2nsLaOZKm/HgiKqT2bWOVFK1XF8KEY2TEoG2fMH29/sw8yYIi3vvdsODeAt+tSZ
 YxggeKcdmpSm1GkR5lA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfXzRCVUmmgDNfe
 fCX+Z5mSmVhf7MexapQNjwwaN5/QxPHuwKBoyMpkiLXXqC4m+EbybowTCfA2Rkqr7iMkVAfhDuV
 PwWsU3DlqBBDAkc5gep0+PSnB0cFTpA=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aabd51d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b8793482b181..7bc5f85e7ebc 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2021,7 +2021,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
@@ -2186,7 +2186,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1

