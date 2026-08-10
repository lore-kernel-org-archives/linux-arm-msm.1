Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241603B14AB
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786355120; cv=pass; b=MhaSY9uDpio0L41+8PxqQNQy5Az6dnmJyaXhgg3RjY7BeAtNH9pkstRw/xIEj/so2hCKqUihUJl4nseEZzog180SbAzrqdmXyEaryfuaG+Z42PfTRED090YXbshG4LKjBiVpPXtMfp8DuDpI6Yf1+H/fmmzlSzAf3hEsViuFIY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786355120; c=relaxed/simple;
	bh=jzMCy/aLy3IlJ2KgJIlg13IO3drPxZSWHo1bEnnokMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPw9lj5aFi/wFamzmcKPQUSKQEkl/+Eseg+Wj6zOQYe28PRROQCQTKWfYZYIoFNXhUkyk7B2aax6ZB7aUfnnnmlmXVUxu9Xkw7CSjl6k6LX1a1S0UvkBtON/fUrZJdmu7nreZq1rznMG1VR5uxfe/Nm1vvfhHmJsqoM/1Pvm11Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rn4XbKP9; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rn4XbKP9"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e347638adso1765883a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 02:45:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786355118; cv=none;
        d=google.com; s=arc-20260327;
        b=IZxHsMbkscxpSeMI8XXdgQKuy2wDGfKuhX5cX5DZiltyjUeHan/7qAcVrPbIuTBWGf
         wRU076hCECFzSP+Ju9eg8aScpJ5Ms4sj1F1KyJ7RdvJI9joSKM7n6Lpl7xFDgMip9b3B
         gO4fOyfzN7E/0PTY3modZfjtvzPtwnDJ0L4EUlmLlqVHFZFkiYsiLF0XLY5tjuZhJFcm
         GFbbnHEMXZrirHjIL27AfT6wCsQ3YuLUWrweuYkKwy7sJ2qpieEJKXYn7H8y/71tPh8T
         QltKswpoeHkCmtZJEpkNjjt6q3VripND0o8BqTT56sFkQGqCyoM4EFUDV/6ce8chsArv
         kNsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lEhjsMWG90vKMNIv0q/NvqRJMIZC5Z2HAc5jYXUw3Vo=;
        fh=UdeiMeSzCi8TKWNgybyXjWZmE0J7aTW2I5HPLkA6XUM=;
        b=rE6G5+x4KfIhToEu4d5Rlc/aYbhkbt8ZyfYsKAvwTru9JnSRj/EVufLC098pC8W6sy
         LV5osQGSrEIuEceeF2px7KTXuVzXC0enlG9Z/Q19zUqb7aj/Fa2t0YKgD9U0hfeORVWk
         0zoslnP9Sfv5upGVkCQCKQ0xkj2v2gUsu9GEtCZuCUDuqQivsjy2f2i6QVWjTnJEJbMC
         uJGYemd80hZGhyja1y5nK8S/QiCg5I2HW1SA9hBmvmTATrecczN3r5DgxTJuSPBsIUej
         ptuSy35PLlyvEXw84R3g+3G6a2Hvh3lI4c7KeKdEG1HKu3XQdUIvv6hU0gNdDi3QPUbm
         2K4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786355118; x=1786959918; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lEhjsMWG90vKMNIv0q/NvqRJMIZC5Z2HAc5jYXUw3Vo=;
        b=rn4XbKP9oqEAsFF5QoLm5LUupWkJ+tGB4Z+LsptV1RSZy30uIvRblTNQQ9PCY26+KI
         2wb80wD5pR1P/86N5ZRib4UkgIJ2qZAARcaNGHBau8pBaWXBD3XLn+Clva7zoI6BA2mN
         LHgpF08f52jjSty2TAo2bYxSxg/JhhoXw2o6WxDG1cuRMRfcDPlVIoeryOYuokkP0PZn
         ssjIWZR87HD338itpaWgNhlqC5buQiivg45D2MbB5N0mrF/DWxBYNooClkILZyUYzKlY
         FHFWgMk/0Xf4Pee9BmnTbk+l1b9E/mBqlnrFYuW05J5ck+hXmK6pyUwY641cT1PzhJV8
         4mGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786355118; x=1786959918;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lEhjsMWG90vKMNIv0q/NvqRJMIZC5Z2HAc5jYXUw3Vo=;
        b=bpuhK6Toh1L7azGHfEuLesyHUIiyTvlDZFB5lcITOEnqDa7dhB0U6Z8YZznsbFHJaK
         HfUA/5HwzIHcqLVoJYzgYu5fm5sEtIqwf1DGMJhvkz5QlDcUcNgyyTbmR9HrY6ELgk20
         Prts1vDxkXmA6tUUHWI/5Jjc4KEzvFNquPNtzNH91v0DVosDNA0TTjPBQoTMeWtm0yXK
         K0yESxEdf9+Dj/dCoe/Nt6IBV/H+wgn1sVmmSz1jb2pCIn8NsySHHXcG7n8YrF/ArPfv
         wwZfNt5GOJD0ifX0meLA/ElQSQWV5VRAEW690TevKu/p2qbl2v0cT9C+UMnbdFQRdHJi
         Q0wA==
X-Forwarded-Encrypted: i=1; AHgh+Rpedb/+NtEoJh9DOPPa3gnjPG6/1g+547hMK6VbkZnjvIKvm+lMsn+yDTtSknJzoLa+/iMeEpsuF3SvK2U5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5lJGs6ve5Ma0KztIvg8n3aOZlhGitS1buSLqSVUIPfiNxpLr9
	enmoKwBmOlc2F9sE5cp3AkCYb3eGz3PQKCM5iIevgkMVOrK8xmrGAsVxzcz/QuiM18OVzOlJzVD
	3urRezohVbG8W1FuvDQOfeDZmCDMmSmo=
X-Gm-Gg: AR+sD105Y5Kup9s1d0737vyDeiyUjRhlE/iXe+zwSiG2F1G/NWoxMNWYgl1AhfUtVri
	gMedpDElfa6RnJ7YRqxGVozRXCdqNvhKhs3mSc5S1Bg/fl1vdmdTMv2g/b96ArMJAgplRKN7BfP
	APANIJqEfVwzO8ao+We5Ef5hMEn+kNdQvGX8GimgkCZOAd/hv2N5r5YgEu7yY3hHJl66gtgFrVm
	mAzzSAF+Yg2wOC0BCfPXh7+I0w/mNHcxhgVYvD+jp4mtRm8IP/ko/VJlQRbnAZ0AoU/8ce1EfDc
	7WAo45a7EqxeCcK74HUtbV+B3/YtD7Xv4dWihMkFPp6qeEUbDr/Wpc2lxktOVheXuCvKD/ZqdGd
	niBXSG+/fvcQXsupMbPtX7y8tBRptk1I19scgfLIjRQrHWv0D/+2/W0Xs
X-Received: by 2002:a05:6a20:4309:b0:3c4:48da:8102 with SMTP id
 adf61e73a8af0-3cbce930129mr18884836637.29.1786355118398; Mon, 10 Aug 2026
 02:45:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807081652.38692-1-phucduc.bui@gmail.com> <20260807081652.38692-4-phucduc.bui@gmail.com>
 <1f26fc28-da13-4ca3-990f-676b53d23630@roeck-us.net> <CAABR9nFy=GD4afdDxzsbp31Sq=smGVFf+HvqsrJKh_FjqdUrJA@mail.gmail.com>
 <3a9b7b85-e6f8-429a-91df-f674479dee58@roeck-us.net>
In-Reply-To: <3a9b7b85-e6f8-429a-91df-f674479dee58@roeck-us.net>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 10 Aug 2026 16:45:07 +0700
X-Gm-Features: AUfX_mzy3FMnWBW1ZRsEZF6RiTcGKaOh9JEcD_RNAR4jnG-Nka5rge-6f-tSjWo
Message-ID: <CAABR9nFcitFyS_xZUkreHWp822iVsoEg6ONFwU9JwPaBqm2MTQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] watchdog: aspeed: Propagate errors from optional IRQ lookup
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,


Thank you for your feedback.

> >>> +                     return irq;
> >>>                if (irq > 0) {
> >>
> >> This if () is no longer needed.
> >>
> >
> > If we remove the if (irq > 0) check, irq can be -ENXIO and would be
> > passed to devm_request_irq().
> > I see that the irq argument of devm_request_irq() is an unsigned int.
> > Would it be safe to pass -ENXIO to it in this case?
> >
> No, sorry, I was wrong.
>

So this means there are no issues with this patch.
Patches 2 and 3 have already been applied by you.
I will temporarily resend only patch 1:
" watchdog: qcom: Propagate errors from optional IRQ lookup "

Best regards,
Phuc
