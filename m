Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387700;
	b=t5+4PbaGnM3Iv40cpGCsdfbiIoyAfhUb5pu6LipEdJYPm+lXvIcBhNIfavE9NcH3nMe3
	 q2hN4IHjRihACEKee2faOZJAbBy9KxNHyQRRO5ZhktgHntlJy1k/M1eYeFFVDU5ResPLz
	 AT6kanH1MaDtZpvGFiAXOttfIjqMtjDcFw2XqCTU9d6bvuNjcKW0ZsotFPP74miHSpTJ9
	 i7+jQcwT1OHrnxTnn//gmQ9TlIxi2nVg3AEPVmqOoZdFhOrWIZvZxIndfcuxbTA5mb31v
	 IUDe6bknfqzF//qxriTxIp7YsQekIKFz1iYPnS0cU/vvfq+FGK7+qr3KeOfBPyjFQbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KL19KQNopMVyzBwuHM5vHuCswIY/EUpdmcDxMI8zQAE=;
	b=33QtUQIK+gAehxsJUAYUEbks7PO/j4QXqoyKU5NBZh0L48EkTt4cDwExuK906g9LV24V
	 mzeaxg/9sT8Ize9NhJE8lLF6jFZJPSjjNGC4X52ghPidMoa1FCkkzdYfnamQ3RnEKDz/O
	 7uAoipn1hGYCYw7Cis/uzDWTacYsg4RJ01q1vVBkZrSQzYzbMWPR5qveoF6UO/+3ZkeDS
	 EUOSa2Ek4CfV+k8H1kDgqJZj1n1DWb5YPL+fWHOcBzzZC1/50KLI0Av1CKa4ILYcTLHbR
	 1n2ZVF+OR52kUoM1pFUCT5f2gNRo/V15y1GeX7yQWI7JoQfsqMnPHJ7QEjE1Ls0a6qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mbz0C7tt;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69055606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69055606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mbz0C7tt
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b467581b98so26834295e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 01:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794387698; x=1794992498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KL19KQNopMVyzBwuHM5vHuCswIY/EUpdmcDxMI8zQAE=;
        b=Mbz0C7tt41ZPr7X7WI9aleBo5lCzEDmPT4NJDD0wzO3jKuTMmXdDzrykLH2q4ueIA0
         2CSR5OKnnGgzpW+ajT/KoAPwES4ZXa7qn5zL86WJ7hU+BRdRWi9WX5R2TgiEgIfPSrvq
         1YZf5OZPNJBpjhZoA4wh7O6n4G/yCXlVQ+RGyRRR/7/7I/WNN6DOk5pNS7zBmpIEEWOV
         quEzPBf6jryAD8dlvgBObJ1E1ogz+NSJI+BrewScmee2Po9zj1F2rDzdQE/x//9hbnZS
         9Z2XmCBylPdhsfPMRYFoLc35lmHZS3uVehlhWsnqRuwSVki45fpj3W3nqDOObwE4+F4t
         x97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387698; x=1794992498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KL19KQNopMVyzBwuHM5vHuCswIY/EUpdmcDxMI8zQAE=;
        b=DAYy7biiioJttI+RfvRqMjkx+MGz6wT/HjJX3s4TyO4Kvrvhfhc8fjOrB89uwmwwj9
         DKA7nUBukVdjwNCCkzTZ4JcojrtNdpwZloii4+j2Hu3C3bnKWGGL0+ljhHJS+68hNxpp
         e42rPWfDkhLC0k5rzbdoJktDf0xNItoQGznpYmqdaJU4ePGQkTpXqKfjFs69HE5EYlCD
         kz5CwGrUGlYmtCfgW0ka47cFMEXbzoZ1zCI5EZ6wA6PxMUsNhoAZRJ47pTv9M7tePCrM
         CynENXlpUVESSZypQK3nlvad7hkezfRaW8+ZenvTcXxKq9Ss04sJFq4OeruG6ZbM22Jz
         IAhQ==
X-Forwarded-Encrypted: i=1; AL+hErHvDoB9zjSWRLw0eSoZbz1rfTByZxhkuDOW8DMpSVoktu5IAOSaBLkZle/YpURh3riMlK8ZxkdAS6o08cKO@vger.kernel.org
X-Gm-Message-State: APuU4Z9E82jL6IXZR5WW5/9C15neQGOEXLLeZ7JpR1MF0d4z2q4eCgzl
	g2JVTjnrle6r7ImijvdbSZnm8ynHqtR1Yxq1m3BZ73AZujf+hRjn6/V5
X-Gm-Gg: AYBFou3O3DcW9PetAkG2wlWiKRr4PCAbQK5cBFVyymUwAM/TsiefMefdDP9PJIjqpYR
	9yUiWZ0Da9Et410y5Db8iFwlc9QnPV4E2RBIvp5gUPYt8UBmfNOjaG0JhxJjYwFqKBYOFs0kM8p
	P1ocdaNPOqyHHY3cEZq5M7i7gejfI9fuz7S3Cw7M5CDXPm5LJS01a2FqFL3iVs+eE9iQ9qh5RHg
	ZMlT/sMf5ibTyYil1iYrlZY6Hd2Udvf3p9lbJNhZWb471dWbkNteiHxk2yy84BdOvZamJPBTKl8
	h8f+eCKjxzDMdZ3ItxrFLQ0bgOleYxznC6TAedEoi9EjEPLoonnjXGkaok96a5oj6nksEEk3cCX
	pYnxHl7pSs/2c0bYPS8k2xZDFiMmjjwRiqxggW8Mom/CDhrU5ur8IevY/oR9STcaWaA3iaC8Msp
	AaNNgt+SawSwLVkDdifv2S7G1G9p5TgvEBs04twE2c5iIygBQom+NLAMkjHZVYfmV+DufWgoykC
	4puiZDRy5W+RrC0bEspa0ktjGDeDaMzxqgEToSABHzztH2X7CgeT3MY2H4r/nu6k972yq4NLjH6
	LuB0tTvCXwnchZJ17/ptqBqazy+m/CKKdtg8UbBeCB5VQBOQOL9aNycjb1YXVMYE1nv9+Z2eC2i
	TJw==
X-Received: by 2002:a05:600c:4f14:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4ba093b5ec4mr35114495e9.29.1794387697445;
        Wed, 11 Nov 2026 01:01:37 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204ee67sm129398155e9.13.2026.11.11.01.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:01:37 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Prashanth K <prashanth.k@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: [PATCH v3] usb: dwc3: Notify the glue of role changes from the mode switch work
Date: Wed, 11 Nov 2026 11:01:22 +0200
Message-ID: <20261111090122.134-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
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

dwc3_usb_role_switch_set() and dwc3_drd_notifier() call the glue's
pre_set_role() synchronously, from the context of whoever changes the
role, while the mode switch itself runs from drd_work on a freezable
workqueue. Not every caller is frozen during system sleep: the UCSI
connector work, for one, runs on the non-freezable system workqueue.

On SM8750, when the USB cable is unplugged while the system is in
s2idle, the UCSI connector work for the change runs before the devices
have resumed. It switches the role to USB_ROLE_NONE, and
dwc3_qcom_set_role_notifier() accesses QSCRATCH while the glue clocks
are still off. The access does not complete and the SoC resets.
pm_runtime_resume_and_get() does not prevent this: runtime PM is
disabled at that point and the device is still marked active, so it
returns success without resuming anything.

Record the role and call pre_set_role() from __dwc3_set_mode() instead,
so that the glue is not called while the system is suspended. The mode
alone can't carry this: USB_ROLE_NONE maps to the default mode, so a
switch between it and that role leaves the mode unchanged, and the glue
still has to be told. Make the call before the checks that skip the
mode switch, and only when a role was recorded, as the mode can also
change without one from debugfs and from dwc3_setup_role_switch().

Role changes that come in while the work is frozen collapse into the
last one, which is the state the hardware has to end up in.

Fixes: 21188e8d6d75 ("usb: dwc3: qcom: Implement glue callbacks to facilitate runtime suspend")
Cc: stable@vger.kernel.org
Suggested-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
Changes in v3:
- Fix this in the dwc3 core instead of in the Qualcomm glue. The code is
  Thinh's change from [1]; I only updated the two comments that went
  stale with it. All glue drivers benefit, and dwc3-qcom needs no
  deferral or lock of its own.
- The role is recorded in struct dwc3, as the mode alone can't tell
  USB_ROLE_NONE from the role it maps to (Prashanth, [2]).
- The extcon path goes through the same work.
- Drop Krishna's Tested-by, the code is different now.
- Link to v2: https://lore.kernel.org/all/20261022224220.480-1-tvlad744@gmail.com/

Tested on OnePlus Pad 3 (SM8750, UCSI over pmic_glink) with v7.3-rc5
plus board patches, details in [3]. Without the change, unplugging the
cable in s2idle resets the SoC. With it there was no reset in five
suspend runs in device mode (unplug, plug in, both, cable left in) and
five in host mode (USB stick left in or unplugged). The host-mode runs
were on a kernel that also keeps the USB GDSCs in retention [4]. The
comment updates were not in the tested kernel.

I used an AI assistant (Claude) for the analysis and to draft the
description; I reviewed the result and ran the tests on my device.

[1] https://lore.kernel.org/all/auu9hx_Xnjbi3WkB@vbox/
[2] https://lore.kernel.org/all/f9d27fd8-cf33-4e6a-a9fc-6770a933cfb3@oss.qualcomm.com/
[3] https://lore.kernel.org/all/20261110172148.1640-1-tvlad744@gmail.com/
[4] https://lore.kernel.org/all/20261110213346.1359-1-tvlad744@gmail.com/

 drivers/usb/dwc3/core.c      | 25 ++++++++++++++++++++++++-
 drivers/usb/dwc3/core.h      |  8 +++++++-
 drivers/usb/dwc3/drd.c       |  6 ++----
 drivers/usb/dwc3/dwc3-qcom.c |  5 +----
 4 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..99a39c828543 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -169,15 +169,23 @@ static void __dwc3_set_mode(struct work_struct *work)
 	int ret;
 	u32 reg;
 	u32 desired_dr_role;
+	enum usb_role requested_role;
+	bool notify_glue;
 	int i;
 
 	mutex_lock(&dwc->mutex);
 	spin_lock_irqsave(&dwc->lock, flags);
 	desired_dr_role = dwc->desired_dr_role;
+	requested_role = dwc->requested_role;
+	notify_glue = dwc->requested_role_pending;
+	dwc->requested_role_pending = false;
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	pm_runtime_get_sync(dwc->dev);
 
+	if (notify_glue)
+		dwc3_pre_set_role(dwc, requested_role);
+
 	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_OTG)
 		dwc3_otg_update(dwc, 0);
 
@@ -287,7 +295,8 @@ static void __dwc3_set_mode(struct work_struct *work)
 	mutex_unlock(&dwc->mutex);
 }
 
-void dwc3_set_mode(struct dwc3 *dwc, u32 mode)
+static void __dwc3_queue_mode(struct dwc3 *dwc, u32 mode, enum usb_role role,
+			      bool notify_glue)
 {
 	unsigned long flags;
 
@@ -296,11 +305,25 @@ void dwc3_set_mode(struct dwc3 *dwc, u32 mode)
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	dwc->desired_dr_role = mode;
+	if (notify_glue) {
+		dwc->requested_role = role;
+		dwc->requested_role_pending = true;
+	}
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	queue_work(system_freezable_wq, &dwc->drd_work);
 }
 
+void dwc3_set_mode(struct dwc3 *dwc, u32 mode)
+{
+	__dwc3_queue_mode(dwc, mode, USB_ROLE_NONE, false);
+}
+
+void dwc3_set_role(struct dwc3 *dwc, u32 mode, enum usb_role role)
+{
+	__dwc3_queue_mode(dwc, mode, role, true);
+}
+
 u32 dwc3_core_fifo_space(struct dwc3_ep *dep, u8 type)
 {
 	struct dwc3		*dwc = dep->dwc;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index f3dabb37f806..dc7cd751ed4d 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1000,7 +1000,8 @@ struct dwc3_scratchpad_array {
 /**
  * struct dwc3_glue_ops - The ops indicate the notifications that
  *				need to be passed on to glue layer
- * @pre_set_role: Notify glue of role switch notifications
+ * @pre_set_role: Notify glue of role switch notifications, called from
+ *		  drd_work so that it does not run during system sleep
  * @pre_run_stop: Notify run stop enable/disable information to glue
  */
 struct dwc3_glue_ops {
@@ -1058,6 +1059,8 @@ struct dwc3_glue_ops {
  * @dr_mode: requested mode of operation
  * @current_dr_role: current role of operation when in dual-role mode
  * @desired_dr_role: desired role of operation when in dual-role mode
+ * @requested_role: role requested
+ * @requested_role_pending: @requested_role is yet to be passed to the glue
  * @edev: extcon handle
  * @edev_nb: extcon notifier
  * @hsphy_mode: UTMI phy mode, one of following:
@@ -1261,6 +1264,8 @@ struct dwc3 {
 	enum usb_dr_mode	dr_mode;
 	u32			current_dr_role;
 	u32			desired_dr_role;
+	enum usb_role		requested_role;
+	bool			requested_role_pending;
 	struct extcon_dev	*edev;
 	struct notifier_block	edev_nb;
 	enum usb_phy_interface	hsphy_mode;
@@ -1614,6 +1619,7 @@ struct dwc3_gadget_ep_cmd_params {
 /* prototypes */
 void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy);
 void dwc3_set_mode(struct dwc3 *dwc, u32 mode);
+void dwc3_set_role(struct dwc3 *dwc, u32 mode, enum usb_role role);
 u32 dwc3_core_fifo_space(struct dwc3_ep *dep, u8 type);
 
 #define DWC3_IP_IS(_ip)							\
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index f3e37d383627..55036466ec7a 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -439,8 +439,7 @@ static int dwc3_drd_notifier(struct notifier_block *nb,
 	enum usb_role role = mode == DWC3_GCTL_PRTCAP_HOST ?
 				     USB_ROLE_HOST : USB_ROLE_DEVICE;
 
-	dwc3_pre_set_role(dwc, role);
-	dwc3_set_mode(dwc, mode);
+	dwc3_set_role(dwc, mode, role);
 
 	return NOTIFY_DONE;
 }
@@ -468,8 +467,7 @@ static int dwc3_usb_role_switch_set(struct usb_role_switch *sw,
 		break;
 	}
 
-	dwc3_pre_set_role(dwc, role);
-	dwc3_set_mode(dwc, mode);
+	dwc3_set_role(dwc, mode, role);
 	return 0;
 }
 
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..2e263b378966 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -578,10 +578,7 @@ static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_rol
 	pm_runtime_mark_last_busy(qcom->dev);
 	pm_runtime_put_sync(qcom->dev);
 
-	/*
-	 * Current role changes via usb_role_switch_set_role callback protected
-	 * internally by mutex lock.
-	 */
+	/* Role changes are serialized by dwc->mutex in drd_work */
 	qcom->current_role = next_role;
 }
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
