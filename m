Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9843C0A1E
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792259006; cv=none; b=NOrRFm+fmFrEgMML7zG4Z0r8qvM+tnMclTKWbw7GpQBSSBHpMjebKjztpeqKDPYp4Sj6dReSy+l7bIGpItyX2TjQJrZyCvoaDmOOmt2OD3xkTwzR/I4fZJAz/vV9LK0ILi7W/STlf0aDXujpiYFdBzejzB5s377np+G/N3oldis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792259006; c=relaxed/simple;
	bh=PXfTNimZxtPFUtjkyxv7iqfY7+4RBOfgiA2KMuVA39c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RJW+XOkOzfoabShTO4fbs4Jn57hRShwbiU3VDnWYAk4RHaMh4RQkFBrZkgPXa6FbDn4feHP2xyoZAac28lLNNokQejywovjahf6cmQ+/yyMYjQdsx4JSYhhNyE+SdVeLHK2r83lBLKHh4JUA+CrsRMkVdQWLhCiZx/qtV5K+7mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8d1RdMx; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8d1RdMx"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so90647666b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 10:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792259003; x=1792863803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PwF3jKNAYzszFL75qOBfeCsRKgDJQKcyrSL9S+2luJM=;
        b=D8d1RdMx1cyLTjga3JNRISW6jP0kU+obJNJNbxV6jzdYf+Uh3uzrKBKmmy1qijCzxE
         Gquraup66zzxhUM/Px4DEA3cruj2XsOaMBdgrALDDKxpdHgsLqE1kEt2sXHrGHS+QA+X
         q0+VwBjUtFeelAyDBpLJWntNDnLijccOabpfM5aZLp+BaCUXcRS5x5ucNn7D0T6+iYuN
         h10xrN60erLG6iu7b0dAqVSyUv0rrNHGroGFXlkxjZ+xSAv6u4r6T3PvfJwCyNejcaEO
         6BY6YH/gNDtGjL9AsD18QD4hVQJSZuft/a9hGa6kiYDc/QQHbA7NDFxHlWNUNRTTr7Cu
         JRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792259003; x=1792863803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PwF3jKNAYzszFL75qOBfeCsRKgDJQKcyrSL9S+2luJM=;
        b=BvExhBTV1R3Ko9RWgJK46xNVlvyhVKeJ7ZxOgFLEBvoceRo0TqRS2ELVfceM3zzuDw
         /f9NvGqExCrsxL58XIK0yb1wvMUI4ss2OwiZUxMIgQOwSjhmulasqPdK5MFk0CHKe0tX
         Z/nJ0oT5gKQ6WA9g3XxFpbdRtuUbt/IMzh9zIdWvHr1/zojAyanTp+M1KIJfqddCwwTV
         MFbSGi3K8yuXRsP4hmyZhkoaQtcgNe9wB3gzuVnvInVPiUI0+XGjLT+K/WmUAobTJH7X
         PBjvCi3lViexd7rTYPAjuRB/gd2EdRQtPUa1SKnZPl5+y9L0ypX8nbN6+KQkLJ/ilsC/
         A3Aw==
X-Forwarded-Encrypted: i=1; AKwUvBx5RKOGrVzL9Exun51uJLGRYSy6ex9wUe6faRwhzW8DQxXLnUfqG7BsSV0uO8tlk1W41ug9l/4gob0BPqOg@vger.kernel.org
X-Gm-Message-State: AFq9FYIAhkqeP2SiqAaxP878mNFRapTWI91jwwMgmGrDxBa8yVerEuip
	NJulf56t1VwQ27XIkXK5Gchxxcz0Apv5KQP6dalnVRzyIKmCQyx1n7OI
X-Gm-Gg: AYBFou0qO5JlpSnCk+YExWD5jG6Zw/hfwi0Kl4rdM7nJEp/gfxA2IuiqYX1vJb2raLJ
	C7zTz30WjYoPDIFZqyFqqIXoxkiHI5VcCuj8CC7w7jg12iBrgHnwyvS2ThuQ43WTCiAZLgeEFd2
	IHcUguiEaxvCO7UrOSueI7D8UW+rfamBDhrXXQf7mvsLc9Hl97g73x/CMYivflj+6nuw8kP6okL
	ZXQSclr0Vj3E54dMXZPaKC8rIANpoAXppw3OS8caea5JU8k6tCdLk6oJRIG/JxlbyeeYV9ozVGv
	jrGMv5DdC+N4ZkgSRHkowjuh5VI72dAWzk902YaYKeOfvHQ/JQ7k7MXUCIdapcuXDeQ0WM++jYT
	ylDw2UjxQ3jMrdqXCDbHT5iWRJUQzJHe5nnXlRehjOiD7ZIQrWBugkwHzEtRyQBgP1ulVRHuX6K
	jfI/rn58ndb1wR/AKSwWYFGqMOMPcMfD3yX0YpXLE7vTGXIMd7RkPt3xsOgZOX3KBZY6TWi8PNm
	UeaLQ==
X-Received: by 2002:a17:907:c305:b0:c31:c767:adfb with SMTP id a640c23a62f3a-c4196aa9278mr216107766b.0.1792259002706;
        Sat, 17 Oct 2026 10:43:22 -0700 (PDT)
Received: from nb-xps.ts.zxczxc.org ([78.56.243.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb164fsm190951066b.70.2026.10.17.10.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:43:20 -0700 (PDT)
From: Nikolay Bryskin <nbryskin@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Nikolay Bryskin <nbryskin@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: hci_qca: Reprobe QCA6390 after hibernation
Date: Sat, 17 Oct 2026 20:43:10 +0300
Message-ID: <20261017174310.22484-1-nbryskin@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without a way to power-cycle the SoC (no BT_EN GPIO and no power
sequencer, e.g. the ACPI-enumerated QCA6390 on the Dell XPS 13 9310),
HCI_QUIRK_NON_PERSISTENT_SETUP is not set and hdev->setup() runs only
once, at probe, on the assumption that the SoC keeps its firmware.

Hibernation breaks that assumption: the platform powers the SoC off,
and after the image is restored it is back in its ROM state. The
driver's resume callback, shared with suspend-to-idle via
SIMPLE_DEV_PM_OPS(), only clears QCA_SUSPENDING, so the first command
times out and the controller stays unusable. Error recovery and
power-cycling the adapter from userspace don't help either, because
none of them run setup again:

  Bluetooth: hci0: Opcode 0x0c01 failed: -110
  Bluetooth: hci0: command 0x0c01 tx timeout
  Bluetooth: hci0: crash the soc to collect controller dump
  Bluetooth: hci0: Opcode 0x0c05 failed: -110
  Bluetooth: hci0: Frame reassembly failed (-84)
  ...
  Bluetooth: hci0: Opcode 0x0c03 failed: -110

Give the restore phase its own callback which, in this configuration,
rebinds the driver so that probe downloads the firmware again. The
rebind is done from a work item on system_freezable_wq, as it can't
run from within a PM callback and it frees the qca_serdev the callback
works on. All other sleep transitions keep their existing callbacks.

Rebinding works here because the SoC is in its ROM state after the
restore. Rebinding while it still runs the downloaded firmware fails
the same way a warm reboot used to before commit 7e7bbddd029b
("Bluetooth: hci_qca: Fix qca6390 enable failure after warm reboot"),
which this patch doesn't change.

Tested on a Dell XPS 13 9310 (DLB16390): Bluetooth comes back about a
second after resuming from hibernation, with no command timeouts.
Suspend-to-idle is unaffected.

Fixes: e5d6468fe9d8 ("Bluetooth: hci_qca: Add support for Qualcomm Bluetooth SoC QCA6390")
Assisted-by: LLM
Signed-off-by: Nikolay Bryskin <nbryskin@gmail.com>
---
 drivers/bluetooth/hci_qca.c | 58 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 7089e9b639b2..7bca14d364b9 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2775,7 +2775,63 @@ static int __maybe_unused qca_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(qca_pm_ops, qca_suspend, qca_resume);
+struct qca_reprobe {
+	struct work_struct work;
+	struct device *dev;
+};
+
+static void qca_reprobe_work(struct work_struct *work)
+{
+	struct qca_reprobe *reprobe = container_of(work, struct qca_reprobe,
+						   work);
+	int ret;
+
+	ret = device_reprobe(reprobe->dev);
+	if (ret && ret != -EPROBE_DEFER)
+		dev_err(reprobe->dev, "Failed to reprobe device (error %d)\n",
+			ret);
+
+	put_device(reprobe->dev);
+	kfree(reprobe);
+}
+
+static int __maybe_unused qca_restore(struct device *dev)
+{
+	struct serdev_device *serdev = to_serdev_device(dev);
+	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
+	struct hci_uart *hu = &qcadev->serdev_hu;
+	struct qca_reprobe *reprobe;
+
+	qca_resume(dev);
+
+	/* Without power control hdev->setup() runs only once, at probe, as
+	 * the SoC is expected to keep its firmware. Hibernation powers the
+	 * SoC off, so rebind the driver to download the firmware again. The
+	 * rebind can't run from a PM callback, and qcadev is gone once it
+	 * does, so it gets a work item of its own.
+	 */
+	if (hci_test_quirk(hu->hdev, HCI_QUIRK_NON_PERSISTENT_SETUP))
+		return 0;
+
+	reprobe = kzalloc_obj(*reprobe);
+	if (!reprobe)
+		return -ENOMEM;
+
+	INIT_WORK(&reprobe->work, qca_reprobe_work);
+	reprobe->dev = get_device(dev);
+	queue_work(system_freezable_wq, &reprobe->work);
+
+	return 0;
+}
+
+static const struct dev_pm_ops qca_pm_ops = {
+	.suspend = pm_sleep_ptr(qca_suspend),
+	.resume = pm_sleep_ptr(qca_resume),
+	.freeze = pm_sleep_ptr(qca_suspend),
+	.thaw = pm_sleep_ptr(qca_resume),
+	.poweroff = pm_sleep_ptr(qca_suspend),
+	.restore = pm_sleep_ptr(qca_restore),
+};
 
 #ifdef CONFIG_OF
 static const struct of_device_id qca_bluetooth_of_match[] = {
-- 
2.56.0

