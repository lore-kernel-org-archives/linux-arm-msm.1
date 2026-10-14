Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB535616A2
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 16:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995937; cv=none; b=nrmwPC3XSxoyAX3YN7yvM0v+gRd+3IdHbZzEK90Il2VxnoCIrLPegLiE59TMMvo+yG6SfAjz04bDElD3vVy86nMUS8f838VY021iBzg9kqIB+PuD9XykGUiP51UqwE8I7L/BV4flu+RfCt2AKHzSVCanBsZ0+AHl4v69BbYcEyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995937; c=relaxed/simple;
	bh=APYxkuDM9hHLS1zuQd0wn4SyxD7eEgKQxzZw7XzMkEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FKRS3fzJAm5AuLnlOy+5zhCY4i3qRy1RTZQ6lizpSYc3FyBTAe+gEdV0EY8SFTQmbxk+iyXTuSHMSFVA38bArVlwQAJbkDO6Yere2s4xymnTgw+XRaBUffl09cDs0X00bd2r/qibjPVnIMlARDRgJh1DHiF479J9UkZLU4a9HXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2igTe3x; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2igTe3x"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-487049569b6so3044126f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791995934; x=1792600734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APYxkuDM9hHLS1zuQd0wn4SyxD7eEgKQxzZw7XzMkEQ=;
        b=l2igTe3xny5UQgcBVZ2yiFfkTmYgMrTrC2Xhy0uLvwLqQEHZtm3b5Us2K0z5k/Pkwf
         S6ozpzGUcAj96RDIF3iW3viR0sv20/oP745O5sb5zmKxUz3KTBv9e6LMsiQT3VhiWEqC
         An9aphrgI0cQT7mtoPUtyOWkwmt8gSSpdQMsHaH4YZ92PJ21RLcqjBOBwcCxZAZqQGuE
         sw5OPbZcoAL7JxVv92Qo1mVvBvQHPLAHll8bQ7vk1kB1UIJb9oT0sVhNy4DGl3XoV1KN
         SU30naVYCdxUR7TrSwnIH188shX3zL+vIf6fyE/7L8oDiwUcYDhZcHp9bwOf8lkd+GqX
         OCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995934; x=1792600734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=APYxkuDM9hHLS1zuQd0wn4SyxD7eEgKQxzZw7XzMkEQ=;
        b=Urv/pM3cZs/AbkL3Sbu2qtXBqFMpg1DGhXxkrJktBSygSZnQz85OZzOq64GI1cnG9l
         3AteadYHUv3a0G7+ihiU+LmMJ46qoT4oGTsmpa6G3rW6hvARj56zvjo+jui6C2YCqZyT
         p4osLejts8kXrAPPUsdpTJCSF4WWnYuEdVC7BNWIuPdxafFd42ZGbQDDi1jBKbdO2S5o
         2hapw8b8bO9D2GfxPNt5CpX3NkMoxY+G6Yi9PSb0TmrscNLDpCnefDk2KZX5aY4JdLhT
         nSoencLLJRPa2cAmysypOhyb0EGn7JbsfORK79LxfLK3e9mfp16dLDXr6FnTI6e/NG7B
         ezSg==
X-Forwarded-Encrypted: i=1; AKwUvBwsCwKKo7JJ5wa57aEaD12p2NzRF9IDEfSGrH2Xdx/sVo8K+MZjz+A8zOXfSQFLebx9sQf7qVaweY/mZIwY@vger.kernel.org
X-Gm-Message-State: AFq9FYJjz/e07eMmDkqNPlLWqglasmz6rXLGjT4GxOAxWJFViu47+e/o
	vY6qsI762YbLZ7JjsqE4HtE/9itwEBfpmdoF25BoDbLJVAMJL11kTq2G
X-Gm-Gg: AYBFou1ymq1dbnwzdtMpo3lyGLljSsQ/YrNdpJjsMNYs40j7/J6v2vphDECnGDwVFsw
	m28UoQ91GxaNh4u8/zcvAVl94kcNq0AjzXTWAAejUxo9L51xVptVhmiT/lRaEaY92xmeIZn/N9r
	Hzxy8KJizoRDBuErBalRmAK3nnw2OZZls3KJVA7yXFBhUYZtHDDzDW0wBMxQ/Hfi0owUIry1VB3
	YCZ6qoQRqydjCzdrtyfs1DAoEUUeHCEMEhc1R76EpMOJnOOZMm594HdiOoOMjxoZT1OLQ0paOz+
	989Y9/Q95x4aWSX3c4J3WG3JlVidEKPtHYh7HDH2kEguOWsDu32ffuZgiMKU1+B7kPi5dLgcFM2
	oUeWXkhoPrbJnjxR/ArO005ARVEyHfBetOSTM7tdRU0tSVbSTb2PPfppes1mZO6uV7dkojGCFMA
	hNgkH4/XDHbTJRgnOKSzSy3Fgzq9Lv2d+YUZk6zP3QQxI5UgtsM1Zrl4XpMJZLo6gh7QqrMOriw
	zigGSb+iIuGphdQ6J1MgK+Amg==
X-Received: by 2002:adf:e013:0:20b0:487:930:8acc with SMTP id ffacd0b85a97d-48dbaaddbd5mr23419177f8f.16.1791995933978;
        Wed, 14 Oct 2026 09:38:53 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48ded185de7sm4552774f8f.31.2026.10.14.09.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:38:53 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Luca Weiss <luca.weiss@fairphone.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Val Packett <val@packett.cool>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] ASoC: qcom: q6apm-lpass-dais: start the graph at prepare
Date: Wed, 14 Oct 2026 19:38:42 +0300
Message-ID: <20261014163842.13124-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <DM0ENR5MK476.UJSB8FMRYN50@fairphone.com>
References: <20260705033830.305907-1-jorijnvdgraaf@catcrafts.net> <dee62f9f-1df3-4f57-a072-12b0b4b8a1a3@sirena.org.uk> <20260708215539.150590-1-jorijnvdgraaf@catcrafts.net> <137a9c85-67ab-434b-880b-d9d4efa5bccf@kernel.org> <20260710143214.142017-1-jorijnvdgraaf@catcrafts.net> <b099f316-0e30-40f6-8e6d-5717d96fce5c@oss.qualcomm.com> <20260715211919.49462-1-jorijnvdgraaf@catcrafts.net> <2545fdff-7bfc-4897-9185-34c45ee01bdc@kernel.org> <DM0ENR5MK476.UJSB8FMRYN50@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

On Fri, 09 Oct 2026 17:16:32 +0200, Luca Weiss wrote:
> Is there any new info about this? This seems to be the last blocker to
> upstream Fairphone (Gen. 6) speaker support. Without this patch, the amp
> doesn't start up and audio can't play.
>
> Can you suggest a way forward here?

One more data point, and a possible way forward that does not touch
q6apm.

The OnePlus Pad 3 (SM8750) has six AW88261 on a TDM link of the
AudioReach DSP, with the IBIT clock of the link voted from hw_params
through the MI2S clock control of cc8495c1d45a. It behaves like the
FP6 and the VENTUNO Q: the amplifiers see no bit clock in their PRE_PMU
power-up check, each prepare gives six "start failure (-1)", and the
clock only shows up once the BE graph starts in trigger.

Since the DP case rules out starting the graph at prepare, I moved the
start to the codec side instead: aw88261 starts the amplifier from
.mute_stream with .mute_unmute_on_trigger set, as wsa883x and wsa884x
do. snd_soc_pcm_dai_trigger() runs the CPU DAI trigger first and the
codec unmute after it, so the graph has started and the PLL locks right
away; a prepare without trigger leaves the amplifier off. On the Pad 3:
no start failure any more, all six running during playback, and the
trigger that starts the stream (graph start plus six amplifier starts)
takes 52 to 71 ms.

The patch is here:
https://lore.kernel.org/r/20261014120000.aw88261-trigger-v1-1-tvlad744@gmail.com

Luca, Jorijn, it would be great to know whether it works on the FP6,
and that it does not change anything on the FP5.

Thanks,
Vladyslav

(I used an AI assistant, Claude, for the analysis and to draft this
mail; the tests ran on my device.)
