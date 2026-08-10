Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762142DA74C
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 02:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786329510; cv=pass; b=k0JxyyScl6pmTtzPRrhvsB0oTlD04CW/s6erd6COWYfTbVJREzpddgn2z3+r0RlFyY6VJWCKPiyPX3L/YHO5tqWRDks4kjSEN876IuKxXQhIEaeoEq/EEfNPKWsle/5CCdH39viVh/5ORPwBqffrKyDlHk2kl+31XXo3pvySIvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786329510; c=relaxed/simple;
	bh=vpKqiOCkUSHM8zuiw76Mu/tNq2+x3wFEom9OX0Zzuio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPs9oXB4fN94zGOkcyZIhE/DyFrdrrxy0l6qlvKE7/d0IEjhO+fIT5MHU9Q8X+FBpUOHL30iUiP6qS7+D1oTlhZhUWGRvw+gtIzEXUHSMybt9/oRvY1sCvDizobGkAaJh/cFWnqdTs/Xi7KaF8kM8KRlFnW284YykUIIHJURSwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tICSzVuC; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tICSzVuC"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cacb8416a1so12887805ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 19:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786329509; cv=none;
        d=google.com; s=arc-20260327;
        b=bKh8PLOgZKkGShHOTQ4wbFPcpJYavU4tbnN1ZRFXi+Thf6HBHZ//9dDcghf93wRGCb
         mbikthc+9PtgcwBBA9v1jm+w1rm0+wU2WZO5ORAgtlIPHrLznjTTWkjLtfr7m6jwrhqg
         lLa4EywH2tgmb1rw4ggBFx8IVgw09EXGM48HByPyNQcOraC0/2jSJy0mGRIu9QscXNtj
         wP+HfHIcqkswuuYpgTzfLIFIoYj/M6+9NV/jlrkTf0SaW7o9nUU5GWyWe4kGC7TD8OpI
         rNSYVHzPrT3FRPnleUTQbAPjJH4KmKAYs7dTTc2vwOWpTQoY887+QrxZaavYFVN6IoT/
         PtXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6DGwzvD9/IQFl9yYfrwzS70k4e8kTkJHKmvyNHmKPbc=;
        fh=l/hPiMkhGJ5K0w8QEbvvXcjqnKFUqLHHcUghQfoNzSo=;
        b=OcDRm4qc9dXrinHmFoHnYi2abftc6W33YjyZ2EnyldfICXcvhQPm5lZIEjZ4zfmHsO
         P23iZCIf90lKtxw45csInAzOqDohZu6I5cf8oJHB6yLAFHWBxoid013tHBBMH3CGRBLx
         66xQ22r8jaZMaZwmgMuT5LIoLtB/2eKUDsmU9KdHbWfJLOvZHA2pScWfXXw5utwmZMnW
         gHzkrgp18N9SoQi2W2fgTMb89AFLHc00tu9+FHksKyn8gcooZ0n2RegO0vAoYYRVS1Mz
         euZaIao9XVuVQsF+48uPWFH37x8TSuWadJQH9XYvWcB20FRXnSpjcHtSkM/EbXJPGtR+
         75wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786329509; x=1786934309; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DGwzvD9/IQFl9yYfrwzS70k4e8kTkJHKmvyNHmKPbc=;
        b=tICSzVuC/lTgjQiS6ygZqFpEl1jS8P73NUjK0BWwiwxt4pvy8K7hAs3zEdSx00CWEk
         LXO+9ZfHMyp2ZbwrPYGcLv5A4efOrsxqfsuvy6msD4gxYAJraGmb7sZZZb0THbh2LjoE
         qED6RI0Lw7CYaZOB+nitPZeEtIg8BANvCsKduZ6e+eb+SNx8COx3SBASN2u7oHy7aMq7
         MV8xZAmqG3eYAK0VgnBEw5ptcoS05I3kjtBeuwP0q4nvy9DnULE1c/BSJxcE/0h00qE2
         IRd1UgwdNTTMO0ysvKXBrnD6QMyvCZu95dSCLVgkPTYjGzgWTXdimIdh9kKVcXVfKfp7
         XkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786329509; x=1786934309;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6DGwzvD9/IQFl9yYfrwzS70k4e8kTkJHKmvyNHmKPbc=;
        b=GKFKjBMcztVA4T/7TP8HdX8ITzph0NL1cW1iGfBKOKQ1NhKKWjsSH9r7Xv9yTKn1lj
         KAwnCFOLNS1tzwZRWdQOfxxVSGWECnSkdla2bjMFspraoi60W5daL95IE6suo8vPhDXO
         0Rf5DbO7Xun0RtS4294SQ5rWafkcoPB3Ztims6bjXkfP5rZWTlNA6CQHCfh6l/1EvO0T
         8s4MJcD5EYNflsO5VDe1mO0jcucRBk9dA9KAp2RyUPaic7vo5UT70TgwSz7eLcsi06bu
         Zaf7TKZBnikkhoxNTNZihCZj+aVM/wocTPINbE/X6h3oKJbp32I9LLxYuFDzxEWmc02n
         I2rg==
X-Forwarded-Encrypted: i=1; AHgh+RprMpnuuLITR7zRFrZSqaGrw8quLKSQFxk9DGGw8J4+Gw00ht1RKLPrMjQ25G3eCNzi0m6VxA2jHQ43pCBO@vger.kernel.org
X-Gm-Message-State: AOJu0YwMJck9/dIKq3Pe7D3jwPe6TB+G3wt6FYOY8adB9nIeX6Fbi4zO
	AVMbEMh0sYsfxhJMNhNGW9mMWmuaKDWz3iBWKwGUHbGqp80Xy+NnTGPjHLo60DxP2xlFTflv5q8
	tZnVDP0QT0LUCs34S6/SBZZYIoEMM2r8=
X-Gm-Gg: AR+sD127YTreqHPb0Ff7EXpkzTWZHGA/+1huqdzitt+NCKuoJBiSUVbgvmPM0n4R1n1
	6pKh5OfGXwc2Hxv/B9z4t0vQrZ78db70fsTT5Q+tCBWtJt0NFPxgnQ7x3MY1GjXxE3q4iUPNjg0
	5XfSyClJ3z5sP+PWdT/QqQBpXCRrlEqHOufuqcWSddEzf+piBOUqqTNpHKjXfaWvLoEl0B7JXtv
	QpXqY+NDUvEJ8d74STseRAhUXECKb5BYi4nhaKvwoXg8aikNkoAKaYA8q7mM9CQvkVYeAN2iULO
	OEBfcoexSCjmdZm+K/EgsrAzaoqgH2SM+FP45HCDWOW2w+OP/yv4Ha09rnzV/JgmQYVgDRljUpH
	QjNEDiAxpFG927ciZAaqNkSWSWxoJ5L31wv6rjYu573wNLI2K+3YhbN4S
X-Received: by 2002:a17:902:d58e:b0:2bf:27b2:4b80 with SMTP id
 d9443c01a7336-2d2a8d1d97dmr211697695ad.14.1786329508803; Sun, 09 Aug 2026
 19:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807081652.38692-1-phucduc.bui@gmail.com> <20260807081652.38692-4-phucduc.bui@gmail.com>
 <1f26fc28-da13-4ca3-990f-676b53d23630@roeck-us.net>
In-Reply-To: <1f26fc28-da13-4ca3-990f-676b53d23630@roeck-us.net>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 10 Aug 2026 09:38:17 +0700
X-Gm-Features: AUfX_myaPy--xKkkil0mfKwIudM0kq93jPRIr1aFF5iubyuHeV4xAEUrCHwB2E0
Message-ID: <CAABR9nFy=GD4afdDxzsbp31Sq=smGVFf+HvqsrJKh_FjqdUrJA@mail.gmail.com>
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

Thank you for your review.

> > +             if (irq < 0 && irq != -ENXIO)
> > +                     return irq;
> >               if (irq > 0) {
>
> This if () is no longer needed.
>

If we remove the if (irq > 0) check, irq can be -ENXIO and would be
passed to devm_request_irq().
I see that the irq argument of devm_request_irq() is an unsigned int.
Would it be safe to pass -ENXIO to it in this case?

Best regards,
Phuc
