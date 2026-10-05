Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520AB47F775
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 12:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202910; cv=none; b=Ztsay9VxBgGkfF7RjaHJCBIZPBGgHHYBcNUAeU5Um+0iM/9i1uqP+mou7UhOGgYU1sWI/w08z5RIgdXSDCFYqH5SOdCbAiJqLqoxtVs/2ikNL7SS6rjm6/fY+KEJWbLIyVeGjTnVniGxGzwUjN+xDQ57MlUR74FWrwl0O7y/rWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202910; c=relaxed/simple;
	bh=1u3PTnGB9fnLbmncEs1P1UruavFta8o8KfwIEe0gMXk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M91fFDMMcExvBtHAWP06/z5HSQgnHviz1/G6lDaI7B5Ymwnexy38SSKDtI3NbzliS9gWC3TCBPdx7WS0laCImnJsKZ4eUYGxyECAJex3U3WHiPq2m+7izAXlzjroLBTrw81QK2YqlHiAVBEe9+RwcCLdDhfytqOVInChMk3/jmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIwRBUx7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EUyIKBi5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIwRBUx7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EUyIKBi5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFOvK1925797
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 12:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Lpiu2cv3iPM95aQkoWLu5V
	WRirat64KmvdB8E44z/nU=; b=hIwRBUx7nkc7rLpwFJ+18Oug5obwVp+6dhge/p
	+9edJQ82Id6bMR69szpmADNeg67i95TxNQkLhxTUQwJf0RZY6InanaEtRkr3rpcM
	vsLQpIi8W359CvB+9j4tZaAefT/6KPieHa02gkyiE7GRDgy667pWBMN5gg7qxcwk
	uNgwbesCzoIo6/P8mxsjZk9OKVrUOzGvDoL+MQ5l6cZLKdPeoLGuFNm4iC16hz4U
	nq5Z4yPRLIp3ggMtoc5vr2qflVB5W0oQ295JJSiburcvodQQI9rsghxwi65PFxuo
	idAHVJMVD4Z4x71LCWeWqi0a0tgY3UUFB8OdZ9pf4y21Z4sA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgyt1hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 12:21:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a109c937so20920956d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 05:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791202906; x=1791807706; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Lpiu2cv3iPM95aQkoWLu5VWRirat64KmvdB8E44z/nU=;
        b=EUyIKBi5vZxAtXM1z1a/ooC/7X+UL4w8o/4hKBW7toQg6RMUajycw4Pbj8K6N3nrcZ
         OF+glCPB2tP1bHCPC7vc9VhwSkeLlY108Mjzs6hlNSBspJibiEV3cBGIn+gndlIs8N0E
         3pAv6q8WDOG6gMBwsfgbfg8we4tVhELQ3X5gNyI/MYKCnkIMaWnznYmgCIThHHKfXo2l
         0vrqpovq6tEg0Ut5vTsuRxoLUa+A7JSrCxtMWI15HPxl3bwzl4HZy37FeVC+qVe9AnYK
         jcaSKV+Q04d4aEJ/4oFWZjwd0nIEShgSU98+JtAXykrBEE3p8lWXRDSYFiC2+J0Rg8qK
         VhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202906; x=1791807706;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lpiu2cv3iPM95aQkoWLu5VWRirat64KmvdB8E44z/nU=;
        b=cpEixXuBd1hrSXmTN0J0/8Ms3gETsL5xn4HT8VKIv1YPSMt/HTE2bCexwCubaJDnrT
         8/5KhOy9hQNc2THSgQiCkEcJV8CNz3iFl+m62xMedU9Ro91gLZ5eq8co41aSbkKsG9kk
         /uAr0PyKVgnksdBftijtr8xqkibu0C1JUci8y4peqDz7Od/2DjPybPKiHihrTjftEKyp
         usBDtPJV8OKQrZhq1mH1kaKfmq6OElNQgMO4yeivTyeOBNzRT4i+fviJbUY9WOiLZl7Q
         IfFo3OjBJLRzj7C8shvTy+KAl8mPREtDYt3oAWTS84K1CFjeII1cXzitdpORL6vt9J1f
         vGDg==
X-Forwarded-Encrypted: i=1; AKwUvBwODgLJuHRho3KcHX+QGf0uEgCQsbJ9YBY2CF9hMaxN6L3V7mEu8kznxL8noeyo3ur20eAybPonJ5yXWmUZ@vger.kernel.org
X-Gm-Message-State: AFuF++lqynEeIOsjH0YawaqJMhzztKCkTAoPaFbazngJ5iRKWPh3j887
	RxviBe+YxzBKoG21R0r7MWUsNCExmy2LDiPx1JmT6NlqJa/NaA8tynYVuaVvWa5NQVAZpLQCYEW
	tRbVhqhTd2I7EF2r5hqH3mZQzi62/3rUhdjbuT5L9px3PuhnPfMZJozm+G+NqViNgmrJb
X-Gm-Gg: AYBFou38k1pFvrT8oiEEUhqcr38ibkF1O1OVfI8S4+QDnMssTo6+IOXSYdZ/X3PNB+a
	zMMwR17t+9zsbVILQSDgynewYHMTOY6BaikXcG4YE0PNUgfeCXwRV4trxcNq02Il9LThGWoC1Bb
	4UPejW3oDV6uNY22dhFWn6N4ZBFdMIIBJBd6o3lXlxWI4FVZkpoBldWusW4bgQsRkTztVibeC6i
	vW2TtstGKmYH1ygsEzQkuaFB5NwqVZzriDLI1H2uY5VqtzOpvxJd47NhBHdTzMhxAjB+Tmog5xj
	zGxo0RGPjWlrH9/1YP1VmZFeQ4JbtZMHqCq7FfPUSOIj58IGbM5o+UFR+LaLIbMesUmZxOKkAwN
	972ZDaJCdhM90FoYl5wH3n2tlpR6jV/Vu8HfO8vlNR2NCf/SuXe7wTGsKXReUTD4kuE8aSWrcve
	hCxq4ccGzobIWlh4Oh++BHzgS8SNrfQpuHScemMBIKlxlirzJ0c115sVRIZgmwI+fVDKL2qA==
X-Received: by 2002:a05:620a:6410:b0:93b:d7a2:dd2c with SMTP id af79cd13be357-93e5111963fmr1210839985a.60.1791202906243;
        Mon, 05 Oct 2026 05:21:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6410:b0:93b:d7a2:dd2c with SMTP id af79cd13be357-93e5111963fmr1210832585a.60.1791202905466;
        Mon, 05 Oct 2026 05:21:45 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm324157425e9.1.2026.10.05.05.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:21:44 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v7 0/8] arm64: dts: monaco-arduino-monza: Add support for
 LGA WiFi/BT module
Date: Mon, 05 Oct 2026 14:21:30 +0200
Message-Id: <20261005-monza-wireless-v7-0-5a6de7662dcb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEqWw2oC/3XQQW7DIBAF0KtErEuEBxjsrnqPqguMhwYpthNIn
 LSR716cLmzJ8Qbpf2keMA+WKAZK7H33YJGGkELf5WDedswdbPdNPDQ5MxCAQoPgbd/9Wn4LkY6
 UEid0ZLwopJcly0OnSD7cn+Dn13+OdL5m9zKXh5Auffx5XjoUU7vpDwUXvPJYKZCFQC0/+pT25
 6s9ur5t9/lgkzjArBgBKwWyYmqNBBYtNmpDkQulWL9FZkUhaKlLYz1uKWqp4EpR049qAYReq6o
 xG4peKC/2orOCFTk0Smol3YaCs1IJtVIwK03ptFBQS/LNC2Ucxz803Z4qJgIAAA==
X-Change-ID: 20260520-monza-wireless-e6ce7f013f38
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: un4BXi9kO3Wg1Xg8j_2dnvnfEgF7UB-k
X-Proofpoint-ORIG-GUID: un4BXi9kO3Wg1Xg8j_2dnvnfEgF7UB-k
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac3965b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ojWIPoK9sOC7OVCjIIkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX1Hb8v+NDC6IY
 FU++ONVGcBl0dVS+fjMxvXW3rthb3l1MmrguPhz8zd7FDACnoNMGiIl5cDQ6XL8wXlIMB9h0hIh
 NNIsmOMofUgyAB5PB+DZ8HdiR/rvd3cQOdXYOFjIs5HEdqB2FFfuCxLJqJHkGBqNUCGXtMFaRwK
 UgpeM7IBiVB6DzOqK4a3LYLTa0xjVXiGJM8VjfB2cgBdk5CJZ9lnHNmlvFbR3e3kMWO23zmKqeL
 8G5t7G2mVQZe31F/whufWTAb2xfgIfOns95UHAFqB7wxWYNDsZEBqO4CUP+dB+xhLLJ9pbQUPD3
 FcXK3G8nVrU1rzRY9BjQPUXEMEkz2mjRn1VmsUKzKRTJPsYduk1Hc9mEst2uCD1Wh4DEJpptpmY
 w1jEwbSnL4IZs685UwFexwNxDxyoA8+VnI5RcjKeE+kfQyur43BfEfIaPDphmjXhJwIVu7fSsHg
 DVkQiSKroRjEV0TAULw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX7bBsm2O2TAlx
 YD4TRDP53EzBj06Jc+213kR0XouhnuBzN5fetCy625lqcXUCOJShuAMvJoLZdxMu6GxtMwNQy2q
 5AOFMgtvoW9qWi0HgTVQUYjNNfo46fk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

This series describes support for the onboard WiFi/Bluetooth module
present on the Arduino VENTUNO Q (monaco) platform.

The board provides LGA pads for a wireless module. On the VENTUNO Q
these pads are populated with an NFA725B module featuring the
QCA2066 WiFi/BT combo chip. While implemented as an LGA footprint,
the design is functionally compatible with the M.2 Key E.

The NFA725B exposes WiFi over PCIe and Bluetooth over a UART.
Both interfaces are gated through the W_DISABLE1# and W_DISABLE2#
signals, as defined by the M.2 specification and handled here via
the pcie-m2 power sequencer.

This series models the hardware using the existing pwrseq framework
and connector bindings, allowing coordinated PCIe and UART bring-up.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v7:
- Rebased on linux-next (pwrseq changes dropped)
- Link to v6: https://lore.kernel.org/r/20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com

Changes in v6:
- Rebase onto v7.3-rc1: drop the now-upstream "power: sequencing: pcie-m2:
  Add QCA2066 (QCNFA765) BT serdev ID" patch and adapt to the
  pwrseq_power_on()/pwrseq_power_off() -> pwrseq_enable()/pwrseq_disable()
  rename that landed in this merge window.
- hci_qca: fully drop struct qca_power and move its fields directly into
  struct qca_serdev, removing the bt_power indirection (Dmitry).
- Pick up Reviewed-by/Acked-by tags from Mani, Bartosz and Dmitry on the
  pwrseq_is_controllable() API, the pcie-m2/qcom-wcn controllability
  reporting, the bt_en_available rework and the M.2 connector support
  patches.
- Drop the pwrseq-m2-bt prerequisite series link, it is now merged upstream
  and included in the v7.3-rc1 base.
- Link to v5: https://lore.kernel.org/r/20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com

Changes in v5:
- hci_qca: comment why the M.2 'uart' pwrseq lifetime is bound to the serdev
  consumer device instead of using devm_pwrseq_get() on the controller (Bartosz).
- hci_qca: note that dropping the always-on pwrseq handle is not a leak since
  the descriptor is still released by devres (Bartosz).
- Link to v4: https://lore.kernel.org/r/20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com

Changes in v4:
- pwrseq: rename pwrseq_power_is_controllable() to pwrseq_is_controllable() (Bartosz).
- pwrseq: move the is_controllable() callback from the unit to the target (Bartosz).
- pwrseq: add might_sleep() and guard pwrseq_is_controllable() against
  concurrent provider removal with rw_lock, matching pwrseq_power_on/off() (Bartosz).
- pwrseq: clarify the pwrseq_is_controllable() doc (Bartosz)
- hci_qca: lifetime follows the Bluetooth device rather than the UART controller (ChenYu).
- dt-bindings: also add the "qcom,pcie-m2-1620-lga-connector" compatible (Mani).
- arm64: dts: monaco-arduino-monza: rename the 'pcie_bridge_ep' endpoint to 'pcie_ep' (Mani).
- pwrseq: reword commmit message (Mani)
- Link to v3: https://lore.kernel.org/r/20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com

Changes in v3:
- Embed bt_power in struct qca_serdev instead of allocating it (Dmitry).
- Add generic pwrseq_is_controllable() API + per-target .is_controllable()
  callback; use it in hci_qca instead of peeking at the W_DISABLE2# property.
- Implement .is_controllable() in the pcie-m2 and qcom-wcn providers.
- Treat non-controllable BT power as always-on.
- Integrate the pending Bluetooth pwrseq patches from Mani.
- Link to v2: https://lore.kernel.org/r/20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com

Changes in v2:
- hci_qca: extract M.2 pwrseq into qca_serdev_get_m2_pwrseq() helper, called
  outside the SoC switch; drop duplicated of_graph logic and redundant
  bt_power NULL checks (Dmitry/Mani)
- dts/bindings: use qcom,pcie-m2-1418-lga-connector (fallback
  pcie-m2-e-connector) instead of the generic M.2 E-key compatible (Mani)
- Link to v1: https://lore.kernel.org/r/20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com

---
Loic Poulain (6):
      Bluetooth: hci_qca: Set 'bt_en_available' based on pwrseq power controllability
      Bluetooth: hci_qca: Embed bt_power in struct qca_serdev
      Bluetooth: hci_qca: Support QCA2066 on M.2 connector via pwrseq
      Bluetooth: hci_qca: Flatten struct qca_power into struct qca_serdev
      dt-bindings: connector: pcie-m2-e: Add vendor LGA connector compatible
      arm64: dts: qcom: monaco-arduino-monza: Add QCA2066 M.2 WiFi/BT support

Manivannan Sadhasivam (2):
      Bluetooth: hci_qca: Add M.2 Bluetooth device support using pwrseq
      Bluetooth: hci_qca: Rename 'power_ctrl_enabled' to 'bt_en_available'

 .../bindings/connector/pcie-m2-e-connector.yaml    |   8 +-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  |  64 ++++++++-
 drivers/bluetooth/hci_qca.c                        | 160 ++++++++++++---------
 3 files changed, 157 insertions(+), 75 deletions(-)
---
base-commit: f0406245cb9855e6318335a8a223551354291a46
change-id: 20260520-monza-wireless-e6ce7f013f38

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

