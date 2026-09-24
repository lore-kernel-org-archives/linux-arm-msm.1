Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48582E173D
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 13:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254826; cv=none; b=Ki0kvi9Fyk2spoEz6xACn+Kq4MVbnzx8QjbKnJC52eID1qZRs9aOf2HIp8Pc4G+8Kt9jTrJ/htoMVbCfQw/pPlrPtROe5XIdJdRKoKn/du1C3jJ1tG+04PjJcEKYT6K+/yzxohISSzN2aLDJdMCwOLOlqk4tE9AzUgFpAf3Oiio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254826; c=relaxed/simple;
	bh=U1jq7mqCQyHs6vQpqHJXpW79DmjSSLoLTMuyETHeyIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mk1apQTMEhqt338nE8JsWHBbWaKoknJb/oik5uhql40SD4HGaGaCF3b4qdljj4Mil5dgZOrm381JKera/hfldACS0b51bxElr2dAdwLa3Ox7nB1vUgtAd+VZnF3GS7f3VM3hzef/554BVnuUUN4vzAaAXZ5qV3Gp8tKLQPmTlgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=Awp0pORd; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="Awp0pORd"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939109fafddso136690285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 06:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790254823; x=1790859623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ocwU8cQk2ldFSEuc+V+JE9BeEEvSRHBC5G3LMkq6bI=;
        b=Awp0pORdEf0GMafvqz5hvj8jw4WWGo8AJ2gUrXsoRSbE94gIrPNbgfm1Bv0MuA9cdN
         dauA9lKTWI/0MhS1MD+L2SitarySJpBqC8kbi1ihmmYwurNBjikPPEiYk3dYN1024yNk
         U8v+bsaUaNYAKN0TMoLjQcRC2ZmlccukOajW8d3SfWiH4GL8Dm8KaCNMLlF6b8ZiN8gG
         AnApko7BhEcyNHdpdXm/A2mjgJURpEWDpof3WEisbD2uCRGJjp6ttET6fX4nM6Gg3jq+
         ospOw1cAJP80/3A78VJEofbQcwYFSauHTLYf5fr5e91h/D8xoMnWj76bHmVw6RXEJV2m
         MAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790254823; x=1790859623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ocwU8cQk2ldFSEuc+V+JE9BeEEvSRHBC5G3LMkq6bI=;
        b=rIMTYKJzkhDOtE0/Untn2mITt9gu5DeNi5mDG4ouzftR7Az3N+N4ZL+oAwDUzvvVeF
         tTxDtVE0HBWFD51CfxvNLduTcJehsrImCQZNCiysXacNeIFBebhd7msF3nZEd9Nc3TcQ
         KKMCv7nVsJiLH8ynNY5Ceknt6G4TH4bRXJLzf/i6JU4oLmIeEzkXiRGNZ5Wt0w387fmZ
         Lijodm/wQdhbMUNTOubQWZ+omif1jwxb+KbTVPGENKlgCAXOVH4elJrbzT7c/ITusu4W
         F5LQr1e3qskyZl1KAlYV7eEYF93HE24cRQm+ZVhrTAr13ZC/LaqZzRs6lY5fd/wYm/an
         28GA==
X-Forwarded-Encrypted: i=1; AKwUvBw77XKa46/D3G0dNn83e6Eio30FC2EO8OSPz/Qv0yVvQbckwa2SfL+px9AdtmuAd8/gfCbzimpW5dqOcYhV@vger.kernel.org
X-Gm-Message-State: AFuF++luKMGx6j81Wt6bKJtZMJDTd7qUBlOPGnZ35YUA0q0nnXHYl8pg
	NetMmGSnSHicMD1yFehegeaDYojzvaay4eDzn6aTrkmlFWa97Qj1JKT7hF79udt5wWo=
X-Gm-Gg: AYBFou1rdiASopZYLgTE48bR+oaRZdqgCgrNTvVZOAV2ctOmAwcgPK4LLtzb+MPApAT
	VhGmktx1NjjzlGzmhPsLlQ/354Bat6M6elTFyJxuVHRPYzDRQhWkV9ByuoJnQaDbvfuCvmM2waw
	3/2F/3aQv3XiZoAkvSWxXzCOm8NVukEDHlA3kMjBxJn9ZqTr8PRilykfnp00/J1UhTbTJIYPai4
	12tjKVFnwK1OX15qHQ/Ull+zmNFsFuTXv35wpgHCDHgCnkeauzfYZaeE2/9l6cozX5wYV/aWFHn
	3NLq0RUZAUoQz+dPpv4a9QAPjQZGKYJ9lX9JLBBUlIK52V4EcH8FRW0XoWgnE6bmEgnfRUZwlbL
	jAeHyjbJ3wkuIiR4ZRPbK97ZyDfqsOhM6nngS63/R01sRt6d0OXDJak/QWQXDBKeV2UPX62OucI
	iwybcJs2H9SoNZQ8AnOwhHpo+PigCDHiHkxGyCBNJcZxm9YPCv
X-Received: by 2002:a05:620a:700f:b0:939:a9d4:50b7 with SMTP id af79cd13be357-93c362d1a82mr302707785a.26.1790254822482;
        Thu, 24 Sep 2026 06:00:22 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2f3c6fdfsm285000185a.45.2026.09.24.06.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:00:22 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Johan Hovold <johan@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liviu Nicoara <lnicoara@thinkoid.org>
Subject: [PATCH] ASoC: codecs: lpass-wsa-macro: rewrite the interpolator volume after enabling clocks
Date: Thu, 24 Sep 2026 08:59:40 -0400
Message-ID: <20260924125940.22665-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 902f497a1ff5 ("ASoC: codecs: lpass-wsa-macro: remove useless
gain read/write sequence") removed the read and write of the digital
volume register in wsa_macro_enable_interpolator(), on the grounds that
writing back the value just read does nothing. The comment above it,
"apply gain after int clk is enabled", was left in place.

On the Dell XPS 13 9345 (X1E80100, four WSA8845 amplifiers on two WSA
macros) the write does something: a volume change made while the path
is idle does not take effect when playback starts. Lowering the digital
volume from 81 to 63 with nothing playing, then playing a test tone,
gave about the same level as before the change. With the rewrite
restored, lowering it from 81 to 69 while idle played audibly quieter,
and restoring 81 while idle brought the level back. Changes made during
playback take effect with or without the rewrite.

This is the behaviour described in commit 46188db080bd ("ASoC: codecs:
lpass-wsa-macro: fix compander volume hack"): "the volume registers
still need to be written after enabling clocks in order for any prior
updates to take effect." The value read comes from the register cache,
so the write pushes the last requested volume to the hardware once its
clock runs.

Restore the rewrite in the interpolator's POST_PMU event only. The mix
path event removed later in the same series is not brought back.

Fixes: 902f497a1ff5 ("ASoC: codecs: lpass-wsa-macro: remove useless gain read/write sequence")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>
---

Notes:
    Tested on v7.2.6 on the machine above, by listening. This function is
    unchanged between v7.2 and for-next; the driver's clocks moved to the
    PM clock framework in cd054a6e272c after v7.2, which was not tested
    here. Build-tested on broonie/for-next (arm64 defconfig).

 sound/soc/codecs/lpass-wsa-macro.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 4242366601a5..899c8bee4645 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1849,6 +1849,7 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
 					 int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	unsigned int gain;
 	u16 gain_reg;
 	u16 reg;
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
@@ -1890,6 +1891,8 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
 					CDC_WSA_RX_PGA_HALF_DB_MASK,
 					CDC_WSA_RX_PGA_HALF_DB_ENABLE);
 		}
+		gain = snd_soc_component_read(component, gain_reg);
+		snd_soc_component_write(component, gain_reg, gain);
 		wsa_macro_config_ear_spkr_gain(component, wsa,
 						event, gain_reg);
 		break;
-- 
2.55.0

