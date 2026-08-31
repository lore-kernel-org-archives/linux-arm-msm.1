Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C3D46EC7C
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 18:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200250; cv=none; b=WbomEvPh3Iq6cYCmqXgj8ae+645RKs5rGpiHzCYvnY27p0onYSZPjAFMTkFemY4Hu+w8X6jLB6PoqNMR7GAdV4pHm5GVgRQg2G7dJwYlFfT+z0AZw23zdDnHLtZP55mZhFOEyuFg96vPnB/Euu7LUT9U8WNMFUJkk6DwSTQMm3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200250; c=relaxed/simple;
	bh=D0gY1RFo3fP5F2alggX1eKdz74k3uW88LC29EILOh/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V3oUnNz59e1jo1V74cxK68ogXLzMkl9fVkOGbhRsznKr90e8e1jljjUR5AL3GdUyR8LzAAxQXhQ9lFJa7fNIlsTsGMSm+PbojoTlIxBmLtS/UB9HmUDDJ8YqdqkbQV0njcq0htKHGk2EfQhg7dEIbCf4uaYP+JXS69aqNy8DnfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EaDoorwH; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EaDoorwH"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2529b3139fso491221666b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788200247; x=1788805047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YA45RBK4xNm5is/1vr4qQL3XM1GA4yJrufiy7l4ApY0=;
        b=EaDoorwH+gRzG1hKcDdi/jWv5A+g/q5Z7vq4rVzTyrx7H6zSX1Hg36qQo+PLF8zM/K
         2kfzbiXSOiNZLxq7L7Qv7DphoJEV1Kv6w2lX0FGnIDG+fw+SlDg0shUkiED/dszd/opX
         6S5Z57HlLkFuWJnVsgRvMNuh0gsmE0xpS+G1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200247; x=1788805047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YA45RBK4xNm5is/1vr4qQL3XM1GA4yJrufiy7l4ApY0=;
        b=jVBQC3uwLj8plZf5fUBwpeTkdkkObJFKifX18bskF62mifwr3Lh8/wWA8+x4e0axbn
         vHfRAtCmMZzjIt9La2Dz29MFQdtd/xMdsjTXLD92tY9SU1ERAvaPOXHslJ/pf03H/wgP
         +AjFKv8Ad1qQN49Q0CuPVGHzONFQ0lGP3JJIT9KS2GufneOnuPmQoIqc7MMTbAABbZCC
         C9kVUXq1/wqnK3FGQx5rGq15dOlBeChAeWTRNx0SEPen137Opv18dikSRwEmRe20StRy
         MPcLC7vASxYKdAGImKdhdQOTJieWblqK2nahXnaiQhqHwUzIaCp0QF2FlWb10+ynOTuw
         j1VA==
X-Forwarded-Encrypted: i=1; AHgh+Rr5wCaWMdp7XnJh10T2SJvJ/dCEz8fu/ZlY7BuxoJciFVCVgTGzcmDA8p151OO4hp0Xo5qZJJRrxeTYNT0X@vger.kernel.org
X-Gm-Message-State: AFuF++ncW08yy3cpMsVdHKEYowFvNdTgV9i2tK7fgmGBqa93ExTk3nYG
	tenNs+JvGm8mfEq1UDI8yoE57Es0RvkqzPuvZRKmF+xlXvi9FM5reakAh51eAC4afVgpjeGqDIB
	Yc/wgJYso
X-Gm-Gg: AR+sD13lgizRRyxjB5LBx34gJ92jLdNzl760LErMGSbtcbMq0E1YqfPPWrXM0iu8rjH
	KfeMUOvSurXcTtCCEf+LBBK8609+TYiwU47P0JfxfXjSmGtjzJcOIR7En1sLzp30tXMla9hN9+K
	kvmFJOLxTfvlE3VypcKEGS0W6WnaSNb9TP9FxxB9FyZmWCjuRMLnRFKhnb6YVMwncZ0+ko06k9j
	w9Ue/SynA52jpP+uWn9taNPrBUN/f4gbA4Q7HYycaqcpPPVw3Q+qbXdmgujipsEPQBVHhnZCY/m
	64qr6H2NQfM9BAEdXMXOlt+3oQ3Mc3qPZt/+HoFpKvsQz/CPAIqJc7JP0OuMPFqbRStSfQFdC/6
	KozlXpkSbWd8xJtd00HVHDDdZQFlX8vcacTmTOXXSNsMRQ9oH8eUzx2eoII2VYWXyftgEAUyIH/
	Acgv1Sd9omnf3gZzjT15us99V1bw0Z8obmj3j3mmf2pLA9uVRRdCZo0kYgOonpAxAaEZuXydcFR
	v292pgW42r0E4gizsZVjk8faHpZ
X-Received: by 2002:a17:907:1ca4:b0:c21:9870:c4f7 with SMTP id a640c23a62f3a-c2557433257mr1728938466b.20.1788200247242;
        Mon, 31 Aug 2026 11:17:27 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1fb965sm493481866b.49.2026.08.31.11.17.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:17:26 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482fc2b44a7so31152f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:17:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByohNdsdx86EstzbK9HcSiWq3OAYi4ErvNrCP2wxVaX/gpgLcIMxUQW9nr9ZZRRPXT7FZlVsMXK7nz1Y3nD@vger.kernel.org
X-Received: by 2002:a05:6000:480a:b0:484:3311:af37 with SMTP id
 ffacd0b85a97d-4843311b2camr31399850f8f.26.1788200243898; Mon, 31 Aug 2026
 11:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-qcom-wdt-nmi-series-v2-0-363979fe6b6b@google.com> <20260828-qcom-wdt-nmi-series-v2-4-363979fe6b6b@google.com>
In-Reply-To: <20260828-qcom-wdt-nmi-series-v2-4-363979fe6b6b@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Aug 2026 11:17:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V+vbapkDzby6f7BbjSuSHc9RFUVejCf9dO6xmzuPE1Lw@mail.gmail.com>
X-Gm-Features: AcwNN1Uum9nPWl9j-6K-ngg8lklWL2dpaMcNuBtk2t_f-Opra6jTlnvJ6qWwoik
Message-ID: <CAD=FV=V+vbapkDzby6f7BbjSuSHc9RFUVejCf9dO6xmzuPE1Lw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] watchdog: pretimeout: Protect governor access with
 RCU for NMI safety
To: Mayank Rungta <mrungta@google.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 28, 2026 at 6:00=E2=80=AFPM Mayank Rungta <mrungta@google.com> =
wrote:
>
> When watchdog pretimeout interrupts are configured as NMIs (or
> pseudo-NMIs), pretimeout handlers execute in NMI context. Accessing
> the watchdog governor via spinlocks in watchdog_notify_pretimeout() is
> unsafe in NMI context and can cause deadlocks if an NMI arrives while a
> spinlock is held.
>
> Protect governor assignment and dereference with RCU instead of
> spinlocks, allowing lockless, NMI-safe governor notifications while
> preserving safe runtime governor switching.
>
> Assisted-by: Antigravity:gemini
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  drivers/watchdog/watchdog_pretimeout.c | 45 +++++++++++++++++++---------=
------
>  include/linux/watchdog.h               |  2 +-
>  2 files changed, 26 insertions(+), 21 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
