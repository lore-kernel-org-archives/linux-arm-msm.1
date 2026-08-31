Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23B545A2B2
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 18:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200231; cv=none; b=G97RGMs+eyW6X9OcRzL+4QNnClF16Mt04vCNyKCgJdfDp2PSZFHsA5rKWkWAoOMyri0EFiGYyiadnsn8IG3PnjBA/VUU4EDrMF90sz/hus62LmigZWeKmOtlqWNxVtM1ryT2gt0vgjeCbY0LbJtaOBG70uW26QxACRxkoT84EAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200231; c=relaxed/simple;
	bh=uuSQFEl0f5Xgmd+uvHvfUuQ50DstW+2uE4t8uSGFq5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIBPrD5ucN/hb79CQfzcjr+FNl9ASy0ACLyiRuUnosMC4lFdeFcuQjjaUtsyKzUR7xm65SHLX6LM24U1Tw3GZvlO1VqJ+8ZU/g7XDMHH7ZyqOhCtGScVjSPYFDsDhtfMgVu7kVFXY7n0duzgJxpoo0chci306H2M7SsQZ7E9FXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UXcbKoBb; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UXcbKoBb"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c160420289bso499998566b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788200228; x=1788805028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0HEz6oOVo7hlt3+Pf50YPJ4GWCG1Y+vkc7cVq7puJWI=;
        b=UXcbKoBbw+2VQ1zYOdggvTpE5BOWyz30eJfWujRKwjJiMz6RbA5elb4B7Qr+s2PwBV
         yh9mYorXZVsy/9aonie8MMswD2Dum0JxeWKPCzkiJ+/sNzMQIOM916AcSUiAQs8lJ5LC
         oCqohHKTlxdD84fXhs8y7JkFVF4XZXTDPGab4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200228; x=1788805028;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0HEz6oOVo7hlt3+Pf50YPJ4GWCG1Y+vkc7cVq7puJWI=;
        b=KasHiR/08fULQX9KbSjKOBpkRN9E1ZYfePd9/qprsp/5/f6wCOt7pi+sjSaCQ6uyCg
         2ejVbHF5RjEHLVvnkMoxwFrK7K8RftXJ7D6hgU9NJ6ethnrizr54nZGudAOyGlWagOd1
         C8yc2+GDCBbFhwKscu3yFqXsbpvZuMnTndkc7zICPgCY4yBeqvgiZi9ZwKX6Ze8+WO8k
         dB7Uh4/m7/x3WVDLbvRmuTR9HtxHVZrFauR4rrLDjPX7ZY5UL/54+hIpWhHmcYhTENjs
         jvzaoVimLsF4sCZ5mhnytVL1zqqYEd39t7K7H8GVcrVaQ2BEvFfdZtce0nDMq+NFDplZ
         +DSg==
X-Forwarded-Encrypted: i=1; AHgh+RptPkIUGt3vMo5nr57p0xpULvgrQ2DJtSAMYm3EHdwaaIp+me3dDTZ99tmxiFpUTmvKr0EPYE5ClBKs40vq@vger.kernel.org
X-Gm-Message-State: AFuF++l2/751zRgTQOZwHveELPcbq+RDwPRetG4dMZT3Na6y0sjklETV
	HUZVXX88wOynx/1qgIWd5OOxOywX2E0qKyyZA1PvShNTNzxrps9a8+miqKXUubUOQF/pMFWuK9f
	/sY5Oyz5J
X-Gm-Gg: AR+sD12LJ60QY5CzHmCpDg4lOroZmk5TcxGS2XBkuy5gGUJUrN55hGmJE2AyBm1xhMs
	vhEi2CL6iZWPgGTFyI4KSWxV/dYhM9lhRTm5UJzwe3O9FfuA7POpPQK/La8X6JUxbU6WwCJ5GA3
	hw1QiEGhemBs1GLOE1IJSiGM1vyRUjteTRs54zU9lV5E12cXC1GZZXL1CdR9enQlzVIgzbxss2h
	3Ec7LtvWTxuvJzzNVcwCfLcIZGJTmHrR3/DL6bjk2NAUBngUbVvKJtZLZJRSNC/0FKX/wXn8VJQ
	FCuJzifnMfChlj+v/bycyQT9TP/6U5Bff2D59T+EEcjVl+0/fZrXqYg5zJig0ZlHLQH//RSnOdj
	XemNDqlyAnQxNGqV3+A/o9eGWSoRg/SJwKxbUfsVP54YGSwCd5a49FqlfYYBRe/ePRwFHducbZn
	HtTu5UdE59PIMKJZ2k0ThXHNocY+3Fmx01npU4M9+oa90VhLal4KWYeojykrdrlFNlVNkzZIK7A
	goT4QWGkKA8btIZW36GRy11cu4=
X-Received: by 2002:a17:906:4788:b0:c25:8bcb:ea0b with SMTP id a640c23a62f3a-c25b3bb8e6dmr205040966b.4.1788200228007;
        Mon, 31 Aug 2026 11:17:08 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b1443sm467822166b.41.2026.08.31.11.17.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:17:06 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482dbe4d247so1101367f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:17:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxJzUdQt/Ddnud0fJrikjclAiMrFAKkpbCw2ItMzAkSHkOZbgfVv/3TRFe9iByCboM1FVZA7iC0FtCTgM4/@vger.kernel.org
X-Received: by 2002:a5d:43c8:0:b0:484:40e1:8c40 with SMTP id
 ffacd0b85a97d-48440fcda91mr3934528f8f.5.1788200223514; Mon, 31 Aug 2026
 11:17:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-qcom-wdt-nmi-series-v2-0-363979fe6b6b@google.com> <20260828-qcom-wdt-nmi-series-v2-2-363979fe6b6b@google.com>
In-Reply-To: <20260828-qcom-wdt-nmi-series-v2-2-363979fe6b6b@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Aug 2026 11:16:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xgq2aJ1wPFggFBT5x810xZr33GOtyJDvhYf74CmuPUKQ@mail.gmail.com>
X-Gm-Features: AcwNN1VE0AERlOw15wusqCepTJcCXi7KNdMxoGrnxAOTT_pd3WQ9VGal9zL8yXg
Message-ID: <CAD=FV=Xgq2aJ1wPFggFBT5x810xZr33GOtyJDvhYf74CmuPUKQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] genirq: Implement synchronous disable_nmi()
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
> Currently, disable_nmi_nosync() is the only interface to disable an NMI
> line. Drivers stopping their devices in process context need a synchronou=
s
> variant that guarantees any running instance of the NMI handler has
> completed on other CPUs before returning.
>
> Implement disable_nmi() by wrapping disable_irq().
>
> Assisted-by: Antigravity:gemini
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  include/linux/interrupt.h |  1 +
>  kernel/irq/manage.c       | 15 +++++++++++++++
>  2 files changed, 16 insertions(+)

This looks right to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Sashiko had feedback [1] where it was worried about tightly looping
doing HW polling. To me, that doesn't seem like a big deal since there
shouldn't be many NMI users and NMIs shouldn't be freed often. Perhaps
Thomas has different thoughts.

[1] https://lore.kernel.org/all/20260829011853.0B9A41F000E9@smtp.kernel.org=
/
