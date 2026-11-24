Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541545;
	b=fsZhj+yG/edGMggnnKzFJeBca6MlOwBBoD22qoZnuY3MWHBCr//H7kqnWVimT7ifbwhj
	 9Phs/WIxIEkLQdSHnRMZPfuarjqhLiFuoM0X5RruJN7F/eeRZGSLTcY6D1sL/9Tyu5Nvt
	 8nrquSF6EnafUnEFzyp9ycb1K8M0yiQSQOJAR4pZ8r4WdEe0QoU0Qv8QXxAgRKLNhyagW
	 YWVg3DFXXK6rofFsg5GGcfMSbbpEwJCxzknhlc5xNy1KTHi4uaH3BEZ1E3NFPQc1wlxhY
	 4CAowd9TAj2AcQeLn44aGuCLKmMIOEo1FFADDBh/aYXyLdc4J+yT1IHR+gPtD6kDRXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=11NepBsLD6QCYXRO1YRbk90ME/+rEshWAA4QA5dD6tY=;
	b=Ca1YTDA/6Vr2pVkIKxfktiuMcwZj+HHyEG9ZXuD2a5QZuLMpBd/Dsx0cpihsQFtK5nIa
	 W6TALVOqUgvQIk6FMTAYl6OjAUI+o2htGHqPoyaFmKu4rcqwG0tQVbeJr2YDOnyEx5ccP
	 GASCO5uVhHBpRO8qtHgknE8jUoX1XY4PxCUAeMh1chaKLyV0VA6ke+nZjb/CqggUnph8X
	 Y8ExFLYfubbj0Ju7XbPrjfOIaIMhp3goC+rxeduEOIHAgzccjg+uI0jhtzbrZm7Dqtci+
	 UD9yNLaJgqTdqUqLnFKJaz0ObNzIJVoeMXJppeeYuLKWEJGzg8daAg4dC7uX002TJbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lNsYRe3b;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AB6606A334
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60AB6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lNsYRe3b
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so42474265e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541544; x=1796146344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11NepBsLD6QCYXRO1YRbk90ME/+rEshWAA4QA5dD6tY=;
        b=lNsYRe3btU7VMxDTeo1Pfr/oZ3x9wFi1mXH6ULDi+3dGmlc7GVM6Tof+Bl66NeVDzC
         HdLS75BM4CC6auVjh17vhJsNahWpZXKLofgX5XK6T3fux+XJIypDoDuhfSQEMO452HNJ
         suqziFfU9QfsU+CqCgH6uBx6MMQ5nDwjyosp9XgDUV9DJApYpZWbZegfzYHuae/QIQpH
         lGwnnGP5aKc8Sr53uf5pjriYfNzcgk4u56raFMxvEHdp5wpgn/m32pb+IcvP9JqCWPLG
         RiqbfwUrM2CTkEREh/BBY2swpXP/ndLyVDMeu9OcoZrM3/u5IvIfNIFB4W+pAxALHrem
         mULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541544; x=1796146344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11NepBsLD6QCYXRO1YRbk90ME/+rEshWAA4QA5dD6tY=;
        b=JJPn0VbP5PtgsO9tcYIHAepjBHwY68YL79mjrcPgClA8lp/Sb9mrjj65owWM0vFXhw
         kLUs9dOVYlkQMYcf7/cIWlrXVGG3keX6WwShU8pDYnc+L63BfX7njbg68H3OnbzdaNzh
         4ptOAQNmpvf9anROCVGLMjhKdQ83hDQ8oSACWH+IivBU4K759f9SU65/ACsBjmC65BUa
         2GyB6i3oehOiZ4q1OTQ4HWLkPq7/5LLN8LSJDHDv4WZ7tiWfgK5YzKqpcnY6xceCoGb0
         ka+aX2dlPGyA36FHuXdV4ilibgvk32961DGHlJtUeYCdVcqn4bYpM6cg57aaWWBkUMLt
         zlfg==
X-Forwarded-Encrypted: i=1; AL+hErFS5g/lYjNEyVv5yINh1Ry9ImfOW08XkRghpvf4tTyqnhDftU75lFOiZMcQEGG5uhV27Lm1Ferl0bwkt2P0@vger.kernel.org
X-Gm-Message-State: APuU4Z/sM8UqjBruD6ZATkWoC28qNA4irObQ19r9WLnclYU7hbYpwBTL
	01G8zwRUCM9u0VSpi5KkTIzUypWvh9l/saB3xoMMWOVOL3vu2FRS7Pqgnpv6aUh5UJM=
X-Gm-Gg: AZFdTZcEZwHsafxvPK16anX0mfmTv2ZHb0um9qeaNG86+9x46jnIoV1yAMsjPIri8b1
	02zWyiHjRylI9RzjDnxsRrSKggxR4/oHcdTkqIyDAYcr/hdsxwJ8kCh4U1MA0kD/ru5gGPbjx5d
	5JSRjm8m97lOk3Hi1t7zYH8wqfe7WzxNo42w4qG3SR+EKR+SYi0hqgpCyGX58urj5UmLqLVw9eZ
	GF4ePKUGwaXpT3mR9CyAKpVQ2ZJj4xNyDerInfxaR2KxvzBSOdaMHDuJZ9MYdUlqEP2ad8Oy4JM
	QUUEte6WrV4DuWCUPBIhYn6SosBAu+gLFjmSYpKndkfxU98xIp8Y4OfBLOFXjI3p1qlu/fmqD4p
	7b/wSFjBfPeWliFrWszq12pxiLa9vwy9XDtKlLd6fw3HwDWqkdet26/k2u3EavL1Xcei6Xm512P
	tbYPwWYO2gdHmJhoiytGMutgpxDVXRrCbrCMbAWWktB3n4UvRYct1R0tMACJPCkgBqeDSRPDcCD
	ZpVupNQZf8DVNJpr8ArX0OD3ynZjYwlUHyPtVVqrop8FDtqOea9Liab8MYAKXQO15dEWoPcf3W2
	BSHmki8PizG/ByMqVCU2amyVba0qq0GElaW8C+rBhls2uylcwQ==
X-Received: by 2002:a05:600c:4f0f:b0:4bb:87f4:3674 with SMTP id 5b1f17b1804b1-4bb8880ef40mr392620865e9.15.1795541543609;
        Tue, 24 Nov 2026 09:32:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:10 +0100
Subject: [PATCH v2 03/19] ASoC: dt-bindings: qcom,lpass: add Senary &
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
Message-Id: <20261124-topic-sm8650-el2-v2-3-174e159f0f69@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5I6Gvg7c3l0nKuQTPTMB1qG4Gtu3tCn1ElSv/OYu2fU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcobWxAIrUaikBSGw3tfCDe/BvDN5W1VJ7l4ptzE
 Q8mTg52JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKGwAKCRB33NvayMhJ0YbMEA
 Cef2bCqZVVI2O8r/CtoVbur+J5keWp49wViKQ2UMUyMQ05+wYQ1avJUMr0rgVlkz89rmzd7XhXaXP3
 +aNBSBgseud2LTgLyCkhIEuqJh788RVeLRfBPA8AuQkmqgWBAlhofTxFtRHlunh5hL4+nItKNvjBk+
 Dm+ArKSVLTyUtzv3p21ESILkMDaZ7DlfsyyL00VLWmI+E2ZyUEKLpDy0SIfMw6LSOqU76PKSwOCrmy
 HdPPxRyqCnUCa6dyQ0OmqcbhiHwSBFFR4Ds5GNZuDiZUCLVZAVNDh9Zzdg1DAflHfcVpF3ggzGRdxm
 nLAZyeYo+OvEERaSHbn2IcQ6Rp9hkwQQ1wV+M9vdcY0t0HcCWFmrLAuXq8gfCLh24JtnIXLBi8Cem3
 +XFPB+n+xuVG7X/CjoVGpBl3VosciA9ZVUmpHT1L3kZk7c11tobtt6rsdptFXpr4OEKuhJrInAT1pz
 Cg1FmGKwPZkSkBXcBWVS6SKhsRFNUn5u7c0lUinKo/9rLK5UpeiWDE2uAFlfk9uGzWRbLDh0GuZCKz
 G+KSxZa0GJpJVVBhUYyVEdWboaKAMGz7gIb2BDfjlKafK8pL0eukLVqTtRRRfBa+9sJ20Zip14VkCf
 Xfa9Fl2qwYUYTzP9B3Bk13LHA2Bj7y96Q+BjlRvdzNnH+Ec2xp97Q+J6acSQ==
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

