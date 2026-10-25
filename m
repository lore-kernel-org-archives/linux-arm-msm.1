Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792932813;
	b=OGgTW5ADviT9HShfbyT+8F7tECg79zr97ZzMCUQrfBQ4WLRzHWP+mRXsTazsX3P4ytnL
	 q7Zv1XBAZCbP39XDVTdVszKu2nDcIEoM4gP8x0tUeZqU2+LFJFAHlFZr55fAwKpjcoVNt
	 AnGQxrKh9dzeTvGgUZJF6WeaDrwcfSLFfv0ljRoUmdNY7WftE6Ll1sbY+HpEfHnCme0N2
	 JOgNZlVG9FInr8/e4BlMFtdYq//EtLKdS2BgF+GxUPF63JJD/gNROw/yWvSJLY+oHSiJJ
	 zMUdZrNMm8xoCA7UJmAnR7aK4WRVLGohBkm0dp0Oq4/NWg/RWZBasuh43VBYGTgZRHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792932813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=AMW1/8fX8Atf6UqsvjpOywQP22hAnwECitMY445RWYA=;
	b=RKnRVi2aPzyMA7SEFEAEKzWpsEy7QK96VxURrZTvHATV/JXYPhdDdWNoKWn2Fn5iH3sX
	 l0BkMUyJusc1C7OlA52aCU6xiyn3BNS4TzGbiOgSEG1we4a/VNVXOSVSprTFrnKosOi/V
	 OK/yQIp1Obk8KG+9yuiOMHxgSliI7XcTsX0k8RKcEYMQAJ2PWUqbg3BFtIx3OwsJUUACU
	 ItuWNp6dbPJiPGKeWpErzJBGribkQ8h7M/g3AoKjfb0uhJVcWrmfQrY5WM0LZFo3vNZWf
	 1F73/iloXSk/cOyJVCN1kIOceH2WsBoHitzixDtWwbg+NJk8UDy6U0nXDht62WCTVCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Llmdrzig;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6632D606A31A
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 12:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6632D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Llmdrzig
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so912795e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 05:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792932812; x=1793537612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AMW1/8fX8Atf6UqsvjpOywQP22hAnwECitMY445RWYA=;
        b=LlmdrzigULCw7LXFZFwAdP2Vn3iH/E1G2//zG/GDW0P7dIvxXL59bnV/8syChVhX8g
         rcV8cvAzoPqeVIsoB1NEdk+El01hFp4CDHUZ52Oj6JU2qanpv2fGrUWS+ZEOnOmou9XC
         y0bIwhB3UQ9b/uN1nB5xN8FDgQkBpxfbeRQ0Vhs9+8C3gMhq+4dHEG9a2uxRWC8GYEe7
         0o8FG35lmMYQ7uofc2izYnsD8MfazR7btiI2atwAPi9IG2gJoaGDS49hnCpat4kwqpRC
         2puiknFuCAuCdMKF7JYOnUKqvgq/K/LpneS1GxZrnXO+4XWSDZ+Gvvnx14YCmKKOOorR
         NgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792932812; x=1793537612;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMW1/8fX8Atf6UqsvjpOywQP22hAnwECitMY445RWYA=;
        b=uBwB4QkC2fr5yUoIZ5fZF0CSEG62+aaaqe8dGlkjqVJhaLXbu13XzJXQGOed2uITIz
         1ALHA0U2POcW+Ik6CIpIeJez/yZ/fviiGFhoWEjZgoVntuChJgx4dEtkLtc7LEVnZeKK
         /NOEDU1hrpbowFRki7QqeDfl5wm8wVTC+tEdYl0oVU6YoYX22eo1pINBDZ975QX9eUIr
         5rHMOL6VLbZ4LjoX8gAmBipwJpoByKxs+GFU5F60nTaWybfFPdWxKIofRkX9KcC3XcsM
         PDJs1CnfvyYJ0EkodwuYI/TUfMJrNKv1iyzs6dWbX74JCaJQPAIMRKwvx2Q8U7l7E5Gu
         d/cg==
X-Gm-Message-State: AFq9FYL/fE6R5j1QXck77+DVH/KzSwHH5xTimVipnjtbdevoCxbqdjJI
	T9zKIMpUBNToDMW/YXfe+IZ47zLyIoYTkH8P2X9c9bL2VtGiAPobHQKk/M1XoKXo4/8=
X-Gm-Gg: AYBFou0fytDCr1BIzRAA+jOzykan7uDeEjbIj9m8K3sy0k+WrD1T9cWMUWh4c/3dj2I
	IhRWDDhjipFpFxyujbxig0wXRDu7uNyTRbgyHntWKAXNPl1X2N/wv22TGUSVMg75LvyYlBxAVfe
	2UMtQzlOb2GTfKvq06MKgLgKKqyPdBQWN5VYs94dOqCCKhKXomYpdbo+8kR6pXOnxNBZ27TcPbf
	2oNDLL1b4WpvV9/l5j4lqC1Nrq4o5bzY5uNHhX6kLh+2hb1jkfWpGGm85KgUsB9qNMsUTQSo7GT
	Scx5XTJBB/wy+Vvy2fwN+HMxaUC7nSM0nOZmSl6PZmKLqNNSKTL9LoMl7zoN1MXEgE2ksDf0JEj
	trnqZqeT4RA3EFUViTX0mhd9UXoFI7qbfO++b2ja4XZ7/vMWIWKrLl8CZkeJ8eCmep9MF95ANxu
	NA8h5ZuG4HnPOXI7NbdBbDfClObLuFhWJBdmbGpzmDrWw0VY/dwhQErPXEYVIA63TRE4IDwVCjS
	9Xk5yCFScqclhKXiCufoXXqXEMV0wCngTLF4PJRzXP8NniTs4QLCVDKyHvHXoo7VRvRfVcNChdc
	duSZ0VRUWd1qbUAMXt7Q7Bminl4NMMEz/gzONnB8nS+54Yf6nxc9Vs0p9r1RIK1fBs1k
X-Received: by 2002:a05:600c:870b:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a35ac95981mr70164175e9.14.1792932811603;
        Sun, 25 Oct 2026 05:53:31 -0700 (PDT)
Received: from hermes-agent.lan (228.red-80-29-82.staticip.rima-tde.net. [80.29.82.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece14a1sm10240448f8f.57.2026.10.25.05.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 05:53:30 -0700 (PDT)
From: =?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: keep vblank enabled when entering self refresh
Date: Sun, 25 Oct 2026 12:53:27 +0000
Message-ID: <20261025125327.208328-1-ramonjesusmiranda@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9ee7225b-588b-4253-b766-5e6ee6dffb04@oss.qualcomm.com>
References: <9ee7225b-588b-4253-b766-5e6ee6dffb04@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/19/26 3:27 PM, Konrad Dybcio wrote:
> FWIW this is not enough to get self-refresh to work on the Glymur
> Zenbook A16 and the 8280-based x13s, the screen stays black if
> there's no updates (it worked on the latter in the past). Dmitry promised
> to take a look one day.

Thanks. For the record, I had already withdrawn this patch after the
sashiko-bot review (the self refresh exit path, and the vblank worker
touching DPU registers after the last runtime PM reference is gone). It
was never meant to make self refresh work, only to avoid the atomic
helper warning about vblank being disabled on a self refresh "disable".

I have no fix for the black screen, but I am happy to test whatever
Dmitry comes up with on the Surface Pro 11 (x1e80100, OLED eDP panel).

Ramón
