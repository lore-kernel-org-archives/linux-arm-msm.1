Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ED055820E
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 16:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995241; cv=none; b=XIm4DO+fJMkk4Ai9ch+eZxUhqBFcO7C4SFazBV15LK424FXpOvgh3Dv7gwsImIQMalpsBZdzIl0ynGOoVWSUhMKubl6VCRis3v3Xy456xEURVUMgXsxqAP9A1TFCH+8EQQCEpiIsU7kpyXa60kextJLXW7GYLwv7in8bPg1e4A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995241; c=relaxed/simple;
	bh=sBCaTY8ARBNUaW4lgyS60NrEr1RpU3oh4aQ5QCBZ51o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XoxIBJOQ/n/MfWFjM0g5FNU+9Otx60zNW5P86gWBK7xqx9L/Xb5jUi/AFTzOM3FZkCS/vTcxkQvFZbKS6PM7EQeCXwg1NPuu7ZgEYVmIqQpQJsoWMTFYVwH64ZUO1XVTxY49KDFgacQQNboU9w+ZChrdp9vugtbjfZqEYltBSl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YB7bwpYH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YB7bwpYH"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-486e8faff03so1905734f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791995238; x=1792600038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bm2vsVus2jrRRF0UKZkM8VLcFn0B4q9e6VlpkqoMQi4=;
        b=YB7bwpYHddw4imUY5XgbW7eeGNA/zweZ2qmTaR2gPxm2uE3WiLGNJmrvZHYS8Qo55f
         vw8j/WIlUyWElSg6Cx/UcyogvpuJacGf38HQ2ok8SqR7Q1T0kJKw488PDz2dWMOMnIqt
         QoSXfP4HuRuSB5ttWO1ZmuphjmBj8Sz1fk8OyvbEOEGonnhehqCfYsv8DaT+KDP5XnyM
         6rJKRvSD6AcC47FfVAqKnck6MzR8v8sMHvNIlff0maBNB940Hw5O/vqc45LxBm0foRZa
         KtJCWtBKazc05FrL8acIgfSzXSz7/IF39B/6nC4u/Ia1snoDJoYjz9CdK7kWQN9CNs7r
         Hemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995238; x=1792600038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bm2vsVus2jrRRF0UKZkM8VLcFn0B4q9e6VlpkqoMQi4=;
        b=gNt43X6KBwJn9YHXkUYbvN4DvOuKU+ddpDEWTBbwUoKwb07H+/yq0stUlG3O1rlUNU
         H8OudggmRn75svDLNH4AMx0zTcyarXjqzSIcuGlf/x/F5ZaEACM62MyGRRpSYr5vKV4w
         k5GzVuwLaWx0RljqzdWQehKJfdsOru1LX+7zhf+XKwJSlQONu6FCq1R/1txAHNEA/qoc
         IzMsxBgCuH0sxOhflB+LDm0NCa08/4zpEUOIxK7ajrpmtYIIGhdprm50iT/jJT69OXJe
         BypBN60MnvRqzWIGSRkIBhvDzIgaWvz1qKCxHvPLf11b5oxPn1QgHIRgi1Sz2e0e35By
         +7Rw==
X-Forwarded-Encrypted: i=1; AKwUvBzrBiJlr4s5+j+anKfrvZZHe6o15O8ghGvflANEHdRLRyUBnYKfWFJmL83JqX0ART+RrHyee3ao0bx1mt9B@vger.kernel.org
X-Gm-Message-State: AFq9FYKQx9zKXNSHD+4YYSfhy8tV9YcaIgKx+wK/q77fwW+W/NYmd7cF
	H/jZTLG9q5ZzFCcq6EkzcQvX4PDrFgrzgRYbuXaYx9OwqN3ND6YAzi0j
X-Gm-Gg: AYBFou3SRXi3aGbUWbt6IpaK55LxHBRtmQ1qZhxzoRJ7r6i96CrEe3J4TAhsQoWt7HK
	151g0TfhaiD35dsax6ZUizU6mVBN8wADC0sYRGnFxmpqMm7PoHjHeaCL5zqsYEWHY/ESqQSchgt
	K96YHnaycqHSxAZ/y+y6D74kn5t02yFOUIs54jnJ2YiJNPkRu6yMuGjhNzHktTnsaAJnYkdrBEM
	dC1JPulCQ4j/EJZ+ojDbHRO14DyihSiSvKR/Pcva5w0JVOZwWa6waoBK2bAS4qTxBFAOQcwIFWJ
	AKxgeRuTTa++CdPGOv4sfudvqYWPuzIQyhvEGVrKnrWUTpdcZIGB31AM4WqztSVnRyK6/yToLnk
	VcPm/frE3txB4mSI3xQTPL3qKUojv51ZY+Go6EQn0plci+BnI2EgQ4J4m+i67EyRqpxdV5wjrMk
	vAjrK9ONdQxWsJPjEqbwxGThVQcpYBWh54wSTCQtjzc6IGeDWPcNQXc+02wuGPIBJ6fiy6kBPEx
	kTtEpSHbiQDjrXOTuXodnTHpg==
X-Received: by 2002:adf:f94e:0:b0:487:1256:ab80 with SMTP id ffacd0b85a97d-48dbad0d4fcmr24273401f8f.57.1791995237877;
        Wed, 14 Oct 2026 09:27:17 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaabc3sm13076890f8f.16.2026.10.14.09.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:27:17 -0700 (PDT)
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
Subject: [PATCH 3/3] ASoC: qcom: q6asm-dai: wrap the position of a full ring to 0
Date: Wed, 14 Oct 2026 19:27:02 +0300
Message-ID: <20261014162703.10172-4-tvlad744@gmail.com>
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

Commit 44432315444c ("ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer")
took the position from the number of period buffers the DSP has
returned in the current lap, 1..periods, and reports one frame less
than that, as q6apm-dai does.

One frame short, a playback stream whose application stops feeding it
never reaches the stop threshold: the DSP returns the last queued
buffer, the position stops at appl_ptr - 1 and no period interrupt
comes any more, so ALSA never detects the underrun, the stream stays
RUNNING and drain only ends on its timeout. On capture, the last frame
of each period is held back until the next one.

Before that commit the position wrapped to 0 at the end of the ring.
Do that again, as for q6apm-dai.

Fixes: 44432315444c ("ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
Compile-tested only: I have no Q6ASM hardware (sdm845, sm8250 RB5...).
A test on such a board would be welcome. The hw pointer of q6asm is not
reset on a new prepare either (the same as patch 2 for q6apm); I left
that alone as I cannot test the q6asm prepare paths.

 sound/soc/qcom/qdsp6/q6asm-dai.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index cd4f82bb8cc7..4261c3048c36 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -485,11 +485,10 @@ static snd_pcm_uframes_t q6asm_dai_pointer(struct snd_soc_component *component,
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
 	snd_pcm_uframes_t ptr;
 
-	ptr = q6asm_get_hw_pointer(prtd->audio_client, substream->stream) * runtime->period_size;
-	if (ptr)
-		return ptr - 1;
+	/* a full lap of period buffers is the start of the ring again */
+	ptr = q6asm_get_hw_pointer(prtd->audio_client, substream->stream) % runtime->periods;
 
-	return 0;
+	return ptr * runtime->period_size;
 }
 
 static int q6asm_dai_hw_params(struct snd_soc_component *component,
-- 
2.43.0

