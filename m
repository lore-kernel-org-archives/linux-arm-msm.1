Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184157;
	b=2Tn3ZXPl3MdjEW9vZbLwK+qFcKSt4dlM9a340uYIqn808jBXOyGVbGZS/0LTQd0sO5x0
	 6ScgeZMX79z6fQuZVvsItccZpwoDy5KM7NCIDlpFhlq5lrMZ0oPsApnhl02jFiQeOtHZm
	 7lWcnWWBAIN4ReaAyRLPoKiGOvQNnMRv9oFzmeoMUSavtbTOChaBqeu/QEd2VPOn0cs+3
	 kVPZdNRGGx7bDka5i+/qQl9wk+yLxVZNQ2ctpcFZtM5JtSm8w7PeXBSw+RR/tr3LTH6Sh
	 RbI/0BdyGQGfShfN6q9/UXGZdDyEJGgU7xkusB3seGuO1CKkk2v1EktHFNXRBdCMpDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/7Sjl5X8NYVtqrzoL9Q+ErBL/nm7puUgnIagdQ3DVag=;
	b=kmNGmLNXwWV4kWtj1G8+JqmPZmSwYIjc1muV5oCp62vS0oK1TxNofoj7CbV+CZ4TrEgD
	 30I+rLCKatVPOz7AFSj0+QX8Ll3NvGayvh+AjOqRIe3EWK77q3633eJ/XqiRpru2Ryo3f
	 NSwGAygWWIlRez/ssE0AKNcmPhL3Z3KwwPFzLlwmBCmoaCQe8m66b3/gSD8R1nuF6m3Od
	 NtICOC93GKGGE3vmu7OsIpzMK9E7KtlHRwW8pEuzrFSp+7zvJgqFI1+aBsqs2966fMV4H
	 9ud/x9XZoKsX57NCX1C560f8GEY4WG7r6zQPxs7zACNfPqJuw9vt+MCnAZ9eqfiefEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XeHVO1eH;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAB5606A321
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 00:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BAB5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XeHVO1eH
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so2384515e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 16:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184156; x=1794788956; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/7Sjl5X8NYVtqrzoL9Q+ErBL/nm7puUgnIagdQ3DVag=;
        b=XeHVO1eHmzTpneED2NyUHi6QH0SGLEunvqndFg4qax/rhqQtMVeT/ES4fdDAiF3YTB
         ILc5TnUa0c5R1wx7DDLpX6VKiRNuQOoU/VVJ1MGfRbvSl9QKw4fAOF5Lw51dwGeYQ3QB
         wi4c+IMQqigaQl916Xw0Ad58fDMEHwobfwsei6eBkDruR84dzSrIE+VV23cjKD1Wq0Ys
         au0dWvo/sZ9LO//UrJHDYp1H+Do0tB7b0Rlx1GtRJTO/oDOzpOam2Sr+0trDj0XvFS1t
         m/JKtkd7PtVoCWJWOnRM9Vk+R+x/VddsEjWilgWqy+Pi4vDB2igl0gZOFOVCSruYILYq
         AMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184156; x=1794788956;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/7Sjl5X8NYVtqrzoL9Q+ErBL/nm7puUgnIagdQ3DVag=;
        b=cJKO7IzFTUp/aGzJpHvrQ3QrZKQg7ENFbm0D0uxF4sChZPn/eFUjHwLN+exXviEHj4
         YbeVhfkAccxyyaUHgOExY7An6/bHhJgXpUE6T6jtZ6XR93SO4+1u/Ko1o7LySYjLqqb0
         SPmdjHEJRnQsRijBCvfI/jzfJp7O6Opy+XUVSYp01ZWfo6vnuWGcZy+OjP4o35Sgdi0y
         VzARLKuMRkvlXxSFHPf/7PUuDPMQG1vLCPejxZvGAtkw7SdXFLB3icZvbr5oycXIbpCR
         +eB+GPClHGSrIAb5BV8hxYyEYgcIm6zLcqq5XiojzvbiSg/JMv1rG2hDRDfueOSpNh90
         Rw5A==
X-Forwarded-Encrypted: i=1; AL+hErGU9ACMySjB2NTit+po3BtJTqfxcFgQ4SNIxDEcejBcfhnNh5ca2hBADm+NQQzQbXnCsgd0oLqf1HLNE2La@vger.kernel.org
X-Gm-Message-State: APuU4Z9+OEb9Ya70g6rM+u5K3J+9hoA5KPNPBjzLeR/1nP461UpoiZGs
	oVGBpWzSM96mNtolMTzihlbDgNYzjTSoWPka6AX6Xicg1Q3D2B3OZENq
X-Gm-Gg: AYBFou30x8mgdIWi/8YWscTaWhebQSrS8IDA/rQf0K9Xe1Nqn9R7XY8BBmQhnL/QrAI
	0jfklcSfJ7h/TUQWUByZmG/h5Tx0SD0aIihwA+Bz4nELqeefDLEosURD/5UeBnOucx00hSbt+Cz
	Sp1G2BR/dDQl0sWY38JVxJKBiNIyBH16RUOrpd77HlT3GuARByTlDblnlMfY/GrgYJDmNovBLqA
	Nou/UAd+GPhJMgaobPx9v29ZlyrlOVh0oDKX+ReZnRfQkXsv9ot0m47qvAaNWUcfIOGppYhRtAW
	d/+DYKlirzGzcphOL6gYhtgylVy1K8KjtLLMZ1UQ1DTDLwcJMiDrxTfq/XBXVAYmgdT0cjCfYBV
	vounJd+3z0hDdeIe7li7yKesdkUHZukyNCQYhK2m8HDwpKceZDArZp1yu35vRErvtftm50hd1UK
	ZbKxX2RA9vw1uHIVd2/fNcdHsxrIWUMzlXwDczaPPNVs3eOYDtknySZtgOTQVPsdjWEFRWnls+w
	U5Jn20u0MBWAGfRb29BxjETBSOg0kBAYOePQrTx7iU4da+lVrYTigEICB9jtnrByM9MpRLu/rVb
	RB/pUM5B6y3v3o2sZpKicqiQRXFad8GewuvFAm8I
X-Received: by 2002:a05:600c:314a:b0:4a5:26b8:4507 with SMTP id 5b1f17b1804b1-4b963c74205mr50122005e9.21.1794184156029;
        Sun, 08 Nov 2026 16:29:16 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1de2esm91295785e9.5.2026.11.08.16.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:29:15 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/5] Add RPMh and global clock controller support for
 Qualcomm Halliday (SXR2250P)
Date: Mon, 09 Nov 2026 00:29:09 +0000
Message-Id: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANUT8WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwML3YzEnJzMlMRK3eScbF1jMyNDS4M0kzTTlBQloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loA6Hz2LXAAAAA=
X-Change-ID: 20261108-halliday-clk-362190f4f5dd
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184152; l=1914;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=uKIpXSczL5GAI4liZmQ8OnhhHWMDKyKJ4I+wY+f+SRo=;
 b=jsWNwHFjnQup72vwLh+no3Ao6fRtevTWkJLU1Z/hEE5gAg5Re1X1JEkAl9lJnkkO0Q9uKeyFF
 5gBpTLle99/C9THaABeA1BqvXjQ/BbTsh8DHsSw9A3tE17VgISMKKtj
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the RPMh clocks and the Global Clock Controller of the Qualcomm
Halliday SoC.

The GCC has the clkref_en gates on the outputs of the QREF block, whose
supplies are shared with the UFS PHY. Patch 4 lets drivers built on
qcom_cc_desc register clk_ref clocks next to their other clocks, so
that the GCC can vote for those supplies.

Halliday (SXR2250P / Snapdragon XR2+ Gen 2) is the SoC in the Samsung
Galaxy XR headset. The DT changes follow in a separate series.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Stanislav Aleksandrov (5):
      dt-bindings: clock: qcom: document the Halliday RPMh Clock Controller
      clk: qcom: rpmh: Add support for RPMh clocks on Halliday
      dt-bindings: clock: qcom: document the Halliday Global Clock Controller
      clk: qcom: common: Register clk_ref clocks from qcom_cc_desc
      clk: qcom: Add support for Global clock controller on Halliday

 .../bindings/clock/qcom,halliday-gcc.yaml          |   84 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-ref.c                         |   91 +-
 drivers/clk/qcom/clk-rpmh.c                        |   22 +
 drivers/clk/qcom/common.c                          |   60 +
 drivers/clk/qcom/common.h                          |    9 +
 drivers/clk/qcom/gcc-halliday.c                    | 3552 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,halliday-gcc.h      |  249 ++
 10 files changed, 4030 insertions(+), 50 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-clk-362190f4f5dd

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

