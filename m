Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196496;
	b=Qk4n4BuxhSF126E0QekN/toHNMjzlLe4kc56AUHdab+yEBuSlCMnC6a2y2hpXIwfzg/U
	 d9CypaHKCwqh8ZKQCboVhssXsFb55/ZF0zf3/A9ii8njd/5H9gKsKYMRRPqxO6iUGSyag
	 S/cSO0iMV7BBH9yrKPFBCmvQVUFbjNdxQiQwbcsn5WqE9WtzlQjD2hX5R5iTsRSMzcWui
	 hxbEOWBiRCo+NjLoJWx3aR15vOOtVQMDW6oRRWx9WgM0NdSWp+mgRWx7JCl3BGFY5PNhI
	 gBA0PwHRIF1JstiBxIb+lLShxxqmzKUkQLb1S1549ZxeLzxIrPYn/gK36Hzq+x/pxxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kxLtuj83lfG0UYc5BBkeZk5kw3MAE+EKpdjGnuY48iI=;
	b=yfk161110prrsLaZkxr4T7BNhk9wcmaqd4byPnXodaFRu4d3/1GZkEyh4TjC9gPgyKfJ
	 gqsNHKUkasWNJ496uGEz9CycLioDC0ROVu2d+BO1hnwfNgNLnHEjtrjyqCzuoO87BbDfh
	 64gfDyToXnf/os5wpUXBfgSDj6mqCKbxrqHx4VfkoTj0pkoCeMYHBqkzT0QykTeMW0+JY
	 zCTACd6l5zqXHdtI+NWaUftLzC9fFiEe5rkmadUJMVIjwj8ALe/1eADzpsxLsn8mYWFLx
	 Tio6zL791hqg3bqvzj1nrFgA+5UrvAVt3RAHNhejUYii1wf+2JnZJI9TuLWKI+cWt5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qm+ZhYHa;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5E660A3812
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 17:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C5E660A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qm+ZhYHa
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53639b8903bso14430411cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196495; x=1795801295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kxLtuj83lfG0UYc5BBkeZk5kw3MAE+EKpdjGnuY48iI=;
        b=Qm+ZhYHapp0szXH0S9zpMcxW2RbSLzz/OXz8NgulXgjUAAU3zlsOZ8WcooTzuzcoS9
         mPnY90KqFKEVfGLvOQNWb0WuOgGyO6J12rXw7ZXm0lGz+eyZxho1Z3Ej3GMYPhZ8bjJh
         k3hGq+wm1nyFGRCF3JPvhLY3P1IY8RoEwSNMqm9r1VhKfu9nQitGEVsYEs3kPyM4ec87
         OyOmBpkNkHcbVev4cZW/PK3w1R+OIH4QiU3jxh7vz/g413B+JAxcKTb5dtOg/THB4vym
         7Krlf7FkrflWQ5nFH8zmA3iwX94e+LuD9vD4pA4vguHCHlXSjaJH927n7y69N5jJBdGZ
         0Zeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196495; x=1795801295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kxLtuj83lfG0UYc5BBkeZk5kw3MAE+EKpdjGnuY48iI=;
        b=u1y5tyRLJizAYR/wQW5Q7MTZQ0lyBLZ3QPTr1154ZRTv9gX+JKgzoNx/jlpdPlMUnH
         s4EqTCrQuJ/TWgFDsq5MnKW3uysEbXTRl3Qebpbgqk/jUUBoMZ8ovA46hJbze/hEyvNy
         AbLczvCn9G/SpHaLbR9PhDpyqXdr/ioI/8B9oRxq7nFrqG6hvnuPEvNch6VNcNjzbhHY
         SYI2H5OsL4m03pVmY/1SknXxZ6XCfI39E422dwzBlrEaWh20+LdKzfuiI/WARyADrnpB
         PTrccrxbCPcvzKigcUxWagLPuctTfF/OiyYvTwFLho6N4u9YEwyeKqmfbXJyCJs6I3+g
         L6Rg==
X-Forwarded-Encrypted: i=1; AL+hErHZxwCadLMjFtXhxzvqjnyeN7XRRQf5ny6jui8SSo8Pk0b/qQBPiMieZJGVDEQjE22YBGVLlnCe4Fta1Tfo@vger.kernel.org
X-Gm-Message-State: APuU4Z/beMPoAQJAbXaS462Rmr02tckL9WCcEXBuSCYsya2PAPEiChIb
	WtGCZRjZaf4LHdjlVpiHoRfJRTZ30Y/je0s8lHZWiAOkYVK2n/+47AHk
X-Gm-Gg: AYBFou31jPZWK3YNAlOY+5neWwFeixWRieJWXtAboNXgrubdvyqOD0LaT1hxIjBC79j
	VZufxgvwkPYsU7aV34jOjxlv0ZsddO7lvUoc73D/1znLnqGkdtI5H+zSz3JLJYtlXdJT01N/p+S
	4zyVmjUB51tmMwqQhQWpi95w/w4Dk35hDLdWK9rfkmq2cBlgP27v0I5/ezCpqvJ+07L+ZAL8JEF
	vHB5NRn9bvMg4wBkhN252HgRhwdhwlunOwp4ge6XZ+IJW+fywcYnLz4uqxdnwPsdf15fkGX0X1/
	baflCFx5qphaQIq2hMic6Z71rI/BnSh/7Gm0JsIrDHi5T+J3BLHr/Dv91URBE/RFK7+LxYwlQ3M
	SahAb5ORbC7jmmwF19w9tGgV14aem5vo+gsGiX0kv2oC4S2DeNpAnsb4dIrLLPzfrbz4OD3t46Y
	KLrLHJ/jdbx9KqjJUTU8fn2xzcXh+oxNSvy6Ivc7uM48c88rP4QjrEDJpveM6RxUxoQsEh8l6fS
	y/wHZKjas3m99BKj1gMEkaQ1zLzc4F7sywxuox9afI4TIRIJt4Clx6L9hJLRGKX7moVv+2GG4rQ
	iNbmsmfNGa0f0nEdOISifXOktZzHPKWlNkPpN/wv+Oz4lemTiPG5QwvFOzJHBc2+UVp/6hDHNhc
	w/EFyaQSxC3K2BM6oFz8/xYLIN8vQbuBCdthjcgb59oGSoxv9XmDff7JaATgFLQeK6raLa8KqV0
	9iOl444GoX6eFLAd3HGNMbvTWV2YBi8K0FK/y5W20/9GhDwAuJp9iK9/y5NK8STx9XGxZACXK4k
	xpWDlk5B8eRKJA+sCmNSsQczKUuD7182uutyzK7MMSUrg==
X-Received: by 2002:a05:622a:420b:b0:536:6c22:e340 with SMTP id d75a77b69052e-55d6fcfd016mr85938901cf.23.1795196494927;
        Fri, 20 Nov 2026 09:41:34 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:d420:4621:169f:8773])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349e602asm31538556d6.24.2026.11.20.09.41.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:41:34 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Add Glymur-specific resources
Date: Fri, 20 Nov 2026 12:41:33 -0500
Message-ID: <20261120174133.62863-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com> <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Nov 19, 2026, Nihal Kumar Gupta wrote:
> Add Glymur-specific CSIPHY resources so ports 0, 1 and 2 map to hardware
> PHY ids 0, 1 and 4. The remaining CAMSS resources continue to reuse the
> X1E80100 CAMSS resources.

Hi Nihal,

I tested this on an Asus Zenbook A16, with the series backported to 7.3
and the board's CSIPHY4 link moved to port@2. The OV02C10 on CSIPHY4 and
the HM1092 on CSIPHY0 both stream, through media-ctl and libcamera.

Tested-by: Jesse Casco <jesse.casco@gmail.com> # Asus Zenbook A16

One thing to be aware of with the reused CSID/VFE tables: on their own,
only CSID0 -> VFE0 and CSID1 -> VFE1 stream on Glymur. The lite CSIDs
get the full CSID clocks, and CAMSS assumes CSID n feeds VFE n, which
doesn't hold with three full CSIDs and two full VFEs. Both come from the
X1E80100 tables, so they're not something for this patch; I've sent
fixes here:

  https://lore.kernel.org/r/cover.1795196107.git.jesse.casco@gmail.com

I tested this patch together with those, and with them all four
CSID/VFE pairs stream as well.

Jesse
