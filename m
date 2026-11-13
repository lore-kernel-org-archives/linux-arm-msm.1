Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601961;
	b=P+EAilrzBwbQDvO9/uoLd9q0LGmKtqcojBWeHsalCqMuP9OezUHRl4ov2AxElAZlvMIg
	 j2FB2TMGlKWb/IA0kB75pBCpRJ8+LEJKVB1qegLwcOJqsQWKF+iuwd2ex0uyPh92DcRc2
	 wk7qheUO1GYjYQeIlESm/0mfTem9ZWD+VaVLaYWvgM0A2LdgHjMr8vgDpYfSLPAfxLKR3
	 OvvsZkaLEqHq5FEp7+gMKH/ZxFoZdwiJdrChQEpm5Upa+kHbvxuwr7flJrxVUVJj66DR2
	 m8uuvpS7CEFUpATSalyNAe04/hYCOPo6R682cu9SckO7tuItmXXhWWe5SR+A6DLl+0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cQWS3D95HYvPb7PWVOlG0meKch2x/9ofLSM7aTh6608=;
	b=SRkgb5b7IZ7sPuQU4FVnKWgcTG0kul8+aI9khD3md+9f4FmUK+uAHNOt5LkmtxMmZ88E
	 nDRAVy+gBGJadqRQ+Ako8YQkKGOs9DLJHW7JPg95y7Pwf6DpsZE20uRUmd+mTo2KFwa9K
	 20f4jxXAtH7Ooqk3/JBRggy+CfylkH1YVmUZLiyzU9g58o3kLbzwvqsxujRL2eXejVb6h
	 Igsg+JEYHVPC3Se4uNVuTlHeVEI9c2CGTnDbqGbFaLKukbL+uFEC/BXTB6dMmBgLurz7r
	 +aU6rrrwU4S/ElpbBhDuvyNV0fzyw/aKKJSU6IHKs7YUT6b6tWUw8nvF9ExaOmLogAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OmToqri8;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BA9606A331
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 20:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76BA9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OmToqri8
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c506a231b88so244314866b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794601959; x=1795206759; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQWS3D95HYvPb7PWVOlG0meKch2x/9ofLSM7aTh6608=;
        b=OmToqri8FZJHGHZJkeQICNArMrD1qYEi5r8DXY/BPD7sQwSIkWQacZEWDLiHdb81MQ
         +KokbijUZpcGiASXh3ks4yEzsLJtQk/tk36hOHfm00/NlDbI7sETtVAIaHhwoACjaEBx
         G2t/ODVHa6bhkR4VQ/pCvHNna4EeEwEdNP1ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601959; x=1795206759;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cQWS3D95HYvPb7PWVOlG0meKch2x/9ofLSM7aTh6608=;
        b=BqwqL7kFFlUocOgzRESW8Bix7DOKk9co6FwznN0guxHdMtxuiHZ163cquWIENI2b8r
         l5uICCfVW2DE1PSc2PLyuAaRcoPgbuCOVtNn3kuXQ+8MC8IEg5GvzoW6KIuluFFfMaU2
         CDojkSbcF0cGPchiNPxFg/3oYq7F0F518pFrWnGcKfd1CWk5U2mgQBZFecUE/APbYlR6
         0Oe5VRp+nn9h2wMg48tc3Flaq0qmYo+b4B3NcHd8KyV+alXQAhHCG8J164awrnMwydDZ
         MoCnGDmyji1zRLxG+A2lqkrJ8KExWJ2HCIrLVdjeKANrtlGE5VS+LckdYzqlG9Hflfnv
         PWWQ==
X-Forwarded-Encrypted: i=1; AL+hErEL/U/XaqL9C4UK9fiN4Lar3QEIwxmIZ1/sTyNDobG5j3SCwysoi5lUZNT8x3L6vEcFPDwE3wuxWv5x5n/F@vger.kernel.org
X-Gm-Message-State: APuU4Z+3ad4uIzgr+4qPtaylgZ2K8B50hQBf5MkQzynKWavq0Jhh59BX
	AfBHAEj6r5hmLTuoiivYUEWSCCJdehVgwdNZvlkZ/oKkCXOg2VnGfznK65RqgrA99h2A1VIHe4U
	TZ+KHVWFU
X-Gm-Gg: AYBFou23WfN5TWY5ccmTpBddC5I6UxTkrk6i+0kzwb1f1/Z0ksYqGBvoTPLobBOmGzg
	JIRZg3njiBzjerUec5YQECTZyAH4enZZ/cG3zJBJT7+GkPZhZ9jQZtPaCDFCBvsogqwJH0eDpxW
	3d/M9hum30ycid2M9otGHnWNjvz9NqZDt6O5m0SF3GI/xsanwvY8ccY62EMo2aZootX56ZyUD6h
	y7B/cd4DsFBvq89Ma6A4hZM3zJK4d1SKv0C/MCb3vSvTb/2lu/+LZe+xDLvYGWS+yU22HUz8nnA
	2Su6dxX0ojAg9xHf7CC7oQmvsJJSjyzA0SOb+aB04Wog49UF+VIfH9r1/SEjTHUYMlyluuqRuLl
	7QuTOwteC+7YkmVJqWiXY8HHF79J3KXsbI7WV9UeFLyp6hAmZVDiKWDjb8+riIBcvTKd+HIEg0u
	MxxLIA3gr1EtLn4T7eKxE99eywo6uvbi6mrI9tn8zRDr+oAOahwCHT9znE7OeUm+9/RdmyO8ZDi
	Il9MlBrSpuShePil3Is+F0itQl6OMtvU5VbdMfFQ1hZ0W5zPo7E8SJ9IUzpvzs8NbcicN5emw8q
	i6tSOi7KY4LT4UHXfzh6zYC3UKTNN2l+OOIQ03sjmZRvT3AXhJ03Gp1SyMPb3UxHtn7wHLo6vWJ
	NLGopsrXSQpZAsQ==
X-Received: by 2002:a17:906:dc90:b0:c2e:8eb7:53e8 with SMTP id a640c23a62f3a-c5096437d55mr318941566b.30.1794601958849;
        Fri, 13 Nov 2026 12:32:38 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b42480sm137539166b.36.2026.11.13.12.32.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:32:38 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so21216225e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:32:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErENP3WdBcev3ZEY1yiqsBXGKRxAXe5U3zXNIzBI8+jlfwPYB5gCDrNgkM3HYUbLSJFeoMRt6fCdbEl4A8Yy@vger.kernel.org
X-Received: by 2002:a05:600c:8b05:b0:4a4:4d57:8462 with SMTP id
 5b1f17b1804b1-4bb55a99ed0mr76502555e9.24.1794601957270; Fri, 13 Nov 2026
 12:32:37 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
 <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
 <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
 <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com> <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
In-Reply-To: <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Nov 2026 12:32:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U1JfzYKJDBjCkNGTAZCG6QAC76WrPCqj7MPJR0rDCAbQ@mail.gmail.com>
X-Gm-Features: AclHuK8SHFgoyjCXNJrs3RjG85XKuoNtkqoClolncw8zp41l0jasiLh2oN-rCLw
Message-ID: <CAD=FV=U1JfzYKJDBjCkNGTAZCG6QAC76WrPCqj7MPJR0rDCAbQ@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

Following up on one piece of my earlier reply:

> The idea is that fdtfactor and the overlay fixes will all land in the
> upstream dtc project. Then as part of this series we will bring both
> in, so we should be all good.

Thinking about this more, we won't actually be able to sync and run
`fdtfactor` itself from `scripts/dtc/`. `fdtfactor` is a Python script
that relies on `pylibfdt` (similar to `scripts/make_fit.py`), and the
upstream kernel maintainers have pushed back against building `pylibfdt`
from the kernel tree's copy of `dtc`. Since `fdtfactor` needs a matching
`pylibfdt` installed on the host anyway, `fdtfactor` will simply remain
an optional external host dependency when `FIT_FACTOR_DTBS=1` is used.

By contrast, `fdtoverlay` is a C host tool already built in
`scripts/dtc/`, so we _will_ still sync the `libfdt` overlay
`/__local_fixups__` updates into `scripts/dtc/libfdt/` once they land
upstream, meaning composite DTBs built by kbuild are still covered.

In v2 I've documented the optional `fdtfactor` external dependency in
`Documentation/process/changes.rst` and
`Documentation/kbuild/kbuild.rst` (as well as in the commit message).

-Doug
