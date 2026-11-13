Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595130;
	b=2VDM67hy+hwhIIUNzJ1uS0w9yKNpOavG6xldF659QFMccLbu0Xg5uyQwo3Ymp2eMO7Vx
	 5QwL5xkOqBHxyT9etu2qbsoSU99GKMZ+fzWKEspwZyGtmDjUx0h7OY9pRX/5v1FrN0akz
	 GsuTpwldIvV92cB2xtr7vwvu3s+dX0+qIxuVi3xkU3lcAYEFxMlkYQ4k4GFfvrzsFDOL6
	 IGQrklhROfuDJx/jHAmpYT6T39sDeSj+kw1WDJq2P3GrUwF797e7hASGaBc4h+V6y/aLq
	 avaXqgWt1Pq0h3xUvBRce/YXonCPvKhfrjSnXeKe+xVrA78k0Vu7N+c5JQUSs8HNxLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=/WLYnDFB5WqiTmstQk3U+Or9EEun2Fd05KTvnYRhk7k=;
	b=s1iXhdQJ2+qKzIFSho2lHAXhGlF8QXF1ZbnyWlEd6WSCcFxX681SBgyQQPcPRIFuo5Gn
	 3OnRNEtqDnFsZWiN3REjdL2GPRXUJdpcJeA1VPpLQCIebv3unMXL8ODDXsiYEj6ZCqncv
	 jcMQDPU0XlzIaoWXgOUz7dtE7KpDLzL9XZdM5Jsv7MFSKyPP/Jp7obPgsV1RXLXiTYM1E
	 GeMHGnlqwFBXcy8hs3rinApYqACKtNBKNuhu6I4Ng2qyZ0E5sD+6VkODFE0Qjb6K6Xsf0
	 OXu8TV8rMydNqsj9BkIWYS2v+CpjVP5b/GHiYY+/DXL3xoYH91y3JsrlDjj1JtrD2jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CHBH4gV2;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B8F60A262F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88B8F60A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CHBH4gV2
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e3b22e971so640368f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595128; x=1795199928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WLYnDFB5WqiTmstQk3U+Or9EEun2Fd05KTvnYRhk7k=;
        b=CHBH4gV2txsfWUqt93sFXgZF7/fnwxzFiPXhIjbdrpO+4XbKSdWUmmbI02iSL+Tk+e
         UF85gafw1u4pnt2n+oWOHW0NRifB4bGa2JyalIt3gONDYehIkVUNWyhW25sSNIEg8wxP
         sAkNUnZ6tUcBdblyDmd8XmlrapYPS/rm3xFaCakAhnF4aMxC11Jp/WVWY7R6YhQxEexn
         Cg6ZpeVf+I2vgRaxVo1uOOjwJsjWWKQrG3/A7IF+sYtBNwKRJo6kAfHnrUlHscFjkzng
         nFC+2nLaO+x+uq4srb5SmH+UCT1OLiZWCBvTcsdqcIC+ElDcFyF4lfHOePqP3owY0SRC
         a6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595128; x=1795199928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WLYnDFB5WqiTmstQk3U+Or9EEun2Fd05KTvnYRhk7k=;
        b=Xl3mGjxWlD7f71tEiAY4VJtj2u1RKCRR59vPKEGdNMPZwj2P9yEy5NkcsSMhcKKAVt
         HYjgsRrSh+tVFajosCA9Ax+h4jnIy9ZneHvh2e/4PtYNpVsLF25zb3s0EJdXBTK3m7op
         I4jxoxD9ktU3jGEoEU9fwMGqOnIK6Y9Bgx5D26fdFjfMNg4wNHwLYeq2uytNbacRupkL
         gXyxlaonwHVe9D2Hk6mcZqbEnMUlGdyC0hOsyhBRHFS+sWbf87OMCWx2RPrFXJeEc4O7
         TxOZZw15TIS2H1dUWCrv69bBHi5S4P7jY+uVoF6JkDQ8tnYAUmo8HPEb9ImcJM7qNFWn
         Aqeg==
X-Gm-Message-State: APuU4Z9/zLn3qKagxVwzuQjoClhwu2/y8QqX+MaSjb0MKvVcETObPPfl
	LlVLn+5ek8rQGj08P4B3pKIUlWzsxQvXVyE8cG187RlXTWyn/jUmqYIJ5Hh/WUjhT5c=
X-Gm-Gg: AYBFou0rGG5+8IGZmWWqVhY6rLgstBmgvCOysklHOCFbMrkuyOKTtLGwupFdhMwzQA+
	kvwi5Yi3YWIr5yO37av7kOSiuDJAvN+cLHHiS6syH+DbbGWiGGhHQEIQ8UwPFUFZJVdkhzAcMAg
	E69hZ9HK7P4t7PeioYmMBJzBbVvOKeOIPCJJtU+qrlYuMJMsNh/sN4tRI+noSeQYx/+Y4DK6Prb
	tPcJ/BHHxaZM3nwLqAiJfXljsQ2gnk8kqJH49i30G0PFzhi5Usgl69zYF2CH+zYlCBAg4wR/t06
	dxPa2ajQD7tL1PruONRlqd+EJH+N1pE9jqMBNZvr4/2v0K5x0L74z6c/jgdgw9nD/duMpoRQNSe
	AvSKiCbfABD1eoXdkv74TjX+uYBQK8EH5lScDgGrdKEG3LPfibmFW4ZMQiWnpyoGyuGcJSjHkWB
	HIzq8PCXOOK3dWEMYDd/xmmabrL6HKQpS7qWS8J4lY4VrejapE0QymUIgrfreiOvbl8fYlxY1Cy
	l46TxqUtLyhm7ud0QC66aF12diP8mDEX+25Qi5IrnttuhLE50HfO8CJgILkIbY9BKoUrR3Dk6u1
	Agt+2h7T4q3gNacGAobZDj4CMZdDETx0fkbohC0QEm0=
X-Received: by 2002:a05:6000:1603:b0:492:7969:b4d2 with SMTP id ffacd0b85a97d-49c740bcf2cmr5166909f8f.40.1794595127796;
        Fri, 13 Nov 2026 10:38:47 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:46 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:24 +0100
Subject: [PATCH RFC 10/23] ASoC: qcom: lpass-cdc-dma: add support for WSA
 codec DMA
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
Message-Id: <20261113-topic-sm8650-el2-v1-10-5183f6aab9fc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4605;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=mfCsPzRhTWREQ4uyFW4BU1EwrH1qQBPLGV1oO3W+KKo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kihi0qBfz+vwZ0bKz74N4nbztnTKEXa32JgaEV
 yPgRWB2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZIgAKCRB33NvayMhJ0TepEA
 DNjEhUfRPccxLAruIu2oedipL4Sdb17jQOcLzJtgLBDQh1lLv/z6fwv9MJHHWAQE3lDptHZlLcIzHT
 UL4aRFD7mi2lilpcnr9OxnwnsdaD+tZGvdNzQyHAxC17onvm5F59Xfu5Bg8HR4VMJP/2oiqDhEUYoS
 2Z4e2Jzaxp++5YkocnfcfPcGxXZ6dvjhId/UrTTGk97LU3+Srb9ywCYE4ud8ye8TYusgn/TPfQ++h2
 xdDm7tuGcdaKi8zSyb3oUl9hnRaynyBJ/scs1/86mxjHQDV4bTOCAsZc9ASAThWrfRkHtvEQNKNsaN
 YbqJWtekKzX6LXKdOOqEYc9Nwb45IRF33Vmt7xx46vXkeYhK3p+tPM6+0ZmozLg6Je78XuKMQpqLND
 CmvKLzgQEK/o3FuDQtCD8+nYKZe/tefKx6oBrCL5Y+oDUcJn3+ZqSi+xpcKp+3cQRlyK45pIA65+vJ
 fvqXTAN0dc17yqFdF4TF2XJTpQP6Sg7OZf08SKYgVx6OZCtn+RHUlHKp4I+dPtG2bXjmh8HzTP2C4b
 4+13Rlochxjj9WmVOy4ehCI4XVJOkrJpeHJTZ1p7p2271M6fkQbkX93d4d0qIpKGAM4KemRIvpIVFk
 KWSXoJhZdOrmN+E+mgN7UIM5MyFNuOQW4IHm95jPegpd3nkzmSFJk4IyHlUg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the plumbing for the WSA interface in the lpass codec
DMA driver.

The WSA interface uses the same LPM buffer as RXTX and
need to enable more LPM codec mem clocks.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cdc-dma.c | 44 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
index 2dc8c75c4bf0..903055e3188d 100644
--- a/sound/soc/qcom/lpass-cdc-dma.c
+++ b/sound/soc/qcom/lpass-cdc-dma.c
@@ -54,6 +54,14 @@ static void __lpass_get_dmactl_handle(struct snd_pcm_substream *substream, struc
 		*dmactl = drvdata->va_wr_dmactl;
 		*id = pcm_data->dma_ch - v->va_wrdma_channel_start;
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+		*dmactl = drvdata->wsa_rd_dmactl;
+		*id = pcm_data->dma_ch;
+		break;
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		*dmactl = drvdata->wsa_wr_dmactl;
+		*id = pcm_data->dma_ch - v->wsa_wrdma_channel_start;
+		break;
 	default:
 		dev_err(soc_runtime->dev, "invalid dai id for dma ctl: %d\n", dai_id);
 		break;
@@ -68,49 +76,67 @@ static int __lpass_get_codec_dma_intf_type(int dai_id)
 	case LPASS_CDC_DMA_RX0:
 	case LPASS_CDC_DMA_TX0:
 	case LPASS_CDC_DMA_VA_TX0:
+	case LPASS_CDC_DMA_WSA_TX0:
+	case LPASS_CDC_DMA_WSA_RX0:
 		ret = LPASS_CDC_DMA_INTERFACE1;
 		break;
 	case LPASS_CDC_DMA_RX1:
 	case LPASS_CDC_DMA_TX1:
 	case LPASS_CDC_DMA_VA_TX1:
+	case LPASS_CDC_DMA_WSA_RX1:
+	case LPASS_CDC_DMA_WSA_TX1:
 		ret = LPASS_CDC_DMA_INTERFACE2;
 		break;
 	case LPASS_CDC_DMA_RX2:
 	case LPASS_CDC_DMA_TX2:
 	case LPASS_CDC_DMA_VA_TX2:
+	case LPASS_CDC_DMA_WSA_RX2:
+	case LPASS_CDC_DMA_WSA_TX2:
 		ret = LPASS_CDC_DMA_INTERFACE3;
 		break;
 	case LPASS_CDC_DMA_RX3:
 	case LPASS_CDC_DMA_TX3:
 	case LPASS_CDC_DMA_VA_TX3:
+	case LPASS_CDC_DMA_WSA_RX3:
+	case LPASS_CDC_DMA_WSA_TX3:
 		ret = LPASS_CDC_DMA_INTERFACE4;
 		break;
 	case LPASS_CDC_DMA_RX4:
 	case LPASS_CDC_DMA_TX4:
 	case LPASS_CDC_DMA_VA_TX4:
+	case LPASS_CDC_DMA_WSA_RX4:
 		ret = LPASS_CDC_DMA_INTERFACE5;
 		break;
 	case LPASS_CDC_DMA_RX5:
 	case LPASS_CDC_DMA_TX5:
 	case LPASS_CDC_DMA_VA_TX5:
+	case LPASS_CDC_DMA_WSA_RX5:
+	case LPASS_CDC_DMA_WSA_TX5:
 		ret = LPASS_CDC_DMA_INTERFACE6;
 		break;
 	case LPASS_CDC_DMA_RX6:
 	case LPASS_CDC_DMA_TX6:
 	case LPASS_CDC_DMA_VA_TX6:
+	case LPASS_CDC_DMA_WSA_RX6:
+	case LPASS_CDC_DMA_WSA_TX6:
 		ret = LPASS_CDC_DMA_INTERFACE7;
 		break;
 	case LPASS_CDC_DMA_RX7:
 	case LPASS_CDC_DMA_TX7:
 	case LPASS_CDC_DMA_VA_TX7:
+	case LPASS_CDC_DMA_WSA_RX7:
+	case LPASS_CDC_DMA_WSA_TX7:
 		ret = LPASS_CDC_DMA_INTERFACE8;
 		break;
 	case LPASS_CDC_DMA_RX8:
 	case LPASS_CDC_DMA_TX8:
 	case LPASS_CDC_DMA_VA_TX8:
+	case LPASS_CDC_DMA_WSA_RX8:
+	case LPASS_CDC_DMA_WSA_TX8:
 		ret = LPASS_CDC_DMA_INTERFACE9;
 		break;
 	case LPASS_CDC_DMA_RX9:
+	case LPASS_CDC_DMA_WSA_RX9:
 		ret  = LPASS_CDC_DMA_INTERFACE10;
 		break;
 	default:
@@ -184,6 +210,17 @@ static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
 		clk_set_rate(drvdata->va_mem0, CODEC_MEM_HZ_NORMAL);
 		clk_prepare_enable(drvdata->va_mem0);
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		clk_set_rate(drvdata->codec_mem0, CODEC_MEM_HZ_NORMAL);	//??
+		clk_set_rate(drvdata->codec_mem1, CODEC_MEM_HZ_NORMAL);	//??
+		clk_set_rate(drvdata->codec_mem2, CODEC_MEM_HZ_NORMAL);	//??
+		clk_set_rate(drvdata->codec_mem3, CODEC_MEM_HZ_NORMAL);	//??
+		clk_prepare_enable(drvdata->codec_mem0);		//??
+		clk_prepare_enable(drvdata->codec_mem1);		//??
+		clk_prepare_enable(drvdata->codec_mem2);		//??
+		clk_prepare_enable(drvdata->codec_mem3);		//??
+		break;
 	default:
 		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
 		break;
@@ -205,6 +242,13 @@ static void lpass_cdc_dma_daiops_shutdown(struct snd_pcm_substream *substream,
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
 		clk_disable_unprepare(drvdata->va_mem0);
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		clk_disable_unprepare(drvdata->codec_mem3);
+		clk_disable_unprepare(drvdata->codec_mem2);
+		clk_disable_unprepare(drvdata->codec_mem1);
+		clk_disable_unprepare(drvdata->codec_mem0);
+		break;
 	default:
 		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
 		break;

-- 
2.34.1

