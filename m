Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794690759;
	b=MH9CA7F4s6Yl5hF+rbatGRuxISd8XiLVPJ/zIwHzxV+KpaFbT6otZtpQ+y1ZoOCVwei0
	 1WUKELw0DnO1DDKGPqjziGcb5eMvo3p7CcR2GyCMbU0yc8bvnIYHzRdsCGMdZgFGu1ISC
	 2gVSiFnMY5tcny06YPmK5VZftx5tmcuqGMvxAo14Wy9bZ7ygd+0mSIUloOATyTuGpOCWA
	 N7Z9Z0rP1irCZxxXeP4wRQ/vJVDAnNkxwYUDMli6Git4ISCZFN3+Y2avxB9oNrn94WCfb
	 271ffSgiVl3VuxEjuopwBy5bwr2+XO43Amc1VsFYzxHK8X9TA2uem9YIWhnRU0ah1ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794690759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fYKKHnF9THpqWFzZUjRJH65VqrOR/R487VmPofFOtpQ=;
	b=vPaGPb1rQuvLH48KyNhzi05gymcR4uEvdE2tqvICcFIVP5PHqgbxt+GmTKzi/jy9dHnn
	 Y63ODp6w0BYGMTrha/9MJF0KvIwtsQGWpcYa7m8qpL7mkKCBhpOrezwfnv2Q+pWhJ51Nt
	 itY8aNyEGNeBSj1QViQM1G0ulGpMwmm07tI39FoWzLYG49IhdXHAoDxk9D4csqDRUy1N9
	 gNO/8IZdNYEzTqbYVGgIV8//HzILos6rVWvcup0SfuRz363nXSiDDoeriUVYmDEvosK1E
	 jb+R/ixgF5c7BNC/pQFjI4y80illHo4+bnej5RT5+4o0VUpcZqJbZmj6R7Kkrjxl3CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NyFD5umR;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4B8606A329
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 21:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B4B8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NyFD5umR
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb606491faso4146555e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794690758; x=1795295558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fYKKHnF9THpqWFzZUjRJH65VqrOR/R487VmPofFOtpQ=;
        b=NyFD5umRBWuWzXRNHhhTax4Br1mnDerRXAyYQRqz/o8qiZj8KHC/Tp2JZg61hJWeZD
         c8EKK7CxhwCH3BkUdQk3CuYhPMeeGeuyy7RPLATQxOFOTuVmdu1Fzw4pCjVzM71OKepP
         dkY1LIW5hV4G8uVGdCJfLvwnvLZfk2ZpdzJHZsAbLsxgebNvdh9wBmpyQ7e+VRNgsDF2
         7fWJjnv/jyW209F2rSZ369d8XNIyGTqRbjesvAMJ7c3Uo2gt5kEyxUgVxVv+YH1NZNcG
         H5o41mmOUdkevFgYBvMPeo+M5b9Bu/MXZDvto0zw53ZYfHMvfiAS0DpeeYGPSu79zEfD
         4f4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794690758; x=1795295558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fYKKHnF9THpqWFzZUjRJH65VqrOR/R487VmPofFOtpQ=;
        b=vxILd/C1bwN6WM0WY/QDyUUe3xyVXBtAvZrRhl098hlEXLudqymXDBBLaUfyTrPtML
         SYiXJWcc1751gR7qv34V3GiXZT2gvF0kP66AHvLx/+fyYam+3Rrjh8kxN+PrsyV1bciO
         2ofGtg9HMPf1PjukbTVXF9Af7fNes0nKQGOcG2PCOMppn0oWtzWHUhJPbA6NUxO/DtHI
         n6VoLJfJAUrSXFJuwU5JJCIGr3QTs850J22wLMU1oFw4aBltdJezsfabuMdIQSiS52Jt
         9vkTLSGhLnjRzVAPueGaxpRNmEGOwHwZA7JTDAjscGH6cwtVcNr5GGZBlTcNpIClSDn8
         bu3w==
X-Forwarded-Encrypted: i=1; AL+hErHBlHPnRnMArYCL5uVrD+p1dBaiu1riC/eF1p+loAU5DG+D2rECQk3GQMwSxe+MaUjs9+KBQmDZjz9myXWk@vger.kernel.org
X-Gm-Message-State: APuU4Z9/6i4u3XLK7OqxSlA/ou4QWRqU9yvjwf8PUkp0au2EQo8p7xLn
	Tf643Wjv908kujMLV5fvVb9XfcHrpNzvB+2t0g2+0sUANDXQZ4W7Kfp2
X-Gm-Gg: AYBFou1oMun0sPHdz0IGXY6sK00fjFgT3dGVpfomagZ189QWegO2/Q/QW57dbsBA+O0
	+RvsRwWxk9AmdPAH0WNwzXOmZtmzJpmbjGVXDC6+Xn0cPVQa+pm7eV3o7GeAVX3n5HaIkpi4CDC
	xVq0KPUlvPsiwLVomaPEKxMeSL6ho7GWvsHyXGuaWlXceQnkskXR7M7EMcQfJ58VMHmS2c73yyC
	PdNJrd5VWoVjZGlIviGN7/F/Y09zMqYdFxsNQDFvbTvZ9ItVMnmTIRXnBnfBCFR2G4SxKLxX7jY
	EhFpLcjV2CATM1hQDIkFkTvL5o85wdi/OVS3kjFH+fSnPaHIFl5PUPU8eT4uNSRznHd4l1wAPl1
	FTaCngxLNa/sqxjmujyzO4fCJTPH8FDp1+hyT7sg3NFUs1UYdFjuK9oYxOCmAziCJOMTQha4cmB
	DezVL3z1Q8kmf0gSgeRwvnqLQCt+6DVanaz0XaHDIgjCdSUvoCSoUnUbRyDEPTgBsdwgnjRLjpw
	1VIxRQ8tvWsRGWn5qCZe3CUTUvs2OTds6SUo2xIrrm6nuZjZiWe0CTRw4/YzbRjsXA5ZN0Zubw8
	i6tQ4RVtgraFgupSsBTNSO1bsmw=
X-Received: by 2002:a05:600c:e557:20b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4bb55a583bbmr84669175e9.11.1794690757810;
        Sat, 14 Nov 2026 13:12:37 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm267895855e9.4.2026.11.14.13.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:12:37 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Halliday SoC
Date: Sat, 14 Nov 2026 21:12:14 +0000
Message-ID: <20261114211214.1928927-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113-doberman-of-unusual-beauty-ce6a57@quoll>
References: <20261109-halliday-icc-v1-0-def7cf786f75@gmail.com> <20261109-halliday-icc-v1-1-def7cf786f75@gmail.com> <20261113-doberman-of-unusual-beauty-ce6a57@quoll>
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

On 13/11/2026 11:31, Krzysztof Kozlowski wrote:
> Why isn't the rest of interconnect patches (bindings) in this patchset?
> You sent it the same time just split. Please organize your work
> properly, so subsystems receive all patches, not pieces.

Thanks for the review. I'll move the OSM L3 binding (14/17 of the DT
series) into this series in v2.

Best regards,
Stanislav
