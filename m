Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D032936F8F5
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 20:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786306549; cv=none; b=cCmpOLzw73Ys+c7BowdK+lsHCJK2daCdOfXUCGQJKN4uPskMEFcdtahcFyW2ohj2QzVg5LE3TA0Jdb1V7qOVkOwaehfroj+Y7ZJDheNixaGfP80H9WIzsEvzRxpEX3uXAH5tc/VL/SbgcEq+vDpuWxgTYvvNW8ZLi5hiML1WCNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786306549; c=relaxed/simple;
	bh=iS0+HvRPMnjaMBIrBnifaAZYp0yH+UUeOB7gtsGay44=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lGCK9UD7sRmgh8EvKxyvrs1fMHRP1EdbGgCwEH2gvatI6qIKlb7unLX3ew8vGcaPgZYLQBrgeRN46CNg6UWz5P07RTLBgGDq2rikPk1wkjM/IjrMkuF+Dij/FCOLOcYPUbIeAICSr9aKHZbFhbkuk9H4CzNVL64O4dCCCQ22URA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYv5r7tB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i04nxAFv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYv5r7tB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i04nxAFv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679I9ULp3732117
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Aug 2026 20:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C+Z6FeCC4nB3+cJ6p8StuQ
	NkGv86+RFH84uiGZyNiQA=; b=UYv5r7tBNQgTSSV196S3qJk5x5WPRoq92lhkBw
	f9+eckEVzDo0slwXABhzNjupK2uC1isRclH4rLLJRsedtgjLdyeg1z96Rteq/NzP
	WDm0HY75zv0hJYhqB2hndnfDClQC/6DaUywvv70UaJqy++W2GygYjLbpOyr+AKPA
	G5+G6S+iRAH/HXja1Bz3xsuoPZarNMcqJfyCzYhusPr5kwyI8GzAOWxdqBcahe9R
	dru/FTuNR2c2NiP+0BDfg63I9fxEixNwM2TVCTWulcSkUVxztGf6wgiQ/o6I2Bfq
	W8O0JHksA4GW4OGNstWaRSYS20stWgSEhA1HH1uRk5FkGBBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwv1ybhhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 20:15:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8db414c7so18636531cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 13:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306546; x=1786911346; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C+Z6FeCC4nB3+cJ6p8StuQNkGv86+RFH84uiGZyNiQA=;
        b=i04nxAFvLuF2ZOANVQ3qhlBXpATuHdVqQij8TgqUBcTKgB4c20zOhAaj3ly89bkpg+
         U6LTYq7ikWhOuT/FobSc37mLAZDrMIQm+ur8RCN15lKIwbjlOrJyLZQen67tqdHerP5D
         VjBOltpf1CVgoXlSz4TDfpRiXGb8D02iPIsV9ojGghQuo4ZnMRu6zo01Pc82lp/a/wIc
         4919ZGE4jFGcnHq/izAtvXMgyjGfuV/zNfu7ggG0wltHO2pO9cjgj7sh2uqa99QQcsNy
         tbFhEApsmsSp2qdqabxrXQh668CkfdfpUg1PKFms6sVo62D2H7OarRrLw8HF6SKdPcgI
         TkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306546; x=1786911346;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C+Z6FeCC4nB3+cJ6p8StuQNkGv86+RFH84uiGZyNiQA=;
        b=avjQL+EPDZLZlXjm/bVj2TgBWdxxBWK+NkeWz2umKQYPNdftSQr4PHNBm3UDFkHd+F
         YuiqBYxNVr6DDAI0GNnckNeQYDoWq0hNatdT6m1Yo4qvFalNLUZf0e6Y4zFXIRC8N5Kb
         jCwSU4Q3B1fYlvPHssL09cwy8/kMdodTqUDmWYbZ3RA0LECA4e7d4Ed3I9g/E/pubf5f
         JDotFwxQ57r5yzZmEy1wdywG4APOagIxIROBGieuljq5cF/Eu6PNmF61MMY/J6Ue+jNp
         4QYzd7uzh5s0rGTEnUUsaoysHO4+y+Xpt+LwPGF4z7iOiDi94wDwktLlj9rHBNt9ryUV
         gapg==
X-Gm-Message-State: AOJu0YzJ06QEm+UU55D0ys+/JH0dcgdfzxMeJaHXQBdGXMlUBosypPtj
	4xarhk4HIvEgyAYg+A38aJ6u2KCdHBfKUs1ArgIaj8jmG+OkxEU6/re8AjemdMHth/z0XwpZ3aK
	FOtDxoPjPv0H7KBTyciYEk0P3tQtPZQnp5jA2KdzOYMotNz4FwNgnqKob5yOyEQFqXKTV
X-Gm-Gg: AR+sD12m81ooJ2H/5BNkjJ8JnqJE+soUKpphzLE8LtHcHOuKT+nYvt7+JyMFaijpvRe
	DkkcFjOIBYgzffmo2kbBGiCbp4balf27U27Ws06YXiOueYTaaU/PhJVjWw/oK4NHO9y2LuGqzu9
	7GPOAASz2ZEIhczlFmS9p6VJwxGcsypFvIQotWZI1F1NGKzF6WqSekyjSynVmBS/f+gDogpPMnI
	+KwpqsCtvjPuBsiaUdQgN8UDlgvVeBUtGpP2gjU9Qqeg3lnpFOGdskztbvYPLZcgv7I9U4Lytki
	sZHvKKqQ6ovAg/JjFVGAQioLb7eX/x9lYM6KFUgPEHojOOAbUAb9miNnCPVvAraUT+AXTVatjOA
	M5t2W0iiGm/nhtbrAzs1oVUWoO75z6VfZgsf0grxaqEgJCySO/a1cqxOZDOVjsoSpWOv/A6Gk7J
	AZgLmJKBLQ57Ff0w==
X-Received: by 2002:a05:622a:e181:20b0:52d:354c:5b91 with SMTP id d75a77b69052e-52d354c5c6amr44062331cf.16.1786306545990;
        Sun, 09 Aug 2026 13:15:45 -0700 (PDT)
X-Received: by 2002:a05:622a:e181:20b0:52d:354c:5b91 with SMTP id d75a77b69052e-52d354c5c6amr44061871cf.16.1786306545490;
        Sun, 09 Aug 2026 13:15:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:15:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
Date: Sun, 09 Aug 2026 23:15:39 +0300
Message-Id: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOvfeGoC/yXMQQqDMBBA0avIrB1IQtpqryIuoo7tFEYlY0QQ7
 960Lt/i/wOUIpPCszgg0sbK85RhywL6d5hehDxkgzPubipTo6hU9cMjzyIJ06JrpCBove8suWB
 vo4EcL5FG3v/jpr2sqftQv/5ucJ5fM3fzfXoAAAA=
X-Change-ID: 20260809-msm8974-iommu-upstream-144b1e2a15f0
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2177;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iS0+HvRPMnjaMBIrBnifaAZYp0yH+UUeOB7gtsGay44=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/tOrgOI16LA45x/Ox0EJO6o6/tsToKA7nIH
 +rrs2dtFRmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7QAKCRCLPIo+Aiko
 1TMTB/4rwEYJgew1e/uJmyrWp2cbYPFOFfOla5icjTzj9aO6/oWaxAgCvwjZE014WwleQQm3jWB
 /XXpBv143pWAnVsh8+QfyP6ZjyRTxfUuW8z7sdtfRUF2iyy6daa0UihSiv52mJFAZD0ihKeC79S
 C7BpuFB8+kq2hin2ZTcB7zmW76hN7+QaT0XqR5dBAtZJGGDO+vFCtJax1FE3cAQylv5Hs73qP98
 O/48zADmykv0wof7cpT1Og+qk/6Q6GJyT/pAQh9ij0T6cOBqx7tYP8rC79viohoMR1vngadtEtb
 FjKGLMxlcQryWwu63c7cPxPXVV7g5e4bfjfqD2wl5y8z5sg3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: WfH58_tpKBsJUyE9LxaD31pg5Ui4RuVu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfXylxlnp/U7CcU
 JXzDKUrMIlRUwTm3ZqCZBRAFfuv+XDS3FUNnP7g30VUg64Mjmmw2YgQGVl2WwlKJQvo3gFeyx/Q
 uMztPBsNJ33GtHeyhou4xFJe3R4acIs0TJN2HKBnks0J4yxtEliB6dD+ZGXgHcsRKmDWUt13BcJ
 dgvXTrMngVa3HMYfd89boE5c4bGf0cHoIW3ylnCJHtBmn4IJFYX3Gb/ax/Td2C5mriFLZEbQAAq
 i3HMew741DhS0gsk0TSi5+XGuK7QtN0BSi7uLULPqUJ8XsA8MFOqmAzcab6g9FyZ7dd0vtFrStW
 KvPhO2BOw/wBME7eVJVo2EvTSxNMYunG7VcllU3BYPVJmZBWnqJ8PEHwG2Mjd7x5nN64sWq/8N2
 0ROxe3PPAOnRsOL7qAl4iXObojQu96XDuCXdmrbER9HmhNIWfttaiOk5mXnwD0n4E5LEdDuEaS0
 lifxftjEHdswhatw5Ig==
X-Authority-Analysis: v=2.4 cv=PbrPQChd c=1 sm=1 tr=0 ts=6a78dff2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=u2vn49mHtsTZZS3No3cA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX3MPJjzr9VN8e
 HLDqr/inNN2b8EYllsnXzX5vVCX2IZzldi4bBPfyVYg9O2jqp3xPwI4gJKhnFVuzLKC/TEQ6SiA
 3WcjJVXX897NPrEdNFg2J85RlaV/Z94=
X-Proofpoint-ORIG-GUID: WfH58_tpKBsJUyE9LxaD31pg5Ui4RuVu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183

Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
spec, however they differ from other Qualcomm platforms in the
implementation-specific registers and also in interaction with TZ.
Venus, MDP and VFE SMMUs are secured and require programming only of
CBs, while GPU and JPEG require full programming.

This series skips IOMMUs which can't be tested right now (VFE and JPEG),
and adds only MDP, GPU and Venus (although untested, it is required for
display to work) SMMU instances.

Note, to get display to work properly one fix is necessary, [1]

[1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (12):
      dt-bindings: iommu: qcom,iommu: document the MSM8974 IOMMUs
      iommu: arm-smmu: add global register definitions used by the QSMMU
      iommu: qcom_iommu: extract context bank programming into a helper
      iommu: qcom_iommu: support the short-descriptor pagetable format
      iommu: qcom_iommu: handle the SMMU global register space
      iommu: qcom_iommu: support non-TZ-managed instances
      iommu: qcom_iommu: restore context bank state after power collapse
      iommu: qcom_iommu: halt the micro-MMU while programming context banks
      iommu: qcom_iommu: allow faulting transactions to terminate
      iommu: qcom_iommu: program BFP (prefetch) settings
      iommu: qcom_iommu: add the MSM8974 instances
      ARM: dts: qcom: msm8974: add the IOMMUs

 .../devicetree/bindings/iommu/qcom,iommu.yaml      |  16 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  85 +++-
 drivers/iommu/arm/Kconfig                          |   1 +
 drivers/iommu/arm/arm-smmu/arm-smmu.h              |  10 +
 drivers/iommu/arm/arm-smmu/qcom_iommu.c            | 445 +++++++++++++++++++--
 5 files changed, 517 insertions(+), 40 deletions(-)
---
base-commit: 6c5c106bff878247a9cc7255077aab9040df8bf8
change-id: 20260809-msm8974-iommu-upstream-144b1e2a15f0

Best regards,
--  
With best wishes
Dmitry

