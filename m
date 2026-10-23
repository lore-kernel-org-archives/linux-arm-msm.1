Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792795388;
	b=TlYCrmaqDjYixEMgCIC2/T5KLVjAI4aWL5dU0qbs82lUVTZJgoXVKjryMRzzcwQCuX0+
	 RVPbKJMU77MmI48t4AM7d/MpdDHww7NjCtOgZaSlsH/Dk/oV42fyNUN+dinQwey/nqtXY
	 rZzY3EnNvebRr4dcvZsI03ySVYasQ+LDIeT4FSgTjad4lTE5jCiYP0WdcqTBsehWYHptW
	 ObgeGZoGn8fXuDJGLHqqzFuxrbOGwEM4OAKAjbksdDh5hYlIggww+7y3c5pL/asitvNQU
	 fmsbd1Sim8N312NPy2upfuOW/NZvQYLGoZxr1zzOwS5wbDYCPOu7WNNXvxO32mVHI5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792795388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Oaa3IXbsmPMDDQXEJKkwgW9mOxnYdMqdGBs8GCpNSf0=;
	b=yqw9vv7UsdQqWQIjh71jQZFGmYsYo0IMZ9T9ApH3OqvUKoa1IAz5jOqMlbO0GzAqZ5h8
	 S3EZSUzBB0JMPHzWZJ7StPwJjjCrLNjTgh33EzTVWNuLvCQPkKgqK37nMg4K89vHK4G3l
	 2wkgraEdiQIdiFUyTA6TbCuGRSs9QSYloG9kxsKxGJGJhRPpdMlrSbKnOypsrPVabcLp2
	 /clDu7eCjLrXdnVhL2Dj+4hyY8GJz+yNMPyEIJp5gopCfS25ZwBAyVLK2dZQxmdU0M54r
	 Cq63Z7eTjlaCaSxyZ3uhrntpSDJ802a1YVLsL3XGQSnFhvjcHzXlORayoxJUsS77ytw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qWQcWGRE;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974EC606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 22:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 974EC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qWQcWGRE
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214af2076so8132205e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792795386; x=1793400186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oaa3IXbsmPMDDQXEJKkwgW9mOxnYdMqdGBs8GCpNSf0=;
        b=qWQcWGRE26epRvhdKbyIh87aCmJkyDJV5cwB/scQQmyfO1sfK2JHtXYblWIS1yryU7
         nJ49caCLbmHN0pUpe9ChYkb7k2L35KVVNaABfCTbGhXpcZw9mX+N9n/KSKMKDn1MpkA8
         GZIDPtkqCJRMOCxndovyFWB7adcBs973+he/lN/yCF6G5NBX2+MSRSjnesz65gDhns/Y
         Huv+Ytga4FPSUTmHdFzNEUvrvZ2ufP499FbJhRtoDSk72Ow9E+voC/vVLYjhdQqkUxdZ
         NHijy1YxKbY+PLx6HMvPmmLUmnvceDe/Sw7c1VvbxBhYROJMi3Pl5EgYGxIL1bw/Ndy1
         N0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792795386; x=1793400186;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oaa3IXbsmPMDDQXEJKkwgW9mOxnYdMqdGBs8GCpNSf0=;
        b=tPUjdjWNbhW7Ea8DB7R9O1i4oeL2Z7sfIqM94Ar6mdTJ7sfxwbdHvFMmKQyB0K/Yng
         uE2gEcJ+PIH4RDxFXsQxC9/hXDxcCFMvxQaFxvyRBa5A9vbr02LtUFv9U28dVjTMJBi3
         TRc7ybNhDYhc8dmdhk1By1vJKXuOls0p4QSFCr4+idyG45tI4hLAJJHy2x9faOot857f
         yC+3lAbPbgkNNElK7Bb5vEDeXZwWvFbFA//80VO+d39qZWvYgcop/S4QaGpXJTJsHqrP
         wfbHYNVSMiHLCbK3kyiSqVAFbAG37lXXcIroZn1oUZO9CYnqMpzFd5usEs8vzk36hnvT
         rztw==
X-Gm-Message-State: AFq9FYImTc0WBIAnhdrbuCk8enlAOFRRDTI2G0v3Oc184b3GRu5it//a
	yPz8XBJunqIVFtvKxUrYOoOsjjr5YpX401cwlZYv5+m2M8xn3gh6CmZtZA3rg6kZMf8=
X-Gm-Gg: AYBFou1JangUiJ7R7dypO2xeykXqgzvDlhoCDGKWxQUwmVv4g3Vw/Ak67lF+AgX7tGm
	odnftuHxMwCC9iFZBOFJG88wt0eUgb18ngAyHeHs1zL6PVbtiVuAzInQxCRtOrQydx5ZfYmH550
	fdONiLKEyScHVwDBxi2xEbS1vWWgXZmQClanirUzohpSfKn27buyqfjM/nFwDjaHw9Q7XpvUjxJ
	u2r8l+S53iuKh0chG+7tBhLK3lrHcEPO05k9WKzLcuQPM1TZSteaixDwtUM2+5wEmtgrLdYC7dJ
	HoKXbibVgmTrPAnzgDZ6Z+x32nO/D6bNlThRqtfxjPu3bzY16VVqejc530ynZ0+/ggby4xZOM8I
	lJRpujUdLFl1PYZtgPJURvQZDDZrG9wdKEil0DFwqokpPi2zj7QlzWyUMjh0YTss1XRDfg/dMrU
	T40ufDeb26PSIaFoNzXHq3CEdYQwQcOubH/uhE9oQazwKm7mMdxrByEDW3XyelO0iddG8oWUGKN
	U1/AXczcFlmY4xKu+MePGb9Z6FO0iIJZWkIAof3PsMg4/mPC6vDsu6cPkeUDUlPNenX
X-Received: by 2002:a05:600c:4e42:b0:4a2:16c0:f5e with SMTP id 5b1f17b1804b1-4a35ac8b429mr4136005e9.10.1792795385869;
        Fri, 23 Oct 2026 15:43:05 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.107.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm787610f8f.38.2026.10.23.15.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 15:43:04 -0700 (PDT)
Message-ID: <3dd8d329-a25a-4afb-935c-311cb8ddf094@linaro.org>
Date: Fri, 23 Oct 2026 23:43:03 +0100
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
Subject: Re: [PATCH 1/7] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Waipio
 compatible
To: Vladimir Zapolskiy <vz@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20261023163057.775917-1-vz@kernel.org>
 <OlcKP8HHAIXkRzYX6vdMrXfEbLNpOVLfNZytB-qiRopju0IaQ_xxKo-mlzphnAO1Pdg-y8mu0lcw0UsQZC0ZuQ==@protonmail.internalid>
 <20261023163057.775917-2-vz@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261023163057.775917-2-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2026 17:30, Vladimir Zapolskiy wrote:
> Qualcomm Waipio SoC has six CSIPHY IPs, which are compatible with Hamoa
> ones:
> 
>      qcom-mipi-csi2-phy acec000.phy: CSIPHY 3PH HW Version = 0x40010000
> 
> Hardware supports up to three different 0.9v level power supplies for
> CSIPHY0/1, CSIPHY2/3 and CSIPHY4/5, but there is just a single 1.2v
> power line VDD_A_CSI_1P2, which supplies all CSIPHY devices.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>   .../devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 1f1e2a4993b2..2a11ca7c7d11 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -19,7 +19,9 @@ properties:
>       oneOf:
>         - const: qcom,x1e80100-csi2-phy
>         - items:
> -          - const: qcom,glymur-csi2-phy
> +          - enum:
> +              - qcom,glymur-csi2-phy
> +              - qcom,waipio-csi2-phy
>             - const: qcom,x1e80100-csi2-phy
> 
>     reg:
> --
> 2.53.0
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
