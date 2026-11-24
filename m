Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534172;
	b=HEkgznpNg9Z4cwWmHwPvpUl3D2lDjy1evQPy7T24e4TXgi9/AqpM/NYlhskPMKcj++Uk
	 jSSCIum8K4s53lVAhpJz5uuhMfzo+2mdUyD229Z1D72X6hgOirsrzqs9PYLVQD1Y8ss+n
	 Hectg+oU9pduh2jrZRICVKxw9vqWMazMp2ULq0tFOmWqdbGk2Jcgr3OQ1DHIEOcflDhuM
	 J3HpgVNTETTiER5tjU/isu+I02sVSrE/O+4sXzuXhR4L11JvyWJxxa/1516exI7wXGXGo
	 8AmY5GNjwrufWS14B8+KQRi8HzAKLSRbFuWtF4Vs+5DpkgejR6Uocmp9412oeAwNepg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8tLbVEeC13kOazgUWlOjd/prAO3qeJSqezX08+mwwAo=;
	b=lxnDwHz5V84A197nLHN61eSVIQOrcLujpBJtLrFO9R5plmR8steYC3bMUw676awAgdb4
	 Ncd1bzRJhGWqNasxrDWHIARZFtL7qjC0BSX8CqBkHXUTcriy5vuBxAISmKZKQkR5OHC8l
	 ZAQvnIKxjwxIGzPn+EUe/L3DEeI0y8/GMkzgXuRt9/F3kETnVXPHqCHeIyFfc8KgZP2jR
	 311jc2odPHefP2cybjghxRMC/hqP+h+KDwhOIOC3e9FsBJdtEfhd+P3tQ7pCNSw108A+X
	 hFM18Ytazka7ZTybWQOUIHWkP14Hq77O7f8wRyRDrHzkpPpLtCdC4yDxK2nQhx7cPSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESB8LODa;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63E560A261E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 15:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D63E560A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESB8LODa
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50933bdf4bso924514766b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 07:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795534170; x=1796138970; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8tLbVEeC13kOazgUWlOjd/prAO3qeJSqezX08+mwwAo=;
        b=ESB8LODa35Vf5EcyPsyzwx5pgl/mMKWV85vMM/1+lenyfAOt7Bz0Q0zY7FjolGmpzF
         YMNP/J9mTqdTFQTAhTBC7jljpZ9TjrZbBCd0tK/xddphcbcZPR3sT0Be1DVddcCvG/r1
         SY6tklwyNsafnfzBjy93ZHI+FYsPBss7I9FHT4qEZuO+p+cIy9a0IbRS7QhARwKsMTZ7
         4c9Jg1moj8o9x86oVfV+4t0cqOWdJWcl+5AW25mtQvkei41jvhOHl1A72nJk9ftdCcbd
         e/cCx1xCkoGCUN+/j8eH2tspcmYxodWCUPHko6eZYfoW7hoqrxR8GwvcQR+HU+RGm7Rq
         F7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534170; x=1796138970;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8tLbVEeC13kOazgUWlOjd/prAO3qeJSqezX08+mwwAo=;
        b=X8GIFl1QkzsQ48Q8aEZgyFppttUtpPwHGEkQmt25UJ3pnHQKNKow6PxA/TzNvza51p
         oACaufkFUsLrOhOQOYRzgkzDOWhGmpgSwesplLAXFivRcQEu4o5OvnQ+76CPSRbpTPLc
         S+VDF8BtKRXrh6JnzcapdK5DD7TKwCUu6ZsIU/A5K6Fwq29Le0ssI+ulYe53nnxpBRqj
         FwquAZ43HSp1I2sFSAqmeGkPkiHVwDMM/KuYx9ea0ZQzw8KwG2I0Cd76CIfwxVpJNh1k
         G8xn2AonwLJ/vwJORBe0WsmIcuhwbxeoqkhbtFfFC5ij98w6I37bZorjN0WM2kdG2JC0
         QKlw==
X-Forwarded-Encrypted: i=1; AL+hErEPT3fnhsCbFvlBVnGkwNVEtMfPKmQPZElZv8zSDzUlOgtBB2DYVWhT9KECXh2y3stFPfCwKbX+kP4mFSrP@vger.kernel.org
X-Gm-Message-State: APuU4Z81JulZt7WFRBTzpLQxTXZJNiS+YZBq7sDiHPu8SZDk7oHG4dDl
	kfhWdJzX26IZQEsDCgU8vrxCvurU9uRDSbDN/EHiTVns5AeHUJMuNt7f
X-Gm-Gg: AZFdTZfrrAurHVY6Epo4mu+s5uNfeogZh3QrHaj+5sH6K67qCCLE76Bik1iI8YwMKfi
	Q9fligHdDZFcwTSO/PmU4zK3Wy4Xdl01P3xO4/F4kT2N5Rroq2hBtzwU6HFAGuchIVS/L8Eb18v
	mTeqIJ8FyCzVQgd/yLKTu7pnoKN7XJ1KW/Bq82oRlAkrUdtKlSWt+93j/+B59g3TPEncYqLeiKS
	unig0CKgqhRBKiaUKWQNRp7DQYrYl1/dRWmTCgYblpFGVhbQkXQefF6GINkSXYdyW5Bfu0QLEbv
	Y/CciM1qLtySQ9EVLdqnFQUIHXWRtC9VkCoa7vkCI43TTE5cjTzW+dOoMXmSQdy9yMNWzpxsra4
	P70ozoeIPmIJJKI3oQSQi2YDbcNxvDgwOUCql+SZMyskcWHIOdDpHSCfXxS/jqmwwwf1sYEc2pJ
	wZX7df/AcuSV+BnDtEV4nS+8mMxg5Q1D1lxSiBz1vvlkTP3uTvNNnTPcr738xhJ0dTM4w40a1bD
	SOcjL3EbpBzsp26si7pWpr1sTS0vOwUlt/brmUC3b3cZ17S+ZwfDUyqvWYWGcSjxoKtVOaqkLG7
	Fn5/oIrU4+7ZnLtf4XtmUha5pCmXPrXVYveU4g==
X-Received: by 2002:a17:907:2d23:b0:c40:2439:4d9a with SMTP id a640c23a62f3a-c51319c24fcmr1434115166b.28.1795534170279;
        Tue, 24 Nov 2026 07:29:30 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad026a4sm540425166b.2.2026.11.24.07.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:29:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v4 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Tue, 24 Nov 2026 15:29:16 +0000
Message-Id: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAEytBWsC/13NTQ6DIBCG4asY1qVhRqDaVe/RdIGASuNPA9bUG
 O9etGliXH5hnpeZBOudDeSazMTb0QXXd3HwU0J0rbrKUmfiJshQArCM1qppnFETHZq2pSUKll5
 4fLGMRPPytnSfrXd//HZ4F0+rhzWyXtQuDL2ftg9HWO/+7fzQHoEyqiADIzgC1+ZWtco1Z923Z
 G2PuNMgjxqjLrgxgqFWwPGo051GftRp1LIQIK0oUeZ6r5dl+QIOYVJOOAEAAA==
X-Change-ID: 20261108-halliday-tlmm-f250374110e0
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795534168; l=1775;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=gCYQs/30s75gOvGg0mt5Y5EZUj0bRBXdi1OgnGxyCjM=;
 b=DOTlVjHNhTZyfIOMSm753f9p4pgPiVLI9TU5wLjeUxJcXQiyhzmLx4wXDRguUIG/4/lsho8Vk
 eKeoshsCGzWAEoXQQjXjTC347ci9toIjPkHmwaRpgSZE1oVxF7dvecJ
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

This series adds the devicetree bindings and pinctrl/GPIO driver for the
Top-Level Mode Multiplexer (TLMM) on the Qualcomm Halliday (SXR2250P /
Snapdragon XR2+ Gen 2) SoC.

This is part of the initial bring-up effort for Qualcomm Halliday
and Samsung Galaxy XR.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Changes in v4:
- Use MSM_GPIO_PIN_FUNCTION() for egpio (Bartosz)
- Link to v3: https://patch.msgid.link/20261124-halliday-tlmm-v3-0-6b516e5f269c@gmail.com

Changes in v3:
- Add the egpio function for GPIOs 185 to 223, which have EGPIO_PRESENT
  set (Bartosz). The binding gets it in its function list.
- Use the exact PDC map provided by Bartosz
- Add the Reviewed-by tag (Krzysztof)
- Link to v2: https://patch.msgid.link/20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com

Changes in v2:
- dt-bindings: Add the tlmm label that gpio-ranges refers to in the
  example (Bartosz)
- Link to v1: https://patch.msgid.link/20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com

---
Stanislav Aleksandrov (2):
      dt-bindings: pinctrl: document the Halliday Top Level Mode Multiplexer
      pinctrl: qcom: Add Halliday pinctrl driver

 .../bindings/pinctrl/qcom,halliday-tlmm.yaml       |  146 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-halliday.c            | 1840 ++++++++++++++++++++
 4 files changed, 1997 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-tlmm-f250374110e0

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

