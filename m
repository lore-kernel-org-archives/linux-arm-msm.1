Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884913F9A1E
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404217; cv=none; b=mmCcfRMkSzFqTKBYZuVI3JCVlunI9rcIxHOTMGF1XRVcdm5EXamFcocHp+Q3Xb8G2RcvxNLB31WR5WyVDUnZIhDqSUciuTyNv6hCDatbZhMRcN4IkpBBqTr9QMRCRCD0pVo9JtzWT2eyzT1nJ/ljawNkAeNmfofyaZjyYGBA6zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404217; c=relaxed/simple;
	bh=3ig9HyOBwUAQGnS+nGUpC+LS7V7HWg7iPJ6suT5Ougs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTp6GtVKb1B+qK4Enqvy74RMTRvLrXA67UtcVXCEVpmIlCl+uumsHmYcumCioDMxjbAHSzmA2kdanm2ThiBKtimxVVJpq3GFuYUeyYTLSSwd1zypzxVnxVlik4DQbMAVasGuyZiFPh3OHEOUV3vHed/ZdmGPOXJLULJmHlFKDW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AljOxfXi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AljOxfXi"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495590dde14so18637285e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785404214; x=1786009014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YenH0EkAp38hPwj0HJf+phj+YdBWGT+XzdFAusXbYyg=;
        b=AljOxfXi7M6djbXYt1BqJ0E+TVCRIM0p2z20b1y9Izuo0IX9Tk9T97kT9O8e7Mqelv
         CsCdAXnGlv5urJ4fzVkV2HhzJ/nj1tkmyT8QPU7HPmWBh9FYYEpzJ0w791TuTNx0umlb
         uxGCxRmsjZh/Xo/Nm79HuvB6IefQdtlWerXIeFBKKE65uizCCgjCKEpInDr3eG8zPtnI
         MxXikzCRgglF0n/XYT0ghwun179Wb7ngfRrmNNz94OA8aTeav5lOkD8ASM2z/XoGn35V
         g2s2MDM85+i3jy2t0CDx7eCoaFHfvDJHXbopQuUkywxenF9dnMQROFDHNT49q/QtSX58
         uwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785404214; x=1786009014;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YenH0EkAp38hPwj0HJf+phj+YdBWGT+XzdFAusXbYyg=;
        b=sz3FilnyGRZ78j35MSC2JZGU89FD8ZythAv430TRN1Co7f6hJEyGmMxtfTDuoXgAg3
         QDuFjSvziKM+ZrZlS9QdyS7S/QaC3OfZ1RdpvwaofZluM9W1/kF8FoRZqEGPv7UcmRTo
         FSmsLyDZeh8ptfIslWb63Lk6x7E0yPH4kP18WwUUbbZSSdCAX6blyUYaWj1d5IF+EuRA
         15yCHQCD7hqcOI/Sj49FTDygx3+xKwta93j85UcwtIdoReCYgkwogucw+rbLMA8dk9XN
         ATAu2dsXjLrBbBftErQnh+tDO3qzv+GHKlvqr4Axjhu9joPK0m3w40qLN721HpoKOzWx
         3nHw==
X-Forwarded-Encrypted: i=1; AHgh+RpY0N5JKSm9NtxN8nUKAzGDOlrI7PacqfUwfOzY7JWouxrhU/B6cUomQ4lhqP/oRrvsmj4Xmqtjt3sqrSLm@vger.kernel.org
X-Gm-Message-State: AOJu0YxxM2Ydf4qrEpYHAa4CrmrWhp5rjmAwY0VkxZ6S6xp2k4nlUW9F
	HlhGwQmqy5JdeaQG4W/n4gB5L2w1MlKSDR1Mgp32l4d71atplunUBigBMlTR/GcbYdY=
X-Gm-Gg: AR+sD13Z5k+c05nsY4/2ssHvVtISY2hi1JTBolqYs3TUynXxQ2ypDFV6OH3b0LBvbCp
	cZ6YWFPQmqmsuqA08Q5NrJ4sfXWsoBtciLJ46yC1GVWMAYkh1ZTwWsxyL3VTObYpoE/AidVz24y
	QYb1v/in+8i3NtMQefd/Nvn6vqQ3isxv72kI+Vq+lZCjw9wY7EyqMNfbBVEV99zSE7MlBIYqMMf
	BhbqGxYGZkNa8rzjZkfGEPt3/7usT/HEW810kQWOqzM/j5MXDzRiVWy92LO7+oyP3vnBGgFfK43
	SqZ6Ye73Bhvz+GClkhZCLntsiszZ2nWSyAUWFP36pi2/gxpT9QHL5JR4j11J7X4CR1d8BbYd5kx
	12Lwe3WDAXSxM/+OD1HiMZtatLN/kBvavhULnnB5t29kuBLbaz/wBzc+z+L4f/ZA5Lj+Ma/OKuQ
	aKL6DdfoG2DUBI0Nc2KliwI7ySxGLnIgvw2PUED/jlZWhGW80pLA64s8FoKmwHV8IvLc5OnXR+
X-Received: by 2002:a05:600c:8b2e:b0:496:c967:5f9c with SMTP id 5b1f17b1804b1-49800ec19d5mr28488325e9.33.1785404213726;
        Thu, 30 Jul 2026 02:36:53 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.38.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88e3d7fsm4722046f8f.9.2026.07.30.02.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 02:36:53 -0700 (PDT)
Message-ID: <a24cac0e-7d9a-4293-86e8-9bd0e724c102@linaro.org>
Date: Thu, 30 Jul 2026 10:36:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: qcom: camss: Report hardware version via
 media controller
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
 <20260730-camss-version-v3-4-74a87302dd9f@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260730-camss-version-v3-4-74a87302dd9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/07/2026 10:24, Loic Poulain wrote:
> +static int camss_read_version(struct camss *camss)
> +{
> +	u32 hw_version;
> +	int ret;
> +
> +	if (!camss->top_base || !camss->res->pm_clks[0])
> +		return 0;
> +
> +	ret = pm_runtime_resume_and_get(camss->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	hw_version = readl_relaxed(camss->top_base + CAMSS_HW_VERSION);

I'm virtually sure this fails on !PM_CLK

---
bod
