Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686511;
	b=1tGGdxPCbSWuphnqn+/I/RTNqXInWwdIorhDP/iETkaPSYfGNJwalZQ0nLmItZbqqHt0
	 566UVg1Fcjy4EV8gvGnIfs6eYOTB3OPZSlScKZZsHK9HoXOTOijc5YnSbKEPBnwIg1x4m
	 SqcGgHXhkUgL6OGCk323+N9nhUpMnUTAPeJGBHe5V1ydCablsRetSJfiOGyBs+uAJER9C
	 C3nJZo4ocP0ow6HTfTSLg3VtQ2ANMPqw49FIGTLc0EsePezr9kG8HRnZktzPYvrxoryQN
	 Y1+dwyksbbE/bkeAs/v3uo6TvgDsCo1WB1Uq0moXSrR1lyC7OTGSmGESOF+8VRazFJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2Za6MacJG/4uYb3nMvFDyzid4e9GAP1DjcxkycMoIOM=;
	b=L/QsiPeVs2DCWyBG9tsk/c8PrlbiYnwKFSXnhzEdi8Z9JXnAVJfXdgKYuFLWBjzAibGV
	 AO6J3JnJA+x9i3Pi9WrH896eVXvFx22sdWPQCxFs+AAAl8LZY+4f9d1lV6xWUFUuE58u/
	 vA+2PlvCcK8NBxzn+IZHtQD6KXklvNVh8gkN3ZJA4ICyfjA8eVPhqBmQtuLxFyu8YmoJm
	 zcudrrC9wNRMKgaHbwlOjYxBEI6ILKN8U/EhTXX6wMSpARNDhVaS7BlCACGKBYdVdpwZL
	 EHH1CmESYqAEmyzflG2cKBpFwxle+Y/RNmZiDoPtb+aQF1RWwkVW3jfuaP7m80E68RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMxaLUjL;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEE7606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 09:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADEE7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMxaLUjL
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b24f4b15c4so3075265c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 01:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795686510; x=1796291310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Za6MacJG/4uYb3nMvFDyzid4e9GAP1DjcxkycMoIOM=;
        b=DMxaLUjLA5BlKaT6YX+N2yYET838u0pZcFVXo+fjXewh8keajOCnUP+WEalIa0pm4M
         scCx4aQLbdiRKGI3dAts5WvNvtN92ADRV+PDuZKBKnZte2uCb7aUcwwNosGaUhGfFbou
         /4fGB2k9MpVzhDxUhhd/f774mnw7RoeSuszx/XksflzDlHUMar4VDueO2H9wpvl05r97
         Ds52aKW7qa8CoDQOhKF/FafV+zawzdjTjllz7buM6pwiIQCqs0ULFzR41yvedG+idzlB
         yrqIN192zJFzz3mnlsRxNP6w3qq+ySVLKCM73/zH8wkZ46oihXrjSwEY/SeQNTveXDzg
         VrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686510; x=1796291310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Za6MacJG/4uYb3nMvFDyzid4e9GAP1DjcxkycMoIOM=;
        b=quCzu2ncID3n30bFkFjWBYUOd8A18Og/YmBMvEWelbGW/3WYvk/Dsm4yz1uAncTGRq
         cmbn+um8fmzTUlXqWIfAheAG1nZEfBpIXarttaJy9rZboZZLRbrCrCRzTHq8/DXWKyxo
         QabTrjQrkDjPevEM1fdw5XAllj7jxS6DOZZWWPQAsCWzqpuEz1AJX+2OcIytS1x+JiTh
         7R5vXkRG1+kzjRs4YcDX8HzqttWbrHJVONwzeYyHzSm4Ewlu5WL99lxqa+Wg/KTyq2PV
         Ua+Pr9egRD+FQEj7rvJuET3P3Kzj7uhbQ3yjuPtgffr06v8OWwXuxgUxcDIBWNbDFlKw
         utvw==
X-Forwarded-Encrypted: i=1; AL+hErH+6MG5azexUrnaYN5yqNj3isxfo1IN32+gKAvw7SNV+Rht2mdbWIjYv0Y97lSMyE+zvyvG56j8EwwASQTf@vger.kernel.org
X-Gm-Message-State: APuU4Z8RndRLxNL0R7Dtp2etgdcPSdRaCjEHySoJNX2QP+14kjxIPUuq
	bv2GcrHSo1mAdHan6jFhSWWIJUqN0+zPMT7s97ifkLUL9+7v7Tq1A65U
X-Gm-Gg: AZFdTZc8G6qvWOGhYEsStsAys+FT8OuxDNq7/HlHHZmmh9RmJ0v4K+ic9cZ2Qksq/k5
	qDJLYJM1hx+ZUUNmi6koE1IXqIAwSLuSjuuFx4YO16sOgIyp4GI7ixQHV9FDCKxulYFGDdb8GwY
	lj3L8YcuySw52VV36WsS4OT6fmR+tt2oSUST85wFYsKJyGlKJnzueoXEG6bJLtvq/WniC7dyzNE
	CNV+mKSnBKC/uK10jUsX4fWsmWhS6vxJITPrjKqQtGbtcHelh45YrLbUYvYn86UGw9BEENV8Htc
	ISYkvJS5xNTQhX2NMvC90/GrQP91asdtIusb8biy97EFP7KQwo8gMvIoR7bY37oG/amcw0Km/+7
	nJyYbTt0UYybiXqWXl6UvtikppvqUhd9fF/clc0/MDWWolv9saW4Mn5TE7p++oCiYDoS5ZUKZW/
	4TZYBJ12rzsylQVZnI+vGI2kbsdqfhIvCx6frpokuK22i1MT2AwRTCPy88L6epO7b9MyDM98MFz
	HK+NoOSlgwW2jVwGIiKJvuAm7zNSeY3V4e6ql4JWyWIfxDV4ePVjsJuh/1LLLMht1F46kRGTSS5
	Pg7amPAqZGeVR0qTjWQ0EU7IYtKVwFk5kx/bsyG9Rd42gWpKAVEEmez3RwZtRvfQmiMCQzMxTw=
	=
X-Received: by 2002:a05:701b:21cd:b0:1b3:be0d:696c with SMTP id a92af1059eb24-1b5567e661emr20009355c88.1.1795686509781;
        Thu, 26 Nov 2026 01:48:29 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:ad38:eaaf:b00d:c452])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm71781172c88.14.2026.11.26.01.48.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:48:29 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v4 0/1] arm64: dts: qcom: Add Vicharak Axon Pro
Date: Thu, 26 Nov 2026 15:18:17 +0530
Message-ID: <20261126094818.77473-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Add initial devicetree support for the Vicharak Axon Pro SBC based on
the Qualcomm QCS9075 platform.

The board description includes the debug UART, UFS, USB 2.0 host with
an onboard hub, PCIe1 (NVMe), GPIO LEDs, GPU and DSPs.

The compatible string was merged separately as a917cf9dc0e9
("dt-bindings: arm: qcom: Add Vicharak Axon Pro").

Changes in v4:
- Move the PCIe1 PERST# and WAKE# GPIOs to the root-port node.
- Describe WAKE# as active low.

Changes in v3:
- Rebase on linux-next and include lemans-embedded.dtsi after the
  platform resource split in 1f90a2bab7f6.
- Drop the binding patch, which is already merged.

Ajit Singh (1):
  arm64: dts: qcom: lemans: Add Vicharak Axon Pro

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/lemans-vicharak-axon-pro.dts     | 517 ++++++++++++++++++
 2 files changed, 518 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts

-- 
2.50.1 (Apple Git-155)

