Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AE236D9EB
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 22:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791672284; cv=pass; b=oRVc8foMMP8F+kASDxI3dXRC21BnyjREGPd4iUhBmCTV/x7WrsGsYT1rnduj5OsYIWF+frNWx1b61dIevs3n6yE8xRFOt7yeg2XVZAjZrWDVBYxMfGFV5Xc/2rBFjxcwWG6LgSEfWMGyPUKivXxHDT0nc550UZqc2ckgo6Tm718=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791672284; c=relaxed/simple;
	bh=nbb/AEzxbWb1wH79cWu6esvVp0pjm+0ygNJUrbpwYnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oBJhTxAnCWPhbIwiXFVEl4zH6qR+05EzjtwDZBRaPXSOnwxrr/uc0aPV1i8+qF1p8w0kiKraliX+Dlz3kwyUlGlDVXW1cn8Twc8xONdxrtzUKxixM3pod734pABrB+2znA7qh8yo1mnuSA83jJFLlmU6KGcxgJJDcciwzGMDSKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=orC6hd/n; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="orC6hd/n"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67921b515a7so542783d50.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 15:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791672282; cv=none;
        d=google.com; s=arc-20260327;
        b=l5Cyeo9HBhYQrDTArPrm0+Z9KKfGkmC/ubz9+IR8qUuFBbJceqVnHX5ZzxMuK5BsSU
         yK1hAieP+V8xvt0jFGTXLntpXfNm4ooX9L2fdlt+rSQqNEZT9IacH0juoCRcaYDr+V6a
         f1GAd7idCgLWqSuDs9RIpgcoL1yDfl0UodZeACEfDoDWuf5aL2WJrFgZ7eJ6UBFwGou9
         1B7ZhLeWrWWI9gK2B8aD5nFzdYi5WxGc5ldKy0DaNijhygiFfaGtuNhdo9cEWxfRjIY0
         8Om7QP2WSNp39sdQrUobTpWQvk30p32nfttSX0dyeG3rQVLBFjKinD+a4QDn5IwddAnv
         WNyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nbb/AEzxbWb1wH79cWu6esvVp0pjm+0ygNJUrbpwYnI=;
        fh=zt1wmLD3FuGev0Sgsvl5mNm72UWh15R6WxbQE2kOaXA=;
        b=R43foHDe27nHiWPge5dQeusjv++dHjOTJrrAeciF7mgVMrGnoKmA1/LHgA2oeuSvKH
         z1qCJmRwpIsAl+kltGl32RK6VL2yGfACGLRFTC4Wi7W8rClsfdc5iNGS97JmPAmNESR5
         SrqbqnckYxctpTKcNjU7TIPPbwYtb9S3ppCqeitGVL/7BPaj5PVmmIWUNRIN0HWKDyTL
         y1CH5j/+A91rVaYYkn1nf/JCbENCPhX2O89pS65NEYKc9kG6cEy/sSKgnd2ETAuBY4xH
         oapPW/LWMiEMHEpc7mHD8/iSctCWjyvJKsucTh/9d++x/OzGtw0riN0o59Uw+B32gzSq
         rxiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791672282; x=1792277082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nbb/AEzxbWb1wH79cWu6esvVp0pjm+0ygNJUrbpwYnI=;
        b=orC6hd/nqS3GlfFeRahgR4tSWZeP905pr156f3/tFtfaKbl0jS6+lItsqxThbcq096
         ChC73FrIB3oD+KHaCgeLn3/1PZDzDDF71+P/qQumLixmjbGCIPFzZnSv9OTBLFxfJT+o
         siWTPyPBL8N5g2LBV9YcFoJlJVkEPL8rTK+XImxGgSrhlcZWp5a4qhJpcz9xdub6akx4
         tl3mStc4+3v4tTJe2YVh/M1iD1Tgtk90b79CHlCg6WKceQWo43UR7SilxTV7TuUj/8Cg
         6UtHm9VRiovZs3XmSGnFO6/AJ+XTdqryymB+SUkI9Af0Pay55hj1J6QzM+jua49vCE8q
         tzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791672282; x=1792277082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbb/AEzxbWb1wH79cWu6esvVp0pjm+0ygNJUrbpwYnI=;
        b=hA5MgS4i2GNI7TqHLZSXKWncXSuHkz3PBIua1Z2m7u6hnXRYQS36hk2QOe3diAC/s7
         CAK3NZZHUjIKojL+DWNdsbsHfxZSoDYew1LFZKP7SBcvgYGLCUFOBeq2PchqzcvJbgUp
         zC20uu6Ij8B/jUjft0KEWKU1ApeWCQcotMSWwrcF43/4mCJnOgr9N/S3lhPYoieFisbN
         unGJpeoTHgFAJpaRkur0VwW1zneax9AY+zijFqCeUaYrwL+/cnXeZfHEIVKA1EqMgMUN
         OqOV+nwuPH/9gfS1DQ6s/MEkuCmS3FWOjGBt03heRnOcGHeWH1fPUEhsN7GByokPYFTz
         auag==
X-Forwarded-Encrypted: i=1; AKwUvBzMaALEzmMPrSFyyDFJmDgQTk/3hvhuMVgY/dY7J0igkurIPqhFlhQc2PaSwpox3Rm0Mvx++C1E8+VCNvCH@vger.kernel.org
X-Gm-Message-State: AFq9FYJlO9kaKLfu9YL61zG00au4ep1qX/eAAGWxquTGqn0x2rvPy8P/
	Jo2f2ClZUo7D130ubfJTddqKL5Oex1I7vE2ywc/JoyBlt+K8RorcIknIVYJFFC07GDTfg2GwziE
	EMb1QOdp1DAwMMOy55iVPxi2GvyLk6aA=
X-Gm-Gg: AYBFou28qldnlRAZSopQhxeCYJWOtRmvPDcDQEZGVXNDKsrwzJHz5caBVDbfMjHCFPc
	IMgz9DIkiqkWn+1uw8E/SGcCVA1RsM82CAx0S6ZDYQxQ/CaOEYUlLMqNwuYLzieY5JMlRioALm+
	4hC6n0VQ36ylMurLRL3p43xrf0reLb+WTgnYKM1lvqgmDq2fGyr9iXWO+99lfhHmmKjm4t1KZzf
	Pwm91GHpumN2xldWNWwCQq4GjYSarszAPPmGX3tuMyfNm/Hv3deIJTyh3ZrMjo3kP1QftzQSMER
	WqxMsx6XN/gcyzFQ4l9yqYqcuau7XWz4tuOf+HEWurJnpqYWV1CoJ5oWNRkLNu5YrxaDN8I0AXj
	cN5a/bqTZWHHj
X-Received: by 2002:a05:690e:4144:b0:676:8c58:c607 with SMTP id
 956f58d0204a3-6793606970emr2386943d50.27.1791672281835; Sat, 10 Oct 2026
 15:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com> <20261009-msm-dp-hdr10-v2-2-1835d4966da3@radxa.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-2-1835d4966da3@radxa.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:44:31 +0200
X-Gm-Features: AclHuK9SzxfYbidbXHkCFy5EESOculWVRi3ikF-IkFS2nFcOSocjCQZtavNl1aY
Message-ID: <CAFBinCDtwrEpLY7W-VKn=ekCPbwAeq63nDX9y-nuV_TviHFJAA@mail.gmail.com>
Subject: Re: [PATCH v2 02/20] drm/connector: Drop early state allocation for
 max bpc registration
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, dragon@radxa.com, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 5:17=E2=80=AFAM Xilin Wu <sophon@radxa.com> wrote:
>
> The max bpc property can now be attached before connector state exists,
> and the atomic state helper restores its default when creating state.
> Remove the early state allocation that was only needed to satisfy the
> old property attachment requirement in the HDMI connector helper, Meson
> and DW HDMI.
>
> Update the HDMI connector tests to check bit-depth defaults after the
> normal mode configuration reset, and check that property registration
> itself no longer allocates state.
>
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
