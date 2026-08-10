Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3400839E9BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786351041; cv=none; b=nRNQInQkqGDuBndRYkWY6z0tWof4lfnc18jkcRqLIWqKCqxpCdVRywPZRcwBBoKRlvVm2kLEzUZ8DRpKUBImotOw0hK+0mC8U4m3TMrAEhh3r4dcibNd3NEYhUUtjCqowb2RMQAITfsMbkCQqrRhURIJ3AExFs/xJBu1hEEc440=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786351041; c=relaxed/simple;
	bh=n3M7vDB+4pdqtoiwS0EDbk/4OUWMutfgaBq4ohs9IUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6K0HNxOzC4iJDZjWJa/34xfyc5dm8T6VRW3Q5VApLci44U3uyOaNnJCbOrlUhmZyoXLmF0Cn13Wbu9DAV7YYploVbPKeH1Lik3zS1rB7HNf8jCOjGxzCDc2RdxKh81qexdWZPJp4QAPgste4VnOfE9r0uxaPjFu035KkqIaCs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZG3nsYu4; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZG3nsYu4"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso11614125e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 01:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786351038; x=1786955838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FkxIlSiaSZQV6q19WHtk3rSh+il/+YXh4ZFHxv/IYH8=;
        b=ZG3nsYu437UhNB6PZXOEK0tGMK7fETFA7QBJbFsRtkT7ydG+8Ae+jtGTKYUxi59gRJ
         drqPKKQ/M9vwB2KQnMP67W3PhxHnkt63B7Oazn537nyjwefR8ok/lvT8BoYzKoOhfND+
         lP9DxPo1N3m7i8NOg33Lf6XEVi4lwcTgT2AnjTYNw1oj9O+gDn23AUjJDhjg+XmyO6yQ
         jH7sTN0eAHeuwYymOHYxpRZ0lcG01OpOVZyzMbU7MwPTMBTmsjjW3sQZ0OfPzD0Gp3t0
         SSYhDmw+KS/MOB8a+CLjHKKXce5sntI+rSy6pA1J48U71oPCXmT/z6WJpg7mxQW2QJSu
         o7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786351038; x=1786955838;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FkxIlSiaSZQV6q19WHtk3rSh+il/+YXh4ZFHxv/IYH8=;
        b=nh1dcxog3lIqlyorJolzOHPVISihL3hXNui6PnWv3qsJWb1Pe1PJAc0R5Bejl4Bp2P
         R6cwgbmjugMc5eGpY8St7rg5WH3bFY+I4lXh0SAVBm5ZBrJAsOwo4TSjJ89h8MrTBlu5
         IG8nLw6lzzO4DsdHzfglYts8WgNKVcj/n6RR6dfmoUFEDtgFqfryfhB8PJ7bAKhE+A/W
         vfc1c6m/guS0tnKJh4EgSRRJ8/MmGjx4QeX53J9/3jhp7YxSray0Y+hadjJa3iObo59B
         b//IWUEanNmycgCBRFYonsbV0N3SxZk8dkYNCblb2uONPF72gTm4ruy/SGs9uFwcSRrA
         Ge5A==
X-Forwarded-Encrypted: i=1; AHgh+Rr9deToVMGUkGWXaa7fy3ZhRS7hG1fBaF+r0Pot2BpmW1qrGx3ibql53QGXAwh3uffhgBGnMyjxMV9bknsY@vger.kernel.org
X-Gm-Message-State: AOJu0YwswX+LjxrF9R/RUJZtFFOfq/EeAOL6rD3YA4pXKKEzufq/CFTn
	PVeKWAqz9yQ+5iGHcVeN2yYwP1oSpzoMgZlQ97pjJnOMXKthzTjJ2gar0X9LGIDfZ2E=
X-Gm-Gg: AR+sD12W7/mTSe+OnmdCB/trfxWkWY00+sNR9Xu9lm8itCpMa0wG8CyttUZsQo7Evwe
	2cKeMUK1S11LLOT5KPG4LBMy4Hrkc2rdBjaDI+lc/8eNNnn8kjQTdHXTSMTCGWH2i0P9UaPYH8P
	OP/vswoYdn3zbAejGBKSDB4nw0Cydyg7Ek08F+ETvrcvduRbOHt8qSLS5VM+6G9UtXlxWUFi/Cc
	I9B5j4GBbTjCOBregplFNZErNZPPlLzzqwSRD7+6rh9WR9eoNI/1U3xC0cQO1ET3QuqhSbMIAu3
	vRbFoDri7gsLlgzBcbO39h0XJcksiWxf+XJ1XK/PW5dTqk0ksH9xtgGKWh7vhcFLjSqQvSZkkgX
	QBDUVSAW9bEKxqA60DalTatexsfSQzJRZyonP+5bBC1Xb4+CFz/7ZKpT6/BcP4K0ht2dNnfa2XQ
	9d+7j3eJuF7HLEBWhS7u5xL27Ps9PxmXw8rbaP9HtaOk+YsTsYiGWdcnN66RTVx0BpsO8bgLE=
X-Received: by 2002:a05:600c:35d1:b0:499:5e9e:1f50 with SMTP id 5b1f17b1804b1-4995e9e207dmr298923685e9.4.1786351038298;
        Mon, 10 Aug 2026 01:37:18 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:71da:59f:1cf4:ec2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9f9424sm241232975e9.8.2026.08.10.01.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 01:37:17 -0700 (PDT)
Date: Mon, 10 Aug 2026 10:37:13 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: mmcc-msm8974: add GENPD_FLAG_NO_STAY_ON
Message-ID: <anmNuXoOK7Xn73TZ@linaro.org>
References: <20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com>

On Sun, Aug 09, 2026 at 09:58:37PM +0300, Dmitry Baryshkov wrote:
> Commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until
> late_initcall_sync") kept power-domains on longer during boot which is
> causing DSI clock to get stuck and fail to acquire its configuration on
> DSI bringup. While this is being investigated, add the flag
> GENPD_FLAG_NO_STAY_ON for MDSS GDSC on MSM8974 to restore the previous
> behaviour to fix this.
> 
> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Have you tried adding resets = <&mmcc MDSS_RESET>; to the &mdss node,
similar to the following patch for msm8916.dtsi?
https://lore.kernel.org/linux-arm-msm/20250915-msm8916-resets-v1-1-a5c705df0c45@linaro.org/

Thanks,
Stephan
