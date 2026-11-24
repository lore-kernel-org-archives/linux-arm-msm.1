Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514219;
	b=pCFH95KjpW4QjB96/7hJP3PXj44otliYHS/0+CkToKiYr/ltgzZUSPXch6QQlESDFOo6
	 V7Qa3fwq/DeGISFnFy3UzWNFZsurSQutcjoMvcxNg4gW2dvY7/Rx9FHvcVxhSw+QKF7Ec
	 NfVYE3eWltWHDlhhpoHNjCWo10dLF9ZJC7VbgYsRsn2Xp6JpzW2SUABSi0mYm8uxDc+1A
	 nd3KJu+IXqA3N7ls3RaCqnWhkWydRlPk5FuYtANpNJMFSzGh1aVqmTmewjBF5tkMWaAsL
	 h3wMHZGLse7BW6m/30JcRGqV94PgO0eP+p5rMNRyqPCvg1S0MQIKD4PTDWPd1skPa8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Z7ixIHGB/x6muOCf12bPPxl1sG73TY3AqjMKZ2p7Iqw=;
	b=XP0mhRoIB3ITuVFbKGm7clssqNZhp41eAwPENQ4Z9t/ZKL+FhNyHOrAslYKHRhP8BRkt
	 0Rdn6uLpbJ9c++PuirXS/rpBeE9txgbxG7QbdVN0n/vEbztTajxzVPNJpntBZy3z3cOMY
	 BXaUWwUEeqqUU6hEjAlGE7OVna57eyZ58LkEB1p0BR0iLQsYDov0r5qbGGlsvCdSL5JSR
	 Ew2qtZ156Yq0jl8tyXZ74r6wq61tPLaw89kOGqblY6rfkKF28T7A5i+UbzKg8fJNvN/Vq
	 E1FU+lR2avbCZnkx0J/ARHeCezeFpko9U7yW5K8r+GgENNDkO5VEVSQmIVPqcERKSOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fmCLP9gt;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C175606A326
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C175606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fmCLP9gt
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c1ad0d0b72so418933e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795514217; x=1796119017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z7ixIHGB/x6muOCf12bPPxl1sG73TY3AqjMKZ2p7Iqw=;
        b=fmCLP9gtyFynzPpKhVinxN3fvX0HMhPJbqD1her/p9bj1TkyZMQ3CUW2x1K2iN6Q6x
         wZ4W5yjzxqt3fzPs1oofjP/eOC6ezr++bplcBpOLgydsEwa/ibvh5ZgR4ciR1XPO9Nun
         tJP8gaFyKB3uXo1JAq1nJVoyQ3d6zu2DJFMcAnm9FOJt6bYNI5jAISAfNXrcQZLMqqbS
         XbcOsFJ/qBdpwrj8ya6lkp1s4F/MKwr8F9x6FTOxCEkFzlQMc66c57dzu5b4dZXrAyqU
         sjyN/lSUSN7rV1QbdPFM53mzZAdsRIXj0FmSSgxsnNdCJIdXXBRN5ZSI4uvoC3MJhezY
         xrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514217; x=1796119017;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7ixIHGB/x6muOCf12bPPxl1sG73TY3AqjMKZ2p7Iqw=;
        b=Nm24rSAfpUiR3GiCCII3ayEgkprWebqlAZEYOZJCt7Pz0wA52Qw1U5pZKT1AKyJMnY
         Uf5HBJlSLi8s3HXnK/wDLpaLdHCGL0ssbsrtVl4HjWFjKLKKz3l3MHImJaopWxmWs7NA
         jEyD7usxG05FzXfxLkRgXNq0OSOaYtwy71wWpJfojORo4A6x9r2Gka5IM/6gXVnBfmQG
         Au4QWQIBJwAzaggCRacz7CvB7UPSGg7/Ar7bm6vF13yi57MJ4eas78XNP/InMFeJ4Cv9
         tHVt5IOwK2XAfP0pHAOvlEMzYPfyiobDx64wIbikUQB0kWxijvXEf0feu7NID3m0mP2O
         HOUg==
X-Gm-Message-State: APuU4Z9VotsRs0CbyWDUzkgMIs/s5z8oCgLx/8tT3b1S4TsGIsFNqlH5
	+BTHgHgNohXsZXkilemo9yKVkGe6hM+9Kdw/Z6C0NpkZRWRF6dCTMjIsokZml+0BqGE=
X-Gm-Gg: AZFdTZd4whPn39zlMYc7Q/1wRT9SKD8YV2KtDC79M5pFjVizLhGGN+UHT+JlUMYUU+p
	SeJMTO+2KG379PGctojIG1/fMymrPEGyslGCRdlRDIy95SYbqc1BOGwKo/UOfeR/M2/fX4NQ8JU
	szdDy2zwsG1NyWxj+xzh/dcSgyGECOePoWTMzYwmj+uu/z3Ow8mtBfqRPw/z04oNM6wKZPxDLXF
	s1Zhs+/JA/5v4dS8MwK/UcwsX1nsA6z8+G31KGFqxGq12HUbqzbiU0DkATGkV6TLMZiW+lSlu4L
	me+nCzWatcUsmNLeameGuKx5LU32zBReGfA5a08X0LkxmsZhWQc3MZWVidEshmD1K0dIBtKH739
	msCXd7LqfM2q5Fx7PdS4fDztlTjfQjrQ/drjduFaZJO0pGb0N1cT4FamMec8DnIoN9PECmSOnX1
	6Lsuzcgh/qA8R/lEKzgRfIdojb/NcP1Zwa3/W+DApHbQLQDPyIrHopiHAWOyHVQrMmVIkbf4G0J
	b7U27E0KNZzrRpA7p6oeQ7C1lOzWsURGVMr3eiuw6BTe1YK+lOA3yEd19nFyzlLdl6eplitFeQN
	tb+bU/SMn9FlSCGg+hxfOYGJSob8B9CqrNE0j1b1ywhawT6Wen9PHOq897/OYWHXKyJQBQUW/ax
	6jPmtIOU=
X-Received: by 2002:a05:6512:b88:b0:5c1:5488:f57d with SMTP id 2adb3069b0e04-5c1bc85b735mr5132306e87.4.1795514217327;
        Tue, 24 Nov 2026 01:56:57 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff86c4sm3570448e87.22.2026.11.24.01.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:56:57 -0800 (PST)
Message-ID: <da038528-5b25-4956-a14f-1827ffe2eef8@linaro.org>
Date: Tue, 24 Nov 2026 11:56:44 +0200
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
Subject: Re: [PATCH v3 2/7] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: Andrew Gigena <mail@andrewgigena.dev>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-2-0103e8a0bbcd@andrewgigena.dev>
 <21be3761-9da9-48c6-aaa1-b56f8625167a@linaro.org>
 <ab79818e-4b4c-4b58-bd2f-57d9ae4cddc3@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <ab79818e-4b4c-4b58-bd2f-57d9ae4cddc3@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew.

On 11/11/26 01:46, Andrew Gigena wrote:
> Hi Vladimir,
> 
>> That's an intermix of names, and you will get a review comment from
>> Krzysztof about it, I stand aside.
>>
>> Here too.
> 
> Krzysztof did comment. I kept the vfe0/csid0/vfe1/csid1 order from
> sc8280xp-camss.yaml in reg-names and interrupt-names, and asked him if
> he prefers another grouping.

Exactly.

>> Drop 'gcc_axi_sf'.
> 
> Downstream sm8150-camera.dtsi feeds GCC_CAMERA_SF_AXI_CLK to CPAS and
> x1e80100-camss.yaml has gcc_axi_sf, so it is used. Can you explain why it
> should go?

There is no CPAS in the upstream CAMSS stack, and it makes it irrelevant,
that's why I asked to remove it.

I believe one day CPAS will be modelled as a separate device tree node and
device driver, then it gets its SF AXI clock.

>> Drop 'cam_' prefix and 'cam_sf_0_mnoc' also.
> 
> Prefix dropped. I kept sf_0_mnoc because SM8150 has a CAMNOC SF path.
> Should I remove it too?
> 

Yes, please remove the interconnect, it adds nothing for upstream, and
I believe your tests will show that the image streaming is not broken,
if there is no 'cam_sf_0_mnoc'.

>> Or C-PHY, right?..
>> In fact you shall drop bus-type from here, because the link between
>> CAMSS and PHY's output is not a CSI-2 bus, it makes it inapplicable.
> 
> Agreed, bus-type is gone from the CAMSS ports. It only exists on the PHY
> sensor input now.
> 

Thank you so much for working on SM8150 CAMSS support, will be glad to
review the next version of the changes.

-- 
Best wishes,
Vladimir
