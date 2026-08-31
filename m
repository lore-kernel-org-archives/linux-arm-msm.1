Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69E13AAF5A
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 05:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788155560; cv=none; b=BrVE2ppN676KnW5fmlC+0yM3csY1EwHbJFHp9AihV6RunzlDgx1V+hYwD0hha8QCm2v+RAAPjyviXbcVC+C/2E4tQEUigO9Xyg5EvqLx93VfGSaG+nrGoUTHEHomCRyLC8mf9zyDw75KF1ez5LYU35HvirTpqtuxQ6Z3GitF8iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788155560; c=relaxed/simple;
	bh=Gx8dA2g+mBwttry7LSB36CW/iS8nutJKidZ1ioeEuZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+HhfJRj2Hf75zps5nwsNI/Rx48LlbLZLdAk6wZ8KLIj80tncma6mUlpNCO55zt5rGEjTNrsPJFTLTgpRN9Qd5Onf3mHFMqboBvDzpgi8YAeozS5YS45Sz+mKAHtlbj1+rCPWzz+C9M2zlpFBHShLmD2le5E8hizgRCHJzkgr3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AVrGWze+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AVrGWze+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso27764255e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 22:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788155557; x=1788760357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XgW48+Yzc91knnksx3tvkw+5MBtgMA/lwUwkXpa2nc4=;
        b=AVrGWze+YW0FuUxMuY587aPpy3iWGqPV7wnTA9CxG5cHFMK0LpRkp8tTsQBW+ENF/5
         FAvqlak8CYa+axHsSHeP5yQct+FgWbAAkXP5NvjDxSQMpa82zvQ0yuCGgGDdmBhL6Y2d
         VZaN+4jSO5xajMrc4bAfG8c3pNI7HhJWTDZGuGVtzlP43q195mu8nd0Ds16mSj5Hv5iJ
         r2xZYx8hTwQmH8QOJcmTnp8p5btbyLur3PQLMPYjPl6sphIqJs2Uu6/OsMJy678K71lD
         zQdQXLCde61axBmrw1zE94KNCATmdYkqzZdmCU6BGxoPMBPakRj1mqQHsTM48XNj4D6u
         M5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788155557; x=1788760357;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XgW48+Yzc91knnksx3tvkw+5MBtgMA/lwUwkXpa2nc4=;
        b=OsaQh/1++vBmxoMCmRT8lHfPkxxEaZQMTDKLL2C/1kDxcsYpWqDeLyoB+UQwEEkQ3W
         YM1c8E8zBLYD5/aOoKx9SGC6xOk/UToO/C6mZa/Dm5N/qXo6dBId7JNqFPGfRuOaaaGI
         OPayZ/DGR4gY53S8XP8eihRcGJ9+zwnaBJJeMmYVL4lTz83xuFmkYjTQWjJQanB8hjXu
         FW+H4T9/QI6LltBC2sGe/8LYYiaMlq5UYfoIh1NIu/p4o9TACnzM3fla/XH1DryLA83B
         IgIMdM66OdX3FfoUbi8tcF1eaiao3/s0b3w/V/KDXD9FaPHoUcFLVyG/JvCPMaWQof3L
         6OFQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNeqQOsHEWepH9Kjlk2aVF9clmdxF8e5kIanIes/Km0rpYNCWVTY7vrlDGGhBxIuUw587KyGlG6megQyXY@vger.kernel.org
X-Gm-Message-State: AFuF++nL4XoWtmqttxPnlRilXr0HUW0DwBmKEa3c8ri0OgrGaZBaBHsw
	4MEO+51vBbPrY8TfmZ4TFIWuYdXxVyQeedRBk0glo7/NAabSSYWnsr/RNhDzEjcOoc4=
X-Gm-Gg: AR+sD13F5/ngkL3utG1HnsfBmaXBt6iDqbX9UEpxT4Vulsb8P40PhEscArT6F//h5uW
	WNaNYDi8t7vk8bApd7EG9+lveo+MbFkXO8WE09eKJ9tJsjhTyEPMg2tVtL99iHHelQW9SiRgasB
	dzLsJeUBFqOqD/MtKMnTBcO0U6jr7f1ZljyDwRLQEqnc1vS+fCnpChmL/QVGmi95hLHoWTfty0u
	YfdlqAmwRAO/FSZeiRPCd6Q2ZqdXu0tQhJZpcFe6LrPPw/TD4tMW7DljDMVYdutt28+yB/2ALoE
	lVbL33ugwI6ctW3qYSAl8wR/91CIB/ZIp6wOoBZGOJ4Hwvf1/v3vLzoAM99h6MlP6PblYFjtZun
	pOkNgDq0m3Di1QDxMvoim8Q8jKRIN2N/d2WhuLc2qHSp4ikiy4tOZrmieOQY0mWRTqoCy3pBNC5
	yldecDHcfL4K5po6SYxPVNq/t50QrmbVpRJtbUbPSz5oWXTfMwvXpORJEzRSQJbogrtHIO2I0Ti
	HbqTfVXPDE=
X-Received: by 2002:a05:600c:6096:b0:49c:cfad:90c1 with SMTP id 5b1f17b1804b1-49ccfad9180mr194739605e9.14.1788155556937;
        Sun, 30 Aug 2026 22:52:36 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7241:7d09:c3ef:cd6:3fed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c80asm302186875e9.9.2026.08.30.22.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 22:52:36 -0700 (PDT)
Date: Mon, 31 Aug 2026 07:52:32 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] remoteproc: qcom_q6v5: Skip handover callback if
 already issued
Message-ID: <apUWoCCfgthl40AZ@linaro.org>
References: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
 <20260828181311.4038346-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828181311.4038346-2-mukesh.ojha@oss.qualcomm.com>

On Fri, Aug 28, 2026 at 11:43:10PM +0530, Mukesh Ojha wrote:
> When qcom_pas_attach() is called (subsystem already running at kernel
> probe time), it sets handover_issued = true before enabling the handover
> IRQ. The handover line may be high already (from bootloader boot), causing
> the IRQ to fire immediately. Since proxy resources were never acquired via
> qcom_pas_pds_enable() in the attach path, the resulting handover callback
> calls pm_runtime_put() on proxy power domains with usage count = 0:
> 
>   genpd genpd:0:d00000.remoteproc: Runtime PM usage count underflow!
>   genpd genpd:1:d00000.remoteproc: Runtime PM usage count underflow!
> 
> Also, because the old code left handover_irq_enabled = false after attach
> (fixed separately), the handover IRQ was never disabled inside the handler,
> allowing it to fire repeatedly and generating multiple underflows.
> 
> Fix by recording whether handover_issued was already set before the IRQ
> fires and skipping the handover callback in that case. The callback
> releases proxy resources that are only held when the normal start path
> ran qcom_pas_pds_enable(); if handover was already marked as issued,
> those resources were never acquired and must not be released.
> 
> Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Shawn sent the same patch already and the same comment applies here:
https://lore.kernel.org/linux-arm-msm/amxf7MODINj26a4m@linaro.org/

v2 fixes it properly:
https://lore.kernel.org/linux-arm-msm/20260801011731.1084591-1-shengchao.guo@oss.qualcomm.com/

Thanks,
Stephan
