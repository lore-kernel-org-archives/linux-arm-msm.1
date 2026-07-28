Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480C241A540
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231124; cv=none; b=C07kJ0xhvn+0hNF5MO/G+gio6q425VNsAlZkHoE7XIdUZ2j76RQW4baqBhW5Ds1zKwjpRG3D/78B4X/tXfTu7J0AHcZiikEkbsyJZfeD+etqBaS6wsRJUUFF0rMrH6Twz502KI9Iru829pVeN9MVFFdh+D7HjSjat22G6ASGiwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231124; c=relaxed/simple;
	bh=JjYMe727moSW6eydoRmug1B3W1rHx22Xuo5S8BcfpRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y11nlHTxmxMkle36cPGGGMBnoHSHD3ABrEII1KgqWOZ29IftgsxN2Rd+Zs2o8WWfDBJt5CBylS77iQ/P5RrLj3bF0UGcO6u8upJQFN6Q2EXTkcM6TfbXOGjjBzTeYEtQ+y0ZCSrekmAeUb4shDJmxdiIahLbosVQW9Qz3CP7nlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NycrQNqI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NycrQNqI"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954df200ddso23882435e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785231121; x=1785835921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wyvrkTEX8gg8MffaShVtSJAUi6pWJubSIpFntBYoA74=;
        b=NycrQNqIKe8MWkjnVFwlUWQZawDI/yMKMotq+9WA8WA5JpYmIvYsNOfKPQQShOu7Dr
         rOy0mqCt3ESTy3ovq4O5xR5OouSSWP5DGscsoMakrCX67pzYdJh7K46e0Q+ucXY8ORXF
         jb3sjK1iSRSNY28dxiZh80kF/7lZOZCOLBhnivgJcibQorN3RxWnH7ih1to9EOV8EhUL
         fyfqCzM6zw4tdUybaeyX4JJNrfOao6GeHeL3fgMPNsAz4C6+aWHw8vIH050Q/CW//lpe
         RbxUntUeDGH75/o4ocipMMR515i85OH8P6eZel1P0NqKb/Jpq7GbxAjGrhrg12k4yljx
         Fw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231121; x=1785835921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wyvrkTEX8gg8MffaShVtSJAUi6pWJubSIpFntBYoA74=;
        b=mnPeWU6U0/z1rIGBuPWlMTgId/nFQPP9HEyDFPSnqK3iqFS7nx0u1wpaXV+Uz19qMd
         kULdmE1DMns/d78/G3JV+/u5+UAjhSMSS7/EzhWJ5+aL8JoGSL8mU6DMNo/zbxTs95qE
         GBLdDeJYWTly1LsCpo0ZDxfX4vUJEdXW4A1oU4n8v4IsjrP4laBAuWfB0xlIainJpefU
         1Nd/ScQuo1njXbnzhfrF+UYo5EpIWAEQoQQXjBKJjuDFMG+LbXbmPmyeXOyIQf3ARwXk
         KPZK0Kjqct86bYo+0BAeCOEO1Z6KLzSTUiVIL9uxYmRWU3ZgMTBMN/PNVNjJBauEUcS5
         5Zkg==
X-Gm-Message-State: AOJu0YxzD3nkXpaJLfETTo5lqH5w5wNdYzu3IwrgEj4Sh6//v7qjXIpD
	LedhVpAtfCK0NyKDsrMQIcFzZU/FxpzB77wYu0NhrLmZnm9yGIUqSC2rjGQvKOphLVE=
X-Gm-Gg: AR+sD13OQ9IPH/E4EquNQqvmKymuehHTJlinUVRWzMLNlfy0iprAIthp+Ms0gOnyhvi
	Uv2wUuFBEI9/uKk4ar5UOmsP+0oINhN1dsZgdRV8bKDjha51n/YLznZFCaMuWJlTD6ghLezNR0s
	YtRnskQAcZItjWAjBAUqUaOXTzdAPA80DPFcbCsuZKqo00oESgRhQS41xCIgQB/sZ5JKu812zVq
	/guxcEdHmV4e2enVr9oEYsVQxmuA3U9JzeaECFR8mYEomybUNpw9PksOempUP4/Q9950500vble
	ITID2hul8SmfW6jo1dUevUoZxlLP2aJndaAz6VaUiF8Q4rylRKF8bnJXAkyd6XZnBRtRzCmB833
	vG2HbUUzJ06xVAMT7nLdljYJbeBOrLqwuDNNvOcSVgwp99SBTRxHcrzwFD6PCF/LuCXFFiHnua9
	R6uccccot+IV32XJgVCttK5iuel5OMMuVPQA==
X-Received: by 2002:a05:600c:5486:b0:495:7040:c7e9 with SMTP id 5b1f17b1804b1-496c6414bddmr15782155e9.6.1785231121094;
        Tue, 28 Jul 2026 02:32:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm62389384f8f.1.2026.07.28.02.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:32:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Jul 2026 11:31:58 +0200
Subject: [PATCH 3/3] arm64: defconfig: enable the Renesas 63419 panel
 driver as module
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-3-49e3ac1c8ff4@linaro.org>
References: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-0-49e3ac1c8ff4@linaro.org>
In-Reply-To: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-0-49e3ac1c8ff4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=693;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=JjYMe727moSW6eydoRmug1B3W1rHx22Xuo5S8BcfpRg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqaHcNvEg9FKSEskmsNfnAVoNdgaTw48R7NYY2c1Bs
 5GTAv9qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamh3DQAKCRB33NvayMhJ0VUJD/
 0VpinGW//GB5TMg3yTAG7U0iv4ccidJP6YZvu+379Lb56v9guHbXKtrnYsTvyg8HIxbMpNGDGxjmRC
 xoLPoz1AFSqPcjR6flS5x2tZeuNMC2mFRoqjlrtQbyvMNBLjhSBT7sTbDACb/a90o4qBMM92/6/gdI
 S0A/G6oubcWsGGjXbC4UXW4OxzFG74NNCde29bO/W3oGs1efpEmdnrB1OBxfoKB/VpO8rQey0tNq3n
 Ni4Icw9Es1qZkra2QWI/G3mkohzaMO1z8ysYfY/qE8GugvsaS7Nj4R3GDHlhzQXya2UAcE6LEqWMC5
 JYU5CmrOLgi5q+7Bp7icHJwD/aFQMjcZS04aIKpK/i1n6Z3wTpPCRXLql2kDni4lPSy7idPQM9MXFS
 yv+FjKWo+XZ8O1V6i2YKxu/93wDpfFCDe0KlTJIm0nxqU/023hQzoaVv1wDExZpqhKg4ohaq5hWHUD
 XJ60n1154EB1sJzLUXAaBDXmRtNxJZYeMIZlqklklFJF9j+5uTmkgUVfFZj5fdrv66Kagy9Ht+V/oR
 npgZEC6KjhDH5xvmWZpwiAx5K3/WLX1m+EYu6MERv+/s8K+T/IPdTwcjOir/mqdItc02rjPhRkz53T
 aWxCMFgfQix7E0lYhlxOBEqnu4jDcsZKc1h2s6U4mFHnlnn+9XREA8LaeCQA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Enable the Renesas 63419 panel driver as module since it's
used by the Ayaneo Pocket S2 board to drive the dual-DSI panel.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 90903bd082b2..98d4b7d2e8bd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -964,6 +964,7 @@ CONFIG_DRM=m
 CONFIG_DRM_HDLCD=m
 CONFIG_DRM_MALI_DISPLAY=m
 CONFIG_DRM_KOMEDA=m
+CONFIG_DRM_PANEL_RENESAS_R63419=m
 CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_FSL_LDB=m
 CONFIG_DRM_I2C_NXP_TDA998X=m

-- 
2.34.1

