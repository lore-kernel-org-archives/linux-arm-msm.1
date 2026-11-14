Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794690104;
	b=mTaAkxe/1SJblUS7JywyXHxuNsQPau1lq0bfXOgBQrY1ExbND45Xnw5LW43jeTCOPAv/
	 z1x59iGTG8OuyTo9u5AAgVs06/GIpreuviNWnhneGTcgDKw29dfOvfg3nC0vEIN5zWyPa
	 9vNTysrNciv6VS6vDBw3CfgmCUI/h7zEg7jFmHolKmZNBBVnXNDudWfmOvRB0KiwBMHXH
	 FVb07wgToYrwylEO53Jj/f496HiWUe0dzp5bJb2Y6OiJYjyFrGwUTNCHLEgbGNWAcmytL
	 69SEm4WVwLvSU+XxRDl4Rxwwr3Mgu2TkXz/Hy4lEFNtbnF+zWa2tDuYMHA1r60u8UZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794690104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fJ5ePlRQ3ctDArxbodZpAid0v47e6mJlXhyHTr9zcZM=;
	b=yXO7oMxVNU9uA9i/SmPVuFKmBVOcUHebOOk938RKTzyj2MezU2Xy9E3mwjmRgnIib1TX
	 BPJdnWmfRL+RIrVbYbUafhF5lvdIgS6OXbGVtkdXHmBplKpfntbDNJhkXXsE3DZauGAX7
	 Q1sK70ZV/lrJ3/Q2WkyNityxIbbAcpvcCPe8RHbnh+jo1o8ST3ojqmcJpFRD72/uvixHd
	 bGqHP9GVrBBPTC4HuIueWrhS/LNYrjynyDPfBtQT4bna4FzESocDAO1pLyTApPStUyLoo
	 WkGQTW/Sn7z9R0ugEDgpyYgk2s2ZTflch5lhRgD0Qx29Wel3UA5b9+uQ4Vkz3AfWeKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ErVKCOcU;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB131606A337
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 21:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB131606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ErVKCOcU
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so2877315e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794690102; x=1795294902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJ5ePlRQ3ctDArxbodZpAid0v47e6mJlXhyHTr9zcZM=;
        b=ErVKCOcU84Ds/S6P5yAsvjlHW5ED6oVPBK3r/ouFYhcuz2n/ROUmxaT9uHw4Jy22v/
         lyiifSzSIhKPRtDn3SGYSBs4tjbeoPHnx/QMFTqmsIz7qfpAwmD1PtAqnvwSI9/9L/6W
         dcAg953KhZHdNTUm0AHbUTwLc7qwPzzEijyTJs4ORhfKRKW3+yRWltH6Gme/WLFP+nYm
         8Z8vh6aEDglOT5K8tE8u6bHNB9IDPbZdLepQPHRRL6R6Qb8723yNEBioOUSEj0ekfDAp
         Hy5WYGRYR/BD0lzP0v+1Uu3IjweGYQ//7IdOF385/tfadcHzJmDovFZU0TI99XW/59tT
         IHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794690102; x=1795294902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJ5ePlRQ3ctDArxbodZpAid0v47e6mJlXhyHTr9zcZM=;
        b=oXknqKjvwZdYXGeOa1p0J4HH297kHTfzapwXs3nGQNEA46MulzuFCzH20VjfZNPZxe
         tEB2TnALy+VAqZdS4YxLAtCcyNCq2+gUP6tGtUhD40zrWzzWehrIu+i8iskBWhXL7qqG
         u+L9py2DyOjxdOMpUgrL87hdOVB50/9v8aFKC6qzU3snyNlel/2e1FAL1t2ViQliy92l
         0qBIbJWLqf3B4Hb5JxHBeISOPS3sxic06UvDxIwZfDafSmI5ywj89bNhu7VGQHZ7FKYZ
         /aaaytBj5VD6Og1IR/U7Lys08AaAqifsBPBzQrMbs+wHm0vuXfGVgEEbjFOrJoxlJh01
         ettw==
X-Forwarded-Encrypted: i=1; AL+hErHMujKn0KBfj6La7liWk05I8kdkq2Ra8YWmDERwxxr04ewsq1A8d0xoS+i4EnK2vVI33cXjFjUvA+Pj4UUF@vger.kernel.org
X-Gm-Message-State: APuU4Z/vTYuNq+jdZrdvmQXN1TOY4F57n2zs3WE/w3tkRdrpOsvJ1tbH
	jZT2/I0rSdPkYY31ggwqkt4oGAsKaftPSNb4H7Y4ABYTGXZiXDAnNmMu
X-Gm-Gg: AYBFou1Se7hum8RSwYPLtCfUhvJHepYKWm9sFQSr13zHiiPhxqX1LYwfaM/gFZxjb61
	7ekvEESRVun//lWRxvTO47sO2NhvRXvYAmgb31DNcuNsN6ct3LIbRlLAMZSWtcGuW1KAkRMvV4F
	VY1A4UnhsdUEdrIZYvsO3cC6fKQvABIzvJp1NjX9NGN9MbPwXx/hkFoo2T7xLS8Pil0P1a/LwXC
	y299qBo8xLCcZ8EnYnKGAiqGbMZYBIkODC9qrktzllmwFU/WlHzRqvLFtv7gdjdoYwxSeVOigWp
	HJfhLsQ4LQPZXjyZkIFYF+qKf9wSQuVq6rhoxUkgg2yFjNzeih8AF3chHAyz5enl1MTLAUNe+nq
	YSoCf+VAAvnbVXA9AniIYDA2QFI+xNoAA4jH8hqSXL9MRZWu/ZEW3y5lG7q5iLZOm+dbyWu3270
	kAV7tqrw/SUwNE5TTp7RIgiRK94p4wmr6B5fgpxVVlJKTM3dVjVzXfHr5cFZ7OJWomAqxT1VdsD
	nyE/3/rVDHr8zueyWz99Da4yzgl30WFO+1O2mMLyLgbX+FyvokfRyML7OHGd4amDYi1ulk86KfN
	W9vR33Hvq1zro8PHvwnf69z7ymTUFeZ/SMvjgV6AmmDfw4cC
X-Received: by 2002:a05:600c:4f07:b0:4bb:6a5a:7834 with SMTP id 5b1f17b1804b1-4bb6a5a7a48mr7149015e9.20.1794690102290;
        Sat, 14 Nov 2026 13:01:42 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb666a3ca1sm68359985e9.9.2026.11.14.13.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:01:41 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SXR2250P
Date: Sat, 14 Nov 2026 21:01:29 +0000
Message-ID: <20261114210129.1925778-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112-alluring-meerkat-of-elegance-dbec9c@quoll>
References: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com> <20261108-sxr2250p-socinfo-v1-1-06244862f5c6@gmail.com> <20261112-alluring-meerkat-of-elegance-dbec9c@quoll>
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

On 12/11/2026 12:16, Krzysztof Kozlowski wrote:
> This goes with the SoC/board bindings often. Why keeping it separate?

Resending, I forgot to Cc the lists.

There were similar patches for other SoCs and my DT wasn't ready yet.
I'll add this patchset to DT v2.

Thanks for the review.

Best regards,
Stanislav
