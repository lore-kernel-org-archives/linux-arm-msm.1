Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793121728;
	b=yh/cfe0LCLwHtaCQoLBieeBdwe51Nd6uBd6v694R5UPj4xuFOKCEbCR5vvxPOTPk5ZYC
	 ldl4RaEIk65YdEJ9BhnoWYH5PG3LvVmyiv95qZMBAy1ieGESq9CkWVWZpZeJSJjp/7ZO+
	 OND/B7rSLCOk8XhUU0xNyRo5H3P3M6iWBwQO500lWrlL8fNnJjF+cZrC6CHo3RDuisUkK
	 qSkyx3+ijBn20opNjhMGQ8UJvX+1hXa9WoDsjiBGdvrQxrjMMkeJuMVvUQXS3IlggvLJR
	 02hobPJA5/doghFZAmONCZbPAFTRG40uOIEXyuqb2SxKskmRbO7wD0m1tB62Ag+Et1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793121728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=sCMHExecnr7EVku3xKOnADgdNnCumi8ICt8RRfPLFyc=;
	b=uRChLBm4CDOkdnhxV/ITGCezP6WmmJjI+gpcv9iHsHZKn2nIf32hWObKQLHIawL9f+PU
	 4LQJUO8EOg8xrKediPfCannMBuDEV49SRmj3bVTnJtKu62vFXGXugjQtx+LnxvZYUE8+e
	 OPt38hk0+SHGMYr38i2Y5y4kSU3q/UNmYPyBiCFYLgKWMLRetohCMFbwwLqwY+amEHC/t
	 mAz4I+C83oWRN9mvajd1D1Ub4lInyjEh4lpdmjMBS2Z5uzlJEVKC6z/HzopkQgjhcpr4v
	 6N/knwjkw3HpqdTeM5w5oftixH4OnvfM0VpiYuY2jIGx+Rmp4udgBG1Xl1hLk0OkDag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C41cqylo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E386606A31F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 17:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E386606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C41cqylo
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-156cbe59524so35690c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793121727; cv=none;
        d=google.com; s=arc-20260327;
        b=IbdsPPO7wDZXkhU9LF5uipUF+0p4ErARq/Z4a+3CqPlie3dwfsg/ueB/Pn+gpbRuxN
         e9xRO6k3l3h+wwjSF3pWbrhdpNW1a8elE0SvLHyS/z6ONcB6X8yd7xza82DnVQQ8H07O
         O0IE/mHy73PUk9F54XwmpdrvfbL4MiOa4J4YypXv4XAcFZCQuiyX5FP0czo70bGgw2HL
         yC7A7/YcSeQjHhf4hepPpe0SL8opbTaUBzvY+RJnPH84DI0SGITu4afmxEp4N4Fckq6C
         4C7NlCapRmNDe2FlQJ4OPPPiS2s2KtDS+67pUd/wTimfDWM+2+LKzUTa+O6K0RgYUkKV
         uc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sCMHExecnr7EVku3xKOnADgdNnCumi8ICt8RRfPLFyc=;
        fh=Cwrgk+tvhPt6P4MFsSheTWe1YJSMY4EzP9SWQC66d1M=;
        b=Wv0Si7pmaMDlgfYUyoDmF/atG1vRtOh2XLd/bUw0caQ4H2VhU3Q3OxPT7GdlrMEWUW
         KQrnf218hnq15PUmpYG1kvHdOrSVaGpKQ95LKjGvoyzg1ASnDFLzHiixmNak+YuVZGc6
         wdloI18zid+Wtd2FLx0GD9lE5I1qvYH3EsB/VTEILkihYmE0DQl4Vbq2MsheNPWrZh+o
         ddPIP7p+u6xdKfi8dLM2KJU6FN9ECMU5XQBtq5l6IJYH1hPTgL86AmYWbMN/WTaMgAG6
         o9rwksipY14SVJxsYS4yShViism+wnUWFyKOM1EX7J6/bqwoCOxVVXxaQCV7SoMc0mn7
         quNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793121727; x=1793726527; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCMHExecnr7EVku3xKOnADgdNnCumi8ICt8RRfPLFyc=;
        b=C41cqyloeS/h5Vtwj4fa7MIjm2aLukQaJNMjA01Wn+JGGCcQqxaMEk4qtaeGLTgF11
         +xXojI6iydcNCHCInBDP9VQyo1hJAFD3dr6yQmpBM6HUXazAlicytsDrwlamPA50lS4I
         ot5PvMH/HWpuW8LsxGwuM5M0OIfhb6YxMmvO1BL7uALyaS3FIvEjHjPJFzKMoA1yF8FI
         hrNTtVklmnbX0GKT3t5upCjaEu9RMl7g31Ii5f+e1EuriC9yJOvccQQtUIHojQFDkmTh
         oSuMUeEQcN3ZJUIM7OREyaxa56yxzKExGn54vpm7A5KxV62XI0nsE+2SOQIxafVeXPuA
         1IkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793121727; x=1793726527;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sCMHExecnr7EVku3xKOnADgdNnCumi8ICt8RRfPLFyc=;
        b=Z2vM84O4NPXn1Cr/G0EErdgP2msAjlhKwJq3jZzGHkAaIzTLSlW4F5pszyL3VolTVT
         l/MstP3CZw3qzDI8cnVHlPZMDAg0fD0ifXJzgxr4szdE7HywAaPelIKpUzVKtpHilC6S
         3Q8xsE/Oyx0qqyN7947p61iGbCUUXb38dIgCz38ttHONzCckJYzQuX7Fyr/suOABVk+X
         C9RR+2vlnWSdH4I3WRLiWaTn2eJdED/gmUrbCU6nabiW8NV2pVUX18Un866wtfUDiO53
         eGnFSV+iVCpvKidmzdB9JeFbxONZOTkz8OU3UCwCIZkl7FBivk4itvQ10a6Yp1Meql5U
         meqw==
X-Forwarded-Encrypted: i=1; AKwUvBzOjewM0NC3YfC9s2N0j7AM9cWnKNp3AhdCsRdRQKt4TX0dI6thUtVPWbTLPf+tdbQEAzH7sS6Wss8Ck5Ny@vger.kernel.org
X-Gm-Message-State: AFq9FYJsJTIVQlXhpFDC8T9e/wLAl3RZbCrm0GadRUgx9FJ8S3pVKX1u
	yOTYV35nBOqg7FGy7wcjj9KkRk/YzXfVjomsTeCEyX/TqplMv+AgN2H31+oZZm4IbPVgwUgkI7x
	hFqxsK1uO9di3RNS/4cCbvlIPUtdguS9KxGVTvXg2
X-Gm-Gg: AYBFou1UGoKutsy9orLyvIuTI+RvW4uUixMpwJ6w0UBRQ3eq1twlYU2cSyYIZ86MSHV
	N3ewJKTPqSrW78qQRXkPd5+uonSG1ygjuSnQT6qxXtWrqok7kjIocVBHP/WcGA/nFfa6Z3xjCcc
	rjJG9/KQaIdfboo/stcfWQVe/7oHANqw3rGCxSbowdi6fTLAEtxc3r1kmwFfpWpKTDKeqn4/xUs
	XpsSApLYNlMuGZwFoqzBNJhBerCoXbpnbI7mQpLvjbxGIu223FrqatDx3Iiid7JpHoo/2FlctSU
	/MdXorvV1OHnlvFdKn4rqlYLWIydKPb+faqC1budEJCorLpqjrg4JRG6NXerEjEdUruzHyBtLJJ
	yj2eaYpLBzkEwx8iEDfR6+3kxEsee6vUq7lTkzMfOi/fZN/fVwpqIRABaDMORp7TVKSwYnFo8x7
	+hw5FGOywbq1U=
X-Received: by 2002:a05:701b:2311:b0:16a:8ffd:4977 with SMTP id
 a92af1059eb24-199363a356emr13049111c88.17.1793121726447; Tue, 27 Oct 2026
 10:22:06 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
 <20261027124954.110697-10-zoone.rupert@gmail.com> <auDNzWMPy0VQcazt@ashevche-desk.local>
In-Reply-To: <auDNzWMPy0VQcazt@ashevche-desk.local>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Oct 2026 18:21:29 +0100
X-Gm-Features: AclHuK8orvmEUb-f7W0Au_t0jJZW6yeRJKoPRMRQ-D7ejg8oB9UAKvhykKBG7IM
Message-ID: <CANpmjNNNw3Ont87-Uqo_j4YrPbamHLue=EAMkc+B66Q_yywQ9A@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] iio: enable context analysis for all drivers
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Rupesh Majhi <zoone.rupert@gmail.com>, Alex Lanzano <lanzano.alex@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Benson Leung <bleung@chromium.org>, 
	David Lechner <dlechner@baylibre.com>, Guenter Roeck <groeck@chromium.org>, 
	Jagath Jog J <jagathjog1996@gmail.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Jinseob Kim <kimjinseob88@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Remi Buisson <remi.buisson@tdk.com>, chrome-platform@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Oct 2026 at 17:14, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Oct 27, 2026 at 02:49:54PM +0200, Rupesh Majhi wrote:
> > All of drivers/iio now builds without context analysis warnings, so
> > enable it in every Makefile that builds objects, replacing the entry
> > for dps310 alone.
>
> ...
>
> > +++ b/drivers/iio/Makefile
>
> > +CONTEXT_ANALYSIS := y
>
> Can we reduce the churn to only adding it here and do some magic to propagate
> this recursively, please? I truly believe it's feasible to achieve.

Should be:

subdir-ccflags-y += $(CFLAGS_CONTEXT_ANALYSIS)
