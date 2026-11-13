Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531548;
	b=jm7hLlqcOKKTo33SYHdwmKRFCini13l145K7SzDaR85FT6xndfv17nDhdBZSZglv9HWS
	 7dKbrbpPL9of9S8wbydgY9PE2n+p7yxlnkxCLWAM0Y1Oj7e8c17iPEq2RfeGX2LebWZNs
	 h7FMX/eI6uC8VzaHIu8fIFZe7T0yBCKBYdvujFMhePCIK8Xp9bOSgUJVK9AjugUBnxCRE
	 UGy4aDk/qO/TRFtWtjRzvvLK+T+QI6TVsL1MPh2HSMn8rhey1UQwMs/GsMVb0gDo9esqk
	 4j5ZhZYBxrlsUYAldSdPlOMDwpWdhebmGvNcffLrsJ9ae+rw+0V9ruSdUn9tnph9wjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cnHQLMcLsmKQJDyIGTt0mvQnh81+ZXOZVkzwKRQPLt0=;
	b=Nmt+/6st/yc2r/0LfQurXbqPIKhVqZWnbFLybrTK7e1310T3M2KJW9KDDtOpU9zS/xwc
	 kSEL2q71IiTm6GUPa+eQ94q0BQlJFeWQRvQU9Z8o/aiPw/SiTFjoVV9PmxS87sHUhzsi7
	 GFIrqLwXp3fKJaeuUBJOqOM53zTJPStq6qGI7DQk9uZWJkAA5Xr1ub4TLOJv+uN9Ie4AW
	 89ynnv6wkak3bJ2Q34AnBJ6zB9JK4BZfDm27VkLmzBS3/tX1JXGEr0nVRQREAhrgSjD+Q
	 I0V3IEvN5AqMbwH5O0llB9zkDzj6aCwMmEzlOO2iUtceaqXwGgE1aKdLg4Ip97E6qiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXwA6C2X;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B51E606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B51E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXwA6C2X
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a2af4c8d00so38764c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 16:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794531546; x=1795136346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cnHQLMcLsmKQJDyIGTt0mvQnh81+ZXOZVkzwKRQPLt0=;
        b=aXwA6C2X78/aErlxdCDVlDcBhkVNyzQp81N3HP+FcVhJ/FM8Ts6K3OTLEdrDTNlTZC
         PZlGbsKqFdepUhhUwf0PTM4/12NFZOmop3SMoBLlrEo2OKDYLM2AQ+eqSG4n7pA3N1pj
         r5tFkM5LxFCtgMVGCSfAjr7e5Ubz2hvSMv3cYF2jhO92/gHpAxYLlGhuvE8Oam0NBvBW
         3d/2C//L92CiXCNnqw6r0R+4t9XZfGZjwz1VoaqfrCxDktj2prFI3iKcjRF+UXFn16ap
         6K7zLI1kvvv7cxwwJV6+lExKlmTZf4DnCTPEVPaKT1VACLFTNEai51iOa/kMF+qrecyi
         rbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794531546; x=1795136346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnHQLMcLsmKQJDyIGTt0mvQnh81+ZXOZVkzwKRQPLt0=;
        b=wQSj2HPSLBj1r8w5fYBuLbnCbTnvmbkUkWtwY2gb5HU/UXAiFY45+fu1XPSkhh31p/
         GSZH3cktqMku0auzyGkF6WXoEST04g9Tyk2jsrKVbt3LJMlsMt21OYuEkrx/fGYG/J0+
         qHqldmUDQ1On9wrrw07I4kO/De1vAI0DQpg1YlK6u4MdpEiLRkefg7SKuZBRRQMX2osO
         0bGnnHvgid2QslFiNlsQAsoYw6szqqxnodgcMsrwntr+a8dvKWsckN6Z5En1eUWuuBlx
         MbVUzY/3biZ5wIKldtD00ShR3O8m28He06G+mIRq7f6eJ1QiKDn2hjkOBX+rzcvIcYKr
         cZGg==
X-Forwarded-Encrypted: i=1; AL+hErHCX/YJzG/3zSvRChxkEk3gbCpzu3uyoRRJU5HRRtgJ8krNjM5WmAYixCy9eKxmeTK71N2GJcj+irsMBVUd@vger.kernel.org
X-Gm-Message-State: APuU4Z8cW/HGAvhSCLegoENgKOiobvodDYqKbxgZM4MqyF/P5C5gKRpV
	sP/b/E8K8gtnxgOuzSUAfMf7P+mBq2J1+WwHdLI39g5GNHXsQ3W1ScTU
X-Gm-Gg: AYBFou1sVuBxtoiY8OPyePxNWV6nJdDb0V43H9vN7R+lg98c0Lyxbz2JWLp1qnHl0KF
	nfecWj43yw+IPENSlK3pqRSCmi9HX5TUFBAZman21b6fXqJV/oIG4lCzaFLUOoy+11SLtPIHQ6Z
	uFAjo/W2EkGabGjkoeFpcGQjjgFSEPXSxTmElj74DJTB6MDvBgFUb89G9YvCdpHkE1Zf1GMKDTt
	VUWnDxtKYVFzAjK0dtsSXHBpipHnMwH9ZysfmTqaZLrLe7HFFb73eu6jmvhvoqXaHpHEM8MUvJR
	vH0hzALrF7ZRYswN6oKycmUQodeq11ZLR9MmRWY3cUf4+bF9mK4YzLMk8qb/sUDvln3i9s1t2Jj
	qeuRZpwvnGFItI8TGAhrjOzinyLaCPhOTxzOY0T490oNf96tpktlerVFoW5UM0IErOoZYZsOhUW
	nA1c+6Zh2d/e4kcuvIM/T+eJAG/0NEKgB7nMHi38aKc/794h19ItfnPRLNhEQNIYK99qaXnpbcH
	UFg071+7hDsrU59JC1JPi8Ex59ys7xicZC2R1EqJfmjGMXVlkeKA6V94arFr2TsDk+X0KpHFT/c
	94jD1m4O6SYf4Q85KoGLTMDMepvXI9CGW1TzT69//dzPj1UiHm+4ukP8Y0aypU/HGU9O+mc=
X-Received: by 2002:a05:7023:a4b:20b0:149:1feb:6d9d with SMTP id a92af1059eb24-1b5030fb74emr1197809c88.19.1794531546379;
        Thu, 12 Nov 2026 16:59:06 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm2760431c88.8.2026.11.12.16.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:59:05 -0800 (PST)
Date: Thu, 12 Nov 2026 16:59:00 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: muzafferkadir@mainlining.org
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-remoteproc@vger.kernel.org, linux-input@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 10/11] dt-bindings: input: touchscreen: goodix: Add
 binding for GT970
Message-ID: <avZgzxJtnMceNQnJ@google.com>
References: <20261105-msm8952-initial-support-v8-0-311ae8e8f14b@mainlining.org>
 <20261105-msm8952-initial-support-v8-10-311ae8e8f14b@mainlining.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-msm8952-initial-support-v8-10-311ae8e8f14b@mainlining.org>

On Thu, Nov 05, 2026 at 01:54:14PM +0300, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> GT970 works with GT911 driver, document it to be
> used with GT911 compatible.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Applied, thank you.

-- 
Dmitry
