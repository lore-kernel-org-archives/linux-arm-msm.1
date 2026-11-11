Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384394;
	b=B76DMv/Jumbo5wm1C3ifkX8atR8rwZGuXERgMmfRU0dHH9KBedlpglN7l+vnXTqRSzsw
	 YtMf3vp4kHGp1aHOY0ru28F060Ks6raV8OVspgYd7SeCMyjwVeFSjg0xvskZt5XRIQu5a
	 ZY7mOSy4YAygMG0I8g5VDJFExb65xlG1P2L+Ozzz/W6ue7hYBpWXRaOEyYDOOioBR4BvD
	 Vhy3zrlWxxk1vAbn3de+Y4+noIWvVtXeD3nnuybqtwd/9xbf3cueHO0ImI0qSSkSD/jD/
	 XVB5QTR4COK//lk7KIY0LKrK1ldH93b7T05OfiwGjdGLiS+2sMc0BjysB7VMIbQZE/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yaoNnCGUQ/v4wUYqXN+PQtsNa51Yg0GHDR6Fpdr8qLY=;
	b=Fko65rTecRy2OXIKHc7fmjxEB0ABBKy8Dj5c0q0wHFTzTGBmExGXfdBo2h4t3rkd3gL2
	 qdX3x169qhBFgVc6wpyvUWLJv+jkcYRp7mA/emJ9WrHX0hJD3NDIeGG6RmwJdISF0RP54
	 ilSaYzDVwVhmrBDly4Ht5TTuknF2GWL93HSyUA1QGRcY6QpvWGI4cqprG+aYRqvpkgDNb
	 5SCmQB8aUAOmOq5YQpj9X3rKrqw5A/4lVpwCSViqifmhtdStDxeuuzLWMqhp5hYpFInJQ
	 Ffflg+sKrGPjs5ugTlxWUO0Zai/CWspaj33CNmc6OmyN9bj6tvraA+dNISvk7nSdhsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=bMMqwkz1;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F1860A382A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96F1860A382A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=bMMqwkz1
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so1851714a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 00:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384392; x=1794989192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaoNnCGUQ/v4wUYqXN+PQtsNa51Yg0GHDR6Fpdr8qLY=;
        b=bMMqwkz15zAsCxFpsBJFK8CPiZ34UgVDGidaLnh1/POTCZVEOPzM1KZIFlcipqjLQ4
         CVWJHKqlMv3I89aAIh+S4MIwrG2kjrztSuw2NStDAxQufH4CejuPqxndHwUSHEzJcT8t
         yPwouLN6/mCABSWxNqbEbrnZxb+kuXoazui66u4gHIP15xw61h/0GHM1jHouqRIz88Ui
         AU3YhpRHSvtnH4UA3xiP1a+FpJXRNUGyGrWgcBEpIDyn2IeWqJy9c4nlOR3h9GkGlTYU
         v1/nW+B7Gx3q5d62y2JBHL1cjf8I9aX3Yz4cBFe8e+neGeQ4ehw11rKuhdNCicF2J3OA
         TpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384392; x=1794989192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yaoNnCGUQ/v4wUYqXN+PQtsNa51Yg0GHDR6Fpdr8qLY=;
        b=rZiqV2jjEAZlzpQpU1OT9i/z3P1RmQwsqM2nAjdegbNV8pHGIRbd7UYg4pUpvvndD1
         HNmL0b0/UhdpZNYVxUBm7nLKjmLbzd0mRe33QbXQF8L+BMY6C+miG/vGFdn7PLYFYvKz
         NPzQLjryS6oIXQp2UqgaFRjAqRPdr0pJY3jCh2ESNlRGFUtL0V6ZpmPj3eXLJk8cRNeh
         t12lSPCXaZa4XkqGvPj/pBsr9mvnN6RW9IRpVfhlcZj8RijG7OxAARS3U7r4FIqgGnz0
         yUTH7emYj9WV9EXaML8t83SC/SRH5iWMmCpMVohV4pk/wgjBc9zXqQO6xIYObH6eVZ9N
         76HA==
X-Forwarded-Encrypted: i=1; AL+hErGJTYxiEbisE/xHqag5dfGdAr9ETludHoPx5iF9EZOpwwEY7MoA0wX0uJMuPdtbIYqlbFUt0J/tELb2eD+D@vger.kernel.org
X-Gm-Message-State: APuU4Z8vm9vlNB7Xvx1Np4kD8Se0x2+Wcg3Ue3a9X3mIlHdZ/CBDe+FB
	PGqJVNIdAPzYV81f946EH//HV20KKd4GZmZHTzi8vIhM7dTVUVR9yjBtXUKAzHIH6A==
X-Gm-Gg: AYBFou2LN7tTJfHISIfX4BoAAMhD36ciR8yeU4jY9N0KY0NZm2+Jd+PL43zo5Jlckvf
	Fh64xa1DK/E+fx/KIzzfVMnqx/AE+4QJkt7LH5zsm7/e0hkIfwQosH0qojLuTvpSWKBeLqR2aFG
	FPxMf5hinbtsqMzOqED/1LvhVjyoDbcNxqVfiIMZxSTfvi00Eol4330KZFOSge7CsbaMvor4mjF
	lMvW9Od696coOs6EhWpNn8rvBYT2svSddti8gQC2DBCzv4opJUB9zU77SeQM2wj9K4M5CvCljw3
	PqUfG7cgoMH6+x3OX+fLT3BltfXVbs+kqmGDRl37gQ0M+jeOZ06hBMy9IdVPCVvwq3zClzZ5zbg
	2V/y03WjrGQuLwJYVG+ak0ph5K5+qIGZDVDunMSkQslwnpM6wjperpYEQBQrkcdHsc2kjIFAbUj
	Mq8ywiHIX2herOufpgNDQHIP+9srT0V/sL2y3h2AfwrqHvyOPxZZYxpgLNwrryNI4Pnavo+Jk/O
	ZJ4icPw+/OgmJylYNe33l+0BNXlwyWOI58cAubd4rgUaKqVWRFWdHoTanYXkwDBmuGLlOGjefgk
	QGi5cCNX30B2f9kbmNevrbCWLPvtXwjMUeiGBiZdIkLTOpDN1U3Cnmuzl2PLspXqecNx55985aA
	NkCseoByh+x1qFUWTPbhVbSOEd1gQ3I8QQpw6/m6NnJ+yFqeBpRV0AsptK95CQoUckzc1J/GJT6
	iXfAtnH9HNNqqaipmJxR34BmQANtd+y+jsszFNJKqO1M9EsccQ8LBweDbTLRlUD42fvwjSoNjew
	4B0Iev6EUhHizbhm9C+TGjK4QBGDF9cVAjQ+5RLVsxjLwrUAqpr0jBgUfkbirH4GM4bQWLsSgiM
	5WJkYEiyQwIpAa9nA7U=
X-Received: by 2002:a05:6402:440d:b0:6b5:76fb:98d6 with SMTP id 4fb4d7f45d1cf-6b7777011b3mr1253468a12.21.1794384392040;
        Wed, 11 Nov 2026 00:06:32 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75775fcf0sm2287549a12.0.2026.11.11.00.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:31 -0800 (PST)
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
Subject: [PATCH 2/2] ASoC: qcom: q6asm-dai: reject compress rings larger than the DMA buffer
Date: Wed, 11 Nov 2026 09:06:24 +0100
Message-ID: <20261111080624.244291-3-julius@bairaktaris.de>
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

q6asm_dai_compr_open() allocates a fixed 8 MiB DMA buffer, but
q6asm_dai_compr_set_params() takes the ring size from the fragment size
and count that userspace passes to SNDRV_COMPRESS_SET_PARAMS without
checking it against that buffer. The compress core checks the geometry
against the runtime buffer only for drivers without a copy callback.
q6asm_compr_copy() places each write() at the stream position modulo the
ring size, so a ring larger than the DMA buffer lets write() copy user
data past its end, and after SNDRV_COMPRESS_NEXT_TRACK the copy starts at
the next multiple of the fragment size.

Reject a ring larger than the DMA buffer.

Fixes: a08cd56a4524 ("ASoC: q6asm-dai: add support to copy callback")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 4261c3048c368..1cd99a1d5b516 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -897,6 +897,9 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
+	if (runtime->buffer_size > prtd->dma_buffer.bytes)
+		return -EINVAL;
+
 	prtd->periods = runtime->fragments;
 	prtd->pcm_count = runtime->fragment_size;
 	prtd->pcm_size = runtime->fragments * runtime->fragment_size;
-- 
2.53.0

