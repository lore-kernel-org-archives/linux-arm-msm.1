Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541546;
	b=nUDXYR0/5/262aVQCXkEFNA2l5Yy8/1ZlYt4/LK6nW7zi5NoQosC64A4+NwvM3hyPWCt
	 goRV1sGMH2TtM27FChuDPXvZMuknqY0yWwkKxSLI/Jc1CKfaGbDDoxAss3AVKGHeW3zSv
	 70B3ZaRvCSdHxeEAXY5gQAFMzYJ2LJQdmjvzEXvZJMn0hqzMGDY7fBoVCMIF2cTNEhJ6t
	 7wBHNS0OyGpFHUHu+gpzXCLAOLb3qC4nGj33I6FawjC5genRzgdsCkxLltqHiCGmeJZDr
	 2pxXprnv/TcDqmOHfk+i5qpWajg07mWL1g19tThEJCMjeh1mLRAhKiANksaDCHRIY/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aQPrSDUxid3hTnblfq2igQmpuDYP0lgjM0zpbR4xQUg=;
	b=cL7M+GgKnTFgvu4J+U5sNSzzWMJulzvnREQTM9NAMNZbLc9dN032nAe98v2Xkp4mOsNl
	 cLtADI6L/GoNm48Kz3wursMOhPR74NXFiPqUOx9HbQMJLV2bdwU4V2lAK/svphqRIsD4A
	 5YaiqO7d1M+9HdRS0/qTJwiJvzSAFS2GcHQMVrpA9Fr4lBHw05hIwLKq0OZCITCgvC/6/
	 6tQ5oKFKN4Z2g9AG0QI0c7LWli8zpFuYfRmcL4Adgyu31wENECcWj05iLsS5zHK6/w8rC
	 immeZI6nvjZ1bb+TeswgQ0FVnGwzXeNhpbPpJmde4PWgIn9nzANG+4AxoJ5OqhD4iJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FVeRQcOZ;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D957606A6A6
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D957606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FVeRQcOZ
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490f38e9688so3413047f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541545; x=1796146345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQPrSDUxid3hTnblfq2igQmpuDYP0lgjM0zpbR4xQUg=;
        b=FVeRQcOZVp0e3u0B/vfbnMqSA+FJJcZKt8YasTolEiHjgLPcPxm4+4Rp3zA/jqVV7j
         Zf6ymi+BfBABlJraptf9D01xnojtkDaXppBdPAhq5kFf7+/UUaHkwGyXs27G1xTn6LCH
         JF8hcyFjnKAHHDvPhXiPxnGOxwsxKM9f9MRF+hupX8cym5wt8px9Wn92s6gdVR96kgUS
         wIg8UA22rjEzXFraJQUjjrQ3OkhC9CA/4WTnu+Zv/Yjh/brXqR1WSRGUVLnpHPXccIu9
         AxKNRB0eGbchsPpBZhdA75W7ewK3oPIPUXcRo6BhoYrzE6qhNnfJ3i2YZu6agNop/J3s
         ldGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541545; x=1796146345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQPrSDUxid3hTnblfq2igQmpuDYP0lgjM0zpbR4xQUg=;
        b=CMHRuyUTCwCa4CN/y/ZEU/OZB63/dJYqYf3mzbnSAyshnPpjaenuf35+vC9Z9vV7PN
         q5dLvFGkjdCV4tnCj5vruQULqMoqDhYkfpNrdXkm+XwLyAftR0Ba91begBRUgVSXUG9t
         MXUnrKpeFyi+FXNRQS5YU6HAbEAXJzd5lbbJkIzAJxhbnReS5hjD7wjfJizAMCZwGXD4
         mSZ8wPxQnFs2jpLSD/CfpKKpyaixozOsgR6AwYzhSKi0Bh4Hf0DtwosIIdAL8k43yrGP
         arKg+d2MMr+Ha4YnlH+9/OxLHv51PffAjdOctdB8bzqPO8tPNdZuChbGVPs3vs0f2a7G
         NZDQ==
X-Forwarded-Encrypted: i=1; AL+hErEWD45CX/JMcmuzQ2EWt4Ubnu7JQplS9LxukO1nQctXIpufxdaCKCSwvywJM6k3yX47GjXuRfg7rHvcwHFa@vger.kernel.org
X-Gm-Message-State: APuU4Z8Gm/vAn9LuR9zVU1au1jITGu8LOSPzM/CBY62NbRgsQg5Xzrme
	+yx4ZXGUo9tAFrpCJEEAPA8V5zoJEHEJBSko3erW98S90jmMcs6ff5hxuwX1KrQzOkw=
X-Gm-Gg: AZFdTZepw4ySjcBHsKRuKb4E3asdmtmhJwWqo9cjiRB9oKUNKhgqEje8vr59i/cgeaR
	8eNgA0RMOTQ/lsA8NSjeNzmacv14wwTQbJ5b937duCqnnJJ23Ry8JS0H1+fYPd0WiTFkj6+2qLY
	Xm+bXhKMFM2uRjLlsdfISiv9GfyXC0YsD686XTrEql1eOkZsjiWZTIOtKCnSb8gcYpGGv1DG4HC
	9nqWWqPTGXiaDM36+bkx0OYHBZCDiWTewqvfXySWnqQA/IaTqPPWgrwEIqkm86/K18KzUEyN8St
	1V6DwC5A66j+/j1gu+qnDoZ8rl68F0dpjqxdKA9p8CHLEIwhCOz6yKSZMEFlXPguoh8jKzZ8xvL
	kDu3RkKJwuJr/NVQwqpoTFImkTV8xJFRbciImNGK5nWmXhjDSSY6fZJLot9F0BhgWoWDl3McSri
	qTAyTX0Sy0RDDnSDMWpPQVuH9SJO889lbklw2/9suqXuXehQ36vPug0TcFrh1gEei3SjX6UypAv
	w8t/1M944SCAlA8kW87A3OY5yuW059xcjWsGzfVUM3vGQO50zrlJpVBx6N0LEKodU9w0OsDuJLs
	BpwmWNv6A/7JYpu7wBKVtLtTugtwDItlwWJikDfh2VeP+i0Xbg==
X-Received: by 2002:a05:6000:4028:b0:4b7:6dcb:e909 with SMTP id ffacd0b85a97d-4b76dcbeaa9mr4964922f8f.8.1795541544368;
        Tue, 24 Nov 2026 09:32:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:11 +0100
Subject: [PATCH v2 04/19] ASoC: dt-bindings: qcom,lpass: add WSA RX and TX
 channels ids
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
Message-Id: <20261124-topic-sm8650-el2-v2-4-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7B0HLPkz/JmSein0hlLzb+UyX+3YoDiyYBasK2j51sI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcobHT3wfA2dFegDM6YyeCf/EjweRT9Bfr20/CMi
 fRq85nmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKGwAKCRB33NvayMhJ0ZcMD/
 9IZE1CdzQwYE3MXJB4tNl1yvGP94XqFSZE6c/N4gyF54PCyf6E7gs0CovGuulFHzDiUUhCp8RpE1+0
 xEHQkSUvWkym/v/VDccJKA57XdKX+RRycZ53j7gC4m7d2sHCKH6MNV99s5Og+PfpOo8rC7ZeJfMQ+Z
 1hexuC1yj4i1VBnDxI4ubfyxBnhy3NVW4fvrjL4Rp32FPt66+MxW/Q8P5N6cW3QPkXVy8IsNWkRtbH
 R/JuRuiCm8oh0njunzrQFb4DklIbx24HWR1Bi0mcjWGmdPJj/yEMBkonqpFoG81Afz92Sfzr8JbG0X
 c18hGgABLKE9QBS+8/QWIXnL8t8dUEaUUkhZGKxtHAdyOsx6zO+Pjuj8k9+BNoyxmbiKYdu+BUxONb
 j1tOU2zdHsFIc/UtyiHwE8+3LvIRUxnqywK72uwTOqshJI9Ez0WP6SPO+SyXPAVqi9xfKTzs0o4WhJ
 fNdEBwDVPkKV84tgxthnvvFNyXRh0cnqfLOSj1gOTwV1DKOGO4JqPHqKdYHlcFmeYjZ61cyVhmhPjB
 a0MJ1suqL8f4eftaFz8oDt6K4QvM61bEfyfgA2+a2i4yAFcjl+uRdoVt7mkNQalJwPqrRCu5SGCmGw
 TFEUKcn+akM2cV0P74rKdfqhlkcFU2I+2KYy10c/SWeQorKGzwmzF+UII+3A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the bindings to connect to the Qualcomm WSA interfaces.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/sound/qcom,lpass.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,lpass.h b/include/dt-bindings/sound/qcom,lpass.h
index 22f5e1fcc8a6..5d8db5195dad 100644
--- a/include/dt-bindings/sound/qcom,lpass.h
+++ b/include/dt-bindings/sound/qcom,lpass.h
@@ -44,6 +44,27 @@
 #define MI2S_SENARY	34
 #define MI2S_SEPTENARY	35
 
+#define LPASS_CDC_DMA_WSA_RX0 36
+#define LPASS_CDC_DMA_WSA_RX1 37
+#define LPASS_CDC_DMA_WSA_RX2 38
+#define LPASS_CDC_DMA_WSA_RX3 39
+#define LPASS_CDC_DMA_WSA_RX4 40
+#define LPASS_CDC_DMA_WSA_RX5 41
+#define LPASS_CDC_DMA_WSA_RX6 42
+#define LPASS_CDC_DMA_WSA_RX7 43
+#define LPASS_CDC_DMA_WSA_RX8 44
+#define LPASS_CDC_DMA_WSA_RX9 45
+
+#define LPASS_CDC_DMA_WSA_TX0 46
+#define LPASS_CDC_DMA_WSA_TX1 47
+#define LPASS_CDC_DMA_WSA_TX2 48
+#define LPASS_CDC_DMA_WSA_TX3 49
+#define LPASS_CDC_DMA_WSA_TX4 50
+#define LPASS_CDC_DMA_WSA_TX5 51
+#define LPASS_CDC_DMA_WSA_TX6 52
+#define LPASS_CDC_DMA_WSA_TX7 53
+#define LPASS_CDC_DMA_WSA_TX8 54
+
 #define LPASS_MCLK0	0
 
 #endif /* __DT_QCOM_LPASS_H */

-- 
2.34.1

