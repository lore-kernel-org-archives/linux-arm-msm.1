Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7DE4746AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331206; cv=none; b=OqzHHkoEk77jZJDSalf40hw9dW2ihBTpcsVdGdV34ToBs40dWn6Ug+c3dV46sGYgyL8ISweV8RXmA0afqqUtI/W+fdvWs/2ilic+sbrXtOKuDaS5KgxbBls0Om/fNmFi0qfzRyJc9veyNbr3WplXSvoVLcz9Xz0GCtZKavaVmwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331206; c=relaxed/simple;
	bh=LRFKkO1seXh0WFGcqXLLFLq4Fhx0lzjzwc7PamPgNvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dmq6QhtxG8fYgvY7McB0/kClaMrzrKRO8IT9/mXXsLCunr0ywvHCd0e5CEU2TXfxk27p84d5z99xBfn6VurNeBux3z9acHjUxTycbAHPKlS75RGmmXPgSEyDiopRG/DI8J4MMqorQF3NtxLetJR9cxIrmLj3jdl2ud5wQLK63YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZHLJXnF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RE5GcMJE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZHLJXnF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RE5GcMJE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Ynx63532398
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dYPoHI0AAzT
	qoxz4LyK6sk+OaPF3QC2+Sv89PHOEyG8=; b=aZHLJXnF8H33rNli34TUvrjWO4y
	XKgQ9AEgQn/hVooBk/Eu+pzGhBM1liEY6UNGt0zx3VF6bNU3M+IX6ZShrsto7cwd
	teiJhUjsor5pzE9tZz0zKuVGpK/3u5XG1GmXOEUKeP9eo++DklFDV28NE0wsTLbV
	4JoYyVP9COjhwm/CQm3JYi+Io1Qhvi7luVxtt5oE2bGRJlzqfF+FcGKb2y7hnlCl
	5QDuSqn4f2gBerElOLzjbEHW/vXP/LudQaBrV3Xd0mwt9V+yRSiJLLRRqk40pFSZ
	v0TV3VLQKyE8g2Zy4NeGM1oX6NdIaIpO6QFBn/EBnqMX5MQO21U0zQ1TLtw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kaqke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:13:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-342138eeff2so746670eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 03:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331204; x=1790936004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dYPoHI0AAzTqoxz4LyK6sk+OaPF3QC2+Sv89PHOEyG8=;
        b=RE5GcMJEEqvNPtTfF1hTwBx5Y9YKI+MSNqbbH3Z0uf1Lzf0NkX1IstPEjq5OIDr2vX
         hlawkIKnF+U9OXapagsye/CdIsj01lfAE+XWXT6Fsi+xwBN6TkU4fiVvO06f5BiU9GtV
         2Gs22M+8zPYscAYcuIiCsta4s/E2BaK3Ry0kLefKmFbYZUtmlJbe/KHNE8BSwm4H597o
         xM2rUwJ6LjWQ+AkQP9+3050e4kmWJTOPwM3XciuDIq1iXhfBoNtdMSNEGchwEDY4uvuh
         FxmRy/+OC1dFIqq7SonCDLlsr4elCBkJt47M3b1/H0LuzbezXpeGkfAbUxt9FJjfkjxz
         gbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331204; x=1790936004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dYPoHI0AAzTqoxz4LyK6sk+OaPF3QC2+Sv89PHOEyG8=;
        b=YJJ5jkkOzbqoDTlX2W7W1RLZQ8oHQgaV2GiImRQdOM+FPDugUSYon8XaLWszB3Ols6
         f9NhPqxG6tEwMXMD3dQhxm60GFEKe8Xadv7E3JiWqddQSFG9PmmRL4jthsySp6iU79EX
         7G8WA2Tzcfsdemf5tJ4+bo/cEwOD0MEjJk/Sk14UMSJP+9LVQlTwCzfjqHWSh+WAJ0vp
         cRh09yhuQlPSsC0luJ3MzD1XRjZvS+t0zXpDioTvYjAOuqzIg3mxTTHP1x26fgkbfWB+
         LtWk/YSKcVHwddH9In5jXnrWiTKp2p9hfFhlKh6H1ivBb6NTUq3dYiMHl6cYl5YjvMxa
         GCNw==
X-Forwarded-Encrypted: i=1; AKwUvBy92P9ZBSjnPWP3lXSaCi+SlOuI5H5KmFG1i2CO6Q5+uHYzyRxPxzp5tU7BcYA0Ep5hZ38FHVHU4Uya+wOG@vger.kernel.org
X-Gm-Message-State: AFuF++lG5VDABg/JcUfsBXuJp9uadlk2hh+hHuob3YTHyaPKHWqUKlNi
	dFpELilvuKenYveEe4Yw4RIbtjfRIvy7uxAD18Hv9DRQn8lg6ib818KWg2X3IVsQubR41zHt2Ez
	v9q5MpuLk5q/uf1PWZ2nOqwkNM2VaTdtzeAc8zmdFi5aDEV9cLksb16lLCV0jnTgT99uX
X-Gm-Gg: AYBFou2ksD4bxkQ7LUwpJPFRqVMQCRn1lhfKexXFbv2jSk0/mXt4I1UzNkeXyqHPECg
	JE3/LE1WFC6rSVbjy+ZL7NOTCNPRQMwM1LusM9xhG+BVLZa6dFBs9R7uqgK2tHBYmWmukun8+cz
	jMW6MuD3TamybJ1+KCoFG7+vfzDDcjOJuvaZ/okMAWAUYLCLgnjheE3dskBtHf1UuGAyM3fvrMX
	F0YfbWOKvqKS7ln6j3bUL2ZLYw7GUoUQ6+OEj1LidHTJjgrcRq07mvCAeFWXrfUHTjUZQipk52J
	LjYjereTwjlvcGVHBQ11pegWp7Hz+mcrJCrzJ0v95fKyVsbkELq0CIseB8h3O3yD4R7s3rBMsWF
	Xx3ImW2tlUEQfWihSs2+0ce2AWw==
X-Received: by 2002:a05:693c:87d5:20b0:33b:c758:74e9 with SMTP id 5a478bee46e88-3400449d090mr4722309eec.4.1790331203904;
        Fri, 25 Sep 2026 03:13:23 -0700 (PDT)
X-Received: by 2002:a05:693c:87d5:20b0:33b:c758:74e9 with SMTP id 5a478bee46e88-3400449d090mr4722280eec.4.1790331203165;
        Fri, 25 Sep 2026 03:13:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm5397961eec.0.2026.09.25.03.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:13:22 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/4] arm64: dts: qcom: hawi: Fix PCIe IOMMU maps
Date: Fri, 25 Sep 2026 15:43:06 +0530
Message-ID: <20260925101309.3826038-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab64944 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=yNTuY5RphX6TMQbXDycA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 6TZXUldX1aIr60xxpL7ZW8X5MLnaFO8t
X-Proofpoint-ORIG-GUID: 6TZXUldX1aIr60xxpL7ZW8X5MLnaFO8t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfX+z9kHZenJf6Q
 KiZGETMVUuNSYM0695l2NQPhzh+wMNVPr5f3Rj4rtdNjc7WBDVSUryLhlpKDP2jXJm+7/HuaqWs
 yowERcZuO/HI8YvcLAC3EXBDjxJP7bo8zjc18sj3I0dt90qmwcpvG+qvfPibG10Oe0hSTvbAI9u
 Yb79RYBZMlzrzkrEXS1Cv2ZVW4Zs0a8JHPor8R7nC3NKrxrw9IPwYV8+X5CrASSA32Ww1pm6Dgc
 yJhCmfjyp0V5L0acAMHebJui28SHecF+xa3AiLaN/Jw8N4RfYu+54pPflMG/TWVUc7n9XuVSkQq
 tw3K6abGxSv+KjdEboeGLTJs3j38IyjXNc2mQXZwbcg+2huV1BlZUZpQMDDvipm7tlM9OpRQb/U
 qzj53FDQC+FYbGbloin4+tuEwyX79qARKWdus6e5Yv1S9ElktuhIKxSYLvc8xUeQYMjl1WlFFtG
 4b9b7/R7NX49cWUlrRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfX6Mg0n9SGQVMU
 2rFFrFQjCDJXMgHVFuFDyLrFt/3aHOCqZg87LLX/wOjau+REBPiiAWzhydzdhyueA3woyWP5uEn
 B654q66rGnpGFW/SGHaChcyg1TTGqOc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250040

apps_smmu defines #iommu-cells = <2>, requiring five cells per
iommu-map tuple: rid-base, phandle, sid-base, sid-mask, and length.
The pcie0 and pcie1 nodes specify only four cells and were omitting
the mask field.

Add the missing 0x0 mask cell to both tuples in each PCIe node.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index c7ae8133b9cd..89bf0f59304d 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -2958,8 +2958,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			operating-points-v2 = <&pcie0_opp_table>;
 
-			iommu-map = <0 &apps_smmu 0x1000 0x1>,
-				    <0x100 &apps_smmu 0x1001 0x1>;
+			iommu-map = <0 &apps_smmu 0x1000 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1001 0x0 0x1>;
 
 			interrupt-map = <0 0 0 1 &intc 0 0 GIC_ESPI 213 IRQ_TYPE_LEVEL_HIGH>,
 					<0 0 0 2 &intc 0 0 GIC_ESPI 214 IRQ_TYPE_LEVEL_HIGH>,
@@ -3140,8 +3140,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			operating-points-v2 = <&pcie1_opp_table>;
 
-			iommu-map = <0 &apps_smmu 0x1080 0x1>,
-				    <0x100 &apps_smmu 0x1081 0x1>;
+			iommu-map = <0 &apps_smmu 0x1080 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1081 0x0 0x1>;
 
 			interrupt-map = <0 0 0 1 &intc 0 0 GIC_ESPI 106 IRQ_TYPE_LEVEL_HIGH>,
 					<0 0 0 2 &intc 0 0 GIC_ESPI 107 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.55.0

