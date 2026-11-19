Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108091;
	b=y2VT1u81Y7RnvpUSjX2zfrYurcMeimxEIgvwmbuD4UCdJd7L/C3xRSvPbyQegg7pQ6Qj
	 TW177hYvkiOCLxqyP42X2Hqxa166z7SmCKIqF/JrrzQ4Fxe1jjU87gPKaY1twLK7Gplcu
	 kAOeV1gX02hdter7kMacfkRn95/GesEY3LbnUovZuZr6tjP5PYixTkr8xOoepXDfWsAKc
	 aa+dGFOtG+xYEl6+9VZixT7qgGtJjvl0jymeXRAMohH8b/0G+oPE2euKe9a36/RdXiaS6
	 tWGKoBrDXD12pw1AgwIMb1bZA5AwjxeVo/xc8go2mxxu4UTUm6J79aTBZwd3DrD+M5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nb8Ts+L+z/DpTGbH2tq/3CpL8ayCSrXAUIaUzn6KeKM=;
	b=HIE+up4iimptpq2kKgTuZ4P0TMF30TzMOOyNbaurS6++ksIzRNbuLnx9Y8CGuP1luYUv
	 qA2rLskBbd5R0GWpnFh5mVpZXfxU/ALxXVQTps5X1gQ+gDAYZjFa7/un0KmDauVV5UBW9
	 mKUq+ApLrYLwbVwAVtviRRjdaESU8qSrUn5hDHd7p5FBd9c0OErlnytyF5pw+5AE+9AIp
	 MsKZUkp3uXrNjl51YYsGjyz7v2BRTLUjXdtIwC90hIc4I1SF6ejV/roVdm5HYgxSeK82h
	 FLeTlWB6BCPsqmnkzcikDV0FLgylDDtlw24Ua51tIDNkNDDAc/TGa/Dy5XpEXS52vTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mt+Uvlc0;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EDA60A2606
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 17:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60EDA60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mt+Uvlc0
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3c459a35eso24974a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108091; x=1795712891; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nb8Ts+L+z/DpTGbH2tq/3CpL8ayCSrXAUIaUzn6KeKM=;
        b=mt+Uvlc0ci9UzOY5SdxKwQpbYeDDmxdZYa1g4FdQttSKyQ0M65AP7d7L/7rv539F4M
         9ElHbrhLUKguXzt6hN5sIeq749PR2K6fIU/P4v96oJWoXt7ts+z41Fzm5zU9lhVicqEf
         uqZsXo2xAQoVRVrc355YgLTCid7O4YY1JtTrlOSdbfYPkNzcjWYv5l/QHA2PtZqnOP87
         9iGjjyW2v8O/ZRGfGJPSWfsZuihQF6WXxbskpBusqgRvU9iTwrkPI6mAyBLv3BZTwvD1
         ZzG8bfjPTYUYEe+iVnv4dg0wKm29+or0/hSxWegWMgZtskHVxtL0pMbqTZkSfzu7WGAk
         FNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108091; x=1795712891;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nb8Ts+L+z/DpTGbH2tq/3CpL8ayCSrXAUIaUzn6KeKM=;
        b=EysWha1jmkGEdHLl514u3mr+KEwKJqCN/Y0TKXK8J7KBkEfhmZLFZ01+33aO1OUKXo
         qL8LpXhieO9Htq09iBdkEFmVw8153YsRHUd793PhO+QhwpxdMlbExKFBl0E4uQMBr+gI
         SP7hF5ahmaVhgPWpFyI8o/WUJAOVSzwmfyMxk+QTzTEnc4jeFxrAeNDpjpZ+mTYVZLlU
         J+cyye30Svmcez48YRE2mICWrYTJZ+zzIGct5iWrG49HTTtxz+gb05yjFdJbNKobMe4M
         NI5IOCAdLy3zjfzy8E8pFhelLygLm68ROxQfNYyds14trAnkJHeZ/eZXIOGqQb9P22no
         oI4g==
X-Forwarded-Encrypted: i=1; AL+hErGyqiQaRIaFSAr415KGogfdkdCzfAB7TJGNLkegf1smbjCbAqEGMHHd9q1D2Vr3VIreP+7Lw1T4S4lsdUVd@vger.kernel.org
X-Gm-Message-State: APuU4Z9gCE9QI8nJgZioClWhYcHLN+KwR7zMygz9SMQ9563r6/VgzwMA
	j7oM2d91iB5TpN4ou/6Z9ZaFQhHMJ58wlx719ZDlkAnczk2yuKAg/VTVsZm9tu2SdlN1dFykhSM
	MHZc1V9DZQQ==
X-Received: from pjbds10.prod.google.com ([2002:a17:90b:8ca:b0:3b3:b3a3:5e41])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c0a:b0:3b3:c998:6d6e
 with SMTP id 98e67ed59e1d1-3b3d07c68a0mr7206916a91.37.1795108090513; Thu, 19
 Nov 2026 09:08:10 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:58 -0800
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
Message-ID: <8af31a87f52c4cebc5ac7db6696a91545adb6ac4.1795106962.git.irogers@google.com>
Subject: [PATCH 1/2] ASoC: codecs: lpass-rx-macro: Return early for non-HPH
 interpolators in HD2 control
From: Ian Rogers <irogers@google.com>
To: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

rx_macro_enable_interp() invokes rx_macro_hd2_control() whenever
rx->hph_hd2_mode is enabled, including for INTERP_AUX. However,
rx_macro_hd2_control() only assigns hd2_scale_reg and hd2_enable_reg for
INTERP_HPHL and INTERP_HPHR, leaving both u16 register offsets
uninitialized on the stack for INTERP_AUX before testing
'if (hd2_enable_reg && ...)' and writing to random codec register
addresses.

Return immediately in the default branch of switch (interp_idx).

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not tested on Qualcomm LPASS audio hardware.

Fixes: 4f692926f562 ("ASoC: codecs: lpass-rx-macro: add dapm widgets and route")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index ab8a1c2b0489..84a3a47cf932 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -2414,6 +2414,8 @@ static void rx_macro_hd2_control(struct snd_soc_component *component,
 		hd2_scale_reg = CDC_RX_RXn_RX_PATH_SEC3(rx, 1);
 		hd2_enable_reg = CDC_RX_RXn_RX_PATH_CFG0(rx, 1);
 		break;
+	default:
+		return;
 	}
 
 	if (hd2_enable_reg && SND_SOC_DAPM_EVENT_ON(event)) {
-- 
2.56.1.708.g77570a6a1d-goog

