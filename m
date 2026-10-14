Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8759254B1C5
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995240; cv=none; b=tKF1T8Ty1qPGcz3KlRANKiqS4opzRXb1gzoRv4kuLGi62USBH7i74JRo9ySGLUyfeHPGOvHenvcWJxoHksA0qWHzEkgPJJ0284Dq3vCtd1B8yRVRYEdVVCl+6PcWPUr1AdlXha5107c03jn3GKUyptLylZVpYaeah8i9+98EJrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995240; c=relaxed/simple;
	bh=sKUZlLhOrMgRwmNi6jUDh1V2/nyPhhj3mYIjf0e2zew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6sweyTox7Y04rgVx5p6dtyvQoUyOOtheuUOyoeOzuQO5b7E1yb6+EYCg6mvtjP7JYoN6cV5atBPyMCoOSxtkg2oKU1761NoFwIDoM8mK4ux/Iy8E0tJvcV8S5f6XiEY7DfbUz5bJOMr0pPVCgLg5LN0Q2xMmhYlvwGxYQy1QoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OE7wnSnG; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OE7wnSnG"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c14a06c95so3434252f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791995237; x=1792600037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnSdw0uaL1vtACAdgkw6vpJyes4Ayf/5pwfNbIBD7hw=;
        b=OE7wnSnG5kXUrHEIMDOXj0Umf2juMILqsurHwdjrqLWxh2vR665iyZjbLScZ5XAsPB
         S2rI9eWLV/ehW33pllWR6PdnYzKAgItJYkmeZ+EI4TMXfFY2XWYrFo/r0dU+tSwoqZAn
         Bv+kBDbSjdi0bgBpEOMyPI+BgrvaYtglavWb9xc5diizMI+3k/X20/OuqpHzGqiZKAqd
         NmtTH8djbSbHyBGOWuGrWNGjY91m2SkCun6S/37BU3QasMsR7QzYYoso4zbPYebCenak
         SWmnXLjclARDwxS3KauS0Gj9z4iSOAHGfJVgnCIpdyRZ2LtjKSFuh7D1oieaFlnyXy3K
         2IIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995237; x=1792600037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nnSdw0uaL1vtACAdgkw6vpJyes4Ayf/5pwfNbIBD7hw=;
        b=WcjbuzlbxkBEO7tUwVEqdkp3CMcmxuNi5PAq5+DKQRr2lOouDm3v5exe9NerUGLQEd
         TEbzYUJqaI7k5ffPKz/VpgksMIsVLjdnIe65FMWjvGy/R38hBx1DRWR0VSFZtzD0PYGl
         ziy6+H58NVSL7PkPKhV2FllXijVsQMwMzB0Jpozpa6adKP5z7kIZpUM9MgMdXS8UNnAI
         4tiRyUIE3wfqggk4sKozV++/2d/wt79VEvliSATTjYZuDxG3wn/hxwDYlt8GhxUZ9Pnp
         o+weJYc79uz7wucHvpVx29vi9NFz3ZsAvDR60w04e4L5EEmgqiizn4BdOdgZOb1lXVEL
         0zHw==
X-Forwarded-Encrypted: i=1; AKwUvBxeOzx9dBzPNpN+zj7IPiL7pM1YiAfBCmcEQ4wpbLRhaUtGeHJG24v1BKFd83LB4iF8JbgVSMoXdJIQcTu4@vger.kernel.org
X-Gm-Message-State: AFq9FYJhpp6mCYQNlIRev7kaOTeu6rDR0R1N1m5qCZT5Hf+spEsyOan2
	ngEC2+04zuJN2mEnz7LDZQ8E3zTlJbQXLjF2hl1mh3B96Y9ovVlcHGMT
X-Gm-Gg: AYBFou3f9YbZfmbj2vu/f3TITBnhatZa/zAKZkIaXUVrS+By0gOw3RzIK2g+y4D8tlo
	Pxa7ZHYWAB8KVvXR+Lf+CstmNafZ8uQ7eZkCoWGrB78J2rfvCe4sY5PCWrFC14zIkZMlVbPghz2
	KieF/kOc/OaxUoRha/Gh1HJ6sn3z8SEn46fGfsyTs/aI0xNFe44Mmxr5s40rHsIdR6Jll1c+Nxh
	fUVl+cnB81jzRsjIi8/MxO7Kicp7WUlT2cmKwwWG/ZdYmF1bfIWU0ObeFblEhovm5KZtQhpqvrh
	mDW6WuzLDBNZrhenB3PDW1BUzcKNhJIRinPFqYMCL9PhkFNUnusDpjtXGEV7BeSBaiTWopEOd/E
	WiQLUQbmeVuhMK3TldpXrMy6eAXOskOow7eG9yWqmBed7P+XzHr6NM6iAwcLxg6qBwRg8w2d1uj
	B87IQxcm+qturRraYO56i+qnJ533CuLc1NfFTxZARk4zVY8INQ6J4hSA9UPdi8HZ0GkldClbRKj
	Nixb2ea7ZXQuZP5MkFZHCtXmw==
X-Received: by 2002:a05:6000:4285:b0:48c:4485:3357 with SMTP id ffacd0b85a97d-48dbacf2482mr29285172f8f.57.1791995236714;
        Wed, 14 Oct 2026 09:27:16 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaabc3sm13076890f8f.16.2026.10.14.09.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:27:16 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Jiaxi <Z1529105815@outlook.com>,
	Johan Hovold <johan@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] ASoC: qcom: q6apm: reset the hw pointer with the fragment queue
Date: Wed, 14 Oct 2026 19:27:01 +0300
Message-ID: <20261014162703.10172-3-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261014162703.10172-1-tvlad744@gmail.com>
References: <20261014162703.10172-1-tvlad744@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On every prepare in queue mode, q6apm_dai_prepare() frees and allocates
the fragments again, and q6apm_alloc_fragments() resets dsp_buf, so the
first buffer queued after it is the first one of the ring. The hw
pointer that q6apm_dai_pointer() reports is left as it was.

q6apm-dai used to keep its own position and cleared it in prepare.
Since commit a93dad6f4e6a ("ASoC: q6apm-dai: make use of
q6apm_get_hw_pointer") the position comes from the hw pointer, so a
stream that is prepared again, e.g. to recover from an xrun, reports
the position of the previous run until the DSP returns its first
buffer, while ALSA has reset its own pointer to 0.

Reset the hw pointer together with dsp_buf.

Fixes: a93dad6f4e6a ("ASoC: q6apm-dai: make use of q6apm_get_hw_pointer")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
Found by reading the code; tested on a OnePlus Pad 3 only together with
patch 1, with no separate test for this part.

 sound/soc/qcom/qdsp6/q6apm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index ea6680925f21..b6b1ef6833b3 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -285,6 +285,7 @@ int q6apm_alloc_fragments(struct q6apm_graph *graph, unsigned int dir, phys_addr
 	mutex_lock(&graph->lock);
 
 	data->dsp_buf = 0;
+	atomic_set(&data->hw_ptr, 0);
 
 	if (data->buf) {
 		mutex_unlock(&graph->lock);
-- 
2.43.0

