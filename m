Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915B642FCC7
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559217; cv=none; b=MYZmFrjp7sCZzecShEDR5cSRZ/gAv4IVDeFTZBIf2ONRIpsHrJ04L2uAPpb+R3d36Fhs7nsZprvqfiOXKgSV263mxkIXbcLy0TAa4Do21ULPFSlKk2DdT7BBStMPjkhHTtr59qPsY/kYixK9utTFu2yaRbpft2GkopgLoTjhEUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559217; c=relaxed/simple;
	bh=04Q/SOJvZnCzXWlou0jdoyoJZqK1s6d6BlG4fH/41xs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m6rBDI/6kFlWkXS5+w2SqxctD9dOmEXPKmK15/A47JqCgcAp3zYou+tc8jkhMfiPoE8rAzsgQWI4+JdR3I5BS5ks+OsFD57PUPaJ5FcqY3I4ECQi/OGO4FC7cGlJjVSu5LPXCtJPX+FQuDlrdSMT4LGea1LjHVAzpM+6n6EHK1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5kbTKMu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d7YPdbWw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5kbTKMu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d7YPdbWw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqan92837031
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MNYrb5YMKHtjz0ioAP78L9
	ceaWl5iEO51K5HmQmXrRc=; b=C5kbTKMuPDZzeGtnkKjGJAd+X3mTx4Wb74feLf
	kWs1fraIc4jtIxa7ZrsnWM7a8Bs58nNTRC8qZQ28grhOd7BsNxlEKSJBQAm2/U3O
	MwtVSU/iWp8obrC1McLRWRduNoCCy6xuPxPm2FxDRLNpv0ZZWD0j2SYPOBd07pyz
	k+4cR9HvPfRVI+Btxgp3nON6DUDitkhPIFHEaeoshghT+fBI+ilgmyNyWURNfZxi
	v9adgoPTGJ7npiqYotqUTcUokiv7E+Sr/YZ3h4/ucXxmAYUDPrtPrVSTb/9rVX1O
	qf8p8LcTwY6ykiJQi89X7pUA0UzOZnTU2ByHes1dr/baFa6g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxhsmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:53:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c19493ac2so202962351cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 07:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784559214; x=1785164014; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MNYrb5YMKHtjz0ioAP78L9ceaWl5iEO51K5HmQmXrRc=;
        b=d7YPdbWwZehk/fkgCutQ3xh4+D/DXJ/VuGt40VYLkOvkKjpn1BTtxceWXWjuwv6lV8
         NyNsGdmJi9wKgWoLBbVjjV/xOqSDHN76eCpmGPD5zKFzXrnK6gn0c1tp/jdWpik5RJZ0
         4ebpUhwL1su7kDKIjCdzm23boxW9Cmxj4HZtcazLisym99oxfeslE6CXidgClHancBxw
         WZTjwbabpsaNaNYuzYME91MypS2B+usy6PgnSTGjlJkwQsm2su2+YcdfOvAhmzgW+zY8
         QOahvxkQi70THIMns+7mY0po0oorynwjk4sRHHJoqJRJB2BhVbu+MIAw0RQXRAdf4i1q
         WIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784559214; x=1785164014;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MNYrb5YMKHtjz0ioAP78L9ceaWl5iEO51K5HmQmXrRc=;
        b=jkJ/XOxugDFX7qnnI94MHIRnOu05SgmImzx+a9PbdpHKOE8zdKZxATrVWB4gbxoY1x
         UNKCEsCA0fid6GkHJb/eQ4zhjNue4nZtIBUf9Vlv8vczhx/a6ShwOfmwnA0GoGXkeWTO
         M5rm6nf9vKEN1GAMifROxpob2Mf/YLvTQjIM6g9a1ibuTeEt9PrfIwKdsplZLtx5vkiX
         lMxIZYhG7KW0g4VJyy89wJNX5vMuyvSs0PzNj+ej/7e+pF2mh/KXjcvDhVHrxbb/wag5
         2DMOXx5zepYL0WYZSwBLKQPbAPd1X0v4DiikUHKfol16mRaP40HCACeBzBaudaZdzdny
         7wQQ==
X-Gm-Message-State: AOJu0YzjjVi/EbcKBn4HXjbs1ZakstdfZQSCu70BKzOco+w3LxHAnvpv
	0Sa+fNdaFMOlomeQdsggXLpgg0635TLDoXvDweUEAHPGHjWhFN7nXQDvQYPrRvH7+bQPKmwXhbP
	VI+KiDbgw1iwUbYzfRZ5j1sH3N0gTMLogOpGEKTWf1hfAd8c0phuFaWndbbpmJvVpODGO
X-Gm-Gg: AfdE7clDowYS5W3j3rEHpfcWoh/fJLJDSFn812pow8zmnLo9D6grHvc5CzLdJ/j7d3D
	dWX4gJGASrWsxe9bsER9uhafVvvY79rvxCUhKV/bWAwASUaNfhBumJRQEpZxqlmU0qLvMjl6otb
	dicDJNIzU6PydLjfeoP36jDbBkonRqx7N+XXg+BdeBnyhW6cp0sF5JQK6uvmqu3KcWUZ6GaxWpZ
	0R26yj9IiVJ2gwBv2XrCNMJnkVvsAy1K3pc751D7afhVpYXdWFi2GLJXGWgN8QDiuvbxd98cplg
	A41re4CHLqxnhMzqLX8HPQ4LqaAAM0NsCFpg+axhq9O4p0P26fuVlTtbImWp5nJd0hQMjyQ5JAA
	cFelfMcvL4DT5bxeYQbdRUFdgVqORVfin1Re2VGy+keRlXiORHo4/2eQtQikPR2AImxraymIB9f
	s9+sJBepiEm5Ob0xLyZTiNDYpaoY4diZZEx5Qm71eDqQuSd1YSOIE=
X-Received: by 2002:a05:622a:4c05:b0:51c:2135:b00a with SMTP id d75a77b69052e-5213e28e287mr133065191cf.40.1784559213635;
        Mon, 20 Jul 2026 07:53:33 -0700 (PDT)
X-Received: by 2002:a05:622a:4c05:b0:51c:2135:b00a with SMTP id d75a77b69052e-5213e28e287mr133064811cf.40.1784559213170;
        Mon, 20 Jul 2026 07:53:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e7000c3e2sm4800215a12.30.2026.07.20.07.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:53:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 0/4] phy: qcom: Fix possible NULL-deref and runtime PM
 race conditions
Date: Mon, 20 Jul 2026 16:53:29 +0200
Message-Id: <20260720-qcom-usb-phy-fix-null-v4-0-4d2a0f06d53a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGk2XmoC/0WNQQ7CIBREr9L8tZ8A0qJdeQ/jAluwJBRaEKNpe
 nd/3LiZ5GXyZjYoNntboG82yPbli0+RQB0aGCYTHxb9SAySy45ryXEd0oy13HGZPuj8G2MNAZ3
 jZ+3abhRWAblLttT9dq83YpfJek7Zmv+a5K2gVJxpdTpqgQJD8gNbUg3Gx0sqha3VBDqcGQXs+
 xdS5xMSrwAAAA==
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
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5e366e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=JfrnYn6hAAAA:8
 a=9gNpWytEGD6O0ATn_e0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2NSBTYWx0ZWRfX78VvKiWNRSeU
 fvv32nX4iZmif5wowupM+Lw4d9apAPx8f7hzQXSY3TjXj6EcD3zYSSOt2gwg02bjdvFNxHs8llF
 kSkHBdS6Tud/YFYm2ZIpRbt1sYfOXA8=
X-Proofpoint-GUID: P5XBdum04UJ-xWhGYJxcLTJ9-v_bSbu3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2NSBTYWx0ZWRfXwuQ0LacpLayQ
 r6wJQYtvgPv32Kn7TTZOcaWiJPxuwAAX8NPCglCcB++tD+nD45guuUzgPH6PpyTX4uYM+GgQhXO
 wkKA1e5buiNauCckoEFIkeN7YrkduNnuXXeHdO+GyMJHSNrJ4ebghOB7kU3RpVrp3jlDpBNjlWf
 BUPhfoX5++K87cH4xSzZyMvePt1IyGUJ0CWWE/bKCEaLc36bua49QDg5fipxDWsSVaK0SVGWoXG
 leWzeO6homwawchntq+kWBs3FSRBwtCmDXFMTkz620QMWaGvywKdS99FzdCrU5WHYOm+Uv5aMXy
 zKDGm++rph7wpwIxK/RGxNfJ9iQiPXKn/IIdDmm3sQhZzD0ATOiPgSL8OA1oek8OuFGnoNt0Q1E
 Y68mSyn1d+B9XaPo+mrh8fSMRL0blgaqwNwNWKzHcavebFId98ngYlOyO+NOrx+GXaDj+R6i7+8
 JMXXAlIxxeGK7qMbekQ==
X-Proofpoint-ORIG-GUID: P5XBdum04UJ-xWhGYJxcLTJ9-v_bSbu3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200165

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
Loic Poulain (4):
      phy: qcom: qmp-combo: Prevent unnecessary PM runtime suspend at boot
      phy: qcom: qmp-usbc: Prevent unnecessary PM runtime suspend at boot
      phy: qcom: qmp-usb-legacy: Fix possible NULL-deref on early runtime suspend
      phy: qcom: snps-femto-v2: Fix possible NULL-deref on early runtime suspend

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c      | 19 ++++++++++++++-----
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 16 +++++++++++++---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c       | 18 ++++++++++++++----
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c  | 17 ++++++++++++++---
 4 files changed, 55 insertions(+), 15 deletions(-)
---
base-commit: 910b828b22b7b91054b3bd4be676a017444b0e00
change-id: 20260720-qcom-usb-phy-fix-null-ff097f56d1e4

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

