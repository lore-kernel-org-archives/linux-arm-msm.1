Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334565;
	b=lX+pRXS+p0QQG3AcxNlhW+poPo7/W39tzHEkdOnQqjbgmCPjReNL+sDX36CR5ZhCJHuL
	 y0vy2dgUJSTdhJQf3rArwiV73eKJK1Wz+88luvoh/isZvg+DbeHiUFNGYxTWYp5Ip7/e+
	 DgZ1EuqBHFw7fq7QwDQ3MCBBe0GPOBJe4bzT804bsNFo2MQClE+dxna+y74k5pnjc4axw
	 DKikb3RV7SdnQflJ8AmaUVMAywim3IZ7XvOU01RHjNw3dKct0cWZ1duV0rLEIofXeD78H
	 hQ2cTtAOPGJ6ywvEdR587hYB8/BZ1QxkcAuP8azgRxeGEdwVqyiokA4jDi0AH9KkXSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HpeEYAEKyyCPvuV7efERlE4nfg2Y+m/mO0FuoK2R5s8=;
	b=toBDLp9l75nnT5NAJ33VGFDhXq2p0yVT+t1IsIAAW401bK6JqTsgDA3OdinP63K5DRKD
	 jJGGq06baHXJrxAoUXz57PZGxSz+LVBNEd26zfoQVrkK746p/3HoH5d6Hwcq6VvxhGG1H
	 Q0vLwsFJeczzWmmJAL9jFoBYEur5YV5Hhs90EJrGejg25TU5YEvyZ7LtopZ8C0ydJox0M
	 Xv2hgwNRcdLva3S+mpu62jqwQznMT877xBY/Ya3aVX51vwrrSF86dNY6uKyThBlgGis1l
	 j9j7J/C1xct+jlulWhH+8kuVmouKGhzlGrtSdSH7mSAVew+6EmBHUofAHNdf4IykPTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WQDX+igh;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D536606A331
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 04:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D536606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WQDX+igh
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so182672a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 21:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793334564; x=1793939364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HpeEYAEKyyCPvuV7efERlE4nfg2Y+m/mO0FuoK2R5s8=;
        b=WQDX+ighlA0CRmz6xmrYqh8MRT1ubdl1GaZNzjDEOOMFGhf87VDm+sHKrYM6Fhmnwa
         k1BQG2WiH3kKgXLfx0ooUDc3j7jwn/203Cx1bW1y2fQZiDeOouuBa0T/TShMksbhZjep
         OBuwMvKb5u0tilx2XrtW5cnD1oEjPyqFGs7k3IaEyQ/UhYHDN8k44zU6IVZsZi3pLsKR
         caAcsU4jRXkCdn7IvtSHlQi3HL4QQqDNxPfYNQkgqccWadOsmLZmTJZG9D/8fWsq8jnP
         mXlqdaAqf7J7PTynQsv1p3QcPa8hQ1h9j2/1+r0oG7RRDjqBnpH8rF7nhRB2Uil/0stu
         EchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334564; x=1793939364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HpeEYAEKyyCPvuV7efERlE4nfg2Y+m/mO0FuoK2R5s8=;
        b=KKUHEVeMiOm3zXNyFyiywwxVEbQ4aHr3bqb3Vi0nBa3NLybVBD/k7VKeKYQQMAtxWT
         0ZSHXqYA8BNFB5eJpwcw0CVh8G61RP+hKs3kA17ijMqkU8bZ9uyFXQJdIEbZ4EbM4iu2
         vtdc5RQVpFvLaST4eowD1Zjq0IUE7pguS1+iVfd1cUNuXaJXQG+7gHfOE9pSlNArVl9/
         pi5X3PxYOSq+uk1URvDnz+71aWOY4aBADpIxTFPbsCmmYCFKQle6zdwvADzaD6yVTKXc
         1yAKcBTXGocZT1b2WepnMqUxfKiCg9nZysVNx1AvzH6KCMVdLBtcCoPPh0pvpRRB+elV
         yCnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMNYleJoRZKvmSNxdjQiw81ITErOeFSFt8L4PrIq0TQb01yFhirzB+n6KoZIrkZFSp6Rh0TnDXxMv9e2fR@vger.kernel.org
X-Gm-Message-State: AFq9FYLVQ+b/vBAIAVOTm/XP2znCYz/K2YRC6JNDxIZzrfPL6dmSsBjm
	X6zIvyc4SVA7cWOiC2Ni7PFRapp1FlO+dm/aRGpeTsbQQ6LROnDvkXI=
X-Gm-Gg: AYBFou2P4qWkC7+7mOtsf3lEZpLxbBB5EpH4z7pUZSbV7FoMiw7U1+5diTya/8k7Q4d
	Egndo5121KAX7rWLqbM8IeIItmtzKQsdQKgWgy6z5mokGCwNY1ZC39BwresObcclBDVhp0TxUej
	0Z7XTCXjv7/JKiNfQCtgWv6IgRPGrEQfAHm37FRNvo2WiN588pzTP7s9WvVnpNOoDwAR4fAonxX
	H42wuboNs93dqAnLKrwx+TbmAkxbDJhXKIREuXjAcA3y8Nxx8XtsvmguFeq3Cl3IWNb9S9nlBDM
	FixA13P1FRRYh1SBPyGZqiTQ9y+SwNas3H290bnGMwW8GZVFtNFn1Syi0ju5I/adcSpPP09zOgJ
	QFWGue3MxBnjlJlVMI2putnSJtjkIAhWRLVoGXv/Una60wHxwJQzV9TUMy9owGCADhDhOtUpyG3
	Gb7bi6WDbQIsfwwUkh1GCm9LbrmIoAhNI90zkxNaWGXRs8GEp30AGsRqPrQ1ztqZE9VoEwBqvx5
	NFQKNaBfJm8CJjrREDF42nfJdyDppZgxAq2K7XDQ6yi013nTOIFu3eKXkbSlVLLmmGhXHsVYcs0
	lVCLHDNGtOyGHjCRZ9z7NF2PrU7MHM0Qjvz16Bo2G9ehs1e8TzSAlFR6D2eA6a0D0+2R
X-Received: by 2002:a17:90b:268a:b0:3ab:b39f:41cd with SMTP id 98e67ed59e1d1-3ae897ddd43mr857008a91.60.1793334563678;
        Thu, 29 Oct 2026 21:29:23 -0700 (PDT)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8826a769sm606067a91.4.2026.10.29.21.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:29:23 -0700 (PDT)
From: Burke Cates <burke.cates@gmail.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	dragon@radxa.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 11/20] drm/msm/dp: Cache eDP link capabilities after successful discovery
Date: Thu, 29 Oct 2026 21:29:00 -0700
Message-ID: <20261030042912.2745609-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261009-msm-dp-hdr10-v2-11-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com> <20261009-msm-dp-hdr10-v2-11-1835d4966da3@radxa.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 09-Oct-26 11:16, Xilin Wu wrote:
> Discover eDP capabilities from connector detect before the first
> modeset.

I tested this patch on its own (not the rest of the series) on an ASUS
Zenbook A16 (UX3607OA, Snapdragon X2 Elite), on v7.3 plus out-of-tree
Glymur platform/board patches, which include other msm DP changes.

Without it, msm chose the eDP output bpp before the panel's link caps
had been read, so the first modeset after boot ran the 2880x1800@120
OLED at 18 bpp until a DPMS off/on. With this patch the first modeset
after boot comes up at 24 bpp, 4 lanes at HBR2, with no link-training
retries, on two boots of two different builds.

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke
