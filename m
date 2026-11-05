Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793919591;
	b=lIWXfz4eA1eC7+srENrWZzW1jXAFi5tdB7FYvOePqBQOAgxeRrxl8nBPAt0QrCj924/i
	 HNJFaW+pn3+KGViuJf3swYH7Mt9TuCBfiyeLeTA7Zg9AxEe0g+YFwktBncGvvcdkunVjM
	 D47uJFC1OVPNGhnICAvoM3Fe7UI5vYi4/tghqSB23Ky3luXfDSJfjC53cwAD9/AgXDKFl
	 hXzID8WYmt8+e37WAwCxRan5fCuxe6RBMfvqRFMp60pSBuEqgDIzZupZF8rdyhzbgGsMM
	 gUlxcrZv8S5tsl8hTjvushFfJnW3CoAiZMR1G6dRM6w+onMPzfw1D3830lUGgbbXgtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=RrHtlwl+AEhIC5xfPPlTatk3kWQjUPqvdwoLzmNPK+8=;
	b=Rg7qF4HeHZAbvL+XsR/bwpoAfNllQxxOMh4WVPFFx5H6PQrwalCdr8N1D1g+9pCrlPkE
	 PFo4jbJA1CXKrDmIEgH+TSpv3L8jtjKfaN0b/NnIX7v6z6KXXpbo8LTlcFXegLKC/F68Q
	 wwcAVTHTa/bnDbpDaIHSKGg44m201DYIxVRfQLSGl393f0TFqHPHlfON/0Lu04X6IhnZ4
	 ENny89FvCIWGMDhmaG+RiSmzG+urmqlpb3GJsFtIUC82RrwbYEOuQuGnPOEs2m0xNGRU4
	 b3lP1Mnonez2pJ1/+oxpNaqM56pE9NRnw3jYuTtKAh5m9q+sNlMXFGrXEusWxZnkvmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YWQOh8dC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C31E606D804
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 22:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C31E606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YWQOh8dC
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bfc2ae6e9dso48515e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 14:59:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793919589; cv=none;
        d=google.com; s=arc-20260327;
        b=dpwSfx89CddhSzc9SeCp26E/6ATjaWPcWvaB6H9OQpW5Eb6RKJaEOZbb9J/Rjjgn6M
         VM7ghjeZ9h4N2rmUC4lHBfot3+e74UpwQ6NrQfNlhdjKNvj/GmI2UByniAru3kxnnppC
         T1wqt3RVGdhjlCvQGBbNxYIOhPqOIqnt7X3RIVpBPpIgTe7vRliBlb8qT0UseJVxyHP3
         uHuEoiDOm3wbTcIXv3C29k1jpMBrp+mHl82DYmNIavGl9Z/7MhNzDJzSw69iVDZZLuva
         FlIMI1j53PZlCspzLVKKBtdcnYKBKnNiRb20aiUr0RzQpgAWPADx5/LisqMzFOuqiyIa
         G1fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RrHtlwl+AEhIC5xfPPlTatk3kWQjUPqvdwoLzmNPK+8=;
        fh=AWm55REp7RproGQiOVae6ENCic3YBUkIM3sIyNMK3yQ=;
        b=h4fj2uCaYH7gkqZyDKaTy10Bn7y8v6h7r8wtSAhs+C7K/93eQfp/ulzTf4xVyto2Dm
         TqdJ6H64xnTxhVc2kdYsaRQxplsZxBQ8q9v+PG8U//++JURjYr6Wu/px1D/uIbzDM7wL
         hFa7+UQ05xDhGXPgpeAopyar32MD6QvvQWLtJv9LaSDVKCLdrU46Ll7+NVWAeEWwBoNl
         emxzPL/wsQBmE2XPYSQF4F7D38+YckkXw16Er2uoZkGwDa/VK9ON8r47D2rhIX+AIPJM
         nJEP5cpai4rF3ihaIF+TJvYMYeXoxakwQ413jgOD2TDDMu53rfXSOwnltPCELuyVUv9x
         s7qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793919589; x=1794524389; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RrHtlwl+AEhIC5xfPPlTatk3kWQjUPqvdwoLzmNPK+8=;
        b=YWQOh8dCM8gvON6hVDpStq7yHj2s6IWgWnB/nxtN6C8wgL0M20bsbcxa9HLr0sPjc3
         /E1jD8ECQKDHCXpS6s1+ajdYlCRx4SxTio0M77qhW0SenZ9/9K5LshPugByWuu9M2mck
         sJG1cNfhn+lb80HOdE3w5CyXcHmxZZa7Cvka37UZqZa/aStW942SFOQRVDSgbufnPzLt
         MkM7TpvsiKsUkLywIaccFh1Hlf7HOqQlnxivlVVAXho3NmU4XUB1AC0Nzsbm7KYvOWwd
         +sYAQwnyhttjSWdf0pTuvRS3a+/sUgM8Al9OdAhlvYQzVVW6sw/Iv1vI2zx40RBTDGWK
         vsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793919589; x=1794524389;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RrHtlwl+AEhIC5xfPPlTatk3kWQjUPqvdwoLzmNPK+8=;
        b=KJj7xNWLVX1aTwW0QIpGofVcCz0eNn3qiwq3EOVO2+uQoDyaVAScnGeb28bF9cyzPd
         UXc+Twub6gPUmMYxJZg6ahtZFgevNinYrr0/8LzEdofJMscFZFAbiQBTY6u9BiAGXjO6
         YRuNpnYYY81IBmID3prLEcbr+uuQF5i6zohmezodFWKT0kWoqCFjKmFX9hbXDndhcRLA
         2QcKOpQ9Pv07jYW2fV0TXcjdWKERJnbNj/G/ilTkHS1o5jylu5jQ/R9uM3Q5eHgSDLnZ
         F4GKv+LY5S4UYK+OmWGEv+hJWKmwHQftlFcYWMzbvgNLJ8nXMGrMFdAY3THY3dXRriO4
         EQLg==
X-Gm-Message-State: APuU4Z92iBFM11mmjRKuLxAT0SrslBlhHc3a0wjWxoDEGm5GmUC5bIL5
	jovJ2cSJht2SJ2NQtxoiXawyunu2+oqCCvbwMwkJvdfmZOuZqnS4xGxlBut/E60Z4OZpF+pl5Q8
	pCnRl5LWpFUCJ8p+qIrGcxkcaS87esRE=
X-Gm-Gg: AYBFou03WkG+Opemx58LwWW8HPh/UpA2o6/xaEG6s+HPDfCZ2PWFLT4VPOSTyPUv2c4
	P/7c2HKZr4z9CxvR/fsXWBOAJEWNIDmiUajuJ0AtPy1XIWS5TqC0LUvT0VDX/tSwvNoGZdXwJul
	nLIsnPWHXelYJ0IAGU3lMAmkCJlwQ97B3jUyWG2nhwqXeTlkJH9W9H8jQGcF7rxiC6SGsBjOf8p
	LCNiP2VNTFdDb9CHK+2C4nMcsLdWdVXwmnJOwaWEE6SrZGWD4SvWj7xo+U6RIzoGQWbvGQtKB3L
	yBkrMLpU01WwIk945e01xrrr9ZPAmb/jhJoyTFskyMXaewzudtW4zT1iNGz/GTZ1CBGWNTyuAbe
	RgvBUZZp3KUQ2XpW8wMBgqcpC8Mdr8xjI/8I5Zze76mNc6u8G4YSlNVApWhup
X-Received: by 2002:a05:6512:1192:b0:5be:4a09:cda5 with SMTP id
 2adb3069b0e04-5c003af7714mr125332e87.58.1793919589269; Thu, 05 Nov 2026
 14:59:49 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-a5xx-gpu-pm-v2-0-457aafbb28da@gmail.com>
 <20261019-a5xx-gpu-pm-v2-1-457aafbb28da@gmail.com> <bd3b073b-cae5-4ea8-8ed4-063db0aa5e64@oss.qualcomm.com>
In-Reply-To: <bd3b073b-cae5-4ea8-8ed4-063db0aa5e64@oss.qualcomm.com>
From: Fabricio Akio <fabricioakio@gmail.com>
Date: Thu, 5 Nov 2026 19:59:10 -0300
X-Gm-Features: AclHuK-50e5PrDAf3J21VAWq1T9hcSqfrAmJp671654qb1dhNNUctHumFE4UGmM
Message-ID: <CANxzQdFZL0_KbNHfQ3DWyMfp-SuEyomRCdYi9tAFMkGkcoTatQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/msm/a5xx: Reset the GPU when resuming it
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Paul Sajna <sajattack@postmarketos.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"

On 10/23/2026 3:29 AM, Akhil P Oommen wrote:
> On 10/20/2026 7:35 AM, Fabricio Akio via B4 Relay wrote:
>> On SDM630, SDM660 and MSM8998 the GPU's GX power domain belongs to its
>> SMMU, not to the GPU, so GX switches off only once the SMMU suspends as
>
> This is incorrect. There is no Adreno GPU where SMMU is powered by GX. I looked
> at the DT of SDM630 and I don't understand it. Seems like a creative workaround
> to vote different power domains.
>
> Please reword GX -> CX here. Adreno SMMU is powered by CX GDSC in every chipset.
> In some chipsets, the core GPU blocks are also powered via CX GDSC. So it
> makes sense to do a SW RESET in case CX didn't collapse due to a vote from the
> SMMU driver or something.

Ok, the SMMU is on CX. It is the DT that gives it GX, as Konrad also
pointed out, and v3 will say so.

The message keeps GX, though: with a test DT putting the SMMU on CX
alone and the GPU on GX, the CP lost its ring state on all 4 resumes
with the SMMU held awake; with the current DT it kept it on all 3.

So v3's first sentence becomes:

  On SDM630, SDM660 and MSM8998 the device tree attaches the GPU's GX
  power domain to its SMMU, whose own domain is CX, so GX switches off
  only once the SMMU suspends as well.

> Instead of a new API, we can just move msm_devfreq_resume() here. That will align
> with the A6xx sequence.

I take that to mean removing the call from msm_gpu_pm_resume(). That
reaches A3xx and A4xx as well, so v3 does it in a patch of its own
before this one: a4xx_pm_resume() and a new a3xx_pm_resume() wrapper
call it right after msm_gpu_pm_resume(), where it ran before, and
a5xx_pm_resume() then moves it after the reset. A2xx has no gpu_busy
callback, so it has no devfreq. I can only test on A508, so A3xx and
A4xx are untested.
