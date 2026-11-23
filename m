Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451160;
	b=CWM9G8ZSf6VB23YBSVuCtfyW82sY7ZXsmcIojzj3tHypRrTNgsgLurX+l9CRYuJ9bPzZ
	 xtK5F3++T8Zj5gD5DZgr72LsSss4Nkfasjz6EtRLTj9ohJ2gwG7FFa5rg07tFwRNZps2R
	 umRVOteZP0ZLpsj1QGkKX7dNt1jz90wcmYYAFGXa15hWW365PGCEksMYdWNl39745EiMT
	 ZlcIhWbMpxJWKQn5kyLV/MAf7WMKjJORjdVXdvoMLMAHunLfwZewzCUBsxd+LRwQvJUQM
	 GVu/o36MTTh+yp98xfVPreku4PUI2XNZlxAlzEEgokZtUL9x/4741PfCc9Zit7xoSHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UKsPhBFXVevVRUvcrB6+ZjmJljc8N9iawL0bPcXvtQY=;
	b=2p3ln+xw2PkGXty937i8zomqihCodoiN3uF0AK62TjlzG+ojvEZ2zNKztdd+jDAgUo5Q
	 19QIUKLr3a/GR9JazjKN634GevQ1KjqHK9jKg38oad0UvDSOzTajzTaHT0rYCoLgIJefu
	 MYjFSKdWl5oH6VpjkENhoAozyFrRFob28xK4y3RGBwCMOlV28tQDJuK0GEq+RYTaGLzT5
	 BjW9ZB9UEO3d3ZDjheRBeg1WiwYqaQrKBOme479Nth3T3I8EIU48Ra5z1o+jTLlHY3yiG
	 p3B/rWle4NEjbzOAk+Djo1IjXmaI4JJYv1PmWsU3nA5zsV/UEnSeiZLFaD1rXFMxC1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7yNcOt7;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2902F606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2902F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7yNcOt7
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1626938b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 08:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795451159; x=1796055959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKsPhBFXVevVRUvcrB6+ZjmJljc8N9iawL0bPcXvtQY=;
        b=x7yNcOt7cT04fs8xUAzqjVFJLIZfiwgG4K+XlUM0mKhEjtJOq0QTYSvY9aMwLMdn+A
         gkS5xiradWIfP68GPDpdqHUzpvGyzaZ+1O2fri75fbmrtWOBH2milUODDsf2Ewb1KxYj
         fEpntjb43R3tigO4706ht0BCQ5s1euLdqDQuDmdKIladlclpbd5on4B55ViqFwgXIS/U
         So6kHhXDq3Q3kyf0FDFpIrhNER/32RClupvVhyfz6o4Qds8nb+sQMtVgBzKYWjFaxqEg
         +bv1RidgKDsx9uIGdsqEFTaxWcKyd0v4mnrhkxFdH0uJSBfROhcjA2X6Xm+KQvQxStHh
         P0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451159; x=1796055959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UKsPhBFXVevVRUvcrB6+ZjmJljc8N9iawL0bPcXvtQY=;
        b=FkD7fCsQVhMhCkmu0tXlR8/wAJf1+mfI3pqbwz+pgpNHTUgkAtxvH0Cadb/4bu0x84
         JZWRKkIQ1IBVVJfFaC55eniHRDikD+yi6y5IY2A2+8zBLUXAlFARLpfbPVvSBhGpL2k1
         DOZR9rjqewEbPgnXtEpBJVMLTQzRTJN2Da2R+daaHkwZ1ydApf1G952NN9Uu5UgyKRjs
         EUSQyorLRdCk5ltZCNxS9q1GYiAKzxCnY+tbsWL+jt8FwqsaGdM0KyA1xu4WQ3U+WgbM
         qxs4sLfw+rS6KQudRhs3AG46Zl4PMzOMqkVSvQNeWPIj/LLwUADl+DYgtoXX1g+zcLEn
         O8cg==
X-Forwarded-Encrypted: i=1; AL+hErGCALNmDgDdaq+IpXHDFjSO1SvZE0OUHl7LAND9EbpxRLzaoebueJt+jHNuCF/jToJhOyb51z5Hgyz0GVKH@vger.kernel.org
X-Gm-Message-State: APuU4Z9SVc3aHAIgWCbx/xWC/zHDAdoTefWJWYXlzvEMEjRBBR43dsNu
	miwCXohJQrs0yu937fSiB/n1BA9sqXiYZR0CDttXjS1bVJicAkpM/M0=
X-Gm-Gg: AZFdTZeTj7y5V/M6mxOLVisLrVwHsjcypFwk/vi5FLc6pFJ6s1ggv41G7YcQIpfXD7E
	yqISB7EoIOjzGdGuJqDfwEDtF0y4Mn7CUrUxXTDM9XETBxRO4UxnS9LtRs23FuQ6vS1zavXiykl
	kJmH61V9a8CSNzDwFrmNCOtX5N9E4rnti5h0ZeMJBVBzAIC+R/bv0tFrfaqrwC1f0clDFvSmSQ0
	i+f5wuUXdq3Q8Ri1x4v8LuOG54QMHD6bj0uzLZP4+72ysZYijT4u0fQ4C5/FmP09C9PLXuRI+g7
	Hf7T0JGXL9DmU/zIhbhTbbs6gm20oIL09sCfNL7SxH5SMrhCeBFkgDLp90qESHfNrcjvzoRjjMV
	HFuoMS5IJ7mm1gu+zntoe8pNc4TPkNGvbMN+g5nt2bD+EIWtvVXJ3GLFlqfr06nka5DaSK2rqXV
	TiA2gCB5jMvCfai56p0335jjuzOVoeFgEWHgE1I35dr5RRMOlwAHAMdbg8iTfrh00aMv7L3nH8E
	xL5iAQw4loACrEGcw6Nj9zKrOsB4eyLplaiYz5e0bAIYs6+MQMfyvG+0vikPd9c+EDPUqXdu4gK
	5DwucRui15yfIKnmG/+9so+p6OH8BB65kuBKfmsaNuZnMUkk/3b6mEFtKYqOf5o=
X-Received: by 2002:a05:6a00:94c8:b0:89f:129a:9590 with SMTP id d2e1a72fcca58-8c87d01fbc2mr10377955b3a.48.1795451159489;
        Mon, 23 Nov 2026 08:25:59 -0800 (PST)
Received: from [10.1.1.198] ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4af1fsm5904879b3a.28.2026.11.23.08.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:25:58 -0800 (PST)
Message-ID: <6052053c-5e1c-46e4-98e3-e6e7608683c1@gmail.com>
Date: Mon, 23 Nov 2026 08:25:57 -0800
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: skip the link teardown after a failed enable
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 robin.clark@oss.qualcomm.com, Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
References: <20261104072048.3486286-1-burke.cates@gmail.com>
 <0212b0be-857c-475c-98a3-165df9de34c7@leemhuis.info>
Content-Language: en-US
From: Burke Cates <burke.cates@gmail.com>
In-Reply-To: <0212b0be-857c-475c-98a3-165df9de34c7@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/11/2026 03:00, Thorsten Leemhuis wrote:
> Was this regression ever resolved through the proposed or another
> patch[1]? Looks like it feel through the cracks, but it's easy to miss
> something from the outside.

No, it is still open, and there has been no reply from the
maintainers. 1bda647ce61b was not reverted, and nothing in
drivers/gpu/drm/msm/dp has changed this path in v7.4-rc4 or
next-20261120: msm_dp_display_unprepare() still calls
msm_dp_ctrl_off_link() after a failed enable. The patch applies
unchanged to both.

Two other postings touch the same function, but as far as I can tell
neither covers this path:

- Gianfranco Mariotti's 7/7 has a Fixes: tag for 1bda647ce61b. It
  gates the dongle power-down and PHY re-init on dp->plugged for a
  cable unplug; the off_link() call stays unconditional.
  https://lore.kernel.org/all/20261121214105.32596-8-gianfranco.mariotti94@gmail.com/
- MST v9 08/29 replaces power_on with active_stream_mask. After a
  failed enable no stream bit is set, so unprepare() still runs
  off_link(). My patch would need rework on top of it.
  https://lore.kernel.org/all/20261119-msm-dp-mst-v9-8-ca61be4edfc3@oss.qualcomm.com/

Xilin Wu's broader rework (hdr10 v2 09/20) has no newer revision.

I'm happy to send a v2 or test a different approach on the A16.

An AI coding assistant helped check the trees and draft this reply.

Thanks,
Burke
