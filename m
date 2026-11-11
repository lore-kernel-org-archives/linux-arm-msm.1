Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384392;
	b=Yee+UOjaQudpxHJJ+EW6A1iiA26gvot70OJrNiVVn99SjExrlA6OJQ78Uy2IvC7+rTNt
	 l8cyP5uGBF09Aj+L4M+S5vk5KRQKEm178HkIcP9JsiW0P42u/u/my3e9AVMcAKVxy5/Vj
	 M44wyhvVgVSvFvz50UeeXkC2gKERpSdC7IwaeYHCQbxkBSjQDuxhWCD+SqdYZTYY4o0hL
	 3+aaTTcZ/jpr+34azjoM/lHWLJjNIoH+69QV/7dJZc5XBDOEFrqdSK7pQtmKNOitV/Dew
	 zL5TdDkwJdu5d2F1Zxe7BO1m/iscZ+CIxqhP47jwFbMnK1vxTbullBvd3SM/UGzAw6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ilorIFABOQKAQ/aKTk5K0G4CTwEpXyjboWX5m7/i2y4=;
	b=SBvFTjqvxyDZI4A1S820Gha2JstFZJWHbN0enjhOx1r36i79IwQusAxf4ksgfSHWfWYA
	 kAOiLQlfFlGmV+wqo96+svkx5st7omcz8Sv2ydJ0ttSCeJGeNdC1rwPkr8mTFr03FgGtV
	 7vrHpCOSSmvRPcr0RDaGJi9nMndUT34QojJxyyoR//6rIVHoQoIJIS1wxkoqzw2XQ0Enx
	 w3/6hRDaMLc4+VpX7vh2RcXpp7eRdbTkMuJMBlhoVBx3VdkyXvtSZczoaEKIJclUpBD7o
	 T3DIQBlodsOix9SC630No3S9iyAxmdq28QEHrBwMSi0pACDEWRd2MmMI8zkjnmt4OHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=mCt2Jvyh;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B72A606A338
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B72A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=mCt2Jvyh
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b7245ab5e2so4186959a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 00:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384390; x=1794989190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilorIFABOQKAQ/aKTk5K0G4CTwEpXyjboWX5m7/i2y4=;
        b=mCt2JvyhLbIgpcDDRzYJMS/AVmNFEiu4KU+zCdVMvmuuRbKRK9epQhkcBsuUpfxDku
         Jl2L/qrw8crgiZXeHafeJ5vX+QL6NhB/HdVNPVl/HKAqBtQjQcisV9PtXjjPwzs+6l46
         pTTPCwYWrmThkGPUqw0iD/F+Hxmncx1huTBboJhQGIrVCKPn/H6lD1NbnWV2CnOx/DOp
         GYnIAF6ZszzfgUiMPIR9qgbsH6E+VlmQFixUIWgIeDFYra9fPHC4yqK9I8UXp+jQzK+U
         UTcqxm5jaAR+EY/PspK+eyYnhc3tRPSFzxZC3NXOCRb+w/9vCvBvfTu1i21fBHDouQ5o
         kS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384390; x=1794989190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilorIFABOQKAQ/aKTk5K0G4CTwEpXyjboWX5m7/i2y4=;
        b=U/nfTIcqBU0QZXC3fvKSht2ZQFsmtBuhnntWq7P29H26/jcAlkl0hXAF7QZwHLGHA1
         HoEMGHkZQRYf9sS62I++Vvu1X5PJZH5HCgy8+L6wErPLTq4gmSZG7azFEiR9IWAko1t5
         JEP3vI+TK+ABltHcJ3JsGoLnx5V0eBHMeQGHKVVdvFct49GUxika0MPuBeV48T1ZePvb
         zWmEiIVpv7Z+xoiEsZRDXlBO5x8y2jVbFMNiG0zR5U3mcfaMNg8SAFuQmLTVnNc4DGhU
         jmee5nZ2mbgW5QbL9mnE/3aOzsluRe+ffPJgaQWJ1KN4yrsxJ8XxQYAK1vOz6JCbW/gS
         fIYg==
X-Forwarded-Encrypted: i=1; AL+hErGTx0Dtizw0Xb5PQRJF+4fybpRVETfTWv7O0DGVq9g80znnIZa1Ah1oNwEcNf1UDsEmTxGP/xtQt1bx9nPe@vger.kernel.org
X-Gm-Message-State: APuU4Z+AGOocZ03G5eBQiZftFWtk43TGM/m4XRyvQFyDYLxjvYilAnYU
	j0Wc9/5NXZHnftDUWUZh/FmAuZYNETXWrS8KeVo/iL2rErK4gifRrlJuzneIHZAzBg==
X-Gm-Gg: AYBFou3GlK+HiLQTlCMt3n5u0NHQWO/z8eNlSlcW4GqiVYgV3WU3FXZ0EFctfU05cHo
	PcK25ipY1QegzlGclZn2YZ9uGL7NRm+7Gr7a+epm14koH171x1S4C0dawVypSTLsTeb5HNa8tHn
	Y0+zKfm7Y92eMFcFMMXCdUSBE6X71d45w186SsEDfURslG1xSQzWejz0ALmcjUUUjr09nJBpoy8
	U5TOYpyLhRAYiAU9GbLWXfa6pECgOiSEjuLa2h8Xt+4Xl16qs2lWIOEs5gX3o3tIAcWOCKM5WTh
	Sv1Rar1Vz+aiLlhV227ED0x6wax2/kIMmgzleQawRDDA2hTmrxdMYaxZgKnDWRymVblDIa8zhsD
	pGVzC/nbbx/HkDxmfzk3m+oZ4WHlLrXa+YZllocTiIoSmwWxSIH+ESVnSXTimCSQO9ZvZC8D/o8
	ppmGPtrbi03aOZP2dHseO3dXwj7iNDKVZ2/KgW9pegVTPbaFn39MA9yVfd7xVEYJR3xrIS+DVeo
	pbxU2S8UvuXIMTKN5PeSVjmWIaYhgobHK/lSh9QVdjSSwyhGkAXIlt9/vjydLTONiglfdR2Xscb
	4RO5yAvxCM4JFFRD0j2nbqvmaTdMcL1yNXzIoiYhvejDKMXcwKnaTXsCbNch/kn8cpUFZ7NxKou
	961QNmf7JjbE7AkMNpnPp4Ijjz43MOZAIYS8gjnlZVFxHsFLDyA4Psb3/CvK+wo1x/7TMtTkvYj
	7YbZDdjZD1ETLwPuHNNra0gz8jUMAUuF901PvwYgMP1im4jdto5VUYC/n1QF51Zv7PzIuTrTEFT
	GTFcDOud4e8gItZXGKUUgdxhDUAnXK+aC8wCUFhFkV5maYk84hQa8eGbW1yfi/WLib7V5u6ljvi
	zhj4MgsY9D/QkafjKjE=
X-Received: by 2002:aa7:c0d5:0:b0:6b3:d0a0:39c9 with SMTP id 4fb4d7f45d1cf-6b7773e790fmr851218a12.6.1794384390543;
        Wed, 11 Nov 2026 00:06:30 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75775fcf0sm2287549a12.0.2026.11.11.00.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:29 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: qcom: q6apm-dai: reject compress rings larger than the DMA buffer
Date: Wed, 11 Nov 2026 09:06:23 +0100
Message-ID: <20261111080624.244291-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111080624.244291-1-julius@bairaktaris.de>
References: <20261111080624.244291-1-julius@bairaktaris.de>
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

q6apm_dai_compr_open() allocates a fixed 8 MiB DMA buffer, but
q6apm_dai_compr_set_params() takes the ring size from the fragment size
and count that userspace passes to SNDRV_COMPRESS_SET_PARAMS without
checking it against that buffer. The compress core checks the geometry
against the runtime buffer only for drivers without a copy callback.
q6apm_compr_copy() places each write() at the stream position modulo the
ring size, so a ring larger than the DMA buffer lets write() copy user
data past its end, and after SNDRV_COMPRESS_NEXT_TRACK the copy starts at
the next multiple of the fragment size.

Reject a ring larger than the DMA buffer.

Fixes: c317d148a2b0 ("ASoC: q6dsp: q6apm-dai: Add mmap and copy compress DAI callbacks")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 58beaf906b9ff..80b837992b429 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -990,6 +990,9 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
 	if (!pdata)
 		return -EINVAL;
 
+	if (runtime->buffer_size > prtd->dma_buffer.bytes)
+		return -EINVAL;
+
 	prtd->periods = runtime->fragments;
 	prtd->pcm_count = runtime->fragment_size;
 	prtd->pcm_size = runtime->fragments * runtime->fragment_size;
-- 
2.53.0

