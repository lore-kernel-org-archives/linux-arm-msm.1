Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890174;
	b=FQHrDOfDa7rDhvB1uEa5ipi5O7flxPfs1KxtguA2L907bwJ5N1kvIliycuD+24P4d0Ms
	 WVQkBJTjZ6iwrzLaLyKyYWH5aBOqNnkLSaEyMKiBAnT3p4rjaKhrTskqRslXK3EYp2zz5
	 fgR2/2rB/xCc2tgKtFacm8rnkNvZ96KJOoUX1OEkyq59NkLeagd2TvQoeQsPelwW5JP0q
	 VhMzh+7qhHsFeiEN9xZbjBURunQmtu+orpGm4QRIlmxAu9SPJtbrq1XqdwF+34zk2dvJh
	 L3pg2Sh+0L3uGpYNJ+hMuK/yY3/rbkEC4/Js3KB5oN+mIf9fJTRlCCuEbXBxPuJ12Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Om0tcSZNhZ5lOUlggnaxDt40uTNRQpeANYB2F5Pi83A=;
	b=Oif1gp1GEnylPiW75Z511rwgsRqYQY4lRZj0Q9+ihHKdPOrT/7AJ0ptvaStoJLNa0qZk
	 GaYaFZe33bp213IsuIWLcYMSQlKqAHjKDqJVsdCNo7PfwDGZHquAsktSK4k0R78gml7ef
	 3/oA+ZDULE2gvs8ZjOXXvdY7DQKGwTnYk5CCQM6/vYLosvb1PsKT0PuHLkNdWGQvzIA6a
	 Apf+kWXc7FqGXVloDN1rYuq0eISApPpKAsXe0E5HVHEmdYIFpL1a4EWt6+auBtYCRh0GE
	 /saQgr6uf9KAZcDdF7V8q4/sfT6yCdVMG8VcCeWFI6/LbqyXp9nUOQbRKbygmm+U5DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OxV2lkRh;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030E3606A328
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 14:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 030E3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OxV2lkRh
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso13651285e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 06:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793890171; x=1794494971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Om0tcSZNhZ5lOUlggnaxDt40uTNRQpeANYB2F5Pi83A=;
        b=OxV2lkRhk0C0TAO6rN7Z6hKEHmcuG3z7lblZ6BAeXcdGdhxfPtIsTrrTLyoBf8mX9h
         bsf9ewoi+eyF8RgAYLuAL9zrbWAiPVXk/61pfnNmZZf4l5k8wW57vsQz2pHYof5P45M7
         UM+yiwAiohv1D4Afb3JF+cnuAw0OwINRvK6KQ03FdSAcNMK/sQnKoe7Zkpa4jeK2RESF
         tHeQZZQstnEYt3KtTFgg2WuDGMVlEf8XxhmJKJx3Cn9ng1SReOwQdlA2p+bcmdz6eSyv
         f8WJcsqYkouW6OqvEMbwMsEsdd7AIE2QXvuIov6rB4iXhwTiEg8FuhJ8FQb75d2su6nQ
         8a/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890171; x=1794494971;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Om0tcSZNhZ5lOUlggnaxDt40uTNRQpeANYB2F5Pi83A=;
        b=w+8TowzjnqcNe5yba/oF1/c2/GrWf+0wH9HTcFc4k0sBkMKeiFn32DO8PF8mch79xh
         AmSzlb7ZV1vpKX+x/zJoghS0uVr41LiUMtuQ3SZvPg/n2qnYJTrJl7DQT8k7oz1wyVZ/
         bsa2NtTwTOVqxQbaZpRYFzQZR/EucjxekmD/MAAEsRdOXuNunW90+8psiBXGzaCMhCwQ
         tkXFn86+3S9gz3So59iFgE9mb548WDcVojSQelfu4kQRYxwbjypwohQQiIinKsxQDv+H
         bEHmFWXx8WK2lg3pZYPQXaN3F4y/VeASBDYxEXYBp8Bgp1vpE2qJry02o00j9xiPjnXB
         o6Og==
X-Forwarded-Encrypted: i=1; AKwUvBy7X2KYJm1HYuvZhuW12pXfkYtOhH2X9EyrsAZtFRaxKmWaMQuyLO3Lw2lsn4a4fRhX2389MopT1KwOTHWU@vger.kernel.org
X-Gm-Message-State: APuU4Z+72/EPf60WoWz6ZU0AIu7J+oystC2YwiuLHn+jQjS+8q8vfnjk
	+CZC8xM8hyfLBPMGWEyUranQx1tNYvhPRdagBHU+V4MoNolqcAfvaZg1MvPqCVSiOFE=
X-Gm-Gg: AYBFou3zxe1cMddd+ntZ5UljJP6t5ce6kWZ5WaeVrLqtbM/ueO/k0Fph1y2m4pkfMtM
	Fhcysiu5TJ7rQu8f/kCJvtN9CjAWGhZLjXWktJ4fQQUwuYk3dw9Bkti/GE5Z9jCXO2uGKt0S8DU
	BX4/BhR8l4+W0VqurFXgS+oXzQZp2O3dzVOe4yfWtfKIUvH0emYLLqJ1ih/Y0EQx9r9wrO15GyC
	xXPijcgvjYdoHw+Lkbc/FnTDwxGsC8T41VtmRCbxlXW+pKs2Ifo2siLOHi8x5P3RtCqZwCL1h+A
	radBJt67Wp8M/c/9A99BrwnUsLNqgqbf/vTzqkkcc4nrv5btqUOmbC83E8g18yNA2VJcYV3rEDX
	ViWULvm3vlQQ6j4D4MmKDLbiHg3hsVtFPmI/af/NSzY2D55WdijLa7jcsmT1g8uTUbctLMaBS0+
	qZkeLH9dzhVL69AJ4I6+X2mqrd0JDCU9Folvv80KZK5mZM4RhDb4hcvb+P1HOnT9d5bwR53iv2U
	zp6bDwywsKYZkCOBFChS+ZUKPqqQ4W3MQB57zvrSHeZDargemFoM07eSyurScaj205R+PuZELes
	645DsVzWXcQZ1OVsyQZFjYjcRK9CZ3nCunet3/5A
X-Received: by 2002:a05:600c:6285:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4ac182dc8f6mr417083355e9.34.1793890171437;
        Thu, 05 Nov 2026 06:49:31 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4104d600fsm129873185e9.0.2026.11.05.06.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 06:49:30 -0800 (PST)
Message-ID: <1215dd37-1575-4dab-8ab2-65348ac69d91@linaro.org>
Date: Thu, 5 Nov 2026 14:49:29 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: qcom: camss: always stop the pipeline in
 stop_streaming
To: Allan Siriani <allan@fatecpompeia.edu.br>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
 <20261104202313.72494-4-allan@fatecpompeia.edu.br>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104202313.72494-4-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 20:23, Allan Siriani wrote:
> video_stop_streaming() walks the pipeline upstream and calls
> .s_stream(0) on every subdev. It gives up on the first non-zero return,
> without stopping the media pipeline and without returning the queued
> buffers to vb2.
> 
> A subdev without .s_stream() returns -ENOIOCTLCMD. video_start_streaming()
> already ignores that, but video_stop_streaming() does not, so with such a
> subdev in the pipeline, e.g. the pixel array entity of the MT9M114 sensor
> driver, every stream off:
> 
> - triggers the vb2 WARN about buffers still owned by the driver,
> - leaves the pipeline started, so the next VIDIOC_STREAMON and
>    "media-ctl -r" fail with -EBUSY.
> 
> Treat -ENOIOCTLCMD as success, as at stream on, and only log real
> errors, then always stop the pipeline and flush the buffers: a
> .stop_streaming() callback cannot fail and must give back all buffers.
> 
> Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
Please add a Fixes:

then

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
