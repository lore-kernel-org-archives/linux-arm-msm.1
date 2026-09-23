Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4189471269
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 22:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203877; cv=none; b=itTxkf3Ay4YBqvxWgWIciviMTb7fxsPxABa1gBLxRwlZTI9scQT59RhHlu/TOTW740UkO7nKP6CsaMNAt1QuZ7FawQZQ6Lxsgi/8mnRZ3GP1szRiFXoP1b3tfxW8pvas+JUNcNhw7cp1RpSicSUi5GMCF0R2Ij3ZLWzysptEYhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203877; c=relaxed/simple;
	bh=EKX35ie9/USsn0Lh1pIBDFxv7amLEruPOvFxMnWeGnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IDzDrJEQ7Uto7n0UsSpzDkPrXtXU/s9SMgtGhlIC/pHEKrQM0Qy6ZhHJKQ75wwYY1U0QkO8N2ursgaDq+tA895iWlYm5ExvTczsdxpGuzrKbitRTRReDqkj4899QdAOp7fYDERrF3vEDgzCpixfhKcUlL9PjAVpUBDkKIk20Ups=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q7P36F21; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q7P36F21"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49e73e541d7so952065e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 15:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790203874; x=1790808674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mI1/ZYE5YHBF2sXaFTZzYUzCnN//3DiBm/zH9LcBkPw=;
        b=q7P36F21o8SR9xcYCLCdLlzodnr/WLXRH3eQy77uiPD1la8KmWVLJpczwS36SDjxz3
         WjqMrm3e5Tq+zY7m8dB92immHr+Y52qat2rwiCO5ILWnABEd9eWCZoDfaIe4omahsXu4
         OEyRfurBc01MmD7qj7GxH4PDciCVoXOM+L4Ul1Ayod71ZYCiz6wLApQqHtMG3ZaJjRsy
         On+ey/i6RvKmYhd7sNIR3gHrKWi88u5i9NTXBmjtsx3q/2V8X7LeBOvXkvR+zFk3PZul
         maCDCs6yQjo8ZPVFJSFmwZ0D4DF5MM9/Tk0ICrQ4FRxa3Rmb6tI7fNeXlBgD+S7xnZVJ
         BEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790203874; x=1790808674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mI1/ZYE5YHBF2sXaFTZzYUzCnN//3DiBm/zH9LcBkPw=;
        b=GupACkybT3N7iXHHlxKD14mCS2ViNAJTxUcUO97UMtX9EJ2xhM3LbDt8ap2RMAUa9R
         oEzLbVXn4IExLwU3myaH8Y7af9WdxIBa8XDkiSWJP7ABjLp8fgy1ivWoOfUAAwgZ1VbL
         jtrp+689R/Oydtb6a1aGOEPaUl0E/+IrK78h9gZvnvpwkvu1rDJwmTPqsXJLMqKNnO+e
         kJVR4twGKaJQjo24hKGiLmwMtWRDQ3bJPC3dIBXJ1hZcflD+WVdLPsIJ4X5bdX+TCl20
         6YQtgFfL52ws3jKApwACD00/4/xzVITlt+Yo2HFHh5DVqcUGuku9GpF1KF9jqgkHldG8
         dzGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxK9T2Z09a8HJC1hzlBZ7ajvVagV4q/Zfou+8yBPXDrEnqCAQPtHI/+bD7JCKRD3Wc1Skbz9a2GcnJttFaa@vger.kernel.org
X-Gm-Message-State: AFuF++ll3V5OfQgr6cf6xhCExN0i16FXwVV6v+2G5FTTtq6cpXg3P+Wi
	9LFLWRStGPQJQ9PCWWKkLZ3qpqwUw0R8/QMy1vUCqaD1Ugj1Fvqrzgsf
X-Gm-Gg: AYBFou1cuNNPLGhGCY7EhxxDitY1fPazb4/gWvtelk2Zm6S//j16Npo7tcvXGsHbd+1
	oy59PWegavxeBxhlbyz7dDlfCsWv9Dk5YN8SLV9WSvbPSuL5WT3GYXy3pKbHObiNZBpHzCndb3I
	91c+vp4POXnnjpZ4FJIOqxWsFhWQzlysHME4B7/a9H6ofgf0r5tPQulM9iwqQ7wnnVDpCrHosLJ
	l2jfXkfLLYRZFtd8lka6f3F+8WXsbJUstTA0UwbNDGqwFcx/ANZ40Ogj1PXZ+lhtEmqg2sRZkUF
	14UELs4BIvgmhKqQpBf6JsCejBcsshiUwS2snP2drB4Sam6bqJ3Sd3KkZfoNLZWzG4YTI/DE5IY
	ZFPkdCS1ZQ6vYKHn10wffwvSOlbUlFkI0/utsGD8EIHIq1aM5PBpWKGdIJlwNg491tHTRoP4HYs
	WUf3sJ2jOVAwLZMekzqzeek8JhX9wnTShq3lkGzxxEkhJPwSPIBJDYMZpcoEkQjFQWU1CfH1LY5
	YPb3hPr2eYIFQlwQi8ouCKkfxGxJEOtLw==
X-Received: by 2002:a05:600d:8642:10b0:49f:c305:f4ce with SMTP id 5b1f17b1804b1-49fe6705708mr6898435e9.16.1790203873928;
        Wed, 23 Sep 2026 15:51:13 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682673bdsm9822109f8f.2.2026.09.23.15.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:51:12 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: devnull+david.ixit.cz@kernel.org
Cc: abelvesa@kernel.org,
	airlied@gmail.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	david@ixit.cz,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	dsankouski@gmail.com,
	jesszhan0024@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	phone-devel@vger.kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH 04/11] drm/panel: s6e3ha8: Introduce AMB577PX01 panel
Date: Thu, 24 Sep 2026 00:51:07 +0200
Message-ID: <20260923225107.191388-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920-crosshatch-panel-v1-4-de6e9512da96@ixit.cz>
References: <20260920-crosshatch-panel-v1-4-de6e9512da96@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

...
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
...
>  static const struct of_device_id s6e3ha8_amb577px01_wqhd_of_match[] = {
> -	{ .compatible = "samsung,s6e3ha8" },
> +	{ .compatible = "samsung,s6e3ha8" }, /* deprecated */
> +	{ .compatible = "samsung,s6e3ha8-amb577px01" },

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
