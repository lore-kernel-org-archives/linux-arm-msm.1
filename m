Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595139;
	b=djSjolTnIJ8FlP2CUUNHJD63mh1B/FSv5yF4V+MZJ/pqkaKRPj+eao+QFpj/t7NMSU4K
	 8hk3kArRelSF8KNc5TJ7n3iShOnhQqNi9yRTKxU6k6ITnsjP/tsmBjxYDfZpQyxkAHEb0
	 bcTKlhBOQvYZF9hpT7n69cfy3r5jQSdouE8jOKIahQYiJq+lcgTEAjKaC3A5OUuMozY2N
	 XrhRtNLV1SpcdFw8sqasubqgVyHwrRYidp8VkxLptYRPZNJI2yjomtGkaO8JQGWsgOG9I
	 rCgc4nVDujQyVZxudpe3uw36taCt1ji5H4PhyFf/IFKyxOBr0+L+eHHWq7cV2YqJgJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ShonUOYxGGNmtD8AWNfZClVcjwHiQNoIijd5Y0f0jlg=;
	b=CWEZXe8yiN61sRD5otSa00m0vLebvtP8CivieoO36m/D/1kzATxB6pQG4zjtEPK/ZFDJ
	 g5dokW/FGw55Xvh83jRdQKBwmcfC44O2OAtnMvWWrSXiiQx+KvAKELWoZiBSHIhO3FvLO
	 td0OWLuVmfqGzUXGRVFiHBsPizXU2cBaa5s/pESdWi+9lkpZbyzbJjXzEv3QfkpQ4pifX
	 7ckDFNnYbf0mIcUqob7yl+IXJe53p4d6uFvEFOF6WnHtOD++Lz7LyYx10/Zso/CqvCmFr
	 0xWHrlVEko0cD9azUPWRvOWEzzSQXLZseIDULjIptiCGbUKF6qRT22lf+5EjutHLtWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pzlEBQos;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED086070B7C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AED086070B7C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pzlEBQos
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491971ac844so1507240f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595137; x=1795199937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShonUOYxGGNmtD8AWNfZClVcjwHiQNoIijd5Y0f0jlg=;
        b=pzlEBQos34MNNpurfGyXR57C0NNyfj+EPBTsCLT6EE+7Fi4G/LzhXJ2OL8x2yklRtp
         pqU54v0RQTpZvIhbxhHQAqnB67+/B0xguWkzoVW4mlFHf/P/SIXv8yTbgcIoAwF3sLVc
         0uU6yujcPl//gZIlsko9pCMGUJu+DrMJXKAi0weJPQRsfG/WFs45W01w/RJMFgO6ZoV5
         Vwk/qHGXElE0LJb0jJSGAZ9EPx/P9Flo9CkkyrFfv6Z2mOAFLHBzWVt7wJLnsVXYUjNs
         sC00lnvD4w4JP45/2HdtuuH/dT+gDYc+OyFd1TnDoB5XNPJFrJ3etxWnUAWZVE4I17bJ
         97mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595137; x=1795199937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShonUOYxGGNmtD8AWNfZClVcjwHiQNoIijd5Y0f0jlg=;
        b=y/NzADCFYQYZPEJZeFFZuR0p2h9qliZCifYGBgIo7DEIPVWQSucMRji2WHBX36Fds4
         DiXNR5t1gt22rYsJRr3ldG4GRhgO5ZalrSRumOPB4UTRwG3pZ/dW1gXB3cuPbjuxMPMn
         Uk1ziu9u0R+aCE/rnl8RQOVAy1AUFsHh79UoS1o+rxH/XnrJm9+IFE3wNPj7BXjIJWF/
         lvICVGGBhj8VL3An5YD+6uCC3B+Tbg+bZHJNb1uzYV2LZBGZQh+GFGU0Qsyh/bGdgNwG
         vYyCJFI9tK2dJkuJ0ILlTntLDQ0jS8mjc2fm/WuOhgjOJOINd/8JK8JASBhcWNZJBn05
         LdUg==
X-Gm-Message-State: APuU4Z9sEEDJj118e3WkYdBi9rDvIb2eSscwz5lYmx7Sg7gDrcYVFDEy
	2ntlb70SKCHJ1acvs0ckrHdKQdwaZVwC2fgWNlRsy9dCNfCt73hkN5GuFDmq8+HP97I=
X-Gm-Gg: AYBFou2BF0dTqmdJRNDPJOGb7K2t/MNzTWcKjlmor9JvK2rKNrfOWCO7oLKTTlhEfPH
	akEZos3ie4uM2rxCGK1Jsf0M/6r1jYoLzgeSJtNyFFKJVELpVCAkvgiQ+A+P4tVeiz7FaQYhM9/
	wOb3YAodFHeJJzAZZHgBuf4x23MlCt0Gaui2n4SwAsZidUCG//G8mmrt7q/oYHyagRGu183z89t
	zODq0NxUposkiYmY5/wT/ySORwpfrNJZBpIfLxekREertCDERFCCi5F+aMCHehvI06unCciuKCq
	DaxH+UZR95slKwra5fN8Mi9TGkHg+LomcB8NZi0BCajGIv/NA6fQd2HPywud0C2Fl4ATtROKOr2
	Ob2eDSbivKBBrOTCveCTjsv0S7r6YubF/wHS+eovd+uRzUv9RrnKNdwwREI+m3Ozx437k65QH/k
	lZ+uMIDNyuTGk+zGt/3M9+PMDaFO+lE0v6eHAHevOT/AqPMZ2zkX6bFjRO908gmVvx44W83Kr+/
	D6n9NchYSkIcI8vtfu0NRMMV/n/hCLDQ1IwMXpL8mOeMCuot/Mz3NdPZeaFm+wsdZmr5zlPPLe4
	8pj0yStQ9Xn0nCyCLNLc8db3diJ1FeJmMTk8r1zaW44=
X-Received: by 2002:a05:6000:29d9:b0:498:b92a:30b with SMTP id ffacd0b85a97d-49c70ed7d88mr4816619f8f.15.1794595136922;
        Fri, 13 Nov 2026 10:38:56 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:56 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:32 +0100
Subject: [PATCH RFC 18/23] ASoC: qcom: swd: allow LPASS_CDC_DMA_WSA_RX0 as
 soundwire dai
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
Message-Id: <20261113-topic-sm8650-el2-v1-18-5183f6aab9fc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=588;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=B8W0+YjZEiqoAbB2dPCHvIJpxKQMBOWC30klAZVCDd8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kmG9XLHJeLS7JkptOZPLWufRWNkDG/W5drmOwW
 4Y4Jx0CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZJgAKCRB33NvayMhJ0R0kEA
 CPcpfO2Q7RH/mOuBrdmSsYWh/Q2dOu/1HoNUT5WDw9BCZ9KYeOyugM6c4PRXbtOZWvx5rcmCrgj4dK
 uOctwbfOrRO7CrXqfSUhskQ4BbiH9AtLqvcmDNt6lZQIi++PrIPtZu/3RVospJueeLMMtkTxlQnaka
 BhIHrbr0o7jHeVHDde7MIVJb9jsk7r961kQ3n+tSxuMkYZuzW92q7kLDMf2T3kdUG49fQq+HtNb7Fn
 oS912dRmDG826ai/0NTCaoM26y1CYZR5zKxzdXmheZPsHts4GBG39RZcFIGnnKaWHQNaQLpdQ1CP6L
 qyjGpWD0rPxLsHi/mmKZ6ImyWTSNsxBUJXrAr8vionS6Cps9C3lPWY5sqeaTdFU7bjYjKDByBY7OCg
 zVwH+GspOzc97Yqo0/CfpwTEuI99sqsyN4nECNVVlEsGYByj7Y8W8r95sMqdWyBeztHhfLBsl75oMO
 FGKGYrfOx5ArkG9Neh9MIvw8uLBIR9Lon0M4TE9Kynly51xl6CZvyJaPlCnIpK0CdhY2hbx/6rLKLV
 Yv2xDY7I06/F7K3vCRn7tR7/9U9vJhFHkTGT4DH/BCpYhpbjNZbOJFT97MfTCsp1HaGiiLeCrg4sS9
 lXXSdPVk3ThK2lywQ+5XCWFy0iSp0cNH+gJPh5QzpvZw+n/45H+zRxX33QHA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Like for the WCD ports, allow the WSA_RX0 port to be initialized
as a soundwire DAI.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4c8c..82a12c050d5e 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -41,6 +41,7 @@ static bool qcom_snd_is_sdw_dai(int id)
 	switch (id) {
 	case LPASS_CDC_DMA_TX3:
 	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_WSA_RX0:
 		return true;
 	default:
 		break;

-- 
2.34.1

