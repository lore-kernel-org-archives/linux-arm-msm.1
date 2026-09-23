Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D067568FC7
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 19:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191886; cv=none; b=jF6ncrSbVPrHiZnwIwemSZwtp7147sKFb9BaHcMxFzMBWAf/s2QMPeA0ml02AEhD/MXvTDA6i5qxlrBejfYFonQflenOtiAI2XhySq51RPI8bLKls6k3bfReuvlY46wdbNr0u5TbGkCJ/ic9bPZg7gfuxrfCq88aI7K99HOpc4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191886; c=relaxed/simple;
	bh=0bAYyi3GCLdFiwrtiO9nW4HRWiGG3z+wSQsq4pbpR1E=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Xa292iqdh0uobVIbIUsoZnG0JU6tQ6VRBCALrjCuBbEHtXZgEuYQB2vhqXDS+eCenhEtZaTUXvunYMLSQGSu0HRWDl4TNGBwyLFu8g9BgTeL+P8JSizFaA1hhrOE3FfgOAqv7Udji1vfSwRAvPV7nCHipKTfLl7P/gwc2Xp5HJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U15TE6Ty; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U15TE6Ty"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so7326855e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790191882; x=1790796682; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0bAYyi3GCLdFiwrtiO9nW4HRWiGG3z+wSQsq4pbpR1E=;
        b=U15TE6Tye4M5WDsw35fFP/Oh0EEjWzmo8Bk+GlPMfFg9Z8xiMQ0F6gAWp1AZyVpxxX
         C++x70T0ka8JR9j9/NiHGp18izRt/Ko/M4xBPlD5jAfmNG7Fw6V2zIZNPGvKBlQjAfKs
         c419SoCCExy/qT2RovQBNodJdoJ3uptq8NFTVlpprSFajPal3YLiJphbKZYQ7pObiXLW
         WnhhEaz8lX5z0VU5oa8w1EE7tfXV8+VR1lB0NK0PJduXxmvpy9TxBFFChPp5S+sKZZge
         6l3JSEm1p9Tr1gZOBxzCk8ar748lZeHXROF0FH5u6aL0Z+Ek0Pqv1ICZ/uQEZBqFQgUN
         i/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191882; x=1790796682;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0bAYyi3GCLdFiwrtiO9nW4HRWiGG3z+wSQsq4pbpR1E=;
        b=YpBtNOj4wHP6ccvW9lWLqQ0qBIErLV5U4y8PznO/idlgknhYk5HDYev6D3MmVjrqv/
         UQD+CVha1+PyHUsfv0KbG4AXGuV7cLmeqlI2yX5Qj2sVtXfcywwvvKFbJUjiZGVewSeI
         DWvouKSNhUWf7xYZ3OO36QGdMb0Fsz7qTQvIKoZ2K8fnzWWhsm6U8ZbMjWnoCQkDrcD/
         9fPuQcKybGM5xP9CUJmVPnil3w3KGZRWLvDmkaApUaBhghA6nCCCFFInI3z9i+8lUGf4
         FAWrUVRiLXoeEfjXUGwQdM33AupK3/NaiLhnHBSTdC+3p/8jq9yEiJ14Z6APJoA3KUkZ
         BG/A==
X-Forwarded-Encrypted: i=1; AKwUvBxHzCzIHxOgMaS3b4AZAxsyMKf3UgZ7eHzJYcor1slwrLMvV3VIlXlETXHMGe+VqWHhXDrvY/L3Th/NtE91@vger.kernel.org
X-Gm-Message-State: AFuF++l/BzyXv6DkyDWRz+w8iPvHtiFMZDClyixY451bxlHE7fLm0V5e
	LHDSt+CD84t2XtnRcdA219aKC4+X7j/r/0bs1AUYz8fDOa/NdrSmpLHyyzOAbRwBnNI=
X-Gm-Gg: AYBFou2L1GEJebgZv7KUEV4dib4AQa68eevYFxIRqgdaS5+Qz3WBD9weyhtjqbFIQSO
	VguvM8xSwhA/tR6CBWMz2ibqYidulBAPm1YmdaXY4n/jxRR9KDcIs/zTS6Hmz5texJv9XiJ1+UY
	q6NOmkxwEnHpqHyKXVaUaPtnrsfkIv+Lgej+Mh4ic3RRL48KpiRroi6VPWt52/QjRUaYS/BShFD
	v3yS/rQhjRA+UzE9O3ddH/eLCX8d9WV3sazg0rprXVN+uvx2t744ZAJGs5ZXGhXAklUrI67DuP1
	RC36AQAMa8/6xfSD7bmOTmFA2TgXlXUnwJdr1SFMMYgn50dqhTQB9B8mTT1lNOJQShiHqDxaDon
	dgn/jvuh6ocNcaLLuWtmwa9GvJfO60UK2Y1W+1Yg5SaKMoS9wMeQ1NASz8zMr/7sYiu+14nWkXq
	dhYb4vtEE3aWReLW+dpmn4qODkJPoxtu0guDefnN2Tf4Gc3vLluGHfQPfkYsx0HhYxgEDGBKLm3
	hz2krTzY5WJfQlhn4fJk4ab2zRScgA9PoCyc1SEl+0DjybHNk7GDD37B6dkIASJyHAW6w==
X-Received: by 2002:a05:600c:3514:b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-49fe67043a0mr3428765e9.31.1790191882395;
        Wed, 23 Sep 2026 12:31:22 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd42f2sm8534355e9.15.2026.09.23.12.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 12:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 20:31:20 +0100
Message-Id: <DLMY24LXCIJ4.15ZGPGC6UR28R@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>,
 <sboyd@kernel.org>
Cc: <dmitry.baryshkov@oss.qualcomm.com>, <alexey.klimov@linaro.org>,
 <r.mereu@arduino.cc>, <srini@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/5] arm64: dts: arduino-imola: add support for sound
X-Mailer: aerc 0.21.0
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <ca8cfb43cdc08851db1283df2108e77b22fedc6e.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <ca8cfb43cdc08851db1283df2108e77b22fedc6e.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>

On Tue Sep 22, 2026 at 11:11 PM BST, Srinivas Kandagatla wrote:
> Add support for sound on Arduino UNO Q board, which includes
> - Headset playback and record.
> - Lineout

And "Ear Out Playback" as well?

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

It would be nice to see some Tested-by tags.
I can't it test because I think I don't have this board and no time if
some fancy connectors are required from scratch.

Anyhow, by just looking at this I don't see any issues, tx-port-mapping
also seems to be correct correct, so:

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

[..]

Best regards,
Alexey
