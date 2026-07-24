Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA904314D1A
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886893; cv=none; b=c9ldgu8BMTbIsPwM0RI0lu/AtWeUdibfepqx4UJyoDrlz7JwswvnnppcxND5ccpO03BVddlMHDNvI+Kc4YlyyItzsZ3kZkA0YjO1hcdBKYh3yXXxKcUuKL5vp9sb9DEz2ojDeT+0RSFFf7Fc3/dtoW1zJYytGHd/zybhpq6ZkQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886893; c=relaxed/simple;
	bh=x2KQQnNVJtbr6DQqWnASA1oMJFYR1CTGP5Xl735YDXs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WF/u5x9ACh19fkc7kPaPswZ/bsrPEm7as73u2UFUZzZ+2ct6Mm5Mvy4ak4W5z9t7jVxDzWMyrRarVsL04Q2J3eae7Pa1QHfLVBzeRDHqc/q8kouotXfJ5kPLaibxh3vvaAoqXCNDhzGVfMh02mnsgI6aV2w06aQPNXoSkeuJA+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxLWdn99; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=If9q9I21; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxLWdn99";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="If9q9I21"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lDmo2275974
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QQ1KUqXh2X0JK7OD3T8Auu
	RQqgqUz5sSN1NK3uRst4k=; b=UxLWdn99+iTvcjjeAa3E96j89bH/jw4Yw5GRIs
	RWRiuj603Hu8HbQdOeEqdfTJpt5Hd+PUA27Yo0kLcVGrsnR2uirX8PF0o0SejsGa
	6smXVFLd4mZUxKJ54ILepDeXmi3Juku0M5it3mmC75YYlLscc5KcYq62+v1EAuRh
	tivIjFNAq+1pPdyFzFNFXswEtrIiNCYssXqFgBrJwkmnkpFc7jjQYV0UO+m60vPE
	g4axcgCXBhvNE5A3on4ledY4d0aixtANnhOf/hzqYy745bxTBnxZhqD9TeQqkxz6
	+nzmKQyMFSsD+YbbmGL3rpWzaxF76OGm0qZk6rWZjMBYeL0A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0b677-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:54:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf6acd760cso3627395ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 02:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784886890; x=1785491690; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QQ1KUqXh2X0JK7OD3T8AuuRQqgqUz5sSN1NK3uRst4k=;
        b=If9q9I21ocACrb4fu+2N0lZfCOQXhZ8w25gtezvDTnL5OJxgcHaNvyIz8NwTJJTPuT
         MG6ew6ztcdHzp7U2wvxqTfj/quuMNO0zfcLQUVcDi0a4NOe1Fzxm5HXw7YTxbk36PRXS
         E0VrTlTtSN3Qooi0CvgPyn0B+PEaPKv0R434DFPGYdT2DYa6zPcNN1gUUGbkswjV4Q+P
         ISRYZuznrvM/GBIDGjiEs8mgXu18usVszHsrZi4LIFrJ5G1lHWEOdaluDGDEk4AWac27
         6CY8DEtq4SO5xEofuYY1j7hRwqLZF4IdaeT6UJeZiLSoTV3XIkFzkpMKCkmyaoh5kuVB
         xdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784886890; x=1785491690;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QQ1KUqXh2X0JK7OD3T8AuuRQqgqUz5sSN1NK3uRst4k=;
        b=UFNJ8jcFgGKYvfw049G7A0TI09fEa5wL7lLpPI19xbxTkc10bgp5JwnQ/khddIzoXK
         t2OnCvfSGS6Nc60ZXOPQ0pcyrZUsaSuFGfugSfjmBLrEWv02xsFWXYWRqBOqXiNMAKOX
         yx536+4GgcQ6rFrErxYGUrLVLhDjNKevufCI5luVKEgdlVDlMD7c5axmzs57yEL2Ngfj
         VnFxZIFZCKNdELkhJt4iXOO2VbYnuDEO/Phxdo1pi8KJV7uGrS4d8oOIGNz8bIMXmSke
         ROb0AyUEIJ2zFTCtlNq83FbgcwGE57NUZ4tRWKlSwSP4/MU+bIM+g/X/MM9QBPMfjboj
         TWhQ==
X-Gm-Message-State: AOJu0Yxw2EHA7KSrEXgWwX3QvlVfgpvmx9lF/ncgTJ+oeMpR5qvs8FQt
	EbGvLo0T+ONYo7jzeQsHOaAtbf3fuyRUNFL4EJabOaH1OW/pYEQ/4FZmjp7mrsEyTiUSzBlZyQu
	Q1KnBe4FidTtK44ki6caRM3zAvHEVkeujHPAFnfe0lwtmfhW+QFSsD1YrLEuD1RTstcIL+dS0xn
	hV
X-Gm-Gg: AR+sD13z9lXHEZSGazFzmoj1bGcY19KVFwQHw4aazGI394pP5GL0NOWLOYsMIeVlMoQ
	4sp7K891nJOqChaf+fk1JltVPeVVkn4F+UocSm9oe4XtD6G4lov1VITWsrWonbPaLvNqMsbq+NP
	i0gA5yhN5v/LTa04oVN6LhK2L4zWGMdb3QGRPkWJplOkE/JzV+fphS95DJcNnjqOKjkug96AZdw
	2Q4StxVI2XAJdg5wDMi0MEtPzfwsuezvbWzdjaV71QV2uMEI7Bm1SuHSnkUaa4cCN3pS/i5dU5v
	4G+wJubE/SS7nHTOMmC3EB+/xVKN8/KKRNtT5WIqL0yPwEYLT2juAjv65fxD9wxFg+D0ZFXinAV
	YMgF4BROsJ1UzYq6keqRoASW0n06Pk17y2Ub1nkrJGtVwaI5lHPauRPdoHCDaSh5e700bTIxmFG
	A5IM+rk+x3ctEbjUsCHALzMQNzS77uVA==
X-Received: by 2002:a05:6a20:9398:b0:3c0:ac0f:6558 with SMTP id adf61e73a8af0-3c44afcd355mr7533881637.2.1784886890265;
        Fri, 24 Jul 2026 02:54:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:9398:b0:3c0:ac0f:6558 with SMTP id adf61e73a8af0-3c44afcd355mr7533845637.2.1784886889774;
        Fri, 24 Jul 2026 02:54:49 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1b6a45sm28975093eec.28.2026.07.24.02.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:54:49 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Enable mutliple peripherals in IPQ5210
Date: Fri, 24 Jul 2026 15:24:43 +0530
Message-Id: <20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGM2Y2oC/42Ry27CMBBFfyXKuhP5bYOqqv9RdWE7k+KWPIhDB
 EL8ex3TIqRSiUUSTexzPON7KiOOAWO5Lk7liHOIoe9SIZ6K0m9s94EQ6lSXjDBFNFFADNRTBDS
 cOMe018yVafMwYhMOWfT2fqlH3O2Tb7r8LJ2NCL5v2zCtiw4PE1ycjC98izHafNq6eM4LkgoI3
 kMYdpJRAjMFAk6mJurGoVDktY+x2u3tdpFW6fVyX6SoJCYpTEUFo1xooDDb0dbp+bRd1aXv0Xa
 2e1SoCYXWhq3rDzCzZJOo0HmjBQp8XMLBDjGC337BzNNsQhuJZmVXXpr7lsFOfpMdXCIx3DkjB
 ReWi9oooTRK7lZokYpGm9pSJssli02IUz8ec8YzzWH8tKB/48yX23g0LMG+pvWfBrJpZjc0lVe
 aLdEQRZwySJhU/9D8hmb8Si/Dk3R5jnLacMPu0Ofz+RthBGJjqwIAAA==
X-Change-ID: 20260706-08-dts-e830bb27c72b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: FBjoMISRjNVCJVBvh5AArji5d4pBXvh8
X-Proofpoint-GUID: FBjoMISRjNVCJVBvh5AArji5d4pBXvh8
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a63366a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ASWaWnsz8j2Ky6kNu3AA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MCBTYWx0ZWRfXw0LqTb/SKkb6
 teafM8wfZujcoieG2xYq0q8k3B5Gt2BIjWcb8f+fnYinE7pmjdT01gUczaV6l29OBeEgsYTzJjQ
 tYpmNTZOS2p/4MECT4Kpu9NiBehtPa+aEArcusb0L5B6FxPdHiccAPtnxEf6QaCgz6tqMdaHyvV
 uFnIBMXV8Cv5RZ8Um2MeLd59SxN2Zq6JnVZAKs+/T2J2+LSXMK8QqKQiXFWMBTLZ0VVKIaXqVkZ
 F/1nHEOXIhJjwa2zSMvC8UHqM3cd7xV+a3mURUBaR03P5aDlAlBgJaV2ci4a4MTLbnpjymUTNym
 Drpe+yOuR/iKuicRpT0ACfun9rhXr05df6i80itIBhV36f1uE5YCgh1EpOt1wlw6sa1dubS7Doj
 zcwGhxZZbsVXs5R9LUO4+KTthnetkZ58X3+a87e0nsG0tmK9mAaYTTY+++g+DUVlkeyMnEOGWuy
 Z5ssnYQ6/94WeyoLJQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MCBTYWx0ZWRfX2QIlbRGOP+Ys
 hU1xLj76JtJAi7GGT2qkpb65IpHGMkRz5rImCLbOB59gcMVAiz0sledTIPk3RFQiSv5F42g+ULB
 HY+S7rEAWvuHhm8pgbMOV5NDqqhDm5c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240090

This couple of patches enable mutliple peripherals like USB, PCIe etc.
Additionally, it enables CPUfreq and thermal tripping points.

Please refer to [1] for initial review comments on the PCIe related DT
changes.

1 - https://lore.kernel.org/linux-arm-msm/20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v4:
- Fix following sashiko comments
	- Add #include <dt-bindings/thermal/thermal.h> to dtsi file for
	  THERMAL_NO_LIMIT definition
	- Change tsens interrupt from edge to level
	- Remove ipq5210-rdp504.dtb from Makefile in the second patch to
	  avoid build break and add it back in the 3rd patch
- Dependency related sashiko comments ignored as they are addressed in the
  prerequisite patch information
- Link to v3: https://lore.kernel.org/r/20260723-08-dts-v3-0-074eb131f382@oss.qualcomm.com

Changes in v3:
- Address v2 comments
	- Introduce RDP504 common dtsi and two board specific dts files one
	  for NAND and one for eMMC
	- Move 'dr_mode' to board file instead of SoC file
	- Dropped 'polling-delay-passive = 0' and 'polling-delay = 0'
	- Use THERMAL_NO_LIMIT in 'cooling-device'
	- '\n' before status = okay
- Removed 'num-lanes' from pcie0 & pcie1 nodes
- Link to v2: https://lore.kernel.org/r/20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com

Changes in v2:
- Change usb3@8a00000 -> usb@8a00000
- Ignore other comments as they are covered in the following prerequisite
  prerequisite-message-id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
- Link to v1: https://lore.kernel.org/r/20260707-08-dts-v1-0-fce82e14cd1d@oss.qualcomm.com

---
Varadarajan Narayanan (3):
      arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals
      arm64: dts: qcom: ipq5210: Introduce RDP504 common DT file
      arm64: dts: qcom: ipq5210: Introduce RDP504 variant specific DT file

 arch/arm64/boot/dts/qcom/Makefile                  |   2 +-
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts   |  17 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +--
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 605 ++++++++++++++++++++-
 5 files changed, 828 insertions(+), 71 deletions(-)
---
base-commit: 434c2aa2dd2b543567e088f9d992187ae0cb348d
change-id: 20260706-08-dts-e830bb27c72b
prerequisite-message-id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c
prerequisite-message-id: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
prerequisite-patch-id: 66aa95814074faffb61393faa30396c42af41126
prerequisite-patch-id: 0a03dc1c91a2f0c03af823aa43f59a9005eb8607
prerequisite-message-id: <20260701-mailbox-v2-1-5e6ebc874e4e@oss.qualcomm.com>
prerequisite-patch-id: 956b405a71f384354b5c35a44b97a0a2dcf65eb3
prerequisite-message-id: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
prerequisite-patch-id: d9efdd8a09b028b1343243c5f0e78cf3e8b1e253
prerequisite-patch-id: 36cf721e00f3f5bbc3ccdc0d39503c5899771085
prerequisite-patch-id: 35e083bb85434a34d86467e53b9eae14f78da125

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

