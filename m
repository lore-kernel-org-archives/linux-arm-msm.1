Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5F54519A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049288; cv=pass; b=OVrEmB0Vj9dZwDY72X9Xtk/6ZxvvOMesSWNqeVg1Jd6kc7yt8DDuyz9MV0B3zg+LNPOZyO6vcCRprXW3ldOMlPNG9iX0XvH3rK8CcaJ0AOhC1kEA0nV5y/HsUpS1zGbNEq865E1m63J7mlIBaalwWH69BCJonW9ekfN6VEnjYtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049288; c=relaxed/simple;
	bh=bbJZ/VbxzHtYUQvN3BIW9kEy/QGwkzPXajOtgflCSGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vCoR5pcjjT/vkWQnnRhxtrMWyQZ7RGXz++toGEc4NcMMnApIBx+/wl6EURD9/Wi5iOX3iKDgxrttWd3OkbGKgiB6I4VCi3LSItuCoWJP1O+i0lotvibp3yivYjfPYBj/h4fghQX3LIdc6iZ1xiljEdksDiy6HspPwbTE4gIQe0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyi2qoBH; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyi2qoBH"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ce7d2adef4so11505305ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:34:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787049287; cv=none;
        d=google.com; s=arc-20260327;
        b=HdJIPzV8ximIxTb7PprU/Ii/Wk1o9yX5nbT3anDS/bTrhefCy5AvM5xWD1GNawOdAk
         h6dAYybnb1yJaUaDCm8FbUYnNkK0gZMlIASS+aWVCahwj/xweny5BJhOISR+SYkQRTJV
         XdoeN9P5uJl4M0MoyZtPkIrX+sb+4jsqUl/hhxV/afnxZezf+hsY8pvEl9dXuXB/IFG/
         vwLo7um7DwECu1IGT4a/5tdXUOZA00HgQm90GvarOkAiFYFYc8v7Vtp73lAIiKgqbTKK
         U6oRMi78SN4SqL8LoLEAhthEKydVpxoLEzaxBhCOxQjEuTx56uUfwatCiy7jb24oSZRn
         X7TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R21o5PufdHLCOk0q63pjqBI0Wyb7aNPhEqICcD44Ht0=;
        fh=LQxoH1MqNcS6zaXEB8HA7raf8d75EPhc6fxTqZ3xy3A=;
        b=FeZruuR9D2CQWoANSxPlfDny1qiKhXnPkDGr8ku3v8TIZumxOuKUidjpe5g28JRLcO
         e8JlSV2cwkeOuQB3Dy1Bc/8+RfiJhuYo8ftym5jncZCvGPtYWo2zplQCYpORZqn7ppiN
         /3k1K1Cp1KAKf9M88drux60CVLKuCv2H0x7Fw4BctaRyVJjpfbKXwezfqy1pQ7RWDKfz
         A9aXMi6Ot3GAPLDbAQk/gBjqmRDsaNI9ppqgKTbiEEH/KdiVZm/5e+sgpyLZuE4V/Mpv
         NFaAiOOKSGALpWuOVoW4m3C40pRWR99BO3JiMJtxlY8Q4k47WkuPMygUpYuelDOcxdUy
         WkUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787049287; x=1787654087; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R21o5PufdHLCOk0q63pjqBI0Wyb7aNPhEqICcD44Ht0=;
        b=hyi2qoBHfAjtl+QdsIc+DZp3WrbSHd0Hby1ffJA/6j95a+orltqSJ8v8EvkfrXixCe
         nrMyyy1AsFW04ohGcP3NiXBd3I1o+hQKeZpzxTYB4OxP5Qz7x+Z6i9bvRoHLkAKou048
         QnJhujZXQKijGZ3S4lj3owDsacuD802NDm2/RhVCJQ920+uj3q0wb7GVrsHeFGSH5QuA
         FA6ek2tL++XhnLD+Fr5ooymk/AGcaddpGlzXOGYE9f7BZk/MWZllExbViwQfLq8f3808
         KtpAS3pfvCSIJ2U74O9KFI30ppZWUTibCLbJdHxeu9KAHj4mkWSkbxiYZWEMme3xcuwq
         pNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049287; x=1787654087;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R21o5PufdHLCOk0q63pjqBI0Wyb7aNPhEqICcD44Ht0=;
        b=DjQHKYTxe/bMTQNXHSQvkC1FZcOog8T2iLv+6g3uarVbZ3gDDC0Rp1Dj+LaWEKzbhE
         K5xIgl1PSNTJd15FyGIp63zFsv8zEtVyLgiLIOeh/LIYjOtM25QFdlPFKa6bZIxsk4wo
         3DuYO6kx6/RmlctqvdxyeWxnsURJa+BoTT/8y3ijychHXa2ReD1e7Vx+yJ5/Ob8LFjhC
         znheyP8KUmeNgkksFZpJ4PsOjUYdrlWEGccHht2tPteqtHIqokxSl7LlCLOhA78qCsub
         mfzYuyjlBpE9+BoOTr/w6wSaIRIJ52aDd/W9kcoaD26Cq9BR7da4FoG559SeEASLR5nI
         wcxA==
X-Forwarded-Encrypted: i=1; AHgh+RqEk01Kne1mEV5qrZEdb4Q3PL26YmAEpvqu4bdwwgh/VFzqKvLKRC5awrBJ7VWsr4bqL34OSVsy9p4saO4p@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7OTfEJHBkOUkC7O6/bIuewzN0WF2URE0+fQslChhO5clbM5MG
	qPOSJV9urKihRQ1jCPIvh+P5wLbEsECOnKLQniLQcCj150E5C58Zrpdks4bFg3qa3iHsmujudLT
	84OOqD/pv/yXRPmTvSFm6TcxPKj5/q4g=
X-Gm-Gg: AR+sD13DjGCu70gfdKwKypNGIlXakV4v9huPb+RdcZrkcUYpBl02u676GjslcQ+ZoHV
	8AmAaC9g4t/5aMHzDOvMQFKYoaqTGMwyLlNvPxIZH+R18xLZq8XDlXx0PipTlGsty8p6D29nzrp
	fAyQ2suhgpjdqdgsm8ORR0XbJCQeA5ZkNmvxWkNWmOSwLB9apGflxW28kDD0E408Z2kzI/4iGl7
	9y50EmatdQGscUdQoM55cgizRJmYTzITNpDJDMjZ8AjUxGUENGXrxh9H+ahK8C2LGXoO6v4Zf47
	1TRNPikwxmD0AKeDTYTsDvH6CHhGhsGwr6rm4csQgtW6xvPwLtrTyVaXthiJ4sq1c0Xh2sSv46S
	4i82ZhkH1QY2GZtBxHXdfWhpoChIN0oNEOGPEa95z38KbSCrf6MNUFMbXdpjO1NJiFa8=
X-Received: by 2002:a17:903:22cb:b0:2ca:61bc:317c with SMTP id
 d9443c01a7336-2d3b0c5df17mr325231325ad.13.1787049286689; Tue, 18 Aug 2026
 03:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810051031.26656-1-phucduc.bui@gmail.com> <90c9dca7-5873-43eb-b9bf-1c8dd2c0093d@oss.qualcomm.com>
In-Reply-To: <90c9dca7-5873-43eb-b9bf-1c8dd2c0093d@oss.qualcomm.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 18 Aug 2026 17:34:35 +0700
X-Gm-Features: AcwNN1Vktw7WB3ibOoYDJEI8_agc0z4Um3rU8cCLonshrcpeAMfAUW2ZfH5AvoM
Message-ID: <CAABR9nGmyMNREPLbHjkRovDF84VipqxQJssN78b1tKCenSh+GA@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: llcc-qcom: Handle errors from optional IRQ lookup
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konrad,

Thank you for your review.

> >
> > -     drv_data->ecc_irq = platform_get_irq_optional(pdev, 0);
> > +     ret = platform_get_irq_optional(pdev, 0);
> > +     if (ret < 0 && ret != -ENXIO)
> > +             return dev_err_probe(&pdev->dev, ret, "failed to get IRQ resource\n");
> > +     if (ret > 0)
> > +             drv_data->ecc_irq = ret;
>
> Techinically you can drop the second if-statement
>

You are right. I checked the handling of ecc_irq here:

https://elixir.bootlin.com/linux/v7.2-rc7/source/drivers/edac/qcom_edac.c#L369

It already checks for > 0 before calling devm_request_irq().
So the second if statement can be removed entirely.
I will send v2 shortly.

Best regards,
Phuc
