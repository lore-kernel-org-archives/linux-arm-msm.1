Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656283;
	b=TjLH3HccahyNT9TJXezPpBgNhAMgjUlojZKrRQxz0uKGKh0luzZg4xVYY1k1i797TqVD
	 sD+4nG8nJf/ztbkrJLRaqmtWIx/wFZ74HMVDC//oNEcRNV2P6AwP52WiuvhnL5/QVjixT
	 prAp6/SqIFZd2OhqGJlDkhR6KMzPJzMgYtnPitkP0USvsFoj47vkaxtt28Hu/46n4gmCK
	 rAl3mwcBMfUEJs9NZuKrbE/Et8+ri7Qdnxmiq/ierSyfKv9JDWjpKjreGaFl/c7VVd8Ke
	 hxHRPL/8eOv2MCJ1YrOEWttGEQWfn/lLAoSOobRuuCw6HB0NcjgBybF7TxQlqdhQkbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R0nY1ks3pmMRcLszXh/y7KBDidGoFViijWHtZfB9PJk=;
	b=lfd9xGMLM2j/Q8xxTRIc1C4mjM/ct8qluzcE5CQ/riAKHwn2Os5d+lRpIGMLPE7eKQDG
	 PxppJ4Z7Z8a+Zd5PpGTsP9jwxyvfH8hlsbHtp9g0EsHeyeF82EFczVaZR54XblJ2iFBIz
	 NSv0fPcA/48TkWBxvY5hT6R7xJ7bgIem8ZzhNrm+3GqAQK0DZwLPcJSTJSoBnLA+ZZUAy
	 YmxKvFemEcTbY9UFyKCic9ASKQwx1nAa/Q2BlDRaDgTINoG7A9MFaKlgiIp8L4+Z4ZW8C
	 F28bFjWknE4zLuFpCU/Aku81MF49HnYeOmD/Om31uwVfKIFjiCDnEsLeqP65VccOT0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yIPSgz9S;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59498606A329
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 21:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59498606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yIPSgz9S
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-353804b591eso6194059eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793656282; x=1794261082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R0nY1ks3pmMRcLszXh/y7KBDidGoFViijWHtZfB9PJk=;
        b=yIPSgz9SFEJv+rp6JQbEYIKq+1PnYQTT4rlAaYvSXk6jJdxshzZ1sZrTrYPV+R/RQA
         n+bwivnn7eEmfNZnfcn5ztN1xZWK1sG5xmBEPIl91L52ClHTvFmfUWO1ebGKl8Zj6hzr
         cOE2zX4+78r9Zd0GPPg+gRk4eeUJfytVjb+PuxIo47pb7r77ckvWfj2S7G9ByfTlKPlL
         mjGzmMr29v/2OZPtVBV3L4hYXb/IYPfKs+dz8omiIFYp0tZoHWXRxSU9UI6hj6dLYpdH
         fAiCnsezSH5mF8kujYuK0CbQDiIjK+12anPhBuGoIT6t9huA0iKcF0klvr0bcQ/ZLSw9
         YlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656282; x=1794261082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R0nY1ks3pmMRcLszXh/y7KBDidGoFViijWHtZfB9PJk=;
        b=eUt3wRDfUsTYwwhGmwYf5OlIsCNnDJ8/kDAMd4VEsMHCka3XpKSpUgCNefaumtkLno
         Um3qff0C3Jg2D+Tw1FyhoH2jlPSnnl0tv1Wdd0zUWMiGs8Djauhl5kU7AhlzW4TU+NCg
         fwPMa2isccxJnb7Quj256D6F6kIEYku0xpsS0tqR3S2PVM5T5xlCs1yn1r6sx19HOeG/
         DJqjekg4W1zalkXFoVs/7XLd3Djo9rnIlqNWrvIi96XjlBh1cpE7Goypzc8dNsGiUNBQ
         lP4fN6sqlhmSqRaaI7qtWzm7yfHmEejnjh+9rPWUzyFFaVw6KOrQMx9xwedW3gF5isqg
         6fGA==
X-Forwarded-Encrypted: i=1; AKwUvBz43g2dUp3KHIHb3UaJMFGqRMkuQj1GuiE+hTvlRSKwElEvApM7EeCBUMo8lp3xDcRkGnl4m5mHho9NNtcQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/2g3SGIPgSWf8Btli8KgbdUmia26Q0aLaQR1DvvQQrhM/fN3oh
	B7i4DlwOPBENl2rFYpeD+uuh6rL0+mEdJJ1ORG/hFCis+cbDDZw3tS4d
X-Gm-Gg: AYBFou0zgfcAvv64hi2XG8l4+ITNmGIoKQJHziwUHe5CradoxTE8vR/lxSVwvx4wdw4
	PVzW7LRsArTSn5xSlnBf+1Oj0QwdkbtDerCVMcTGVT4new49F6IHDJ/JUBrVTpChIQf0g87wLeP
	XPaZuvND8QbDfELq2XMCew3eyjBmai0I5SsjQROCerHUTu0xJ/C3+vvbnTZ72kCU5ZyKqrw2BYg
	/3kNFU4scB7y05AnBeDTY0/uWp+X9SMqy8NFe8rFI70nUjFwHJCsPrHiS+YnsThzw/IjRAywiRX
	6DbxXl7ktr1y3rMjH6IKOyYHOqgggeiuh/6nBzWMe7Z8uGA8PjqYHAik2qyy2oDOKpRSdg0f5h2
	N2xiosuBxVXHHzc+Vh9skQswrCgUjpJdO0XtfjCOSq+msLI7QgO0/HmRQZG7qQZhYFXgIJlAvKE
	uzg7CcGEvvtuwr3VM0rgcYtEdM8Fz8t39uK2Ho+QKX5AlP9psstIRrACR2Y+sqxFBDCzVNHbSaL
	KnzEAltEXMGE+f06wTuEGkGzzYCr3p3L0Ij6p8IUIRsGH6+eQDIIkARLiHP5neSLyMnSztavHbK
	RHINq/040ctZHVEDKdavOpG04kSfZlbTO42q9kFw29qSxQ==
X-Received: by 2002:a05:7301:e105:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-36a42345851mr16471850eec.13.1793656282280;
        Mon, 02 Nov 2026 13:51:22 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm54710712eec.16.2026.11.02.13.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:51:21 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
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
Subject: [PATCH 0/3] usb: dwc3: qcom: Keep USB 2.0 working in DisplayPort-only modes
Date: Tue,  3 Nov 2026 06:51:17 +0900
Message-ID: <20261102215121.738-1-26rote@gmail.com>
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
PCS powered down. The USB 2.0 pair still works, and such monitors often
have a USB 2.0 hub behind them, but the dwc3 controller keeps depending on
the USB3 PIPE clock: on Kaanapali the next xHCI reset in this state
times out ("Host halt failed, -110") and USB is gone until the cable is
replugged. Commit f546912bcac6 ("phy: qcom: qmp-combo: Move pipe_clk
on/off to common") keeps the pipe clock branch enabled, which is not
enough here.

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
VBUS override update during system suspend" [4] in struct dwc3_qcom and
dwc3_qcom_set_role_notifier(). On top of [4], the
dwc3_qcom_update_pipe_clk() call goes after its pm_suspended check, as
it also writes QSCRATCH.

Patches 1-2 are for the USB tree. Patch 3 must not be applied before
patch 2: with "mode-switch" on the controller and no mux registered by
dwc3-qcom, pmic_glink_altmode defers its probe indefinitely.

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with a USB-C
monitor over 4-lane HBR3: the monitor's USB 2.0 hub works at boot,
after replugs and across s2idle (tested on v7.3 with these patches,
[2] and [3]).

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

 .../bindings/usb/qcom,snps-dwc3.yaml          |  7 ++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi       |  1 +
 drivers/usb/dwc3/dwc3-qcom.c                  | 94 +++++++++++++++++--
 3 files changed, 94 insertions(+), 8 deletions(-)


base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
-- 
2.43.0

