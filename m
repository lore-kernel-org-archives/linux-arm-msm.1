Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E184055C31C
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 15:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881360; cv=none; b=X/c4rokT3d7Xwv9hYQgA9viS0kbHstKT3edcUwp+/cfqYKCuP1wvlV8cup4pWJoM1Ll6gmIyiF171SF/CpjQpMZOcxN5HtXk+VeV1EVNYEzo/VqyNWX6aASVPNxSMr6XqFQA8xjwe7pnNx7cEKT5/UWyWItg7W1H95lLt6nUm6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881360; c=relaxed/simple;
	bh=fhRlWff7YHTXSkrUExvk0YCc9hzfoEf+q8AvJaGChWA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JJJd+6Dh2aBCOiAyB8kUqEgjEzKUF/H7XgbO/y0dQQ/A4SBM+Ol3RyhhM/yVsRIj9ZecT/H+gD5jWTQ7/lSWItSN/C2xKjm2jZ4oOBbszz4jlO2c+7i3AqqvVpIlWJPi93t4A0ZMCfsM6H3ZHW51WZlEsf74uoN93Hofn+hjSTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8A4mDMl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gu+2Pabx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8A4mDMl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gu+2Pabx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FOZwX2703994
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 15:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VwABaUz9+GReDShA/Kw8DM
	wbIPameg7P5vllF5tztWs=; b=m8A4mDMlX/Sk88xWElsHuCzQ9x3CXxwCTYL8RP
	0EfXo3YYR56p6AVSCV2Jr8kMKiGS3LEdj5uoban/y++W11WIh/COS+VyoSgmh2CN
	EYaRMLaCzXGdikgrmjhg83P0UeApuDyqsts1QqxgHigo2bJXe0lVD3JSR4b5HMT+
	/ceEBVhXyhCAasxq9pASK2UEdvYa9S/3l7lOKJnoTHQwuvufXNRW3PQ9ZwwoSf1l
	tVikoVFftpXA40Nxup/yl2BqtJdx6UINSD2PJq9rSp8bIMNxe/qmHbRKt6eoET+h
	8bV3lftANawORZ+QH9e4NJN+OI7wWXUQW8Px9kwOEbB+x8VQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjjucu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 15:29:06 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-785827e6073so620615137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 08:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788881346; x=1789486146; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VwABaUz9+GReDShA/Kw8DMwbIPameg7P5vllF5tztWs=;
        b=Gu+2PabxyYf1VhR/d1/ISGi/fPsFwdhLvJfGtB5suXnbdQC6cp0g9DJt4K/bgOzp/C
         fmKMiR67GUN1c44A7Nmsej5AUFxPEPF8XV8RDldJyl+dKgNeuCLX6OptyvcM71XfduI7
         2JZgpijYnJf+A3Kb5b5sDf/rQjxvfueo8wJD+jLNikJozjuWtdYAD/Gnm5VBRcnxsX6P
         w+DVCoXFm8UBXmFpsdiH/w6/Y54hMCh55dA7t1UTFm5jXHDNcdV01LigFWaUt1y2FIxA
         yXps/0wsJEjTcisKzl9EYNW1dyUmjOBy+VpqEkLrjGxvhtGNFi+oeIbkLSJU6z1EZckJ
         eHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881346; x=1789486146;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VwABaUz9+GReDShA/Kw8DMwbIPameg7P5vllF5tztWs=;
        b=oBzGvJ8a/O+hHjlzIe+uMtJV/EabIp+XU5szFJEBTgDuohe9ezVPYpkIOG6AoHn3Yf
         /WRiyR2NWzwMKQsaLJF+4Ajjaho0Fd8mWefueBjDplQV1thhfw83KgGnhPChdTJ3w+wV
         TaOR9faeDQUt61jwlNuxNmKacdhr10leQRx8iDbzuFXxCo7P2ki5N/z8pzcCS5sA/DNz
         I9JfuNhCa4GVSAQP+Jr6Rpoa0Txec5hyFjSjMgrBRAQWsNCGHG4dMwPY7nvpsHVJ0nG1
         IapjOx3d5D1zaHmk3flZJPGJsrk3QjKf3Gl4/Is/up5k/IchHlFTTVZD1dPUNpF3aqOW
         GzSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbQbP1l7vXX3u09awW5CYXr20ez/1QcEjEB/5GUYVEMdthbMIRiL5tTtC+ebegPRR2oGjviXQMcbUZF5pQ@vger.kernel.org
X-Gm-Message-State: AFuF++kjxiLwLgW7DmuWlc6qOroVrVyoqT4TtR9TciOeh3JbGQE57zQ6
	FJCIs9V4Ga1P51cxqDHjZXrTUMNiKv2tYG/qi4B9JjID5bxOX5YPjtALZP/gxBik2RpYknORtxg
	JzrXqB5Kgi1dwbV9rrDnM69FuNc1rOmx4xz115JlDchYgwt3cL1DuO4T1O5KBS/wjhczn
X-Gm-Gg: AYBFou2riFyMUGqdSLhRgkG07fmGrrt2xFHu6V76WX1VtJde8MRTHsVcpyBTubtuukJ
	itZV1GO4H6wFdS7acpsmzmTWKF+VosIUxPyEqfahQFBpqqsVpsjN2cVvTbySP7dh8ytf/6f4Q4D
	WdAEPNKdUFglsck+g9s9TQnPrzt21ZMGPioA/SFdMI9zNm5GfpRLFichiGbAuoWRAfDNqejy3gg
	hbu8gmcCBecUvDKewFOmkPS34bq0i9LXI+7DaNVSokuKX/WNMAxa8mAr9KC6Ki09O/FeC5vVHD8
	LynEzhIp9YGjaDIZuL2l5xUzuwPbfDQkZtigXkkFkZaNzRdc9H/Y39tSaInTw0AUv8GtSMbVrTV
	uGLXH5fQ8pMWTaA==
X-Received: by 2002:a05:6102:5493:b0:789:5f54:2367 with SMTP id ada2fe7eead31-78a4a718223mr10621274137.4.1788881345836;
        Tue, 08 Sep 2026 08:29:05 -0700 (PDT)
X-Received: by 2002:a05:6102:5493:b0:789:5f54:2367 with SMTP id ada2fe7eead31-78a4a718223mr10621233137.4.1788881345273;
        Tue, 08 Sep 2026 08:29:05 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm308584595e9.13.2026.09.08.08.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:29:04 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH v4 0/5] PCI/pwrctrl: tc9563: Introduce support for embedded
 GPIO controller
Date: Tue, 08 Sep 2026 17:28:33 +0200
Message-Id: <20260908-pci-tc9563-aux-v4-0-c7fc7778292b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNQQ6DIBBA0as0rIuBAVG66j2aLhCwklSxosbGe
 Pei3ZjYbib5k8ybGQXbORvQ5TSjzo4uON/E4OcT0pVqHhY7ExsBAUEyRnGrHe61TAXDapiwEAq
 k4SwvBUHxqO1s6aYNvN1jVy70vntv/kjX7ZeS5ECNFBNsjCzy+Ci3Gbn6EJLXoJ7a13USB1rFE
 fYKOygQFca1gLRIOWj6R2F7hR8UFpW0oJxLI6BQ8ENZluUDF8t+AD8BAAA=
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NyBTYWx0ZWRfX3sQsSOiCU2PQ
 XIHs2TuB9OlrQI+aUyHN1LG6gqUfCSOrwKJWU6iBTHo3isszsieVEPle5BdS9JYWMSjyuJunJKQ
 GCsUdaXFpJ20v5boSvUIb9VnpCWXjd8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NyBTYWx0ZWRfX/OHG1AGNgkgn
 bwr3HHsViYOCvCeOyFauWpR0VpxaEvtH9WkfCJehtCSkO8Lhon5fscRgwHo9H3o9UWvT4Q2mRid
 Zv4N3bHMUY53u+V5FjVot+BtUyNv171r3dH/s+WhjDq5maJDLrsrC1YI/Gf3/BOsHxqVOelR4Ac
 Ju12pXykQRbOPNtPbNBDZ5MEV9s5DqjcVUTBEHsb6qj/EuIHq50OAW1bqQH1owv9WIzOPHPskTK
 pcmNjNVfKnSkatfT/veQFrknRSK8CuA6egrc5f9Fj0iQxLlDzywj9moDMJ/G8CWThzPvLk+eBI7
 dAoR3reKIKuxna1WTckHoJf7Y3fDFGl1AD8yBC2kR3UFf7ZdeSpazjZbS1ueeV/NwrmsEN/EpAj
 TN+Mkhgq27Fk4oalmSFHhipktdvWdUNldYAefcZ1AZQhTLgzYihXYrCUPZJE0eswKsXCDIClz7D
 PGHOg6Hf/Vd84fGjFrg==
X-Proofpoint-ORIG-GUID: VxTkvLgY2bjE4WZofceRF78-JGEyuECA
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6aa029c3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=m0QktR8YAgtX1DuhF7UA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: VxTkvLgY2bjE4WZofceRF78-JGEyuECA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080167

The TC9563 embeds a GPIO controller currently used for per-port reset
signals.
Add a driver for the GPIO controller embedded in the Toshiba TC9563 PCIe
switch providing 37 GPIO lines. The controller is registered as an auxiliary
device by the TC9563 power controller driver and accessed through the same
i2c device.
Please note this series is based on pwrctrl upstream branch.

---
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

 .../devicetree/bindings/pci/toshiba,tc9563.yaml    |  19 ++-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   7 +-
 drivers/gpio/Kconfig                               |  11 ++
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-tc9563.c                         |  99 +++++++++++++
 drivers/pci/pwrctrl/Kconfig                        |   1 +
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c           | 165 +++++++++++++++++++--
 include/linux/soc/qcom/tc9563.h                    |  19 +++
 8 files changed, 305 insertions(+), 17 deletions(-)
---
base-commit: 028f86457e822ab9de5b0d6d23efddc1b8b54ae1
change-id: 20260731-pci-tc9563-aux-66a29d438f60

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

