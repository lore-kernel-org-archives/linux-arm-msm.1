Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD5544E659
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 17:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542174; cv=none; b=avtWM1J0oBijW+zuvJL1p/YUL6KY/s0X3/TiQJqCM7j4JpkCfDixY1N4hY9AYNC520FQGqUUYvl+hTDC1fIcwtD9LY5XDN9U9h3jBzGSM1qlATBin+DpDjb/Go6GWF7HYUOFcBDhr+9PxJOkZZz1wmwOdxVisyUUcHfTotPNudw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542174; c=relaxed/simple;
	bh=x7dRHrj7nC8wmVCl2DWfpnKP2LS8cd5CJwncZtshTtI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dlFFWGIsylM0OH9i2+3W2v6MGm3KuHqLdlkCGARE7ooY3/mnjzD5J7dxsIK+gh68GuP5Eg8wGakpNaKtDcfpkCBDACPznHWX/VuS4r0ymcpzpJqBGJhCzdO5606hR85zmydFzoMLd4gYRCWW+mYbkah17pG6lOKqTtkrUOS4UmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B83Y16dl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=heTmTYQr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B83Y16dl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="heTmTYQr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684DgtMn3121398
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 17:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jfdac7YboZcbgYFhN1kGke
	x5CY/GjfxDt67MCRr45lY=; b=B83Y16dlkOZHoHbNni9+ZDbautUl/9OTJHeIGf
	o6caHsrw6pl7H1dv1MS+P9qfup1fpsCI/gfoKgtEeACrk2+7ZkrDf/6oJV8uizPV
	J9qiMguk8HGgheaV2kBPvqU4Hx9lfNWsGNDHx6CDyEqQwgObfPVcYfD7vsfr/bju
	Bpdwh/UF4iX/MJ0UyOJ+fuWwWoJtpzeYO2w0c2ZXn818hZCW6zz1fErEni9K2duT
	fP2PvL+DZCk0C01AsPIEBGeKzNl6aq1jdhQsYV5kMclUCxNS7usaz8uznn8QE/L4
	max/5KVuj56t/WD+ySnJUbR8TZ39RWU7ZqM1U7gQvgHuYcVw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fk8cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 17:16:12 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73883529f72so1038727137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 10:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788542171; x=1789146971; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jfdac7YboZcbgYFhN1kGkex5CY/GjfxDt67MCRr45lY=;
        b=heTmTYQrgwRljHCMp5T7txvDm+15/edlirk7mchTSG4NNyXg62ZrfYA3ttmMTY17tb
         3k+0/gTROzvQVzVT50aQnyNvYxWnvZAj2p1gIvNkTu+KXeHetr9/57wnisuMEGWD2asT
         G0PjJofqlH30DWzYdrmICIlOlWR5+1cV2lerNf5sGK/UQDf4NaLq1zfXFEfNeErpoHsi
         zRPL2FiiylIrG4VlTjoz5pXexRHOxh/5rApPgLkTkyrg4q2qts39LWjzCH0nURpSLSrL
         YOoCE9RwIDnELSAYty2B9cCzM4tsFb4mdMyvxyZvn72Yu0seJY5/IMwUVkVT32GB5XSO
         0B8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542171; x=1789146971;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jfdac7YboZcbgYFhN1kGkex5CY/GjfxDt67MCRr45lY=;
        b=g5HFANM0ApOLUURv6ZL3Tcg87IHW5GqEQovNt/nLnymQtjZ0smlFloi/E2OMc8V/IO
         DYuejd+qwuKVzNtre6uhoWQpv8c5+7atvaWoeC7XMz41DOwC+vjTWjPL4y0X4xwxszlP
         I6toSJZ7rkZg9NkU8hhsp1GonGF0s5vyzcvoaSk1rqXDKQczZN8M9wPWDF7JzzvCUu9j
         TDTT6FFE/yv7OAlix/3BSSOclKwzLgppftX3c7KSKbKB0CsFKyYAnIPPA+dKxEb7l6ZL
         ZMTOcSI7Y95UpKVdw4LEhuQCnOd5fclDlUNGS69Gj4klzJMs7IvXJrVj9IHiyegTxH4D
         fGvg==
X-Forwarded-Encrypted: i=1; AKwUvBwkxu0HFCQnqnBTxwC7jHnR0837jOgKVuDB3cBN1vQKgah+kN95sLbaGMVrHi3SeVsi+hDb0U20MsUakFMW@vger.kernel.org
X-Gm-Message-State: AFuF++mAFzIUUCwTSZy7jHryMpF5bvhz3XU7/NdOjOX7juEBOi/LLo4l
	+l7/u9zfnSvOfgRfaj5SpiosEYBPDXJ0v90DpkhzahF4LMHZTMm8upNfj6uPu87D3N6UUWNi3vb
	ZB8CcMd1oJmhDSNFj43lbW7oFMYpUvy0duqMfRq31a6eNlSYDryCFthdDPJG0ii2aTkV/
X-Gm-Gg: AYBFou2ewbXHmwXNcqdR62EnOYEkW8iH5NNKfor3cQNOz89p+hQippgTGRc0cmpdzWb
	FYSwO9TdkibFKtmpRRoxHym6OWJKw5wnLoqkP6NKLQYjZ2xAowBQMkteCgPfiUVaBhRXrq4vIJf
	013ohRaO4ZDhCTCD0G50CPrYwH+o3OAAx1NQGE9fQds9bc4Tf0zfh9/T8bCuowHZqz/CYi37uG+
	V3ahMBN+LTmh5lxX+Jwh6PctDwMlzOit9TS7vUsJ8BuM1j7EeeU0t5oF+gTtF/pkvPPtb/m0LkB
	kTwNPhp/K7Ed8DUC8kWBuX4PQ4ZScZXk5smKiO5Kdk6W5eE2mINDKQkZ1gjQ6p75+LkRcQeGvlM
	HSic5gzlK38c3HQ==
X-Received: by 2002:a05:6102:1625:b0:77b:28c1:210e with SMTP id ada2fe7eead31-78a4a6e7016mr2730799137.1.1788542171469;
        Fri, 04 Sep 2026 10:16:11 -0700 (PDT)
X-Received: by 2002:a05:6102:1625:b0:77b:28c1:210e with SMTP id ada2fe7eead31-78a4a6e7016mr2730765137.1.1788542171014;
        Fri, 04 Sep 2026 10:16:11 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm35516655e9.4.2026.09.04.10.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:16:10 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH v3 0/5] PCI/pwrctrl: tc9563: introduce support for embedded
 GPIO controller
Date: Fri, 04 Sep 2026 19:15:17 +0200
Message-Id: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NSw6CMBCA4auYri3pAwp15T2Mi9IWaSIUW2gwh
 Ls74MYEN5P8k8w3C4o2OBvR5bSgYJOLzvcQ/HxCulX9w2JnoBEjTJCSUzxoh0ctC8GxmmYshGL
 S5LxqBEFwNATbuHkHb3fo1sXRh/fuJ7ptv5QkBypRTLAxsq7gUWVLcvUxZq9JPbXvugwG2sTEf
 hV+UBgoPNeCFXWRM03/KOu6fgBEX/oI+QAAAA==
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
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9afcdc cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=S8ISWd2nbyi9d01ScZoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: xO8m5u7AWpQ6Tn0VTzmMKG8jOsYfXOX-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfX0S55BrNgYPBn
 B8266MsYJAIEDZSuxaYXvS1mW0sz6bx20UpnOddb4cWEFZUyLAfTX8tboy0A7g5VpI/xhZLlghs
 LvloHFOmZfsdnZZyCZskuKsPzWM249Q=
X-Proofpoint-GUID: xO8m5u7AWpQ6Tn0VTzmMKG8jOsYfXOX-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfX5i3rfXDvVZJH
 UfHw6d5ltn3FjE63AEO3R6TeVGuwSizt7lUHDDmorR7WQX5eeFfg4IHpF7q3sc4zSkvucmR6plV
 MhK9zYPvS3/TCybSX36B8xLn54AGE69+mvQb4AoI41P0L6LtC2DvwTjNFcvr7xuMKoOpgsoGF4v
 qVkEI8Y9+ZLXgjh56U1WMQ9QZL3EQGaZCYPE/8xWMCIIQdzbyvsonuP8HKrFU9GhUxFVeARTSp6
 DP7seMJlOdF8HqBZf5tsJIiFIiWf8q7Vjqd2cNi87qTNbOUkxpUKChtVTgrkwg9SXvtAHrIexQo
 qW5M9IKBFSafhQfvs5vbtkTK219DxNQqgjIU4HuFSOayDHjwMZPKPXkQ+h4ACI40vRVEtsTPAmw
 csfek+71Fxyuz93gRUnbdoIs0jHMvO1voMESJ77UdBKRiAssgf9l6RL70C8/kvAbyMr/obTNKvw
 z/mDCN5VkFlfKmoPaKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040156

This series is based on pwrctrl upstream branch.

---
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
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c           | 154 +++++++++++++++++++--
 include/linux/soc/qcom/tc9563.h                    |  19 +++
 8 files changed, 294 insertions(+), 17 deletions(-)
---
base-commit: 028f86457e822ab9de5b0d6d23efddc1b8b54ae1
change-id: 20260731-pci-tc9563-aux-66a29d438f60

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

