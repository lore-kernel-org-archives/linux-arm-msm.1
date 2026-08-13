Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC5939E9C8
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 08:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610810; cv=none; b=OIp/Flex+AjhF0juYWJniiCFhpQoxbWnChEXnwMob8UF9Z0hbTsysRLttfhEKjKTpV3xU7TydlI8j0ovKkku9rlE5MzNxITaG78lZzE/cjBPpPpEs3TUus1+KdJgv/SfrUUT+BQ6dmtAsF5ls1evtYCKGcih/bYdv0wYncJynbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610810; c=relaxed/simple;
	bh=efHjxVvbfrVhNaRgShi6fYbSF63CpaLDwINSCF59gfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XYbhO4pU4N+6SVz2I27eLzAQoGlzYq88uZNpFjNo6Y3JK50K0KbV041RgYhglA500n8ZfU6QNuGG91kQHFJUJ3YW5z0x9VZ0gamZ3VJHh85bMO0AuI4Aa7jjt8JuLqwxtkXplH0fbgpp2qFcxIPoso4d5Vi8P3LNBrOhJefvMoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlG7sCSH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TKQPX0zC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlG7sCSH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TKQPX0zC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5gVww1749784
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 08:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yiI+SVvL5khgVK5lQD1o7vQ/+Ok2Dk11vVs
	q13ulycA=; b=TlG7sCSHh0/ZDOnnn+lHo+GySav+Taf6TaG26zULmHK2ZkcLb6x
	eO+3M3b5CH0cwUPwekQqO01BZzr3gfs4f0ApHij5+i81ku9sLYOTuMNiW77Mo6Ip
	wifv+Fjcw3UyWMu6WJgbEYVJNqIcXuRPNEVuKvFmJLsNK1FSDqnGu6RCXSJsWhlE
	x3wfroq3gVFj38nFXN4XbbFjm0Th3pIHdRQgC6VSIHTA2JjYBHq7kFS2UrSFOeBY
	GPf5jfmAuNwwEC9tmrBkNUYGoqLYYbIdvKwxr03T4FdkH4PH+vTCrqb+YBvPwiIb
	Jm33bI0HuojYfgcm88yaCIyl9/K/AS6I8/w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0xx1tngn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 08:46:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52b4f6ac06aso32737961cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786610807; x=1787215607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yiI+SVvL5khgVK5lQD1o7vQ/+Ok2Dk11vVsq13ulycA=;
        b=TKQPX0zCWXDWl+vugC7hEjC4NG6Ce/swxf3F5B1Y8vACAu638jshaP9b17+wAR/0yY
         8aUNuYwbDpucDB8+rVhkSFIPjzeNkfa6WLyFajDuFrMF/z4QLPxV4bMXDSyLRRpLhnRK
         rSKE+7uc9GE1quAgt93e047a35qZYDd2yF0ickUkTak57La5raahqEVS7BAQxlID30jM
         6QBnwrmYeeQQtRKHcWoO3UbCAE80WNBirPT0wgovE9on0MAmsL156wgyLRvpAlYE0s3N
         xKNw8qV2CnAjQS46joTi17AwCayZjsY/B1iEvUgfE5m8kPlo3oxyhHZkJfIQRZW2bQj4
         Jekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610807; x=1787215607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yiI+SVvL5khgVK5lQD1o7vQ/+Ok2Dk11vVsq13ulycA=;
        b=jkZHv1srNgHui5HAreT/4kbpngS5b3VtJENH/nqVfv2cbagxm5++pKShls40kIQr/A
         z3cp5GTA4emRWfKpRtcQGQKJTnAF1XbaLJxhaAIONddaitU0wyl+X+R1K9rpNoQ+iQ0a
         kISc17sdHIZ2HSwj9bvwadoPozUokEIOe+jbRr1zgm69q0MeZckWSPnW+6vKdPqcv8gT
         6sMM3I0vah+FD0Qa0kJrJyTVHFqwmFD1pghy/u/9vHHKteZzhLP8cV2FHfLWvB6u+rQR
         pUaZTODxah7/6MuHlDDQERO2fbotbFc5OE1jur9py6MSxGOuBdS5sE0nGdSOTbbMdN+b
         CtZg==
X-Gm-Message-State: AOJu0YzvhAonuYzFw5ceQEChbScQWk1UhUa7p/1Sq95b4n5gVee0LJ0E
	4WhDKz9XhmCmFK6WhLeLgI4cXZB1lFX9nZyfCYk++pg4mrA/SdHFcbgGX7pEFE6tu1H7efSqgMC
	1SGAHkUweMrgX2lgGWlcJeVpLXmW7/RLk1RArUkfWo3eg1A7YMG5jxZbfU1/HZq5Jc0yi
X-Gm-Gg: AR+sD12Wha80qV19tGoJtXADeTcVQOWrRRqZPs1URQFbGktFq0CizMfJ303J7GAnzi7
	tmP9eYaeMbWlVqzWm6kKwmb8v+q4S0/lhoYZDsJtne/+dLBF3/5bPLgfHyIqPs8R6AKR+Gi3mlr
	n9ni/8Zadg8541kqcFWuhOh7+ZX0Rx4kQ502k7AnffhHlm2R31e+ww0KLyEpIEK4W5GoBbns/Us
	Gk/tGRAhJRKXR9t9SrHv956D7UyFmhPO28RiFNmoh4/uLR4lnINWhXQPzoshh66/UtIlTP14fK/
	hT2ZNCM4LfiI62HdJdtT3KXcSL/ZZ+wMg99JA06vuwBZzQWJvrLm1f0H5EvoVLdKsQQgZ5jXBqw
	lXofCxhpe+wIQaWpMoPL+453lxxvkxNP7jugDxA==
X-Received: by 2002:ac8:7f47:0:b0:51b:fe3c:6c1 with SMTP id d75a77b69052e-52d73d2aa74mr40942891cf.27.1786610806960;
        Thu, 13 Aug 2026 01:46:46 -0700 (PDT)
X-Received: by 2002:ac8:7f47:0:b0:51b:fe3c:6c1 with SMTP id d75a77b69052e-52d73d2aa74mr40942641cf.27.1786610806545;
        Thu, 13 Aug 2026 01:46:46 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb1d:dc:7e00:4b5d:4abc:49d7:be98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5c2837sm4400146f8f.37.2026.08.13.01.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:46:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm pinctrl updates for v7.3-rc1
Date: Thu, 13 Aug 2026 10:46:42 +0200
Message-ID: <20260813084642.11325-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: B916bZdXFFmEWFrSMRUJfbCZiRYxJyYT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA2MCBTYWx0ZWRfXxudR81844Bj7
 fFfV2ru7rrVjAqtb3GXvq7dC+YEqJEEfwE7dO3gwsptXjOwRyR3HXg10VYaNFiDuiYoX7uPzyYb
 pVXhra6C6uwlz5da5+1uOD8DA7Bc2hYuHzYMYB+oWI7OR0/OI7lmMqfV1Uf2muS4u7egSsDhiEM
 K/ZKaY7VxOaOxkp1aV2OLnHVrEIKur3t1kQu98C1+HNpYhj9X33K2GNmXT33Ix9Iu1yCffgCgEf
 p0h+6z2Zu+5WgdOE90sh6gS6sog5hpQWKL91FNatHOlX8upe4ea6Levu/BDdDzFivSifPmVYfa2
 n23RLJqjE9BAUZ8U8fhnX9AaFXO/nVkT8edWWbctbdP8K9BpOUol2npPIk4/hHVHMU0a3TxYh/E
 8aKjnY2l5AVR06kV4+CpkgbpiQKxxrayaR+KSKi2mw3vYqIL8G/4vf3eXOkJ/MKWKgBGSualjnJ
 KQuZhX1ojT3KucE+Cxw==
X-Authority-Analysis: v=2.4 cv=J6KaKgnS c=1 sm=1 tr=0 ts=6a7d8477 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=67OyyYhSLkYN1d6ZTO0A:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA2MCBTYWx0ZWRfX2GgX8YfYPc6I
 9hA1k9ktzBQaiXVPeZ6E7Wo3Q7j0cgcLigom63aWeaX1flnCHNvpsP/sHTCF2J70pXpuXbp4hCD
 47lGhOJOfqzsVmsk9ppPB3Ir13kRKzY=
X-Proofpoint-ORIG-GUID: B916bZdXFFmEWFrSMRUJfbCZiRYxJyYT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130060

Linus,

Here are the Qualcomm pinctrl driver updates for the upcoming merge window.
There are two new drivers, interrupt handling improvements for pinctrl-msm
and some minor driver updates and refactoring.

The merge from the irqchip tree pulls in dependencies for the PDC interrupt
handling changes.

All of this has been in next for quite some time. Please consider pulling.

Thanks,
Bartosz

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pinctrl-qcom-updates-for-v7.3-rc1

for you to fetch changes up to 1860fb0be224dec0e4d170f46d1cbbc77e25e09e:

  pinctrl: qcom: Add irq_get/set_irqchip_state() for msm gpio irqchip (2026-07-27 16:24:23 +0200)

----------------------------------------------------------------
Qualcomm pinctrl updates for v7.3-rc1

New drivers:
- add pinctrl drivers for Maili TLMM and Elize LPASS LPI TLMM controllers

Driver updates:
- acknowledge interrupts for the PDC interrupt controller in pinctrl-msm
- implement irq_get/set_irqchip_state() for pinctrl-msm
- add support for a new model to Qualcomm pinctrl-spmi-gpio
- drop some dead code from qcom pinctrl modules

Devicetree bindings:
- document new TLMM controllers and the new model for the SPMI GPIO

----------------------------------------------------------------
Bartosz Golaszewski (2):
      Merge tag 'v7.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into pinctrl-qcom/for-next
      Merge tag 'irq-chip-qcom-pdc-for-gpio-07-07-26' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip into HEAD

Fenglin Wu (2):
      dt-bindings: pinctrl: qcom,pmic-gpio: Document PMG1110 GPIO support
      pinctrl: qcom: spmi-gpio: Add PMG1110 GPIO support

Hans de Goede (2):
      pinctrl: qcom: Drop unnecessary bitmap_fill() call
      pinctrl: qcom: Drop unused irq_data argument from msm_gpio_update_dual_edge_pos()

Jingyi Wang (2):
      dt-bindings: pinctrl: qcom: Describe Maili TLMM block
      pinctrl: qcom: Add the tlmm driver for Maili platform

Maulik Shah (6):
      irqchip/qcom-pdc: Restructure version support
      irqchip/qcom-pdc: Move all static variables to struct pdc_desc
      irqchip/qcom-pdc: Differentiate between direct SPI and GPIO as SPI
      irqchip/qcom-pdc: Configure PDC to pass through mode
      Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now"
      pinctrl: qcom: Add irq_get/set_irqchip_state() for msm gpio irqchip

Ravi Hothi (2):
      dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
      pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM

Sneh Mankad (1):
      pinctrl: qcom: Avoid assigning unused private context in test cases

Stephan Gerhold (1):
      pinctrl: qcom: Acknowledge IRQs for PDC interrupt controller

 .../bindings/pinctrl/qcom,maili-tlmm.yaml          |  120 ++
 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml      |   18 +-
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |    3 +
 drivers/irqchip/qcom-pdc.c                         |  540 +++++--
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-maili.c               | 1625 ++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c     |   40 +
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   63 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    1 +
 drivers/pinctrl/qcom/pinctrl-x1e80100.c            |    4 +-
 drivers/pinctrl/qcom/tlmm-test.c                   |    3 -
 12 files changed, 2300 insertions(+), 128 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-maili.c
