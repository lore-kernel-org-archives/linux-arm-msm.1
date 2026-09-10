Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD5C493D5B
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047441; cv=none; b=lrdgJ2O444iy/spMJuZJGg0lkwIyV3MsdeKKoN+6Gu7a4HepcBXLPB37upKqcHS7ujis3RsU7TUZ5ZoEx1N62q4tgJr71Q9WRK0+yvBsmD09rbllzdKQ9Ci20EzhLCzfCteUD/ubERcd8HAgEmBzO8Vrjipo2faD3MnwtJqu2SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047441; c=relaxed/simple;
	bh=lfcTX4TL2A22VsA7xIY+rPkefGCSN06tu5AGdvEz78Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RohdBlfRJvlHisIENKtWiZZ/mVuQsfMqBlBW8OfwTGZ9wkmBcxcPoO2vlyXXcQa9t/omJES/7aNFdYfC03PUZDxp1q/alHEuFAAjLHMevzjKo1ySOfVbu1tcVRaCDsg2ahWvutDG6eJBRNyKVMtK+FfXDQlEKyMyWAHn1AITJqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yo/5mabD; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yo/5mabD"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-485850cbac3so4480898f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789047438; x=1789652238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MV7aOFJWyf4fVQJnUJPY31C9vQENrTENQEYoiqtHwng=;
        b=Yo/5mabD1Z2s3VdL128GtIqoAoDG1XV60VvulKWLvS4wwo0z+Ekr7ylFTr8vVsWJ6N
         18UaNvdT6D1Tq8m0lkb3vsMecxvEsBmsJ77kAVwZo8Tw8ko/pB/5q1jjurWLvHBleqrC
         Sx0jR8inAcSXRMeiB88b0HvHIgcGkwaId6AF0FrJeLGPyh+t+zpMa2olPX80z/8tkkAA
         pdswLcAMPd1SMfSIlwUwq2i3J4mPhJQynvBokKka4RWQ/jR03wi/Oh4TaDk75s4HYLjy
         DYQ89pk5vKaCWkidUl3pkHLLuQldV+3cdbtPNENb+6+gQsnFiFSvexpSpo5I/Yavqxuw
         ujmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047438; x=1789652238;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MV7aOFJWyf4fVQJnUJPY31C9vQENrTENQEYoiqtHwng=;
        b=Mt9tO1agfCG0tknZCEjDU7b9SODBMA50cv4HzUXktb84X4gphBDJJvlUswR100pnQ7
         EIOjg/G9EmtYohdqur5UdCXYB9U74tCKSiTpd6kN9b7Dv7CQdcVCOHs4RzColW+I9xHE
         dH2Bp6ID/nu5BB9eDq6WpwHr7Y+WSqDC3VhPQR4nU8ps96fNf+JD/OqZHhVt7BYPrD8J
         pDEaMfxFkyd4Hj8jrDCf4qGpEV0Q7N1qM/bmEXTBcio+4T4/KG2Qy5bpqqcr28ByTC/U
         /09Ez3i82IOsmmPCG7Kafq3bx5p7dooZLTo2/WtoPo7MLJ67p+tuJoenjDySri4FqzE8
         RWvg==
X-Gm-Message-State: AFuF++knyRan7mXkIiCHIR8KMWnMsUDIEx++no2Tf0tvEQGPj/Y+S/LJ
	eSZz9/wazBHp8V/n/dRWOKuJT5TAceAcC9dGoy0fHYvsESYb7mGAa405fFR9qkl+dmGGPGOY2Mq
	aiDqM
X-Gm-Gg: AYBFou0Ig7MWSw8y48Un/lBO2TiRqbTjaxPOvdGwGLwuQfysY0enxbkpRccOh9L5cLx
	6O//Zr14TC2xu4OS63mQvQ+Hs2ys9uWh6gYVRanjn/c9LsV5kLnGxeVKOViu2CsXgLzIlfMXwem
	3x6A0s+xlQ9m7FK+pLQZsfpc7kGUtAuFL00ldwHqhSD5+GDXW+6WI5zrWSFXoWm6PXv3P2OHtDn
	IxIDaGNZBPHdUsX5FbFfppvn0rSDmEDr8T/FebMPszLMDJRCLj2cojJog4WdZGu6ijFTeWhYreU
	lVMjn0zNLu5DKpVj38d14Lkdl+oyx3aWt421+uu8vYI9XKX9Wsh2F2sthA6J1fBg/XhbO2conTH
	jea8vHkO4cVPyO6bdk0/Wng3lYohmpJmZGaRImzUd0hYNy6gJXgdzbG7KepB47ngqTIYsqsZvhB
	bVnsAUj63FhZLve/R6JcysPPVP3Y/yWlYK59L+W/Z/yY+H09A05R+37NC3wEo9s0KwiX5ukOH3J
	IEtJS70PU5ij5OyrpAv90DZAKU1OSUmDjDVeHN+f9NwbzcQRZRd1HpNTwRft3b+aQ==
X-Received: by 2002:a05:6000:22c8:b0:485:8fe2:ed95 with SMTP id ffacd0b85a97d-4858fe2ef52mr36331221f8f.18.1789047438281;
        Thu, 10 Sep 2026 06:37:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:edd1:1b07:ea07:35f2? ([2a01:e0a:106d:1080:edd1:1b07:ea07:35f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485aa2c9acasm15339035f8f.36.2026.09.10.06.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 06:37:17 -0700 (PDT)
Message-ID: <6da75e1e-674f-4b4a-8070-ed6ea0d183f4@linaro.org>
Date: Thu, 10 Sep 2026 15:37:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 29/34] arm64: dts: qcom: sm8450: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-29-90a252ddbbfa@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260910-root_port-v1-29-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 15:29, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to the existing pcieport0 and newly labeled
> pcie1_port0, allowing board-level overrides. Rename perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 +++++++++-------------
>   1 file changed, 9 insertions(+), 13 deletions(-)
> 
<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
