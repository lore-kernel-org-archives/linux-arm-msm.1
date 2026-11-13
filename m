Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595121;
	b=xcf8RPkxnKVXT9WhPM7WfYeXbnqcDw71gHCvQUHq8BCfNvbrU/K7ovibYc75zO/0aG+K
	 owpbya93t6dKXtgaPjy5HYhspr9ptnU13jeIgwMCEqMC/ByfIM8zB0/tX/uLBSFRPCf3p
	 wFYu6JZ22gAbrM6wxyozhKmiv31p2BaEufez9iMm/TWGfZ5Z+5m3eFjEodhAE2+wLys9i
	 FB3u0q+TKKm5d7phy4GY02Zw1BTNXTY95jzMP3zE3f25Lu6zQ5XW5E5m8p75wZ6ffMFzU
	 j2UheIHusCVnzCu9w8Z9EBlcoMl3EbJWCH0AirK/GyRi3orevL1TevBM7H9472scbPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=11NepBsLD6QCYXRO1YRbk90ME/+rEshWAA4QA5dD6tY=;
	b=RF6TYqbks4IJ0btcdsBv/WL+Ao4FzyjZ7b1tFC/RXmiVtI3Iy0awi61sF8SAR7Ri64lG
	 BdV/rtittna0x6eynJFXJkmFQHNaZEXnjAVPwErLoGruAl0ZOLR7ZMmyYGmvV3DN69wtm
	 +cKrU/heDt1hv7oofU3Yd2PExM3+x1qdYJvH7ta8qqKRQQfm5dWXS5SXzAczccSdCGQSm
	 2Z6kbr4RaueAN/9iFQf6YN7Wm/IboihgXB6m5hh/WmHVyoqre1nN/O/pO2+cReWp0q4OQ
	 LcRNxkxVxYlRDOPEGvmseaRXsUC3Q5j1SLxtUfuE6AcEHdOHqN0MQJ99oeuQVQZtugg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QfH0ehjX;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE9E606BDDE
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BE9E606BDDE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QfH0ehjX
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490d59c3edaso775546f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595120; x=1795199920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11NepBsLD6QCYXRO1YRbk90ME/+rEshWAA4QA5dD6tY=;
        b=QfH0ehjXHqW3RbDEYcseLDXqpLq6FD1dMyf7sU6bNoXQKXwN/xDTvcfl6mFDxqmATg
         UGsiezj1N0tKYPNerDK1XWcYibI5KWeC2b+yDtMRM7DqIaIu/3uKX6s09KKjt+ggeu/8
         936DM76VuvRMnzFg1WtJgRZQvV6JOLlgz8mYD6HHZ88jfutGMFjC/C6yFa3NP2dNw55w
         bhSUeIRoDD58icf+Gpsss2zXbLbi1Jt1SHOssOYC+M7FLIC840IIWoPmdYYNT7NOyxaM
         6doWi5uwfByGKcfVpZp23paHmcuNkuokRM7Wx4kSFqmoiUFePpYDfWhlynu4VgBt9Yx6
         pZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595120; x=1795199920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11NepBsLD6QCYXRO1YRbk90ME/+rEshWAA4QA5dD6tY=;
        b=gfuVptkNWW4KNyasvYszlWOmkMJ07kRv9oVPIQOe9smVBTHob4uMrlCL32NQ6e11jq
         ik+s+ROHn+n5OOrPEp4G3R7NI9WXiE4fz++j9671OQbgQLo5CLMDxypaN9cRxp2AVG9p
         Ov2nLd+m4BRGXhckRLSXDqn2Uy46j1eO4Algsi2e6/Ly/F+CrCYfs5HB9nECD7mjgaba
         zehjEI7YacK+Cf7/QK39Hcd92U99cMF7dG6qMmsHOGCBD0R26Tm6kcNvI7UhQk+1yB5B
         JhFNQKPQ3F2lzfmQMSZ2k5i4cnPjfOQtJRWtDI3hPEYwZ9sMyUQGtLy/FDEJScV3aWEo
         BxzQ==
X-Gm-Message-State: APuU4Z/WqKaiVnmQ5HkAo/NHtLtDq0BOGF4EHsaR5g4SAXp2RD5cFgtR
	pZKwa/o4OAIOd6jzIjMZCqXKPTlP09JMCGTqikRw58P0ArSZmZCMAlbvHTLFdar0BN8=
X-Gm-Gg: AYBFou32Vny6R3BTQOwFkJYNeBJPiosxs2w2NgfmQZJxrECufB/DnxbsVD0iGtHTwOi
	1sWgvb1J16lqWotneVgvzSKSrRydbDaL7ieYcJeRezA56aaD6RsqiHa6Oi3/0TSR/e90FZw37L+
	SptiT90m3W9PdLit2Ww5yB9fAQd8uAZq1CVhcznOCDxm6dmk3wHRaNJrSWTASSzeRCc/w0ymm6H
	GYt+w3hGRhF3QBsGlIL7yvVxE54I7DBecZNZRvRzjeXl3pCeLmPVSPRRPyiiHEhNzW3wcrfcNmx
	Vpw/DcNP8Gf4QUn4NkHCOanXlVdyQ7gCNp1NsOXBeOC5af2VLQ2wXrCJ4mYN7HYTAtwd77H5IiM
	/rmZmScc8pG6+f7pRw/+Czvpy0D2mwPe8BVh+Xl+dqgBmmMk30fq0DoDYilCR6MCE5LXcmmxZZg
	jgPBrE1upYLFL72fc8QglamzkT8yIxBWZLILmw46HFehAL/6rYzO0UkGALKjqF6BibnrANfYmcj
	0TfI0wInBFIctdiBch4lSc6EfTV6BAuYkN3+w5eTqT/RRty4/GbO/IfPDt/KW6gzeNB9L1r6d+f
	K2HIAKT3E8QgQcpbA3D0kmtYjEaUxvyfOJYQMGoWc7M=
X-Received: by 2002:a5d:5f05:0:b0:48e:76ab:78f3 with SMTP id ffacd0b85a97d-49c7026072fmr7211783f8f.15.1794595119797;
        Fri, 13 Nov 2026 10:38:39 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:18 +0100
Subject: [PATCH RFC 04/23] ASoC: dt-bindings: qcom,lpass: add Senary &
 Septenary MI2S ids
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
Message-Id: <20261113-topic-sm8650-el2-v1-4-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5I6Gvg7c3l0nKuQTPTMB1qG4Gtu3tCn1ElSv/OYu2fU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kfqRZ2T6Z/jRwXFApPsrgFTTTzef56ip9JaZcu
 +0RFu7mJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZHwAKCRB33NvayMhJ0dVDEA
 CrHH7+4jU5ts96QV3jDNTfBIUS1jHasG0nj1eLihY/bmo6lA1tKVBl4/2atO1ONh9tdjvUbmnpWBLM
 f7NytOP/qR1Kv1DZ7Mypt9D0MFqCnU4enVQCHQl955hVJCYASUt87jCrZ52jevQwErwAEPYZZePXXZ
 agAc7p0d3Lhb44CizoL6rUCESDojCCmCq1xBo0MoarmZnxQuH7idX2uEOhnganXamYFVBIh9NdlxpP
 xz3k9hm/ppyrfbNx3FpP/IFJiCEr4aT3KP1i36r76b28wQpyo1++DnJAsoji9whgeTHwa5U6D2DoJR
 pyNoeiR264LZOspMBnCH8mri1gEajI1txnxkF2b5C4lpZh9+PSGfxVaTRhx4ksgJUaEVnZY+dLIb4T
 GiJs9ZwFLHXrKhcun09tfitGRCzqNEmE297jqlBQdsj3GeVoPMz245w55nz8NU2G8THZbLt4J18xTG
 k/+pUC15LpJ3kF4PDd1dhmsRloUCXrpmUcNXUTKU8Ua8tY8qrEGc5PEtmXsQJ/5KamgnVJGVknvWKF
 TmRb0eY6n1b9wgs8WMuRLq0C3XFXFLLz2tb0q35pnda0748n4rkc5ISPamXUo0r5hQ/PpAzlFoL+bf
 b6PnGHrK6/7aQW0AVOpfJgIuoi2DFtRYR+UeBRZQBLczS/0GMCjyZCXdSRqQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Some SoCs like SM8650 have Senary & Septenary MI2S interfaces, which can't
be referenced by the LPASS CPU DAI ids.

Add the MI2S_SENARY & MI2S_SEPTENARY DAI ids.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/sound/qcom,lpass.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,lpass.h b/include/dt-bindings/sound/qcom,lpass.h
index a9404c3b8884..22f5e1fcc8a6 100644
--- a/include/dt-bindings/sound/qcom,lpass.h
+++ b/include/dt-bindings/sound/qcom,lpass.h
@@ -41,6 +41,9 @@
 #define LPASS_CDC_DMA_VA_TX7 32
 #define LPASS_CDC_DMA_VA_TX8 33
 
+#define MI2S_SENARY	34
+#define MI2S_SEPTENARY	35
+
 #define LPASS_MCLK0	0
 
 #endif /* __DT_QCOM_LPASS_H */

-- 
2.34.1

