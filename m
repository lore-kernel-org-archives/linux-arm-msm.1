Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA1A4749CF
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 14:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784817224; cv=none; b=OXWnOo1SDPC0tZVWIIrDQZAi/2C0wgEVF3449Y5mPKisDoHuQuLz+pzBu8G+BelQEoBhrkWUu44EcPnQDlGrz+Ztbuwxv8Tt1UB7Ffkm44k0wSlNGcFaCU9YQAhaGScY/JkGzJVJ7eawABjvH1OQcCxPZBPuf1SZ+sqXVpXgZhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784817224; c=relaxed/simple;
	bh=m9SnMkUX1tTQB6NO65dVN/roFkfDpAoBwsExIR6ZDZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5+tGrFyZAWkxlPh6hKTlixWI93IzoZbaMvdltBOKsi1qxgWIUVBCR74in5Yp2Rx4Uiq8UyDxGU0rYo51nCiyuUp/lb2EfkMNwaL+Oh+pi7ixbU1Ry0Z0uEon1HqLeYzp9+SkvFzONex98ey9CWVsEAy7DW0iuT4Pf6q8MlbxgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QTKfXad+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UFIxQxKv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QTKfXad+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UFIxQxKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784817220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2njy+/zspbCzy0izhWL1wi7/dDBKbdf0HpY/B2TDfoY=;
	b=QTKfXad+ncfLcR+Xpvo+ysfguNhj/X2g05l+MNDXrRJMXlDikMVUxYRJVqZ7n6VPiQtHtT
	xhr9tZGJtEyNPSCaXh9/5EJxOUTjT2u76QHI1RSOsU5YZwddgSTtjegT7jLPEzLFWuhPoX
	3wAZnFGIxdiN7iSqMS7HdHcPr4bY2aA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-Fbfk4Q-HPHKpf4YpWBsUMA-1; Thu, 23 Jul 2026 10:33:38 -0400
X-MC-Unique: Fbfk4Q-HPHKpf4YpWBsUMA-1
X-Mimecast-MFC-AGG-ID: Fbfk4Q-HPHKpf4YpWBsUMA_1784817218
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-907c59bd65aso12956896d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784817218; x=1785422018; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2njy+/zspbCzy0izhWL1wi7/dDBKbdf0HpY/B2TDfoY=;
        b=UFIxQxKvshLj6Ov7uMzFME4atQc5u7W64zO12Z8b2SRYQgMB54b9cZIa1cXP7Chf9K
         IvCaj+TkG7B9r11P0iBmuo1iln8tHE+WwQA7OR96c2crMwBYnzLjANbUtbzDm6QXUFS5
         duFfwKGT/0LhO1Jp+r3FFqqHfHoRFvrIPnuadW14Z9f1R3rfhGWVrlM84khYI8c3EfcF
         MapV7dKNfqR0qBN5ajsN2+6fhd9uxUVNbvczGZJpjJpk+P49VlByocb8B6FIHbXNnnmY
         zb4L16bMrHvqL58xQqpCBjGsyvsW1xWhN5GyS3IJwDcZY/c4GaEfZboMQVkNXmgGBJfS
         uieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784817218; x=1785422018;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2njy+/zspbCzy0izhWL1wi7/dDBKbdf0HpY/B2TDfoY=;
        b=llFfD7B3Y4Sl6b7UiJNd/lZohSYvxFDDeWqXd/unxZQ0uXzXfCXmT+k0yIg8yVrHlD
         ZpCjMXxwTGsZQoAasF3dkG65dFbyml02L5/ncjVDzEM8iLwisIKZh8a4vbor7vWjayVh
         HXsJZGjNDLCSqYdgpaCPWVI4Eqsk4Zw/42+L+/yiLSwwwRrGNQ9dY74UhBPyXM/bG5gN
         IjgIOk5pssgqqj5DNwFzEXj6QBJ5NmwrEa9ORH8/SvD4MokfP8R6tjc/DX+aUjFJQTnQ
         T9IihEyXqY1MLF90w0gqY91dF3TfNcQ3WGVDWZ2VnjBUiq9jb+8mbDRyPi8QwdM+IFh8
         fP/w==
X-Forwarded-Encrypted: i=1; AHgh+Ro7wKD+xqyDIPKlk0mTrL+1kRbhCmqI2IaFHZgNGf2IGCA1HYx6FDMIWoa6Sn90+3ZYRVlUFUX9MDzCpVcO@vger.kernel.org
X-Gm-Message-State: AOJu0YxDo0aPI01FEl4uu16GkeSLAW9VwllvCaFjSUJ5+Vz4lwHbOQqC
	xpHvZ3u42XE4cbpLwAt/V41DelNZQrctZ5Yei7FM7gx0nDUUnka3PzcCjfxdvY0BHKym6dTjzOL
	F6MQQvfYY8wBAAUiAH6mYCVkl+GLKWY0N44FfzD8+uAdw2ZHNO9+nSiI6kS6/SWAfl2E=
X-Gm-Gg: AR+sD10LXQnCF51zipUScynbt2qF1YLQl0PNfXuUy3l83zZQ0/mV0nA6Uo/ZgGD/zLu
	cOWF5yrH45GfXPKIRG+A0kPQbBj+OMO3p0fQfgDtASYL9lVU9+/pYuG9tJNYOO1/YW48XMPxoCH
	bqzb3c6GBlJjkVrfuJQ1cEK8SB6mvwkhuq8iFGCvxxoKHmMXKjKG0fFROjeWgFh9OzjHfoCuLoh
	w2S1p//xFz89HyGDlCRGWb9lwlVPHXPIaGlPBgpxvQ0+ayuWu/kcuZlXE3hSryB0/APICTDs5Vb
	FHS1EspYwaFgbnQyX8RUW2tp3CKkJIl4E0FwP8OBhHJW0yq/s77oiS4QKPYRBQ+T0BQjMSwDzFI
	xcd/IJokugLsRNFCa+duIcK3zMbDZ4VcNQhE=
X-Received: by 2002:a05:6214:2aa5:b0:907:aec2:6cdf with SMTP id 6a1803df08f44-907ca363063mr40226066d6.8.1784817218207;
        Thu, 23 Jul 2026 07:33:38 -0700 (PDT)
X-Received: by 2002:a05:6214:2aa5:b0:907:aec2:6cdf with SMTP id 6a1803df08f44-907ca363063mr40225316d6.8.1784817217491;
        Thu, 23 Jul 2026 07:33:37 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba8b5f85sm46744846d6.2.2026.07.23.07.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 07:33:36 -0700 (PDT)
Date: Thu, 23 Jul 2026 10:33:35 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Tero Kristo <kristo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH] clk: clean-up simple provider misuse of the consumer API
Message-ID: <amImP6sFlv-sNhMh@redhat.com>
References: <20260723-clk-provider-simple-clean-v1-1-0c9668240467@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-clk-provider-simple-clean-v1-1-0c9668240467@baylibre.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Thu, Jul 23, 2026 at 03:20:59PM +0200, Jerome Brunet wrote:
> Clock provider should not be using the consumer interface.
> In other words, a provider should not be dealing with struct clk.
> 
> This change targets occurrences for which the provider uses the
> consumer interface and corresponding clk_hw interface exist:
> * __clk_get_name() -> clk_hw_get_name()
> * __clk_is_enabled() -> clk_hw_is_enabled()
> * clk_get_rate() -> clk_hw_get_rate()
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> The change being very simple, I did not think it was necessary
> to split it into multiple changes. If you prefer it to be split,
> just let me know how.
> ---
>  drivers/clk/mvebu/clk-cpu.c            |  2 +-
>  drivers/clk/qcom/clk-hfpll.c           |  4 ++--
>  drivers/clk/qcom/clk-krait.c           |  2 +-
>  drivers/clk/qcom/clk-rcg.c             |  4 ++--
>  drivers/clk/qcom/clk-rcg2.c            |  2 +-
>  drivers/clk/renesas/r9a06g032-clocks.c |  2 +-
>  drivers/clk/rockchip/clk-pll.c         | 24 ++++++++++++------------
>  drivers/clk/st/clkgen-pll.c            | 20 ++++++++++----------
>  drivers/clk/tegra/clk-tegra210.c       |  2 +-
>  drivers/clk/ti/clockdomain.c           |  2 +-
>  10 files changed, 32 insertions(+), 32 deletions(-)

This looks good to me however can you split this up by clk subsystem at
the very least so that the various submaintainers can pick up these up?

With that:

Reviewed-by: Brian Masney <bmasney@redhat.com>

