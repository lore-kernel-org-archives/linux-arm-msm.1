Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793113761;
	b=y+NzBF4okBIuE0XeWkkeUoGIzKa+jdW9UhXkK3OJhctsX7oiSUNZUGXZ61rh3VHHYY2J
	 R31VDIOtMuEN8Xucu7joq2PBkALy99t4wDgTr/zGujDd/PSHkdbE5292jPZmbgS8JSi5g
	 z5OLRh/PQDfyA7vl2B90umgDHmiNmLHPwJwhEepTUKQF1ORJrNijHsqe905BUwVn2zwu7
	 ypPl6Bu4Ps9c5NnjXAtvbJUmi/2m27+gRQifpgeOsH3atheTGOXjCfVNSswHTlfu8VzE1
	 cVB76Xkci3ErMxMoNx8kJqVJRcgCgiQQ+70FPGvQ1UTLzKxE4Nhqc4wtyOfbFfiva1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=oAHxKAOEiqLhGsEJj6uWGojbuVaoZYDv1iJ7mHdZGsA=;
	b=15AtdTYOOFnSiuUJooUB0vxL3Co0aVlGVz1kdLwOJ+MveBr7QdGFAvxVLnWZMriJ2voT
	 E7675HnToKoUDtBJOi+gzf3C6y2bAyB5+aYhyw7tQgyh/UbqB0MFL+uAppcPUdZaF2/hf
	 8hxhdJte1sCFhaLEljCn9FJUAasusonIklHuvuiPrD/efUwBID3bkJ6MjCB8Lip/UMpx2
	 19RN0opvo1GGBDmpCoL81KtRUVXu4ZiHU2CpwU5ewFxr09KzA674Zyv2fq+Ots5h52bAA
	 ZHPxwj96cddbP/ZrO/qzZF9oW0emMmqic+L/BHsQbHMvK2DmPcSCIu7kAo3ZxvaOEZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=co466oFF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09506606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09506606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=co466oFF
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535a54bed9so6545087eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:09:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793113760; cv=none;
        d=google.com; s=arc-20260327;
        b=ePbsmESbNlCXpDUya1Z9m4nj8UtboaOZrCJbRaxFYBi9e85AQ2sP9aDQvOtwTPL/5T
         jW9jpt7Vf/HNNo2ViWl4WBeO5e9KoVBtpp9L7cJmVtvwD3NLT+nPtRBhxa2C3carJWQl
         T1HBDMDLwP1uQ5wwsofIbaunSfXo3ftNMleQaYrj+evrB9WFtkcyzBZbhhWU5aBxiy9A
         OZ3xkLvr47iP+B8ZXwqLfHL0guOOOAYYEkW5VJ3/W2Q5vrOiQj6G1YHtLbqPULU2TnAZ
         udy3+HouBEz78PmMIfEeuy0lFmE1jfBV5Ed9VK9u9SvbK5LGH8VPwnuRv2/kpVFXbjMs
         Cbbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oAHxKAOEiqLhGsEJj6uWGojbuVaoZYDv1iJ7mHdZGsA=;
        fh=x8a/qPM6vt+D5moh7up1+hrSlUc2aMjTLtxPzve0mAM=;
        b=kvGS4waavZBOFMzGlJfakdGrfFOuDy3YBF0dNvXEuufMYB2sZYR6Ln+5Xl+D0cUkyo
         pVDtfHIplpJs3yuWrAbCQ0IMMD7wO8RcWzAnXYQOEDrIsfuAqHGX1oCDZHoTxkPSCV1/
         Jzj3YBEsRkTx5e0ATLtO9byN6lZQmiqpDSHw15eoElFyMvWoP5dYAgG+aOEDp8oXuHaA
         FI0yKfGL4dr/xVmEK9ke4Hvh06oJdPpuuE6RuTqvzKy4pH/14uob09SOvsDhFZME16VW
         pGbIobTFRBLoG0UUfoXlr5mbV8Y8X7ghv5a8mffnWQqDBT6hdrCcBoWWYlVlMjN9uC/X
         tp1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793113760; x=1793718560; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oAHxKAOEiqLhGsEJj6uWGojbuVaoZYDv1iJ7mHdZGsA=;
        b=co466oFF1dhQmr2N8vEvSlNncCSXO6JbBOpXu3AWET4ZRArQ0r5TFsh3JtzIiCijJs
         xuVELQBeufrhTzCRwaLyL8IJ94XYqwLjwQ3N+cMEQtFXinnkOenaRTKVr8WkgE73/iUL
         gbZbuqionHz7tYdmAQP1py0nt116nJIadBvAhG6AzwmPkwVa6rXM7EM86B4eB8T/7V7g
         EQarfMCisspF/8XzNwrt4NZ8cAgg0yWxLsM82t7x18XK4CkIdCNTCRscDbHeWKY/iGJT
         gDPIv5zAgn3MCyG8o/2beygcMBwF9PfRJb1KNZIMoKB6X7pHl5zKVUfmZWYKrj7NMVAL
         aBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793113760; x=1793718560;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oAHxKAOEiqLhGsEJj6uWGojbuVaoZYDv1iJ7mHdZGsA=;
        b=aMYUOqOuo/p1OxUwkDxHrMol67E0UtDswwnxApO3UM8MYkl2eutGq1BBWu1D61PYdy
         G1joZaDHkUMnVQejZthlgsUMw79xof/5SYjAFje4YXKqTZWUXH15955KzOcuwLw3ERs5
         AUaKmFpM5Lvp34zcQtGxByA1pgvOgpZVOr7+090SVUfFHLyHgndeMjxfS5i/cMXj9nK6
         Yhv8Z05bRIr7JmRfbTyx25uCXxw8vgupoFUXeMIhBKbtCzxZ7h39DzRbXIWrRy2K3rIL
         VgNCwtPg+/jT9Sj0yaCXlzgiUKAyWQ9ENNCTSdAkRXTkiKTy+esXeweSUYuwz5zuLliB
         4x0w==
X-Forwarded-Encrypted: i=1; AKwUvBzQshvDyAryv029KsyznuCfbWW8oM6VR/Ou0DzQWLj3XqjQYxxjgEsDl3JGiNNfH/xClgCmZyGOOWPN0viR@vger.kernel.org
X-Gm-Message-State: AFq9FYJg/hQdtXYlws+TCus77YyzbPGiXBknIkH9GBRDpVjreJPmIJj3
	3tXRXvGi0MTKGMxnXyy3kcho4FZiNG4N3Sy4Uq95jaqOnnzIKhyJNHyfVWH8f1HUHroTQX+FHoG
	cPbYuZRaKi51V9cAuHYTlGRKR1bPMmuQ=
X-Gm-Gg: AYBFou0TpT9U+QI/ywxbbX9UqEvYX9Vb20mbHob06U5vNMDeSnZ60P9ZI4Q5XvaY8dw
	cHxeCFbZzOCWU4mc/5Ce0/3VkDvIGCpB0grMAn4JlSAIWJFccDcPfKd1ev4TDr43EDU+IIWZnPq
	IzrTTHpyCCWzOYUVvKv/Z/7M6wTDgkciFN/Nm65TLpYFBgaowa+pT36krCwjfn3qdO8donAx936
	p/jDoI7BEPqTrdr7nnBInNhruFwnJSv3xN17KlFYuLKQF5LkjxETrfdHwo05uvtFrzx6wfaymks
	3IecXxx+q7bmUQbfKuWj/+j/YWixgSRS3Ywlce2avb9pSz8zuF+kNaJ1fjfR3CMUM7VZjvBW8QX
	GRWXMMI/oSKaunBxQ8LFQY1WVHz0wfQMVeyLCXEBuUWi9t8qtm1leWGeu6aoeKrSdJLBZxNF6IR
	/txiarSz78Nn+OQhSstL06enN0j/UKWcaPcR/xBcnwGqgFnCQY8kKUKg==
X-Received: by 2002:a05:7300:e024:b0:36a:158e:f917 with SMTP id
 5a478bee46e88-36a158f021emr2604437eec.6.1793113760079; Tue, 27 Oct 2026
 08:09:20 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027124954.110697-1-zoone.rupert@gmail.com> <20261027124954.110697-10-zoone.rupert@gmail.com>
In-Reply-To: <20261027124954.110697-10-zoone.rupert@gmail.com>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Wed, 28 Oct 2026 00:09:08 +0900
X-Gm-Features: AclHuK8H6vSFxFswuEXecNS4oxgF2wzBLnY17J5ZgNNydJKg-55kp3rBfAwA1Kg
Message-ID: <CALMSew+nhZp9BoqS5tOgFdiVy13U1r2f4UQa9Sd5zc9pSt_YcA@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] iio: enable context analysis for all drivers
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Alex Lanzano <lanzano.alex@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Benson Leung <bleung@chromium.org>, David Lechner <dlechner@baylibre.com>, 
	Guenter Roeck <groeck@chromium.org>, Jagath Jog J <jagathjog1996@gmail.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Jonathan Cameron <jic23@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Remi Buisson <remi.buisson@tdk.com>, chrome-platform@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Marco Elver <elver@google.com>, 
	Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="UTF-8"

I independently build-tested the full v4 series (1/9 through 9/9) on
top of jic23/iio.git testing at 7d80b4b383bc, using Clang 24.0.0git
with context analysis enabled and W=1.

Results:

  - x86_64 OSF: 5/5 translation units built, 0 warnings/errors.

  - ARM64 OSF: 5/5 translation units built, 0 warnings/errors.

  - x86_64 allmodconfig-based IIO: 723/723 selected translation units
built, 0 warnings/errors.

As a control, enabling context analysis with 9/9 alone reproduced 256
warnings and 2 errors. Applying the complete series eliminated these
diagnostics, including an OSF warning resolved by the conditional mode
claim annotation in 2/9.

Testing covered compilation and static context analysis only. Final
module linking, module loading and runtime/hardware testing were not
performed.

Tested-by: Jinseob Kim kimjinseob88@gmail.com
