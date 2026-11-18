Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794986696;
	b=qX71vxR11hktHaBkH0Sp+OlgH2i/f87iPLfu5d/yApqzjgxQLe1ec8NCaPR8FQhgXJhE
	 w3xgDzyXnMjs9t2GZ5imsJxPMQG0B1kf27xvfGGDjg+2KvuoRMMVnQg6zC9RwCKydO3Qb
	 9w3LAUClaAoRCmWvo1eFXLmCEJ/fYpIFlom8GjGeB7Ucbt4O6WPF75GPS4IGD0GA4ADgd
	 pWIkAnlL/N6/A3lkFOoTezgFtaL+Xi/tc5JPoTR/KydShKPPi6bSh+9AeNyp4GJblqdBg
	 Qh1Y/o4x3bBauUKAq2m1WxetWFcrZyCR6Hw7bIvkxwRgfjIfSp/OIo6n+1P3G4lQI5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bsjzF6TvIUuw+1BiWPKqYlHDsaiLhXoBbNKg0Yd1gBs=;
	b=dNEGKoPjZfR9lVrx2M2K4hOVmNO00TsOwy4tZNZo6h7gzLVNbC19v3HUtq720w5XyrKD
	 7UITfI6vpCaNCyXB6SiNgXnLEenrS6bPmWxq3LTvfhyzOz7OrthppJ45b4k6xVqjrTsAA
	 QhxQCardkGWAzzecAyRN7NyWhv3H0L/EGlENPL/jsJQ/zA37/Lmi8wfQ4ba6w4AlFkahH
	 +mE/alVwusS/gYW4V5A0Q+uMdMP+QsTpQjk2dg5q21EbtLq0+13wieN4T1B5RA65UtUeN
	 hRyBL3erF/Sc8LsIjH9minxh2iaNxGXhUU+Yo1c8BzH1qfGwEFqGF29mu/mYeDAxr7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bHVGsYVs;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47724606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47724606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bHVGsYVs
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso313202a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794986696; x=1795591496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bsjzF6TvIUuw+1BiWPKqYlHDsaiLhXoBbNKg0Yd1gBs=;
        b=bHVGsYVshDuBPLd5wfU4E2Dv0/H7SOWZgvWb2MPz1dHjqZrbhfeOtQtQV2g3B5mPEv
         HWSiKGIRwAV1cHk6hq9OLuwAaKJfVsj1kxuZtIjb1AB2sjm7Ihkp1kMoT0CEzfWVZmge
         kjToBmF+WhtM0brpMtD8ZgStvTmYdllXEuWcE1ZlxRZT9rpT8nxNTMwf/Rn7Ypw9SbAM
         cb8TlSa560WeBvyoB5PKckJQHyIRstb5tFv/iC9HkPIg5nof0b07sNQIr38DcMILJaSm
         A756Upl4c09BEW4u3jUQFUMZQgYpH6jLrXNK2TmWteDTTN0ZNMsAy0+NbrfykYiDvE6K
         3Mxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794986696; x=1795591496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsjzF6TvIUuw+1BiWPKqYlHDsaiLhXoBbNKg0Yd1gBs=;
        b=ixZguYCjyvi3njr3xIVIN8TAIcHptRXEF4A1qkScfq++HSy3W86n4pbcNDZ6n31MXD
         SVhXYFAmAYacYO2eDLXdB/aphtmoNpcfdeZJvmUM9+aWTYa/HePFMzxE7PsfyYG3IiUj
         KEK8fEuBqChIPTD5Be26lS+y3w1OwZafPKeQKgFLLp0K8Th1AWAqCajolHL4DphWxApd
         r7F4Pqf/PtN1o94eednH9MEg8FdPd2MtCzKt/JYUq1Ts882lJefmvSrdKbq+eZsZ7ZQf
         9bM9Nz/XR4K1adQCrqTf+kO6tY7AjmOhewUfvWxYMRIRtScvfdHIEKdyYM8t5zXTicaZ
         /oSA==
X-Forwarded-Encrypted: i=1; AL+hErFijUs3KJsoumzWHIyoqQn9RUC/e2YTlILpBF8XPhX7mbKetqZ0Z5UIv8h9QgZctP1otvHRHf6tljkNUKfB@vger.kernel.org
X-Gm-Message-State: APuU4Z/h0TcDnwS3H2lhADo/J3sM6MZFpVeEVIFaYwzPObjW1h7jTTCf
	tD3ipIlxY2tihj+KgUwn0zIl6QMU3YvQ01fzkJdViZ2A14pFVNE2Vwwt
X-Gm-Gg: AZFdTZeEjLiHB5tV2mC7NyTZSeOJQNCnAqDUOWUb9MDlb/snSUr0Em7+8u56K3tYHXK
	CIltZEjuwebrPZng0OBnv02q6yBoTVyS/cZtpqtJhwfzn5+2rhOypAFqKQD+oNurcOdRHIgqaJF
	Pf4Av1ovCR36c9h1fWeuLmxmgQy/yDY+T/ZCiagC35zvBu39JFuCq1//N2M6PRs1XSQ/sIs5ohS
	5t1PeYPhu4j+GdYMykeXZY12Vo9H7Tl07tsDNqT1ZwFNvLns1Fm78+FpyZGsO6bpfRpW+byIyzF
	O2ULJpL09fYKL/46chJ6o7H0KInkEqHhIhdH5/bKF7z6HKpcsUV/JBeA628rKHjAPxt+dfFAkTd
	Qj2oOewhS4F62Rv5eC2KqBEO//fLLLy19HmUbu/HW+DNr65nG+u8J4BoGXo1Dnadl98YWWhAaeD
	qrr83HDhkQl945J2mwVWVeyz6VEC2JUBtn5hOid17wu1+BVQ+B79H2lhu54JyGoxgoHelDuk/ZM
	9AEL+wCVWYFgaBjhDDaXvRj6w0zyajr1Mx1zrVfkSd0HPzvbgAgusNUsgs/l4Vq94FnEGAFptPS
	VF+9YSfyy71vXmUhlo5YBMY8tzjO0PgAO+X1NpzLwb4hkNFZl6qPYDDSzFM9fI79lka0Dx0ZRtR
	l79J0/+xduYSCCi3IdD/BCpLVvVnyHHIu8CJ2WsXbuYSZZoGheJEUdWBAMFGMHw==
X-Received: by 2002:a17:90a:d44b:b0:3ab:884b:65ab with SMTP id 98e67ed59e1d1-3b3d07c2479mr1638407a91.55.1794986695524;
        Tue, 17 Nov 2026 23:24:55 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:f6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56ee297sm934947a91.4.2026.11.17.23.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:24:55 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: jeff.hugo@oss.qualcomm.com,
	ogabbay@kernel.org
Cc: carl.vanderlip@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	jacek.lawrynowicz@linux.intel.com,
	quic_pkanojiy@quicinc.com,
	stanislaw.gruszka@linux.intel.com
Subject: [PATCH] accel/qaic: drain the control workqueue before the device is freed
Date: Wed, 18 Nov 2026 15:24:48 +0800
Message-Id: <20261118072448.1259909-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qaic_pci_remove() tears the MHI controller down and destroys the DRM
device, but nothing drains qdev->cntl_wq.  qdev itself is allocated with
devm_kzalloc_flex() and is freed as soon as the PCI device is unbound,
while cntl_wq is a DRM-managed resource that survives until the last
open file drops its reference to the DRM device.

resp_work is queued from qaic_mhi_dl_xfer_cb() and resp_worker()
dereferences qdev, so a work item that is still queued, or still
running, when the driver instance goes away touches freed memory.

mhi_power_down() moves the controller to the shutdown state, disables
the interrupt and flushes the state worker that destroys the channel
devices, and mhi_unregister_controller() removes the controller, so no
data event can reach qaic_mhi_dl_xfer_cb() once
qaic_mhi_free_controller() has returned.  Flushing the workqueue after
it therefore covers every work item that can still be queued.

Fixes: c501ca23a6a3 ("accel/qaic: Add uapi and core driver file")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Prepared against v7.4-rc1-1969-g666539eecdf4.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.

Testing: compile tested only (arm64, gcc 11.4).  No QAIC hardware was
available, so the teardown race was not run.
 drivers/accel/qaic/qaic_drv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 90c0d31e414a..c4c3f450e67b 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -625,6 +625,15 @@ static void qaic_pci_remove(struct pci_dev *pdev)
 
 	qaic_dev_reset_clean_local_state(qdev);
 	qaic_mhi_free_controller(qdev->mhi_cntrl, link_up);
+
+	/*
+	 * The control channel is gone, so nothing can queue resp_work any
+	 * more.  Drain it before qdev is freed: the workqueue belongs to the
+	 * DRM device and may outlive this driver instance, and resp_worker()
+	 * dereferences qdev.
+	 */
+	flush_workqueue(qdev->cntl_wq);
+
 	qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
 }
 
-- 
2.34.1

