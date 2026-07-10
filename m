Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B7922D4E9
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783649122; cv=pass; b=EfDW5B+Wqmtb9R1/XVFlwJQh0twmijg15YGeVeBB0OeAl4gAr/wdXnY4ODz8wtOpj8ntlT0XebljOIs+U8KIlyjra7Fnukq4aiSVC8I2az2+qb2rxu7e8QWA8AIm/OjoGR2sfTSy2lh9eiNEbooiFUSDZzqUPypMbnQvr8CODwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783649122; c=relaxed/simple;
	bh=LlRkPbgvZr6HWzD4h0H0tDqeBxXw/GegcXEjF5vDovQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZBaxDaH4SDSUbPDLqjGy4cg+YP5lVFHVOwPRtP0JEIxV01IwvJGF103gJJcbToyWgznHMaNT8fPC1y5NS7W9iCmv583DeAf62wyoaQL5vM9Xm/mZHmuDpJj88xKnHjd8p0o9DXxZSaz+XRCdxXR1jbrkjdazMYc6XVAHUBdeww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGAeF65g; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGAeF65g"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8454160043aso354179b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783649121; cv=none;
        d=google.com; s=arc-20260327;
        b=mwMCJwZMNdQRP9o2aqnbhcOnzjSGWlpYiQS7xrPtQynPjwcXJrw3qXDN4+0SGtY2bL
         zwV4gPZ8RpqAiEAcv7wkq5qFn79Fz6TeuqfoJsVy9W32NNK9OslzuEdBLLzHfHGvBiwT
         BZ1wXkyaQjRt8nkjSQwy+M3pt1aJHMlSMg8aAyTDD5eQPlzVIeORFPsmslkAQEOJlqh1
         YhAsnIfF2t0OPzN2lol3VlQ8S+mainVAnho/y4t19EinGU77fXz5LxsWakWUdMH/fdPe
         vSjFwR8muEDy+dyBaFu/IeXfF9kGSCaJiUa+YBttE7Mm/rJ5kuIGk7iUH1mvbYn++x8L
         MGBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yV/bSXYSLP9qBujU+T7ka+EuaphsnZ2kIz/iz5VjP4s=;
        fh=q2obpUoo33mzVqd7dmeDgbX8aU9NHTkvRPFzMig26W0=;
        b=dcNxwbMnlyolGmbFLU4xNvCz6n+u5BDnRvLmqeSP0ks9lHnHFIOvmkCF/NhWm+vpY1
         /IjssfVIhy3EtKE29RKEYQRQLx6RlqS6EimA/LsnA+Nr14S6BEhmrY0yV6fXSO/mIP+f
         oXPkupNBx8hAq9C5snYilBLKL980+tZKXDcZ/0aTeugGnTHOQK8K7KsuJbfz0xu6SkWp
         mbqSLjCUC8QFg6DPQrBtJJ1OTY6H9/vwJu76dojP5EoPRLqz1wg8UhjGwFdhZoarsvkk
         t70FRLue9xzBTU6OwOYpD8upFrO34cwTIz6mbmDsQbZ/Njh4VESqevIDn4nP79oeK+k5
         WSCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783649121; x=1784253921; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yV/bSXYSLP9qBujU+T7ka+EuaphsnZ2kIz/iz5VjP4s=;
        b=IGAeF65gmBUZWzMVXp/lM9DSZswHgweB3rUlKqU1jeJSSPqjD+lmlvSNuQ26t0TjQv
         FHsbPnncNU4gkVz5rcYbNV5OGFlf4MTgx7gz+IAI+bHMdoofWADzZvUIlFoFQxXaDLfq
         Yf/xs3tm27WXWv4B+EluOxMoT/UaFuKVrkZQbEl8XA4RitKahvYY3xIIh64+HZWCZ24j
         Q1PKDVWvlrkLTZhvfuXYBYXSndoj0DESax9djV2NSKy6yecv5mzZg/TWPSpRdLbjgwrg
         tCjb8aR2JylUBYtsEbGZn4E7ssy+vOQpedgNT4S0MwS9mkR/LHiF/euP/dELm9Q+Aein
         Oohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783649121; x=1784253921;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yV/bSXYSLP9qBujU+T7ka+EuaphsnZ2kIz/iz5VjP4s=;
        b=fOmgDK0nDHI+BdAYSseIU2Ezqqpj+TS0m3i380Lf7BgI6ZhzNo5vNe8Llu8bRcsBR7
         AEYfwWys5w+h21xQpy9UID+mviOxOsjdFZk4wlmdtjNrcqqTubcpan/I1YZe5dDKTxzk
         a/N3u95HI8LC42jTIAH+avoPWGsXiwqqluzpyxEb3xVXS491GMj4ZSmYQo/cECfHMc8D
         pKswoeQsL/eBc1n82CaVH6oxaa5n+c2smgOHhPvGCYC3ZnpSGHbgwEkS+IwQE9ZoSHPW
         8rECspJfWgw3dJQn/Lnrp0BCQmQU7vAs9ynu1RnY0BU3euQIy5grX/EI7PDObJUdZ2mU
         s5Dg==
X-Forwarded-Encrypted: i=1; AHgh+RpcDBf6ldvGMFIOfc04u4/x7SXWvfQrI/1yO6vVwyVnXnIb3ekYH1G6MxW2bP+LfHZNr6QVu3ZIMdwtwrlE@vger.kernel.org
X-Gm-Message-State: AOJu0YzVnaKk++Z8G+qGoHRDoe0A5Q7Z/VqZRZ8Z9ZzDgzkbk4Mengpx
	TY5+en/8G+uOJwQVyZMzNgm5zOcEzHvysWLZxP6MfF8slZpWDKku2eMZhx+MbM/0pi7JwNjs3c/
	kbcXieMKyCHSH7APwfoC7WF2CE4B3RT8=
X-Gm-Gg: AfdE7cnCqBJ5RJfLr//Z2tNy7UGVhso+4rDfPuTpMxwXb4BvRwtZdyu26k1CRV/n8Uy
	p/CwHS2wR3DP6y5t23iAg7biW3Ne1EKot0b/iClY8R+7qfFH/YneA+cYNkRpUhk3rLSWYJrxuFC
	25anW845sCa/cAMjAWDQ6YedpG28L+4lQPGxqMVuYHHc1/CpXxvaSInaT0fS6e+48vG/vQYWRKR
	6a/hqtxIPpjOdCsGHvm401Z09eOyOX8v9ozN1DzB57EJVK71cVTEWqaLI0izPLbu5XrlUNkhiwu
	wq4PB0gGbR1MIYzbP1GfRsw/rDdaM6J+vneLVA==
X-Received: by 2002:a05:6a00:858d:b0:848:47d3:47ec with SMTP id
 d2e1a72fcca58-84847d34a8emr7759091b3a.31.1783649120744; Thu, 09 Jul 2026
 19:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com> <c74c52c5-91b3-4764-a7a1-26fc940bf735@sirena.org.uk>
In-Reply-To: <c74c52c5-91b3-4764-a7a1-26fc940bf735@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 10 Jul 2026 09:05:09 +0700
X-Gm-Features: AVVi8CdIYYnh9UcwsbAJsmq3JOOUQJGgVvrgAYTobV4qxqGEgOj9QMvwPYMMhSU
Message-ID: <CAABR9nFMAujx-Besf2s=+ok=sctBYfz3s94s8aE8Q_yCSd_sbQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/27] ASoC: codecs: Use guard() for mutex & spin locks
 - part 2
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Sorry for the confusion.

> On Thu, Jul 09, 2026 at 11:58:35AM +0700, phucduc.bui@gmail.com wrote:
>
> > bui duc phuc (27):
> >   ASoC: codecs: da7213: Use guard() for mutex locks
> >   ASoC: codecs: da7219: Use guard() for mutex locks
>
> Only the first two of these seem to have come through which has rather
> confused things?

I've hit my email sending limit. I will send the remaining 25 parts
after 24 hours
to ensure they all go through.

Best regards,
Phuc
