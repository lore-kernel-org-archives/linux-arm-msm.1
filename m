Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794783149;
	b=gDDfzaaDK4OYt+SRtME8nZkZo7uwmvvsA1KI2C5ZOnrHyon+V9RAVBMc+bQ5afWiiLSW
	 lgEXd+mLpRAJQCq91re2d4GvNV8gQyN90WVjb9IcRrDNCpeAPWWXcufFoFZEoK98b91xQ
	 bZrW8rfiKOfloSkThxk7sgm3E4pi2Ywt3zyUjvIwItQeJ14c7jBjYr045k9g1RTkLMb45
	 mqqXLx1SnlkGpIapb6KxY16Nz90gVM1TvYmfSIfk/IHUrGDgspXGzSh8CI2zf07IApUv8
	 SdfsCNNj6JuLjrF6BFmclJAMwFsJ2UMPv3Cso1Hwfr0pWoiYzD5ZcvGDx5aRGvU6A4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794783149;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=ElkOEwzqFMVazDgPfmPJH8YI8hCqGrmAc8l3kEGiXOs=;
	b=I48Kb1t8WnZSQdJhiClCa7WkGR1wUFpk1MeQsLd5mbUp2UDRQgMryHApHUmTH9XjSBbH
	 jDO/Ekhc0nu6+XHez7wXn45C1eEy88wNqyEzRoNeGVAqxcpKc4LQ8UPGrpOg3n0LHGtBX
	 Zr2er1vLUc1rxP0LZjJ5oyWqD4E6fxoodWhvzcllxMYrXLiaCgFvllIgDXUbrEGrZHHZs
	 DE0jhgNxrrCr3as6dgS3GNnhQr1k+CYOT39i8a6YlFrLvQNuWW5domzPKErDBOJ+Z94NR
	 iuObX4W8q2KSKH4ZCtO4l6fTNrYf+JoguKbWGxd6wBndD04UScuPoYAVnceo5qTMWUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FepVLd+0;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C530606A31F
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 22:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C530606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FepVLd+0
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id SiGZxOG4YVK9USj5IxsKic; Sun, 15 Nov 2026 22:52:28 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Sj5Hxe8dIb2qJSj5HxUjCK; Sun, 15 Nov 2026 22:52:28 +0000
X-Authority-Analysis: v=2.4 cv=A7tsP7WG c=1 sm=1 tr=0 ts=6afa37ac
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=1XWaLZrsAAAA:8
 a=GU_cOIP1yHUKzuPKd5EA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ElkOEwzqFMVazDgPfmPJH8YI8hCqGrmAc8l3kEGiXOs=; b=FepVLd+0XyTfhGfWi2zYTb2dCo
	mcQNf6o5gX92ChWdE+XflwR3p9AlWicMoCdct9OHP2k2u2zVi+K5MTgx7GhGGHY7dOefDzIYaebdg
	dpMyDyg8lePJdF5RD24oSuZXYDXHlknH3uB7FFc+GKO+WkxfiG9l2/SN3OGZ+DS970NBC6jJpZRie
	OFWj0YeaEPDIFvGZnQTObjZbzThOp/hfTWP+0fmqGujmtyNYOzTYKD2MgSudbGIfSTAVZmsKCR7QP
	f0FyfyVTHXgRhZrcFWI+75ky4G0XcS8i9P0+Xs++AguHZ2RKIFUUv8O1K0026U+UujKjuQ4pbmxwf
	bQaSnIkg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:50630 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSj5H-00000000p0X-0myw;
	Mon, 16 Nov 2026 04:22:27 +0530
Date: Sun, 15 Nov 2026 14:52:26 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Mayank Rungta <mrungta@google.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Marc Zyngier <maz@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	"Kirill A . Shutemov" <kas@kernel.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 6/7] watchdog: pretimeout_panic: Use nmi_panic() when
 invoked from NMI context
Message-ID: <1720d199-fc7e-49db-9c64-6733c75caba5@roeck-us.net>
References: <20261112031629.396819-1-mrungta@google.com>
 <20261112031629.396819-7-mrungta@google.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112031629.396819-7-mrungta@google.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSj5H-00000000p0X-0myw
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:50630
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 21
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIxrWtGeg2x/IikQTyA1JXiNRj368R0pP1SHbM7Ha6UEnmpLoly46dC3V/0gg8HCYv7kuiH1HOFU/aNjGxSF7aqvts8GCuvF29JxS6DbtcTZvF6zzprj
 89lqSD2jVDwpg058LHhVFo2hAhR+lrh+LvnhFv72EUOxFc44N+nrqXaqCyfPJllIC/Rq7endM4BUs1xa0Hg8bM75ARv1SVWsVZE9LZl9hIil8Sl3QtAGMDl+

On Wed, Nov 11, 2026 at 07:16:28PM -0800, Mayank Rungta wrote:
> When a watchdog pretimeout interrupt is registered as an NMI (or
> pseudo-NMI), pretimeout_panic() executes in NMI context. Calling plain
> panic() from NMI context is unsafe if the current CPU was already inside
> vpanic() with regular interrupts disabled (where the watchdog is no
> longer fed): vpanic() assumes panic_cpu == raw_smp_processor_id() only
> occurs when entered via nmi_panic(), so it falls through into a
> recursive panic on the same CPU, corrupting the static panic buffer,
> panic notifiers, and crash dump state.
> 
> Invoke nmi_panic() when in_nmi() is true so that an NMI interrupting a
> CPU that is already panicking safely returns, or stops via
> nmi_panic_self_stop() if another CPU is panicking.
> 
> Signed-off-by: Mayank Rungta <mrungta@google.com>

Similar to the previous patch, this patch is independent of the rest
of the series. Applied to watchdog-next.

Thanks,
Guenter
