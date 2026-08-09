Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160D7384228
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 15:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786287829; cv=none; b=NH8HSRJCd50EwbB7Nd1FP9BsXYAVqa2opNziWWO4DkRecFv6z8DyEHFDiV8tthQFIdAKg5UN6XbKrnYjDzQjz3kHj1lXIpSKJzX7BSzeNQc4jdT1KRBKGebH58g56xOPR9H3mfGVKCs1d/AFjcr6nMEOYKsdIEMTE2ZQRt2XmJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786287829; c=relaxed/simple;
	bh=1mFXOor9dE+n0F7jPlRFfNd6PO0TIca/g9TS79Cx9ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ip0TrxbuBow+VdmM23uiWyUQB3HeCmU32xILYeaLYwzhd5/YbTT8uUFFJp28kywlER0Axz7lqXpF/j2EzHAD0WRtkBKDC9UQ7eecRKxP1zrLAZQmWIJY6p8vPqNr8J5WZxdMap1jUEpASk+AsgqKJfm1n+M+oZE4XsjqCdrD+pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IabkBaHT; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IabkBaHT"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38f620399a0so900569a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 08:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786287827; x=1786892627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E/WGUkXoZP+UEyJ866t/Krhk68GDNZkyepthpjmm2Cs=;
        b=IabkBaHTEZIlmn4Dsnp+4mawQ6ndDSGydQVpiFCw2rreGJImJaVw275YEgmEklwL12
         NzsiHUQjjOreIArAAMPBNroCDF6HA2xqY3p47ifvYx8OHfS+kD+xeIRjkuANcxqCE0Ut
         uYEeHbGhIKWDWSjJJvQEbhKjc0hIQtGEE81pGb3yxQc9O98d7Wq7UY3HuPd7CpR01Ap5
         UxsQZ/VySFtnYlUsZDz8qUen8sNezc/Zsai7iPbpnMqPALRMnG3PyFpHwgekynML4bGM
         NkdqcPWM1PG6tjDiFN02/a94gVi+UH74e1gSTLqiii5JFReMJKHBFUi4LBl1W0ZVqo+5
         W1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786287827; x=1786892627;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E/WGUkXoZP+UEyJ866t/Krhk68GDNZkyepthpjmm2Cs=;
        b=KE2a9Wp4sOkYDxEolaRKjne/UPDEeLPwbPqqwDXAi+DypsT0u2uox/MyLszxX3qRdQ
         ftPBSe696XAuLy4hhACfGQ1KyFMBYpi/o7aOLk1+rnY9JjPWEkjfvEmnBT5VsQIOHItq
         o8RUO5Z9BBw0IBXtLc8JXk9JVhg6b3RYk/0FHCiWz3ZDKmkGlruXl8/+aerAO/Uj+gQL
         Xqz7sKRy8GSRdEVr1EBkf7kOM5KzXiH4KW5uL1g0LHjo1KW9aWgrdfVRpLhO7arAd1RC
         YAL57M7hUJ8KY7BRjR/7PoBPT91rq87i9ziX/JW3He8MHa6tCShrBMPfI+LetwNcYZyt
         gHSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrfh2M+BJ1g21qP5xUP/9f93DmSyX1kL1dNOeGTzoSqgVN1Lj94/ujVkPvj0bDgoEpJKWe0OEfOxOuPF/XV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp/KiGMjooqX8Ii/ujwysd1TKEzeGcorHiirXgbkmW1QbcQGtC
	gTb+aMQFKa/OrbSJl9b8hyaZse2fCLyazfztt2dtgr4b88YfB4kAOpW/
X-Gm-Gg: AR+sD134nElj1sh7rrHvIRa60h8SqYaJHjKige0d2WgnYvnloCjRkUEawjCfSyzrjJ+
	331vLoWb6saT3Ao0caJp+Ln3j/+eozUk4Hy0dVYGoROL5zuvq2nLzBMbLBSBf/HPn/zn02/d9Av
	2wYXqxAzuNiry2acBg+2eVvnB4yZcKVftbqOYOThX2b299CiLqJ/p4VfRESYKfWw0eB+d5Kdi34
	dYNqsgXkjtBWYyhZw/9xJiHWuKOUyeLrx7XNKRM8OEx+aLEKrfQxCTKGjUORxaLXmNvHWqQSZBk
	wGsszl6lzA1t4oZt6oVvKIaMFio9B+N/TYh+Qy1oKnMCywiBEN8pGZ2013VTlljS2yV6iycHY+M
	fKJj5iSjEFF6ZB3O7korg1D4Mu6X6NqI+RHK/ORcCa4NmfR0YRS+XuImoRqsb4yKRGlZ9rjrkBY
	fvnWCm1ZLSoFUII3wsNlxMVdduZxxc8dtqbaZRUM0RlvBLE3CiOTUi121aRYUy8NLyHXKm9939K
	Vf7uhY5XZDG
X-Received: by 2002:a17:90b:528c:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3903c5448dcmr37987775a91.4.1786287827273;
        Sun, 09 Aug 2026 08:03:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101a5ee91sm26113119c88.11.2026.08.09.08.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 08:03:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 9 Aug 2026 08:03:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: phucduc.bui@gmail.com
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] watchdog: dw_wdt: Propagate errors from optional IRQ
 lookup
Message-ID: <fe5952db-09b0-4e20-ade8-fb9d28463440@roeck-us.net>
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
 <20260807081652.38692-3-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807081652.38692-3-phucduc.bui@gmail.com>

On Fri, Aug 07, 2026 at 03:16:51PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Instead of only checking for -EPROBE_DEFER, propagate all error codes
> returned by platform_get_irq_optional() other than -ENXIO, so that
> failures are properly reported to the caller.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Applied.

Thanks,
Guenter
