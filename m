Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172880;
	b=5r4dnJwaXTAAMkXWqXW0KGlEoKahNHcPCoOaGwmZmVx+OvwVvyPEq54fOxXhmDs1A2Nn
	 cksQhPlbF6mTy15HN7V0kqTfXBjyEps4+pkNikHYBUiWhHreF4DhYw4SqQQ1WOpcKymcN
	 mB5zdrkedRzuP7blMtvoKaEaRIWfPOt1jRb4Gp6I5KJTlx6GUknupH/sLhuhDwJoFCx9B
	 FqZlfeIa9LFC41QJQG+UW0U+VLpjfeawgOQqgBsC6jpmIXpTRy5YWs1KOnCWsSeSJCXZQ
	 H8sLuZAEaLDYVwxDgZvWpS1HHPWVW5k31xfi0TITDV2+P8rOYS8hVi2nSFJ7bKs67Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172880;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SDP+V0k/153kXf8kggh4dD+QBvViaqb1sIHAp9EgEOA=;
	b=0H6L3WX69/ptLXD4XybB8DoKU4q4oSPoy2ZmB+blNqygAqEtqE6GvXXU/sH4DoKUea+k
	 bZd/56EqrQdIe3nrMtviw0JXpbEPgdyAQJMWXXLkdpsSsUdqOOmvpGWpp1Qsb5LN6cHgZ
	 UcdmHfXWfDtnfb92QdRbTflogSR+SRC0x6suZ5lrGlZlOM3PbGHuqDqkYc0WShQVgVbpn
	 zslVf62Qfc1iCsvD50R3LXUk/mASlb9SSGcWAxHNITFceV8tRK+AmhyIDW/2ixqoFR1Ka
	 0ToNy4Hz5KhbQ8HqM0OQFzn1vjMLM4OYwTT0j/JlnryXjDF5Qww7cN8jNZOGxmt97pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eMz1aTBh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AY12loNH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30977606D875
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30977606D875
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eMz1aTBh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AY12loNH
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjxaP3731641
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SDP+V0k/153kXf8kggh4dD+QBvViaqb1sIHAp9EgEOA=; b=eMz1aTBho6i3pBSq
	Hi4uHg5OUvEpQoA3uxCsDvmA8GWfmflH+qkW8t+GZuMTZVPOUwNPHvbL7GF7+LgH
	idr0PtpVEoxoOFtKnrULAq9YderDyZ3IjY/qWcfHNsOHDA+ZfP98iKAd/oYrqMIB
	OY7pVwGF1jCW1myF7AxN4Fl64C3AmYzF9+tFvjqqQ3xAnZTsUSxz7n5yYs76n0ti
	DUYM9GR3p3ueUyf3lHkxn+CTymm51yWxx19hkX3ZGprikP9Ipg20PWukDGo1HM1v
	UpL5YNbZEqTXNgs/9qWTTvPE+ZtK8D5Q4lSfyQcGpf7aoo+IBXzGnr+f1vpSvXtw
	TvrNvA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4g3wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso964832eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172878; x=1795777678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDP+V0k/153kXf8kggh4dD+QBvViaqb1sIHAp9EgEOA=;
        b=AY12loNHiOCfOQcW/G/dtfLXgJMYJ2P3Kj/RkiCZ29TZ1SOBwrP1UKvcKpBPY4Ng+W
         A6EiVqMgg2nGvnAd5dVpigb9gu/UPbXikrbj3f1t5TVbPq2yU3jB9TwKR8Wf/NeRFd0n
         wybyI5aHYYD/Njm8Q7700bc8QsLanJg3ZBfl7OUigfWn3jBd63VRptTBdHvlD/fNFKSo
         P85nIYz/znkeN6Lj3CHOMR9SkwpaHxDSqAu0Gj4WPyyMHO3jygyI1vYLathwHSIvFq4a
         KD0vef2Gwu0qPYVhDWDdJJ5LDzJv/RWkfgfqx7eL9klckgzIIhUImhjqJM7G4QcqYUnT
         FFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172878; x=1795777678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SDP+V0k/153kXf8kggh4dD+QBvViaqb1sIHAp9EgEOA=;
        b=RDaTHwJHyT18GZXilZZ1uXb9wf6JnsGAwgziaVcp60TxLDVGHbsTxYUmo9wdpA39zw
         Wb6OtHKY9lGoE7sF12oNNja3DVt65rgzxEp1FAqkoYKW6iaFsH8h8IGNiDnySPKt7BRd
         /ZHIZNUHqw6sTy6cVEZeJgabFy2ap3jnldFm8Og2eyZbK1VAzbOCyalUgrCxdFInrvs6
         f/XZpJ4/8rWf+iw7+QVF/xorwrl8g623HlHOI1LdKhsy2C8LM6EIdhIu91ELDVsil1zg
         ZlY1i8sw8iBeBjQ2DMFPAik8CXvpQyeNRxuewD/3PFa2Zt3o8ZWoEASLWrJesXSau0nP
         jISQ==
X-Forwarded-Encrypted: i=1; AL+hErEdf7lz+tCtlqVmdIKjuhuUpsS60nLfhpih1483ew0CFLXff9tuob71kOc6ZuKfPWXIvqL0d5NZUB4ixgSz@vger.kernel.org
X-Gm-Message-State: APuU4Z/l//cBM6imXobrRYAy+2lrMBWenh8yihXkCqNxcD4SrRDXPV1u
	dxkA6uA3SYLjOkOkztIoAc0juYaXjSM1u/PstRHhVTJx2fA6OQD0TOHr4vawFN1+e8Z7wq1xHao
	HB1KrhLkPm/D/97pHM/hG0VxTpiEx4dzo3WhOoStFCJwI4lndqRc5wUGd4iNn3OYNeSBP
X-Gm-Gg: AZFdTZdUYE5Fgoc3mbU5p0uqulfOIFxyFNTF/BMDipTMvgP70aLDZYfNaWY4928fr2N
	VdNjvYJjzap6D5EE1XWTMxycaRnJ97ZCzh5PEWc/exFk+yAW1UYWwoprEgEY/ajwXSx0THlSmTz
	5StixOzRT5e6WCQAJRkKZvBhVLgE7UxzDxkiJUcRFXqOPonQdJR7fo+ZQW+s5A0dgwwtBG2qJeW
	x8GP+N9y9Dgy6iRFNCMxDZDf7vy8t1dQG/5bWTZuVU9/C8PMFLTwGAEHUMT/JLRvA3c396naJck
	YQ6AsIMe/u1NzWmVLUc+S6TuAd5I1eCetkFLd1CkwGezN24lQ2EYR0pf/ZhhPYezVaSS38lF/2C
	AKKxQEx4gZAv7J1u0kOPrEVe174hmITtV8gTevM8hsvPmPA6uhA0pYMDuG1TBEcie36BC9vHTq1
	wmR0Bt
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7ab3 with SMTP id 5a478bee46e88-3860bd88965mr1185189eec.29.1795172877764;
        Fri, 20 Nov 2026 03:07:57 -0800 (PST)
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7ab3 with SMTP id 5a478bee46e88-3860bd88965mr1185151eec.29.1795172877051;
        Fri, 20 Nov 2026 03:07:57 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:56 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:54 +0530
Subject: [PATCH v4 13/20] arm64: dts: qcom: sm8550: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-13-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1285;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=ldSuaHHBroDhtrYJz9kdhWBAKmQCNWPZ+kaSFsE2iJs=;
 b=1DhQPxDH5zxc63A6kUvXa+BgTYVKQcYTsBdn0VFledIHU8tPlkxAnaLMfB4c5tnQce7U5alow
 YYZNkpb7ofpBfaW7Umu0jWjraHGjx/Sm/DEEBpt/T4QaLy1jvaqnOWp
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: n3oEYB6yrgS3OizbHQcTN5lJuYIwmtlR
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b002a0f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UZQlob4mJqq41ALSq9YA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX4YGs+agj5F37
 pH1evZD5tESGjo8njcIFh8vpsXU4+LDrRE14CIQEPoT3veMXDluMF+TmyD8yK+Io3o1yRVklfC8
 iYTRR6vUepxIMM2j91jpX9Xxxv0Uy98=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXyEYagkaMJ08z
 UK9ogcNDywrK2u9vzAfvnEoGr0aFHjg5mcJdgv9GtBx2ACcGzgoLaj8gvL+3QUOy6pWnnn2H+8o
 15sAAf48aO38gpVL8QCrG/t1ThyVoQHOyp0W/RefrcOPhK6PsOyO+QXdl7KGAgIw7TPdr/geysM
 heQpT1+/8qOOHs4NEeDKlRnTfy22DVPob0TqAliEOf/UeeOTKpVVjuOzZma//6q7Dnf5lNptYDd
 pSTOWUFC4u+QE6be/EoceWzi4PK3xLDeJGzJMps61biYK3Yb8EoRxjGoJ5JZX43fqmDVVAPC3BY
 qqHGtz8adSu3cj+TtPnnhoZXLJkxqnPC2D1nclVzHruUcJqEY9S2nSnLA/aerrB+nvlu99p1iV2
 pwNSdtPHbKErXKNPzQ0mY5eZQMXiIKA39CULluYxOcjfCBQaOvJS/AH8//WieCFKYurlmGC/yPk
 SILT1G2J4IMSkbn3T4Q==
X-Proofpoint-GUID: n3oEYB6yrgS3OizbHQcTN5lJuYIwmtlR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On SM8550 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index cf7d67faef92..d11691a7ba36 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2898,7 +2898,6 @@ gpu: gpu@3d00000 {
 
 			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "gfx-mem";
 
 			status = "disabled";
 
@@ -3073,6 +3072,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1

