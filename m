Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524409;
	b=Azq6X5aOOCkxddNAFt9bAwBUoIaLEXqBAvR4QXSvTQFd+KmsWTGRxzHvxdGfqbiwEeS5
	 JwvImVNdCa2kjn0zX4eko8UnbojP21JNQpqeInvNGYvRluEN3BP2ZsOoeDwxfXOtOn0h1
	 tgIqy2mQIy8ARLUZPSAKh6NjtmHfBk6WglqaEcqS6ArIdAYw5A94u/j8zr++zWvPrMKw4
	 FngwiHFX1buXpWo7Xxs0OKr96No5gXjX5YrBsKL94Nf6GZt4h8QGIkjTMutKmLIJycTo0
	 90kh9HHzkjG24AUI05hVAS3oBzbLuVlThTMKF/pKWSlAnD7tmt1cmO+2O7yi6xnM+ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=+cqAn1cvZfqce28oUYl/gZogIs+MYV7l073QLWo7Q88=;
	b=CG/sXCFNa/wSWY30QXfoAMqPtc7aNjGusU2ysOWPXaBfFOKp43BZeMsgtFC7M1tnYcUV
	 48P2tNxU/5YXxfrECqh+XDMNXcwJ5T1ZL9hww5v0CbSHN/8bjYfT7vG1zrHsUgzlV5AG9
	 y/t5gLMec1HeO1xasEhrHvhmylQmfbRwbjuNGlXOuuy0ZtEpL2aiLpcgnzkOFPjZPLog/
	 3oC6jSckwvjveJlRsIWU65VnLaQe8g+DJv8+HLJ3yGBKCwNkkjrRngYZ679zXDd5maR/i
	 pOSE/pOYj/gRbqdcZ8FdhurEldY8kXpgUly9YOxCeuvXzxTe45Z4Oc68l2GOyRi0l6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7871C606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 19:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7871C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso39372195e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792524402; x=1793129202; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+cqAn1cvZfqce28oUYl/gZogIs+MYV7l073QLWo7Q88=;
        b=Jl3W+NiVjzOLdc1yjvnMCh9KK49lWbGu6oFGzqG7xriQpMgUNfgDnSELLjjnSsld+Q
         2nr2+cxfgJdMkbp1xdfIDSUoNLkZFWsVkf9QmImgUZuCfto2aPOm3W+w6HldIJjHopuS
         kJHW0wzuahUKrihedWLGnL/YeixpC19vTRpVes7GFZO7yP9/Y1EaUK0NnJuWBkeXgUTu
         qhyEaCyP+UTryz51Af2O+HRdCKl6ZP2e6HzN00CnWbUJToTzorJGY8BDwh6X8Ewx0Xsd
         +9fcrNUTZxOxQSjihUYqcWPrYO5+Vwhx8L9WNh4eqevucoJ2I/14iEPBdVP7ywLdTPP0
         8nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792524402; x=1793129202;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cqAn1cvZfqce28oUYl/gZogIs+MYV7l073QLWo7Q88=;
        b=gW6utO9vrt6UTB90xxTYBI1cpJWVvtxReyH0yorxHc6kLPap0LHhzHBQInDAOMYXwy
         UqdlpS7Qy/6jJ6l6VszhHFe+h86qFf1SQOnuLM6N7RpV97JTTCNOYgmH8tNmCltrfoXT
         ztWzpdau+aYsCbHVpHhEKpPdsj2CO2rQRPppeQK+6TpHQN3rw+AT0JwJx2/t8++0F1pc
         IpKX2GT6hPi+vMkH8JJLTl+iVaK2mtO63gAUsTJ0NLoQ3qhWgFjN/0Ghp92yN/4/oH3e
         lvnuhTGvaEXhXJv+U0fh7l8oDzSqJPdD48VrhwemkyHogdPKCPWBt4kLbkPxyEO+DAaG
         Nkpw==
X-Forwarded-Encrypted: i=1; AKwUvBw5iP9MKfQ36ycjFut9ttEWF7tatakCq+kgUN53LdPf4SLxutrgKU+u68lT/hMXKfTELHX/dU1co/aUCgbW@vger.kernel.org
X-Gm-Message-State: AFq9FYK+tIG398JPJ8gRm5FSRmsNHApB0ehk+zJjJg2yEXUd0OWgrPJc
	H7yL6HCSqRHE0DRTzWJsh9GL4QcQ9jHLr5NhbMYdxCPLtI4Fs01tJBeXNMVBkjf3Uec=
X-Gm-Gg: AYBFou3kd71VN6gIFMRDuoEempWQWAfYbOO6SqLRiUV28drLc90BmKzGfdEQdFykBoU
	zGT36f26EiP5bkghw/7ZoVZK5dr54NyVPOUQZZY4ShHcnFyz05KbWUyOSC31DZPk+0SN5M6BWyq
	Z/hR/CUs68tIOJV6pRODQCmB0S8FHDpLups0YhyGe9PV4teDXvmVz7bgfldBYMnjWH3pGL0nPfS
	MaF5Tb89IpnljOKFP15ciIh0HUoRKuso+HfLD8qCmoR8g2R++T03e85aWEgjrKGYpLFRlyQdQOo
	dXV5kQCT68w0RDOV1f1hSeHUXhK0qeM7dFNKOdnv+vHONgUrg2cIhHKMZKXoqdwBLmSc4QuGlUr
	0UEk3Smu+pMoXQnx7D59E/trtuhIZ0QOWZUGPzs6xHolQ2WEPIilRKgcAN55s1SS51Ipt4LCq2s
	Cqes3CsCbdrUffPH2yGmyYdIq7Hi4vl9MedXUBZ2cR7/aYP6pTN7m3Xs1e5dkriRUtGCkO8UiCz
	pT6hYK/tcNz/o97mrwdkA==
X-Received: by 2002:a05:600c:c119:b0:4a1:dbdc:b2f1 with SMTP id 5b1f17b1804b1-4a1dbdcb405mr180375035e9.14.1792524401827;
        Tue, 20 Oct 2026 12:26:41 -0700 (PDT)
Received: from localhost ([103.239.146.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm846135c88.5.2026.10.20.12.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 12:26:40 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 00:56:30 +0530
Message-Id: <DM9WV4TQ3JAM.2KC03GKSF297S@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Douglas Anderson" <dianders@chromium.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>, "Jasper
 Korten" <jja2000@gmail.com>, "Federico Amedeo Izzo" <federico@izzo.pro>,
 "Luca Weiss" <luca@lucaweiss.eu>, "Hans de Goede"
 <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
 <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
 <720ed230-4284-49c6-9332-e29f23765944@oss.qualcomm.com>
In-Reply-To: <720ed230-4284-49c6-9332-e29f23765944@oss.qualcomm.com>

On Tue Oct 20, 2026 at 1:03 PM IST, Konrad Dybcio wrote:
> On 10/13/26 12:17 PM, Luca Weiss wrote:
>> On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
>>> On 10/12/26 8:11 PM, Luca Weiss wrote:
>>>> From: Jasper Korten <jja2000@gmail.com>
>
> [...]
>
>>> Drop the output-low, the consumers already take care of the state
>>=20
>> For both enable and pwm?
>
> Yeah

That seems to work totally fine. Will include those changes in v2 then.

Regards
Luca

>
> Konrad


