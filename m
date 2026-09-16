Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A914AFE3B
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 23:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603022; cv=none; b=FLOlnmUPfKwt2ECRJx0QWIu0DuuLBAkmtZkDfBx32Gt9AjFIdvsr5wVcCaCwevAAjNVfh3OeoPbSAs6ZK26PjvjYnL7Hs1Ip/1v3krWlZgnpYU8lawios30QZCRVFv2Q/gILjm5b2Yu75mqcq2+0mfMckPVV/9mq+O11HEbXAJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603022; c=relaxed/simple;
	bh=VGvZ2McX4R5AmpM+aD65U//d38njXDMp/8lXGO8s9fY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcwGsEMKzjrVHKH/SY2tFQ1TpSoqDqKfp1NxHUyozyZG1LoU20QzX2mqb+4nmQydRxddXbDuj9+BWbj12lurTsSl29Ez2W49zh26DcldJPn66JLj/J3wjAMi2fx47yXZLpuUMAdkuGsZYD8UDthCH3rOsJcBTw7CI3mi45moJLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1hfraDg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1hfraDg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so1883005e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 16:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789603019; x=1790207819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RqA/0fr84svz/HOqoCjORMcBVPzXHKYkGVcKqp7/wRg=;
        b=L1hfraDglk5BdW6YWihQ50AqrP4vcNrcDQPMCeT55kTyhQfjquN0wS5bob4Almk6SB
         /ipLB6Ju+6KWkQKioXpu/Nj6DZUypa+8NwgIMi+osPdw8CPwK3j3oDMR+2S+UxhOVK2G
         tXlzeFWEeFBNnRQlhm5ehtdj7K1+PPtnMh6yo4MZF39AE2+9FJrx9tLX+sJGiLMxrGqh
         S6oGCEj16lNXyZX+LKwErapwpdMpO7Qi0R6dt2elaJiT5FVPL1DTnpGteHaqMXQ3RL39
         uj2bBIwNpRE8Pa4QswCYq9xm1DhOf/chjn2nTVsCIphNdF2DfmUzS5bzhCilFkncOzwp
         VqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603019; x=1790207819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqA/0fr84svz/HOqoCjORMcBVPzXHKYkGVcKqp7/wRg=;
        b=bL5NyubcRFzamSgKRskUwNNNhSK7RckWK8gYQDM/kKiv8yNd56iia5+fNC8J7tdT+u
         M5mjUsx00XRlqTftuFbWcmoExt66p4/WGpQrNGjsziejNMCEWzWOkhc8x7OKOsCbG8cO
         98ZQ3Q5JqJLL/6fCX79CRM2zAkII7frMgW3E1tPsgrNw55bZdTQzbrxl+pjwnQrTGvfM
         EVP27cjJjwSbH59cRNLAu8Y2tyxUerosszH28CVEYxpWf+2XkC7OqI7KYbD+nO5RJ5wl
         PAmOn5dcnO0MLP6u7RFLzMF5o0uX1wPNElqGqiIgMXrVvFArUN1sAjY/YFetbJtmAbdH
         4vbQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/1b4YiZ8AwIHHkB8GJhxwdgdraxGL8GvvgrJWsahuxdEqSvdgQMoNihoW3AmtGba5H0m9DEP1oB0bYX1N@vger.kernel.org
X-Gm-Message-State: AFuF++l4J1gFxZYisotBHYYeHfwP6MOsktVr08EGdLCl5VFgDfMpwOkY
	X3dq9DV/aP8zX5l1edYGrhQNj2llBqi3jdBlkSRjH1EpUd397hXLVOm/
X-Gm-Gg: AYBFou22Hcan1qB8hxLdJEeVCx8Hus0v0AHVBXLbw1PgAAEXxcQczn1ox2ZfqMRrE8U
	b5KrMTqNTgwceo6JOI90MkJ0BMesYWNwFEWszCNoT3T5G3EDnWey7sdQVLCVtPgnC9gniMYLnom
	KcLyTVJ0FHWUPzI4R9aZKcVXNpQVu/bz4l4z9z0l00nf8YNoDNzEUHwv9aG2kaUjAShCANclTYd
	+HgNYkZ2sVYBuptEhE/N6FMBaIp8K+WH5TtEAqNgRY8wkZ7ttU0cJTo7YNW/evjrJQjcpmanki3
	IMalD7xkumi7FyvKojXcq7UdGehSQxs/fCCqqncebM48N87r9859ur3gc1mDWZ6tF6EeHaAVjHs
	Zbiad9EkLuXFI0XTcNl5xpGd3lM98rRwOwCZ3s81u01ALSkfjK0ToZPYf3a8aHC8y0IEmCmv1IK
	cEyEDomncv8kNQRt9Yb1upmcJuBifCM7SD5mHeC1zyVHsJbRBhZycV38GvUs5398wnSw2Z1uv+E
	Jxs3y67fjjTeggjQAk4qMeahnDoQnGQrstjt7qclBQ04e8=
X-Received: by 2002:a05:6000:18a6:b0:487:b00:3853 with SMTP id ffacd0b85a97d-4870d16b717mr5872158f8f.27.1789603018764;
        Wed, 16 Sep 2026 16:56:58 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf33d93sm9643791f8f.22.2026.09.16.16.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:56:58 -0700 (PDT)
Message-ID: <6aab2cca.142fb78a.207455.5b1d@mx.google.com>
X-Google-Original-Message-ID: <aqssx5dMEgQaR1jD@Ansuel-XPS.>
Date: Thu, 17 Sep 2026 01:56:55 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>, Sashiko <sashiko-bot@kernel.org>,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v3 1/2] net: phy: qca808x: accept the active-high LED
 polarity mode
References: <20260915223138.321307-1-donggeunyoo.kernel@gmail.com>
 <20260915223138.321307-2-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915223138.321307-2-donggeunyoo.kernel@gmail.com>

On Wed, Sep 16, 2026 at 07:31:37AM +0900, Donggeun Yoo wrote:
> commit a274465cc3be ("net: phy: support 'active-high' property for PHY LEDs")
> added PHY_LED_ACTIVE_HIGH, but qca808x_led_polarity_set() still rejects
> everything except PHY_LED_ACTIVE_LOW. An LED node carrying 'active-high'
> therefore falls into the default case and returns -EINVAL, which
> phy_probe() propagates: the mdio device is left unbound and
> phy_attach_direct() falls back to the genphy driver, so the PHY loses
> every qca808x-specific feature, not just the LED.
> 
> Accept the mode. The register write below already handles both
> polarities.
> 
> Cc: stable@vger.kernel.org
> Fixes: a274465cc3be ("net: phy: support 'active-high' property for PHY LEDs")
> Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
> Assisted-by: Claude:claude-fable-5

Reviewed-by: Christian Marangi <ansuelsmth@gmail.com>

-- 
	Ansuel
