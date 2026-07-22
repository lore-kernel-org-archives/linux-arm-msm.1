Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B1425A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727922; cv=none; b=VPWGn+bf1QwMZjpSFoF4OQLV1tbXH10aCG0Wt/NOuUe7m72rq/Co+sOghcteAVuep2d73iETiw4k+t3bo53qOsm78Mmr6ieuJGhrqZIbmpMHMaVLlmMaT4BTu3UFqAT2O+i3JVsmXMCCQitoNzyk67Kt2g3TdILQZiapTB/NAbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727922; c=relaxed/simple;
	bh=zJIKNlxVbXHe0t+aQ2XnfQrcPSlisOsTXZwFurkQKSc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L3IdPQawE3Zk58FGIMKIlti0w9H+22j2WRkmsLtBsBUAumugrEWoeZyzzfndj5pIHPiQDXvufYbFBLGs2626HRn0Q0ZX0iCC+C8V4wDQyKQmjECKeaFCrPPLmE3a27l3AbG0W8ADg0s20EM6fpPJjw6/KE5CRiZ8usQUt/+7lIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JA88l3BX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAvf6fhI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JA88l3BX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAvf6fhI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWRuQ765286
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vJcKEmjH+SaATY1H200JHP
	BYsDX1MZgPjB74rtKM1G4=; b=JA88l3BXe+04QCEXlsWCIWMLjDw/6iwqUGG0MJ
	Ms/GJ3+bsuEtBQuX544j4fre8YTc7DKbBNAFaAAtYBnqPmgg04cFXnAYuA5wpFN2
	pVp97PhwGzoe1Kj64I5Ql2mTTaBVNKoG7nWPzdC1OOgIvDnUo0b7EnyS8SIFXFvA
	YLjJfIuYbuQBU0eZOoaCobVxdauq1ukwLu0a91QBId2Dbf5K85/yJhGfRw9nvBuD
	ErhdzVKKVJTYRmtjaNyqPo5j9Uok4d/vhrEmscnLdFF1irVIpywjoMCKWdeLvAcS
	UY3v/6esC7LjnJXkXXS8W8frpuJ0ktOJh0L8FBnvijwFFJ+Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjtn2s656-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c26012cd0so219396341cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727919; x=1785332719; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vJcKEmjH+SaATY1H200JHPBYsDX1MZgPjB74rtKM1G4=;
        b=IAvf6fhIJTD2wk3X1jfW1i67YgVulZCQFcAxYQdeqfY+FnwPe2Q6282KSJWNS6U3Lm
         B/9rlb8POe5mPU2G13Io7VWQ8GgRLyXmSzs97gUtbA99VGJutrTBDK4CJzsCm/BXQn3N
         OkGXLB7opRXDFbhIaS9sU82R0AeIYGlfggVnKnCI4beDcSzcq1Z+Bu4dnVzpLPDH2Jsm
         ut5O5Yxff+kMRI25WXO17Clt8fjHIrmh+Od+CyVcp2DrpmiklzvDEAeeUghtA42BsDwU
         qIMf8hK6eId1lo8p8NXNduG8wUltp6EnLVZpMW466FlZ9LG1lN86Zl6rSKxcZb913Zyd
         +5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727919; x=1785332719;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vJcKEmjH+SaATY1H200JHPBYsDX1MZgPjB74rtKM1G4=;
        b=SQFp3+Z2wugvRQk+qe45vdsH4rVFfdpxNy+KhXcH4xk3gMhkECM8sYXz06RuX9o1SS
         3fi+J6yoKySwscueF3k3EBXRglxR1LpGKG4DJtb4x+sUyWvuv8JAVQa95npu9j86emjH
         kBFaBvwPLt3J0ZZRMfOSKjjoDAUwYuW/vij7esFprlnBVmY394tP2Eg3A3MTqKYP5bAY
         o/KMpQEy/fMx2wxp14t6lZwkD2lx1W1+Sf/gIEcDE20hdBqh5nOBN2Ml1coKXrbyNmzx
         0DmF7rz0CP0eR6186fRaEivqPMFkiaiXJpmptTgKUt3JfpLcHO/Vss6P8qC6lzes6+9G
         2Sfw==
X-Gm-Message-State: AOJu0YxNL4nIAgW8b2e7HxWFoQy8ER+p0fTHAEMu37AEoO6u3Uo3p7jx
	YlnqnK7O7RkbIkakWgZOoQ3TMny9cQ6fFvrZI0VVFVYBNYfZAHrY9z2HXAJuAPBdM+8n0rF0Z3k
	d1sy+uGGhmbttsCEDhoov0dh2YqT0ev9oGC2WGJ82hPoy6SulEvz0nRa6HpOdIQbzByfz
X-Gm-Gg: AR+sD11cQobSqyVoXQGPn6YDyZ3MS8CU8I4dk16lGUW3x1Ehjgsf15Q9REwge92oOQp
	RmEASB/UC53A5CIz1IIp0Laj/w9RAI27YH9v2nxm8vvNmtOEW56hWRv4tHoN1qUuaW6cHf+RbC3
	ep7zF88sbqGH0RH0cYdC9IAamTSQqP1wWr9UXT+Bg+Y+5YUBkDK+srKh28crZOrak7lVvUYBkot
	c6hN9B1JVgGRk1YeOX7DPtO+gFG5leKmukfEJKubAj8bXTM2hheIExZG9WMpYBcNFJvenRTNb4G
	hwc8L2y+YgP4QcS/Dzvo9sPvg/I87XohEGIDBGjg0DAC4LzrQ6ZPzT5qpI4IBNE1Ueq9PxmLD5H
	mG7+Gm6dupBqJA8YRESl+2S7jraQh7vF00Xpw+xMRxDYoPY5a5K55+EcD0TKULwp05MMxjj/CVb
	KRK7PCh4hOSnkMFrru/ORk6FITU8CEdotDo73HoQ7Dpilfe+k70A==
X-Received: by 2002:ac8:5705:0:b0:51c:7b12:5fff with SMTP id d75a77b69052e-5213e7795aemr207544631cf.75.1784727918400;
        Wed, 22 Jul 2026 06:45:18 -0700 (PDT)
X-Received: by 2002:ac8:5705:0:b0:51c:7b12:5fff with SMTP id d75a77b69052e-5213e7795aemr207543581cf.75.1784727917554;
        Wed, 22 Jul 2026 06:45:17 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac8c3esm111874366b.23.2026.07.22.06.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:45:16 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v6 0/7] phy: qcom: Fix possible NULL-deref and runtime PM
 race conditions
Date: Wed, 22 Jul 2026 15:45:13 +0200
Message-Id: <20260722-qcom-usb-phy-fix-null-v6-0-534f7e61b9a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGnJYGoC/4XOwQrCMAwG4FeRns1Ia7upJ99DPNS1dYW6bq0bi
 uzdzbwoqHgJ/IR8+e8s2+RtZtvFnSU7+uxjS6FcLljd6PZkwRvKTKAosRIIfR3PMOQjdM0NnL9
 CO4QAzuGmcqo03EpGt12ytHu6+wNll+jq0iSrX5pAxWlKLCq5XlUcOITo66KLQ9C+3cWci37Qg
 R6eCxqz2/h8ien2rDvKWf/XbJSAII3Q6LA0aqU/3bngqN4x/gtThGm+5lZoczTCfMGmaXoAx0F
 QV1YBAAA=
X-Change-ID: 20260720-qcom-usb-phy-fix-null-ff097f56d1e4
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfXwjmPJdITRlS2
 aVywRd16uMyLz84mxPUHbfwULvxzMsGklrr0BcU220Qh+101lBQ0kQ14pYsoqrb6+JrZQutKfFQ
 0HYTBtFKaOqFcK3DQl1JqR7IKR+lQBX1MSl9Y67oGOUYWOzdCShB9qpr4AH+0srVQmd32y51apg
 vDUduKIoHuGN9dvx4X2J+27MyfDU+kxKQRqS821lgBkhMvYt0urIuzmpZdGU12GzVpn9Q0/LfJM
 iKocr2eqfnr9MOiKTooFAiOm5LUlo0RFGOpa5sn+TKuNJiRiE6kohFrYpYWn/vpVS50gKqek0Wl
 oY5DEPs9vaxhCay5oU8GKxLLiHW24RcCH0rBWZQpxKrK+XNe5kEsjn0UA4hOE27KxVSWH9LbD2+
 agTonoO2JnFs8LgAJjHdEmzhnbPlpvA72vOt++2oq91XgYYXPP03/td0816jhB25Rw1PsmALpjj
 tpJSPyVeGmYY3tU/3rQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX+VCGWKMUrgaM
 8d6wLd+RU8+UuzRgmWfy57UmJzS2vD0FVoOzFi/+EzuFkx8ugxCP4zUrfLZyIa8UpJ4TjFAyaTb
 EbfIh9efDgMDZAALVoLHXQJy3ItbH4g=
X-Proofpoint-GUID: Rjt3oxtRp0x_cf2zcaeJPwQIr4wgk-S1
X-Proofpoint-ORIG-GUID: Rjt3oxtRp0x_cf2zcaeJPwQIr4wgk-S1
X-Authority-Analysis: v=2.4 cv=T+28ifKQ c=1 sm=1 tr=0 ts=6a60c96f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=JfrnYn6hAAAA:8
 a=JEbQ7g8ZO4jZ3kYS0isA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220134

Address potential NULL pointer dereferences and race conditions related
to runtime PM in several Qualcomm PHY drivers. In all cases, enabling
runtime PM before the PHY instance is fully initialized can lead to
crashes during early runtime suspend callbacks.

- Attach driver data before enabling runtime PM.
- Introduce initialization flags where needed to avoid dereferencing
uninitialized pointers.
- Reorder pm_runtime_enable() and pm_runtime_forbid() calls to prevent
unnecessary suspend/resume cycles during driver probe.
- Use devres-managed PM runtime helpers for proper cleanup.

Why it happens?

The PHY is a supplier of the USB device. A USB device cannot be probed
until all its suppliers are ready. As long as the PHY is not ready, the
device core keeps retrying the probe, which fails with -EPROBE_DEFER.

At some point the PHY probe finally runs, but the device core may still be
attempting to probe the USB device concurrently.
 
Inside __driver_probe_device(), we have:

    ret = really_probe(dev, drv);
    pm_request_idle(dev);

    if (dev->parent)
        pm_runtime_put(dev->parent);

    pm_runtime_put_suppliers(dev);
    return ret;

This means that whenever a USB probe attempt completes, whether with an
error or not, its suppliers are released via pm_runtime_put_suppliers().
Releasing suppliers may in turn trigger a runtime suspend.
 
In our case, since the PHY is a supplier of the USB device, the USB core
keeps 'looping' in __driver_probe_device() returning -EPROBE_DEFER until
the PHY becomes ready. As a result, pm_runtime_put_suppliers() may run
concurrently with the PHY's probe function. If this happens after
runtime PM has been enabled for the PHY, but before the driver has
forbidden suspend or taken a PM reference, the PHY may end up being
runtime-suspended 'unexpectedly'

---
Changes in v6:
 - Move pm_runtime_put() after devm_of_phy_provider_register() and use
   pm_runtime_put_noidle() on the registration error path, to avoid an
   async idle/suspend racing with devm's pm_runtime_disable() on failure
   (Dmitry/sashiko). Applies to all phys.
- Add similar patches for qmp-usb (sashiko)
- Link to v5: https://lore.kernel.org/r/20260721-qcom-usb-phy-fix-null-v5-0-a181e2adbd2d@oss.qualcomm.com

Changes in v5:
- Re-introduce phy: qcom: qmp-usb-legacy: Fix possible NULL-deref (sashiko)
- Link to v4: https://lore.kernel.org/r/20260720-qcom-usb-phy-fix-null-v4-0-4d2a0f06d53a@oss.qualcomm.com

Changes in V4:
- Instead of moving pm/forbid, increment the pm usage counter before
  enabling runtime pm and decrement it after the PHY has been created. (Johan)
- Drop now unnecessary dev_set_drvdata() move in snps-femto-v2
- Drop 4/5 (qmp-usb-legacy: Prevent unnecessary PM runtime suspend at boot)
  which is not required anymore. 
- Rebase
- Link to v3: https://lore.kernel.org/all/20260205160240.748371-1-loic.poulain@oss.qualcomm.com/

Changes in v3:
Rebase on next and remove 2/6 (obsolete)

Changes in v2:
Split patches 2/4 and 3/4 so that the null‑pointer dereference fix and
the runtime‑PM enable/forbid reordering are logically separated.

Loic Poulain (4):
  phy: qcom: qmp-combo: Prevent unnecessary PM runtime suspend at boot
  phy: qcom: qmp-usbc: Prevent unnecessary PM runtime suspend at boot
  phy: qcom: qmp-usb-legacy: Fix possible NULL-deref on early runtime
    suspend
  phy: qcom: snps-femto-v2: Fix possible NULL-deref on early runtime
    suspend

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 10 ++++-----
 .../phy/qualcomm/phy-qcom-qmp-usb-legacy.c    | 21 ++++++++++++-------
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c      | 10 ++++-----
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 15 ++++++-------
 4 files changed, 32 insertions(+), 24 deletions(-)

--
2.34.1

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Loic Poulain (7):
      phy: qcom: qmp-combo: Prevent unnecessary PM runtime suspend at boot
      phy: qcom: qmp-usbc: Prevent unnecessary PM runtime suspend at boot
      phy: qcom: qmp-usb-legacy: Fix possible NULL-deref on early runtime suspend
      phy: qcom: qmp-usb-legacy: Prevent unnecessary PM runtime suspend at boot
      phy: qcom: snps-femto-v2: Fix possible NULL-deref on early runtime suspend
      phy: qcom: qmp-usb: Fix possible NULL-deref on early runtime suspend
      phy: qcom: qmp-usb: Prevent unnecessary PM runtime suspend at boot

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c      | 26 ++++++++++++++-----
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 36 +++++++++++++++++++++-----
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c        | 36 +++++++++++++++++++++-----
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c       | 26 ++++++++++++++-----
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c  | 26 ++++++++++++++-----
 5 files changed, 118 insertions(+), 32 deletions(-)
---
base-commit: d10df0b23caf4399aeb47b57b3029a04b2853d25
change-id: 20260720-qcom-usb-phy-fix-null-ff097f56d1e4

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

