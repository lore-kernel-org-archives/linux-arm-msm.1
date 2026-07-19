Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0162438D415
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 10:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784455954; cv=pass; b=Wp/aIE1WpGh/GaWwcYk8ENCK8fFgKqBiXfx0BQESu+mnmOjTZVkIik9Ddop3U7ZYULd2om9tL/VL2DdUoUkNQI++8BouT117nbTGdnGXx38ftTEMbD1O0TVIWyM+binrA+JL64g485J4C/qemFypLAQMOB7T/rx8Uypg7/vgHxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784455954; c=relaxed/simple;
	bh=+SWRgwJpI5208jPonUHKde/p1vpdQPTExC1afsSyq6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BtyLKFNrwSI5aBPfCTKGyGuqk0oVTz6y0MRZSvR/PwZ0fgQ9zXgVRQ1v9NlMkfxQRHEsYo/soGRHVTebxpgTzrtj72LzxEd74libcVXRueHt7pbLMdER2sYImIwnpLdfXQKwGQVo/y8hHRP6eeC5wI08Noo0F5bQ2nFilbgwdNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LU/dJn7I; arc=pass smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LU/dJn7I"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso3469514e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 03:12:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784455948; cv=none;
        d=google.com; s=arc-20260327;
        b=F/WtMJDedRfDXLdy2bJgW1d5P/njyK3Y0sc0N1S1JEXCo6gVyw9uHb77Ibvb1iGzQS
         1zKkSrTyBYhbLn1+0VpY1R3GlJyVAkHz8/ZIPY8hIFxAS5GGfdSiIq6lpHiO6UputfYI
         xxQ7pxaGoYSKn4GericrjCynfDlipqlo5pm946iyC/2dC36p3MgZJczUCzud33MNDzaU
         /ylM82wwle739CUM8xOiv8cO9okk/JwbxC6oJktjPniKFAMpKTvAZAxxvCKPra1cBUVB
         pz/F1sBJDA6n3Kza+b2pVirjYSniHlqSmNvstc8WhWQS85U2PdAJ6Dhm0J5dfSvRcjRc
         Uuig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+SWRgwJpI5208jPonUHKde/p1vpdQPTExC1afsSyq6g=;
        fh=IXFu4R8yOg2XzcXL47u9iUjVikrSolXXrlDts/HTbfg=;
        b=R0Wx/DGsNQZmKZkwoC5ivWV8yLk5EYMg3DR9tpJRHtyi3bVQgf4/10ZGUnZUeNC6Jw
         WkCKr79dua8ynxgU1v1mv97tr8uQ+ipdkrWcSsoUcjdfbL1fILTdtPDstSfBaN4HGthR
         05VKaZ6dWFPwI39jgB/PN3NXbwlhSyvX/VKdTsPcWD1m62KdheEfG8tBUN4J1chrtXdB
         CAhB048EQq2OuFcbGxjij2rO5Irb2NYAcF/p/pWndkVDiRWmxHS7vDUSYQQp0xi/1ZUs
         Bxu27HneLwVwIw5wDNBzZjC6SFTdnCZizPSSgi6WqC4ebamVkin0Lok1nN0hxgSjMshr
         7edQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784455948; x=1785060748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+SWRgwJpI5208jPonUHKde/p1vpdQPTExC1afsSyq6g=;
        b=LU/dJn7IdLOP543F/L5LQJ5HIPwPSv3Z1vdFD3MElAxTb7OgxqJzSJ4WtfQoAwiNxE
         +lg9+HJFxNXoL6EDc8uZyLVa6DiL9ExXkrtr3ec1VNQX/0l3YniQHSQF/RdzwdKDK87P
         3UyyFbR/aUif4Rnmms3VVQMMGJaFEZnj33Qy23LY8QorPj7A6adurLaiQIgqJR63zafX
         1Uirf16AU2iF76/iZcJqph+tZsvLSp5vYB+AGjFU9HkcA4stlcJh2Yax/gR1FfsWxcww
         9oggxmzZjsWdBSUCUz0fBkGSQ6do+mby7KPDJ4ksbRF5q9eCjYSUfObelTnEGIhLVkAW
         A/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784455948; x=1785060748;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+SWRgwJpI5208jPonUHKde/p1vpdQPTExC1afsSyq6g=;
        b=Y0dyqe6jqS+0vd4Ih+ESS3b6Zm7xXvAr5l6HfiitAro+rRHwc63kviu6PNhPouA/r2
         XqH+55SU5y38SrzWtmGZbsWRpWy0MJtM7PQtA0uM4QJrDjdKw46yWxnqQl5Vldtmfqxf
         AJo+CayO22ScmmGnp68fM8GPjAXnwljTotwmuv1/Wk8gtUk6AqYVGK7tUgxHno0KJu1y
         iPhfyW1r2mi/dIsj02ppiZ+06o0xUx4UINkv+ADbWsgVMUrY4gK9R63EaY2JDnK3JQi/
         pG7ptG+7FAssib1oDDq8k2d2Z9ubc99acQGmcCZfFmxRuLpZrdyLH95jZe6QHgVr+a2i
         K36Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq9mIb60WeN8E8H1yRUbUGAPX9jWgWDBmLKBzduoqVx04/E9EQS4R+uqDeKN56PupwAS4yM7RJczMgjlPd6@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh1titaKPM+foIHNlTlYKbmIPbkiiGXmlpk+cpAzc1wJIUldOd
	cNaIB3Esvz3/m0JGqXVsb/3x94xuPU2PvHhWH5Vx8dU6nJQJVxiFZSC2WY8QWjLsyAYQ1in8Pfi
	XssF5E4SFIs+oTKnLN3EbziMnnZwSyTc=
X-Gm-Gg: AfdE7cmfZq4FfW77sdS4KDolGw8ihcnIZpb99vQX9FH+t8Tmg6uYsFEBK6Afw+2CQoi
	cteCqfVq+IxXuTj2h0FKhvmMyWjipznWDyNq10r6e1HYKTexUmbbiNuPdYlFxtfDcTb1IMcSua4
	c4RjOYgK4Na7LhsgAa0/UeZKpbQZ98ek+atxeOMPII35a96jMmCicAr3b1/p/mzlhFr9ywedis6
	3+6I5EqlJ8UytEjgIjm5RGbn5Bb16WXfYnR555PEujCgWYAyYBiCbC6+w2hn8Ett/F4ffUBEEf9
	EcmaWi+yo0km+tOjWw==
X-Received: by 2002:a05:6102:3751:b0:73f:7bca:217d with SMTP id
 ada2fe7eead31-747536f091bmr2060442137.20.1784455948074; Sun, 19 Jul 2026
 03:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616122605.668908-1-mitltlatltl@gmail.com> <77953dc6-a7a9-4d74-be14-0424d019b8fb@sirena.org.uk>
In-Reply-To: <77953dc6-a7a9-4d74-be14-0424d019b8fb@sirena.org.uk>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sun, 19 Jul 2026 18:10:50 +0800
X-Gm-Features: AUfX_myK2M84Hx7_NX8fCV8CD5e4weA3q6bfbwaUlyBWXK9agR3ne4npIEk94H8
Message-ID: <CAH2e8h6wrK0ZbXJqJ6Lix9FNgtE98tGKPxmOnqd0Kn7hpzrJFA@mail.gmail.com>
Subject: Re: [PATCH v2] spi: qcom-geni: Use GSI mode if DMA channels are available
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 8:27=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Jun 16, 2026 at 08:26:05PM +0800, Pengyu Luo wrote:
> > Some devices (such as gaokun3) do not disable FIFO mode, causing the
> > driver to fallback to FIFO mode by default. However, these platforms
> > also support GSI mode, which is highly preferred for certain
> > peripherals like SPI touchscreens to improve performance.
>
> This needs a rebase against my current branch.

Please ignore this patch. After discussion[1], let us keep using the
fifo_disabled variable to determine the mode.

[1]: https://lore.kernel.org/linux-arm-msm/94956a19-153f-4bce-a824-7608bbff=
c98a@oss.qualcomm.com

Best wishes,
Pengyu
