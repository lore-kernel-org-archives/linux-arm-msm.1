Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738033;
	b=vIvMGz5UejvEXW+CMEJsGu13HXkauyCZ89gFSKvqyEyJucyl4YHHY8ked45OE/TBfa+v
	 g/jYNmvtuEB8HcBwWRwgS8G6XLaRRk8sSodYfLTZuZhkxtajPxSlJw/n7VpY3aCcusgRO
	 qVi8kOpA3xrtsERzSNI5gXduOJjc8OPgekAs9MVlPGqLwH2atAq+xP+pXA+3aJof48QGI
	 ndufln0Zn1Beh3rBVmjHMc4wFZ2uGhviNG6qlVIMGMsun3JvkJqTXLEve0OtEv6Eh1mXT
	 HENZM8hwhTWXAyVhQQ0c3GtPUeK0+97YB214C5HfEmTgoF2JZmme4RSLntoRMpSFRjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pIi8MdAeFNPPZi1519d1TRfnKE7WeSeOMYcIAex5C5w=;
	b=2AdKg/9EnLamqcITkFV6GLvWr708cEWLPSSpkJ33c9fxNl+UQAVb05W68FHMGlUFWPrv
	 n7b3UCN7vwV2JKp+rvk8G7XqdgHhPpzqIq9jVFcoOq9vskAwK3eyZYLc91Q/8+6Oqdw+w
	 RQLMPeTtnQC9dy+i8Q9SOQIKuZlokpFcOwGutZZ+weyzyIx9QWDKimcMuGsasr2m+WLCr
	 wqHCCs2idaXmRVLoZvc+rpoy98N1VbVpjupY0H5VvJE7cLcGzkt0zEtZMPtf8lgbmyx7W
	 OiHeryKZuJF1IbnDAmSEQSlXCVBOKO9mtu8FQGn8rW1+E2CTybTeyGla8lZqiB0htmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WrYKUUeK;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B586606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B586606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WrYKUUeK
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso432660e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 23:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738032; x=1793342832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIi8MdAeFNPPZi1519d1TRfnKE7WeSeOMYcIAex5C5w=;
        b=WrYKUUeK1wAUN0YSD3859zM1x9INQBLFaKDfd/J/HNg68fzU+DejXhaFhHpeym5mxf
         rA2CyHX4NdIYHbc7g6Oqdea5tgdFnxWQdstK2OQMgD+oP6xLiqGH7Nfu/GjrjZejCbBH
         dGSZw1aMinokzAcax9UmLdsA5rxMSnTMwg9W/GLVlJy6Tzxvm7eCa7LuqXnRwjZ5Dc9q
         RzpxpweKS0gHSVEQCkCHMVkHdhDKlVQqcIvwgKjGy6xdd/gAxjnss9IonXTQG/YYmzSm
         UbfW0LusbyQZvem30e4cYKxHwFeOC9Y2iej3vTEeScmC+Uunvc7h0HhamiWPpKZk2nO/
         Se9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738032; x=1793342832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pIi8MdAeFNPPZi1519d1TRfnKE7WeSeOMYcIAex5C5w=;
        b=npz+3z7gHYRTEFOimEvhy2JbT6JpFItmoRlCxD8I/0BlRp1EFfyuEe+8khH7GlqQLf
         j9P+/GVt98y9F90agjPPgrRVdO2VSBco0pIZaCj2mZVUJCmrg9WcHpdLgwUf3kujn6Hm
         G4vehkqYgit81qeFM7ifA8zs1/olz/G20T766KkRqMp5GI/M+JHouUujSnDRgxweGyDl
         CmQ+kNOJ4CV74FB7dmc/FF46TciSTsPd8gMqah+zIeAzha/gQd1klQCfXABDL8GY+o3x
         Mo1NtP2yCEPUdMKuXJJpoFYVYd9Pw2mQD6p7E0HfeUFPAFqbXzkbo8pMVOwXuEOEvZAd
         wrpw==
X-Forwarded-Encrypted: i=1; AKwUvByznNLFSfay3LweR2DGcAERq49ADiEdT2J3zJon2KAdcjjoBaRecxGiuif0FbsS9ayrcG8e3xBs/hPrJIMl@vger.kernel.org
X-Gm-Message-State: AFq9FYIGdR+43ACiEPvYeLcgZZQoMvuu1wPc7URe7gt24y9olc12JoGT
	zME4RtIjtys2eUr8gG1n/TeHJyJmPKxInBCkHjvVkL7MVjJ+pr8ciMgv
X-Gm-Gg: AYBFou2xcbGLvSrBY7ajOfZR0WhdTR9148kSvHmg9ihCEK6ls4Z5zHdDWmElzI3p+RO
	Oy5An9yeCxg+hIGRGq0suvEebSI+4iUTa8hs8t+3Dp4rNNOmOF3wg7Nj1AFNSuhGAAFyQM63U3Z
	zE3l9bmDP3q6KMTtZ+/tEpC31WvXPDx22mLfJvK+HGwHdCKcW+OZZK43nbm6UKnKpGdD/l6+U8j
	eIS6FFg3CXDT/r+bbzbtCloCnA98T1EbR0GEz6PKX87Y27gcxvA84tISKrX87Ak50emOQhnxZv7
	4J4Di4BfsFAKLsvbBTiBFhcL3r5wjV4ctqHVVp1XIAT6Xx6zUz52yXH6H3dBJj5qOOR+XzIW0+a
	cmbzr68guszeyD0lxE33a+8d/gzrT8qLXUSbipvB4jppYdZGY4WTpHBhYSqH0ouQbzeYCnLFgBd
	knJPBEdr8dTTU/bWqvvi4E/H/Pv7wX5xcSJ4T28RqlI3KxUcwVJKoCVgEIA8zMQlnKjbNm0MmXl
	JGCKsQWRs5CWxO8Kb3SR9noDCwa2/tLZ/kSrdHNYaxv2h67qkDdi3EhhTpnylARGnSYGgkBtc8F
	DNgTObux+mF0c53BcLr4/3XJje4ne8rE/8k1HAvLA/5nxHu2kJhppRfgjMHpFUhQ
X-Received: by 2002:a05:6512:2c8a:b0:5be:414b:a84b with SMTP id 2adb3069b0e04-5bfb0abb0fbmr363051e87.51.1792738031443;
        Thu, 22 Oct 2026 23:47:11 -0700 (PDT)
Received: from yantra.. (nekmmqug0dsu0zzscv2-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:9db7:a72f:37b5:1f1e])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb027372csm246233e87.14.2026.10.22.23.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:47:10 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Bart Van Assche <bvanassche@acm.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Marco Elver <elver@google.com>,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on mutex helpers
Date: Fri, 23 Oct 2026 09:47:09 +0300
Message-ID: <20261023064709.77180-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021202433.0efc7979@jic23-hlaptop>
References: <20261021052435.112686-1-zoone.rupert@gmail.com> <3f41338e-fc47-4306-b68b-5a81c26027fe@acm.org> <20261021181944.14272-1-zoone.rupert@gmail.com> <20261021202433.0efc7979@jic23-hlaptop>
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

On Wed, Oct 21, 2026 at 08:24:33PM +0100, Jonathan Cameron wrote:
> I haven't tried yet, but I think you said not much broke?

I hadn't tried either, so I did: CONTEXT_ANALYSIS := y in every
drivers/iio Makefile, on testing, x86_64 allmodconfig, clang 23.
255 warnings.

240 come from iio_device_claim_direct() and
iio_device_try_claim_buffer_mode() lacking __cond_acquires(). The rest
are 4 in industrialio-core.c and 11 in five drivers, none of them real
bugs. With those annotated it builds clean.

v3 would be this fix without Fixes tag, core annotations, one patch per
driver, then enabling it for drivers/iio. Does that work for you?
