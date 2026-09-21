Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6706D400986
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 07:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975979; cv=none; b=R5FGkJZoc0gqXWIMnf2DNvrkfCCx4y1WjVes7OK3A+UlM7OIWZ6AGuDc7ZWMIl/1xfEn+2/+vJS7CgCO3Hgyd4yteRN9iq9oQ8kNrE3quVLjWzFEONPFmQdx0J5qQ/cVNysUxNPFNaM0eFWleRwKiaTaAww3pvFqFBlQFFoKxLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975979; c=relaxed/simple;
	bh=adZvlINEsMAvwxha5qZotDk5fgCUf4YSk8i9/nH5zvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R1ZTNUH8OMzXwijqke+YHGN9kAEgfQvWmqukTKmEaqepTahrgRqN5YxCjmMoHdIzkRzOMo3KJt955xv9SbPaZG8uXWN9GJ5Ufi+eueudA9hTKw58dulyvDr9YSu7tv0abrxe5TrwFNXtQ+OLsN6cZ7fAvNeZTzTCfpiJHVBeSyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avlUYIXs; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avlUYIXs"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b91369d18so19096635e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 00:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789975975; x=1790580775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=feqkDAo3psQqEeeV5D6w+0v2eNiDg14CK6zySTrGKK4=;
        b=avlUYIXsFDdVrrmgj30kPR4NuzZ/TTzj1G/1xZeUehmyeSjKbDzxSouabat2HIlAkF
         GC+ADrHUGotm5MlCG3bYlD+g56PFvEnFDMFnVPZTjguuigjBY6CCU8fA8eJ3qZg5zD8a
         dxgmKRZs/51tcBeZAYTdHRsM7N4+aaw+qtk8NfY0aKR6Y6YbEpHWwUiHhTfD7V9P98z3
         YaMhpmQlfurDnXyD5NbD3Tr2E06Fx57rlNFVA0yebY5ZB9/gJPPOp8XKo0Wm/d9m+uw3
         1EJGSDqAAmd2ej1kWFQkFUR3dG4znjuyWVyoOFOXN3zcPtG1gNmEaO6IyH2d8uUPpLnI
         I6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789975975; x=1790580775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feqkDAo3psQqEeeV5D6w+0v2eNiDg14CK6zySTrGKK4=;
        b=mbDPknf9v0DNt1tVG4UiUpL33tgJ3x15D1cMFu2JLpHd+auof5DHmy0abj0Mm3JmJH
         x/qDrzc0n3AsiFjUG8q63w9w1YVm4mzeZChnhg7jR3blIaloTYkuZFgblIbO6wL3ITf0
         v0NDLvqTtxWEIcFSacCFvCdYe7Sj2oj0Zwzu0ZsrVu7G85hLLHmOEjYxjKepBmo4gCHs
         Yfae1RI88Tjn4KAbc66W9N+EkiRD2EMEbRNkZYTm3xPv/EkciXoZPU2gag8k5lAobCV5
         VMk/Z/UgQ9LUqSgEuYUHhgVfzANG7GwrJhH8tTLA1iBnLCs8pnAm8GlGr9rX0WsFbsvJ
         DgJw==
X-Gm-Message-State: AFuF++lmzomTXeikHT5L6Lq/j7KeWODuxUo5Dnq9AC80NUFcJ5qeRhgz
	SiDl7alezUi2C0Axq6kcrR8CvqRTEfFR3ByqwIzN59ccAYTaIBeLbzf56s4VpnJayBf/lbLDsWM
	=
X-Gm-Gg: AYBFou0DMY8F8PYcfif/f9GYNmIf4IzHQOSmVVXo3l/It5KJISpEaQENBTjkRytzhG/
	jd5VhV0DAaEDGxmwxonAhcGFGQ8KsfwVApDgCv6j00MYXSr5rOf0gDvDIiaAzT9FtnMYPYyNLZx
	Q1kAZS8KZkAXE2cFSsjFvxSOyLxmyRWfEIHftohVQBJ+pPFWn1kqWEZnJG9BgSzgh9fUbRAd9D9
	Mq9YkKcKy8z1W34SyOR2IR3FR9nmjl5ToMxb3SpMkr6gv99QodsccXdkWJ9Cn7F/mZESaVhj3yl
	RLwMwO06q5IkCHMm90G4IQR7o3KFa4R+Z2WbqGZI1hbQDXDbTbxsjWIqu3CXo4oUEW4c3AkWBoG
	gsOyVJLCR2zUaXM0p+JX1vB5enMcZl/cqMnVCKyKYVoa2MnwzeEgry+YrUi8UKHNZ34vuK27v0h
	OV6oD00HsVleJmDomiaJsAD+2TM+e4t86d/Xb+69uNG3JVtF76ATMLIUpfJ+Y8NeTvTokFHYCp7
	emL8YWFpUqIZsYSLYMgB1OjSIvyaAsZBO8=
X-Received: by 2002:a05:600c:1552:b0:49c:fc6e:a3df with SMTP id 5b1f17b1804b1-49fcc2b2785mr119785285e9.30.1789975975149;
        Mon, 21 Sep 2026 00:32:55 -0700 (PDT)
Received: from royzah-ThinkPad-T14-Gen-4.tii.local ([213.42.107.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd068059sm219343885e9.5.2026.09.21.00.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:32:53 -0700 (PDT)
From: Royyan Zahir <royzah@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	aesteve@redhat.com,
	linux-kernel@vger.kernel.org,
	Royyan Zahir <royzah@gmail.com>
Subject: [PATCH] firmware: qcom: scm: clear download mode and SDI before a restart
Date: Mon, 21 Sep 2026 11:32:31 +0400
Message-ID: <20260921073231.3254159-1-royzah@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With qcom_scm.download_mode=1 an IQ-9075 never completes a warm reboot.
XBL stops in download mode and only a cold power cycle recovers the board:

  B -    857233 - TCSR reg value 0x10
  B -    865071 - RamDump -  Image Load, Start
  B -    884317 - boot_dload_entry
  B -   6774477 - USB DUMP failed, because USB cable disconnect

0x10 is FIELD_PREP(QCOM_DLOAD_MASK, QCOM_DLOAD_FULLDUMP), so the cookie
written at probe is still set when XBL reads it, even though systemd
stopped every unit in order and nothing panicked.

Two latches have to come down and neither reliably does.
qcom_scm_shutdown() clears the cookie from .shutdown, which
device_shutdown() calls after the SCM device's own dependencies may
already be torn down, so the write can fail with nothing left to report
it to. SDI is disabled only from probe, and only when download_mode was
zero at that moment, so a board booted with download mode on keeps
watchdog debug armed for the life of the boot. Writing "off" to the
module parameter later clears the cookie but never reaches SDI, which is
why that runtime workaround does not restore warm reboot.

Clear both from a reboot notifier. kernel_restart_prepare() calls the
reboot_notifier_list before device_shutdown(), so the SCM device and its
interconnect path are still up. SYS_OFF_MODE_RESTART_PREPARE is not
usable here: kernel_restart() runs do_kernel_restart_prepare() after
kernel_restart_prepare(), which is after device_shutdown().

The notifier reaches its instance with container_of() rather than the
global, so it does not conflict with the series dropping __scm [1].

Registration warns rather than failing probe, because the instance is
already published at that point and callers may be using it.

.shutdown stays for the power-off path.

Tested on an IQ-9075 EVK with download mode armed: warm reboot returns in
~36s, and a console capture across a cold boot and the warm reboot shows
two complete boot cycles with no TCSR cookie read and no boot_dload_entry.

[1] https://lore.kernel.org/linux-arm-msm/20260914-scm-device-api-v1-0-3573e2596c51@redhat.com/

Signed-off-by: Royyan Zahir <royzah@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9..06cba43 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -27,6 +27,7 @@
 #include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
+#include <linux/reboot.h>
 #include <linux/reset-controller.h>
 #include <linux/remoteproc.h>
 #include <linux/sizes.h>
@@ -63,6 +64,8 @@ struct qcom_scm {
 
 	struct qcom_tzmem_pool *mempool;
 	unsigned int wq_cnt;
+
+	struct notifier_block reboot_nb;
 };
 
 struct qcom_scm_current_perm_info {
@@ -2790,6 +2793,20 @@ static const struct kernel_param_ops minidump_dest_param_ops = {
 module_param_cb(minidump_dest, &minidump_dest_param_ops, NULL, 0644);
 MODULE_PARM_DESC(minidump_dest, "Minidump SRAM destination: usb (default) or storage");
 
+/* reboot_notifier_list runs before device_shutdown(); RESTART_PREPARE does not. */
+static int qcom_scm_reboot_notify(struct notifier_block *nb, unsigned long action,
+				  void *data)
+{
+	struct qcom_scm *scm = container_of(nb, struct qcom_scm, reboot_nb);
+
+	qcom_scm_set_download_mode(scm, QCOM_DLOAD_NODUMP);
+
+	/* Separate latch: probe only disables SDI when download mode is off. */
+	qcom_scm_disable_sdi();
+
+	return NOTIFY_DONE;
+}
+
 static int qcom_scm_probe(struct platform_device *pdev)
 {
 	struct qcom_tzmem_pool_config pool_config;
@@ -2941,6 +2958,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	/* Initialize the Gunyah watchdog platform device. */
 	qcom_scm_gunyah_wdt_init(scm);
 
+	scm->reboot_nb.notifier_call = qcom_scm_reboot_notify;
+	ret = devm_register_reboot_notifier(&pdev->dev, &scm->reboot_nb);
+	if (ret)
+		dev_warn(scm->dev, "failed to register reboot notifier: %d\n", ret);
+
 	return 0;
 
 err_rmem:
-- 
2.55.0

