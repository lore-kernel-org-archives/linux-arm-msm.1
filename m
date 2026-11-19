Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108097;
	b=axEXScAusLqrMUw9qz2klIY2u9mglQfnMSStSqyj3N4DmbVLykFA7XBStJZRT3L2lkF5
	 XB5X8A19O31+xO4BWzS9u3Z4pnVcJXVufukp+/7Y4/RRLq1PYovOGKc5bI4QBWNrhBOYd
	 pQYXFS6CjPywkNOboUvBWlFjqLJzoUNrrs2qAZGJyf7aZqnyulxLBqya7gi+gk7PKV8ug
	 Dws6ICShRq3fkErs/uflNf/Ohw0LGCTmUtIVmjKrlX25MytXk40J63y8bD2UBtXeNWnC6
	 SRqPJVa8TOmENU4ZlEpg3mlX4HJ7eVU2PVBrhlDeiDfmi+sjBZdFcE8ZpNGLGkNRbcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ghmmPH2pRPCD8AwyevzwpwCC/jzSYHUp2/6zeVVdZoo=;
	b=pfhcGbGeDz3InGusRsZ/vfnOojXb64hL0SyiniZtHOhLd4tbpdSD52ckgBgA3hOQO0Ba
	 RD8Ob2YCQ6tC3lG2JM5NXUJKalHhMt7mL10AUyQUXNuhfhH8Itjaw+azvQH9vVW6DtQV1
	 jzdryCV2xdaDKEyXPimjZCfvyAdhSJsUGYjPIbrRdXmHjBp1gQv5tI4O5FVSJEvDa9IzE
	 UkWuA/LYUa2IJjju/tmFnootMhLiY8mOrpoMoLKBn4gmpcqfx+foiv91LBmQe3ZQeTF6X
	 cBLJ49XdVC2hsLbz6D81xbsgov0ptvxCmlU1Ld9BpbUELSkN8KMw83ej3zn1L6xCq/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="gGHa/39Q";
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106BB606A33F
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 17:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 106BB606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gGHa/39Q
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383ec96a7deso1419309eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108096; x=1795712896; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghmmPH2pRPCD8AwyevzwpwCC/jzSYHUp2/6zeVVdZoo=;
        b=gGHa/39QLPyCZ0RgBw8vLO5i2C5OU6Vs5rt36RyPTS8CI5ngk6cAVvKkALlvpa/ofA
         Dnjs++Lua8gLy2tHZtZTr0Pm3F0+C0wwo1MGF3Ltl5KkT3rj7USwYH83D3TSxUfAoFFS
         N9Ud74nfr5Fz3yGmOvqmK0D5QyCWlPfb4vOfKl7ONEg4lzdFnRy7nMEOAZy3nNy+6JUy
         fVbf5+AvdE/Lyko8jMwJJEASxjpuP+Vpu1SoV1hKXqfXrTz2OknoW6GnTuT1JnCiOskN
         Epusush5r3HXOLZfw6vCBurVNfGslL8BRMvFsSp9EkZsZHnz9EX+OvacpaBMVTcEwHI8
         cbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108096; x=1795712896;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghmmPH2pRPCD8AwyevzwpwCC/jzSYHUp2/6zeVVdZoo=;
        b=Ghp1A2ihylsNX8lce8XZvhsfC0eb4eC8WkIBxtNTvBTnv7V70c31rr9/9rsUNNZC4n
         nDGzuIdcTCKRxa5TD3Gx6rgx37uDnAT15LdKNLdH1dhSGsByUwENnutCAmEj2d9D7tHJ
         sxOSD3yd0Xjz/+tEjYiq1w4DOsvPJZpMH4pKeYzBUaEbpy2sun7JlfYowykv2ZmMzhUg
         acAI7PudvWLXIS5uHKuSHj/sa/4cbbYN95utS5lrPsPH4MiaoMCOtuUD1/tHcfF7bG/f
         WytfGMNqKo2EwP3J2V9MaqqtWxXu0mbaczc1zEFEHl7llViu6d8rgL04uYaWAy1HmxuW
         Y9Gw==
X-Forwarded-Encrypted: i=1; AL+hErGzeDcU06vGM06jtjIL1M4k3SBMT8//Pw6j42Kgs93vEvaZegwUy/ir5HPsjH2O+WkZSzuf6TxWJPwT/cr8@vger.kernel.org
X-Gm-Message-State: APuU4Z+/ApcsaWJ2gzQO0SclJel140CD+gWPDgg+mjaxtSOVMB+afK5f
	11mU4+a9F/4OeLQuDZ6OwrD/Ir6O511YufZA8zi45wx3reokJLPeAJ7CDMnE1kkGy8XLfPu6lVG
	YV3OPYXC+yA==
X-Received: from dybdr19.prod.google.com ([2002:a05:7300:b293:b0:375:861c:512e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:db86:b0:384:d59d:199c
 with SMTP id 5a478bee46e88-3856c2c3fd0mr22119eec.1.1795108095991; Thu, 19 Nov
 2026 09:08:15 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:59 -0800
In-Reply-To: <cover.1795106962.git.irogers@google.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <cover.1795106962.git.irogers@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <1de898fc85710c85f6f90bb685d3be109f44c2ba.1795106962.git.irogers@google.com>
Subject: [PATCH 2/2] ASoC: qcom: lpass-platform: Return IRQ_NONE on invalid
 DAI ID in DMA ISR
From: Ian Rogers <irogers@google.com>
To: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In lpass_dma_interrupt_handler(), the default switch branch returns
-EINVAL from an irqreturn_t handler, which triggers report_bad_irq()
in note_interrupt() instead of reporting an unhandled interrupt.

Return IRQ_NONE, matching the other error paths in
lpass_dma_interrupt_handler().

Found via Clang -Wassign-enum on an x86_64 allyesconfig build.
Verified by building sound/soc/qcom/lpass-platform.o with LLVM=1 W=1
(-Werror) and -Wassign-enum; not runtime-tested on Qualcomm LPASS
hardware.

Fixes: 7cb37b7bd0d3 ("ASoC: qcom: Add support for lpass hdmi driver")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 sound/soc/qcom/lpass-platform.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index dad4becf7579..45379604b689 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -963,8 +963,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
 		val = 0;
 	break;
 	default:
-	dev_err(soc_runtime->dev, "%s: invalid  %d interface\n", __func__, dai_id);
-	return -EINVAL;
+		dev_err(soc_runtime->dev, "%s: invalid %d interface\n",
+			__func__, dai_id);
+		return IRQ_NONE;
 	}
 	if (interrupts & LPAIF_IRQ_PER(chan)) {
 		rv = regmap_write_bits(map, reg, mask, (LPAIF_IRQ_PER(chan) | val));
-- 
2.56.1.708.g77570a6a1d-goog

