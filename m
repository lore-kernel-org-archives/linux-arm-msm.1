Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530720;
	b=0rqvdEHEuvtsxlCMm17nqkWkl4Y5er9MKs8sczvCpE3eTyncciTpJUczqbSKD3W73Lr/
	 IXgqfxJpen8sHXKKXJeiuQxX7Bi2ZEauGmC3Cj0vCc52eRH3drwBaVVwBBA84H57X2fNG
	 zTslKu+p2UckkNLOR9updfPu23StWaACCUNT2s8zXnshuLnDQrnhVaeSqzFr7rKyssn+2
	 FDtuJ15gnyKw/u4DZqTVmlNJSpq8JwRLdkJgXfXKJuJ3c8yB4wlRucw5MF6FZD8e5pfQr
	 PqFtPS7DbXhw7CCH6K/qfeHPkUx0lg7SOTTUgVQdhm+yv3tRrGkfjMfuEe94lbEvAGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BCy9FbfGCagGcVT1iVy5/qKWXuDsXeyd+T20CrEKRK8=;
	b=fOa1Tm9RdoYcO/gADlCgksyu1vsYs4cuHVUy10HsLg9w0Ij6HStvXRfbmdF0FKk9PLgk
	 tKP3SouDkXaaOp4fTckOXATiFQhFvYDu6qolEzH2UsJm1XH5xPJd/HC9eTHUKwevtbKij
	 0Vey/lq/+16qfS0JgWRqhykj4v8/SI3SMdO3VB5O6makDSoRJDwjN0sL4Nt2auQ5BBsC0
	 8qwQXm1xXhn81RNfJrAecwkPtYgQOpCy+n/t8Q2uTkwmAEZxta7sxHi9+ADwGCof23VBK
	 Ev/b7OA9t5FhmDKwmddwIDHsAnZxp6C7h5Hfs0TB3ouzgcFrOBmDtciwzCl3Epv1O2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNEdPM2u;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE08606A325
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 10:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BE08606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNEdPM2u
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab4891fc73so20645661fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 02:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530719; x=1794135519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCy9FbfGCagGcVT1iVy5/qKWXuDsXeyd+T20CrEKRK8=;
        b=YNEdPM2u04IwdWEarcCFuNlfrKyRUs/D6adKObe+2aN3T/8nBD4AVauHGs/N8j012i
         MsSZL+iI9NYmPDIkHfqr5G7EN+OpTTLsCMZjGtUQkjpJ9Ehjmp+R097kNUEqPB6SHXCM
         cSZggvawxPPjo++eI9Dgjgtm5uDZ4wmYC+WvWXhpVU61qS1EGuy9eF5vcM8LSm5hgpq1
         IyT9AsX0ySZO/bPbg8MfuZ8Jarr4ebvAEr/BszZAewg4CUesPizMeRKaAdbp25nTiX7O
         E31W8Jvq6U5MoBDuGNEXfGOG71gS1GHSk69RPGXFQrPrMKyxg1h3v8mYLRJ49FTmOEUa
         6Zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530719; x=1794135519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCy9FbfGCagGcVT1iVy5/qKWXuDsXeyd+T20CrEKRK8=;
        b=Na3LjNbwyMh97aOkaFlLyvGLO/j90d90BPIHxMXMST++nC0fp8Dnuj1F2Ch0NP5U/G
         siEgZUYx7GsXbGzSopo9LkTwKpEjEh9KwJ++lSQr/QT/j8EwLx1Q4enZ9LtUDtGBw8SZ
         AcXXKu396torADi5YeUButXgdXevH4DFJKNwadI0bdmr6hM9yd225M/WGR2Gh0df/1TD
         7OrMI3NC34oaRdjnacc8ENu3OcbPizhGXJCPbeCQSviYEZJQKDBxZfWsW/XIL4u7Yu0u
         kA71Y0uCjM2ndQtod7850o9YL+9Ji3pGhvvYVfgwnlt4Rmw/kVVA1o0VbfpogZ8MXtqw
         ptxA==
X-Forwarded-Encrypted: i=1; AKwUvBxprArrl1CI9WwwN/c1OqMejRlkg/VG86tq1MN0ZN6pRdat+6tHkw3keauDFjAxU9iEuYPZ8uW7owNB/XU1@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/D/8tBuGAYWJpPrhByq1jaw7vRjxSHxJzdHOcMQkspYOfqw9n
	+gjzgyfB8fcfYqr2EUE93VaoNqMHFE6LKAabEqPJpyBB5wZVGjFYP35T
X-Gm-Gg: AYBFou0PLJeBIlJiCXlJ7FpxISshJoM4C6UWj7B9N7YCPRWfkutMmuyIybZXvu3pT/R
	8OvrZSpY9ALruypMKrxrRdg3KE2Ne04Qqv5+FYiw+1cTvebuF5m4aicpmVb6+c+btFGf7mml50Q
	wMVB3nL42TxiV/mZ/Topk0Pvqvh0m7YVcuLLsZEQ2mRYjAXnf1Zhaxz8QsCB1dD3NS62ixFSlfU
	GETiJWlBdHVC1A5BQ1uJiuTiKgOSfUn4Q96cLgnTXWV1bsenivetGLEiH4+35cxWe7LGYiFTDga
	R2nXIqE26FYQDBzpEF0aqqza41NwBHedu9CZz2o0F1d2J9WDy90Y9gQCEHVbDz10qNsX/mIBZNw
	Nsxgp4Yu6hsnZZnBDu5L+svpBad+x9eQnOWiafqhgjO9JdVqPWqcHjZoEJcSAgTNytdsLcYIGOq
	m+w8JQka6i8UahrfsnSAjz19PITEsWOGHOjusGlJSweEd0jprTiSfOaRXKfo4tYIVsanN1rGHsI
	zh/2a2hsa3MhhlorHhaAc472yhiheR49uD15pdbNdj7iQv22/J/8tIiU6LYLZ4bIGgCPv9G7JHv
	EnNIFKVks6alF3OL7g9dzk4YCOVezG7w2zmo9aZCm2ErnboZ+p9oPEQM4XxvXOzlv3129end2q6
	I7C8XMITC/bqiH3jIaJ2YweLz58IVGfvij1I2FA==
X-Received: by 2002:a05:651c:1474:b0:3ac:330c:518c with SMTP id 38308e7fff4ca-3acb7a827f8mr15638971fa.19.1793530718404;
        Sun, 01 Nov 2026 02:58:38 -0800 (PST)
Received: from yantra.. (nekmmqtbv463r5fvgny-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:5462:a993:5223:791e])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbf1b726sm16613131fa.32.2026.11.01.02.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:58:38 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Remi Buisson <remi.buisson@tdk.com>,
	chrome-platform@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH v4 0/9] iio: enable context analysis for all drivers
Date: Sun,  1 Nov 2026 12:58:32 +0200
Message-ID: <20261101105832.55605-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101033018.05897c08@jic23-hlaptop>
References: <20261027124954.110697-1-zoone.rupert@gmail.com> <20261101033018.05897c08@jic23-hlaptop>
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

On Sun, 01 Nov 2026 03:30:18 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> Please take a look and check I didn't mess it up.

Diff is fine. Built drivers/iio with clang 23 allmodconfig: no
warnings, and a dropped unlock is still caught.

Subject line got lost though. It should be "iio: enable context
analysis for all drivers".

CONTEXT_ANALYSIS_dps310.o := y in pressure/Makefile can go now too.
I can send a follow-up.

Jinseob Kim's Tested-by didn't make it in:
https://lore.kernel.org/linux-iio/CALMSew+nhZp9BoqS5tOgFdiVy13U1r2f4UQa9Sd5zc9pSt_YcA@mail.gmail.com/

Rupesh
