Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2BF49D584
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964084; cv=none; b=jnJjUHTL2VtPNs/7/qXpQ6FKlsnqs08tI8TZ9Z+a4BGPQui7wcq9sfw4acFu3qFYWyMI6/qbKK49dUwJyb0ANwKbktccJpJ90HiB72yEUur2HMFhyjCkVQMXvA42nS5D4W55M2J3jjyxQ76EApUBIf+eUHLoN1+5GwpglcksN7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964084; c=relaxed/simple;
	bh=16hksQs//RdVLFuvKyiS++F2SQ5vrk8MCYmqqR/nkGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNask0s6Aqd/7sJp6izXUEZOj4eWub1HOiv1c1nqOgQlrvAlvRzRdciakFZtRU/RJF8zuUjHoO7H70FCw5Ay8OiYkOXuoz6lpQDoCPNq0/r2+sA5AlD3YDn5RvM8VeQxfVzy4s70PQ+hifd8ZeXCTWREa94oU0iE3IKyBmFI+rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vmym8c1+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vmym8c1+"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4207ac26so3583050f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 00:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791964081; x=1792568881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wmneww5mKP53qtLk5sZTycPhJoLLQoam9M0U8cXGxVI=;
        b=vmym8c1+CVTQwZT+sCnhlqu8Spr71dNpW8sWYYj+HUiugiWX1IvOrjlCS3B4wWzy4I
         gAKIgzQG0DxdHFEtV8Uj28wkLV51wZQGa/9/kCjDL+aRwLTqehVjQMSvYJavpbjc5bQK
         e4J8EeRoC2V8WvsEWNFo8pnrI5cATgN7/8mIsz3owyLG+8hNotVYT/5gSNgz8++q26B4
         F6APAl78WbqAKxK1eW+SgE3t3FLSVWWV8mz5e5gkMkJa/myih4NtRhbuY9NnuZe+nbIL
         IRtS0sn6F6wiYb7c+sVpD6fIzUBX52r7IRy8SkB18go+eB0+EjBqw8Yz7gRSeeJfplI7
         fxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791964081; x=1792568881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmneww5mKP53qtLk5sZTycPhJoLLQoam9M0U8cXGxVI=;
        b=LeFXZ5vEmA1oAW6Bf8skPobL+fKmlHH0mKbqOb4+WUITMD7mG/gjbrwqAI82Z6nh5T
         NfrQWOFclWWmjlCVDSTyXHltUm1XxhhdKdVZs6lVSSaURGU7sZWnK5koMrSnBsqqc2Pn
         1whiS7i3EJQ06g51p53zO3UrVwlZB6K+DaASUgW9otn8AZQvMQ1lmRDhnOUp4IGHcLwz
         P5KFdH0zIGyxlzLLaWrR0HptS84OIGmIgunnC4EiRciQdxv/oFlZktX+YHnpGcVw8AKL
         ZI/4v6ke6vHNvZwAz5+N1ZOY4rEDqA7qeBQPI8E8GTU+2Cih8U/bWkG6uZWPX8dNridA
         HjeA==
X-Forwarded-Encrypted: i=1; AKwUvBzyYNliIIWl21dGpCP46q7t8to4VdSWyaUzrxC+W9JgoyGemzvOApiOXyvdL8xYsfGjOe6NcBbkL3i9u4GE@vger.kernel.org
X-Gm-Message-State: AFq9FYKTbHJJTkpuFM9UVCoiN/+c65+ncp/aq7djP/TfEioncjYExH9g
	3D6w80LnZ/YEZvZ6+CSje4yKhm66xJxgfmaHjbvGWShb7k/yHQL9LhLmmzw+GhOQlAJU5K7Sapq
	+dnij1/8=
X-Gm-Gg: AYBFou3Wh6QOalBamBawaPrYTZKhJWRVtMdDjJRyUdpCTLrEoceiHBFeTulTuclJDa8
	w7TYJK48nmjanfPEbwvI8KwnqDeD43Hah244AuW2zgXqabccyxSCTDx/yng3n4w5NbI27ZXCR0e
	6vb/DCxD9C2JDok5/6Z9ZJtJVrVXB9z/7mM0l/GtVQ6zXt8uxAxpTMdZz1Lyx+YSVdzSNUZsz1D
	PzPSq5PChpgh+gHtt5pBDtAVpgu9HuWvWY2ZDaEBM6wDpwi1BRxNPWFSDDb7nxyOmkJYZbSLgl0
	67Yp+eiIbwpObiNPlvvAQWSRquBXq7obpNLXtag6WngAvMGTM3zVO2tdY+D8G010JBrnNYEuHCO
	lZq0WOiRV6+VzGHtxPyqlhvzx5KR534AX6cubeOfkBygGiO5DrBvofBxYnjdQTzyU3CLpY4QARV
	0idnoe4yOOMlEw2DLyRWysZH1Y+5T50IwrXfF0optpeXt++gDfyQNSSfKfobqovgghDrJM/3GGw
	Et94qc=
X-Received: by 2002:a05:6000:4553:b0:488:6bcb:ec92 with SMTP id ffacd0b85a97d-48dbaadcfd8mr20006696f8f.17.1791964080842;
        Wed, 14 Oct 2026 00:48:00 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:b6:d666:120c:88c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa21sm11407149f8f.9.2026.10.14.00.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:48:00 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:47:55 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] remoteproc: qcom: pas: Decide early_boot attach
 at probe time
Message-ID: <as8zq_GMu1pkoMYA@linaro.org>
References: <20261014070038.564879-1-shengchao.guo@oss.qualcomm.com>
 <20261014070038.564879-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014070038.564879-2-shengchao.guo@oss.qualcomm.com>

On Wed, Oct 14, 2026 at 03:00:37PM +0800, Shawn Guo wrote:
> For early_boot subsystems, probe unconditionally marks the rproc
> RPROC_DETACHED and qcom_pas_attach() discovers from SMP2P whether the
> bootloader actually started the remote. If it did not, attach sets the
> state back to RPROC_OFFLINE and fails, expecting the core to boot the
> firmware instead. The core does not do that: rproc_boot() treats the
> attach failure as fatal and the remote is never started.
> 
> This is hit on Nord with firmware where XBL no longer brings ADSP out
> of reset. The remote never publishes its inbound SMP2P entries, so the
> very first state read fails (debug print below) and the ADSP stays down:
> 
>   qcom_q6v5_pas 4c00000.remoteproc: Failed to get fatal_irq state: -19
>   remoteproc remoteproc0: can't attach to rproc adsp: -19
> 
> The ready, stop-ack and sysmon shutdown-ack signals cannot change while
> Linux has not yet interacted with the remote, so there is no reason to
> defer the decision to attach time. Check them in probe and only mark
> the rproc RPROC_DETACHED when the remote is up and has not been asked
> to stop; otherwise leave it RPROC_OFFLINE so the regular firmware boot
> path is taken. The ready state is read first so that a missing SMP2P
> entry -ENODEV is treated as "not running" before sysmon is queried.
> 
> qcom_pas_attach() keeps only the fatal check, since that is the one
> signal that has to be acted upon once the rproc is attached.
> 
> Assisted-by: LLM
> Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Cc: stable@vger.kernel.org

is still missing. Would be good to have these fixes backported, since
the original change landed in 7.3. If you used b4 trailers -u and it
didn't add the Cc tag after my message that would confirm my suspicion
that b4 won't pick up that tag. :/

Bjorn might forget to add these, so it's likely easiest and most
reliable if you resend again with the tag added in both patches.

Thanks for fixing all the nitpicks!
Stephan
