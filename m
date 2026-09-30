Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC33B3D3323
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749924; cv=none; b=gEvSdBku9tKlsevKywEf1UKpsZi8xp8p9rGMbm/qtFSpUHw6VIwd+I43DjgQ1sRRiEU5Zt0icq81P17E8MFIfQJEGTN6C1c6AgaVwsu0ml067CvPbVhLjv3lXD6+susWJ5SK3+d1Po+kmHUU0XxrZhOEhtBKYCD85CtDXZI3D9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749924; c=relaxed/simple;
	bh=GxqbH1CHSJlspzWNldegvj4CiglyOW0Gfg60hT5MZPo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OPM/l/B3RlQeruzk551EAZguw3efA40nUhnVrvRUowOskVK61k+PmTNHgrhADp/5Y3NJ4qFX8g09LIE/1xQ3qj6yCewn49XnD2EvDjPKQDo0I9mVX/d8MHg7FIWiXBISXtusM2wwDtD2pNUqZkFDC4bJdiH1fq9OcfmsuXEY9Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Skbhn1uE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HcEnL6zx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Skbhn1uE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HcEnL6zx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U6LGFe484436
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5Elp4C05nM48nzcrjsWZIc
	niOHlR2V1fdy2kVz45OFo=; b=Skbhn1uELKzP5gIrpXAzXaDFfRZkGoEefnNdQs
	fKY0BtcGPa+YbVamkoBG1ZL2p2ANgv/j6KOY4IYlK/m1Guwlx0JiZ8Oe86GMlzhY
	2Zz+waeCkhmCwvvRI0sUYNVou9OxO6TGOpDwwz+4VpYcBmex9/nJXooo7PaOPwxr
	HFp1zdsQOkllTbC167ernPcuLDUsDx5Lfd7FLizvTcQO2mSTTqaabP826RRRN3QT
	NfPVUotZwF/yGFxZuvLQtvaWeEcTGXeEyUdwpJzTclOSKbL3W2hGN9JAkq885LIF
	kqtvPCifr+jrOg6+hAjIsI3cK1MFVWLh+HW4BvS35V8Gx/Jw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx45fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:31:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-349ffa249bdso4595343eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 23:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790749914; x=1791354714; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5Elp4C05nM48nzcrjsWZIcniOHlR2V1fdy2kVz45OFo=;
        b=HcEnL6zx4Fj0uCBXoAI3fu7ZSAVq+qHw1ynykePDyeT67ezLMgHu067tZt6YFoOzYn
         y+HltRV3cASo6n7JuaNAv/RtbP/AfKbaT6kSzvoZPlqHFhLL5KHDKSc3VrX13cj2pFCZ
         DXHZwA0Aw00mWfH1ZH62YjOm4E6PNO+3mkQQvR6qUY375tbJfksBDEm+AC0Rw2200T5t
         MbbiBpHOJwAhPP3i6QupAz0/4ApPz+tHKPaChvwcmszjXlFqWOhZfCQaLfVHa8tUUsHs
         YesIb6Ko+nq0UaUpym/7302VzP8Akif7HgSJxr9pSe0u5vPixTNAmNCD6yusILhVxrix
         B3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749914; x=1791354714;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5Elp4C05nM48nzcrjsWZIcniOHlR2V1fdy2kVz45OFo=;
        b=tidUWbTMNrU742tzGdynS33VjgFI8ojD3EdIMc8e4W3Q5f3DaTDR4MN19ao57Gwza9
         HBIZJGIt6iQVrOhwFO7AzZVqtm+TFSw47qoCdK9B6utEAjPZfHumZpPZPPO+qfMlilyM
         UgwS6afzJTs8CXYJ7sSCk5GvDqOdHu+n+WYZ3B9aTzZvRn/cmPgL0rq15hq/w6plc/dB
         RU0qHJnN5In6Y/Duei3x2UGGbduSchZuL1nP2MPN3O3osH84ZQYCvWItEJ70QU5xoUjY
         so35ROIH9kgmOzxjwNOJlzcYx75cgQULH+LCSVFec0RUHspXtKnov4mcOk1FnmxvjF5D
         zMHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmETD+bXd3ozyk88mzA79VoZmHW9ChoLBqEd1PUlTth4xakd+HBbmnC3RI5rh7CXmVaY2O9YqFpxY1CALb@vger.kernel.org
X-Gm-Message-State: AFq9FYL4AM+z+IR+FBLxKj6Sk8ImNXXtABLUBLdviSfxSjU59QIxEtO5
	UROYZF/iewVb1s8aW7sBSur5R3UA7E6P1w6ctAuwe7u7Xh1iCATexc8U1MUaUr0aghlPmsDQqpv
	3ZPiqwr2HjUEa+5ayGoB51c4I5S7pG27OU6LBp4LlTmC2wmW9NoaGw9zkRdaZbL7p91lu
X-Gm-Gg: AYBFou3jrMQbObA7PHxuVjefneidkfeveXOr6jBZXdBi9GG+c7tGh490po0TwyELKJp
	y0t1eUjduXTGH08GTnVj6ht8DPnIaRi5BjBwkmo2oXudMCMpJ8jPA+WgPAITfuf8OyjVscBba8J
	8t+GclovVWDmF+nZe2mt4q8L7qQ2alyeU85lEK06T96AjKiEsTpm1EeoAcEavvTHPtsz5gsh+fD
	XVZ9V+KM2Ybpxd+QvWtMVnaJ++DcPEeuXDwHp26AW+Mh9hjyRuXkfqDNv8GjkxXMiIPxSbAooZx
	1iO52qEOcf8pEbtGdSBhRU1IZWJLko5vBTIiA0+CED8HFRv6hcraVle6SRTB5YAEw171nAxwxc8
	7Jup8JPBkAf1mlgRG7HW27Nlp6m3r07rgsjIupjhqTsZ24wDSJkQ=
X-Received: by 2002:a05:7301:4b12:b0:343:bcfc:fd1 with SMTP id 5a478bee46e88-34cddd83c25mr696795eec.39.1790749913543;
        Tue, 29 Sep 2026 23:31:53 -0700 (PDT)
X-Received: by 2002:a05:7301:4b12:b0:343:bcfc:fd1 with SMTP id 5a478bee46e88-34cddd83c25mr696758eec.39.1790749912904;
        Tue, 29 Sep 2026 23:31:52 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf572e976sm1503416eec.20.2026.09.29.23.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:31:52 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: dts: qcom: Introduce Maili platform device
 tree
Date: Tue, 29 Sep 2026 23:31:22 -0700
Message-Id: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALqsvGoC/02NQQqDMBBFryJZN2IiVeyq9yguJslYB9S0GRtax
 Ls3EQrdDDx4/80mGAMhi0uxiYCRmPySQJ8KYUdY7ijJJRa60k3V6U7OQBNJt7J0dXvGWjnAAUT
 yHwEHeh+tW5/YAKM0ARY75kJeZ20kXn34HB+jyvIvrv/iUclKgtVGmbYxg+uunrl8vmCyfp7Ld
 ES/7/sXJEe5dMAAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790749911; l=3112;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=GxqbH1CHSJlspzWNldegvj4CiglyOW0Gfg60hT5MZPo=;
 b=Gchh2FhbMf9DJyVf4XHt6oL+dM0246wPlkIffdjg7FLhHl53oxdcWzso7K499JOwFnxDk6ry9
 T8K6dtqIx7fCCoQe91C1/i5dvkCYy91yGojJS8UL0WPTSW7FBLOWwxC
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX1JDKjS+gobq/
 M/oRBqsE7QH1nMVNN8EvDZqKj+pZVPvvNGGC/KUY5PGjgJFP40UCnnWGC6nrJ6OjC0PrhvLW/An
 Vu9wEjhZfv5AtP7YRXl4dGxTzIc3uCUbf9xf+UGfrZH2QQX8gLjaMWbfdw//G/Di3y3mPmw23iM
 lJ3VYb0HCHLpcsMYR4+lvB56rQoCPIbwH0g5iGGOHMVtWoW8iKC+mcZNMf9g5OZBiESuRCjiLA/
 W37TdCU9yn9OVyfSTp4M/CT4tq9YQ2cD7I0V1g47o4LgNLGBjQ8veKrmF7IvqeNf8koO0V958Ud
 KDqykwD0VPoBEqSg/m9NiIF7qwSO5k/Q9Ss/lA7DesQl6C4qIwFwIj1uOMjjZI3PXpnLN3nqYDe
 CLBW+As+X5jtZu5Bc1Y2sNkwnjZWhDpvOzdwQ1IZ9Avkye6CoRqSx1m1kpnI1Y70HJo3BJzkDJi
 MPJTZd8SShkTKPsO58Q==
X-Proofpoint-ORIG-GUID: YRg4nqebHC3-OnG4DdEd57CA-g7--z-a
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfXyr1xVgQqbDK8
 Aa9HN8Qd02UIpsUT+P8Qy3w3ASlCYYEdsSWvBONEx4GCEbUP33fXPz/r674Td1yIvzKt06nI0rR
 S2ajldSdGgtPg3Kp4GPsbUVfsrCt0K4=
X-Proofpoint-GUID: YRg4nqebHC3-OnG4DdEd57CA-g7--z-a
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abcacda cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8 a=_I6dFAXXm9IZ1C54fn0A:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300025

Introduce the Device Tree for the recently announced Snapdragon SoC from Qualcomm:
https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-gen-6-mobile-platform

Add bindings and base Device Tree for the Maili SoC, MTP (Mobile Test Platform) which enables
boot-to-shell with ufs, PCIE, sdcard, usb, DSPs, PMIC related, tsense, bus, crypto etc.

Features added and enabled:
- CPUs with PSCI idle states and cpufreq
- Interrupt-controller with PDC wakeup support
- Timers, TCSR Clock Controllers
- Reserved Shared memory
- GCC/RPMHCC/videocc/gpucc
- TLMM
- Interconnect with CPU BWMONs
- QuP with uart
- SMMU
- RPMHPD and regulator
- UFS with inline crypto engine (ICE)
- LLCC
- Watchdog
- cDSP, aDSP with SMP2P and fastrpc
- BUS with I2C and SPI
- USB2/USB3/type-C
- Modem and SoCCP
- SDHCI
- random number generator (RNG)
- tsens
- PCIe

binding dependency:
ufs-phy: https://lore.kernel.org/lkml/20260917080622.824253-1-nitin.rawat@oss.qualcomm.com/ - reviewed
cpufreq: https://lore.kernel.org/lkml/20260907-maili_initial_clock-v5-1-e79bb6b93a49@oss.qualcomm.com/ - applied
spmi-pmic: https://lore.kernel.org/lkml/20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com/ - applied
qup: https://lore.kernel.org/lkml/20260901-maili_gpi_binding-v2-1-c10dd2324a09@oss.qualcomm.com/ - reviewed
pcie-phy: https://lore.kernel.org/all/20260917-vdev_next-20260916_dt-v4-1-e2f22f67646e@oss.qualcomm.com/ - reviewed 
gpu-smmu: https://lore.kernel.org/all/20260830-maili-gpu-smmu-v1-1-253e1108ce82@oss.qualcomm.com/ - reviewed

For convenience, a regularly refreshed linux-next based git tree containing all the Maili related work is available at:
https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/hawi-maili?ref_type=heads

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- fix the size of mpss_mem
- using 2-cell specifiers for iommu-map
- add reviewed-by tag
- Link to v1: https://lore.kernel.org/r/20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com

---
Chunkai Deng (1):
      arm64: dts: qcom: Add header file for IPCC physical client IDs for Maili platforms

Fenglin Wu (1):
      arm64: dts: qcom: Add PMIC support for Maili platforms

Jingyi Wang (2):
      arm64: dts: qcom: Introduce Maili SoC
      arm64: dts: qcom: maili: Add base MTP board

Yijie Yang (1):
      dt-bindings: arm: qcom: Document Maili SoC and its reference board

 Documentation/devicetree/bindings/arm/qcom.yaml |    5 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/maili-ipcc.h           |   62 +
 arch/arm64/boot/dts/qcom/maili-mtp.dts          |  960 ++++
 arch/arm64/boot/dts/qcom/maili.dtsi             | 6956 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmg1110.dtsi           |   57 +
 arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi     |   57 +
 7 files changed, 8098 insertions(+)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260929-maili-dts-d375e31daefa

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

