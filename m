Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669990;
	b=AntVEX6+df5dpFqYCJ3BJkAt3Gb0hvCAuYrkBw69cRcHdWy0Z8FR4yfqFAKr4HXCpxgl
	 FyRNi1x+qFYUPxkgL4M7Tq98p5w8UZLtVWlvCrq0kCTVhNypv54OxX6heH4i7ywQIHx+Z
	 yKfxJctYbS8xVJZ1t3U4ytlAo7E7pzSwDduLW3kdUWG5wVNT+YED/jgdcpD1/l7KoQZku
	 COf7jyTCl5qrPybbF6dCzaBqQrja1KvgtHb4I2GNr4BRGkiWedSdmO0r5HnhJGT6VJYNi
	 jnZaoDSmqd+AWGFCAHy0iPSIlfRLKmru8f4OiNKyIXoLCUnoQMADY8EVwWmWhOiqa3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669990;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=9Aa5FWZ3lqZe9cmPq0WeTHweZ453sW2z4AKwR8mM4Ws=;
	b=Od/k9DGcwnzXRnxqYvkaNwfGajXzJ/uLhBZI95+C1TYoXurd5WcAtpmOr8XC1YAI8RWN
	 BtgA2e0H+vLn22KtWRm7m56N4CM2wWTyuk0OfEGG+Drd2LjbP1JLH/npWigpRQSLLLXaN
	 3JfiiKuedsBTdumoZQOzzgIxTA2j/6BjsLTttD0tfMMjPptRW0Gdq5lsH2inDSaKmqtYQ
	 47cMEtCCYqRHzu56BeMYvqRk7tR79clCsHeRKalmxUsWQ2PufoMc3lTbeTrL0yLfMxt7B
	 m002CWkYiEEAEe/51IAA/Sx8VyuQDxyWR2IU8EiO9ydIO439wxz2M5h+kpoF21h3C5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=d5FF3TuT;
	arc=none smtp.remote-ip=95.215.58.200
Received: from mta1.migadu.com (out-200.mta1.migadu.com [95.215.58.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB27606A324
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 01:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EB27606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=d5FF3TuT
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mNEuaRcpsX0bT1HmxTiLkgvZnDYXGr7bXi1UzYrBtz4=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793669987; v=1; x=1794274787;
 b=d5FF3TuT2Zu9DYOkBbs09Xg5jsT5KyE8npDhSUb5pudzo3Fh5x/9w+YpjGyvLB7oHb5TvC3F
 lDCknDOSNW0RfbYNLKpVH6EFfJbYlz/ApX5yaLSL/AdSW5rQ6CmPVKvTgh6MHzUHpo6qSLT0ui3
 NCioOThCNeJlwfBSdoIX25uzM293+pSV8BgyKvu1L7HvJug5Rm//4AcvtaAXUb/qMXJfzYQh7ek
 9FLSSLz4fODeBkn4YuevTHpbvQqcQCitlVsW00D/6OWAaOGk27r2/Pl8C+Ekpqmc3Xo2a973Zr0
 lygNrxNrnlZeo+kKa/5zRGreundbZeK4rbDf3vvifDy2g==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 59de2e7479788338;
	Tue, 03 Nov 2026 01:39:47 +0000
X-Mizu-Trace-ID: 59de2e7479788338
X-Migadu-Flow: FLOW_OUT
Message-ID: <07d29a8c-1caf-4041-8c01-845a51d11a68@packett.cool>
Date: Mon, 2 Nov 2026 22:39:40 -0300
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
Subject: Re: [PATCH 4/4] drm/msm/a6xx: Import a680 hwcg sequence from kgsl
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20261103011358.65398-1-val@packett.cool>
 <20261103011358.65398-5-val@packett.cool>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261103011358.65398-5-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/2/26 10:13 PM, Val Packett wrote:

> The initialization sequence for a680 differs from a640 in a few places.
> Match downstream by using this a680 specific one.
>
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 56 ++++++++++++++++++++++-
>   1 file changed, 55 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 6c154792cb07..48197a54984c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -9,6 +9,7 @@
>   #include "adreno_gpu.h"
>   #include "a6xx_gpu.h"
>   #include "a6xx.xml.h"
> +#include "a6xx_gmu.xml.h"
>   [..]

(As sashiko confirms it's not a good idea to try to write the gmu regs 
from here, shouldn't've gotten lazy and assumed it would work anyway..)

I can make the gmu driver write these on init, but would like to know if 
they even do anything interesting, and whether the entire hwcg sequence 
is worth it…

