Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4F631353B
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786515293; cv=pass; b=ltkTng6CmmXXTP9GqIVIN362eD0B/L8gsEoUYFxXONGExGPEgIrkgR9vYdByXTqnHLamOHaXwWJm6hXNY+5OvEgYQSOumCkMFb1kCsMVHWPHrMmcaOe+501fQFNVmC85QHi/Ns++G/OZPTwDSfQOld7hgrfd/G8zB6jG2QAMb/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786515293; c=relaxed/simple;
	bh=gpqdIXWurtNmFZ/FFlmQUckin2s0Lf8qwDro0RQ1ooc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b2CMzTpVvamb1EOSu+1Al6nc77r55IKbhhczXisG3o53prUYas8b9drcBXZ2Z1uDaAPazFqb9bnMUwczimCE6FqvPuS8SM7tT4pnzf2ZLc9ttOUWi9qS77tF8uUzDjFbtf97muSHq9toq2djuEQ0vGMc6WWKXGg82o6jPGRfkIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qvi/WjMs; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qvi/WjMs"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84847482584so477159b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 23:14:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786515292; cv=none;
        d=google.com; s=arc-20260327;
        b=Pb2JGWMLY4eDcOMnePpf893nZnZ3tv1ZN/GyUEwZXsW2pDUx4maAttSChsSS8gUm0Q
         Unrc6TntiBSlzL1dL0+VPeGlmTdaL7qdRnRyFjzM9OA8pwROpv09oKMeUjOUBiGINO8c
         wOEMPb9ZkgckwAMQfEifCOiUIiZdBmyyf09PxBUg6wtmgUHFufjch7ckGmJxfxVe7Jem
         /OcshlqA80Ii0cMrWLJZOeNbYFIxMN4rIU2jzUsyIfvBf0jsNUHgpkuVQCzUe1jUhJGm
         GPCTR01ZPTNhBF/6V3sqOiTF69Hx340N9nXy2fd1GNb0xD9pQ+ZUO9xYbAAQqUYePje9
         Uupw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OGpcKaZyDGIQV074XSBk8ZsfBy3nSYlr/HYg40wKCL8=;
        fh=TH2isBzOX6vjmT3gKbT5L1y+YF4hBUZ9+EMbi0VVSQ0=;
        b=JIHMHrBeHmBXb4rO8+F+0vndO2tysMBo51ev672kvODGFyY/AqcqDh3l/uxO0fFnIO
         ztPgz5U0ifjuen0l0U4eLiMiIdeuo3alLUTheQs8OMWrgHiVsVehsJLb1zKxqqmvD5eI
         BkAt9tjMMVrh7RB/nf7g4uVcN6wGkxApUjBVPwdzg+E9nKx9J2BSbKoBNZUncmOp9du7
         f8Ph7PrNnmYCZGOSUoS0mxN+rZiWYoDGlioLZb1JvLTIqLdMOfFY94M/meSYROw2Xich
         /mGv1OmWqaUVzsJ4rG9dvOjBpeQWuXox4kumXIFTjVx0wVoSzhXq24AtA1MEIbZOzNDb
         PPNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786515292; x=1787120092; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OGpcKaZyDGIQV074XSBk8ZsfBy3nSYlr/HYg40wKCL8=;
        b=Qvi/WjMs9u6FaPXocJrAsFAqU3LY9kslcvw5BEiz+4fK9j4yD8tmkGnxbubpTPCFQk
         fXuYltd9eTUsIAelo3FmcIc/z30KAkPyvx4pmzd0yymEyeau04yVG3QXxGmzxpBzWOCh
         OTHv6o/pwW+mmlP8fYqlVQ+MFlcl/rMp1D/SgI/5FNAdjr1tcwH+dJwRN4RaSBtFvEzM
         DtQx7IlVgZIZbsG6dHyGpPpWtNgNod5kXaGDBb7VFocHWOh/C+2BQTZJ2PkC2DZq8Yyh
         k0Gy3wcz6kRAxJYIv4YoDng2eXm1aqg8gpUU4kB6PmomOmn1CsXmQNb83JP7EYZN5wuA
         BZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786515292; x=1787120092;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OGpcKaZyDGIQV074XSBk8ZsfBy3nSYlr/HYg40wKCL8=;
        b=OvECrSOReDOZ1bS6ERdUXpOYaVB3wgaYfS/fSThzzaoAmMGH4DckwsefE69N66NUqY
         Xgx3wvI5vklwKBL6x6Sueuj2msR6RW3keFsmtvXucuFAneHThnCazYkiC1myKuE92tIN
         7EN+QY3fogqA0Im4W/Ti9ot5DG/o7N1u9Ib3z5c9CWavhHJcSmAzwMeFfDAKxxtoOlHl
         kUEkMLo6uc/NfPm+/Q///8Y4MpV8llni2zh470IFtvV38pQuaKFCkpN9vdRtw1aD93YU
         pBvFn7LmdTchwW/vjxs0tryFSiuEdM9dysEn1LQz8Z7q7O3HDimnfq5ReXhVNKwyHCka
         sryw==
X-Forwarded-Encrypted: i=1; AHgh+RoCFwuJp4B0DNb/+Jz7U1wE8Uq9vLkIbTp0EqB/dGYd9rFJSpFJE5sS9AUNY2imXu2qqFAlK02QEvFQWep6@vger.kernel.org
X-Gm-Message-State: AOJu0YzNzRmta9v1C9VKsSMdRnKTp9pm48+gnK/UuHWyvITrXRtMc1VB
	EcO5QGXzjQ2bLjnIJ/Yy8L42gucmUJO9QGW2OSPJsSfYQQ29Qq9371iLPloVCKE5YVFczH3GczY
	5k8EIc9c0pMzHBsoas2Guf1cvibaX14E=
X-Gm-Gg: AR+sD10uMhw/SIlAoJAWfFzdDZp7MjDiW0+q4MBkZ+1oyrrP+qbnNOk6YNwHIt/0PHt
	iZFDybi55DnFsvJfahsOiJY9V43l/c9t+2TFYbAanPOiDi7xn+Et3cSULixg80b7NSBdjdlmsxY
	vwM1mqqKn4daBgtPZazYL7yGb5uXL29nfmtpd6CECflYax4nXvJTSnm39xgztOmTLBBzYeuYtN/
	zc5/gtJAqVzljM34GIalYxy39zXZXcfuhTMpwzEi3piwjoe1w5+UhTSbiwmdJC6eHZE557wNKNf
	9gI4DTkGKcI+LqwjPhOnDowpoHFgYcsAPG95hHSguPzAYVmbAItKxG6b49vF1G1/F7kXHNnLZr0
	nCEj01h1hASUGNXl4O1GWOHbLvBeRHPmr7HCTdgj86gt1edVZMj87w6B9
X-Received: by 2002:a05:6a00:3a26:b0:84b:e69f:1b3f with SMTP id
 d2e1a72fcca58-84fb64a72e2mr2017392b3a.8.1786515291613; Tue, 11 Aug 2026
 23:14:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811034715.6034-1-phucduc.bui@gmail.com> <81a38486-d4d8-4ca2-8d22-d3d178c17665@lunn.ch>
In-Reply-To: <81a38486-d4d8-4ca2-8d22-d3d178c17665@lunn.ch>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 12 Aug 2026 13:14:38 +0700
X-Gm-Features: AUfX_mzER_EgLNEvpTJmfvYgwL3eK_-FLtBiAbxBe6igcUypPzt7NIe6sQB_xgo
Message-ID: <CAABR9nF4q=eyUbzmo6-Co7NfVcg_bufHnffy8Ho4ZehHFZpqJg@mail.gmail.com>
Subject: Re: [PATCH] net: xilinx: axienet: Propagate errors from optional IRQ lookup
To: andrew@lunn.ch
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Michal Simek <michal.simek@amd.com>, linux-arm-msm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

Thank you for your review.

> > platform_get_irq_optional() returns a positive IRQ number on success or
> > a negative error code on failure.
........
> >       /* Check for Ethernet core IRQ (optional) */
> > -     if (lp->eth_irq <= 0)
> > +     if (lp->eth_irq < 0)
> >               dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");
>
> What has this change got to do with what is described in the commit
> message? If you think this is a needed change, please put it in a
> commit of its own, with a good commit message.
>

lp->eth_irq is assigned from platform_get_irq_optional(), which returns a
positive IRQ number on success or a negative error code on failure.
Therefore, a value of 0 is not possible here, so changing <= 0  to  < 0
is directly related to the error handling described in the commit message.

Best regards,
Phuc
