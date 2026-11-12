Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483563;
	b=al+PsFPk2Qu8VqXtMBHiQadkcrppIfwi7XAFwrRUm4U7Pfp20cgk5VwB7p+J8++7xSSW
	 oMiOJ7DjCDj49hSYE09a78rvNg3vI19hkwc3x1tCNkgEp7nNM/qzl83kgGWGMhnZ2yqNB
	 34YnC9luebgboU6lT58kRORDMNakpj+ijtyHYiWV2LqacKX0M6rSrQc4MvDcy6SEA+7yP
	 m6o3e+ZyHL+Gm2MQ1ptY46OTZDMujxIDqbugvrcGXmWobjUstlbwD620S0cAAyoxupXkr
	 2sSgiC/+c/Tj7eROzFXcxt+BUV9Xl9E4HmqlkINuimVN/K2UCFjfT1b7tlpjg5xYzKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z0idzHJpOPMEmuTZcMJ9SVqFYTY6Bea8g7XD+5xn8cg=;
	b=ZcBwnyNta4lAvTGOVNT88Wihgf50MHhHLayc6hhzHC+7bXptpxF+hADqo/SpUbRONYFG
	 tRiFM2azx5YwpMTIgCt7BQz0QWkpz7JbxSg6b/KlnmoHX514f4nV62zI3lPbrVrfyM1KQ
	 6TIWikkdoKX7uFk/V8GHL15Hxby+hRBXSFAx+mTyqObZh/ZBi3j0TF/Vf5hyklmkslOJe
	 PP5mNlV+Nlx5E8YH0FRbVKVs70zkbYxzfa60xspHUpx1aCS/q6gFWJ3g65khMR5MzbvyV
	 c/NAsWYZIkv9auGppJMcmgpT0ILGiyzI+hRCiPpiT/wwH61XfoZGvhA/g4PtDcrkr7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQiQiMkQ;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA7E606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EA7E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQiQiMkQ
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so8216008eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 03:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483562; x=1795088362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z0idzHJpOPMEmuTZcMJ9SVqFYTY6Bea8g7XD+5xn8cg=;
        b=ZQiQiMkQOMcVGamNhTE25y4QZhUr1Nzg+7k7wGWjxsMBIIbCY6AS57Y8BdbW9DIxFR
         nYAXRq9XpFzD4MQm7ApOAvu89hlhWk0j5OYGoTJUk/JFw7cmlJyCYcqO7jJ7CGUYajRC
         j7cKFW6RwAJGofo6DngGt7TCaSVIrrqiUAlqHVBRInPkWDzFm3Xv4GFEBuTnpGmGe9my
         mO4ylqh2Eh2UsGyqD8obdHISoPOVBNkDEGHNP/Y/W9N04KEzWHFW+JM5zEd3YOnnRq9D
         tPqAzJ6fORiWnvK1oQqaWm9QMsleWIu7ycLWcTvyNy0GiGQBGo0Y3R3S5MTTxK2UTnHu
         SXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483562; x=1795088362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0idzHJpOPMEmuTZcMJ9SVqFYTY6Bea8g7XD+5xn8cg=;
        b=1Zal3L3wa1QXVtrIYZpGxNLLI3KwmkWJRXDwWEwXgfYD2EEe1AQE5zVWaJ6ydRmaOR
         pASDf+6yU5N8CPdXbXk8OB01V1BD8DQgFxaSNuqKDSBnCKlWC80zduyHWBdmtNGCcMTp
         weRktvSQaDwR44LVYbqRUjgHjK+oZrh8M2DNod3aafGUnvvz+ZuVdDgUiqhN1hsAH41d
         AHMjqlB0LhsDSFBxsd6lkkCliePVybs9dyBJDVtp2rmByUGaWKrCOHPJNlmQW51t7dVT
         eSI0xYj38wkZjdyA1FrggrHnVTQr7DW8U4E7eH/m2gzTUk2Dz2PBXhsZ+SL2TKgpxio1
         mV3g==
X-Forwarded-Encrypted: i=1; AL+hErE4EB5BsfkkPTcbZ+5wbvOdM8iUdKmlYlDDGA724v/smFJM/UWYpjx2bWHYMj+rhBDlI+rLmhec1C0t4H4q@vger.kernel.org
X-Gm-Message-State: APuU4Z+zzQcWp+gKbfKwy0Hy8qV7sy8RYWHUEpbM++i7S+2mvP4YMqTr
	z6gs1oUr97d0mDsGjZp5m7UH5SMegXzUieAE/B07Wcgnjo5HqlrZdAly
X-Gm-Gg: AYBFou0ozL4QCST9FBHljqE/qn7darbcZdCMHLHoyTossZsozaTbOcRMubNRKXDpsx6
	OyXFTRLQliQivQvv2Sosehhc81W3lrlVKI8KXq4OpU0konVv7Dv61o6NL/1tZUdG56YMB1AIten
	dY8AdGz36JrXGFwVQ33efyXTCr7mf/iK6pXgk9GZ3CD4aoNYuVRQYB+FL69SWF6RflTXbN0nLXt
	B1FcYOe6qDlMD4rRFMFihnUcRySkLycV4J0WoAYw2sOklom0eceB8Y4LAIgsRFM6P4P99J1/jGi
	0120EH0Oi7Sn5ALi7rY0LTCcxIU5kjXIgUnHNprEgsgKey+VsrmXhrqGntuDl8LccHi0w32JgGK
	vt36Ne4dD62oV5eFeV8613/jTMS/K8SI59getbcV6/4k45oIGZYD+Y4icX5ASZhGSm0SfPHFeYJ
	cqiRQpOoLlXOcTJ3E3tm7T3ptGd1pg/mh77JIV1kTO5wc1P9l7ofafmlv5H5B2CltiXNyFI3odr
	DXwMmox0zrp8ew2QkRi9EfjwXr8M13BX1VXRdLsbh5Em7dKw/P6EwjBFmazdWylAMAbSbP+3LHq
	ci79WETTIKJQkcrzseLbu6hYAQgvAGiBkpV4YGQzofDOeXnEib1vpSTvyy9iNP0=
X-Received: by 2002:a05:693c:8642:10b0:36c:9e26:88b6 with SMTP id 5a478bee46e88-37685c7a32fmr6157941eec.9.1794483562280;
        Thu, 12 Nov 2026 03:39:22 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm28352798eec.17.2026.11.12.03.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:39:21 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abel.vesa@oss.qualcomm.com,
	abelvesa@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	balaji.kalkonda@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: dts: qcom: kaanapali: Add mode-switch to the USB controller
Date: Thu, 12 Nov 2026 20:39:21 +0900
Message-ID: <20261112113921.1143-1-26rote@gmail.com>
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

When the USB3-DP combo PHY is a mode switch, DisplayPort pin
assignments C and E put it in DP-only mode, where it stops the USB3
PIPE clock. Add mode-switch to the USB controller as well, so that it
gets the Type-C mode, moves to the UTMI clock first and keeps its USB
2.0 port working.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Depends on:
- "usb: dwc3: qcom: Keep USB 2.0 working in DisplayPort-only modes",
  which adds the binding and registers the mux in dwc3-qcom. Without
  it, pmic_glink_altmode defers its probe indefinitely:
  https://lore.kernel.org/all/20261112113838.506-1-26rote@gmail.com/
- patch 3 of Balaji Kalkonda's Kaanapali DisplayPort series, which
  makes usb_dp_qmpphy a mode switch:
  https://lore.kernel.org/all/20261022-kaanapali_dp-v3-3-b5ae8e6083c3@oss.qualcomm.com/
- with dwc3-qcom built as a module, Yongxing Mou's "drm/bridge:
  aux-hpd-bridge: replay last HPD status on hpd_enable", or a monitor
  attached at boot is not detected:
  https://lore.kernel.org/all/20260803-drm-usbdp-preboot-v1-1-2539b362be00@oss.qualcomm.com/

Changes in v3:
- Sent on its own, split from the dwc3 series (Krzysztof)
- Subject and message: the controller gets the mode, it does not switch
  anything
- v2: https://lore.kernel.org/all/20261103135057.1682-4-26rote@gmail.com/

 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..a06d5d867488 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3941,6 +3941,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			tx-fifo-resize;
 			dma-coherent;
 
+			mode-switch;
 			usb-role-switch;
 			wakeup-source;
 

base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
prerequisite-patch-id: a793fca7329dac964c21459f8d7a8b003d36d84d
prerequisite-patch-id: 0f4b3497a5b65f978f8ee3de20953e111d9a4721
prerequisite-patch-id: c6020a82fa07088ac3e07cc89d3059fff044d39e
-- 
2.43.0

