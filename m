Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418A443B3F6
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785312132; cv=pass; b=o13L+7IpGjI2wBNPET5s5F0SwRI4u8C1vXOhNC54Wsj7mTWiGtVKomyoUr/OWISOO0aSF/AilPGzHBL82Cjc8cz5r2iDXePBM4nyY+IollDaVzmZLM3jRu9klfhM7orsIW/D42Ha4oRo7pslh9I7T7MgaA5ynUiW8e0F9ZWkk+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785312132; c=relaxed/simple;
	bh=tQIx/beIhZjfhEwMkT/O4vuIekscTTh9vo5S2QcC4B4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ueGpM4JGgYRjoGGZYfhpSBY3rnt45vwrzzZAq3P2k7+KEt5p5Lj1L2pK4kDR/UNXTVqnS+M1Y3DZ1l5xN2n+6WAA59qiSmp4CAtv8dgeWqtfjrCKmE95Jbhz8N448ZnHaPP11FoOgvSDo7cHYNhfyuKjS0XG15LPUKxMAWkQQVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EGYNjW9k; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGYNjW9k"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66899c7b57bso820627d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 01:02:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785312127; cv=none;
        d=google.com; s=arc-20260327;
        b=iQqq2MXGtk6Y/wtAjl9xyLAlWhgp19iUX0srLdDbILUXYEENBGvFnlDamWhRxapnK5
         uKG8xDedFMzvoGKBWhvBB+Ud6HUu6gc1b+ZueQVPaQGKzxgZjMQS2qnzIlsxzBvW1h1P
         HN2ZeLLuNLnaq0PH94RZq5t9PgbGzkSTuaVCptT/QbUpZzlCtmEz++bOj4+nalJC0uPb
         5wAb3+Xv/QVcSoHQ0M8/JLDauKhDRdsjjalS9gFnWzel4OICB9xLdF79vroSB9nLPKWR
         EiMpFMQpgq0eORuOh6B6Bn2oPh16gVekjsn1bn73rN630AA+K3AoCxvN+IKz6xaUmtV0
         NUEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nWTQqQwG3YVHAteC50PeEEuDDKjaYcAXX2qekTmA0yI=;
        fh=0eSCG1jhl8AV6s7o8JNEtcXZfvIbziztF7RChsPC6ig=;
        b=c9gp7B6oX3EQIZdBFqymBmzMLEEbWqYGO8HKJo0PXw+jhVdwEBIe4vzAPpRplUnvoR
         9ws4qcDk9FvB0dUTkiwBvKMqJ1Hf57QwJ19gI3XCCGzImmJjjIKVhgrhKQKxUgT/DqUK
         qrXowt3YW4h8SwrTkb+hfgyGP+hXJLkVlxsccn4IrF8A7iyfjHYz3E34cYj8Z4srjMCB
         NQ1yKgVVkiGNb3MzcpqeXX+S/CEYNcCU5/Mcau2NCN/9B3IvnlrKKww5OicBpJ5896AE
         ZjevvPa8/TZIIl8tFlqBNxKNlxtbXkISy8bY64Yc4oKsQQi5/IG/+wEarNv18COYh4Bb
         ItVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785312127; x=1785916927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nWTQqQwG3YVHAteC50PeEEuDDKjaYcAXX2qekTmA0yI=;
        b=EGYNjW9k5+Hk04XxsCNaajg0AJEQgXgoPfTfNlcKRRc+zomYHbG3PFLeD92v0w++wZ
         /fJhJk3eUWd76IVb/jVDWf2DTrCjfGBZy5fReSrBl4DOUO5A5rvP/cZ0BRXJUWZisUCH
         zUnCUB6oFWwWNUHHo62KbKgTtsLNhQ+lFHF/GRE7h7SFAnDGMPQr3KB3MCaXMjapa5qT
         BqlYPdkh2Sssh+DWzYPjSnPRQH8e5fhN8UOFonPbAuSoxzflIx8DhgjP9HUfUMYlpizM
         zUdt2gnyCggOORwjxQVlVXhwed/Uy1JTbUvHn9+crzyLHEm9FAZCdLV1hjJmIaX+2QS+
         U+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312127; x=1785916927;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWTQqQwG3YVHAteC50PeEEuDDKjaYcAXX2qekTmA0yI=;
        b=tYawNIRd8lw327NfbM1nFZU06X+/38kc7qY0zF7YmRTRMKoo9wwqQaHv37AqQnq4WZ
         rj3rsw2Jlf9qge2ZPlllsnz04vs7gTiuuL2z1KuSabrB2oNdR61iFJa06oTr8mwhB1y4
         d2YaEu3an34IZN8ImjPKTuVEhkPl7JeuJK4/0tMwbcHz4s7XUq1T9FVfTuId3kd2GUMJ
         vm1OuA0Oi2frSyZYkuX1TmLM+ShYE+HXxzrUt5siDkjQrLSr7cezUz5Ml+7spXTlhqgT
         pbY0AiZzbMnQC3uDYiF42ppXZMi/HzHAqjCWdpOIKPVVK1Q/mvL2khsTWUIjQPCuAOXp
         lt9Q==
X-Forwarded-Encrypted: i=1; AHgh+RqvoKZQZbZdVpYMU6VFZY4NaBlo7DA30djY98rloqFMMXRvXSLKuGkUF37m6PGOKKZMzIn2sSCQgxGGL4qj@vger.kernel.org
X-Gm-Message-State: AOJu0YxLmA9Em464se/HF1UlgtlmICmdwZb6uuWA4QLymRWL1YWoEh5c
	9ug18t4KgtUdOCC6UK79AWYrygeFw+tQq44UJKWv251rLWaHuZjL6m1jjxs13RxDC44ukb7kR/q
	AKjV1s8VBrENteW7HudHpZ9w+3cPogyrjWyiecgz9eA==
X-Gm-Gg: AR+sD13MaZFswrwv148oS025jcXKvglAISlp/nyVuy2C+HjEpCjF1m2c9RzREZ/M5GL
	xKI0q4if7hCW535+QblgS73f3pd1eXEoCn411QnGcHUXJVZ/x9JcCBmBzKUsHMZ1H4IWYVSA+zq
	uTaQRsSu5Aze38p6AFZDCnzos0xQKE7YcLr0M0of/dndLDc9LgJiHk9SAAFNJoE6Qk8YQt5bQxK
	SsRSed9540DZJ/IbB7RF3V85H6fWoItpm0quHxgIWepx5OsQJhhzl8jfytfdOJ3n2fBDq09PpXr
	9j2hlevVcOx+yHf5MI7/y1KWWvajDRopaOhxLVNWSWP9NvoR
X-Received: by 2002:a05:690e:4507:10b0:668:9a53:c392 with SMTP id
 956f58d0204a3-66905822945mr1566093d50.75.1785312126656; Wed, 29 Jul 2026
 01:02:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-1-c042266b9eeb@linaro.org> <20260727-stirring-miraculous-nautilus-e22bda@quoll>
In-Reply-To: <20260727-stirring-miraculous-nautilus-e22bda@quoll>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 29 Jul 2026 16:01:55 +0800
X-Gm-Features: AUfX_mwa3Ibvs_xhtU9_glYoRrnOJI9mbG-XhW0xN7OZQOuaCyqfso8Gz7qCh3g
Message-ID: <CABymUCNm8_KNgh+6wKH_PO0Y=N6kxfMxOrWsq=wZZQY9vX2kkA@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: display: panel: Modify reset gpio
 number constrain
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B47=E6=9C=8828=E6=
=97=A5=E5=91=A8=E4=BA=8C 04:23=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jul 27, 2026 at 04:08:40PM +0800, Jun Nie wrote:
> > Some panel support 2 reset gpio, such as Synaptics R63455. So modify th=
e
>
> There is no such binding for R63455.
>
> > number constrain of gpio to 1 to avoid check failure.
>
> What check failure? Please paste actual warnings (but not fake ones).
>
It is a review warning from sashiko.
- [Low] The `reset-gpios` property's `maxItems: 2` constraint
conflicts with the strictly enforced `maxItems: 1` inherited from
`panel-common.yaml`.

> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/display/panel/panel-common.yaml | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-comm=
on.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > index 087415753d606..7c450d2799808 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > @@ -119,7 +119,7 @@ properties:
> >        confused with a backlight enable signal.
> >
> >    reset-gpios:
> > -    maxItems: 1
> > +    minItems: 1
>
> I do not get why all bindings now get completely flexible number of
> resets. I am pretty sure not all of them constrain that. It's rather
> your task to check it and explain in commit msg.
>
> For example the second random I took to check (ILI7807S) does not
> restrict, so you just made that binding accepting 1000 reset lines. Why?

I just want to extend the maxItems from 1 to 2 for my case. Do you have
any suggestion? Thanks!

Regards,
Jun

>
> Best regards,
> Krzysztof
>
