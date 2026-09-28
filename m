Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F8B377ABF
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 18:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790619035; cv=none; b=jBti+SbT8E39UxrS0DTojNsfjdaeD0L1WVvwzbG0Je/LD7jjAi+1zuRAe/JdzL+4qcrXc92VWouNmcuFi2Op5vG5mZrNg7PrB7EXwQ5/LxMq7Ei2RqMtxwj3nTjjkL5nIVkIDFxobzZLRNgXJBzAsnQSd7jUoffXNFsXr+avvg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790619035; c=relaxed/simple;
	bh=bbVVcjiD4ES+ov/wPnX+0XE+Qh3pApdn+aRpLrnrl9I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=t5OouFkiFmj8moMoxO7tDpCATy9ND5pj17aPDFAhQ2+DiBOqNIFUCcBL02nIiWMbgi73z4JiyE5uweUPomQ+xJ32V2sL8AtNyr3IDpNhewXtNJoXpiKPscoNvMsyRXhjfCN1PDBZ3zxKn8sM49deEPZ1coPCBGA9NihGwUY4PQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UpuhIlNJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=D1tLpPXA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UpuhIlNJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="D1tLpPXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790619033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OFTht72VGYwnHy4rRuIiS5N5orHNND6LgvZVdS8G2Q0=;
	b=UpuhIlNJJe2UFT1Iuh4GBHZWobfOJMqqD0kflurAEVbsYGvZEcPmR1E7D6z+QiKfqQtGWS
	N6Z46KWBxDk9EhwpgyTmrVVkUMrq0F5ZLbjfMM8dGGzgZM/Cd+1QCKa8IBABdYXb6De7e7
	jZ2v1GYG4azV0SHCYI8AHD+x/e+/6tc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-o1bG-sVZPrKNcWNxpEV1hw-1; Mon, 28 Sep 2026 14:10:32 -0400
X-MC-Unique: o1bG-sVZPrKNcWNxpEV1hw-1
X-Mimecast-MFC-AGG-ID: o1bG-sVZPrKNcWNxpEV1hw_1790619030
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49fffa5de0fso25408035e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 11:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790619030; x=1791223830; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFTht72VGYwnHy4rRuIiS5N5orHNND6LgvZVdS8G2Q0=;
        b=D1tLpPXARoZeAxaY6gpJ4I6Z0XRTb/LUXa5vh7I7KUJljAWxkpapD6YT1dUx+MqZoM
         DVe6SE1HEgdqm+1yicmQXJdKwkUm3MtRhGJKPJ+VmcbSIRkAgIKpcdqkPQ3fSBhTm40+
         46YpSNVSWaqXntaypYSgyT+sW8vm3USKA/dCVPW8PUw/oOQ0iKFl5DeOq5yWzrT1jMQ4
         IslWHxjrNLEA3ZqlfaPuUI9hvEEPOfuzaOqYIO8LJKLnl/iXsRy7clIXOWK4OpiWQwSf
         4XbF7nn9D5okP9XdN1tU214fMzw59uLOozIH4akkodMExCpmlelTJYDjeu668N2ACuhJ
         hE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790619030; x=1791223830;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OFTht72VGYwnHy4rRuIiS5N5orHNND6LgvZVdS8G2Q0=;
        b=KUzQnbDBRm4K5pDaxHpVBO0sFhJotBezGfX70fgsETgiGnerEReNTQLTlTxhqOxjNM
         AWRjf+WQGjNvl1pH0YcPNeH59pp7vDkmoxHYgrx5IHyLHo4LWZ96383odfL9wXmx1NyW
         QlPtLVraQ8ZcHa2UFJ+roEBJ7s+OSiQIdv4QdcpbYX8t4VDl74Vb0RoGYA4+LbuLIN4D
         BcASwpFw3YAaW6UkmhUIAURrUF6YHN06UJSTdRnHFarpiuz8JnqoX1tlUqaTsDfnIk4x
         Rd5D5PZUj6nvmiaNqLPavSXG/sJtm6Xfndl/seWV2RE+XMxTrzVdnssP01pns2sXwziO
         j74g==
X-Forwarded-Encrypted: i=1; AKwUvBztdxxMy43K2H1g9qLM1RxzV0KvLB0LVCeDNl1FTbHmx7OIVtu2BIqFsPW48kC7ufR72sDFGHra+KKI26g5@vger.kernel.org
X-Gm-Message-State: AFuF++nDkj1Ucko+j1rkQIC/xeVfvi7ArXP79dTXg7QRkrR8utnUcRl4
	1zGwKyU7TEf3JgRGVpEf1gVrczv0xFl4aYkXYCMvlbfpGFlm2buNgjzsjspruDKvyW8b5R93t2f
	BQH2bM7o0SIdmYLJKZWpBh/gQYbZPFfRh7cUit3bHFDEZ7z931okmVQAWNg+s9OBGFpU=
X-Gm-Gg: AYBFou0aj1+/3RlASkrJU2lWroItdK06Dx5R3zjxHuAIlUans5MJEgbk8bTkLhXQN3s
	0CAz+yReJBcK0dk6to/eVu6okLDsIP9P+tg9SXe/H7Y0gGmz08uGXMccTcdwYQj96tuG236+Gm+
	iCIKpKsQpCvSRco7yfEUkTDdpqtYKsCGIbG1KtNgZSBkujs4KpjN2zheKhZ+AY7LmBKQTK2Q338
	Jw6vCcRwasniosbRCEACZrALBT0HRDtOt/TeetlbDIRFkwBcqHJhZVUC/AIdGeT0NdKUskSv1my
	8lchBCGgBM5wMpo79fDSOMQavGw9JsyM+fIHudqw/B7F7f5BAWngDdRFuon/F8Rmqtbhmv0MoTB
	y6rWMyyrVRHBw2JBbjDKAS7OIxuZZB+VZ3U+h6f4T9AqwOCqerS+CPmKgL0ZVmUhXzA==
X-Received: by 2002:a05:600c:4f44:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a0023f8d93mr91712415e9.2.1790619030021;
        Mon, 28 Sep 2026 11:10:30 -0700 (PDT)
X-Received: by 2002:a05:600c:4f44:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a0023f8d93mr91712165e9.2.1790619029624;
        Mon, 28 Sep 2026 11:10:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe16a2sm9652415e9.4.2026.09.28.11.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:10:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@linux.intel.com, Alexander.Deucher@amd.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, sashiko-reviews@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>, Alex Deucher
 <alexander.deucher@amd.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 2/2] drm/fbdev: Move fbdev helpers into client library
In-Reply-To: <20260928080323.23909-3-tzimmermann@suse.de>
References: <20260928080323.23909-1-tzimmermann@suse.de>
 <20260928080323.23909-3-tzimmermann@suse.de>
Date: Mon, 28 Sep 2026 20:10:27 +0200
Message-ID: <xlv1zex1dz70.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> DRM's fbdev helpers are for the fbdev-emulation clients. Move them
> into the client-library module. Fix include statements throughout
> DRM drivers.
>
> While at it, rename the files from drm_fb_helper to drm_fbdev_helper.
> The old name was too reminiscent of DRM's framebuffer code.
>
> The GEM support code for fbdev remains part of DRM's memory managers.
>
> v4:
> - fix the depedendencies from v3
> v3:
> - remove obsolete dependencies from Kconfig
> v2:
> - update armada und docs
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

