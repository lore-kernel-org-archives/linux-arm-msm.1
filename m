Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182165;
	b=cIsgikEJFouy0vPq0T+gr6DJ3fTUvSTqXHj0L4bZbUkwIBOBgjygprIfQCy2ZCsTnwtn
	 tCNE1mT/6tsFlwkmd11ixPMUjldN/c9QHU+v9FX65O0mAD7ABAQl6LPHRtIUOp4YZSstw
	 2kOIA7H1LGyPdc6Y0lIkvsV0+nrI/a/ZOt/p9ppBZVxe8NC0gpqsfwTDBY+Wzyhv3N1sp
	 EghnVBNoWQtVaN0+dQppGFWsRkFnWFEfhdAT1kmhXJdypTZS7Ih+VicrlTMskAj7y3qnw
	 U5+Ws76vYFPA3967yYxepTUy0Rbi5TuHKwSYLOqiHEaQpLaLraeLsddvNWpFC87pYaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
	b=qzXi5wAXwzMN3gXMEMY/k/Rax7vMtB2rmXpJL4qHXrtU8Rj5ChgVoI5gL/VEgk/EsE8J
	 U4YIWAc6l/ioz9FA3xs4vwHe4pfuzXC3btdYnHfUnaR0LtcHd05fJr3HXwC96ApdGUdoZ
	 JiymM4Nw0f0bVvzFQ8d3zWhUVCIeKVBwa/Hmofwnd6PIpB3cEHVonvDmPDbUZlN53my4x
	 EqM9I+QqNgflHqLHXIRBqxkGtvgQF8yDso5cJXUT+UIq11z804Q1RieuyDW1nsf+xjMdd
	 sIfC/+3e6QAf2r+NffUeq8pnK0O3UwcCmQe1++Gj6e75buzxUU+tYduOUZFnG/4IHYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bYmi+T/L";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JyjD2giA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E21606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94E21606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bYmi+T/L;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JyjD2giA
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjxGP1168955
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=; b=bYmi+T/LRHoqTqTd
	94Gqlb50tfiow5+v8/rkXqpFl7NdkokObmijgUeDEaWR+e9s/xS1QFWZehImv8p3
	woqw0aXLr/+6XcP9nlay0j/n4MXOypBgrKYgpOQCejOcjtSk88FTAmz+/HeQ+WKQ
	ph6O4kS2r7YX4pwaKw1aexGUQ9H1/7MVBspLbtRIjy5mjPmk3UhxoiLx1tfDkET7
	Ln5tVYMIg7c7NgVikJrnrsBQ3KaFqefCMdkdmK5iDIpYEhKHaoxL3bRzuR+ppn01
	UO9Yu1cnzw1Nsk1+3OR3yNwgiPuiKyB+FML4DLskm4o1oi6JAvpWseKO44+PHcPa
	hLOCDA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5uy5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:42:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3854627c1c8so1301580eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182162; x=1795786962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
        b=JyjD2giADgc98TPYiW7wUHDOmLDzeeWSMo+oWV2z++UuYK0j7snNqofjrKHAhkfkPG
         /hw3kcbs4XeS4XMBd9l9GlJmoNAazP7AOHhuWV2FKb9UQGY0nzadKVDmbRDLYXo2oR9A
         uGfqm+YhWImNY1In/uRpTPc+dTiHmY/Fc0Zhy/XhEztWr7DR37XHOqSIjEnbANP7pVOW
         BIc1qvXLdZy6Fx+Q+ozrVMMLK8i5sBeFokDxneZuMksUsJHV9kh81mriK0Zp5MH0KBAk
         VgDQE2+GmAqcZSsmxJ3FC606hLhHNw4feBRQcteOGB2Trts1iADuLz3Dx7Tpp8wOiG3Q
         eEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182162; x=1795786962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
        b=0ssDCzpcQrDU/Qk71OPTbYUMnf33NcJnYcYk4j6HVwv7PpwyDCnuCm6eaJHR0UghI5
         IA/zQL/jZbtE4sNiG5TWONAxlyYdiOF8nsNwjI5LhRuQwOeFublmOZC1aslhwd/sUtGi
         AWo/Y5pZ17MGAeYCLAaDKl0u30LYxFi2CKFg9ghVQjhpUgRud3X8hZBw/NtwVb9MQEgO
         /z+8nyFJa8X3n9vHYbVDN6p+nMkWiKPW5IcTiAg27OPs2TMjxo771zBG5E3uk3Sp2VAj
         KMM/e1DU/RFOsvTDskeHRzrm1wmeC7Lmxs5yOEafLhwr0GBV3QsQx3FPj7q9sbts3Wh5
         5QzA==
X-Forwarded-Encrypted: i=1; AL+hErHOmB2rjSpXQQ3yC4EwoWf4jD6kaAnj211XBg2/8Mmfy3Blm2LJcmx6MeCGibcw72/eSfzKjXc9VDaMq8RG@vger.kernel.org
X-Gm-Message-State: APuU4Z9WGwndCFrK4CFoiUqANG1q97ehP2P6TXKb+TXA4QzkzLgHjDE4
	9m3/YEktOsV9QuHHmkRc7sl1cutT6X2SXNStOYVY1lCph5Ky6k6CSSvqTW8vlm2EMif7YrSQ/7O
	EUP7QZB0ThB/LHCqQcJ/kp69MzvwWOBxWq9sEVI/qdveYFiKWz+GDTMaRwnDfRv1i44P9CvnJam
	sl
X-Gm-Gg: AZFdTZcI1P+uEIbLd7WHUzanza8IeajV6R0lmYNK0vu0lJ1OLhwX7IofNEaeRd41zhc
	YjJixuqDaidq3u+x2izT9/hpJFprF0e1sAfFpMko+5tnFgA19qY9C9K01QfizvGI1bU55vRKyJu
	BBJw7uK8zjEAfqoIbwIWIqZ9dscDlxnZGO70Yg59cQ9HUWyMTUmsD1pO65nd+532c+A4zINNlj5
	Xxo9qX30E5CgUl44q7WYsacZYczmgUze1GxRV2CYfRfyJ1vBEHHxENMyGpkZ6Pg5Wo9vVUirgvQ
	OSsT/XkGdl7kmoKZ1Fxd9QaaPzn1IboHfKTd0qYxYLLS7+CVNSB0zgdIrrNomumGynx3ha1RnfN
	LorRqDwfMKGXy9lzFrJZR7l9NrKjHBr4hrCopXZo0+wBmAo/ujsB3vSeuk0XXLE8iFvhgF+VtVo
	b5Cko=
X-Received: by 2002:a05:693c:68d3:b0:386:912f:c8dc with SMTP id 5a478bee46e88-386912fe5efmr275786eec.6.1795182162168;
        Fri, 20 Nov 2026 05:42:42 -0800 (PST)
X-Received: by 2002:a05:693c:68d3:b0:386:912f:c8dc with SMTP id 5a478bee46e88-386912fe5efmr275745eec.6.1795182161506;
        Fri, 20 Nov 2026 05:42:41 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:41 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:34 +0530
Subject: [PATCH RESEND v4 03/20] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-3-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1065;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=nfp8+SD9J7PQP1TIlHLZz6YXOr5xoEhGVTCZWtBdhd4=;
 b=qTaOksY7gsG0/TAQ8p0w3sFjf/8jFeRmyK9JK9OfJYDfD45oWCkSu1bCDoibZtRSCsznkA/ZT
 w+97sfQhwAwD0LQcjnDqzk8oUA/ULDRgLgiINfsKeFTjv+24w8qpbBw
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX81ooIgGKSI90
 4S0ueoLH5nlAe/PrQFMzJno/k8swbRghXQIOGEiWR/AppVe4gTwuFoE+/LBK8siwq89OpAPZ7ni
 01aGAW5yABfXLS30Luo6YmNW7T6PS4Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX7F3qevCoKyib
 MGU5rcwU44djbq2kxevtcmuxWXs1q7AzVwZc+65/fI5q/s2LCyORQHaCu5WElWvcPgRejd8gG5Y
 22+AlyPF32bvf5LXu4MWO1TiTTLgEWb4w/45YNlGAbrTkGr3YB7A8ZwESjMOdgMN4vy3lf5Ax11
 sMndPiOeMaF6uzcuijCsJmoZwcTNoPROjJJF20zLAeM3e46tlOl+G+TP4yUa0gIF0mJ8EQo8ozZ
 v0Y74+lCniVv9SIpN+RQ5CCjblABBOFPJT4NcpfhJFdHTHmauLkMXovgIiN2Vp+UJBkG8a9RhN/
 /jRg1iTQ35qetDJTmn7PB9NC+U6ofw8xHJMndW/fYE8CWPB+X/D5auYHLF9O92EP8yQec3SIjsZ
 in1l3l9s/qEYAwX8aJb8BGNQy0vpEokVUiFcWacMbx/9Y0wpJ48Qlp9PsLv2f1mdfrmA5K+VJE5
 Qj76LF2K18tvXrcPwCg==
X-Proofpoint-GUID: Nk2seVZwYVsSeuSUrOac6P7vddvaf8s_
X-Proofpoint-ORIG-GUID: Nk2seVZwYVsSeuSUrOac6P7vddvaf8s_
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b004e53 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wmxX9RSyIuGEu2EnybwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed6..c142c7cb509f 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3413,6 +3413,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		gfx_0_tbu: tbu@3dd9000 {

-- 
2.34.1

