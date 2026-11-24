Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541545;
	b=K/45Q1zrMw+qmr/5n0VYw4R7i3ahDnynT/gKxR+7O8Z50tiDH9e41P1l1ol4PYULgSO+
	 znPGRCqbnUSa/Fu5+8hWtXSvGlML3lHJcXMnY+z2seOnOBlSD5PjGI1MOQRUBhNWks6Ad
	 9rS9qNsEdSz9RVJAP+VB23MIZ8wW0J+7iXb2yHpMaiwbvaag4UHyZFaWH7UUOhpRgq6wV
	 EpimHQGZ8xLqSA1P4wi0kF+rTjRIy6Jl6PlIOYZk41uptFejYQgZ5YEMKQ6UgWDpkjml3
	 FH8rln7U5TeUWUDKnYWRChp6wG+RxQ09wF9Y2/FOgQhVDGL3aIeIfYofGOKX2LNGVTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=mElIxptdta46/R9CCcDiVZtCz+nxON/yJk/P+Rr578s=;
	b=E/hCJ/gfQlPBul6k07IMwqG46TUwMFVDQMtoRq27nb/Bw9GZjsdz8QcCzS0ap15QXO4n
	 v9j/6uQlXI0n0yrUx/k16ZnrOmXcTalfMJq0e6+zIEaGiQdYXrXjqdiQ3zeUalaQNLbZs
	 FKS8tQK7xA++UQn954C8THWscW+MdvFjrAH0ELIM7VFFMYJIsNbmmMSnpWkVTp6Oypffl
	 WYWMsoe4h4fN7Bj1riERE4JoAw8NFV68yN2rDyo84WBi+yNr2RnjJmF4Y111tO1mSv9Ng
	 ArBOKNf1eOhL22POrIltkTB9FmgwIVsLK1wmG+axglJtSoBQbQGlXVbRvI8G6JgQxMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SYGXy5Ap;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B3C606A689
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B3C606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SYGXy5Ap
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49a92144733so2362730f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541543; x=1796146343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mElIxptdta46/R9CCcDiVZtCz+nxON/yJk/P+Rr578s=;
        b=SYGXy5Ap2u/X5/KQA7XPp07sMy5CgEguqu7FL08TXFm/hqOEQruZbw1hMZsKonEV/l
         HOJYbNxnnkiaXjP+iTfNjDb+tCtb8lgbQdlT1/bk2ppPOcgY4HXPs+bO+3wDsxDWhWvj
         /cRKaVH1hAR+hIFtV4glDO+OBWJNnMeebm8W5+O8SCZMkYZIiqkSlHqUi3SJRyCAaRPp
         hLgZlkjKz6wWatMVSQsiI/K+g7CDbHVlDU4m7f3Rw1ja3LW3xJHaotoAE+s9XGycvEiW
         nkysYRYQrV+Ed+F3/EwlLq+QkF+3oKt7Qbn9nhW+QRpJqvJN9FruCRU3crA1YArQm2j8
         AFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541543; x=1796146343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mElIxptdta46/R9CCcDiVZtCz+nxON/yJk/P+Rr578s=;
        b=LI6OoCB1ib54M7hRywEDw2E0sI0t6eX1J7aleccLEf3rzKApqvTgo/p4wG5LaYU0MA
         oszCppqqcmOkk2LV/ITgLI1DnRnaZPcATfO1zdgNBS2vKMTGoDkCNAqE+4Z2n1w2PDDr
         6gZjPfOdqJc1IFPDVFKcuRD0SbNyto/0M9kWlbHp7jRQuh6rrvJF2TcE2glAHyQvdNzC
         r6AkxLqwoLsIQmbyjISvDei8Pm5I5pS+hmlMg5DWJU66dnRq/oJ0Kb46NhV1R1zugTsr
         W4HlLDLpOe0mnx21NFeFZcWlWAriaqc5scJ/ualf96L6DKTFCbhoDbsr3zzLWbJCbwuc
         1GRA==
X-Forwarded-Encrypted: i=1; AL+hErFm1w9UXJ/9eOUTZeqmBzdL8ZN2RQ9kttVJvQ5NqXZxX8ybb2IGiN/O9chWngSochoiu2vNP1zEo/5gWgV+@vger.kernel.org
X-Gm-Message-State: APuU4Z95nbFUAhj6YdTWSeSN3ExK1Quler1hzGP8ZZZEp8kVop57El3t
	D83ES1kAip77TlenBm0Pf519Gw+dHg+1E+MMR9YC5gJeb9yZP3Kp0Wo7po600GZW9DA=
X-Gm-Gg: AZFdTZe3ll19b3B25P3HRLNMWrm7AY4hCG1CJ5bOYkdbloVk/6kbMUI8iSWVYNwqDcX
	grRDSw6iT28RhEuFtZYQM/ihk+plo9/tL7MWuioLGpdCCKXCtovJ8H8eOOTlBNvfShL4XlyBEb+
	JEd21d3KPR7e5IAhoE+pBfkDk6Q+SIADyLNqn3Fu4pyE7GUrTrXUduk0r8TClp6SFw1skZ8Em/E
	Ql3OFMN01tb03G1lDkmwWiku2yE02HVjwuTiD+Ex0CrgFQjgEq7qGEW8PVGQoADSmzMGlZu6CyD
	jSnYkwT92oiihX7XLt3uO+uWg0F7xtSOEvyiw4v464zlCYNcXKIIPTgHSbKM5focakFBLvnl7qH
	nPfOWlc1QhQ0k28UUs9FdhQ8t4UBOlItpz4UnROIjAhHNQNHkf909ZNOHZ8756sl7FYuwVRYgFr
	Zk9ZDtR9oElqv1kNB3VDy+z2XfLZluZ/0AQLOnhOiAlHFFC/tBuW7PvJlJim019wNDRLXX0pLLA
	Z5foKDLEfrY9cDRu/Z4CRdwDESbqB5y2Z/GEgj3bZs5VnEKgEtLqmWRKLIvkWs3LhqTru93kbDB
	Yuze/gkVS96UrZcgMosGM2bGx36sccqzdNO227jqMqs6FOG1BA==
X-Received: by 2002:adf:e197:0:b0:4a4:14db:233b with SMTP id ffacd0b85a97d-4abb3678774mr26445608f8f.12.1795541542844;
        Tue, 24 Nov 2026 09:32:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:09 +0100
Subject: [PATCH v2 02/19] ASoC: qcom: lpass-platform: disable the RXTX & VA
 DMA interrupts on stop
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
Message-Id: <20261124-topic-sm8650-el2-v2-2-174e159f0f69@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2073;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/fsIHu6LLX02EBqFrzxtmSXw80zjZLf2vPoqG7Eq77I=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcoaUI+Ey3cpx0oclxJ0BXcgHjXP65kiip5bZsF4
 lAYCriyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKGgAKCRB33NvayMhJ0QQuD/
 9pJ9+7KRKgBDU43qgCv+lNJYfANeC2u/lWlHn7lj/L+rtHC1bC/dnwZ9MKq0FokNeYhOX3KkafaNBC
 JEnp4fIJSy8vMDejmTUsLiNTDm2xt2WG2kcf0YcyKS8v5LCIQnRdgYC9NyOsTZek1AkpvKQYW/AHN4
 sE/LUiXpldjN136fa4G9Hpz9nJAr9PU5wRQOEPlMxdIvb8rO08iQDfv1dzhrtyjp6X674F83QOD5Gc
 2WBm4rfbqbcDZ5GQ2z9djiBaijVzHUIuldz90XoFybzb1w8L70TyyXu63ePVE2RUeMuRc8FMp8kyOh
 uklsd8vrZ+NMKjCFtlaImyDaQr9KDVpnXA7qv/U+Q4B5tihQcG1s4zWkwYESgzrKZRMzCfU6BhW6qa
 RJvClCA1YStk+grQd7OFMb+VHK+EWHy/Loor9fU2gFuoKg3AY1SoPVVhe+wcuIdbqjH8uyQIBJk/6r
 +624C8vjUIToXwKU/Xfg7dPhUPZyLWNfrftTFaiNC+bm3zS1O84AmtBQTyKyDLnBDCzq2pKWhnbFKx
 6nSmMLOdRHOqDwt7ZoKzMMj+ntgYrHqvdFGCfyYs/EdUORbYB2gORzUfb1bKDcgYNvAaZOldcrPKli
 qApjQsl9XIWZbkw9CXE94le3TeSIMKUwsKNbPsfH5AT3YXA4Swwf5QcNAqrg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On SNDRV_PCM_TRIGGER_STOP, SUSPEND and PAUSE_PUSH, the RXTX and VA codec
DMA cases set val_irqen to LPAIF_IRQ_ALL(ch), so the channel interrupts
are kept enabled instead of being disabled like for the MI2S and HDMI
DMAs. Once the stream is closed the substream is cleared, and the
interrupt handlers ignore the pending interrupts of the channel
without clearing them.

Disable the channel interrupts on stop, and drop the irq clear
register setup which is unused on stop.

Fixes: 7d7209557b67 ("ASoC: qcom: Add support for codec dma driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-213518@kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-platform.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index dad4becf7579..9666049ae51b 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -814,12 +814,9 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 				return ret;
 			}
 
-			reg_irqclr = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
-			val_irqclr = LPAIF_IRQ_ALL(ch);
-
 			reg_irqen = LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
 			val_mask = LPAIF_IRQ_ALL(ch);
-			val_irqen = LPAIF_IRQ_ALL(ch);
+			val_irqen = 0;
 			break;
 		case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
 			ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_OFF);
@@ -829,12 +826,9 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 				return ret;
 			}
 
-			reg_irqclr = LPAIF_VA_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
-			val_irqclr = LPAIF_IRQ_ALL(ch);
-
 			reg_irqen = LPAIF_VA_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
 			val_mask = LPAIF_IRQ_ALL(ch);
-			val_irqen = LPAIF_IRQ_ALL(ch);
+			val_irqen = 0;
 			break;
 		default:
 			dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, dai_id);

-- 
2.34.1

