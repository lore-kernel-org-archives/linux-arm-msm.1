Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810954;
	b=ttYMdKq8REaUzpdivOaPXc1OEaB4/f5fCgzPNjT0c6Wd9mgmo08sCpvXsE+fhd5gbaz6
	 9bBc43SASlrxzBm0VT/Ed66V+20xnjkelPN/uvgYx1P2Xcs9fwHOurJuezmHN1uAJ2a9L
	 honA34TfVLSioA9vIbo7SVGvmIdhItIHyXrQguUIa/ZOQ15vc07LkdU+dBUCewrhtMe9M
	 vqMwTQAeQbVbuOlqzLz1HcW5wRKLvQo9R2E8R4Z3B+sO5AB7/Y/3fL/81owIm5dvZ8qnf
	 AAPlQ+6qK2quY3Qb12+0ZeHB7VczaUGxLpy8V2TWHPfTzEJUMZ3yNXqAMQYqMdwy5cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GbN4SqJ4UovFCwps805z/P2L2TfzFeTdUNr1Xb5RGPA=;
	b=5hByaKG6c0geIZhRUbRlII5amSGBWpFUtjikYYGgzGXIzkQf68jXYZU2jJM692d6XsMA
	 GEEnWCgPLCRBwCL1jjo994iNVSJmOUt8i1S2WbkXKGBPiiE/2WxBy5drmclHXwVQV3JsX
	 bETQzKcGtsuNTlUJX6Nw4sSlkvooqgDHKnaCnY+mn8UoDxiMc+eGek6P3RIDbuJGo3dPH
	 UcikV6KEZgB5ZfPId5CFUFRpIHHMPS//Li/tdFpsg8h5gnmDjdSi0rWMGOhTvUgquNzgN
	 9AY3fQxrPytBmCwBQ9PaYpUO7f8Y5PIMpIm23LGi9+xFKlky8jQQ56ZrQDPfp4uplZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D7zeSjdQ;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED02660A3827
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED02660A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D7zeSjdQ
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b19e291cc6so1200440eaf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 20:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810953; x=1793415753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbN4SqJ4UovFCwps805z/P2L2TfzFeTdUNr1Xb5RGPA=;
        b=D7zeSjdQHVPwqhtsdwt2+gO4PYqGIf+3GLh6AOFF6v8yELGuZfL+OTYJ8P5qpwBhAZ
         TkN46v+LALBwkVezNZcUXQB+5knLcp0KjGSzrewiPvyY6rHQcihrNqFtUU9Fmata9cKP
         S/EfR2U+/V+7hu2iAZj8EicZtOsiK4Sy0w1qomTCn0FYa1kUwt443Qem7RvwghXzCWeh
         spwpstEWC81+bQwTa7PivVgx7lgnwLyaTFT7bBdbLjWvoxfQgQimY/xAU0ayXwTeWo12
         q8++jEs2i6UraHdkADDgbQO8mujD1ltcqihGpyjmz6k/Bdo0tmKm+Hc+FuH0DEbtTe7L
         97HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810953; x=1793415753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GbN4SqJ4UovFCwps805z/P2L2TfzFeTdUNr1Xb5RGPA=;
        b=U6zKs/5hoimF3tUfZusbDh56FgIVvTdoAgRgZqsngH0Qolz69oduoslcqGcCJdj3yK
         Im8oLCupsbkaBBNZy648Fv5ZZz+EwzmxLCpmF78qfeKGPsI8bLoAT0XPlpMIfPMkiCdL
         tinV8K/JUDK1iSzaB0+YpVXgSHvfFmLGKzptEVYVCvNE+ELJBjKGExM0lwUv9IOAsBt2
         QOlXU35sepQn0KsMdybDeFX8AoWBQE9Lqmtv+TOX978QrPwrDX79E6Z6jFjuepGhFvyg
         qubylHt2d8SFem1qev/peejggtbCBhvoJairIOH+skdAkjs0i8u/Zf08hq0/vDjxf69X
         TafQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKM0DaxZ+X8Qh1pK/0vXr7oN2CRd8s1rxXkKRUVbFSlE00RcxNWvZVRdFTm0NXjOvJVWInneZr/EZ0UffH@vger.kernel.org
X-Gm-Message-State: AFq9FYKrdG76TTQtYcRWPWd6mQRhsnGSxvHJuD7B4GpbYPV776sO85za
	INIj5V6nzVkjNU7cfiUhLgsnkePDSV7KxIQp8VxOCZjzSklNpV7mihGS
X-Gm-Gg: AYBFou1IixKQYDgjiQl3C0n85zGc+BGfF3Y4gAjiYiyeO5qGUQgfyhbXfBMwYi6T1QX
	Wsml0eVKrv7p90NOnnZtEhXvSe2uNfDrEKWaKWsUXHxdFSBgQUhwDimE+CtR1eW1ZVLWcM8VaxV
	cnqFuzhfJDdaAi/Dqn/rGmSTPFQ+OZ4ef54G0MK2bfwlHnluEhIqy8s6dz9fUZUcl5BQktL6sGI
	IzEkIb1aBPZJjm1RgnK5Ut8YTHSenLOF2q0Y6c1ctVJtopN7u6C9JMw3JOygcv5+LivTh+xn5cn
	XFaqX83v4U9i6tyK+KRK2gmdPOiNmKvE0Qad80u+W2E7NzbxqXF94Of+EnupocOq46BZDSehA4z
	OiOyu0IvQuVNRHZ8qdF1yn0CIMMirNXrPlC6oyw73SoKJEGwPsfpnRlWVzZruGzpGdbpfmp9/6X
	8EhvmBmLVlUfCpUgfOC8qjZnWhdCJMSQTVREp1aQnDNdCXhOzqGSlR8vZQ0x6Dv/EQ7NGDDwrwh
	y2gn/RbwAM5rghMHtHV9F2tUOU9X0RL/2jQYQGssk6teXeCFm6cC0H5UEv+ZcIZAC+GKd7fRgOq
	FkGn
X-Received: by 2002:a05:6820:a08a:b0:6de:1457:fe27 with SMTP id 006d021491bc7-70ba0e76707mr330211eaf.57.1792810952975;
        Fri, 23 Oct 2026 20:02:32 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:32 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v5 09/11] phy: qualcomm: qmp-combo: Add per-link-rate auxless/LFPS and drive level for Glymur
Date: Fri, 23 Oct 2026 22:01:34 -0500
Message-ID: <20261024030142.13643-11-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-9-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-9-3848c2615d5a@oss.qualcomm.com>
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

On Thu, 01 Oct 2026 15:04:26 +0530, Nabige Aala wrote:
> Add per-link-rate auxless setup/silence cycle and LFPS period values
> instead of using fixed constants:
>   RBR (1.62 Gbps): setup=0x03, silence=0x06, lfps_period=0x00
>   HBR (2.70 Gbps): setup=0x04, silence=0x08, lfps_period=0x11
>   HBR2 (5.40 Gbps): setup=0x09, silence=0x11, lfps_period=0x33
>   HBR3 (8.10 Gbps): setup=0x0f, silence=0x1a, lfps_period=0x55
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
