Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795756184;
	b=cEi3+OqJdESyPbD752JPPxIB8Dg54pa9lU4O5blf218rMgxfn+B5UWgsAbkFiZtlsUcr
	 bDWyP4AWPITtWhaHculPoUPAaiEDdhlUE+mZz0LAiBp+m9E7XaU8jZtJudIK+Z9fPeO4D
	 rXO9e94mQEy1vVGrHALHhht6DNiAhkof4vbD833EDsa2VKafu7UORz8NAwykK/oQBclUL
	 XFEa/Mzw/5Vr7cjGKI0vyX6obgPyb3olwxRw1Xd175PmcxN4eM5Uhu4md5h0qpftqt7au
	 Xsk0+6+4MmnZeOtsH5pWUYX0zmErkQvpI0ZdOhtkWwBzRZC8i/rLR/NQyswFw3dLEXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F3iJsoOA8LR3I1iVxCQSl+sH/70ZE2dj3acrGl06Vjg=;
	b=UBhe5lfxQBgc/MEk9kcXO1C+NBWsWfj4Gp81pUjhDYvIgixQqNrk8vc+SrvMd20sXCN0
	 P9MOBGr7mQ1YBxkujKhnLQEnIZKhGjLHH5FBvaz08vrqxwBBicfN4lM0rsJoyGgU/Mcv/
	 233luHDDQiS3WmciPeEHR0EAWfBHIFiUQ/voa505t46RphsI0VoUHbMF9jbDcUHx6ssDV
	 mQNu/YzFGOu3s7mtIxWiNJ52uC8TMt4IbLuGTAQ+V3rzx6O5QMxucKuHUl4db5Mf/Ngya
	 zYK3jL1jcQV4rVeN1eR0EZoHC72eqc3f4rFj/6VjJ1UMMGINJbQWjgU0Fiv2UltR3Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mXKPaBn9;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D287606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D287606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mXKPaBn9
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-9213f004a14so95915096d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 21:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795756183; x=1796360983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3iJsoOA8LR3I1iVxCQSl+sH/70ZE2dj3acrGl06Vjg=;
        b=mXKPaBn9BMNng2HLY0raCRf2NRFDUHWhLZ88tNUmL6gvA6gGLLmFpU7cJzeWBJDFGO
         TJZbbbVMvB6cdysB5SwUjR2lDm4619PZUm6VZy3XNLmoOFMmQ6ohG3rI9SKTUbcqX10z
         jKON6mQPE15FcowEaupElflRcHdPYLeQ1VsL17dlGhBxyIZjLhoIEdN3clXatACSoSZ1
         Qk62/4O8HQ6b2/JczpCAsGBV+qbYmLw5bi2eS18y30q2uei5+hIRIcKqK0YXdn82vDC8
         SY7/l82jJyT7Wdp7cBQfDULkQXcbGulxB+id2EczOVCDnDnaKYtj8R/YhF+biibB4TID
         2HTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795756183; x=1796360983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3iJsoOA8LR3I1iVxCQSl+sH/70ZE2dj3acrGl06Vjg=;
        b=r1GJWaaWMMXFInnkduOlpPmuv3+s706I5lTytzH3PyancTMu4WWSFNeGkGBynGuL5b
         nq60IvqNUPf+BL+ytA8ng4DDWwHrZEXg3XZRL3cf6A5+hxAAUDATEbns0KMLGiREr2/a
         Mj7wMn6BHO0TEcy7waBebrEqNRQ+LYqWW0d1j3WlGSAUULH0K4BNmG4TX5ymkELOU2+f
         co981XaaJ4yS4WPKjKRTH5yO87q5YaGbDC1Dwyqvh8zQcF4Q2EM+ujQv6D/f+YVVsGD5
         m09ISePwrZEkrG4Ndh2U0AYMr9LwbbyuW8TlTejKWkFMCO9dTVrDqsuSkN3aDVXwvoGZ
         ZVdw==
X-Forwarded-Encrypted: i=1; AL+hErG+wC8IRqo90HjSQUuFbFgkZHH8IYHp1l0jVvIjuVN+LPaeV6Z+weFEGw4ub4icXkJ3GK0L8Nx3OjjWgR6D@vger.kernel.org
X-Gm-Message-State: APuU4Z9lxW+qJAuNUFmY3eTq+p2zmfBA1ABNPJ3NcD+AW5i4IJTQ3lcY
	CNBc2J4NtHTVLXN/ZnxnWbfVcfFm4KCN1b+4ui/MYIwAs049f8O8riXK
X-Gm-Gg: AZFdTZd/dvF8ltNZd7IhsBjt6jHaJDpofcZxb/qTR5ArPbKYyZqfkuM1ZlIkgolNvA4
	H2KZHS+cDY3fgC48jHtxS5MJ2bgOLKrSXGfBQFtMX/H5lzxxkDafltl8oD2etlZfVxYE9jyt+NQ
	kyva2b3qk6/2PhN8ub2Aq/FqrvdiCdNmXvc6xbKtbAGaHP3m0E1JFNJJt/qDmd8EY8L41i4UKXU
	4NQkVADiKIP7YO0F2U0YWqZX+jPgTCgAgE1i0c1B+GqZ3Ad+IVUeFLJbPXw3TAAQvTt48n557ky
	l+mtd70SVuwE2IK84RVtkToPyRFr3J04ifMyy480WD4h7ooOumYhx8JwQDXa+sT78ALmvdKdi9W
	42iUkoNIoKPYcb0g5e+UzDVofGecGP2AouwHSX8QX9HWxO0U7m47WTRiiCkSBHQEZo4oPOYsn0x
	VT1cwMxaXW2hSgW3NnHCPgXR33gwT9T0J0oBc1k+SGXVft4Cin3SdGV4dSrG7S1GgLKvEM+Metb
	Xjz80JR2+qNP/t7pn3wnPumyH0+YPXgu5LUQ+Ynl/JeWM9FjpavB/O49XB+0hKkGbCEsBGE2MfS
	cja3Uz8dg8EEcep2mVax/W66NtMGPIRRIdFJQQYh9he58U6klb4jD6VfXumefM8gSbZ3AfcdMbW
	ngYi0YM3vEzb9hoI9pjQseShfr4YS4WWc1Vr3c14FwvUQ/3M=
X-Received: by 2002:a0c:f012:0:b0:91c:988c:6df6 with SMTP id 6a1803df08f44-92134afdf51mr377852396d6.56.1795756183091;
        Thu, 26 Nov 2026 21:09:43 -0800 (PST)
Received: from zeppelin-x.sky (dhcp-9-244-177-183.gobrightspeed.net. [9.244.177.183])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a1d948sm206309376d6.40.2026.11.26.21.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:09:42 -0800 (PST)
From: Felipe Infante de Castro <felipe.infante.de.castro@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Chen <peter.chen@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Felipe Infante de Castro <felipe.infante.de.castro@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] usb: dwc3: qcom: Restore DP/DM wake IRQ trigger types on unbind
Date: Fri, 27 Nov 2026 00:09:38 -0500
Message-ID: <20261127050938.2150497-1-felipe.infante.de.castro@gmail.com>
X-Mailer: git-send-email 2.56.1
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

On suspend, dwc3_qcom_enable_wakeup_irq() sets the DP and DM high-speed
PHY interrupts to a single edge, chosen from the speed of the attached
device. The IRQ mapping outlives the driver, so after an unbind the
mapping keeps that single-edge type.

On the next probe the interrupt is looked up again from the device tree,
which describes it as IRQ_TYPE_EDGE_BOTH. The lookup fails with a
trigger type mismatch against the existing mapping. Because the wake
interrupts are optional, probe still succeeds, but without the DP/DM
wake handlers, and USB wakeup is lost until the next boot.

Record the trigger type of each DP/DM interrupt when it is requested and
restore it from a devres action. The action is registered after the
interrupts, so it runs while the driver still owns them. Unmapped
interrupts, unspecified types and types that already match are left
alone.

Seen on a Microsoft Surface Laptop 7 (x1e80100-microsoft-romulus15) on a
7.3 kernel: after unbinding and rebinding a controller the dp_hs_phy_irq
and dm_hs_phy_irq handlers were absent from /proc/interrupts. With this
change they return on every rebind.

Fixes: 6895ea55c385 ("usb: dwc3: qcom: Configure wakeup interrupts during suspend")
Cc: stable@vger.kernel.org
Signed-off-by: Felipe Infante de Castro <felipe.infante.de.castro@gmail.com>
---
Changes in v3:
- Renamed the new fields to dp_hs_phy_irq_type and dm_hs_phy_irq_type,
  to match the existing dp_hs_phy_irq and dm_hs_phy_irq (Peter Chen).
- Added Cc: stable (Peter Chen).
- Sent inline; v1 and v2 went out as attachments.

Changes in v2:
- Resent with an empty mail body.
- Added the Fixes tag suggested by the Sashiko review.

 drivers/usb/dwc3/dwc3-qcom.c | 38 +++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index a260841..548d69b 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -65,6 +65,8 @@ struct dwc3_qcom_port {
 	int			dp_hs_phy_irq;
 	int			dm_hs_phy_irq;
 	int			ss_phy_irq;
+	unsigned int		dp_hs_phy_irq_type;
+	unsigned int		dm_hs_phy_irq_type;
 	enum usb_device_speed	usb2_speed;
 };
 
@@ -473,6 +475,7 @@ static int dwc3_qcom_setup_port_irq(struct dwc3_qcom *qcom,
 		if (ret)
 			return ret;
 		qcom->ports[port_index].dp_hs_phy_irq = irq;
+		qcom->ports[port_index].dp_hs_phy_irq_type = irq_get_trigger_type(irq);
 	}
 
 	if (is_multiport)
@@ -488,6 +491,7 @@ static int dwc3_qcom_setup_port_irq(struct dwc3_qcom *qcom,
 		if (ret)
 			return ret;
 		qcom->ports[port_index].dm_hs_phy_irq = irq;
+		qcom->ports[port_index].dm_hs_phy_irq_type = irq_get_trigger_type(irq);
 	}
 
 	if (is_multiport)
@@ -540,6 +544,38 @@ static int dwc3_qcom_find_num_ports(struct platform_device *pdev)
 	return DWC3_QCOM_MAX_PORTS;
 }
 
+static void dwc3_qcom_restore_irq_type(struct device *dev, int irq, unsigned int type)
+{
+	int ret;
+
+	if (!irq || !type || irq_get_trigger_type(irq) == type)
+		return;
+
+	ret = irq_set_irq_type(irq, type);
+	if (ret)
+		dev_warn(dev, "failed to restore IRQ %d trigger type %#x: %d\n",
+			 irq, type, ret);
+}
+
+static void dwc3_qcom_restore_wake_irq_types(void *data)
+{
+	struct dwc3_qcom *qcom = data;
+	int i;
+
+	/*
+	 * The IRQ mappings survive unbind. Put their firmware triggers back
+	 * before devres frees the handlers or the next probe can lose them.
+	 */
+	for (i = 0; i < qcom->num_ports; i++) {
+		struct dwc3_qcom_port *port = &qcom->ports[i];
+
+		dwc3_qcom_restore_irq_type(qcom->dev, port->dp_hs_phy_irq,
+					   port->dp_hs_phy_irq_type);
+		dwc3_qcom_restore_irq_type(qcom->dev, port->dm_hs_phy_irq,
+					   port->dm_hs_phy_irq_type);
+	}
+}
+
 static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *pdev)
 {
 	bool is_multiport;
@@ -555,7 +591,7 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
 			return ret;
 	}
 
-	return 0;
+	return devm_add_action_or_reset(qcom->dev, dwc3_qcom_restore_wake_irq_types, qcom);
 }
 
 static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
-- 
2.56.1

