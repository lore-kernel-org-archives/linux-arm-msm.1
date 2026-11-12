Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472306;
	b=BsctXgvYOWPF2JiHyuQqOHGeHC3r6iSz/qKhmoFB3UqseLQCdjmgaVcWJxbJzS2xzoU1
	 Mbo9RABJF+gT9R8n0Ps5GkxdnV3T3EEZIZaqm/MPpHg7ArKAapisojPvwezevMPH11Uht
	 X5+Vztkd2AFjxFh0u8zSHyQypzlUsqMXcLdW3pFPQlnhQViuhXVG5hXQKa4/RPcUOVRTU
	 2FRqxlO/fZVjjqO1ucS8kVfgwCNRtPEvXyzO6sbFKyi6td2Fcpck+6MZX01MWVejYLxkF
	 NqOmVy733EC4/+pVSwU1RsPpPh1QzTDMu3l4+/KuTLkiZIwSf3/4/BRFMBEhAxhaW9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=dDoN/lAt0XISVjDE3JROfi6pDhcTMzVIBmoJNktRod0=;
	b=BsGtZ4s4U/5HCyVjQmLwm1ZKjJZsyKhT3sdNF91Lco9jLrDbShPfEbWIwgIo+R+UjaBk
	 OkF9K1GCunoIPAOM2EGjRGVngGopSpl5dpwHrrO1KtLkJ39qPaRllqodQOBsoZlBbo8Rg
	 hXW+FFGefTvKuvjbz3mG51U8c6W3NvjgFAvVOVx27//AqrBTmHH3eozh3qEQyAVgjy9tm
	 3DJSkCeVcnSowesdl15gEcSjqhvSlWARRZDs/m3XDovgdSJaJbW4kwwrTkRx6nZoc8F1K
	 jo/rUvIRMOpnueLjJuDB+gp5XRzQXmUlfIuUKVShKEAEuiGSdhBe+T+tjhkot0GZyxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MBSDcAF7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B415606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B415606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MBSDcAF7
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-679aeeddc6bso4889154d50.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 00:31:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794472305; cv=none;
        d=google.com; s=arc-20260327;
        b=EtMaZ3XEQYHIeubZe27jmjRzTxbMxYT/wvkRCOUgNn5ITPkOsCZ/lf0+CVRDKqq7Uo
         hSOUXyNSddQenbrhIp/a5R6b/oce0tboXRr/WRwnbI6mPuS7mlMf7iDtFmxewHqeyKDE
         1rD0W7uI0nBIhE89Fg3WEPvT8iVq9GBuQHWPLtJdW/LLRcmywdg12DKbIgOYFLezJzIk
         eHhU9njSHJf2OacBIIaxphqapyT0DSf+qgRpfWRpu3PNTrvl2uB26okl21YWo2RdZQAH
         d58RfMe5V5vhGOhEYXr/srvLGEqIWfG00i4W15RPOSacqIL8Xgs4B7p9DZ1QnVftHm5k
         0phg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dDoN/lAt0XISVjDE3JROfi6pDhcTMzVIBmoJNktRod0=;
        fh=gKcmeyW4Hc7Ylr5t6A8FjFoEMMu3L7XejEyhF8Wxvzc=;
        b=obu3cbwjjeDd06NJkZ3Qn1VVsACZSk91ZsC/Ddq1ym0BKTNYx1j0TVJUZ2i/iqcLVn
         T/oF9x37Rft6MM5DejF3gKtHPSdN54KhMJq2hKo239LAuuwrck96mCGLIBA0Im0bornm
         j9kEvSpD5UM4CsrmR7srKsYAHzKPjISbhm4Dh22JDV83tCLWmAuShToVKh+Z5FnT9IHC
         6NTWABoE2SI6e/TMws69sJiX67iGLI0RATkSSLbhT9PcrMhxfdQIqXXMu0KCMMYVGxH5
         79ZVE67zrKwPr87WdX1L8pdXUozZ1UkXQvxoYWIjY9dwlx1tM4VP9u+ArAEG3Ksp3k/d
         6uDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794472305; x=1795077105; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDoN/lAt0XISVjDE3JROfi6pDhcTMzVIBmoJNktRod0=;
        b=MBSDcAF7MGx0xsa6fDSfFCfQgy7gg36BMR5jEYGr/pKXDJaKawo3rC7hN7kcgjeL9i
         UrkQ8uH5HeVJhkBfSAeA+9vbIbuS5hM6As4TQ8ZOu2MkChUuMVduHx6p4bVAvk8OhbbX
         V3rAKt0LeQJsiCxOdonCSIOeSOuuzSiOKSLJRvGKbyJJd+Hi6fJFoL343Lxw2W77KL8I
         M1S9fsd9e8z28NMC2dJlVDsVVGIgnyLs+pd0YI4m0fPt531BJVkFAv0Ogld54hM2wsPf
         124FWa8DtiDjklT4guuLfOYJs8JB+LeCjOFqFvZ/MlapFe0lq6nobUBaymHeRhGjJBQi
         T1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472305; x=1795077105;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dDoN/lAt0XISVjDE3JROfi6pDhcTMzVIBmoJNktRod0=;
        b=oQ4dkd6CgfPMCYbC2gtEZ6TQ/Q4Vjf6tovImQq6xnqfxsfww6xrcdAXJPkjyNqX2UO
         YPWns5t6/whOkN5Z1DNZmdAou+88WVALSiISfT9NmS6Wi/lZNYfNPYfAfR9WUoAmg/kK
         LgMsNiS1qO0LpHQw00+x3c+HB7B4AWfl8Z5j3y+MUb/jgQ9helivQ4VLi8kmlfqiKuhk
         sNBttqXJViRrJM79OmUmaGZgDt5K0UWxxmSf/xl2xEdGTIhPMLlYARokVluWADJ8Bfc6
         OjjuqHUqQMJvSSF6hYCIRUJwxOFk78O0diGrWBpGWdAMwSVMbSo6DPAf/M4U1J7GQEO1
         /pIg==
X-Gm-Message-State: APuU4Z85Xzf63MNCSBpnwNkhncitMxa/oKDa/0gZGcNKc8mMUEv2rtCO
	sqmZ1CRmYV8RzMcf1iLCsvV1SKQ/lc4i+zH+frFP6504DgDwXxUUUzvzpeVo9BgfbcbDY0CYRcv
	YrTWHH4rZO7X16MOfbDWtP2TafziaG9WRigwCR6NFbg==
X-Gm-Gg: AYBFou0AeOa4YP+Z8ePbS5T/5Bz86xHWbLm3HLkQXiIWzvbe2oN/8n6UwstDzTf4kwP
	09kZwpaunD3GqYXzvGAPwGywZaLPfQrGQSOzFddmGn5l7M0j7LOgPvdR7eHjMOHizBFll6S4Erg
	/8TN3M24jpfiPmCtp+D8t8LGCJT2JCTkSxcSThO6nZIlCpfko85Y3eyVAVBml1+ft0zJ28bFJIK
	gKw77HbTqNdsXCo9qj81dQrVdQ1IiCTJQ7JBNH1eQUlaHa7RLfS1TrI0BZAH3TUKTVP2KnDu8qp
	upAEIjiHKkIPG/1uBDiGDI4NRayIhzk7BN/MDjfaRKzWpOr9x1NPyANCnkcRiqtyNF+1NHmA4II
	Ff0p4l8X+HXAIJL20fsT7VkF6SExo4fbGPECsxZAthQ==
X-Received: by 2002:a05:690e:4854:10b0:67a:3a11:cf1e with SMTP id
 956f58d0204a3-67c67dd23a6mr2010175d50.7.1794472305113; Thu, 12 Nov 2026
 00:31:45 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
In-Reply-To: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Nov 2026 16:31:33 +0800
X-Gm-Features: AclHuK_yCgsU2Q3_YXqrKmP99Rsllhkisqq8LiDMqSYcA-wB-d8VrImq6J8CDlA
Message-ID: <CABymUCNmJa+9tvTtnJ1jP8=_sFYKJ33ZkowjMwmLUYOsG4GKdg@mail.gmail.com>
Subject: Re: [PATCH 0/8] drm/msm/dpu: Support dual writeback for quad-pipe case
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Missed to add:

This patch set is prepared based on quad-pipe patch set:
https://www.mail-archive.com/freedreno@lists.freedesktop.org/msg47513.html
