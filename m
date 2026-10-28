Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182099;
	b=1Hkvj7VghxmJCFhbRPW5MIBVUklf2wGHFyIvxYeF7zY/PMZDNqb8JDW7edDwxICje9zz
	 hLnYm3ETGNOOuyLL/p2YGvcOxR/T8hGHY25yi6OPDEmPnLdkoNK5qCYhZE0vdBkG5vGlO
	 g0hLVtixGsAeBWfTxmUXGmctxam2iv6jUFanmik6gEEyUSlO/pzxjs1RNLiDJzn7J5amc
	 yi+xqBhifTV6+w9otGnYoBC7Z8DniJpAtg0F6Bj54118SRnx4gAHcjdnYZmAft5shqpCs
	 KUpptF7/u+jvjM/Fv83IKg/J66Xqgyn0qh+rThXDr0lItwcfQaMeOR5E9dFYk1RHzdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yw7pE9Jfr5b4VeVQuAsVUZi1Dy0jJV/jL5g1YIwpO3Y=;
	b=HnfGR9QQ7bEIqIk4Fz8KBv9UkjKMdpov/G4uM+8obIkUQbnUoh5tdQ0L2SZsdLXvy/in
	 9azBl5YZMb8PzopxYW1D73VQy8NR98W0MpiHyn+OUMXXH1QaHMRfoGEd4QfuWxMVZ1UrS
	 1jdj2q0axNClXn2aKEPs0y2KP/uzkMoP3iW+EyUeRVKkdEnZVnA0QY1OgWEhG6yLZ1nIG
	 MMzWZgjk/H61oJlliGSbW683dbnTbU9RR41BVyNVkqaBdVUfoJwTftHSq8c2ih6I79m6t
	 w+HItmIfK0FBHJzWcRUFlmBbqvd/U3/ZHPL1qfF323ySU1e9qRd4tP1+yYIha2GKdBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fielding.dev;
	spf=pass smtp.mailfrom=fieldingdsp.com;
	dkim=pass header.d=fieldingdsp-com.20260707.gappssmtp.com header.i=@fieldingdsp-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fm5lcbI6;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8E2606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC8E2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fielding.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fieldingdsp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fieldingdsp-com.20260707.gappssmtp.com header.i=@fieldingdsp-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fm5lcbI6
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4395d31228so110436666b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 03:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fieldingdsp-com.20260707.gappssmtp.com; s=20260707; t=1793182096; x=1793786896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yw7pE9Jfr5b4VeVQuAsVUZi1Dy0jJV/jL5g1YIwpO3Y=;
        b=fm5lcbI6HWmtkh9Xqi1j3jnaaS6voph8kCnlEwBe1SCnkbabeBPmMuJpSo1VegBOtw
         BhQ8Da6SN/mWaauLGWaxGNpLJLFplEsrWJjxMdrNhkYlQb6JWgKpDDf8DdTeEjy2bywq
         HHoqdJIwr7vWjLSjeAKLCMfolPdmnDmZQyvCrKWJ/Qg/pOdbcf3/qODTdfDy4+Y0Rdd7
         xCNTRvfZvjSIhUYx92qhPIaZ2uBX78rYlGPKxuDZGJWn7nM2HSzx8SUVQPzY9Yptcz2h
         qzYmmR0+WR11CtD3JKwY1NnBZqi8TJdacgNZqh8yeEhz+6uMHlZGMkEuX3WYCq6ItJmF
         OUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793182096; x=1793786896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yw7pE9Jfr5b4VeVQuAsVUZi1Dy0jJV/jL5g1YIwpO3Y=;
        b=cGJs6RjH1OO07xbCbyWHNKCuYdZF4FAizOAR3w2mHAjgZdMtCy44NLP01wfAeYJspu
         GdHsNsGt9DqfPjXoSRnZz+J+o0cNdAvgQiQYJKWuqazUaLJmPx+QvqEZk6waCC7S37X9
         pGquYS9TAJnDCPJZOlgYr3ueQ0WuqjZuaeRTJSIYdIxwYVWe2SH2K1zB2EyXEaBRGw+h
         omNpri6Hva99QSwK3qc9MlYwzA8Pt6Ie8rGiZweTyTdIQf5HgVptS/tfqy4E3kfeVjdp
         a9uyCdiAApq1H7WAPIo8Tzv1i4GOFX5F4TGxT1ymbJxJXLTClsDo7Srhj8a6tsiIQlUP
         ULjQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/THMx6P42yr42wMmfoWNtICiGIpkeyehYV6FToEtJdElqSjKgBheby4s19qHYyksqDlSqK+WIvLGDA3jf@vger.kernel.org
X-Gm-Message-State: AFq9FYIRydBm16QFoqfNOi+9hoNTgUsKcdgSEb1fQ7krciZClCc3Y8by
	/Dj1tRUOKBBpZngX9GgSkkoHfC2o0ULcVuOllJ6DFOuNMXUJfGRPPlGlWgn2/9qdx3Y=
X-Gm-Gg: AYBFou0Aw8pX+DYmFJUmMyhmrIymkXfCaOZIi4R3Mjjm3NlY+S53Led87FVvw84cNlg
	JgMhdXmprvR3Ph1FiYpN1eNB0cc1+5NTqcW77+/9NRaUJkBaP6WjF40mAqQe+/78/tfzICRkTc+
	ol0xHPb31IFm23HSvywUf4DIkksTK6hB2rzAnlINqZUhVeZwB+DpZwopcSeHP1akd1ySlLZCLPy
	ilq/BSkjVKTqvE0T1rylf1HTXHMIRFCAN/bqqHOLLLiKQ637PeTCuRe1TzhNzVFvm7+zrN9pNc4
	pAqqGxEw/0D5Z9GsA8kPDDuAsPBNHMB1DMXjPTpFVQRSTyGtQrVJt6G1j2TaVxjb7wcu2Hj8xnj
	r5OaBWhRdJcRPD8anpFFk5yNJXl7qXXjgkr9weIN0fOR1rU2xIt6OXs1WsV26aluPN4MsiJ7bgo
	9ZLWXuJdJgTTY5N1RmFGKx5uHh4muWN5SoTQjgil/oF4R3jyrc8JlUmBZrZEX91gkV6cBGsEGCx
	0UA1ZegUJ0q6oG77fQeG2yIvjOuv7iy78UtSFqyjBvD2ntMMehP1puwo2w4ABLrKPjUAtUAuqfa
	i0x4wjBqvMpVMlanLlXr3/L3S4I34oflC52yMlC8sZkUH6qBLtkxohSkEbTKVs0rurJuJpfAwss
	ZJTgIL+8lFx+d3P6CVLZ1FYhwSCq9qMQHqxqR6t57JhCeFe2C
X-Received: by 2002:a17:907:3f11:b0:c3f:c878:7c1d with SMTP id a640c23a62f3a-c49bdf2b6ddmr158720666b.9.1793182095755;
        Wed, 28 Oct 2026 03:08:15 -0700 (PDT)
Received: from kneiselgnabe.duckdns.org (p5b03fe53.dip0.t-ipconnect.de. [91.3.254.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7975b2sm588434366b.73.2026.10.28.03.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:08:15 -0700 (PDT)
From: Fabian Renn-Giles <fabian@fielding.dev>
To: srini@kernel.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	neil.armstrong@linaro.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabian Renn-Giles <fabian@fielding.dev>
Subject: [PATCH] ASoC: qcom: qdsp6: clear stale channel_map entries
Date: Wed, 28 Oct 2026 11:07:08 +0100
Message-ID: <20261028100708.6808-1-fabian@fielding.dev>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit c663014e452d ("ASoC: qcom: audioreach: compute active
channel maps from channel_map"), the codec DMA active_channels_mask is
built from the non-zero entries of the channel_map instead of from
num_channels.

audioreach_set_default_channel_mapping() only writes the first
num_channels entries, and q6dma_set_channel_map() only the first
tx_num/rx_num entries. The per-DAI module_config in q6apm-lpass-dais is
persistent, so entries written by an earlier, wider configuration
survive a later narrower one. E.g. after a 4 channel setup, a 2 channel
capture on VA_CODEC_DMA_TX_0 keeps the map 01 02 04 05 and sends
active_channels_mask = 0xf with num_channels = 2. The DSP rejects the
graph start:

  qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
  q6apm-lpass-dais ...: Failed to start APM port 110
  MultiMedia4 Capture: ASoC error (-22): at dpcm_be_dai_trigger()

which breaks the built-in DMIC capture on the Lenovo Yoga Slim 7x
(X1E80100).

Clear the whole channel_map before filling it in both places.

Note: this is my very first contribution to the linux kernel so I
may be new to some of the processes. I apologize in advance.

Fixes: c663014e452d ("ASoC: qcom: audioreach: compute active channel maps from channel_map")
Signed-off-by: Fabian Renn-Giles <fabian@fielding.dev>
Assisted-by: Claude:claude-sonnet-5-5
---
Tested on a Lenovo Yoga Slim 7x (X1E80100): built-in DMIC capture on
VA_CODEC_DMA_TX_0 (MultiMedia4 Capture) failed with the DSP error above;
with this patch repeated arecord runs work. Based on broonie/sound.git
for-next (d34a818a331f).

 sound/soc/qcom/qdsp6/audioreach.c       | 6 ++++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index d2dc5d37bccf..4ac65d9b5543 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -308,6 +308,12 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
 
 void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)
 {
+	/*
+	 * The active channel mask is derived from the non-zero entries, so
+	 * stale entries from a previous, wider configuration must not survive.
+	 */
+	memset(ch_map, 0, AR_PCM_MAX_NUM_CHANNEL);
+
 	if (num_channels == 1) {
 		ch_map[0] =  PCM_CHANNEL_FL;
 	} else if (num_channels == 2) {
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 83f2711bceea..12f139af8ca0 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -99,6 +99,7 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 				tx_num);
 			return -EINVAL;
 		}
+		memset(cfg->channel_map, 0, sizeof(cfg->channel_map));
 		for (i = 0; i < tx_num; i++)
 			cfg->channel_map[i] = tx_ch_mask[i];
 
@@ -123,6 +124,7 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 				rx_num);
 			return -EINVAL;
 		}
+		memset(cfg->channel_map, 0, sizeof(cfg->channel_map));
 		for (i = 0; i < rx_num; i++)
 			cfg->channel_map[i] = rx_ch_mask[i];
 

base-commit: d34a818a331f7e270fa9dc3db3d96f6a0d4fa7ab
-- 
2.55.0

