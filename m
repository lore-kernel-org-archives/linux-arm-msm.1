Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4415439348
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625816; cv=none; b=hFoscZCRMTHFW/VrVsqnOzqXG8jBGZVWXlmqw6Guixwk8OEnz0HbvuxWfuT+1DShVPo4W9bgbuQ4kYuZlI/2R4cZtOqQ2DKpqS1NFH7yoJ61x17jg4S3YfmQDs0eXUzULkI76ywBGJwRY61Pf/PrKHQwF08Mn6Yb+3vpAs7Vh34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625816; c=relaxed/simple;
	bh=XuI4reAkuKlnQin1lmUNoLsA/XShnA4japSVyO1mTAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X3QYI1tuxOqjqVOBw+9wQAvVQMGz3h9aLwYFGX/KSq5vdg7Evz8RT39mq3A81gAo30SBpoRXxzOVEszxJLJf0fwDFCts/yx5nZJXLKjjJ4TkYbn9GWQpktQpcQrQJIxsqM7iC6kVauZVV8PRYTNE2jmdrlgsbbCxhk0oLI6Cdfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJH9pzlL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4M3673Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJH9pzlL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4M3673Z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L7faFj091338
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g6EKPDdVvughZmrDjXmmjYpCgANEXgKYaCBl8ydF46M=; b=FJH9pzlLs6fx87Vw
	q4HcgLD3pBOieDAX5QKMTU083FvezLdr7BN+QCfugy2kQ96/9PS6rEYjFLmktbgM
	PYGZek0N/wq6rxp6APdU7ZX2h+tYPH9Ap1wCSqU1eXP7aig2jfQ/AeDQ8J19MRDh
	2FmyztfKjidOZbyr2NmaPn6HZ91toJglGNOsUJCELpiZHp2XaxAkdY35SA8YCZRQ
	7LwGaWf/miQ1okJ13Rpt/eAhmVOtWAXSPniHZBSwobXITQCONVzRTd4SjTOhUxf8
	iOFTrcgueGHFquLlY75wDxNPOuLHB8V8DrJGePfgITD3zkxs3NCYWnUDosW6nsTb
	C6sJYw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj01a9tm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:23:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so5068146a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784625814; x=1785230614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6EKPDdVvughZmrDjXmmjYpCgANEXgKYaCBl8ydF46M=;
        b=W4M3673ZDGRuGh30uDTU/lfrPUN2OJgCHTyGYulu94s6z5vsYpPwrif4iKMhZ+zF5b
         m+emS/2l/3zs1YG1+6xMSEzMgXyM87naeis+/kZTc/OVtBldW0TzO6MgX8qz72W1lPP8
         CuCmrabmXUDx6FIwdm2FHl78P2yDt2L3NuLYcCuK1ZSinQKJdIGZH5rlZmDzApqOdy3m
         37e7VNrfPl5rBJ3Is80xOcIQqxNkJPyejqx6XBXxPvzrMMz1wG7XVvpqloSfLyHtqY86
         D9x+FCR5AacWuVWvEmOif6v6VEzobJMH/ksTAjjSgWx3YeWVi+FLetGHmbOUIjRzAnQL
         372A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784625814; x=1785230614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6EKPDdVvughZmrDjXmmjYpCgANEXgKYaCBl8ydF46M=;
        b=kjxuMKl6hG6AAaJpggROYpd0WAV7xEDYxiwurza44rGq8IZiiZOIAiSOALI6R0QF8j
         11HptdQCq/KMabFRQBmcXY5mYKZUrP8ptPEP976c4FCs+UYIV1kZMvPhft5H76nBS0uS
         PpFefdA0qNkWt5VKlFMFqGKSpxAvSck3vOxd/G3nM+lC9CBqUpklefHW4aWTF6Fwei0y
         rBn2PWp0xDkkMkQsRJq8QOO7fyHvfPBX4FVyssrMAaC96P2mheLMxkw71yw1wJeUvjo7
         S5lnWx+xTLU7ZEk/fJVUknhUNynMX+nJhGNv7it9cSwi0isKV1YZXANiAXxN5422eejk
         GKCA==
X-Forwarded-Encrypted: i=1; AHgh+Rrm8sbWfA4GQ6LH86E0gcMP78INd+QbsyIIvRokT4f41A7tVE+PsMOp+DsT0GRH/yHQVzN7qqRT6wA1w/rz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+YJawnm3Cyb+a05DfGCBP4ZnegPVroaH7NfnKmh2tH5a3nU0G
	/s8sA5FSfo22pU4rIbLPnuGo+Uzks5VqbVD1OqyIbKgatTQg2G7ZQtHmJe58/LhWiQeG98enp5U
	BvAsYYL1kaPAwgHQUlZS11hxf56MpvoyAAwwuk1/4JlBdvD+QWSZ41vg7/qWAMu4Io165
X-Gm-Gg: AR+sD13xncFax3jlQcvvMIiRl/HXWS3QqfUmbQY/K0FKzUzaFkTlIKOjW+dVi+8YOmL
	8VSTvPR11dbiC8xYcLOBuaDTM9yGKfFMqG5T2MkFrwdLTpZhNciKMinoaf5L78oFga5zzhDXy0H
	HLaRMbfe5ZGnb/nj+dY2EYcMArvkPCfq90ZZow4bEFD7l1KvpaGd9HVXCmWRDNQDAQcPu7eTHlv
	U2rg8YVNm02l5GmW3I+qGbzOhD+iczjXgL8smOtyQapbLYu/2ib4UR8rL3Fz6JB/S3e860KNKjk
	+HwFj2x4kLXS4dtdMX+5K9qJcAD8SrMlpDLJDZazk/y+cKeoguA/yExL/zMd2i/90Kw6+vcN91r
	uAgUD67onlmQ+9gVtIEAmXa07wHuLPviz5WLtJuqy0FtoU/xIGUvXwca2UPNcdE4dDc4K+3gw0A
	==
X-Received: by 2002:a17:90b:2891:b0:37f:9e21:91d8 with SMTP id 98e67ed59e1d1-38e4b68268bmr16354671a91.15.1784625814413;
        Tue, 21 Jul 2026 02:23:34 -0700 (PDT)
X-Received: by 2002:a17:90b:2891:b0:37f:9e21:91d8 with SMTP id 98e67ed59e1d1-38e4b68268bmr16354659a91.15.1784625813990;
        Tue, 21 Jul 2026 02:23:33 -0700 (PDT)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4801e0f3sm2308661a91.2.2026.07.21.02.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:23:33 -0700 (PDT)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:22:34 +0800
Subject: [PATCH 2/2] arm64: dts: qcom: hamoa: Add ICE node for UFS inline
 encryption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-devtool-v1-2-ade633accb41@oss.qualcomm.com>
References: <20260721-devtool-v1-0-ade633accb41@oss.qualcomm.com>
In-Reply-To: <20260721-devtool-v1-0-ade633accb41@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=BL6DalQG c=1 sm=1 tr=0 ts=6a5f3a96 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eAbYZzanmNLtdhUhtOEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA5NyBTYWx0ZWRfX92sdqcg90hxZ
 Wlj57uA71/+fgaLYxut4McBUSkVexzCBFz73/hSIabWJs8Bo0A5Er2KpjxyRAljZR2U0rS5E2jz
 Q8/i2xsCO1KaJrhY0U6AWTt/ED8z4o/Qk7JbaKg6PFn93T8TtrcoLJ3smwlV6qYoyMXV8KXGHRk
 6GuXRVbVkvdXrGryjcCIkUqPFj57s2o9BdCJ3Hf7y2KZ/VPLzoltYe1xgO7z3WjwgDqFIPznr15
 NecuBJOZzdookGk3LmAdS48w87eVYGMeg+8uKsWmmGtYL0nWsYWDNooUd8jq9ZugwX35G7rc3zy
 7R+Ky9HUBuPJyxGUie+Cu5zD+D290HWVbf1IeZfJFPkrJaMSiMuyE6vtAyggt2r9ase9RD0TlLB
 +f/K3vQ8MwWZU4nuap8M4x9AJ/RmQUCikjmmO8jP8H0eJAEHV4kUoyd4vP3Gp8u3HkJIfaNWblJ
 o7xDG/6j3ttnuUl0OzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA5NyBTYWx0ZWRfXxQ159zC7NwM5
 B6RH6FA4nGRtqahPx6Lm9elfqGPKAbe+WzWUBAbK71VWofqA77SEzdnWuL/Eers836T0tnSH5Zb
 kQpugESOq+s0b9CwHHtWWA/eGiHTEak=
X-Proofpoint-ORIG-GUID: pFgDecrIC4S6n1fHF3VVLqlObyBLWMfa
X-Proofpoint-GUID: pFgDecrIC4S6n1fHF3VVLqlObyBLWMfa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210097

Add the Inline Crypto Engine (ICE) device node to enable hardware-
accelerated inline encryption for UFS storage on the Hamoa IoT EVK
board (Qualcomm X1E80100 SoC).

Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 0840eb2f884f98d76442fac7888ed49a07780898..0c9b459055d720a528a319272161d1d7446daefd 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -4176,6 +4176,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 
+			qcom,ice = <&ice>;
+
 			#reset-cells = <1>;
 
 			status = "disabled";
@@ -4221,6 +4223,17 @@ opp-300000000 {
 			};
 		};
 
+		ice: crypto@1d88000 {
+			compatible = "qcom,x1e80100-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x01d88000 0x0 0x18000>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+		};
+
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;

-- 
2.43.0

