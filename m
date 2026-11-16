Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853783;
	b=BBO3sqhkbZMzxZDvmw6JeYxQ7zYp0F3kzcOolaJykIVXabICzfnla9FogXKkslOIspS5
	 PKtuhIlHogDJIZivFx6Qo2G365M423C8zL4u3sQblhZqiphcgdmhNbs58WvzYbRz31yZM
	 KepKr2Za7Stid5Ys5y0c/MGkC3vm+UKOtsiK/vpn74TmPxQs5lRzHGS18KSeto801DYyJ
	 IF+lXTr5wQULUALYsQYR0RWBl98oJ2a4SVFMd8prYQihJCbmWQZ0R/ErIw4atm9yU/MSY
	 Tshb+/cgXOFhf8ITq78hjW3gWo0O+o5warq3+2ttH64/KJ5xxP3y7dxxYTAUkUnlRVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ohJe8BJBCDffCZ4MuZ0uQ527x40SLHyvNrdc9OJlZqQ=;
	b=0lQISmhA6LY7g43ULawtqHG52aa/I5UAslTpob8nFBHY2RUDtB65vqrGlxnRdngpQR3B
	 NUZ5ve3DV/S/Q2VmtNt626lS7aMAxFZMKlmNP7d1BjvJt5qe2+iskj++k1AV8THzNLHyM
	 oGHMFPSISZ0nea27043QmiGPSvDmRkuatbupXK+9WPJbL6GZ+aYN6+h+m1CEv8/pXZ8JV
	 1i9kE+yhSScyhv0ZKEHFqpaVmV+JceCBXbAlbI3ud4f1DXROvb6/XkYggHxOolRMlFpgV
	 AGyoS15OhHW0BF60r4FqODgD71g/0A1LXHtOaiVom8Z+e9fgfVB1kWqRq3x5GtYxwJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UFF1nAp6;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2086606A333
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 18:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2086606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UFF1nAp6
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so30090775e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 10:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853780; x=1795458580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ohJe8BJBCDffCZ4MuZ0uQ527x40SLHyvNrdc9OJlZqQ=;
        b=UFF1nAp66FEYrSP1Ai6hOAAcyk7zYvUl1WilpmpZ7iOinYDf68RS9oUufkPwpndgA1
         hWvO6WCypFAzbra9ZgWw/8G8xE14b7rDYSVuI7nGqbYzTAyEESJN+dKkSYMH9opZ11b7
         zJak45y8uPPFoyZ8+E8ZZEttxH/VBgANsjulmRxrVus9cVr0CfSe1otD36bkbP8+YM6L
         W54Wu+ucJhZU1xC6QuDeRUO+wUBNURQ5rgNTSbx9djTnO0KYyW9/hYcWylLuPMEf73xI
         aGH4BBiU6CnhcLgVv5VpT9kbUSNRlYfAZLHHPQK+CiO+9QmK3Cp6iBtp2Tg/YQHe1AgL
         vwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853780; x=1795458580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ohJe8BJBCDffCZ4MuZ0uQ527x40SLHyvNrdc9OJlZqQ=;
        b=2pt6KGuH+oqyML1vwORmqieUJvSnSiW8bFhEEetCGn6NQnkBPDbcmpPpMSPQAq+lRq
         DsXbS+sLSMchrQgwMRTDQZcsDoCDaizSzso32LXqg2iac5WI7o0lfdfXA9Wx38hq1Jp1
         sF2BajDQAMxTnkrmlQR6ZlHHIIXDE2LSfI1bYMiLq/6FZxcxqkzwNbHDegSx1tIC55jX
         hJ6uyFmzLe0k6viHRAYL78yf+f9z1a2vuFLcGUf/xug92+x/bDQBftsrqPvGCD0MxGlR
         OIoOgTnbkicXWn31nKWxML7olNivLpi7ojJGUaDe+58LzMf03yDHcP5wxamdpLEGuh+M
         J7Rw==
X-Forwarded-Encrypted: i=1; AL+hErHpZyRz8d2OPopytAuJ4bYC4aicSUFNGbmRKxR3kMZShqTg5E+WuYm6S9ch/mIRuPioFBoSUOY0V7r8xwIi@vger.kernel.org
X-Gm-Message-State: APuU4Z+ETdMo5wyu5PiyIWpdLgW+RV9yl0WUBqE1eMxqsy2VeCRFam3J
	d6TiwpPjqtKexXycfC2mij/CGYs8Py7tW/BxNLrrt6RIi/5AjcP2xS5N
X-Gm-Gg: AYBFou2OCrtAS+hZ1mYGx//pwxSp7BgoEBgHBeyOImBLGI3lqxd2jTgCWxnHUjweApW
	zGyADlsex7zeQ/GkCFSQrKB4QPEO9evObe5SDIwOimJnvgpwan8ognl/Hc6jC65Jl5LNJyda3sz
	wqTzfMle2Bhyt91E7Ci50JupUVXwXRmpEtj7jduQ/sgd+Tai7NuVacakr93oZCqRXI2RpymDbzm
	W9Oxyon6U6mNsc/rABhNSpkaaWPONzG1proY8Y+J7IE45LhMwbwcMt4/qcMnN/ZnTIsLosylyI7
	PURpyy+BAFdHhRVjWu+PTBWRebMU/RdfcDTNqqvJN7FY6hmhRcWXQ6NzigipuPZPRIolDBIgBug
	RYjibjz+TOSmdHKUraZ9R04OwPk9MrTaHDIERh2+OJ/ia9jyoRxyRt+yr39MMlhfSJYBI+s3j+o
	vwW61VDvuVg/WHT7DQpOlZ7T5zUDpIDRImpCH3R7+KSKL8ufWZFqsVPPsJBD+nK/iZCYwTZvM0x
	/mn0aHkmbs7IgPRfk7njlp62bhqupoMYJd3lMCfndITCf0H+5CPhLB/3gs9KoEGNOQxIjnrSyhJ
	CQWeLdgaFknlrk/agP6zNTBt/v57tBZu3xo4qUhpXNML4R05Qe0=
X-Received: by 2002:a05:600c:46c9:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4bb55a5fdf6mr254839115e9.17.1794853780298;
        Mon, 16 Nov 2026 10:29:40 -0800 (PST)
Received: from [10.155.107.148] ([147.88.200.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783965d4sm7171285e9.7.2026.11.16.10.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 10:29:39 -0800 (PST)
Message-ID: <1b7a7d94-e349-4f3c-b973-c365041c15f2@gmail.com>
Date: Mon, 16 Nov 2026 18:29:38 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] drm/atomic: Try to make atomic+async usable, and
 clear up the "async update" helper confusion
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Christopher Snowhill <chris@kode54.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Huacai Chen <chenhuacai@kernel.org>, Icenowy Zheng
 <zhengxingda@iscas.ac.cn>, Jianmin Lv <lvjianmin@loongson.cn>,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Manikandan Muralidharan <manikandan.m@microchip.com>,
 Maxime Ripard <mripard@kernel.org>, Mingcong Bai <jeffbai@aosc.io>,
 nouveau@lists.freedesktop.org, Qianhai Wu <wuqianhai@loongson.cn>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Simon Ser <contact@emersion.fr>, wayland-devel@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@kde.org>, Xi Ruoyao <xry111@xry111.site>
References: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Erwin Springer <aot.lerwin@gmail.com>
In-Reply-To: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 16.11.2026 um 10:11 schrieb Ville Syrjala:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> The weird uapi semantics of the atomic async flip support make it
> really hard for drivers to implement. Try to fix that by filtering
> out the no-op junk from the commit that userspace likes to put there.
>
> Also a lot of people are apparently confusing the
> .atomic_async_{update,check}() hack with async flips. The two
> are completely orthogonal, so try to clear up that mess by
> renaming the hack to .atomic_bypass_{update,check}().
>
> TODO: atomic+async is in serious need to proper tests, somehow
>        all that seems to have gotten skipped when the feature
>        was added :(

thanks, this fixes the KWin case for me, so my patch is no longer
needed..

tested on Raptor Lake-U (Iris Xe) with unmodified KWin 6.8.2 and a
fullscreen client that requests tearing through wp_tearing_control_v1,
without my patch. I applied the series to the CachyOS 7.3.4 kernel,
the only conflicts were the renames in amdgpu and msm.

Before, none of about 350 frames per run was presented without vsync.
With the series 3330 of 3336 frames tear over four runs (with and
without CCS modifiers), and the "async flip not supported" message is
gone. What is still rejected is the first flip after the modifier or
format changed, once per run, as intended, and in three of the runs
one commit that touches the cursor plane, which can't do async flips:

   [PLANE:146:cursor A] does not support async flips
No warnings and no flip_done timeouts in the log.

If you think it fits, feel free to add:

Reported-by: Erwin Springer <aot.lerwin@gmail.com>
Tested-by: Erwin Springer <aot.lerwin@gmail.com>

