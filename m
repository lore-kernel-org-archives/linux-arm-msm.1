Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D4033F8BE
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784639154; cv=none; b=pRzuZwViXSOvDn1f5t8dxOOLmCdQHS6WBJ54GFBsYfuowQXSuq/ORnreJAw6kw5S3IB+qfIw/yzPTYt/DocDq9AUtgZUPmkBsFgwZG9jgYJUhisUySz+aHHbatqs3p+H5Bgr3HkKLD4nV7PgOSPq32ikxGrIatcHgOWA0zD/LY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784639154; c=relaxed/simple;
	bh=n5doDwhLaejisu+itSIDlWO3yMZElEHyBgMi3Ap0Aho=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GgXzNXfpV/qjklv6O/u8aV5vNBFHfOa83ub1b3/q3z2AHbeFOYGD2u0xDd5lP21pMJGf7LrPrNoaZ+wIgr7LVC6HKaez8qJstJIGu7cHd4MlZnTrL9lm8I9cpxSrRgIUrDw6m0b9jq4LlhheckDbjPhoYfwOEuZl9vrLzqFGDD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHGpSNvG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iv1bw+as; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHGpSNvG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iv1bw+as"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LAR2rM2502820
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+wR0wRMni/+0ARfdzMaqeG
	qZmKzox5EW4BI4JkyGp08=; b=cHGpSNvGvkgGCX9PKa1XkTgx4NeOeK0t9e9NPQ
	9moMyGtv5iea+jwQu4CIvKXcAoOqTU3MHJdVmlWTZrBAa9Amw6xYGLcufqyV5lRz
	fnuED3TSnSi3/TT52SqFiqoKRxJXAf7uJ3fMu/7rb0aB7NB7R19IxOaVPNrIB0sw
	Uhk7Z6fAmCw+ac6+XTffVqiXUu+V1IWTgETTCnPDAisZ4PniaoiqpRaAp6FAdA05
	GVovARlhgKgKbFdr4iqUXVqhJeunuUdhPzN+eV8ZYs2xEc77/jM3e57/+X2F+YMr
	Jlz7FqdcGXPYJCkA6F2QshfibqtegdAntypifepDyJIsCBtw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsrvar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:05:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737f1f1e1bbso3442730137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784639150; x=1785243950; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+wR0wRMni/+0ARfdzMaqeGqZmKzox5EW4BI4JkyGp08=;
        b=iv1bw+asXUgWSeIcrpHij63oj9Z4i+IxQSSn2vTprS4zvrBSVFE5bDWZ53tUVkaUl5
         ARaPee9itmOsYwK4HxohnP5ECGTNT7f/2Zv7yE3Il0IN3UBVFJ8miqO4+TITOAeeiPgr
         IZ6eLrAlMJA8bp9wWgeaxrTtRRlz5tYLtfZkkrviHJ81WOc6NgzTQUA/EeGfjQqHQOzE
         lZ+LKQHMKwK7g9yvzmpK6RP41nVxWyE1+Hd/f7uTQFBl8c9SZ2dGDyg2YfIA+FZUpo4t
         Lsdpbcq4eo17BYsckRG8u+DEs8KIN4pw5WabHhZhTrxN3xrP2bhRyDqQn7e7t6Ycl/5H
         3UZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784639150; x=1785243950;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+wR0wRMni/+0ARfdzMaqeGqZmKzox5EW4BI4JkyGp08=;
        b=khwK2lltbzn+Z9KQyr7dzu9DsLKF++oq/GsD+AHw/U/bAz2MFpnnlpryi2fZt1Hg/s
         gO0kqHm6RScX101Pf+LhOgJpTK9ZMtgsm33xDzMICcryxQsq7CTNDsoUoiLJYcBPxzGn
         sgXdhkOYriGe47Z4MqzvjEIdRqdcp7Ur+y1LeVIRz+UKpRPcrZycVzX2KE6y8LKTiQi9
         /LE4ANsridCcODFUNjWdLpiiqPG7p8o9noWR0mN5IdwCyU1cmWNcUuTy5vSxO8kc62HW
         S1LmYt2HqpbbK7xeCFqbV6hln7N6fTxXrBTsJT0d0ZKIPtTkdZdiaelDlEBU7TkjdvuW
         9zPg==
X-Gm-Message-State: AOJu0YwTTPob6LfM0mzbtqQ6ggQlkhYjjL2zdDGiWwaPokY7LZiGuNak
	jAKbEYIsrU5MKp7NrvK5AmLBhey12UKNpOcgrR2gE/dQnc7j/omPVVTBKcJuLvmmpfQvRUNYwyt
	PSITVCTZ+FeDgLL49/6pqO9aAmQFA9yZjEak2l/CwqVd5WvCNP4mxd0pDgpY2ZWAJEm2q
X-Gm-Gg: AR+sD10hQBB1H14aoCQSySIaqTI45+QGwTSkLb1M7K8uOJy5fQeVDaETeUFKwLdjP5H
	4RCwLUifVHypqFou+LB8dLnml6SIs3sT94JiE2egpVem5qx78KIrRIV6dSexT9Avj2WPZTr9mdf
	5k1YKTuNd3bsn8U59o6fajUHj9bKp2HQ9k20LLl3jP15OueNkoD8N58J9bWQgTgk/PzTh2gXmon
	GHZAkkubshHQ4CFdpKt18Hruq0h/F9IC9J1+IsFRJiIiaEHkbsrnx2gagk6PI7ATuZdWBw+DHaS
	Xp2MAxNC0cJLyqHPxRGnORz1sIx/dPUlu+eLm6Bn0MhZokyL0L9Wf/dgZUSrSulpOJWUM3+CT5S
	HUvSAX9Uya/AsVgXk31cW17sCLvhTaowmBVCEipJZ57/KEOryxu+La8yJ4QKcGxAjXhc3FdKmpL
	xiOCZpEBlwvG3IjdJSSDA+1nO+vPAzz0SMbp82qa8WJSiRwIgac0w=
X-Received: by 2002:a05:6102:918:b0:726:cd42:d023 with SMTP id ada2fe7eead31-747534ce270mr4963617137.11.1784639149949;
        Tue, 21 Jul 2026 06:05:49 -0700 (PDT)
X-Received: by 2002:a05:6102:918:b0:726:cd42:d023 with SMTP id ada2fe7eead31-747534ce270mr4963555137.11.1784639149039;
        Tue, 21 Jul 2026 06:05:49 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009ae04bsm591898066b.8.2026.07.21.06.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:05:48 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v5 0/5] phy: qcom: Fix possible NULL-deref and runtime PM
 race conditions
Date: Tue, 21 Jul 2026 15:05:44 +0200
Message-Id: <20260721-qcom-usb-phy-fix-null-v5-0-a181e2adbd2d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKhuX2oC/4WOQQ6CMBBFr0K6dpqhFFBX3sOwqNBKk0qhBSIh3
 N2BjQsXbn7yMvlv/sqiDlZHdk1WFvRso/UdQX5KWN2q7qnBNsRMoCiwFAhD7V8wxQf07QLGvqG
 bnANj8FKavGhSLRl1+6DpdnjvFbEJ1BrboNXXJjBPKSXyUp6zMoUUnLc17/3klO1uPkY+TMrRw
 xen2L2tjaMPyzF3lrv937JZAoJshEKDRZNn6tdbbdv2ASmgSWgJAQAA
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
X-Proofpoint-GUID: ELmUackmBgg8VeDRyx5QH-3rnIPvLo3d
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzOCBTYWx0ZWRfXwbR9jN7qjsr3
 c2+5FyZlqZi8UxlSGS6mH3m6O4SIAK8felHB9pWNcbNVpabIccE4UlI5WzlNHywY1/3uWvrhy3o
 UBEqa2hukyQCGPYYZ/LCfb/PUzdaJBA=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5f6eaf cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=JfrnYn6hAAAA:8
 a=9gNpWytEGD6O0ATn_e0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: ELmUackmBgg8VeDRyx5QH-3rnIPvLo3d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzOCBTYWx0ZWRfX/n7h0XbCOtjb
 +1i/JIeXm6gdXyyiey2DSB3VNNdyH53OieHDN+JUtAffNv9UMPMQsEgLNKzN0ELEppabRZRbU0b
 lvEWKYkJAfp7YlXDawaEkTAIzkwBQepxPrcanbuKcAsXz6B3L3UT2zN5p35xLokPsDtC8/llQSC
 BRszv5ydcie8snpHcniTU6PaanN89fcmUiovbNbp+3kXZusbMB85AV39HuBv3vW6kFAi4KwhA6r
 QGYsTX/BapeRIjOgzPTUa2Z6/8A9bP3qwIt8laZ5lC7vQWfjcXvG8UO+/D0ixiVFRB7X9C5O8To
 Z0If7KPnfaFhxZA2ZFJa9sYB0p8QsCcapKmPEBSHTY7ChRaWk7+bFHeXVmQWYQNmzHJGJOUmx/J
 PDXpNzoSSKmLDj1nLYRodQbjX9o+nH8VsfZUIS+loolhNB7Un3inkA7z2B+QKU/RZYRN1y5nGNf
 3EOVPU+GR47Fic06Jdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210138

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
Loic Poulain (5):
      phy: qcom: qmp-combo: Prevent unnecessary PM runtime suspend at boot
      phy: qcom: qmp-usbc: Prevent unnecessary PM runtime suspend at boot
      phy: qcom: qmp-usb-legacy: Fix possible NULL-deref on early runtime suspend
      phy: qcom: qmp-usb-legacy: Prevent unnecessary PM runtime suspend at boot
      phy: qcom: snps-femto-v2: Fix possible NULL-deref on early runtime suspend

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c      | 19 ++++++++++++-----
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 28 +++++++++++++++++++++-----
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c       | 18 +++++++++++++----
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c  | 17 +++++++++++++---
 4 files changed, 65 insertions(+), 17 deletions(-)
---
base-commit: 910b828b22b7b91054b3bd4be676a017444b0e00
change-id: 20260720-qcom-usb-phy-fix-null-ff097f56d1e4

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

