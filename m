Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879317;
	b=i1SKoi5WCzisUTfMlcP/9DfYgWU27cWo6X59yXof8uZO0B9gbEdoUZbCbD9Za3AL4QZo
	 /nE0YtDqUc7fgAk9Xkoz9jSa2LFCCbLaYQHNwJj6nipyqvC5RmxhIxAMwSGAt4T5nHsAU
	 e2iJInt+wNy1TdX974XcCwnj8a8ViqoVHhr9p9zveitcfM+WdXL4nj7RSYvk3cOi2EhSG
	 JrtzSi4ebBO0AOPPpdMYxk07uyh+03fEOlI7buyXYd0pzQgI7+Nsfxl5EJycaKZ6PQp0X
	 4ji4Jh57+I+JVOx5W2pCGUQE6oVPXAT1NKnjfcJGzbI5kf/enQQ0+NBw+t7p7fDVwpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879317;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=MR6tfuaPqx6X1tSqqMXZMCaVWj/hidvj/pZlCig8WlQ=;
	b=GH7SP1nKx+H0hMyacMBH0HB2bKa8RpyMyZKLiuRUf18IUQHTHWlvZhuJmwLu/nS7v66c
	 Xc3+WKQwuWhsE7RHY0SIBl1ozhncLf/FlKo+LKls47ne2m4zgoJNA5+Xs87M8mm2WRVab
	 QSsXkx1XT1He4OVEtA3p1HItiPVEkRn0kj9FXu0fDrRYFwvOOO30DbWLU70cbB5brjHr1
	 rYDH/wVl+ugw/EzhN8Fjpe0doW7kSKyDsz5B6hlayo5L/HHP+lnbQmzeOHBOSW6zfM/1P
	 kEP/B3cWMHVNHUsn1nAjkL0UROpuZH94W+xuXcFNtEfPfSR9DAf6iBeCSYdLLdB8DUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Df+mS7x0;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A92606CE84
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 11:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8A92606CE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Df+mS7x0
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8B5BE4E407D8;
	Thu,  5 Nov 2026 11:48:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E2D15FF85;
	Thu,  5 Nov 2026 11:48:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3165010329271;
	Thu,  5 Nov 2026 12:48:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793879311; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MR6tfuaPqx6X1tSqqMXZMCaVWj/hidvj/pZlCig8WlQ=;
	b=Df+mS7x0GrBZLzcuyMUY7BdqYLkgB9R0tV6DNOBEMiDkO59W9Z4DLRp5foZ87YU8WTE41o
	xNOCp9bejflAijHycxUU75X+rZiV3IZW2ob4MTIl0v1n3K6jAx39Bjf3fxV3kshrJm+4Ln
	iOdt6Pe5oYkZUWbBHP321Kr4YHsQ3ctZUyxZMPb4GYaoBvhkbRgOV59OeKiP3JzfURit9S
	Dheo83dfMJJrPwrRZ87mmA/0IvSv0JpuEA4HsilUKBMtPD588cVwlTHpYFXXdAETGbq4PF
	KpwSyjqwp6Z72lyI09bKsdGTlBYxJkKGozfNu8VTItYQcQ+TSgY/T6SKvGA8Gw==
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 8/9] soc: qcom: pmic-glink-altmode: pass down
 HPD_IRQ events
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-8-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-8-6ee949e7a384@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 12:47:24 +0100
Message-Id: <179387924496.1025980.207023547129772297.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Sat, 24 Oct 2026 03:35:24 +0300, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side.
> 
> Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
> to be delivered to the DisplayPort driver.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

