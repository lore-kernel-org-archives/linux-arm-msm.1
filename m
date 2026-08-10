Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB0039BFEC
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357729; cv=pass; b=rzWVapiYi5dh4t40hris5tWjqGAU0eB9wdqK6AVlKf/UGRHWCtipXyAWodYM1eOgkNrgTA4duaLpLT8OXSneJpY4xYQsBamAcw530pP1oELXYayeR5RiULb0AlfBwL6lljf0P8G2jCh4ZJ/tFpeMqidXhmciQnuxgo1fNJrs+cY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357729; c=relaxed/simple;
	bh=NJ+gOJyER9vuv1qanBVyuaipNB75faU7GwlhL2xTp3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohFPmgGYOldeOP1Sk3/lGLZ0YoKY+rfAmk652+1JXOtngx/jyfmXYMULGk7omfL7eiuzoXzH+wzUXLcQHRtGpys7MxOz9C1VKTMwUZKYLxJzpDQNELOq4LJBSc6SodlPyApdMBz6vIc0WmuyMXpsy5dWzHNwCiEif/m4X0Z493w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpUyFETU; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpUyFETU"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so778180a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 03:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786357727; cv=none;
        d=google.com; s=arc-20260327;
        b=gtuGZ4fciN56OnD27hF83EqOZ1Qi/sgA060iWbyxmBwOzomF9U6CsRWBSDcBZiTUl6
         nvIpHZJy1xcVTsz/eDmnsloIHaPHaj5i+hhj7jLpssomtNxUK0ALvBs6trKVyhov6rtf
         DjP9NXlzFNTMzZsnn+WbzZCbvTbPy+iFnbDyZFh3ljfzZz/WlQokaFxTn8Hf1+yiquAL
         +iAVozXkLB+IohSxcR3n0jCkr5mWTxHhGnUojfGpz/DPOovGZrgdUv5nIh5wKaNhVIEs
         7JwaSLBj53zYXFbK9wHAEMWcW/kE+8Kiu1Mcz64zJuJwZwGQH/PE2xlynsYzWOEBit6m
         JRFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7YTR97iN4huYLj0yN+iLMysq/MXHzEcd/JYnaemRb5U=;
        fh=5yBDu+vrY/vcO8J+ATWWAebB6jbTfkvLOpol2teadSY=;
        b=m8FX+qwyXorEs2p4uyyEGCjmuggSRNiLsrff/qH815belavh/ZAb0eEavI17FSbg+B
         O/GE08IE5NhNwpaEDZ3E1Z8UmRjLJoVVZSxi7KrHBfm1FGGptTolLTsjPeUkII2wgFgt
         Zu15HSUXlnHwsKjH6791z1sGHpHtwD+eGPFwtKn7zDuU3XjCjXyCmS0z9xzneunarwWb
         V0n9fWvL0dkwDtYED8XjygiIq673Kk2ug0Jera93Z3PDuGoSyE0/PnuxDb4ETcJWhjka
         rYnXwDjA9FeKML3HAx3IOMXfN275JIjlosUUtIRJRJFLhLdEg9tV5vV/0PgNv3YL/Ohr
         +IKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786357727; x=1786962527; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YTR97iN4huYLj0yN+iLMysq/MXHzEcd/JYnaemRb5U=;
        b=UpUyFETU+JYmykOSEwcQ8LjQ6c6ioW8mWGQ8/c4Ykb78uuQTrmlYK/fCvHB2klIctI
         gwjfZPAMf62dt9iNJOizN7skdAUw/aAaEoBWRQuc7Pbg1oYd29+xK0lSGEMBvP+uI7aZ
         K3TwltXVralyGm6MVdeBbXh0EUunZPcssds4SOtHggPmnS2L6MqBcTkBWsIabrim1wwp
         oJDiEV2xw2fPVxloU1i7J76Qepf4QQtJizYXMpqiAEB4GDHo1EhWbKIL35oA+ydQXrIf
         +oSDNTXqr9Qu5Tez6fyRSIitWXpOJYAwN99RFZDFjdGvZC4Pp1cRmNjAWKxeLSVPCBDk
         ldIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786357727; x=1786962527;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7YTR97iN4huYLj0yN+iLMysq/MXHzEcd/JYnaemRb5U=;
        b=TWaqdLfw6m3IGZsiic1Tf4nSyS2GNXaRngjo6GX3pvhOjb4pgXStKFGWEcgJ4wVmiM
         fAj+eDviPbd4S5GEBnc6HbzvbUZTIfTZB38A1qbCpiH/kud7BGYbeaEmnX875wGTjvPH
         P6JIaGYDUYKj4jwsRNHCzEPvtok1w+K2e5HIgg11Lq4HyV6JCQ+2tB6bniuibaCnyRQ1
         DfegMyFDAQguxB0sXIktwSWcHfkxcY+ZT6AQQFgf5EP8bANoYTizazUYhvwRqGIxpme5
         5b7WEsE4nYcpD1wtQye59gTiI/uXUq82PDk2UIEtNHf7a/eU1xqMEPrfLAK/4mgbxfnD
         BSmQ==
X-Gm-Message-State: AOJu0Yww0tqyUq6lAoWqnJmvrguBe7q55X4NFiTmqrFXBskz9n8/qHYc
	3fDCheBMCtIp6ovW7y8uOVuEy/0GNd+R/KOeUXrmbWDZYekoXNZe1BXtaAz43J8mBoMSImPW8M8
	6CGFp+ASwSmHFjNikV9A0sa0og2H89DI=
X-Gm-Gg: AR+sD114E0Rgew48f9Dsv2J1zXNUMSCAT3JCpeLvGnXgWEHOAXG3UdPO5mizLpK5Y/S
	/m58swIXd0WIYeqTn6lLVjnjjeqSytuGPRpESv2eVRqfa4CVUmP054BIpKl/riKy13FIwcapE8p
	rwf27ObkVp+ppQvtwy3QpejCn7X0qY8vtZGl16FQ7Yil59YXmBJu+DZgYGloZaD9im6EAq6FC1Z
	d17V9nzvZDFslwLhFU3aTN0cFdOkXCqcPswWNYFprwvv9V4CPnokLbW9vZhNUDGvfOdhKz9JHKh
	H9Xjut05ns0AxMRTEz2rTY7ky5NqnZMNekIfZSilQz7A+KN09N6Cvn6E9bDgNfJMC2kWFok1oEP
	fPSLL5ESojLBMMVxK1pjXO4/DgYBzF2qAQbGkMW1w2/h0z2c80JjzwVtX5Q==
X-Received: by 2002:a05:6a21:6816:b0:3bf:6237:4d49 with SMTP id
 adf61e73a8af0-3cbce8d8e50mr21153545637.23.1786357726807; Mon, 10 Aug 2026
 03:28:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810102144.51663-1-phucduc.bui@gmail.com>
In-Reply-To: <20260810102144.51663-1-phucduc.bui@gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 10 Aug 2026 17:28:35 +0700
X-Gm-Features: AUfX_mw8vSRjmdPvyZVAESG2gMLDkL2HQihsHgDGyihh_Qx9McD9iFIrjFgXO3I
Message-ID: <CAABR9nF=Udo0Y1gAZKfxodd=B5LJVQ1F9p8DzcDnZ+OSM30uGw@mail.gmail.com>
Subject: Re: [PATCH v2] watchdog: qcom: Propagate errors from optional IRQ lookup
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-watchdog@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>         /* check if there is pretimeout support */
>         irq = platform_get_irq_optional(pdev, 0);
> -       if (data->pretimeout && irq > 0) {
> -               ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
> -                                      "wdt_bark", &wdt->wdd);
> -               if (ret)
> -                       return ret;
> +       if (data->pretimeout) {
> +               irq = platform_get_irq_optional(pdev, 0);

Sorry, I missed removing the old irq = platform_get_irq_optional(pdev,
0); line. I will send v3 shortly.
