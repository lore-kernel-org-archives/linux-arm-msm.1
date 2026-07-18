Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB73B37E5CF
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784376393; cv=none; b=tIL4wnL3AWw13kEN2UVG3giwIEaeBCdaHpT96aFs+rKRT4GS+2Ji52cHn6xWYKzhfJ1L22QfUsnDJfMZgNfg4asomx434L/iZ2ip/DQcCB2GECPFEpbXFlqn7gjUIo9J2tOAkyGJeYU80ZZGfjvIjIEdIrQHdLonGfAd9Rb+fsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784376393; c=relaxed/simple;
	bh=OilalDYz3TZf1nKvQmIubMlOxJylgAFMx1qmpyii19Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K80b+YmctVa/0mA9IRR1zh/A+L27z51BnPy+GrMTUDU84GLCz4ebFKQadd94En3nRuzrbAY+WFJzeCLwntlHmw0MQAD0a7SWLP6wpu8+5AwtGflQ/NFcms2FiVMFgC/7VqKwZ10kiitMiayZ1jvXs+40ugiCCJEzXqkXnsXx5n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zy6Go0PK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJErC3Un; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zy6Go0PK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJErC3Un"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHJba584144
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y3Xb9iWbON20hskHGG5RyV
	UF1FxesjYiFKcSfGr+YyY=; b=Zy6Go0PK6wuXRwz1CEjWBkF02T6061UNF6FjAG
	8+Vsl8C8zxf55oK7AumndOwilSG3rrSxCe/2pUgjzEoN12Z6jNMZRoOMOOkMlBBW
	6Fl4fnFnfvpIlwcLnAfUOC2OOxwCJ40TPs2lJE5yz/mehc3saUxN6UyNe0YYvzvU
	I3FT3fvih+Wa2qfsBLvkrceiSSv7JJPDCZRfD94e6nrnHipScxDdwKx6MzxN6wG1
	eCkj8k9nTaGl0h2BS4f5C/o+sbliDESw6eVdt7NdeqNYyGnUeZ3uZLptkZAeV+gA
	shIWru0AhXraVfbCrWL8YhTj2KcAHV/DwfD/SyQgaRQlik4g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2d90p6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:06:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cea6a46766so124827015ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 05:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784376386; x=1784981186; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y3Xb9iWbON20hskHGG5RyVUF1FxesjYiFKcSfGr+YyY=;
        b=UJErC3UnPpiDS3S5rtKy1A3DBmopvkmtihK3yYxogUCuVC/SEUc/kI1oqrsNv/06Ow
         v/m8peo7sC9qK9qo/KrpWQjyjOTk7+b+dCYsr8b4WFnxhDhs9aA01hpMQ7qrJtWO9K17
         iysXr+CU2iivl7VvpPyY3SuguakwnoDGCtRpd1BsogQIeAor48gAbdY4MD8/D7b6Kc47
         gd5xYg/iL7W173ghJ01Ojr5IZ4lcBPjt96MMyonrMV5QLygQzbqsClDBaWg47R7BIUxL
         IaSq0B0IhGZ5F+dZnT0RD8V4g6tXaZpSi5StaBV8/gfQPEm6P5+hJKOswbsXxDyonWsT
         iHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784376386; x=1784981186;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y3Xb9iWbON20hskHGG5RyVUF1FxesjYiFKcSfGr+YyY=;
        b=CseNvtXVJqvL+YCNSR1ho0J+tHWAnVyuKtNRXu6PALEvdhVeucewrnhqMPH0eg8sF2
         ec0PFOVC/XC4zXV53W68lI2/yD3yrtU3DlKutTozBl1tgMfKqmCoQ3p7/hNs1BZW7hO2
         lxTb7Gk7nVE51t5D01P5p2tPsjgRu2aX4in/S3vBEjIsD3uNXMChdnkQtdafqcb3KhUG
         0MJktbXIoALNJqUimaaxJBlqH5UBK5TF6MvGm4fsEHbjoo4JiK1kIJrzO2qTGK1VWeZZ
         htsV9OJRmXnuSypmJ12cK7y+V8rcgF1x3rMt9t9W5htAf5iyfQgh8Z+QWiF9z1iUfjTh
         LM4g==
X-Forwarded-Encrypted: i=1; AHgh+RpLghXR8/gCwK7ShZpcmj7Ev94HY5eIS8FadCuDiniLjScVrPB4X4hFyR0MKnsZkiJKmnm7g38XGPBCRS3i@vger.kernel.org
X-Gm-Message-State: AOJu0YxAW7ieDUQAhOOWJ7RN+VQJoaPNcYAwI5nlYHZ3ZfuTaJpLapd8
	WZNr/LtAqv5b8ioPRABOQXTIlO6WIicEhEuaeaeBUSXqIOvyBjhzK7Bt2AiazX4CXEZqXDsPcwX
	vlTvEfJw4WIw6a+ZkCsumPkQJZe0ojqlI6N4W8WFJkWDz9YoaI38OhgTx2mc+H1ODI0jX
X-Gm-Gg: AfdE7ckrwY3UI6NtiC0ouyEXv6mZ5xDkYiPdIHwygUfm2fsjJ2KjYoRQqrIkSvSZPnX
	mGV4ld6LNrs02X0DTtljn8eN7/LrHD94QC/KZCZl3wsehvigt/0NgI6WFcJJMig14Sx1BtRu0PS
	YtQyykCIlX4XSn9i6ke0N5LCAGaFTErK0DxITkWMX4KMiNRv3A38L9AmRPDEh8I2i3UhwXJgBX3
	YjnOIfbMVegcbBHpDGqEanQ9R3BI2+7YM41J/5thWNkbEx7J/GWCYxLGEWcZLYY+bAZmPJdbKnr
	HWra84+2LlKcvT6OKFl1QPNxuFXSO0rmsf1Dqc7EE71KjPGYgORy4U8LvBZJHe11cxhYzOU2hap
	RZFVH5gqx6Pe+7dbUEvue7PJIiqUQhOtZR8I93u5M8KsqD7uELMHC+EXPju6+g0ZZ
X-Received: by 2002:a17:90a:e7c5:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-38e4b244fdfmr6603859a91.0.1784376385832;
        Sat, 18 Jul 2026 05:06:25 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c5:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-38e4b244fdfmr6603813a91.0.1784376385376;
        Sat, 18 Jul 2026 05:06:25 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm17666314eec.0.2026.07.18.05.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:06:24 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: Add Kalambo SoC and CRD
Date: Sat, 18 Jul 2026 05:06:20 -0700
Message-Id: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADxsW2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0NT3SQT3ezEnMTcpHzd5KIUXQszS0OjRAPjpKQUIyWgpoKi1LTMCrC
 B0bG1tQCH2z8lYAAAAA==
X-Change-ID: 20260715-b4-kalambo-crd-86912a03bbd2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784376384; l=1363;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=OilalDYz3TZf1nKvQmIubMlOxJylgAFMx1qmpyii19Y=;
 b=8Ltq8rNeSZIokzkpU6nUTPuUF7C76Q2Fa1Irz8M2LKpOtBqV6IMwjbQVWIivYOF1OhWa6ObWI
 9ev/RKAvOZ/AQp1NXZwFSwqHkqkNG/FHMr0WktQeOt3esFhP9+tCvnq
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=HpxG3UTS c=1 sm=1 tr=0 ts=6a5b6c42 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dSOnKLZ8RJAofC3uZQgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: xcT01x36g5BGPczmi_udshjZdKMvkKQP
X-Proofpoint-ORIG-GUID: xcT01x36g5BGPczmi_udshjZdKMvkKQP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX8VQBc8v1eFnb
 TUhHaaZWabacfDQ8EfbFaWAheNepWEQIRaaJL/UQKwJWGAEKB7nR7fhTmUTge1k/Plf166U7BEn
 uc4aXDSkUZ1XnRYWq+QjubSa8AosNRMI9OOzlO5BImVyh6Qozbg+b1UCxmFtC5zz19+KmSIMCYP
 Uq1D7UJaRq9YrHJe4v1Kyoh1Vipk+Q4trudBmjvqjsaHdc6S7hTpePcIZYP09MOX8iDhQQs5d3V
 I6h9sHTq0vHN+hC7ivvyvtmiR1sEC3IqsgODmOMXlK2Zg6oTv0DLGCzAeF/gSYYrTPuXE/vee/k
 WrZn+6UBqyft+2U9SaNknP4evhVz1Uri4oosMP31xQg6lCNDpb25kJoy2XTUDg+S0KFKhQrGDLC
 +wU633ln0Fik7KUv8jngyDYHWuzXJ44wg+69LDZsMLhWttqIqg1u7/mw1DYUQARcrB9GVmX++Qy
 CxzOpkZE/qZVohR6DwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX3NR8HSipUi/d
 TEJdcWyGM8qTthY3C8+/PyUR3aicRS7SHJJelD/m9huta0jX8+ZQx7kf9Lh0enUt8xoCtexGLLA
 LucRUvoI+Bj/pXQfP2X7fkPmNqsXXsw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180122

Qualcomm Kalambo is a Mahua derivative with CPU cluster 0 absent,
leaving it with just cluster 1. Everything else should work as-is.

This series documents the board compatibles and adds the SoC and
Compute Reference Device (CRD) device trees. It also adds the Kalambo
compatible to the UBWC configuration table and allowlists the Kalambo
CRD for QSEECOM to enable access to efivars.

---
Gopikrishna Garmidi (5):
      dt-bindings: arm: qcom: Document Kalambo SoC and board
      arm64: dts: qcom: Add Kalambo SoC
      arm64: dts: qcom: Add Kalambo CRD
      firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
      soc: qcom: ubwc: Add Kalambo UBWC config

 Documentation/devicetree/bindings/arm/qcom.yaml |  5 +++++
 arch/arm64/boot/dts/qcom/Makefile               |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi            |  2 +-
 arch/arm64/boot/dts/qcom/kalambo-crd.dts        | 21 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/kalambo.dtsi           | 29 +++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                |  1 +
 drivers/soc/qcom/ubwc_config.c                  |  1 +
 7 files changed, 59 insertions(+), 1 deletion(-)
---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260715-b4-kalambo-crd-86912a03bbd2

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

