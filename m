Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417B732C942
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 02:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786329741; cv=pass; b=HY1m1CKAEiNmIk2qIm2eZLbLJsv5ABUYNzPYzDStkcw5exYGX93n9wlbvdDZLYferNrV+s5le56C2l5LIAtj7Rx0jOkh+HKPEisqp1IDTadAkZCUASeHH3fxGOL35EZs8lPH5VOV2e8urLzkElq1fjBRn0Fwa4WxisNbTjDjYWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786329741; c=relaxed/simple;
	bh=BzgZl9hnAz3VCgWm+BG62xikp5G3ozdTCOWyDjfeqDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQa7Ssp8iURTMwDO9tpKa7wm0Q3nqOzPb8uIoUrBrW5AamI92PlGsFEO196pm/bcaQrYKcIp9cW7Ntfhs1zE579Z6Obb8f3Qw9epMFECY0gB6lY8MUrP4dxduDyfPXDfzagc5NpQjpOGmpitJexBMhJzOqQCfvOwFEmqtG+clhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmHuEdKu; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmHuEdKu"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84a652535dcso708621b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 19:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786329739; cv=none;
        d=google.com; s=arc-20260327;
        b=GTucLmUlzUU6s/1IyLT3fVhmGPNsJzNN8n5BNS/ZK3QDk6FtDrcHildWf7fUJ8gkpA
         KHbW7xit/sSscJKpgpgP2GU/3ShxK7AVYSnvkzDrIBw9kcRbKhmOGqwrGs0ewF+4m7g0
         IzafMoRcZE0ErP69Fb3Rkw4hBxXGCqV38OGJhSM6pvWGImHsZa/th8V7GtPNxRCgSRDN
         r8t+fO2JXUAeFoGBxL4BChX9Fsva2V8DsilxTWMmhREcfuVKaOgFP3sWQ8Zhmg7NSDb5
         N5URmLzh0QgPGrr/MNorFD15hSlobeopybxo2C+FgRo5MTa8tBEpaB6TlnJRt00Dura0
         rpmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ujyD7jgd2uYoNISfol1DV4SvsMNF2Ff35/OcJJPtWQ4=;
        fh=oHDCMcUrRG8CVi59TN13IOJoIg1Gqtof058R6ww9sxY=;
        b=BikG+KWXoLZ4NWFbp6+ToASuQDwfNgk0hX5A1a/FwR7wfr0PJWs6329YVuG8hQ12jb
         tJJR/6GE/9ftn0734GBLfb02pw9rstnwgcrzNjpL0mRHI2MfneCOByhIKM4YE7n87/fR
         8R9+niGAfgTUTzhMXBoCTEQPWF8mGC98l9QdVyhktTYaPWbBnRDk/Aa/kbhQuMIeI0jC
         0krXRFxZcWQJfuYDxqb6zDdXr6uIhGCdOd/LQ3JwsRTkR3A8EjxEGc8Vph1T4D/biN+z
         JBlRyHGyksm6Thy4s7Hg0i9RVgitIjln3Hv5e4JSrLJ0CMTpndBUxp4M21A54Qx8T6GD
         ILsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786329739; x=1786934539; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujyD7jgd2uYoNISfol1DV4SvsMNF2Ff35/OcJJPtWQ4=;
        b=nmHuEdKuNVQtiPLqYT4axDw7CTNkmeptra2fjMs/MeanTMyMZyQbfYfwD0BrTdxoi3
         zbbzjufvWw1HpFOulkZ/0WLBYMpDrvJzzb1IDeiAAtfqID3QGtqujPcf2vRq790diRnx
         XKVCFEWRcZszpVuEVrqxf5jKNet/I/0gsJbXO6oo0fQB1BQQMkiY3XIpV6QJk/6kZKhx
         xgFRvYJ8OCXp/JAVeJ8vJsfIht3O7mvGo4kbXYnLuJ8cnhfZDnuKrT4ku+wDUeWx52av
         gpoKARbRMQSkRUaYSBpMvdxJcRb0kVRMrXXSgtSOCyHwNmO57U08iWRdu8bOfMuvO4Rv
         tuww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786329739; x=1786934539;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ujyD7jgd2uYoNISfol1DV4SvsMNF2Ff35/OcJJPtWQ4=;
        b=VrGDiJA1WJS5u3XQxjnJN7ccEWtw55iMUcQuq6D3mOXUv9ZtJP7Anp3IqKsNAXO+kQ
         4HDW4TTo9G9k77B/mZKerL+8uG7gZMQciRWNmIwRAft9UZtLtBzptZK2k5WmP6NusDaL
         wFIBxDvZ06jPLl1jokK+TlPK8hWqW2GXOLNSUrG3QdMykPrJQ/zBkAtOHgQ9p82LJQsk
         U7MMYPzuHpbwDsk6AwHWD4DVpYxS/0lqI3V7GGcPkSpEluuPfm3edSGHBG90WTFxHFdQ
         uimzI4krB4NSjSCj5N92RDFm4PLxisLJGx4Xkv3+0j9VBJgAQLBULfAt/Qygz8o6/ByU
         02KA==
X-Forwarded-Encrypted: i=1; AHgh+RqIjaYszBE9BF6vkUi59eQ/lmFTqj2JPmOz4XRhW2infm8uTzcolltaE05fymtnB39LDBHIpCUBzBGijwJF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/06IvQoSpZOj2Kg4XAPRgTOCtA92hgZDj2NH7YTQNWm02u7t2
	xnQoffweHK3paU25hnmfPIINuwarJbeeiYApRZp7P48zM/egOZ5sjoGACR9CQ7Cy4/E70dW6TvD
	ZiKFDHOvQuk8/ltmAtmVioJpw8KuJwjs=
X-Gm-Gg: AR+sD12e89jG+OhJVKtawLXOswplmFBhR/0pbHpCuL+dz0vADM4nWOJiLhc5Ht40iUa
	6H5L8JusqxBLctRuVv9ycZlw1DN2QJvtIcE5o49BIw8wFQYtOApUGLfgRP8/iVQsBL+Hh0uwJDW
	ejyrcZHyROEy+xu3PlemzeOBTjm5HQsU+SkXMesBr00IAEHB1Zqryr8U0GfSlyjns8eKvZzrcSk
	glnieQJir+jw5hCxtPBbD5033eTk6PTKt0R09qNvIzl4IzdpAfkPtw3kinfVoFNULvhbpMJliDv
	41i7iWTyjA3Wat7uaawsHxzmDfzPa9Pxc/CR0LEPDgJzqE9MIs85oz/gQ/bU9BPl0/YESqYumwL
	qLLM/1X3VOFGUMvCw4thpmwm0sD+rdyiiHFA5zPoaTCSjnlFJP7WMrmmZ
X-Received: by 2002:a05:6a00:1d9d:b0:848:469b:3d19 with SMTP id
 d2e1a72fcca58-84f69700138mr18901107b3a.29.1786329739493; Sun, 09 Aug 2026
 19:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807081652.38692-1-phucduc.bui@gmail.com> <2eb8b31e-a3c6-4310-b9cc-7acd135b6c99@roeck-us.net>
 <CAABR9nHqKKbxkzBNkENadhFJgC_HuetV+ab7SVsGH+cwbF+OFw@mail.gmail.com>
 <9971b3aa-cb1f-44a9-9d58-4f75f0c6ccea@roeck-us.net> <CAABR9nHu4pt-Rg8Aq0B6KfKFHX+C1xQmMk6=j8jq1Zn-MQ0p6Q@mail.gmail.com>
 <ccd8fd7d-4555-4ac5-ae73-c16e98b8edc8@roeck-us.net>
In-Reply-To: <ccd8fd7d-4555-4ac5-ae73-c16e98b8edc8@roeck-us.net>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 10 Aug 2026 09:42:08 +0700
X-Gm-Features: AUfX_my6zYcbzcH2Wjjxkf8uek_ej0039cVqQTNpkObFSyVFxGT4TjQ-70scvlg
Message-ID: <CAABR9nEGsisuuQhLwxdcB9i2sEuH=AQb3yaPHPNecya8G_5ieg@mail.gmail.com>
Subject: Re: [PATCH 1/4] watchdog: qcom: Propagate errors from optional IRQ lookup
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

Thank you for your feedback.

>
> I wpuld probably implement something like
>
>         if (data->pretimeout) {
>                 irq = platform_get_irq_optional(pdev, 0);
>                 if (irq < 0 && irq != -ENXIO)
>                         return irq;
>                 ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
>                                        "wdt_bark", &wdt->wdd);
>                 if (ret)
>                         return ret;
>
>                 wdt->wdd.info = &qcom_wdt_pt_info;
>                 wdt->wdd.pretimeout = 1;
>         } else {
>                 wdt->wdd.info = &qcom_wdt_info;
>         }
>
> (which I think would be a combination of B and C) but ultimately it is
> POV and doesn't really matter.
>

I'll go with your suggested approach.

Best regards,
Phuc
