Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810940;
	b=uBfs2rZnxA3WhA9F7KaimWgER9TUyWTOJX0xvQbNuJUWD/FRHbB4u9SjQkaYJ1tngv8J
	 r952tf3/pFyrarUsijt4XTECsoorTNwmJv/DOz1n8IHz11t7CFMal0NazXcRUcTOhfD+W
	 WxScofngXB4osbxE6tJif1OcRjYlKdAkO/5tv6yNZkm7SAkb8TATKO5ivB8d98HQDHi8X
	 8Uxq2IrtBQA8H8rMUIoiVCo11XQdOl9i/4mc7/Ku5xHAdqsqzhsrBOQSua94rm2kwknCR
	 7JbcSR5/SiGwvpYn64e+Dq7cus1AAqbieYWEZRld2ABXIt78PsA/g+Whou2RiKDx5KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d42c0lsKAH/3dqQCFaUwqRJoKAQ44ktKOlAIQMH1hCY=;
	b=D0OqfK4H1MVtWlw9t2jCa/LF6Z5k+1mv7P/NzzfnTaJRGwt9zViQS2ZOzC3Ul7Wy35pJ
	 iQa+hIszSWQpUiLDlU5nBTSYxRqMlILvcXxCUJ/u5LyT4/AOEBbPd4Y6upvAmcWWmqq3t
	 XLf9aKvUMbrW/oCiUYovB7157Afr1HXYkNsfpuvp9YGtEYduNePj2bgHn3D+kOh02IaKK
	 3Es+wgYZfypTnrne4eH2d0bzRpNh9gzkQk/UhtHISd4lAUJz9xhoxD+H/p8hY/6qZq6iH
	 hrKmyigFHws9oHt8zhvsIKEdo90WnZlaehTAHAZz+HQoSgqtoEDW0FjEHkgSwrPRvLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OzxlIDvH;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B262A606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B262A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OzxlIDvH
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso1020379eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 20:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810939; x=1793415739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d42c0lsKAH/3dqQCFaUwqRJoKAQ44ktKOlAIQMH1hCY=;
        b=OzxlIDvHsBuVBGUMT+8hhDmDm2eraWK4nTBCUKtlXeqdjCWhOVVKs0LEyTlgA4CakO
         hOKTMvk2s5xQ2y7oiVo8Ei/AL/PfDavAKCBaVNpItzfDKRkzgUD7Twkq0cvqIviMydD7
         zuC25cLkocAPUh0ikOsEUtnfkVBmqgPb2+l28VMJp92uiWHwteFwFEGY6TWTRc4tgHWB
         FeJVCGiXbSScFv9BuFW6Vip5MK4mRbIjVaqDILDiX1HgF3TS/xxaB8AMt6j7NAK9PPcK
         NQW5rwFHVWiVdtnAoDsBwWw72WsW23ZWXTl87S5F71ZAwgGLyBQ9+5K9O9Q/2gfvolMj
         2Iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810939; x=1793415739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d42c0lsKAH/3dqQCFaUwqRJoKAQ44ktKOlAIQMH1hCY=;
        b=BgI+zwZDwcupUxnErp+9jLqVvABoGCXhWytpDI4gubnyLFqgSEJK/O84vIGYP0BIVY
         CHu8SYPwsgOqfyem4Ne0bTBelcYuGwQ3RQHmaFqFWvikiX4Mb7zPY0uxTyWtPOEUMe7/
         5x7hjKShclURz5Yryv+mGuZo5D5sAbEsACpbpKxt76QrWzfiCqFUkqEsN4xbaa6SXtJO
         qFhfkOz1G8qZl553mdUu0DQOk19PqfC/OocVnJ6i5ENwvUt4++sNzrTt2tqmllVf0U4u
         hQ5xU9EVSgxj7Dn1P7rCkyKMdj0o6+AwBVpoGyXP5i7LTQbpi4s67IIkqkwZK9+PE7Tr
         GD7g==
X-Forwarded-Encrypted: i=1; AKwUvBxpk4iQFAFIlBzruErCXDQx56uy+dcOx3KhItz+FSaomKK5fpzbmpvp0//1cR3qGnkHET/uSQE02kZGPsoQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/XpFKLoAQVjadh8nX+G5vhpYf+xyQeEZwThokP8AOC2NUm0oP
	VmLQRf9jK8X210xxAX5dttxsm8ZeUG4J3FNiZW2IveuvvAC+ZaflMxQM
X-Gm-Gg: AYBFou3WhKoF1s964z0uNjLQBOdFq/37b1dxhiCSOYM9cWhFP1YK/nR5TQcVL70k9XA
	Vphoi7SURw4z5tt/vXOxoilt78qygKdwPPgN/gSzX1qXV6aG6RybWnamTD7ww3wkgkCITemcrZK
	3w9JOHOw6S2usGuaah7H1b+0LEMeK+owQ+26Nmd6FWnFA4DnHXt37P7GVLqH7FPmquzkY1Wo0qs
	z2lZAZo2x2oXrXC8tID+091PuvQPHM9PgWud24xHBVx8nS2KWjS3Rbrb3LhDwZD+EONOQx+/fq7
	wYiFTffxTziCDVAe8xXgKKbDllrwbdZKA2jaOwdhufBtthMSqqu6t05YxRYenoTPEDnYfcpV9jD
	LyQ/uDIgcpCPlNEmSVV4PSedw3d8uH7OdvczPLK9nLEfnFd8u1eQAlO9BmasY7lJkaSZuwoem1C
	HGtUNjO2cf7cWymKKOuB6ckR4kAUDp7mRlNRZklQEjFLX5x26k0yAonTYG5SAN4MlPLEGV/hcgL
	JzMj+JDCwuJn4nAfSGKi69w4ZBg0ibfNY3BzJqmVj6UpGPiRyzj8UbWLMi9vZRVZd1tQgtHJn6s
	EAsa
X-Received: by 2002:a05:6820:a514:10b0:708:c97f:5542 with SMTP id 006d021491bc7-70ba0f72e95mr238732eaf.76.1792810938704;
        Fri, 23 Oct 2026 20:02:18 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:18 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] drm/msm/a8xx: Add Mahua GPU support
Date: Fri, 23 Oct 2026 22:01:24 -0500
Message-ID: <20261024030142.13643-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
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

On Fri, 25 Sep 2026 02:44:34 +0530, Akhil P Oommen wrote:
> Add support for Adreno X2-85 GPU present in Mahua SoC. This GPU is a
> smaller version of Glymur GPU with fewer slices and smaller internal
> memories, but shares the same register layout. Also, the GMU chipid is
> different when compared to Glymur's GPU. Add a new catalog entry to
> support this GPU.
> [...]

This fixes the rendering corruption on the HP OmniBook X 16 (X2 Elite,
Mahua): GMEM is now reported as 15.75 MiB, and GL, Vulkan and WebKit
render cleanly without the sysmem workaround.

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
