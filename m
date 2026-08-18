Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC89456DF5
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049970; cv=none; b=MhFPQ2iZPQefAVenY7ZLAVvJlB1IcE+o4S6+EhcL1IC85law/tCBEnranuYGx6RGUYICSYMUNAOj82qsDlFDDFR3GpVSspFRAxNkiqt7/KlJTcv/TXQH79vHMzvdYOSAmIaQUhWK37rWK5gCc4bSWzw0qN47fkCIUu7se5D0mx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049970; c=relaxed/simple;
	bh=cRka7uWUQtm690+nP7OzQF6jsY7N1idGSh8O4Aux44k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t6p4hd2R8HQoDEj/iJJg7WMzbnm5hjnGoSjoBFGgWMc6i95cktzt4MCSjiGbk5BPjU0UwUuwwzq77j32E9gOBWwwkIvpSEytCrH1umfRRnRmTYZN++L2nusZ+o+K1n38s10MKhftIyE2Beig8JeziyPVKonQJSj3NFFzHMCzwNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RMDf1u3C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJQWd7Hs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RMDf1u3C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJQWd7Hs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABfDu820120
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iokhRzBtGEo3lzhrDM/RTa
	GYh3artAUtV6Va3Ik+yv0=; b=RMDf1u3Crn0c+y2yiDetstnfC2cOCOhHCYScuQ
	HEvDam1RalWcDOHtO73ZMzfeQFpdggSNmgx1cgrHWO93Ril6mZCeWa35F8cCUbpE
	fl1Zs/02VYePAYqzDIAV0rNDaOAn4C0kf0MU6CUntcXauZklFNzjTDkxWKjhz1Mk
	rZ73VZZ9qr8bFsPB6wlY4BN69mMaJRHxJ3a9433E6bqQeWhL3mC7AWSlmyI+EIoo
	l2gAhCKVJscBE3SbcSshq27oYEiDUope3CNuBWv6nZSRzdsSGBSsX+M0ZQVgXUva
	rjqNf5binmzkOqHS4el2nnrZpu5Tfinn0MLMKltP0kEUpDMA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p1jvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:46:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa55c9430so46327065ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787049967; x=1787654767; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iokhRzBtGEo3lzhrDM/RTaGYh3artAUtV6Va3Ik+yv0=;
        b=DJQWd7HswNlg903IqeVufmyaqxiq86kRswJ7rHZkpC/eH7Ni2P0uY1sJ+PPGuC3Lb7
         Z4UwqIQ3JDSeHH9W3AjKQgV+N1sBm+8MG4DjKPAsfDhz+K6wxofMp9/6fOWOp2HQL2FT
         QAf0gIdHTaTxoAOTfmvITXX7u2FUFS9FrCbG/BPmgYky5Iov4jRU+4lxSNEyhSrwF054
         yMg0CysvnuDchImJzXVH3Vl5vDKUT/IPK66PGXriRM1FE6c0hX9bQpeyI9GPvECCcrIs
         whBKjabA8Ekarw/uc496MRnrP641WsAmF6VD7ANx8BpemIg9NxITuPtJk1iJlWJMco64
         UmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049967; x=1787654767;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iokhRzBtGEo3lzhrDM/RTaGYh3artAUtV6Va3Ik+yv0=;
        b=PZsqR5yQUqOBIf1AI0Rzlhlg5Qlhgduicpfa9rmefa3mt/sHZvouRs6HIKfH+r/rTN
         +eBgX5/na/hMRQ7vK2fSVwQv9hcYbJuTYg3UzSDTuc5m44PvuRi4+0lP5bAMaqb4nrzj
         XTlbiAx2K+x0LFatmvtNsQbzNwC2tyYCAD9XDdRI8BuMOqlPdAIlRQPX6s2d+VTKOJsM
         6mYuw6hN9BWdWphVkdPyN4cT1FcSUXXvsZvErdZruzC2k+XtnwEbdv911wKIWuAsfIC2
         M/hMWqthaunymwLPWFTuA5GhLAcgqF6F1W61k3ijOq0+z5ESXqjVJ541AMHSX2hzQTYK
         yCHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNDlI/ZYPxn0OrQryp206oXnT5S1ABhn8ECHr1NJnq+LgCCcxTvRFTC/o5A0PO86yZhd3SsFr74yzhSw07@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbvego+D3cASEDjbVMgS2IJfNeF3mt1SqSYI9JeaJxn8SSWPMD
	dJJvwXRcotVCP2goljpcKMq9F1mIdr/HdAihvXosJw1qSMrJJvHNpnbYCLzFYooxq0LiuCGbl13
	rZ+HFKWNk7YEKa3Terx3g2RpUakwY0BsFxcJFbvrh/n3MUGxF3Y8LNYO0Pd0oZk30eCAF
X-Gm-Gg: AR+sD12Ba3Srw1Tii7xl61kq+CH6cGfBQrM42SBA/d38Qg2QIJU7ELYbaoC90Y5MdxX
	TP5SPFMpbrcxHTBkwSN0f5Rv4nZiB9vlogc4FbzyVgU/srSM5vMuMeP0lm6SCLl9m2YUSJKW2L+
	W//ig5/wvtqYpvuDmefB2pKVsoDWuuOCtOCgLB26j1Q3kJUkiuRJ4eOvvhIeQVQMFqgB/l27mWU
	lo/L4s7xM+5loVunYDeUbtMHpff7phiv+DeHGel2llw8lz0m4DJ/pi+Q+7rTbRd0Pb2/FOI8KCP
	dq3acusNl4Ep3WPLjrPiOguC81owZY3p6krFUUJSrZII6QUDfnj7Wsp+dev/RyfMz6nl3VQQK6v
	pes3wda65I0P7wJHej3xOaK/TXVJC/QhTFA==
X-Received: by 2002:a17:902:f60e:b0:2d3:160b:c01f with SMTP id d9443c01a7336-2d3b0b1d457mr377402735ad.6.1787049967045;
        Tue, 18 Aug 2026 03:46:07 -0700 (PDT)
X-Received: by 2002:a17:902:f60e:b0:2d3:160b:c01f with SMTP id d9443c01a7336-2d3b0b1d457mr377401555ad.6.1787049966475;
        Tue, 18 Aug 2026 03:46:06 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1ef9b3esm12877935ad.79.2026.08.18.03.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:46:06 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 0/2] spi: qcom-geni: Add shutdown and panic notifier
 support
Date: Tue, 18 Aug 2026 16:15:53 +0530
Message-Id: <20260818-add-shutdown-and-panic-notifier-for-spi-v2-0-eb25d56634a0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOI3hGoC/42OwQ6CMBBEf8X07JKCIOrJ/zAcSneRNdJiF1BD+
 HcB493LJC+ZzJtRCQUmUafNqAINLOzdDMl2o2xt3JWAcWaV6GSvDzoFgwhS9x36pwPjEFrj2IL
 zHVdMASofQFqGyuS7pKTc5ohqXmsDVfxaTZfiy9KXN7LdMr80apbOh/d6ZYiX3s+a/W0dYtBQZ
 ljGucb0GNPZi0SP3tytb5poDlVM0/QBvMnGCvcAAAA=
X-Change-ID: 20260804-add-shutdown-and-panic-notifier-for-spi-fa732be7c7dd
To: konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787049963; l=2911;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=cRka7uWUQtm690+nP7OzQF6jsY7N1idGSh8O4Aux44k=;
 b=ufw8FNWAODm1IjMr4f6iNRcVItFGzdK2EGsKkBYgcQBh6N67Ek635fwJQ7O4Ga/TZl/0RfW0e
 hKEJQw9xUFEAVWSa6UB1YGZ/7C+5laTiNxEcC5u7qdSsupQ0RiLlFsu
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: 6D1YAnjnrmAUmggqwSO3itG9JvEznbHm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3OCBTYWx0ZWRfXwhOVtpo63zFh
 uOpJ4pi31M4/pG+Ebbyfv+iT9Kp3t0n6kiPY0nl0x8OMoBRsav1Ujm3yplRyDXCEzbwFmHctt0F
 thKjb1eE7ZJWC/B/36AcBMOdP2GjKuI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3OCBTYWx0ZWRfX25aNqlliO2OL
 zgzgMcpE5mIl3zZ63g2NZ5owRmUrA7URbbe4ioHBSW8W+wq6TX07mbsW+8NC865yq+CNaV9F4dM
 h+rQwei8WuRcH9I8A6Ts3BvnHXScAKgde6Iro6ho6vAdYoqB1myqYbLZMcYQBkWp7xQFbNJCW73
 qye28SNfH5bY99cUxP+soiORjVQjAJsaQ7suzPjhMucXb5FJx7g0ZjGYzwUwGXj7ihSc9XJwLBi
 8IKcTtoMqoPmmcfrAeVMmZSt93IP4kPDkoVjjqDShFpkxKZT0fDq5JpBaS4ZyLwA4xVNSsCGAga
 cifqxwV9JBiftOyDZ1CMVr8W1cWT6FYcUQOqFwj2Wex3rMBbpK2kkueHUTMrgtzMVRXkjOiudg2
 ONm+clOQYdKzdHIf16mUajk3Nygs4kv6eZR9qoDYGNoNLBoVgrND/O+bhdX/aQ5gikSD+19es4M
 qgyD6/L9RvYWdfC9L/A==
X-Proofpoint-ORIG-GUID: 6D1YAnjnrmAUmggqwSO3itG9JvEznbHm
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a8437f0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=2s8DNg_1VUuDMsB73TsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180078

On VM-based platforms, if an SPI DMA transfer is in progress when the
guest is torn down (via reboot/shutdown or a panic/crash), the DMA
engine can keep issuing transactions to IOVAs that have already been
invalidated as part of teardown. The SMMU then raises context faults,
which can affect other VMs sharing the same SMMU instance and obscure
the real root cause of the crash.

This series adds two independent quiesce paths for the GENI SPI
controller so that any in-progress transfer is stopped and the DMA
engine is left idle before the IOVA mappings are torn down:

- Patch 1 adds a platform shutdown() callback that suspends the SPI
  controller (via spi_controller_suspend()) on a normal
  reboot/shutdown path, where sleeping is safe.

- Patch 2 registers a panic notifier that cancels/aborts the
  in-flight command and resets the TX/RX DMA FSMs (or terminates the
  GPI DMA channels) when the kernel panics, covering the crash path
  as well. The notifier bails out early if the device is not
  runtime-active or has no active command, and otherwise uses
  readl_poll_timeout_atomic() to poll status registers directly
  instead of waiting on completions/IRQs like the regular
  error-handling path does, since panic notifiers run with IRQs and
  preemption disabled. The notifier is registered before
  devm_spi_register_controller() so a panic during child device
  probing is still handled.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v2:
- Patch 2: instead of just disabling the SPI IRQ (or suspending the
  controller, which is unsafe in panic context), actively cancel/abort
  the in-flight command and reset the TX/RX DMA FSMs (or terminate the
  GPI DMA channels) using atomic-safe register polling
  (readl_poll_timeout_atomic()), so the DMA engine is actually left
  idle rather than just having its completion interrupt masked.
- Patch 2: skip the quiesce sequence entirely if the device is not
  runtime-active (pm_runtime_active()) or if there's no active GENI
  command, to avoid touching registers on a clock-gated SE.
- Patch 2: register the panic notifier before
  devm_spi_register_controller() so a panic during child SPI device
  probing is still caught.
- Link to v1: https://patch.msgid.link/20260805-add-shutdown-and-panic-notifier-for-spi-v1-0-b5db170d491e@oss.qualcomm.com

---
Praveen Talari (2):
      spi: qcom-geni: Add shutdown callback to quiesce hardware on reboot
      spi: qcom-geni: Add panic notifier to cancel and reset DMA during panic

 drivers/spi/spi-geni-qcom.c | 78 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)
---
base-commit: 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
change-id: 20260804-add-shutdown-and-panic-notifier-for-spi-fa732be7c7dd

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

