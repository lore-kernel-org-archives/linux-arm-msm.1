Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713853;
	b=jWq6Snm12z0xqh/Na0HROAE3bHmVc0s1HUCXtG8Tn/KrFhnOVTBbpHsjJ2fzmM1Q85Im
	 Lytb0/t874ku6OnWPWqRAuKrOXSmsHjweQvG/VfBUJoL5g9uUZofNiwucjDMHdmB+Rmdx
	 MBVymcXPOx7VYd4+WFdt3BMB90QF/HEDbrbLMTefFjS8wyqo//fHEKmQp1npQIPWH8RYG
	 sP7UZ0EoKBA/6OZxZmGpuvTwAbJ7sVVyUAYcpbsP8mz/k2iG1VJabDIm8XqgWLBvzYwNU
	 aDhV5IaKNPST0Ug3v4zhxyKTUWv0KQ0nH8w2HKbQWsIXmPu9QljGwujlzFza1tbOHQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3ocX26OOcgyW/a7Ke5hFuvKM7A1eBK7k3voEhoZoCQs=;
	b=N9vrFPRIz2thRhfUwNHwRkA+gNr11mQZB6TXNwx+jEelI5PXfwt9tcrCw3L23dlW/vQ9
	 mB3iYixPnCb3BWh6uVDSaRqSbJxvojaqD5Bm0jdxyA95wo20hHiAj+sPcEEbJ3DSbkFe8
	 SCRFjhnnY3mwkFTLkHBWzHOFBur1P0K3JxCgRU0l4i6BcYuHB2iQyFjr9uz9m7oa3wOiw
	 xmj1CFHIiJvY8S26JcvBlOKa4L32vFtGn/JMBCEDVvsbdtGRP4b9rA+p25+T45uJ592nI
	 kHE20heqFjCYAGj5wL+bDgvWPU7t1k3LKZHLAVBEx3I9IUArWZ1s0Mnowye49GLgGag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=delYMtwG;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A85606A335
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 13:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53A85606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=delYMtwG
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2761c69fbso7120116c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713852; x=1794318652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ocX26OOcgyW/a7Ke5hFuvKM7A1eBK7k3voEhoZoCQs=;
        b=delYMtwGTqYS7f0IlLuOXyVktSrNGiUXD76DSBtagvGOQHEGAQ+yN5T2/bltP/StHn
         3DN4DpB+Nbob90iMlcL0IKT5T97zSVAhCPJY24vgD/f/zoCrM4eAUn+j4WzeOK0/CttI
         OFPYxMUP0TC+QJ9HhYEcMU/8gLkymTqKQnIcD8sO29qhX0EfLvJf6LygobZYFhem1EKH
         v+aL0LxduTA2gNTngbL6uEf2/LgAO5K0TqyueKv7xTObm4S3a9X8bK0Dbid5K/4y4xQx
         0StQFV+QdynEoMuTEKpoEMHy7ixuwwZtLODE0rhEGPH9Q8/etFpddKAZdSMLdEiAILmu
         6xSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713852; x=1794318652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ocX26OOcgyW/a7Ke5hFuvKM7A1eBK7k3voEhoZoCQs=;
        b=krwIJOTehWzdNzntmY8znx9mAh4EPGhoL9Rl1zGSd9HlqSrv6dwnPyg07Ey/jM24u2
         5u7DMxW2uzLP1nee2YmoJTaFNJuoEe95sC5JjjRx5jHnJX4VmZI6YDxlzSMrO/Qttr4R
         Pn9DlkF6x5125kfwzz2I05ko9PGaV3MqyH2AMDyRIpZPgK11FV+GtYqd27MUvoa74dT6
         I29TxC5StP+x9Ldeu6dRlw+niP2YKUXV8mwRBNuQoCpak6eiktwfarBCsg0E91XGVh1q
         BT4M4Io7fInDlfcfS3g8MaUOy6xeU5abp75S2aVY/7WCWJ1khZXCR3aIYuHxDV24V+1v
         lH4A==
X-Forwarded-Encrypted: i=1; AKwUvBzkkZyzmcWfoaPZabncjVp41lC9rvG0punY8ALKzXxDLzcL6k6clA4EdAMkCau19KyXrfVYkySQCjWE5LmJ@vger.kernel.org
X-Gm-Message-State: APuU4Z9mE37bZZJ32K3pU+21wz8F0tMh9HIMaMm8Bio9zGG3oXNaOztB
	LCrYpCieH4zKFkruWgsDlIILe+6nubd92xIp7MkhNr0EL0fDBwSS9hyc
X-Gm-Gg: AYBFou0whB5bdm7IxT4XOdPbpZgyCOM9fIrmY7lWNW+YmnwIZFmO0EOYFoPH9Efgrn0
	uhg7DNEcQxyT3+XmcL6j0V7EC9pkIg3Osw9LSbF7at7GzUh0KTchbSBubNtzFvUaGT3ae3f7Fi1
	5QSDPXeVgrW5rpdpVdACJ9gl3cpq0BGhVP2Xh+3PARgivfG0lUhENFAjicn5X74XEP4BnnyhrUo
	7lsXsOB9hhGpFuRcvqVYna8ti18rMDNbZAmV0ZhU+d3HON7sq0bdKqRgX2kiNdz+rPve1yXYSZ0
	rc9UyFM2CvZHafWtePcapAzpMLxNoSUyVxe4oEIUV1/1dOOrgU2lZz6QfCuSoCl4qSMoEgsaq9q
	XI3Ynz1TRLUxsTN3FGUbIu9j92WaAXyRHjzC+IqtkTdoHf83KfYlxgX/ycLFfwoaIOW7tXSs6jP
	da1veEw41SUd2CtI3iS11WOdAEa+nXsMdFhUPZy73IbAocy5PW9EvBnDMOAXpImbKcDHXphNWjd
	Ny/XCJplPZk8thkgHRC8chYJHUZFca0hREe3FweWN0yOsNvV60u8X9N5DbbBtKC+LsUf6DiCCQr
	40SQIeWI3ygMkHQJlbqcJNsZiqKOr64UftS5UJegGmwteg==
X-Received: by 2002:a05:7022:1113:b0:1ac:9da7:e86e with SMTP id a92af1059eb24-1ac9dc67128mr17912610c88.30.1793713852224;
        Tue, 03 Nov 2026 05:50:52 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm42222184c88.20.2026.11.03.05.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:50:51 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	mani@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	val@packett.cool,
	wesley.cheng@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] phy: qcom: qmp-combo: Leave the USB PCS alone in DP-only mode
Date: Tue,  3 Nov 2026 22:50:51 +0900
Message-ID: <20261103135051.1668-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

In DP-only mode (DisplayPort pin assignments C and E) all four lanes
belong to the DisplayPort PHY and the USB PCS stays powered down.
Three paths still touch the USB PCS in this state:

- The USB controller can exit and re-init its PHY in DP-only mode, e.g.
  across a system suspend that loses power. qmp_combo_usb_init() then
  programs the USB serdes, lane and PCS tables over the DisplayPort
  configuration and times out waiting for PHYSTATUS, and
  qmp_combo_usb_exit() resets and powers down a PCS that is not in use.
- qmp_combo_typec_switch_set() powers the USB PCS off and on when the
  orientation changes in DP-only mode, e.g. when a DP-only sink is
  plugged in the other way round while the mux is still in DP-only
  mode.
- qmp_combo_reconfigure_phy() powers the USB PCS off again when the
  port leaves DP-only mode.

Skip the USB PCS in these paths in DP-only mode. Keep the
qmp_combo_com_init()/qmp_combo_com_exit() reference and usb_init_count,
so that qmp_combo_reconfigure_phy() powers the USB PCS up when the port
leaves DP-only mode.

The USB PIPE clock is not available in DP-only mode with or without
this change. For USB, the only visible effect is that phy_init() no
longer times out.

On a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with a USB-C monitor
in pin assignment C, resume from s2idle fails with "phy initialization
timed-out", the dwc3 resume returns -110 and USB stops working.

Fixes: 896277138c13 ("phy: qcom: qmp-combo: register a typec mux to change the QMPPHY_MODE")
Fixes: 89563a152973 ("phy: qualcomm: qmp-combo: Add preliminary USB4 support")
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Changes in v3:
- Correct the last paragraph of the commit message. Drop the system
  hang: it needed an out-of-tree dwc3 change [1].
- Say that the PIPE clock is missing in DP-only mode either way [2].
- Rebase on next-20261030. No code changes. Tested on v7.3 as in v2.
- Pick up Reviewed-by from Abel and Acked-by from Mani.
- Kernels without 89563a152973 need a variant that does not count the
  USB user in DP-only mode.
- v2: https://lore.kernel.org/all/20261023123512.1912-1-26rote@gmail.com/

[1] https://lore.kernel.org/all/20261102220456.1687-1-26rote@gmail.com/
[2] https://lore.kernel.org/all/20261102220450.1670-1-26rote@gmail.com/

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 28 +++++++++++++++--------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 187f0cd11f6c..f1b565852caf 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4459,10 +4459,12 @@ static int qmp_combo_usb_init(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = qmp_combo_usb_power_on(phy);
-	if (ret) {
-		qmp_combo_com_exit(qmp, false);
-		return ret;
+	if (qmp->qmpphy_mode != QMPPHY_MODE_DP_ONLY) {
+		ret = qmp_combo_usb_power_on(phy);
+		if (ret) {
+			qmp_combo_com_exit(qmp, false);
+			return ret;
+		}
 	}
 
 	qmp->usb_init_count++;
@@ -4484,9 +4486,11 @@ static int qmp_combo_usb_exit(struct phy *phy)
 		return 0;
 	}
 
-	ret = qmp_combo_usb_power_off(phy);
-	if (ret)
-		return ret;
+	if (qmp->qmpphy_mode != QMPPHY_MODE_DP_ONLY) {
+		ret = qmp_combo_usb_power_off(phy);
+		if (ret)
+			return ret;
+	}
 
 	ret = qmp_combo_com_exit(qmp, false);
 	if (ret)
@@ -4511,7 +4515,8 @@ static int qmp_combo_reconfigure_phy(struct qmp_combo *qmp, enum qmpphy_mode new
 	dev_dbg(qmp->dev, "qmp_combo_reconfigure_phy: switching from qmpphy mode %d to %d\n",
 		qmp->qmpphy_mode, new_mode);
 
-	if (qmp->usb_init_count || qmp->usb4_init_count)
+	if ((qmp->usb_init_count || qmp->usb4_init_count) &&
+	    qmp->qmpphy_mode != QMPPHY_MODE_DP_ONLY)
 		qmp_combo_usb_power_off(qmp->usb_phy);
 
 	if (qmp->dp_init_count)
@@ -5087,12 +5092,15 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
 	qmp->orientation = orientation;
 
 	if (qmp->init_count) {
-		if (qmp->usb_init_count || qmp->usb4_init_count)
+		bool usb = (qmp->usb_init_count || qmp->usb4_init_count) &&
+			   qmp->qmpphy_mode != QMPPHY_MODE_DP_ONLY;
+
+		if (usb)
 			qmp_combo_usb_power_off(qmp->usb_phy);
 		qmp_combo_com_exit(qmp, true);
 
 		qmp_combo_com_init(qmp, true);
-		if (qmp->usb_init_count || qmp->usb4_init_count)
+		if (usb)
 			qmp_combo_usb_power_on(qmp->usb_phy);
 		if (qmp->dp_init_count)
 			cfg->dp_aux_init(qmp);

base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
-- 
2.43.0

