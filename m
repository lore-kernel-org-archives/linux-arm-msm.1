Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E815444CF29
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 07:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544318; cv=pass; b=De0HdvNdwvbe+U9n/1koXAyl5IWsdwCsnRDTFwIt+3Zdg4dnc3pxEQJj73GvSAS2FZStMPWj6hQKvfmyrVPSi5V4pHIGpm2iLYczxYPnhBDKJmM3Q3Q2x9VDYkqI8J0nLph74nOXpVMqGwsKLIQErgK4ieFDSbK8fUieUy7KYxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544318; c=relaxed/simple;
	bh=hQYBSbI5ZDykG/tHrbEEtWawqAnT4ZwcW8GfIYLRIEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=haoCTaL+fKDFkg6hru2p65NvlRcF4dblHyUA7Fv7GbP2KWlrZAD2/uzwhW0iS2sQW/3gindxDOA1aa3N0n8ubf5s/NKYyaEpCXgWA1aiDghhec4XfSlqbd53Ykq8dY55l0ID6vAtYdC3DxG8VnP8abNrGAW3t7v9BuIvpt+XFXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=b32oWsj1; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="b32oWsj1"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-910537b51a0so4501876d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 00:38:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789544310; cv=none;
        d=google.com; s=arc-20260327;
        b=MHaueXiftx5UHw88LtM/XXyGl6tWiixU7AwNeXRgTztdRIEt+VDldaRP7wFapioxrW
         PvIqz+GD89gTYazeFU6Sn6GvcN9JT76nWITKeJOwutro9LfyXXdNV6ive1sf2xHmvRoH
         A7FiLQj5jWg8EaY3DrIKlXC3395fdjlmGtUrBqrtlW3f2nMKJ5jv6ANh7ABn/M5NnT8P
         s2SdgeadB2e7+vyvN+CRNM7vuBbUtRfy7PZUzFyWdju9hcwphpzJcc4MRS26KlTzrI8N
         cLV9JKfpYa8C2jYbVmMEBhIfda9sliVKamyU+1raIVW9Qo/B9CI+AqcGn1VZfVOEwuPd
         8YAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hQYBSbI5ZDykG/tHrbEEtWawqAnT4ZwcW8GfIYLRIEU=;
        fh=Ynbrdd9D+P1pRz6gTrSVIVIVrgIITtfkYLfrT7VKFgg=;
        b=qaqewdY2mZ9PitAeYLCmmeGYlbKdJy32xx/tCEIB4R3UqZg4IXfyqQSLyXSBiVT19+
         yDcOH1bO658TbB3rT4IcpSdcyihmEZ/YxSU+HH1ZqRi2dv1Y8gQhj3Yc2X0H5p0bifNT
         3reC15i6QViuK5bpxBCqIh+BxmrlBFdlteV/ABGjYg2wDvYC7qiiHrmMvilUHKiLhzbg
         s/16KTHxVhZSLVH4kZG0iqRJAXuaQKOovUWBkANkLHt/OyVmaJZmLDWuwPWb1PD46OFe
         xlre5x5MCDIUy1gg1SIf4lbTKADU35rXj5LO7AzZRUCAw6gJTm5PY21/lVNkwD3uTP88
         U/8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789544310; x=1790149110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hQYBSbI5ZDykG/tHrbEEtWawqAnT4ZwcW8GfIYLRIEU=;
        b=b32oWsj16mxTGEh19RvHUbkJHkIwah2h4TxsF7HLpV77run0DEsVR+XTo1qDJ8oa4T
         Euveeympooh5Xdh/tx8nLhieBUztvkwi59ZmqrtrstKXcuKX/8HePXbWUDJtk92OnJ0t
         RYQo1azCxSMHljt+rD4MxrYz6cmXmi/Bjp3FCAwU9TDBzeVW6U0Mp83DglrETsfFfhIj
         12oLXDWMbFw+aK5Bo76A4EtvXuW/tG46PvDMTssINITG81T4a6/Z3vmpa5g9Ymldbh5X
         uYuSzKKtasN/Rd2D6iNOLKOddvvF8PRXU9zZFFzLa36hHU6vF767LIHV+9f3RHeqFu5X
         An0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544310; x=1790149110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hQYBSbI5ZDykG/tHrbEEtWawqAnT4ZwcW8GfIYLRIEU=;
        b=vgEKPvRgzywz7MrJpJ6Bp4F6YrOGExD1kcOFIYsjtMdNOFkWgdXo6RQtl1ubGJZ1RI
         RyrELwVObxCqpesbp7hkf2h5GZQAAcSWhsjkT526Gv/FkaPbGtRrmWdfAkmurfvgZRxS
         rqJus29Ur1qfClcZtvuWo5xyzvOhW+CXnY9pEsQO5+u8PxMhYv7obuTFBTDDIcAmo/dE
         0CMI8A/0I7JkHGUU63gZ+KBd05urKaZfTvZYv6XAxgdWI09SONx+SNuoC71C+dRZ04f8
         KodNsU6p2Sk3RWfHt7G3MJF2NiMGaRih0EsrGQFPx9esnd0F/CLFgIta3MWFG4nBhAVV
         UW7A==
X-Forwarded-Encrypted: i=1; AKwUvBwQfshTJOPegE0i90kXNxENXWHmlHHXCGNcYn46JsdS/Shrlre1XDyd8plpN4g9zvWzIIu9r/ENiVGyi7XZ@vger.kernel.org
X-Gm-Message-State: AFuF++nwjiQCsAH2mFXYPJSoR9LKwRcGJhtgMLtTChFSemPWoDN0q4rc
	Lc5xFohT5HU+ye8Yqs+v9nRZnnFpDBRxlG9dzi5kl4eFFpqAyZZLoW3l4X4/1VBcP3bDp2q1PP7
	TsGKPw2YWOlqVFO2dlsKzp2Fe8iArKIAJ2o0zV395lXCzigBAwxjJWzI=
X-Gm-Gg: AYBFou1K6247cL/odc8W2oAZAGnqV39sWaM2f0cWQI47yOA+AZOe+uaSqCm+mxI4vaE
	Gv+/PBBfQZfDLRsVmSKRxI0Omcx5Q+B9snF808CdTPB4Z0TLnwZctyzqm8GIvUxWdXVCujOWAKd
	OFx0H2uXvoTL2x4aK8aJMKfNvLknglZ+WyGnZnp1M0GZU+TqlchIzFG68xs4JwIq8bfua+45e6P
	h51XNQDShnCQXjWO8E8rWxE19uA1h/gH3eRfdvA7ZjEhvNPW5nEE3IYKROVutcw+39OcWj9mAhD
	EJzmuxIKIzixYYXyXutG24xkwpdCrX/n1MeuS2yJ8e7LtOlcut4+F4BSUUN3poHH488Rq0+lbk7
	AsYapNZl83HBp
X-Received: by 2002:a05:6214:500c:b0:910:6ffd:a941 with SMTP id
 6a1803df08f44-9123d721985mr29575576d6.5.1789544309746; Wed, 16 Sep 2026
 00:38:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
 <20260907-acpi-dma-v2-3-0ffe4a007992@thegoodpenguin.co.uk> <aqlzjZigicrtyh7o@lizhi-Precision-Tower-5810>
In-Reply-To: <aqlzjZigicrtyh7o@lizhi-Precision-Tower-5810>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 08:38:17 +0100
X-Gm-Features: AcwNN1Vn5ljoRLzFV2GiG-9S0jHlKDZRzXLPscawH2jK-lpFtONtbul3vK317do
Message-ID: <CAA6zWZ+tBBWdsZFGySWFsRKFq-FYy36QAYVQtUOPZ4GVGDYudA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dma: qcom: use named initializers for acpi_device_id
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Please update subject, correct tag is dmaengine
>
> dmaengine: qcom: ....
>
> Frank

I checked the history of all files touched in this series and all
existing commits are tagged with the dmaengine tag=E2=80=94I'll have to
correct all of them. Usually the tag/list name matches the in-tree
directory name, which caused my confusion. Thanks.
