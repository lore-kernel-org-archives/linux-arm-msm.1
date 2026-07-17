Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DC43D8115
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289269; cv=none; b=FaQnXIZ9r1q7INHOx+GCf/aA3/MLQxElhRnBHrCNZd7y+kz7wPU5LeMyICVtJM6lcn8eOeRQo686tLHPZVdHsTG2CR89Wj9pQaufU33Vq3p7hjl4zVWZ3NW+Js2sXIZGf166hOv7+16NwMeuf9R7mEo0Ea5JGArgO/znhF27qRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289269; c=relaxed/simple;
	bh=FuUHKTXqVqD7o1CqhdCoid0kk4sYNujESGpEyaGGwZk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AnS/jIfSCLOInbD5pHTQjmSWYeZ/jqmtIt4SNo47PdmryMHzSww2c/qPRn/DxWa06NZmaBNuR4Hyf3VaPqSJetcBq1C5rZe/xKWUer4sH1Yixwb07JOmzST6qBCzmT2CbZXikQ3utHoRv5ph0SAiO2sP2oBrrKzYfez0KlN/kjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HLedyay/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=McA2TXtz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLedyay/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="McA2TXtz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASnD31515824
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hN3jVOJWuZ58az8fkXYX2V
	KH7C0ZkjE3cXdWnAYN2wA=; b=HLedyay/XOGiFe+f7m8Jy8Vm2mYlBLCGImk8vK
	gg8FkievPPBAIS/ibxF3Jl/L70pN68uwjzKrM5bkUPoWdzJSIq3Dr8xytl6oGvV5
	eq1tlGObobURmr3RvpaY7TIzGKDjTbB7GwD3wPh7c74T41NTgvbqgGJkNtRPnTyr
	9mw1iGkz9toqSg4CouZD8KPKNfOoecPyzj80ExpZ4/fuKUk2Ur/TboRHxYg5QC5e
	hcOxMqBlBHo6aq7AdSj9f1D2Mt+MhWfCoFSl2Ornvdz4b/KZ6CxOR2S+g0qpjQTg
	W1xSywdajaPvXuM34i4Sc/Bs0S0EFRu6YkKqMH46Ob6Dnvrw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9gs617-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:54:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cceabd70f5so112765925ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 04:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784289264; x=1784894064; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hN3jVOJWuZ58az8fkXYX2VKH7C0ZkjE3cXdWnAYN2wA=;
        b=McA2TXtzVfi3hmS/Clc8MVV5TbPoQ/0gcsEt3Vvvw5CYlS3uQN8usHo7I/qAvw53XE
         IOE2VVRlJtyY+9+GP7+1DoubY4DUnObN424c3sJXgRdBn7sf6/dcwmJZTWYZKufI6xbO
         pQ1MfkL4KlTb3l7pSQjEtF9c2n05izy6WM1sKR6JgXhIWPGDLGJ3URJh0hjUMcWk4Fg1
         Wo7LIHxmDNvvq9IJyj0BxbaVSxgwSEts45vGbzAdv3b2Xo2fq9tdXZu/o7qVsrgwldXF
         q7SzfADayJ8nEwbysZ7bWx6Hmzs2M/blLXRYium0vrnjL7L0ODu4CFBr9DxXMtrdBtXZ
         CqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784289264; x=1784894064;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hN3jVOJWuZ58az8fkXYX2VKH7C0ZkjE3cXdWnAYN2wA=;
        b=NvNkAXKp0g1McgSDZO8yEBugQRdJWHrBKKtIFEQgofc9T+X4qqAsR02rXFi5NXkMmt
         xDI3+PgEZ6Ipb+58NghOsXIYIKqafpra2rw4XQubEskTR0l3CqoU06pA9cUzaittcfwa
         ilwm57ufiru3/w5JjWeqjnzlBxuP90jFJA8Qvw01Yz27c4cmhS3SsFtUWA74g9NySYk9
         otV1ti2YyrWiY0P4k1NVNK9ZTD5xpo2koJvS9fEPWp5jfsclFS5xTKF6a1InroJeaIc4
         wJpliWCxfQ49urmlfuySvr339lVUCfYfv6Ufb9Wb0nQqz2hrmWDnHTJbvmskHRmFPy3H
         828w==
X-Forwarded-Encrypted: i=1; AHgh+RpqybkPdPEZ2faAM8SDlD6vMnBwfSwVBq2odKvEh/VEJkuxnPbz8VoUbkngWQA/ItjeJwf/wVF50446L5i7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0BYL/r3JQRKnxdGkAhLATMD15sgSYNfAojj+XkrOl1HnQ2P6E
	HcHbwRPXpMaW09yjUNFWsZaXUCyvcYM4uhyMFli+9A2Ng6olNlr/HffwjRSa93Cu5lche7KHNjr
	QPaEcoTM60jh2PvlObIyfEk+oiE7vpo4hz7xapDau2f4zng3dnOvgNSg/iLeTvVLl9qOl
X-Gm-Gg: AfdE7cmgwVaLG2+LcO50R6kWFW3P6zCE2WKifYQTX9JBvLBlmBW3NtsVDEAvhus7ZVR
	O7xjUmv3HlFfO1L3i48nVdrWMCO9/lGXEijPr/FkXyXOn4EB0k4HR4zM/LYfFg2cbG7qkryAn7E
	TXl3X5ghgSItztOo3qozVSRj3PEOj5UDlkwb2Bjx4ZctkC//Ovzujtr6+8fLfnWPMbRHur7sVrJ
	GhBGMBifWLDx0JliBp979Sdorg+QOorEpVFl1dwaCy9Qea/6VHI53CY19DZM8L7AuXAj/yd7ovc
	8R1D0tE1YBtdVTlB+yEoAU8QuFdgT4LX2hMnG2u351N5eFczK31SYUM3jFsRxqISmyR6xMLDQAn
	dFCK8N63set7rNAMFRP7gOmosFl4975uT7lrlxefGj44OKnUDIVSPbK3zm3pTj+Q3
X-Received: by 2002:a17:903:1b4e:b0:2cc:4c29:8221 with SMTP id d9443c01a7336-2cf349ff4dcmr23416625ad.45.1784289263655;
        Fri, 17 Jul 2026 04:54:23 -0700 (PDT)
X-Received: by 2002:a17:903:1b4e:b0:2cc:4c29:8221 with SMTP id d9443c01a7336-2cf349ff4dcmr23416315ad.45.1784289263068;
        Fri, 17 Jul 2026 04:54:23 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f12e0sm9481895ad.31.2026.07.17.04.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 04:54:22 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: qcom: Add Glymur QCB
Date: Fri, 17 Jul 2026 04:54:08 -0700
Message-Id: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOAXWmoC/zWOQQqDMBBFryJZdyRJrUEppfcoLjSONqBGMyoW8
 e6N2m4+vA/z5q+M0BkklgYrczgbMrbzIC4B0++8qxFM6ZlJLmOuhIC6+bSTg0EXIFCWstCJuFY
 l8we9w8osh+yVnexwmLxzPEvWIlF+ONPgfip58leS1bqHOYYIRFwpLqW6Rap8WqJwmPJG27YNf
 Tz2X0VOCHtjxjTocBnhtzBm2bZ9AVPBB2XXAAAA
X-Change-ID: 20260711-glymur-qcb-1e2d2bc913fd
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784289261; l=2057;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=FuUHKTXqVqD7o1CqhdCoid0kk4sYNujESGpEyaGGwZk=;
 b=3D8TA+jj5K6LYqZPMbjQt74sAJ8v2eE09iDItt8sSbpnvFIcE2VhII1+7m4gZudwvdGHXRKv1
 XoRAGQRfqSYDeba3dWf+NuyDnw25WtOpvN5M8R8DDU9tIr2Sn6AdwDc
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDExOSBTYWx0ZWRfX7CNx+VLkT/rL
 FwGFZuUckqULSWOnpeCF8IMiupOgpr31OtbkRpXdwRsd2mnpzzgOoK44jgQj/MfdDSNGNOtvhfY
 hsFfJwPPraoxfd4b9yJNxII6q3okcn8=
X-Proofpoint-ORIG-GUID: IxS5o4F1DjnNAOLdJlVMukZ3qeSS3hE5
X-Proofpoint-GUID: IxS5o4F1DjnNAOLdJlVMukZ3qeSS3hE5
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a5a17f0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=emiPwNz2bb0dLlisEjwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDExOSBTYWx0ZWRfX99Hc5aEAx0OK
 13IlLs/ccVfJb/gXWD2L7PUR2k+ajodYPzeVR0cOpb3pSUWIjy280H2+00Gr0FJBuzaFpWGDQyG
 Of+bD7sViRl0W7H2zQCwv710KjkYzgeZLc0s2PkNWqGwmtz//mubG+O40CI6kDsWGIEM01XQpm7
 rVVf0A9RoDnVXFMRRTjR74v9Fr5KIshmqi145DrAps7qzv2ZWqh5NGUyOawlX0X7sqx8E6xx3f5
 gxT0EpCM56Get3YC/Xa7GamRbqbIqF3EnnBn9Eg1pAGJlhspM3u756Nqyvc3jpT0c5GITB5J0Oy
 M3j466d+sla2fzxDQjIAKElcZ/7sLo6PLkDxIE1/29LaicuFdtMYviDVai0Z/COHMAuou/RnSrm
 vTNGtDom4Ws+y3GLhnV3jlkAox7bA0Arm6HUYrVmHrHIBnRcvVpGH60ZyA8+ehtoAD5eamzn9Ug
 O7394KFOXA5Z2jLspPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170119

Add initial support for the Glymur QCB (Qualcomm Compute Board), a board
built on Qualcomm's Glymur SoC.

Unlike the CRD's closed enclosure, the QCB is an open form factor, suited
for bring-up and power, signal measurement.

The base support boots to shell with rootfs on NVMe.

This series adds the bindings the board relies on before enabling the
device tree itself:

- Document the qcom,glymur-qcb board compatible.
- Document the qcom,glymur-qcb-ec embedded controller compatible.
- Allow QSEECOM on the Glymur QCB so efivars and the UEFI-backed RTC work.

Features enabled in the device tree:
1. Board and sleep clocks
2. Volume up/down keys
3. PMIC RPMH regulators (banks 0 - 4) and the NVMe, WWAN and WCN rails
4. PCIe4/5/6 controllers and PHYs
5. WCN7850 WiFi on PCIe4 and Bluetooth on UART14
6. Embedded controller on I2C9
7. ADSP and CDSP remote processors, with a firmware path for SoCCP

---
Gopikrishna Garmidi (4):
      dt-bindings: arm: qcom: Add Glymur QCB
      dt-bindings: embedded-controller: Add Glymur QCB EC
      firmware: qcom: scm: Allow QSEECOM on the Glymur QCB
      arm64: dts: qcom: Add Glymur QCB

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../embedded-controller/qcom,hamoa-crd-ec.yaml     |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/glymur-qcb.dts            | 679 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |   1 +
 5 files changed, 683 insertions(+)
---
base-commit: ce28329fef089fc63dbaadcc4c1fbf9c287e57e0
change-id: 20260711-glymur-qcb-1e2d2bc913fd
prerequisite-message-id: <20260709-glymur-soccp-v6-4-16f70227547d@oss.qualcomm.com>
prerequisite-patch-id: 26f384ecfe96620007cab0ae3dd01db6e2314bc8
prerequisite-patch-id: 711fb836c2a609ad2f1f07f8785df3e8b72e97a5
prerequisite-patch-id: e9fe3e572292afc1ea6f98dba6c2176a28183dc7
prerequisite-patch-id: 5b78db9f6345733d9dce683ec231fa93859a1a0e

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

