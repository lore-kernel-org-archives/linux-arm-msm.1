Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8883A6B8D
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 07:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422020; cv=none; b=hBHqaef4G3dFWuX+6BTP8z+k/FYpjF8FdFP4EeNz6j7qhEFKXN8paxrTBHXcNwzYIjSI11m3h9SAINX31y0z9mX2V0B7sSU9CKKEHayZqraCNY2CYzo7T5gOKdzpQDp3lpvILM07/Thg/yrl/uEouDy0fB5vNzGoQf9Fsyb6ClU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422020; c=relaxed/simple;
	bh=AdPchfXsCQJMDBk4lR6KMgXheIpXggHP0WxqUt0lzGE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FWo1NEluRIpaAkBHafIm81UepuVhIpzLPd3KnqiKaZta6OFwBUAxNY65Qp97BSx2/15On9AI8kUxKTc6+2V07hs3pTrd4OETOqFM9dsCAH2Paz4tkM4fOdDVQrkjpW7XSgfdPPiAA4DKrO/bKJzwc/BKzdamUwgcUnT0WpQE9IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRvkp291; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MS/YDNuf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRvkp291";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MS/YDNuf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6837M8cj4124559
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 07:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LhA0v7+rttf/9iRNLvM4UJ
	HnE3oXqpEsh3RJGJCDhJk=; b=jRvkp291gXB0U8Z1GFg2yYuYYMkbo/dWuNrXBL
	g/zyp2XD2qrXxfX52hKYnMB56ZDO9Am1eHhi0/GKEnFFBVqg+Sh4NlrjVeFmKYpz
	dsOOzk3QpLlV0S0XY+ycDeRs7/dftfavJP/vSFoqfr8DayO7NeOQRc+BqCpSoEAh
	WGHX/jGru9/3kUrhShRxSsyeX5lRv3sizriG4RYCRw8n2+sR814KAMf9ZGUJ3A7N
	so33ZyHq5o9zLOrbQchbrMEpU1spTVBQ9qB+8UpiqT1M5GdBQZm/diSg8wWDh37g
	4OQgqOjDEqLvOzAhDhGAvnToM40Fb8w5dzvWW1VegsVhfVjA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekg403-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:53:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e38fbc5so384538885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 00:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422017; x=1789026817; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LhA0v7+rttf/9iRNLvM4UJHnE3oXqpEsh3RJGJCDhJk=;
        b=MS/YDNufm73uT7jncGCw1/TNkT4SAYaUFTuxw0zcIYJ7YEuUMgEk7PXhyndzJyw6+r
         YMDCTdUAyvYbem9BeAl6eGG4GRqv2GWjDBj8ltXnPTnsmORec3htiYesIxMMtmxYCKSt
         qysY/v0XQQkNaXXQZDU95X2Y5JuEpecgfhXkVgjBQThZ4LD+XLTXo3uIL8G+ghf4b9Li
         N0lNu4ovcUmVqxctJ7+WPRuvmKhvKKoz2cajYWm9NwwFNLUxrr8TSPEf9nA44VmiD+6L
         aQkOFBTxzZMez/CtVMB3wvcWx0VhEA58QaYLxiqrhT9uJTc3FHDYt8QDmEjUT+DxbQj5
         HiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422017; x=1789026817;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LhA0v7+rttf/9iRNLvM4UJHnE3oXqpEsh3RJGJCDhJk=;
        b=j9PPdCML+IGOwLR2EFtgIei1gshZa8nGL1goGHVGQZQUYnonsVH0JBqh6dX8CXVt8q
         8wz8k2gXqOpglygADlAIR+xPJyi1AwzQZK/aaufDx8686ayZavZqUU+KrKoxZvwoj5MH
         cq8IhFRbBGt9bSjC1yyijQkWN2eg8mlB1PXGLEyHc4SNAmEVMlMvN0OIXqNKsjcHI0Ri
         J80ZJihU80rqbXHqRC9fE2N+WESDQbeuyj3lcNUAeqbZ4O8+dnQCBAyA6rT6cX4sbeMQ
         IlmRMZlctZ75m8F2+MBKkdyGXutAGx/JEllfnE56Dysczaxj05TbEJqH0Y6te9dAM5B2
         mUhA==
X-Forwarded-Encrypted: i=1; AKwUvBx6isr8JoHY8qkGTaJtrw9T9+RkQVLVUL+5eKPPDWL9A42b8OW7pInFEPmf3onsKi4/oT7XUErpyx5LaWqH@vger.kernel.org
X-Gm-Message-State: AFuF++kegpaCXrwmdSKVC5EXvlAn/9rYJjbrMvTt7AW8CH7EVkWYF49s
	i3/r1xiNITT0xbs+eg5SgDK1qELlktJ5r5qtcPSCbaT7z7VJVIgMyMu29CYFsM3Uc4sMj8sBf0t
	Lki0hRlmZzASxZ8jmrG/D680OxfygnuBLw6cm4L4uwMe0De7CZIMSnLCoDdyQg7cENglm
X-Gm-Gg: AYBFou0kuFvedG9lNU+UnIqHn1UTvh059nJgPmpnSoYSVeuw9zLwFTiaF5w9AQW3FZw
	pZ9t5YU/UV8Q83HjIPmmtJmkbkZOMhFg5342Hb2kFh21K3nXPNr+EUxjhngjOPByHx4RaogNrsL
	Z0lVN5DlP22bI5NZIeVipb2+SJN1e06dLiwzWe9ScFYpJ0GkmfJaoMTFEhjTe98cjmoJuZb9CkG
	yndHIpaz8z0RxrN9Xm7ZX+rLN6P31ZbeM7zc6XQ4Svj0aEGEVbt8j4MEe62iPlGMJlI71BCv0T3
	wzH2J/bkQ6BYhheywHG8CbZm/Vp7AxXoQtT/EJc4HKgtLusRXOcQT/Qm6IP2dwIg11Q7roqnpiG
	96wftx5TmTGajbQ==
X-Received: by 2002:a05:620a:8084:b0:939:191c:cac7 with SMTP id af79cd13be357-93972cbb0c3mr226673985a.13.1788422016774;
        Thu, 03 Sep 2026 00:53:36 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:939:191c:cac7 with SMTP id af79cd13be357-93972cbb0c3mr226672185a.13.1788422016377;
        Thu, 03 Sep 2026 00:53:36 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d1fe2sm57232225e9.3.2026.09.03.00.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:53:35 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH v2 0/5] PCI/pwrctrl: tc9563: introduce support for embedded
 GPIO controller
Date: Thu, 03 Sep 2026 09:52:56 +0200
Message-Id: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQ6CMBREr0L+2k9Kq4Wy8h6GRW2L/EQotkAwh
 LtbcelmkjfJvNkgukAuQp1tENxCkfyQgJ8yMJ0eHg7JJgbOuGSlKHA0hJNRFylQzytKqbmyZ1G
 1kkEajcG1tB7CW5O4ozj58D78S/FtfyrF/lRLgQytVfcqHVWuZFcfY/6a9dP4vs9TQLPv+wdh/
 2PSswAAAA==
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
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: QwA0yjcI6BuVADvojPu5zX_evJcsKh6J
X-Proofpoint-GUID: QwA0yjcI6BuVADvojPu5zX_evJcsKh6J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfXyRtPgeH7xyIl
 m+BrSU/BkfavMYYievdBnsIPyVSVBfpJs6wIjvMBUGbV2T1bDhW6shcG3GMy53K0G1QuEkyhDDi
 XZtzl/m1yR9/lDuFmqSI415HaVUfXVragtarCZgzkPrQ5pxeYz2EfbXaMXrUXO9BZJZSfFlVMjw
 5PG6/oQJK4B2+A2h20YU0fiOdX+VT2SAU2oIXX9UVgx0EzllmogyMxAQMJos/U1JTOGZHGFAwdw
 O4CvLReR01kKzpJiyALFWyX6XIHjfMlyMo+gDnaKCi3F4sfRJ/2lIozTfyYsDkYmKwYweAUVcMr
 vnN92NoGgBJhWOWNk6IS+VA3xHoz1RgyguKIonJjgaTWEh78xgM2eaO4LDyqTN4afKpOJA/pllM
 WQVPJtRZPYgvMo2clZZhb/jPwRtsOGh5vnRrqzm1SwN0VX4oacXKWdzuwke3RFlMU4tPciOK+FB
 RerQGmhK2fm5cSF+zDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfXwscs47BKBqtO
 maq3GayHQ5sbi9Yfx7PbSR8yRPTgNKi62//SMKHVwPQS7/Hx9mHVc+6kQgw1KasIphIrKyDj7pX
 k7ZlgtL6cFoW40FFAH+OO+Vzv1oZdDo=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a992781 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DaOxmBnbJEZ67lbDJzMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030069

This series is based on pwrctrl upstream branch.

---
Changes in v2:
- Fix PCI_PWRCTRL_TC9563 Kconfig dependency
- Move of_node refcounting management in tc9563_pwrctrl_adev_add().
- Link to v1: https://lore.kernel.org/r/20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com

---
Alex Elder (1):
      gpio: tc9563: add support for the embedded GPIO controller

Lorenzo Bianconi (4):
      dt-bindings: PCI: toshiba,tc9563: document embedded GPIO controller
      PCI/pwrctrl: tc9563: add GPIO auxiliary device support
      PCI/pwrctrl: tc9563: switch per-port reset to GPIO descriptor API
      arm64: dts: qcom: qcs6490-rb3gen2: enable TC9563 embedded GPIO controller

 .../devicetree/bindings/pci/toshiba,tc9563.yaml    |  31 ++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   7 +
 drivers/gpio/Kconfig                               |  11 ++
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-tc9563.c                         |  99 +++++++++++++
 drivers/pci/pwrctrl/Kconfig                        |   1 +
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c           | 165 +++++++++++++++++++--
 include/linux/soc/qcom/tc9563.h                    |  19 +++
 8 files changed, 319 insertions(+), 15 deletions(-)
---
base-commit: 550ecdbab0f51174202e7f9f6557673090bcd5eb
change-id: 20260731-pci-tc9563-aux-66a29d438f60

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

