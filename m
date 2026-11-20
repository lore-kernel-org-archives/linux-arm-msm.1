Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182249;
	b=Cx5jtUNAZaavf3kEVjudx2EtwbYtgUxKfARyJLY8GxcBB5dU7oW+MTf6Kqu7NWa5KKB5
	 fLOkvfd67mVmu8vV2Bh68Vqn05YrFf5mzfP3/A4lqDU4xIQu6KF2Ee7qE3hz304qmSmJ0
	 quLp5sBhuEWA2CIwbIyVPD16neeYK148ksYqZjWewEzuWfzKs0+fR5ue/CBnRkW5YzcCs
	 Oang4nYkCwTmMKJhYjIwnD23SJPZLyAj6gKmskypVyBZ5Q9kUzUfOEkAetcMWvE3qa71J
	 XKwxQgPUie+1ESxCD1S+jG4CLLSbM64fQv9GSG3BYWFxQ8Lqd1uoG5NmxzvehbyGseg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182249;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
	b=Ibs0gpehcXpBoDd6gjsTlNfjEXISaqahCbvJVsGCLxlUKUd5Sj8GpRl4TeqffaACk+nG
	 RgcYVbTjyj0hytu8SudmIOOK14ZwJxrv3UEk+qFLHQLywmFA/5PmYHlghzUHyUJrmy/B3
	 rVui2QE0r4xcfSyHT318knyIOOEt75bcCDeAN5KmIW97oFIRPR2JmhwWRtUv97ZGjjo5C
	 O9SuPYHU2dzXkn5Id5N0vh9/LNUWpi8lmVrT26L+ST8zSaVDT3E2NOCKpzmzWdLOLN49i
	 7eHZ1t7j8b4yUS507qa4Vs17Q81F54Oe1qcSO3jcPVAVZjQDZz5sRW9/ppVQS6FQLvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ue94MDPu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="X2kRj1/8";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500C060A2627
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 500C060A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ue94MDPu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X2kRj1/8
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkBEe1017040
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=; b=Ue94MDPu53ssd99b
	5yrNxR81kRUlASxau7HIGQ82RGqSPI5d7tonixUXf8jZVUgM+UXr3Mk7VWP7HiAp
	bQjMHPB2qHXkV15DTPPrWzu75QqVnQqIU4Q9wTkGZz0n+HlCbVTPjPtAS0qQSHF0
	CjP/y7ulOliQZS55vDHv+kg+8Hn+NeR4wq2PF3T5zUFRRetgm22yQJPcnl+GBlTJ
	znDEM9wqc3tGrTDBlRptgMUoLhPiwDFHAeH8VVKU6jrBRAvvgLH/Ir4gBTPAEqgu
	r8E2oqtfqiRxglS5rijqi3XlHKSodiENY8XoNVZvdiYjlfL97iKbLlxVr53Jhqqr
	yWH1vw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqst81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:44:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so994117eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182248; x=1795787048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
        b=X2kRj1/8W8bs8A9uZEzmykqdQ3wluzJ+O0vlv3B8IbdFHDgPSDLLF0MBQC4SfrcAK2
         ZLfeTmK8kolsaHW7r6u8RXUz1NwjkJsFjLiEtscCCkd0yjAMjslU99DSbdRU/lvJxbdm
         Gb670DWAwLxdEIavBboTYT/D+Y/qkWSn5wbG8syyW26M4eJwEh7Qg0p2o3XYAtWDruE6
         Wbt01pEneLilcspa7+rT6LkxXl3rb2qAzlfvEG144rIHZIwr61Bp2lQ2UW6bQQgMOHcw
         eUq35fapK3Dh4tHwG+edX1/5eK5NtYNN8hB3XNl9zrvK4gguGv1Ee7E57BFrCOHZ4PBY
         pbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182248; x=1795787048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
        b=ue2lVAmtLU/+TggyyVRa4fnqbirGspRjFgS3m++q9Lcj9e3G/5FKFtSUmZO8iqfP7c
         t76wtTwkBdilGByQuP0yF8R1aI16djGzefzfMOYjDFIcRYJsX//7PMM2uro4GN9d3EBu
         plyO8qUu6tH6l+WC7M/xTsWlsp8HNOOwLEgaerwA4+szLD3UnU+c/4TXQ/p8YwvOcX2J
         i+YgJzBkZC0aQJanuhT+PxhNohvMDjXWkAF2vpg/0o6m0ynD20o5mvTVWJNk9aOVdkXi
         wWLntnQf3exzWbKPM9c6HLH3d8rEjo2av8zD9Y24vXPizKPce7Gt4ds13h+jDxIlr7H3
         3CYA==
X-Forwarded-Encrypted: i=1; AL+hErE3PJ2AO2wkYarM/Rc1Fp/d3DgHYzv8ASsP/310sIxzzs6uPjKpMCawyVyl5g+mkj/aV0BDnEOFY3dwPQVN@vger.kernel.org
X-Gm-Message-State: APuU4Z+dkE7iciBPL/CbKdUw4PPasGp3fyabXOjxaMG1TeaOps5NWCxv
	1Dp0yA0yi0W2J+3z5ehfaXP7ldN4rUGf7u6oKFY8RuqyuxcFOnYdcPRp/RhM8prJSttaZlqzUbq
	RCC3uwDCM6liQO8vDfEEjFT7G3x7pknuPt13mrCNd/Jr7Q8rhiVPYv5DXUsYgDyPH9vqS8wjwcx
	Qv
X-Gm-Gg: AZFdTZflsRQq6SGumU3JhGt4arHdehjPgS6AKRm2Oll3xPHeC4iqUhwW++eoBJv4DMf
	gp+HyMAvUMD4LQUHEIB+bSzFIBQmLE/ccZnqGDrLKXqJJltCX8O8rDoqtRSUBSTA1OKXJUDSz7A
	NQtlKmZ9icWvU8rQgZ/+fBkZ2EE6veO/eqEsuqUT+484e2LFLo2TFI4j1YLVKMgTxXnsWBk4NZY
	RsTQvYXJEWPnNdU0w73Z929pXBc2Co1H3PDRbuIxgyl4ABCE/DcaJzjhzbY/hqU4aoPERD/ZJI5
	dbZfoH7h6mz7kFcXZAOfIqAYge1O0UI4CzjOnlhICOi/8ytBcnJP7NoGieuD9SHB1UVP/DffHpA
	0ymDFKep3L9Vz+ZtpAQ/hYJ8X6pBkf4Kjk9EstDFwwmfJInmR6HHjLI0lZOGJOgR8oG+Yfn8ZyM
	Jlq6Q=
X-Received: by 2002:a05:693c:894c:20b0:377:3984:5cb with SMTP id 5a478bee46e88-384b446b404mr4505997eec.17.1795182247725;
        Fri, 20 Nov 2026 05:44:07 -0800 (PST)
X-Received: by 2002:a05:693c:894c:20b0:377:3984:5cb with SMTP id 5a478bee46e88-384b446b404mr4505955eec.17.1795182246955;
        Fri, 20 Nov 2026 05:44:06 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:44:06 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:50 +0530
Subject: [PATCH RESEND v4 19/20] arm64: dts: qcom: hawi: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-19-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1056;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=aYGbyD3vlcsShV5PIBfgPkIOIPXgEFvWy/UpvGRwvdI=;
 b=q0jAIPDrN516XpqWB22OPyiiHWhPk4OWO4JIauodmt8cg4tveppR8S6ZONPWykogDnxodyD4z
 imV2vWiod2ECCT/tBCJlHc3jWV0NxantFLQIjX5kyP9qJhyjQ92MeCK
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX1hmQ9io2prkO
 2mm+0Y9MbLkys6LXMTP5dUOdfskhHpuo5glQIx7IRnf8xBBfjaAEWxiZu+pjkro8DH5DKtY89Yu
 X8kwyLO1Pk8v5KPclodJU+z0AXw+niV6ZESEGauPbECn+AUdSG0/q8/KQWjMo55LZu1Q+LOIvL3
 st6QRD1SARUhAuYOC5Pc8yiqPjxHaSsbXLtgizDwI6Bhs4GimPEIpFl5vYfMRNdDer4nuL0EpH7
 kFtlI1veDVsufk86Umom4r8y6xCb7UbZGmB2yJKRl2RQAl+QHPFX0eRLaB96DQUhGCU4ReE4iRp
 MgE525T3IRPyhJ8l3VVbS/XBTU8QOGE91i5/S7Cja1y9XPrudWerOiCXb2Q5qreg6Om9K2XjcFS
 175CZfsHzfhT/fvR/V98NOuD0yJFgWY9O8jD4tqCWkBLJNWqIFwd/oeEEJmWm7TjHPMwlhQGN3S
 VeZwZUsX6nzieaOkN7g==
X-Proofpoint-GUID: h5FS0o-tE2nTIvR7OW7oUZXhNoqRZEO2
X-Proofpoint-ORIG-GUID: h5FS0o-tE2nTIvR7OW7oUZXhNoqRZEO2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX7U41KYdM0JTy
 kk7uYSGgNPspiMgyfesm14FACpApc+eQAeLsGHPjETI9JNfK+/V3zTCQpuy/LLNjSTE4mDB5QFq
 MIGcL5nngmkzlwCboiHZbxM66x3G+us=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b004ea8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-u0lSa1b7RXV9CCC13MA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On Hawi the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 77d704fa6cf7..bb60ed9384c6 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -3685,6 +3685,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		remoteproc_mpss: remoteproc@4000000 {

-- 
2.34.1

