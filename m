Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744890;
	b=izD/F/3kNVyeQ/Rm78aWqL88zitxmkfWEfEmrxSPgjJRnqrqxDvxI29mgVO1d6TLvgQQ
	 zwWNMXI7WStbSUK/EXqRii9tfMoTxaQ0vHBz7qGBYBcHfhE9NOdiUqMgA14yQFvoGVUP6
	 TtM5VRkLbIAUkzRz+jveFIIWq+QMzBq56BWx8NweYiiVG9VtkVioECYVGeOYgOFyMb57e
	 Ae/hfy0CmhuahtzXKOrNaouGzqCcAoDC7A5q9vy4TY6j/xJPr3FyKUDNWekSVSSu35ikl
	 e4Vm3VhCEMyJ0H7sSUxmpx6a+uFaBdrLZKTCoECSe9bcFxnS9Ov+msXql9R/SIQtXKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=uGgu6l3Ky8kvEE8GWOoo1yyQfvRZHOX/bqL3OvucLGQ=;
	b=EG+/efzps0Q/F8JhhpHRy22Xh7Zaun+uKGXeAbdJUm6/z646xvKXi9p5lO4gF3DSuLXT
	 +DOJIMhnzI4h8cPEpZEG7p4pGQhY4hWQkDkqel79Zr2HTZ2MY6DcQfiiUBFb9eQU+mwAe
	 T8c6nOeHvuUPrNMAjOb1nrM1F6mz4PwpRy021csHmo9se9DRvEZqnpRGTSAkQ8qLytsSr
	 +I8X4TbcS6U+9Vwl+qsp84xQPy6s6SAuuJ5fBZqE6hIfulPTS33s/O1bAXiFBKrnHUyQo
	 oHIXva8hfA+SnoH35jekffoSSMWuYK+FDXD61tfV1nWUXWM9OL6HHREuysfNWJHNl5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eJL4Fmsl;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF49B606A31F
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 12:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF49B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eJL4Fmsl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so14325135e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 04:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744888; x=1795349688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uGgu6l3Ky8kvEE8GWOoo1yyQfvRZHOX/bqL3OvucLGQ=;
        b=eJL4FmsljjmbthQTxR+1os6ehdA7HrXEazEQbHBtVieR0VPO2U/151cbAENNQpoh6i
         ghPT2cNYVo/lKqchdC0hTr2bHtSoCLidj7k1RSNtzrGC2aEcv0oQykcRlSDYypHCGxWV
         oN9107GYTlhdT2MgiIYtt8UXLvULIASeEkedrMlyX2xy2b8jmEPafnLnSNvUY5lvOeTo
         NXPWb6KvUlNbVtI1IKG8AeHSgzyPBKF3JHGZ8q3aDJQRXenTqEfz5BJ3U/dokIfbdvcf
         Slsbh7fCBGjSc7Gf77SUlg4j2wDW8AntcikkdGFAmrFijCPF0/nFgH21Qncq2ebCqEGD
         f3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744888; x=1795349688;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGgu6l3Ky8kvEE8GWOoo1yyQfvRZHOX/bqL3OvucLGQ=;
        b=fg29azrzWxrxmm34RlFnKS55L9cGRUqgMjMab5/gc8UmWbuScnD7SMxQtMr0LYYjMP
         9CgtSzimecU8R0OrfBRcfrN2ZL4rf574ygwBGUCBMe/uKGy/D8Sz66dy133LeEtOEj0c
         8raBoEYJH1yeRBziJ1Iqjleo8Ti2fLcvDYLzJcJyNbp3W4dtlBV5kHkTIRR6GvGmlJqO
         4txA7Udwq5gqDz0WhpueAm0Z/EyFkz1OtAM0n8HOjLeIT1bfveRpgJdFwIngsnGcyy6A
         PYWJ14K+abenlb3KUwE6IBo0ndNI2ImvANIivKNE8vHVJIrHxosyf214QCPHLv8AO74L
         GbfA==
X-Forwarded-Encrypted: i=1; AL+hErFmaN21FFI9uTmIxd9e0eD+Qta6eGW6ry2uN2Nfs26IBt/jwKcr+OTpR5xRxO9pr9B0oE1bUNm+Np8YjMhN@vger.kernel.org
X-Gm-Message-State: APuU4Z9iC/FMxo/KwUL0Rh1I8dgascKnWyXKJhL8M2Og9oKX9NApXYLM
	JR7FnaRrSgpMNE1NlgJrK0ftnjp3G8zRr3cuTQmqDfmwyXMFXqlaTyaLwMo/AjfuB10=
X-Gm-Gg: AYBFou3SiGtv6spKNXzsah/eI+7CSDDynmS2Ua6TJ1cljg+AK2EVftWNqjZQvuy+Rim
	nutg3rs599nh37AeUT1TZQGOrTqoQDSmnDKb3f3CgX5wv+0ceIoC3FfPKPoGgR5NjU9i5kByxS4
	R/Q5TxNb6svzz5uheCPXEpPEqpRVU3cNli0SAVLL3c3rpAZNzZkX8bkaJtEG5lXHGrjP60FfCrM
	C4h1ILEtwNI7wfi3BIiVDiOf6NCZi57Jj1gZ8iypnQKROACK6evYpWg92Pr6l3TbgiBn/thv/Cy
	42mYwg89k0PWt3kEWJTGrpUrTdz1RmGrcmzwN623VInJ89NbMCNFEmPd8+3TwDTWZEX1Z6mJmP0
	ETCrHfL0eK+Rimi7K+J+EDC75eyO1ei6GHtIx61Pn/uUduk8cOJp69t3UzPl62oSwtDzDWBvjIJ
	fM3y27CmhVkpdBX5GxPyA5ryKqKiG4RZV1p8WMmgymy1Lk4VHU/w/8n9ou21RatDRAqIeVnEkOF
	Dqt2XkDGNKt6cxLXvFyJGrgDI+XbYULa6zSQMZ9nOAvaqRTED9nk8QGix0sVuAfoEL5wgYNrHPg
	c00/DfukvttyxRlxrh3GTs9qSipNDXBiMA5zxvkz7l3U
X-Received: by 2002:a05:600c:548e:b0:4bb:5c92:ce12 with SMTP id 5b1f17b1804b1-4bb5c92cedemr125712795e9.17.1794744888294;
        Sun, 15 Nov 2026 04:14:48 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49dc430fa15sm10124007f8f.13.2026.11.15.04.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:14:47 -0800 (PST)
Message-ID: <130fecb6-5372-44d9-8261-c3ac88248631@linaro.org>
Date: Sun, 15 Nov 2026 12:14:44 +0000
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
Subject: Re: [PATCH v7 10/23] media: qcom: camss: csid: Add support for CSID
 980
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-10-8ff2a11835f6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-10-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 11:29, Wenmeng Liu wrote:
> +			for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++) {
> +				__csid_addr_update(csid, i);
> +				__csid_reg_update(csid, i);
> +			}

Why does this run twice for the same index ?

---
bod
