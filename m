Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CD036B938
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 18:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618972; cv=none; b=uWf2wSJegszJb2/cFzBj66bpHk7vudpzefu8LFYsVFfG8rqJS8Hy1xYSO2Q6Eh8EfK6teswGy+eiU4LHe2axmyBArHaVku98/tXKRNS7tx+D08OVqbIdT+AZMI+2Iu1x8NV/sdQ2ZETTyIqxw87um006sTbLQfcBsk2p/ct7xBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618972; c=relaxed/simple;
	bh=IJl8ZLVeSLK/3tm4qT2HpxIpgkaGExTUeW/aig9VFu8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=plXADwQ5E+/qN1cL0dedGKedfcr7Fi+D2RbZgYMA6QPqwpu6LtQ5FYZsVVSmcSWmT1ZLsSHOyTsKIf5adi+/YtDV33IoE+KOyDmB6nMSJW1JvzPd04CFsX+8in5orWTy3eOjlBQBlKZ/ZnWrhRBVe78iHruzG12dyGU+hG7Q3RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PJhbHkIR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PYFbVzmm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PJhbHkIR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PYFbVzmm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790618969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
	b=PJhbHkIRBFID5cswJ92776vll2KD9fgt0nDXJiPT4OZ0f/SvgmDkX8UF87Anx6/UkrWjPP
	5fzw94ZOd6SAHBX8zdIdHM+amGsRhWyLrT6KKRv9c8ZVZev/4ilzX8ghONdSJyg4rG8uGk
	ohi3QePa1nJcfZw2sf5/pvMfBxfM0ZE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-cDnUfZYUOTShSWvZ1CFJrQ-1; Mon, 28 Sep 2026 14:09:28 -0400
X-MC-Unique: cDnUfZYUOTShSWvZ1CFJrQ-1
X-Mimecast-MFC-AGG-ID: cDnUfZYUOTShSWvZ1CFJrQ_1790618967
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49ffbad2c55so13242335e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 11:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790618967; x=1791223767; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
        b=PYFbVzmmvZVGu/BkEygo6A2l/I0inpwH16sicqv/jgL8kEyBqZBILrYckSlQswYwiE
         n9DSKJordvyihg7YUPiR1aJO3+eGeSnXZxDznkw2o+4URA1bUudncN4zynoFiI4GOVbJ
         oLUsXRR2HEb7FP+KWcWE/PdX9WOmclUFC/ANinFByD720twiuaFqh3/h4qU5YRmMqh7z
         dq3IUVcB0BkeEzksBsvq+Ki8x4sYpZdNfvWGGyGp/t+VFT1/0xGo8ptIqcCxt7PJl9Be
         YipQYntnPiPoVuD89Ed+vGA76K6FyG1v8Mxo4z/ZGWT+MPUWoiB7fPvEJlczVqMA84Zi
         Kc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618967; x=1791223767;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
        b=wlqVaI1DuAzgEqBeXfeZQfWvnExoAcshDcfig1NS/8Pq+8FibEZsTGaMQ/Fs9kpB1Q
         ZszRSJnkzx0dFw/G4tnplp6RAVr0MV/xr13E8HvNog4qLvZAWPn/ULBtra2qwcXwce+Z
         /kzl0ENAfbT7lfn+H4PtZKzaVERl3zRLqTCqo33U+PvSa30ofd/OrnbOhpDWc8xCJfOY
         pb9jVc2ifUK+8RSwVjTxAzLMkj4jsX4xs1NlBZosaNPhTJiGtN6p2QFNZb5uoRI56C6E
         lpZny2wM/NVqbspaBeyB5c5YnrW1ijCNt1pnksTMTY8nOh0uamihA6Bn9roAIOjaQgeL
         jw2w==
X-Forwarded-Encrypted: i=1; AKwUvBwcPajfnw14OlUJlzTKg7MLxghxeRSGgkgGlIrj5b77zMQO+KJhVv3oaeuUEYVkMRMtQ5c5WWhxio/LifxG@vger.kernel.org
X-Gm-Message-State: AFuF++mmz6a8O7wQqr5ZkZRT8skScpJXQHrlHfXlN6QFZ/Q+yQmoGM5U
	18jhGz3+McWrBwD/q4GvTCgU2eKB3BdY5rPU+0YFSSWPvsLZ6S0eGWvkgvYl8tIG4//wI59wClv
	nYUxtm3aOzqJn6or0i7+7+83RDEN47dpJiPNZttfQjcmHRZNvmIBlge1OkBmiLcrONQQ=
X-Gm-Gg: AYBFou0EMXuNtkMsdGigN/XxGime1qN1wlpPzlCXayRa94xekbdzizIm7T2BD8PPPRC
	+s61xzd3ifwNT7ZdF2EwOF6H6Z61a9Q7bpg5VGIjpGbovpHsbk3HI0dRtncOdneJy1WXqYd+xvS
	rhVBMZjQZZhV5e5+/xyzMttFeHfdBgNWynAHiz8CHK3p6X8aWJR2zdk0xyulBhMZrmwK1KisBhA
	T1rp/7d56HobExLY8zW9aSMFjb8kZV4dr8gbtHYOIsBhrS9EqO7t9nkJpeWc+9wlu6gYdDrrb9r
	gyUofaOzCOq9uCe9b8yryolgpslKYPJRyj0SOcnKmcqDvnOxUkkRpv7d6vl4YS3w9xVOSbsmE5e
	GgE3UjQDIVEhUTa2hz21xTqy5FRItXmdcB56Tg7e3bus6ZZS2ylabm8owP8ZN2JnmCA==
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id 5b1f17b1804b1-49fe66f4c7dmr231739725e9.18.1790618966854;
        Mon, 28 Sep 2026 11:09:26 -0700 (PDT)
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id 5b1f17b1804b1-49fe66f4c7dmr231739375e9.18.1790618966445;
        Mon, 28 Sep 2026 11:09:26 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d10cb7dsm3533065e9.0.2026.09.28.11.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:09:25 -0700 (PDT)
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
 Zimmermann <tzimmermann@suse.de>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v4 1/2] drm/fbdev: Move fbdev module parameters next to
 module init
In-Reply-To: <20260928080323.23909-2-tzimmermann@suse.de>
References: <20260928080323.23909-1-tzimmermann@suse.de>
 <20260928080323.23909-2-tzimmermann@suse.de>
Date: Mon, 28 Sep 2026 20:09:23 +0200
Message-ID: <xlv133utfdt8.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Define the parameters for fbdev emulation in the source file with the
> module-initialization and exit code of drm_kms_helper.ko. The parameters
> control some aspects of DRM's fbdev emulation. Common usage looks like
>
>   drm_kms_helper.drm_fbdev_overalloc=200
>
> on the kernel's command line. This has been possible for many years
> and changing it would likely upset users.
>
> The emulation code is supposed to be moved into the module for DRM
> clients. Keeping the parameters in drm_kms_helper.ko avoids breaking
> systems the use them in the way described above.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

