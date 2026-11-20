Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172838;
	b=uHrei+yz4EHpaMoNI8rbTTIRGT8JhpVrS5QhgdNcJBPQW51yRUucz+yLTWlXeYwGNz5C
	 750+asZGQvtI071xA2epojpOlFYHX1x4Z2SRotmb5rpbpX7irPK6+Ops3C+qK3naJq6o2
	 U/oWHmuWd134vsLtYtum2HSNZ9k28GL0Rb4tHQ1HUZRWulo8o45ovFvESGTWhVBY8pGO2
	 /8qqK7MJDT2NZAPIAKdwV5Ws0lbrSFDaOqjdevAJJuVc0g4KGh9EXlHGol/wVJPpICvIM
	 CPTNp92dIw2kVfOTnSPTq/NIkn0r5zyrOEwZu49xicUvKkCJ6B7LUYKDW3s3E6zyMVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=;
	b=2tbPAnSzctjCBxlphjKXWbUlbeLAdO2juqfc90RDE6NfJWZPrScYWYjyKh6bqJmhkgzB
	 yNy5hjQb237Lplyep5D24dYZNzJc1bHqLF+1NOA1rsUE23pmtiGcU5Q2iof2ppndDmO6m
	 AfVNJQsf/c7QMTMNLSW1GV+r9niO3TsfrNqkN4ev/RUeAePaqeZCwOHFrdwd94vo6XuUH
	 7qPeSJd0Ii0Yx03tkQ+AGZzw5JDU9ZyntGBNBGdOt8yQTul9tkXR3RcsudF5geqrBkHRt
	 rfdgSjp5Q4MNB+cpK6DZXLb2pyL9+FbwYW96em4m3Ekdey0+QO/HTD31Fjh0LUEMcBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="lGydtnL/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RU8Lr8Di;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E061960A260D
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E061960A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lGydtnL/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RU8Lr8Di
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk2SW2433198
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=; b=lGydtnL/WG1DsZsr
	17EAMCvTzQgd9jOSLkYuBrFAuTXmuYZoViVwJwitUwXrFS0t4AO/5kXW8o+gLxm6
	UKbB1UZi2yCbzqPRsBvXnSOYtmQMNYHa8RqlT+/pdJ4q7Bx0Xywx3F8bfKO4zVPa
	MLQzdPCXKUItZg2FDvtKbrvXbd5FrXXp6fQznMHJFo41i+S797L+mMXYrLlatzpk
	BO4FUGusnZI4cVcip1JFi7mcXUt7tu4p8GTcbv1f896NT/3obcCeYElZW2CcHyB5
	oUXURG1tpmu51DWv3K9wZVt35YsMSSZt05tRmY7eXZ+bRMAzmRPPbSokqHR9wcV1
	/B4EHA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj9eyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383435e46f9so604624eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172836; x=1795777636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=;
        b=RU8Lr8DiL4XwUu6SrSRsVZXDB/9/QeXPQ9DRCoewnxZWf/CyRgrDIGKh0WlZKcn6U6
         uk50u03b1h3UP6CYyO+HojsK9tPV4OhWZY62+GvfgU2wZcqhEIspi9n6svCw/WdDAIxi
         dhDOHw8LsqBWwv5UhYT17MUaLven5bskCptumQbYe6d6V8tF03Nz4sLIdivuOOSgttsK
         tNSn8647E/3OTMSLfj02RfDZd1JknuSgiHajC5jszqJkQgOlwrmAwXJMmABEZrivPdDG
         Mr7LkAGCDDU+arud0dXNyG3tlHZP2fKFNiRzUHMF1E9BSfP4X6Z1lXtTc/0CeXzyVOE7
         gvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172836; x=1795777636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=;
        b=Krnbw1V/Nq8L/b0UYTaAYulwuc//8DWyfiIBhlwUMCTmPVjbUK33PjZNrLfx/y3OtY
         gYFQraZdYRKtz9t2w3jKBsAmBEXPl5YZ8tqcXxSQ8JsgqarjIKDEMwn0oeUmEKZMd3dD
         znf42QuHa/Sz2diMcIQa3JFeMQRRA+Fo5UnicFIXYnbD4phrzVarXSHMjJJa4NUSmpVH
         3N6Ppdk2C/+9MW8mrDfVDOy74QtzkUpry9qEWnV5uggD048o//DNHEz6x/CDC2/IMN+j
         ELQxbcOZlAabugOKLgLVSgd29LqTeP5kXCKoIjnx2VDjysrSc/1DuBZXJ9JacO+gf1z5
         64dg==
X-Forwarded-Encrypted: i=1; AL+hErHNZrAIwFqQZ6aWdYzydr1bfBt359vG4U/wcIqpOdt/VtEchliAnyW+0FYobtDiYMK1sU/4Bh+gRYrl9ONE@vger.kernel.org
X-Gm-Message-State: APuU4Z8rtdJG0PXkxKDsVdHynmzrSLbhDocbcZ8kokvWhGm9lJzsXKCI
	f9XvpswoQIGdqft/88uHh7uuxj0L7MLghE48Um6ik5Vt8UAJOSF3Lkf7IATMFFdJkYinPW58ecn
	SJhmoz9Bhjxianrf6/joWZOBK30s7bs4AmFiX9IJOHPtGj2rJ22TM9lfsIl1qm9bPm4mB
X-Gm-Gg: AZFdTZcE4645FoHk32I/Uafy6CjXK6zHbutZttk52JFDktGR5+a1VhF/mxvTcKLDXXf
	uuOuJdw42iaByMYXieSImh8/K1Bt5GX0z2mC2v49I6mkfcL5ctp3X2bwU7WwVc9rOQsBYlZVovA
	DLU+vXFg6M7hEgTIKzrpjtYzXcsmDUcC3kDv3+4kvwkZzGF5cCH+UwN2jtks74WLTcn26Uytu9x
	H/YYBPDibEdXCHYAZKKBd4cexS3AXW3d2JR8AR58rJAZbX2XMsm9/NWjeLRnQuPQaO59EBTHccY
	mRulXzLT+J3GaWEWXUoH+w6RdqJ5nZN9UPBn42QInqIeb/Ku3qSoPbX13vrtZply6qX/Ik2pi83
	E6vdUcjNVq4O05duvrlOXpB0mQDs6BOHAc2VAMZZzAYO6UacADRekdnlsXxt9YFm1KPJf26n+Ij
	c2tx/F
X-Received: by 2002:a05:693c:87c2:20b0:36c:dbac:705d with SMTP id 5a478bee46e88-3856f65a86emr2125666eec.15.1795172836089;
        Fri, 20 Nov 2026 03:07:16 -0800 (PST)
X-Received: by 2002:a05:693c:87c2:20b0:36c:dbac:705d with SMTP id 5a478bee46e88-3856f65a86emr2125639eec.15.1795172835468;
        Fri, 20 Nov 2026 03:07:15 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:15 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:46 +0530
Subject: [PATCH v4 05/20] arm64: dts: qcom: monaco: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-5-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1018;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=1lPh+lGGWLKglbX1purFejDWg8n5fwBJBYl3rhWzR6U=;
 b=w7+YMTrpj/odsbvoZBGQJvWKHZSfz1g8C/fkwsgmPpO4XjyzY8ommBMbxvyjAoSlDyRaqpIGL
 0nBHrcLcbdtCZEPljT/X3t2bHMS8fnSMi8mpqaaQfepYWjPVWWOr4P7
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b0029e5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Jjng17ChVe8r-G2aFk8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX+qWzg97TRdha
 Sw96jcqK4LLRIxn4XwQjikjglL0IYdBOf9FgmFXTHAlvhGlM5lBWZruhby0gEzpmHeH4j2jckX3
 SRzOe1bwaHAmEguup0VhomdhK+Vx1L4=
X-Proofpoint-ORIG-GUID: ZIItH3KQt57zqSh4Ehn5K6HbRyKKiWI-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX0WFviBZHWmWC
 E3PK6OBRxPlCOwfLepIlCejygS/wuDYz9yc/lIBBkC79wpDolF9yNvTJ0ej3ksPQ6CUzEaZkXuP
 B2CqZAkoM93q9BqyGy3ARSGkP0K2TBVV5YZEfBJ4TNqJTdka4pNrvHo5HannTH5b1t6CIBOKhMt
 LOJ+DmK/7px6/NVQr8SJKwoAKdVnKlKSK8kCR/UmbYFyN/+hHlCN1Thinvtuf+ueP92A7DjC5ZQ
 XsT4NeT9dVY34phPlTvonr33+GBwioQz9BukelbWw0PE3iyefFAhzyx8GbizFbYIytewxAV3sIT
 JpirxAlSCYxVAoPjhq1Urn8daZwCpI2j1ufmWnZNc5kn1WPAmX4NSk9kPCirhSTBnGF3WHLeY+F
 PK1d3v+ynyRkxeEx2Hj+yihgCl5r6OZd6oHonX7+bqOr99y87ekuiKY/doV6t/DaVs43h4STEDB
 d1vXg5GyU6v0RqomeXw==
X-Proofpoint-GUID: ZIItH3KQt57zqSh4Ehn5K6HbRyKKiWI-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On Monaco platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 3541313a79bf..13214aa77279 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5113,6 +5113,8 @@ adreno_smmu: iommu@3da0000 {
 				      "gpu_cc_hub_aon_clk";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		pmu@9091000 {

-- 
2.34.1

