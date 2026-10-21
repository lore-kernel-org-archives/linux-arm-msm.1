Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575864;
	b=x569E9NZF2av8zURJSNoTQXWJP/jEOxB12ftiv9EyNkkuFObp0tQCDJ7r7ptywLR/NuC
	 B/8Lm67VAPNV6yXrLirI3exDGkCrjBBLO4vYfkkCEV/oo10lgsnbGZxQOC9ACoUHVopPz
	 GVa8dPmVzk0kNfCs4UvcQeNm8nkHgT+Uxq8vePdCt9gd6KpsDU3zADJoQcjXysAGXFWaL
	 8AG2RoHp/v3GEwsvOnbkAx1boIBy4NqSP8v8LjfQ4LtaetTPN0MYlNTD39xej9hKrcSFA
	 w7HAY4kXVwnvnhC1fIH+xKP/eLz6O2NOc1aPAdF9qrLGAg3VXRJlg+uQ+T+aUr4msTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575864;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=ZfPMlrVQ9XLjh6kjdxO0ST3Jv2qXKJ/BPZ30eZyZokI=;
	b=Bxl3GmlJivA73ySG0jXMLZ66OQQNeOGpVDPB2wC0GpARcj6sGGRkLckzV0HNj7XJdJla
	 lAPnBQTqIgqY5wIkmeu3mwmoHMRG5PAzQUPAzm8UxnVdBoFRw/GLYXF21CcP94sF21ivW
	 2WbeLPgPHP57EQEwHCsgKmHSHrCDhK600s4XtBH6YCqdwhVNHsLCcIBoxmGNQIGIFu9sJ
	 sMQQYhvtUAGmn1220zoY/3JjQFpJAPUsurxX+nsxN7UEOFRvxY4/QGw56tHIygUMgIXoS
	 qf8lKhZpxouPWs4sDZKju10asGUVRigek865BZUdi9XS3xHnbaGs2+/uIsjk3oD89RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZV8/07lx";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B89606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZV8/07lx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02691F000C9
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792575864;
	bh=ZfPMlrVQ9XLjh6kjdxO0ST3Jv2qXKJ/BPZ30eZyZokI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ZV8/07lxlb2aTrg1iON4ftQikyg6dlZTSDaPmGjBXyMjqGzj+HYdSe53s+ScYG2/h
	 rrKEudW8pCnqznx6nrPMPVFvDBAOGrWtYXofY4adc/56hvHqmHuHazvA+Znau/qvYs
	 iIk7MCySit3mrXDfx5FzkoxWyc7xwDWpmL/n5qM17SYCV+0JKOWLi6uVSXJP9eHuxb
	 /nLDgVXgH6L0T2bw1KmbVQXqCwInLCvbe8qNFzbWRG54pOaWIm8716hxDX9gK3XZza
	 s1bs0nMdLHPQ7Nox1cNsXkUchaWIz+QJiRehG3b2HsbdOyJlhWarRYmNpM+H6pTDvB
	 XxmjgGO2olUDA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be4c78e8caso429547e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:44:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxSlPjLmD0lpTjU9zAL5f83KQSa52UTIGz7odmNXyo2pRsQ7yAzP7MGAk15sUG2J188m2u0YIQHj62jcx41@vger.kernel.org
X-Gm-Message-State: AFq9FYLcmREMV9HSMNZxuLOe7e9EBMvOGUEmBaFkKVmOhXpZm7tbDcwi
	Y7TLstr0LYI/T0A3gWADsg9njSlp/TE2RKsXWGqIERxmBUvx1WzmDgOtIxvDPtKzEb8DfBjmFjy
	tt098wkCMfLbRpUPdIJkMNvoxyfvgfNfdAV/S6ZOV3w==
X-Received: by 2002:a05:6512:10c1:b0:5be:50d5:594a with SMTP id
 2adb3069b0e04-5bfa1c2a956mr580646e87.26.1792575862744; Wed, 21 Oct 2026
 02:44:22 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:44:21 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:44:21 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021073633.2163128-4-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com> <20261021073633.2163128-4-shengchao.guo@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 05:44:21 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdB3EbjBzrYDZHArERviS+J6g2dxAw7=VVoQ-1LYaJRkw@mail.gmail.com>
X-Gm-Features: AclHuK9TBV6PrDwxsS95btH-rZknLNEJQWHFvY1vAuIKD57w503S4mKxDklkgVk
Message-ID: <CAMRc=MdB3EbjBzrYDZHArERviS+J6g2dxAw7=VVoQ-1LYaJRkw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/5] arm64: dts: qcom: nord-embedded: Raise i2c18
 pad drive strength
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 09:36:31 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> The i2c18 pins (gpio154/155) are configured for 2 mA. That is not
> enough on nord-ride-embedded, where i2c18 is the audio control bus
> carrying the TCA6408 expander, ADAU1979 ADC and PCM1681 DAC behind
> TXS0102 level shifters. Transfers intermittently fail with arbitration
> loss and unexpected start/stop conditions:
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
