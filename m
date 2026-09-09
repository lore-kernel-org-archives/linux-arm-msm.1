Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705B357267D
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 14:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965822; cv=none; b=gI8lg/xDLC6gnK/b6zBM7KbH8fac/UVSNTRAZk9Ro0Yd0TwTq+N7dRF9DTddASSFyb4xMc+0mLQ4Rmkz+FLfmeA+Hwlp52wTieEn39ydzqM2WgGGXLyL+IVsWMAddHQjKxi16wGkRR1gc2sbsh6L7HS3JJpj5ToIPEGMlAZK7ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965822; c=relaxed/simple;
	bh=4OXN0Rl1IOzPKZW/swSOZm42BNSE5v5u4Sg55/zk5zw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ROBNFp6IRKZF2vMRHEhLwkf6j4OiKFybX+8ucYY86UcAs+bunPmOZ5tVNBYDxXa7DdNSm2AvgVB6qR5rrCZ6jixZ+etgMmdc126JnoRTe4IOYAkTVnknvVyx/V2y0o7cH14rQyqSrhToPlhX2zhnrm1NxhOYF8sKp7dhKbuIOWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0YpvMx6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMJIczhs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d0YpvMx6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMJIczhs"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689DIRrs2080978
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 14:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Wp2blfNSiKAYO5zA3+biPV
	ntif31YKgd1gEoQ6yved4=; b=d0YpvMx6l0iCCXgDnDNtdbNlXIovDRKG02Cwjc
	AD/UMcp1AtS67+GbZ1/lBCsNMFrXTkcxfEDjPSP8Pc4HwcJnXy0zQ5eQSeEwrk//
	t1gUcPRU+Cn/wKQm+QdauHYiYGtVhiW6FGPPIxrf0hNpbIb2AXPhISMmvluJXHTb
	PZTpE5R6au9Fl4rBqzImf41rYBiu5ORPm0LONzrxIV4EpRd+8wG4+Q+N+SECOb0d
	q2lbH/38+XQSMgbiJ80XtcJRE/Wyj0NIBlSw4KS1HfScaKvE8MaUHLnp/09+/7Yg
	GV/AmrdehkqZecV2/ifE8gkwY4LQCMo1YEmR2GxWeS9GM6IA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk87r0fs1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 14:57:00 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78fa7ff1a44so237951137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 07:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965819; x=1789570619; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wp2blfNSiKAYO5zA3+biPVntif31YKgd1gEoQ6yved4=;
        b=RMJIczhsfDmrOJUYPqsfEDpIumac1/BqbZSD9zwyR4tkv+mYjjRTpMDbcl513KNTZM
         ODhhyOyTn0KgHh3Z2lPH5PJ7eJYSCbo1cPTbkNeTozptRw1OaoFAW6wqB1V+H6EYG5pX
         Ij0XuiZLEyYTuwhBmR6xQID1VeeDBz00CS5focEB272Tb8rPOo9jN8qD4SypyLqvcyzV
         mfqJv+yYzWVMZkypx4x8r+kDYbILPgh78dYoWpN51AuZSWy2tj/5+lRwNC2ryh0h1o86
         758xdtXbgij/pcAzlmk0VBnbsIx5Qmj5CN31zXPAx7tj/kFPEg4ffnNriWi0cHnI2Dpk
         oing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965819; x=1789570619;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wp2blfNSiKAYO5zA3+biPVntif31YKgd1gEoQ6yved4=;
        b=Ax8x9mmCtOmcmVzsS6cUj6jtg1UEQ3HTJac6yD2a9/hDD80yT22i6KnfPmWmuoOJtC
         xwdB/hly/Dm9CxgRoWk/vmZ67kGhfB300eZDf3fpnW9UsS7b5SMOkVgveu1Z/B7QMjVH
         BK3EBECpsZ1Dp3J1U43usRrP+KGegMuieIvbZX5QD8X6avbt31/oCzDOrxmAIxQA1K58
         m17DMPMK3fWZUglOKjTUVeHR9faruj2dWOkGHqEMyfNT0IWleXjujwHN97wNw7xRgd+g
         kPA55KFqEH8XQEqiYyFWAN8i/ZJaFxGAqudzGFkCLTLaa4rhwuQ20TXuVhngEsSSagT8
         8kIQ==
X-Forwarded-Encrypted: i=1; AKwUvBypHCsJZk4E330Mghg84Gy4kfF4cbnCQaRk2FR6QHf3BeyaIb1lE98xj248RyvJ2WEa1vd0YPltgfCOPqpP@vger.kernel.org
X-Gm-Message-State: AFuF++lCVAtML7QdVtoX4X/GKN8ZyXKYmFybXDhKl0BwETmqlPi//zCr
	nT4OB1zTRBaWm5KMNba1rfIc5Drtt02LNqzRSPQz5cKBTtFww216IcfeV7kWjqmvPkNJ7EIqKH9
	zYlq2QJqLsGE8zGUBSlnT0PCTyWxCOC2b9AOZDukAiEv92N7f3I4IGo7uznkGOnYRYfYt
X-Gm-Gg: AYBFou3mQ2I7CRU10D965OBjLBlPiNmxJJ8D3sDnjoUzD3aZKZmzOdjvJlSBzPHUfzb
	+JZsgBWanBznfxMf883yhwFW37uKRUx9cnsz6FfgAdMiqwYwLuPRrDGSNYlqbEioaALCIyeJjrA
	jALwOm9wnnQhWtoeh4ochEgFf+meMRbv2TuwRU+lTuxMeJr5jNAsQw29PEsDO0bICvXGXWCcj/3
	qS5Luk1dJgg7CNBobiQwlXk7wqayJ26NDuW42GZdW61DCQooh4ZLQi/n5vU7nNfSVc4CkJ4f9aV
	/Gtueml86q3LPiJ3u0t77opRDvnA/6av+m3P5G4IBiT1iKxba/pymdYR/dsnTPcFPBcuHcmdufd
	i0qIy3sEBtOP0MQ==
X-Received: by 2002:a05:6102:5e86:b0:78a:8a0:7116 with SMTP id ada2fe7eead31-78a4a6f61c1mr13893475137.6.1788965814485;
        Wed, 09 Sep 2026 07:56:54 -0700 (PDT)
X-Received: by 2002:a05:6102:5e86:b0:78a:8a0:7116 with SMTP id ada2fe7eead31-78a4a6f61c1mr13893440137.6.1788965813982;
        Wed, 09 Sep 2026 07:56:53 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm47846131f8f.10.2026.09.09.07.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:56:53 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH v5 0/5] PCI/pwrctrl: tc9563: Introduce support for embedded
 GPIO controller
Date: Wed, 09 Sep 2026 16:55:52 +0200
Message-Id: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNSwrCMBCA4atI1kaSyduV9xAXeVUDamujRZHe3
 VE3hepm4B+Yb56k5r7kStaLJ+nzUGppzxhquSDx4M/7TEvCJsBAMyM47WKh1+iUFtTf7lRrDy5
 JYRvNCB51fW7K/QNud9iHUq9t//j4A39vv5RjM2rglNGUXLD4yGbDNm2tq8vNH2N7Oq1wkLc4w
 FQRMwVQETJqUEFJiPyPIqaKnCkCFRW4lC5pCB7+KHKq2JkiUYmmicYYCw7CD2Ucxxdvjf4shQE
 AAA==
X-Change-ID: 20260731-pci-tc9563-aux-66a29d438f60
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=AImJJIpd c=1 sm=1 tr=0 ts=6aa173bc cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=m0QktR8YAgtX1DuhF7UA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX30FKzmPwk0ce
 M23XRBZiyB9ztwrkfp+sOwZKWoWumuTSel6C7XKGXZ/0v6MFqnAPeAoycuKl5p7jYIKTNKpeU8/
 5KrClHOflOZHOVokYUUies5zvGjCkEbbAek8Pb9e++dcOeBZRWWCyo1ybocpknecZOhEZqv6Bgj
 H9ThVA9I/rfvZuSKA3SfUYBD2raw8NgGZWf3lliKyg2QqLpTaP9ZG5yQRnasMRdGhJGNKaqCaVT
 ZkQA89KDeqFS/EZAqvZCN3dnJrhRvpeDwIIccRLYycISaH3N72ZOBQA9o7RyXPUECKWr0dgEvLA
 iz1gr50xu/Re+rHlrX8/oBuEigU0cyex0IvntcIb5vukg3D1wRo2jMNnflmQYqEDFYMiGPfejSX
 cmhxtih0nFg+iqrnxtP1Ff5p/OpcUJKb6VLHQvsw+a9UNawhjpJa3uMtuVkE1vSS542HUj+y7kR
 G7vur+ZtMCzyMx7JP/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX4YGyq6zZrjH3
 xZ6E899DPjLseyHzI+QtYaWkF35fll1RJtkzRdWfrPQswGzr3NnCMRbNqdFhgl1PMAxYI2OHsRo
 kp6+a4V8K88OXFaB2u6s7PEivSLXOWg=
X-Proofpoint-ORIG-GUID: fFJIq7V6sfPU0l64g8dNDTJdKEsb-87v
X-Proofpoint-GUID: fFJIq7V6sfPU0l64g8dNDTJdKEsb-87v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090167

The TC9563 embeds a GPIO controller currently used for per-port reset
signals.
Add a driver for the GPIO controller embedded in the Toshiba TC9563 PCIe
switch providing 37 GPIO lines. The controller is registered as an auxiliary
device by the TC9563 power controller driver and accessed through the same
i2c device.
Please note this series is based on pwrctrl upstream branch.

---
Changes in v5:
- Fix GPIO controller binding for Toshiba TC9563 PCIe switch.
- Link to v4: https://lore.kernel.org/r/20260908-pci-tc9563-aux-v4-0-c7fc7778292b@oss.qualcomm.com

Changes in v4:
- Do not always use 0 as aux device id.
- Link to v3: https://lore.kernel.org/r/20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com

Changes in v3:
- Describe gpio-controller support in TC9563 binding instead of defining
  a gpio child node.
- Link to v2: https://lore.kernel.org/r/20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com

Changes in v2:
- Fix PCI_PWRCTRL_TC9563 Kconfig dependency
- Move of_node refcounting management in tc9563_pwrctrl_adev_add().
- Link to v1: https://lore.kernel.org/r/20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com

---
Alex Elder (1):
      gpio: tc9563: Add support for the embedded GPIO controller

Lorenzo Bianconi (4):
      dt-bindings: PCI: toshiba,tc9563: Document embedded GPIO controller
      PCI/pwrctrl: tc9563: Add GPIO auxiliary device support
      PCI/pwrctrl: tc9563: Switch per-port reset to GPIO descriptor API
      arm64: dts: qcom: qcs6490-rb3gen2: Enable TC9563 embedded GPIO controller

 .../devicetree/bindings/pci/toshiba,tc9563.yaml    |  14 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   7 +-
 drivers/gpio/Kconfig                               |  11 ++
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-tc9563.c                         |  99 +++++++++++++
 drivers/pci/pwrctrl/Kconfig                        |   1 +
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c           | 165 +++++++++++++++++++--
 include/linux/soc/qcom/tc9563.h                    |  19 +++
 8 files changed, 300 insertions(+), 17 deletions(-)
---
base-commit: 028f86457e822ab9de5b0d6d23efddc1b8b54ae1
change-id: 20260731-pci-tc9563-aux-66a29d438f60

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

