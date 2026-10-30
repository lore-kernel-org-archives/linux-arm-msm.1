Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.236.121.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352363;
	b=FZZY8ImzNYskPT4W8crji0s4aC6MqJkJG6jDaawDChTe01xOeAQBOXj+DZzM9PeSMXFL
	 WYyV51TE3cd9Te0QDIpgi0raad1Ksdl7HwPaAXx8bqJQ2Q4/bsA9oPP62w2pCfyGfmhUL
	 7T3dUIVsIxO9CF1cVWAAH+yClcsX9NDcdl91QHkC/bsPact7j8aAYjHxh25HAM9FHMccD
	 P7x9ycXytKxKt7s+OppXwFOmDcn0a6qXUbsj461udGrgbvq0V8JMQ1KHd659kBTLg7QnZ
	 G53CEtmKKQkd0f3qccDtBQtyjCKTBQBjpTPuF9VxZ5PaPsAfOSpAcvjADu2G/0YPHjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352363;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=AV6l8V0MXNjptQC3bitgmPWMkuz0AafRUO/XZ5Ldxf4=;
	b=E9rjMMZwEz26IbWUyawXUfw+t499B4mhJAydPk+f+Oe9fgZorxAJCVYgmi8RwyfkAbdq
	 SSWuJQ6Z3qXG/Jnbl6aV+Ohax/WqRvkKpI6IcfyNQt1ovuEpjOAa0Z3D1FhBVj9MSFKck
	 axtRQa1NkcWldDpaXZAhP2jgQonbCAklYwrxwoxS0HUXUDlwpX6SymUqZrAA66FzypSGS
	 2XNCjWKwDwhPNLCgAn7/dVcVJQ8U3SDIScWZuuw6IOfWhbRZhQfUIm9pmFGgxKIbaa/a0
	 VI7X1hPRCl/R6NzVcCK5Z0R0F7dZmf9IfOFmr6XF0TY1JbuPhIYzk380XtyGzE1i5Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thundersoft.com;
	spf=pass smtp.mailfrom=thundersoft.com;
	dkim=pass header.d=thundersoft.com header.i=@thundersoft.com header.a=rsa-sha256 header.s=default header.b=BV4ItemZ;
	arc=none smtp.remote-ip=115.236.121.165
Received: from mail-m121165.qiye.163.com (mail-m121165.qiye.163.com [115.236.121.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0703606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0703606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=thundersoft.com header.i=@thundersoft.com header.a=rsa-sha256 header.s=default header.b=BV4ItemZ
Received: from ROG.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52ee543f7;
	Fri, 30 Oct 2026 17:25:48 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: m.szyprowski@samsung.com
Cc: Laurent.pinchart@ideasonboard.com,
	andersson@kernel.org,
	andrzej.hajda@intel.com,
	dri-devel@lists.freedesktop.org,
	hongyang.zhao@thundersoft.com,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	linux-arm-msm@vger.kernel.org,
	luca.ceresoli@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	sam@ravnborg.org,
	srini@kernel.org,
	tzimmermann@suse.de
Subject: Re: [PATCH] drm/bridge: lt9611: Don't override ADDR strap when strapped low
Date: Fri, 30 Oct 2026 17:25:27 +0800
Message-ID: <20261030092527.131154-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030074518.516993-1-m.szyprowski@samsung.com>
References: <20261030074518.516993-1-m.szyprowski@samsung.com>
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
X-HM-Tid: 0aa18c21340b09d5kunm5772b0bcae8a9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQk8eVk5PTkkaGUlKT01CGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=BV4ItemZ+Xnop7V3RPgdwKTM0L0gJEJ/FrmBcse5yBiO2lLSFUVFvJ1LJ5NVLN3eAHw+cJBZRCz9uktLHyzrolyGC297FoVZPyRsmTS154RX6tvMrMyvbGRWxTo9NNcsAvuOA/24p08GliLzVL9vPPJwm/3+fDqwur0IbaY8lXE=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=AV6l8V0MXNjptQC3bitgmPWMkuz0AafRUO/XZ5Ldxf4=;
	h=date:mime-version:subject:message-id:from;

Hi Marek,

On Fri, 30 Oct 2026 08:45:17 +0100, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> lt9611_sleep_setup() writes 0x8023 = 0x01, which overrides the ADDR
> strap and moves the chip to I2C address 0x3b, and then configures the
> ADDR pin as an output (0x8157/0x8149). On boards where the pin is
> strapped low (address 0x39, e.g. Thundercomm RUBIK Pi 3) the chip
> becomes unreachable as soon as the bridge is disabled: all further
> register accesses NACK and on resume the bridge fails with "power on
> failed", leaving HDMI dead until reboot.
> 
> Skip the address override and ADDR pin setup when the device sits at
> the low-strap address.
> 
> While touching this driver, also fix the misleading error messages in
> atomic disable path.

Thanks for the fix. Tested on RUBIK Pi 3, and the patch works as
expected.

Reviewed-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Tested-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>

-- 
Hongyang Zhao <hongyang.zhao@thundersoft.com>
