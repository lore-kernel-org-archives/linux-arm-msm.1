Received: from mail-yx2-f8.google.com (mail-yx2-f8.google.com [74.125.224.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8659F450407
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984012; cv=pass; b=acqVA9I3Pnxl9D6CI5O9hMrqh3KqY2h3gPK6AnepySzM67E4l7wyZi0b7rLqgaWqBHQMvjujG/1L8jpjaLzfEf20Azo4kZem1g0D2CTm/OoATvngxD6UgQ9406MBkmLqj9YCcON98agP2TuUOkLY2QQfEV1PD0YXjAcE7601JQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984012; c=relaxed/simple;
	bh=f+/Cm9YPfNPvvyTL/kLTG5mweG3JOW7IGzYX0bdp7V8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ajmHUf5tcqC7hX83YwwpiyR5ajylvH325ODdeaLHoFxEJUmwAtJQeCpWxUvbcjGp+SlRkSMqG6yow5a1aKt6zqwV+N3XdLpJK2yAGvOWD+5uJBVzFEf/QuXHqNfsQs1URkYFd8B4PkYCSEtAX2+UUp+Dkto6sy02VBTfJwi2CkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ha3tZRKo; arc=pass smtp.client-ip=74.125.224.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ha3tZRKo"
Received: by mail-yx2-f8.google.com with SMTP id 00721157ae682-8949fcc5ea0so4722697b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 02:46:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789984010; cv=none;
        d=google.com; s=arc-20260327;
        b=Zi8kpbXaEem+mbxGrh9PYohaALvBBtMfsxUv0F0Gm9uvktz7Pli7tn/Vcbb/a4XzV5
         aAVqOGDbU4az9N4gotnczm6/SvDN6FX4r9R2JA095ewtByEFnXGFaWytRFMUcTxGjt2N
         YGlMmoSr50STPGAfYkeUkoXtVyuwlq5y8gML+KP2Tct5MjC3zWGDmDkmwB9JslMF5DYe
         NeIl3s1ZrI04PkBtrF+eUQuWpmA2lSq7fa2jSa0ABWneoxBAR/QDoZcGZiyh7XD5kLMp
         oc15NcfbjpGEWx6gIpNQgUBeUt1E9bZCqw0dQ0jUwNi7FVIyRbRMdRYl0BeFiAMVhiKr
         Nj4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f+/Cm9YPfNPvvyTL/kLTG5mweG3JOW7IGzYX0bdp7V8=;
        fh=iHfbpyU/WLgSIFLI+8KEClLRZwV1XLEFTQS9khjyD9s=;
        b=nt1JKEEFm8jSiXphnjXD6CRJ6BrOPeaIkoMG7PgRZFaqA0KwnH2fwl8YPjBOoe0Y+x
         /C/4icwvXaYZHhtr21pa/T4lBEBx8kDoxAH2OUnDpVFuTMs/qTVbxxVakxjx2nfwRH2Q
         gWU15NLUeoLBuytwIS5z0yN4jlhMggWdElN3/KKzIsjvlKA0MwBjmB/g6p7n/yr4Hqtg
         k1W6ak+Ga5z+rUqbNETdCH4SItcEZ8aNZjCfoB1Vy9nDhJuJajP6j4iwJC45HH2ZFI1Q
         3GVBqM38OQ2DJCAaFq3e21GHAcLrHwzXfV6pCd06IJgyfKpbRUOlk/V98ZwEZmaDFAjW
         4q9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789984010; x=1790588810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+/Cm9YPfNPvvyTL/kLTG5mweG3JOW7IGzYX0bdp7V8=;
        b=ha3tZRKoxsQuUPyIefLtSnxddM8Vn7ccv48KC3UVcVaUXtRBxa+mGXgiCTQipp8nEi
         Bki0CdZr0O+ygsgPk9H64zjptvGPNo8CZhXOVqKCkt7eujN9lvzE9Imr6jkNJCbikvU7
         450UTJYFFbHrt0T+VluNzKdbu0JU4YRpvuOUHseK3zPqSROvZ/Hqhpk5BwnIVwWFaCE3
         UnGuPZNHAzQjmosepqeRvHkPnOHmGerAZmtcqK8I8aN4DGwsPuLHhdnpHmLx74YA4UAp
         MAlY+uesT6AveQMyebdVpWgDpnPOzVmgI3d8tXXTdzKo3CTHDqw6UlfdigrlC01AEpqL
         QN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984010; x=1790588810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+/Cm9YPfNPvvyTL/kLTG5mweG3JOW7IGzYX0bdp7V8=;
        b=bcpPWntz2O8OOKUoHfpxoVttU4TlM0TDbr7vzLp92aXrbmzuX3+5CNV/VBSGgLbwoj
         o+OF4PDuYdBPyNkxPC6P0CEGhIvVZezSs19ISGda7eAS+kyExjgPvn7GifU5v3QylaKK
         nKJbnP+fZMB9C7ijXeM/OdtKs2juNBv32Du1PDSzdDHx1tPHOVYRgnSZHwOGPnEpUeLY
         sZK2xA2wxZzZFb75Lny3Pp1nEDEgq4mGy4sWUzX3iKgxGO3sWFFKFHOYKQvq6UlaRuX3
         +qa9TiThuTgjhbogftzkD8SJyWrcspuTZ2gQVpMzswaj6wYgXX0RCfTDC5Va+mD02PWg
         rMzQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8bV0PJmLbqIfUy2dqHwtbRVsX35/g7kAWMtjITwU8a2LtC1JSGEHpbvfKImEvLsC4Du965yocxQ2jIbmG@vger.kernel.org
X-Gm-Message-State: AFuF++nTlQkHVuOiW7uOVRIAnVIWOZR56KCZDJPpRLHPQo58IEM1ESK8
	BSmBRpYlwi9xdpy/Z9PQaWmqxKHup1rkuCZmcv7Rj66icf+5HymMgBv7dloTvuo5Z3BtvtTrVG9
	a4htAs8D30IxJorJuBHsGClz6AxaHSc0=
X-Gm-Gg: AYBFou1eG0gGghmnoZgihc77sKZAdNjaCEP/iEkA1QqnRGRxqVHqg0RcFfP1neg8Lv9
	zQXUd6dKd8ClBUInQOQ67L/9DSKXSXVKhEfhNvAvbFdO5eFHWzJlXcUeJUoHA12w/LNOrLG9eux
	HQTquYtoUpBLIIKCzHjAUcl2REo5rx8vl3w2OVHpoTp1Pd36Yd6QrkUuPcqG7yvs4cDH8AMUcD/
	WBmAqPb7yZ3CCg/K6j36JTIcMg2/beL0uhpZ2rMRSERHE7YTlsjijRZqhRpKDI/3RueCPBDiJyd
	3R0zEEyQI67RZP0N/lTIJGI/2I/o6eZEq4r5VicBBtnxtVXk6x3Q/UdB
X-Received: by 2002:a05:690c:e649:10b0:89a:63da:fab4 with SMTP id
 00721157ae682-89a63db0408mr12439377b3.111.1789984010444; Mon, 21 Sep 2026
 02:46:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920145848.44521-1-me@lizi.moe> <20260920193830.53706-1-me@lizi.moe>
 <arDqcJ5AbDjGHd-b@sirena.co.uk>
In-Reply-To: <arDqcJ5AbDjGHd-b@sirena.co.uk>
From: Li Tadokoro <kokonata233@gmail.com>
Date: Mon, 21 Sep 2026 17:46:39 +0800
X-Gm-Features: AcwNN1Ud_FIYDoPOA9vd1A9iNgMPZfhlScfzx8a-KRd0K4u1ZBcEhynMGifCZ8w
Message-ID: <CAGFxjK+1YVvFiZS7Geaxe=TMO_bvuYsYtsOjgpQ2MV876KNvwQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: qcom: lpass-cpu: use DAI table index for
 playback constraints
To: Mark Brown <broonie@kernel.org>
Cc: srini@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry about that. I'll send future revisions as new threads.

Li

Mark Brown <broonie@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8821=E6=97=A5=
=E5=91=A8=E4=B8=80 16:27=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Sep 21, 2026 at 03:38:30AM +0800, Zimeng Li wrote:
> > The DAI ID is a hardware port ID and is not necessarily the index of
> > the corresponding entry in variant->dai_driver.
>
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.
