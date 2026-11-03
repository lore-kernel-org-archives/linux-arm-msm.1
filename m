Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713860;
	b=5Y4mY75mmhSFMk7Fo/GfVh6+EFpm2A+ZMMm3sefC3B6QkmnS5wG44f8TqK0KyU1Obh3H
	 05TG/tHJRpobMfBwsgL3w11OHLP5BlAIjtf7H514LPybuKDTscud/v+51LFf60y5KBiUV
	 luyh1Ar43FonVAtqfvtU5rXnOg41LNIE9ULOhZ7RTsnbDIR2jMv7Nh2RoyuYyX2pTw4X5
	 x7qc8OA9AAkP3yKGXKaN/4t0rwHwYvPfu0YxsQRsEDAohWnOm9SwdwuO0jDrURrTY8UIo
	 2x4HZ7K+Cp9nEfTzoGfaCG/KbI6FUmd8o+RskkkGFJQiqB4Bmpo9GASHccLfnqlOD8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qFxzkDzUeponfrpyo6AmtrMRz1h2zoLm4IYo0r4huAs=;
	b=3beMqsV4wuq+XsQH5vMdqwNbmi4Ej93r6h857wbiPXKwEP5X+nxjOTS1+xk2QNiA+iop
	 gogTI/LKRafa0TZ3G1vbbz8yl78tF02yBQrOamWm2KDDcRrHNqqqOQbBNgSEq5ZRlTV6T
	 bhfZEN3A9uMFflc4tj24M2ylZWL7bpqcPjDTBVYPqBA7HHcvQ3ANJRGmdDL8Yp5o0xY1I
	 oMVu8XS6dxPHcHlH8to85zZ5fo+Ao3FyWGBp3wYP5jzNGvQTaEpgotwRQO5RLhJcit1pf
	 ZqLgxYZlroMNthGQCZ4J8oO0He+Na37r596BH2E233QEyV8ksplMM0p3oFgztLG8iMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VGTkq/6H";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750F2606EEB0
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 13:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 750F2606EEB0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGTkq/6H
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so5269932c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713860; x=1794318660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qFxzkDzUeponfrpyo6AmtrMRz1h2zoLm4IYo0r4huAs=;
        b=VGTkq/6HkjrzUnmL6Mrm0vavE9V81mqMM3gsqiYoxMFGaSbHpf0BtsFvF9E3KYOjG/
         NtHLXC9tsOh0h/IhvUqUSparomzHYX+4Pyk3/apTGCRE1KJuVWCn8nTOU9BncaJ9J8wC
         Ig+QNcD+cW3wxGaQ/bQwXK518KDMA2xzVLNRvM8Cf0LfySBjah27eCOuFJcne9HuN0yw
         105OTS/dc2YZYA1CF/mIynvEwmKkvzc3jsJFgbIw1r6JSYClha9wTL31COJFKokuwg32
         zRaGlWTvf/x3/xUIrdv87DplV132uCkt72AFpCeLAPSwLIjxk2NJ+NQ8JUkgBo8cAhat
         sRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713860; x=1794318660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFxzkDzUeponfrpyo6AmtrMRz1h2zoLm4IYo0r4huAs=;
        b=SycL3INYqIrwJeUijcUzVQjLIqLhexopjS/ZQrKa7y+t9NxOV8OVY1p28tBFUsHBrf
         bpQgI/yhWmh9EjJ92sUruSk1Klhcxqen1gI52KhsxGSeSQAKrYOijcvJPcydhJWDunLQ
         tD65tvbV1lZKHdRGebJXNNY900SRrPPnDbCPCuAmxKhXXAvoWl5eA7raeSVXgDr0Y7Fh
         Mj407t33UsST4BWXEtjo68u2Wyf0vKVRa/sV3QM7AwBo99M+vAH5j5sqE1BTonO9vp4m
         eU+Pdtd0pwDIBGYGUy5Hk0ZgFakIOf73W02lFI6noin3sPN88J6245SeS7sj+QUoKUrh
         Amyg==
X-Forwarded-Encrypted: i=1; AKwUvBwr67hx4UFDlpxww1PmJ74yeixMAT+DiYUZMveI8zBp5JtOiaSvXcMNsLxr44bbFtc3oMetP7dcxfz3TTHi@vger.kernel.org
X-Gm-Message-State: APuU4Z+HZR1tWVBv1pSY6EtBKJe+BgHw0dx9E6srZGz1SNDckA6/QR4T
	qVMql1j8TWgILHoSLLaQcV4mVJTg1xWb7zSPytQu93nzCBTMXy96Xb5D
X-Gm-Gg: AYBFou39AbF49KAexIPE3Ga1qlmu2NCPIrkw32cmS72LZZPa7egikqQuJWFLwKzaPVh
	f8zCn1+cbRC8bWQhqxOZ92sZ3ksX+tQ0SOAIaWVZlgauC/9Z4lz9KeCfY3z6omSo28dZfME3DCy
	6hvDb42taug4nT1KqMqsgy1EzFjfPckYGft0VWUoTnpwrvDPNCSCvLUBfgYMrrNTTh3RrMgIyHq
	pj6eudVkNymGL4wqpU/iz2PFV/POpGFhd28f64d5HVJTBw192pRszB5ybFrmOcSsSbaeERlv0/1
	LTap6dg1wKSLrZ9XWfX1QzK6Un4j6uhCVbwMsDeK6+lS54K1EVDixD63fO5uq3YzeD0JvoPQhlF
	PStQAL5Z52Gyjl7TDlQkzIqSOGi88dZMyjLrSEshyRgPjmCRa4gNRv390VfC4EZufTvJc/hLEfd
	LfJ0Ov9Ic8Iica1Zui6x2myrnD9L1EniuJ09lExUAcVsu0xSaqtnxBU7elSIRYOGfnCeVV72iNR
	0qY0JNIW7SeP5P3KbC1WJZUZEL56n+8TP5M4MCZ/lYuqiyeC2DfzuuENtLDFmU+ND8fZeHV4gSg
	afM7pkQc7RvStBfgZaJxAGZA1U4jinX+oqb7k6dbzREt
X-Received: by 2002:a05:701b:4515:20b0:166:5552:780a with SMTP id a92af1059eb24-1ac5b028b11mr19358391c88.8.1793713859405;
        Tue, 03 Nov 2026 05:50:59 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm42837321c88.5.2026.11.03.05.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:50:58 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abel.vesa@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] usb: dwc3: qcom: Keep USB 2.0 working in DisplayPort-only modes
Date: Tue,  3 Nov 2026 22:50:54 +0900
Message-ID: <20261103135057.1682-1-26rote@gmail.com>
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

With a USB-C monitor in DisplayPort pin assignment C or E, the QMP
USB3-DP combo PHY gives all four lanes to DisplayPort and keeps its USB
PCS powered down. The USB 2.0 pair still works. Such monitors often
have a USB 2.0 hub. But the dwc3 controller still depends on the USB3
PIPE clock. On Kaanapali the next xHCI reset in this state times out
("Host halt failed, -110"). USB stays lost until the cable is replugged.
Commit f546912bcac6 ("phy: qcom: qmp-combo: Move pipe_clk on/off to
common") keeps the pipe clock branch enabled. That is not enough here.

This series lets the controller be a Type-C mode switch next to the PHY
and moves it to the UTMI clock, the way "qcom,select-utmi-as-pipe-clk"
does statically, before the PHY switches to DP-only mode.

On Kaanapali the PHY becomes a mode switch with Balaji Kalkonda's
DisplayPort series [1]; patch 3 is the controller side for the same
SoC. Other SoCs whose PHY is already a mode switch (e.g. SM8650,
SM8750) may need the same property on their controller node (not
tested).

Related fixes sent separately: "phy: qcom: qmp-combo: Leave the USB PCS
alone in DP-only mode" (suspend in DP-only mode) [2] and "usb: typec:
mux: fsa4480: Keep the USB 2.0 switch on in DP-only modes" (boards with
an FSA4480 on the USB 2.0 pair) [3].

Patch 2 conflicts with Vladyslav Tymoshchuk's "usb: dwc3: qcom: Defer
VBUS override update during system suspend" [4] in
dwc3_qcom_pm_suspend() and dwc3_qcom_pm_resume(). Both add a lock
there. Like [4], the mux callback defers the QSCRATCH write while the
glue is suspended for system sleep. On top of [4] the two locks can
become one.

Patches 1-2 are for the USB tree. Patch 3 must not be applied before
patch 2: with "mode-switch" on the controller and no mux registered by
dwc3-qcom, pmic_glink_altmode defers its probe indefinitely.

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with the series
backported to v7.3, plus [2] and [3]. A USB-C monitor ran over 4-lane
HBR3. Its USB 2.0 hub worked after 10 replugs and after a plug-in during
s2idle. In the s2idle case the mux state came after resume, so the
deferred clock switch was not exercised. With the monitor
unplugged, a USB 3 stick enumerated at SuperSpeed. Quick replugs (under
a second) worked 9 times out of 10. The other time no PD contract was
made, so no alternate mode was entered.

Changes in v2:
- Patch 1: use the common usb-switch schema
- Patch 2: switch back to the PIPE clock in the mux callback, when a
  USB state follows the safe state. v1 waited for the next role change,
  which can come before the mux state (Sashiko)
- Patch 2: keep the UTMI clock on a change of pin assignment while
  DisplayPort is active, as the PHY keeps its mode then
- Patch 2: while the glue is suspended for system sleep, only record
  the mux state and select the clock on resume
- Patch 2: depend on TYPEC || TYPEC=n. Skip the mux without
  CONFIG_TYPEC. The arm64 defconfig has USB_DWC3_QCOM=y and TYPEC=m,
  which failed to link (Sashiko). It now builds the glue as a module
- Patch 2: no change to the role notifier
- Patch 3: note the dependency on [1] for the PHY's "mode-switch"
- Patch 3: add Reviewed-by from Abel
- Link to v1: https://lore.kernel.org/all/20261102215121.738-1-26rote@gmail.com/

[1] https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20261023123512.1912-1-26rote@gmail.com/
[3] https://lore.kernel.org/all/20261022165143.1327-1-26rote@gmail.com/
[4] https://lore.kernel.org/all/20261018143126.3978-1-tvlad744@gmail.com/

Joonhoe Kim (3):
  dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
  usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only
    modes
  arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode
    switch

 .../bindings/usb/qcom,snps-dwc3.yaml          |   3 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi       |   1 +
 drivers/usb/dwc3/Kconfig                      |   1 +
 drivers/usb/dwc3/dwc3-qcom.c                  | 103 +++++++++++++++---
 4 files changed, 95 insertions(+), 13 deletions(-)


base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
-- 
2.43.0

