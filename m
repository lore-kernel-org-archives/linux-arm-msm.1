Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182201;
	b=dag8Akl7NB/C45wrQq9O1wdBhkQounuHAnbBgB7hHHXGmMSG1LyGyER0oATr+ftyIjru
	 XM5+kxsYzYtrUbmn4FN3G9wGKeXYxjR29uH9ARRmc6aoVs6k7uLkclUo89AzQut61Bge1
	 agxnMElOuUMCFgmFLEzDrM6qwgsb+f68fNewZr4Y6PWY4UWvSW0fEazkwx2N8TDS3Wlyk
	 y2LDinAZcBRIzhg0fb1CcTnzN4qlOliGgLqdjqK1KRSgvpXc5rJUJ27Sf1ZXdt0kU008S
	 mua2FumYbseMO8Te+g5711X9ryLHzhSWPCUc7vom4Idu8RflGGWTJN1925sa2b43irQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182201;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/c/KG/bwxMNjDAMEpOfesqcMkfEXvpGwewsDe4qI9VU=;
	b=nuZT7vlfIwugA/pa6ManZyEXPHDlMFqkKtRi7eDJgP5LKnqKyjrTMRutRD/to/HuuwsJ
	 oP+9RzBAUxPfpV6sHHo66zC6zgFuUZC31m7CBuxuuEnCPxXOCSqeSNMn9T3NTwY/fGbEA
	 qtXSGw8yZnZV1H2/m9EBZ18kQ/jJnMvXdFwTgFOVc0uRg/vQ5sRSyO06rMugWVX8fY13M
	 aqnvN9i55CuYSs3ya1Bv+8vJr2RLLqaNUAfr1WEM+PJuFV7xsBqykZa8wloLCTMJpTOkM
	 ZcsPjqTYPuIc/atNE+Ks6GBky1P84qUc2dfhw283JiTGP7vXRIear1y7jKohIx4u1Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=foY1MxOt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XS1Aegec;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1328C60A381D
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1328C60A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=foY1MxOt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XS1Aegec
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk6N53987226
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/c/KG/bwxMNjDAMEpOfesqcMkfEXvpGwewsDe4qI9VU=; b=foY1MxOtGLeNTRxf
	Wpqzp1LgBB1omD+/4FjpAXV6k6mvbWzzlYh82qiTcZUF+SfmZIbBdpu8INIvIzKd
	/ErMKdgAAa9H/6RDBGfP1moSSYgYUFgoBDih9PSjAcsUoShwF+8I7zfBff5+V+xn
	eEtHGtjVmYJt1+xIIFfXp/duW8GP8arigTaRyHTptHzPzsGDPCHlVJg5ZaR071Xb
	ixou/MSXqbT47om0AaP+eC36HrpmqvyfNiXUNNwznEuvDJvDxn5fph+STgwwl651
	knBJim8tMzreuEwNcV4gyfWtveBXOskzSHVIFGdvDPC3Y1rzwK2fkaQExyMAXF4I
	yTvNCw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu81pwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383165e9b0fso1015553eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182200; x=1795787000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/c/KG/bwxMNjDAMEpOfesqcMkfEXvpGwewsDe4qI9VU=;
        b=XS1AegecV9743TXzPJF74d+hX0NoXcV+hnfuRAvUe+co0Ta2upD5E1AJGc+gXYWG66
         NBHEfwAWTCGCecF9bhaHCVxChSW/gFRU3Rrs+g4+/zIPpbb2L2KhYCPcbGKd/jLfZ/2y
         EBb5QrJpg5WE6a69gQZ7IEbJHRaTSWSvNJh4F2PEJiI13PIf36Ux9JN2+yo8fJXsotDg
         i4H9MkpCC+vhnAwUYwwZe0whBSYKy97EwFkSF/8OxUTi6j+QeROKLpro+uFXrgVUrvpb
         XlNaZxOMFKXT/Ir082ixdFt3c5QGlWzDT2PXoelWBA/AqOdQrFzDp4Q1VmdnM+kiQgWl
         PgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182200; x=1795787000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/c/KG/bwxMNjDAMEpOfesqcMkfEXvpGwewsDe4qI9VU=;
        b=dxMLi5k1oF9lYXvKaP4KDUmXzPblsW6e8fEQsHqdc4UrqBb+QVPKi5NKKGlEuDpYDk
         ufOe9Iukbz0VI+jyQuGjzEo07oFy62XGobCY7RfCuFwA2S3vWgm1hOlibEZ2VySdaLxS
         ucSlDk3aE7F3wIgYCdIsD9aCGTmf/QeKBwCvans/z9rPUryzc4aO41EkQZTfzMF7g0VK
         CWz2hfxgHHwjaz2YMNeCy+QYe592ON2TitlyQeGEkILLZqdWFgLYWXF8H5KgcD9U0fff
         b+z7ti2b2PRhcdxns7zVZjoDQp+xm05BhFuJ624FFQgsurMOK98iUpJnlSp/smuBXmJv
         /lAA==
X-Forwarded-Encrypted: i=1; AL+hErFB3N0OSOAolGFknXXHPHaXETppShru+M5yGQLiB8psJLCZXPCZHOEUIwvKYGgfXrP6Z8b1lE/H5sSQTU3B@vger.kernel.org
X-Gm-Message-State: APuU4Z/J/K1ulRU60Fw0aTuURzMmxEJymyZGSGeEyN1HPe5u6/srFa5f
	BNX/Hp/DzVJOXNHU6qvxJij0B1jQVo7SMjYjMmj7V5DGZ8gVXDMdRuPEsuhM2JL/vf8EA+ckzeA
	kECmPmFYQj694SRZ2ASTY9Wn1QcFNimIxDUt4q+t+AymOZgh4x0wb5Kl967+ak0JAfhaon6+P5m
	if
X-Gm-Gg: AYBFou3RbBN8qgwXb1+0sKOH0/tz4I6EjOdF/IqL2HQua7SBvxcZvIrDQhBTkiSsM0q
	P6sorx/QnEOaoO+7o+bsdtzYkQgiG10zHq/hsWvIIxjt+WVq8cCy+nvjzzuz3F22S6htT4M4pQA
	lHXyccHK+z+PzOaEMQbnBRyvxFufyKzbWLrHmVJG0PrbRwOPgpXaOh41710jiuk5KdvdwphOujf
	/F7fd6eAa7AVvb7yjXZrrRwnX00cMDsMKjecfDaC389JOSHHutXUzq5rkEA/xRLFvwyH2F7RWs7
	kGSesQkSYfGChGGVANstkfc3vSypjNiu1QxkM+8Sd8fuAZiWyf7HeoHPvNJSY5413yoadpEm+4s
	Ls6kpi36Jk0n1NUdL7A2ZFql4qpVznOv0dLjWfu41Gsmh4F6hHxCo2qcMt4m6rDk2BjpacYUU5R
	rbiTo=
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr3495321eec.41.1795182199463;
        Fri, 20 Nov 2026 05:43:19 -0800 (PST)
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr3495275eec.41.1795182198873;
        Fri, 20 Nov 2026 05:43:18 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:18 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:41 +0530
Subject: [PATCH RESEND v4 10/20] arm64: dts: qcom: sc8180x: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-10-be30526391d9@oss.qualcomm.com>
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
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1059;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=EEkH7RME5qFBUL1GYWCz8dsl/artX4YyT169jSjW1ag=;
 b=D19IVJaRY8IM7fDFyum4SvhwQsx4wXunIKVaE9hZ9h85bUztqtI7mZs5BEvllnGtD1p8qtRRR
 KprqJp1ygTlAGWbe7sl8ozE4DjPRI5YllExdodSObEJfkOc69jqxYru
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX7PKtVlRbyKx2
 Mmt8yJPrjkxDcckmVyoE+yxGz9Te+P1zBeQee0b7E6aDt4/kjpLZr7XRHnaz10BHvNQo0ccfPAa
 gIL0G0B6NoybaXkXAWwatORKtPwcgIBW2Is/OJPEqCitaNRL848qZ6laDXggAj1pj8JyM2EDO0H
 VnGtJvQ8Kl9dXtm55AkZsbO4gMUl9qdidfWzr1bQhiI5W1LbYBQDYRcGpj2/0PXDc6KL0RmBbHC
 qyLu/F3E9c+lTsAzX3+weBHqysVU9W5BGLAmtuCav6QeQPPCaxc0uvp05LewDiCgjsIdsuRu9+X
 PGHE6KzAqpKNUfs28N8P4WMRspAhOwn/fDwzU7UUq5FZijtRxEAydE0CaxgmTZKbMYOe4N7os7e
 2jAtAk2AyonZrJZXGev3iqIc2dtLAvA8Xban9ViCrLDcRVElxyqswEkKRwy+OBo8jP3iBpQykx8
 sJmrTQc+tOEQYXkBZKA==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b004e78 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=THzGGTBd8XYxRjXI8TEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: SgArwH4q9_1nRhOHy0YuiC-NfGIk14lw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX9eXiGKrJ+XJZ
 bx32ct+u6QkLEMypEuT0TDC7i4y755pvqUNvJSG50KOYGbi7QJHiia9ciViVNZj7L+XuouCKSKP
 EUxpEo4dPWYxZjJyufk7JB2iV9GIuZg=
X-Proofpoint-GUID: SgArwH4q9_1nRhOHy0YuiC-NfGIk14lw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On SC8180x the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index be79608b7161..acd05eac700c 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2410,6 +2410,8 @@ adreno_smmu: iommu@2ca0000 {
 			clock-names = "ahb", "bus", "iface";
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		tlmm: pinctrl@3100000 {

-- 
2.34.1

