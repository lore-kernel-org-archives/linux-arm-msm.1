Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810941;
	b=bHZd/fDUWKME4jHSgTfgULBBX+JGpfk++Pg2AdH78Ybk3d0tQTEYW3eW0vdr4ZoIgZNN
	 c/GgKl8Svv4pyxh6gdFBM4vtvmCK/pT++g00MWpm4xsK2XO6JMM5rVVE/uFaRrEraC7sS
	 GmNhho6kKkpF7pDn0yBTSovH8DonUgNhhKIow3wnPU9ueG7rVNxyj5SmCYADu0XE5qbkD
	 Il+GCSXHChC2f0fXZB9IDnSWeLfzHKVYpzymxGFed0BbDRBY3xWltcG/tIa7clgOzj33b
	 EPzOchCo2Azl8GCL6DCDHA/nePHuJ+E1NbQ4aTHJ6Lxg2+ghkdHv+kdIwGocCD5Jx5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YUo+XtntZbYcqPV2ScMpM1XRucfaL+Ekp6Xynts5zkc=;
	b=wxWOojAXUJ0sT6P67WIDJvugvlb+GMYRDPReSHcqyTaj+sC5+dPyD9YNLdWVuLoD6/KZ
	 V5hethOC6QxcPdZa0+SlfqjEKfBg36UqcLyzYT4xR6/6sHeCizUn7hkmEcSJlAHlLn4jd
	 L/A2ZxKIzrc5iL36WVKAeBq2rMAicGVW2QzI0Iez9KwICd1JrenOzEz4Pm9lH/JNKiX/q
	 rueP4fKu14/xGlCqyD01Ioww7rn+cM2HBdE61VAxFbDFxLmNZD/YeDq/fYCDQ1/FJzS48
	 r+ovLbge+lXOgLsp/7Zjx6pEKOlJAwjVVeuvVhweM1RoxMSUNBEwUEKXkOaXiVsrPag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VsVaqSr3;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75068606A330
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75068606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VsVaqSr3
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6b1afdf5196so626229eaf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 20:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810940; x=1793415740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YUo+XtntZbYcqPV2ScMpM1XRucfaL+Ekp6Xynts5zkc=;
        b=VsVaqSr3vGYJqCiG8HH+ooZMO7LUI7VGxBsEItKVkG05zStzwyGmdpRrdKdn0hx43j
         +uCERXXm4lFEsKIN1dNdRFxQnHfFfeXMBv2nIkzgIM5k5rToGUvQlluXHFiaCOemeDQZ
         YujB2EUS/lNt6wX5DTB4kdRhe93wr3TQxEqJWHYazFKgQIQH5XOFuYYFmfpS/NTTyu4T
         pHSLwkrUVQZMJHlJzEO39FCSbg7I8036iwOG81NLnspYQPb9pB5JKNONsaXNRkOAq1CJ
         ZzuyS0jIULVX4YQzirAQMaJ4mwepgIdYoI/02o70hoHBtaNN7TojH9QSk/HC+22z1E9n
         xn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810940; x=1793415740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YUo+XtntZbYcqPV2ScMpM1XRucfaL+Ekp6Xynts5zkc=;
        b=Wk3uhvS+B+TB1/sJV/LzL6fNPE2cuKWaVQ4PZDJ9vNWPWDgmjgaTHObb4wMkp6MS0L
         JZaHe6dH2btJb58zsgMlgmIPmQg/ESWSSkI8PWvLR8ucnpfwcQi4XwuyPhIsh9Vdkz9Y
         nOb7YgGcVIdEldBQiwMAaRz2AMl2DmUSc3yQULW041kHPW5aUJsjST25TARtTfjtLdn6
         5GrZAxuLkgno1pFkm33yxvje+zc66Mi6BF6o5+V/AcvQigp8NCE0s0tc0FzI2NWYxs12
         OllkAXFkIuyl7WcnzYPcF48cyiIZ6WUMypuxq46nscJjTn6dAl6lf8H6w50/ak9Ra9lk
         eIEg==
X-Forwarded-Encrypted: i=1; AKwUvByugTDnQExxCZB8NcWfqUhmTDVOwX0JYGKm3xgnSiAxeYiauADFof6RdpgEi7CXBIuXtJj9thRemH8f2IKs@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9x7Psy96+nmuOQaKVyVKQqe0FSTJnTIQ5sTXuaXy0ByH7/d40
	ZeWBoUpYwSp7Mz2c+yhBwblc8eLJo0/iinTlsm2FDUBJw5YaUDJv6ybW
X-Gm-Gg: AYBFou1voM/K63QOzoT6WlkdYQCnmAkXbWtllDh6dazuTlgeROGKJ+Rlic234nA1wjO
	FMQaPKBfY+EGGmpOqIp9qJXnSkSAujxtH89rLVKu8waUyfNP/33AHC1gwFJs7dUDavv2AqYjg4+
	9LJAT9btZZHYMkA8ZAkr2d0WhHPKhbUkHGsOMLbjuBMMrUHBXBnOy2hslJqMKEWTQDbak0NOBGd
	kugRmoqlh6lFysJC8okIPleCpo2IxVkPshd+Hpn0ZGRghtZa5oHX4tKlpQXCEg09YLNxRWfF4gH
	on49FHupMZ25Uq6+MYAP6AMlli3llRI4/+QflXquUBcqHTiDoNhCjyPMoP5ccO91bEfmlEPDFBk
	itw4rZ19RYR3XCgLM1LHASad/RL/FT695kM/79WiA6TJCEEp0fG7jnynzqeTjyA5VVxn5rM9tIk
	80LlKEILathrPWqfnQNCkX0DVSfYViSJNF6UKDjIeySR6QysOkFnnV6HpFNXPCbqKp5cEwHwsDj
	UpxnvPU4rh/VsGhwIFykJBoFnGxRZ4IxIX2hU/9OtMPX6Vgu6lvWblv0LoC3hyU/XFsOHmsgKaI
	kWgc
X-Received: by 2002:a05:6820:1344:b0:6dd:1d22:8573 with SMTP id 006d021491bc7-70ba0f02572mr353232eaf.67.1792810940397;
        Fri, 23 Oct 2026 20:02:20 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:19 -0700 (PDT)
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
Subject: Re: [PATCH 5/5] arm64: dts: qcom: mahua: Support GPU and GMU
Date: Fri, 23 Oct 2026 22:01:25 -0500
Message-ID: <20261024030142.13643-2-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
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

On Fri, 25 Sep 2026 02:44:36 +0530, Akhil P Oommen wrote:
> Mahua SoC has a new GPU called Adreno X2-85, a slightly smaller variant
> of the Adreno X2-90 found on glymur. Override the compatible strings to
> correctly support it's GPU and GMU.
> [...]

With this and patch 3, the GPU and GMU probe and render correctly on the
HP OmniBook X 16 (X2 Elite, Mahua).

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
