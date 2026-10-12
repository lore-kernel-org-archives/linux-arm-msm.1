Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7132746E01F
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795050; cv=none; b=khpiNtVK4obhvoV1Y7IEjfI8sfHpNj702xEmSb/6lwJb8z4wFAQfN6WExzmdAJPlTeFREeFgeKt+NjMSdYkVdJzN+F03CDT0YMD9c9sMyNZr9bxDX6bC5cF92FTdG+8mVJDlL25FgVtwXlyjgzVfzhOpHM025ebXulgox6QsQ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795050; c=relaxed/simple;
	bh=KSXKge8lF98WBnWGNkG0IboR9V4b1N6GQ5xQBRhqa94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRywXTNYMLyT/RilVNhgjuuwLQIMkwxB91H2KPiRchIOZo7ZViAJBbY0K+6T+YRkONMU7zpxApYjmsb1A4taUBnTMwLnSai8R4BJqhmt9mCpYNgQBth9ogqJ3dPGJxwp4uvmnlQDRS0BuCD47Zyh1D3PrNfEursq7WR4Dvo3NvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kv/kH/CM; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kv/kH/CM"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1064321f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 01:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791795046; x=1792399846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VauPgqsnl4i0EoTG9j7fG+t1lHBl9BTOH+qyhzX/v4Q=;
        b=Kv/kH/CMtEBpQSNzowJAxdiRdDUII+enh3tp97T+mF4CgHNxukqpE9YqTHMuVNBUL5
         P7TA7a54P4/CMKLfy+vNojsTgONW+C4uQzROe1ddmth9Gej1xRrXWEQ0PHzntI41oALV
         R0ysgUIlDdDWhzdoyh75VMghmG48mIXzMuezPM12iOVQDxjwUFLb41PuHo43qwibQX34
         fUpgFSDHCPMwxOMEaOdSWHde+GjngsGUwKPO2VVLwloYgAA1hD8ew5Crhd6T+luVfaGi
         aqXcpK67YfHVLapBxNSNe/xtPKfooM+EjdSmNCU80HlTBp/JjI0ECjpLHXdSdsGmc9Ob
         8hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795046; x=1792399846;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VauPgqsnl4i0EoTG9j7fG+t1lHBl9BTOH+qyhzX/v4Q=;
        b=SFL9vlCicxtrG93Ko+Z5blgEa5OyA6ljP1QFvOExgqpOtER8yRo3/5g6tfOC7jEZrP
         sa9Rk460Ehk8g6M1Scv4/W9vhvnGYv9DVWvqXKHc0x9DbPQTGYnL3cv7dy/WNjCDaV2a
         qEGz6XZS/PAM9FQ73O7mo+oqrksZexwgK4nFIy6OZ8AllFRjc+LvUA3XWzYHpKeQRbBr
         cpD8uzTyrSiSn/MVyvUbFhJh1xl8pQjIilKSygSKtQaYgbmswBvmFYSoHQKsXkm0ZMtA
         8pqdQ4W7TvGZzJOTiHHEFlczVy98rwHZMURCm53yOf0otsjEmnGqWCVfxIPIq/iCY357
         l/Zg==
X-Forwarded-Encrypted: i=1; AKwUvBwcVrgNHaWIX331eaXlPorKvRvZJAgTMmGFU1QoLxoE3Y6BKGDIEAjE6YxSZCyDwUtrODy6DbLVExmVCrKZ@vger.kernel.org
X-Gm-Message-State: AFq9FYLNlPrRfq7N+7TDoOSGE/zlVR9hIe6AoTvrINIg59A5wnjD8WXJ
	3tRg1OE9QQpRUIPoNM3osz8WNj3cuX6ju29uQi+ybqsNExGC7kGpF00pWPHzVVkWXe4=
X-Gm-Gg: AYBFou0wiwbF0UCTX/yrfqmq0t2RVzkkKZ4bV5yK2vMdVoU1sgdiqiZDQGd1T9HVSb8
	IG7ZKLuUnRJuN4rILYTV4kk8lrjEfVdX4yd4oE1dH6NxI3aBgMXl4T2z7l20S5ZxnTFdnXfo0wN
	94LXGpa8ptsbb723YnKlDV+6EYsMQ6Mf9c/c+Y3jUemewIfbt4aOpRFEX6h1Q7TMtJ4fggLMU7N
	IH+QphzZg1uc/AH6C/CFsIAWLoWbii4i13HlFL11eJtlWTzDZH7hRAFOPuoQo56P0ZLiGbaJXms
	hZSJkGcqG/DB6Znk/4b7kUNjalPqWxZwOBHp7NBxnBfkuLFB6E6ZzoPzj+TjBKLninlnOqfeyyI
	2e7MUrXCio28OuqSMTyAnVQD/WDaahPrUmtEwgrc82zQAdoWpLhImQHVzrFLv88a53LZvyiwUbz
	oWhuv6Xyk8X+t3MPWP/0pAD3Eig9vKgW0MeS8kUUHTR0+0E/omE6iZpFwIjkWkfPxDzbVzeXoEu
	I2Sya4241vIdBTi/HcftQ==
X-Received: by 2002:a5d:59c5:0:b0:48a:f592:fb63 with SMTP id ffacd0b85a97d-48dba7bea5dmr16393442f8f.1.1791795045347;
        Mon, 12 Oct 2026 01:50:45 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:fef7:ab03:44ed:97e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db99b820asm19710565f8f.24.2026.10.12.01.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:50:44 -0700 (PDT)
Date: Mon, 12 Oct 2026 10:50:43 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] remoteproc: qcom: pas: Don't fail attach if the
 remote has crashed
Message-ID: <asyfY0gZg8OkU1PT@linaro.org>
References: <20261011022802.4069489-1-shengchao.guo@oss.qualcomm.com>
 <20261011022802.4069489-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011022802.4069489-3-shengchao.guo@oss.qualcomm.com>

On Sun, Oct 11, 2026 at 10:28:02AM +0800, Shawn Guo wrote:
> When qcom_pas_attach() finds the fatal SMP2P bit already set, it reports
> a crash and then fails the attach. The core unwinds the attach while the
> crash work is queued: rproc_boot() drops the power refcount back to 0,
> and __rproc_attach()/rproc_attach() unprepare the subdevices, clean up
> the resource table and disable the IOMMU. Once rproc_boot() releases
> rproc->lock, the crash handler finds the rproc still RPROC_DETACHED,
> marks it RPROC_CRASHED and runs rproc_boot_recovery() on top of that
> torn-down state:
> 
>  - the subdevices are unprepared a second time by rproc_stop(), so SSR
>    and sysmon notifiers see a duplicate shutdown;
>  - qcom_pas_stop() and the subsequent rproc_start() operate on resources
>    that rproc_attach() already released, e.g. iommu_unmap() on a
>    disabled domain for rproc->has_iommu;
>  - recovery leaves the rproc RPROC_RUNNING with power == 0. A later
>    "stop" via sysfs takes power to -1 and returns success without
>    stopping anything, so the remote stays running. A following "start"
>    then boots the firmware again on the running remote and fails to
>    re-add the still registered subdevices:
> 
>   sysfs: cannot create duplicate filename '.../qcom_common.pd-mapper.0'
>   remoteproc remoteproc0: failed to prepare subdevices for adsp: -17
>   remoteproc remoteproc0: Boot failed: -17
> 
> A crash found at attach time is no different from one reported by the
> fatal interrupt right after attaching. Factor the crash handling out of
> q6v5_fatal_interrupt() into qcom_q6v5_report_fatal(), which logs the
> SMEM crash reason, clears q6v5.running and reports the crash, and call
> it from qcom_pas_attach() before letting the attach succeed. The core
> completes the attach with balanced bookkeeping, and the crash handler
> then recovers the subsystem through the regular RPROC_ATTACHED ->
> RPROC_CRASHED path.  With running cleared, qcom_q6v5_request_stop() does
> not wait for a stop ack the dead remote cannot send, and handover_issued
> already prevents a spurious handover on stop.
> 
> Assisted-by: LLM

Cc: stable@vger.kernel.org
Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Thanks for the fixes!
Stephan

> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5.c     | 22 +++++++++++++++++-----
>  drivers/remoteproc/qcom_q6v5.h     |  1 +
>  drivers/remoteproc/qcom_q6v5_pas.c |  9 ++++++---
>  3 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index fe148b4b3775..51b24cbd4336 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -147,15 +147,18 @@ static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
> +/**
> + * qcom_q6v5_report_fatal() - report a fatal error of the remote processor
> + * @q6v5:	reference to qcom_q6v5 context
> + *
> + * Log the crash reason published by the remote in SMEM, mark the remote as
> + * no longer running and report the crash to the remoteproc core.
> + */
> +void qcom_q6v5_report_fatal(struct qcom_q6v5 *q6v5)
>  {
> -	struct qcom_q6v5 *q6v5 = data;
>  	size_t len;
>  	char *msg;
>  
> -	if (!q6v5->running)
> -		return IRQ_HANDLED;
> -
>  	msg = qcom_smem_get(QCOM_SMEM_HOST_ANY, q6v5->crash_reason, &len);
>  	if (!IS_ERR(msg) && len > 0 && msg[0])
>  		dev_err(q6v5->dev, "fatal error received: %s\n", msg);
> @@ -164,6 +167,15 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
>  
>  	q6v5->running = false;
>  	rproc_report_crash(q6v5->rproc, RPROC_FATAL_ERROR);
> +}
> +EXPORT_SYMBOL_GPL(qcom_q6v5_report_fatal);
> +
> +static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
> +{
> +	struct qcom_q6v5 *q6v5 = data;
> +
> +	if (q6v5->running)
> +		qcom_q6v5_report_fatal(q6v5);
>  
>  	return IRQ_HANDLED;
>  }
> diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
> index 8991ff090579..a0507860a21c 100644
> --- a/drivers/remoteproc/qcom_q6v5.h
> +++ b/drivers/remoteproc/qcom_q6v5.h
> @@ -56,5 +56,6 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
>  int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
>  int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
>  unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
> +void qcom_q6v5_report_fatal(struct qcom_q6v5 *q6v5);
>  
>  #endif
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 56179b71fd2a..99f627db6bd3 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -562,10 +562,13 @@ static int qcom_pas_attach(struct rproc *rproc)
>  		goto disable_running;
>  
>  	if (crash_state) {
> +		/*
> +		 * Complete the attach and let the crash handler recover the
> +		 * subsystem from the attached state, as for a crash reported
> +		 * by the fatal interrupt.
> +		 */
>  		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> -		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> -		ret = -EINVAL;
> -		goto disable_running;
> +		qcom_q6v5_report_fatal(&pas->q6v5);
>  	}
>  
>  	return 0;
> -- 
> 2.43.0
> 
