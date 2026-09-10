Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352014A49BB
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047400; cv=none; b=Q7IDO0X7xJDN9LmO7T/FZ6j+jMP/PcqKOZUxLlsTbN/FR/eF7bExg3K9VnZlK41MaP+tRJ8wiY3crU419IlqWhb7zrIEVlj9hj0xB1SVjHFcGNIHS9eUJ8UjA9XjElmd8W2GroRw+5mgd3m3ACDraFYjPeUhdjg/JDFNTPgGXuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047400; c=relaxed/simple;
	bh=BYDbj7I1IDgD2RQ8aJ98Pf1+bsbR85yDbFZhYXef4lA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ahcOeH4hXzbUbp9fSsKBVonGO+DC1yQsM2kmTIjxPO0EZ2LmXNB2dhCgjnqI5MoUvtUAro/h1DIQjUow/sxRZMGZtE9/MmIBm3f7SB6x93q3S0Ni6bos1TwjNpkCWKa1P3E6UHp4QLt2rVQ20OvUtO6Bud6FpwL8QS4H2ZsjPXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=juz/5c2v; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="juz/5c2v"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so51049145e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789047397; x=1789652197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14ZyYBLmDwC44ATjoqaAWoVdXPdImMX+3m2FolceeNA=;
        b=juz/5c2vCJKOE3p7lV437KM/WT+s5Gb2xEt27kmt2W9IwbMOR5O3ws2c1x7RC3MFq6
         Kg7yJkjnt/SLXbZbiiJRIn613V/X6BOXG3hWgAmI/udMwtI0vtWh8NR5x83wQUSL9RKt
         jvv9akXZNenHPiv9rvBXfqT/gE2nrpd5k2uzwfyhBR37vjFr7IDXyS8f0cZ8Gx2dlGaM
         6ZRZ56ONgItYZYzz4JnlyGcpDSdFnAmAqGn95ith7SAj1wOtQn5ybPMkuWj30t6ZFdQU
         MR/iJ4WH8PoLhylk6gpexfRKYPnADG9vTWJwPZIpFr1VQxPzL75QAtXXFjCtlxfQefnc
         DcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047397; x=1789652197;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=14ZyYBLmDwC44ATjoqaAWoVdXPdImMX+3m2FolceeNA=;
        b=sba0KlldOHeMxW6T0YjV9OsKy3YTpEuR10feT3/85jQJdUzTmgs+EyECOq20AfLjgV
         dEq9ap6XKs4QHMGnUYiOcI3MHpTQZqFUduUuuN5hkDN0Z1VWWj+zdbDF5KgVxh2K8cg9
         CE6JvGoeP3nuJ6JiS9NFt7O3xdIx+4fhHGQso/KaBtBIe/4yVDRYSa/kvejzGSY3OM9s
         U4GAZaFfsXRuKzy9vM6fI/d1dM6poZLcIUfRxI5ZeSP4CeqC3kxAvH4XoUypJdxrG+Tc
         Zwks7evusb8a7pzrlbyRIXmPWt2cR+03FKNcg8xFozSCifxrzxNjFG/S8Sm7tLUyY3hi
         l6Rw==
X-Gm-Message-State: AFuF++n4y0VesZulLTV8wkOZg1AyfYQsnep0kFIpU7rTv/kVgJHMFFTj
	gGWZa/oDyc52gvGMS3thwj+9dBfUfXf//ah1wDisByu4BcIiGw3ldeiiqYUzLOC2KGQ=
X-Gm-Gg: AYBFou0AjiKe6POXiB/b3bN99yP64vZ+p4cCn/A2TS52x7TmL3XpJVEx2c1cn9ia0AP
	q2bohZJK3LFXxgJA3SaQ+HayrYs5HSzHSJ5hcO4O0dIKnt0q29nOcTTZgBBUqg4zE+xva1CJ1Fe
	GXNe1SSdehTC7qvztR9V3eIALZEcDVDHukI7GviCmejDjCLMDCzsN4IYjo1GWKLyqiHaKt0gelf
	X6jGyYoSo7QaTQ1J4rFMxc81epd2QoxRiO5hfinGBvQ4tkupFNlz2gAaVRAmq8bYtFHbQ+cH3hF
	oqAP6JIKmoFWucy2ZlYV93pQM2s1PEMXQ6AhzIHb01G8M7mMxCSpmbKaCpuN3/lXh8dgOrn3Zlo
	DTNFAV/gOZS5JF71sbbg4N97SFc3xnraQpf6HTkHDJRE+B1rIXG15Wj72vAJb/lRyxswRS4HouQ
	tJFEBC3Z/YOBB5nB1mXDu26zjYebpWMSlqOYf+vKQkonfyyh/kWsABtdVQI4c+hghePN92oAFQS
	orc4hou3ijfHSDFp1tCq0YNP/pYRTT3OdiVtijtrNNfeuVsJbAIfQmX
X-Received: by 2002:a05:600c:474c:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49cf8227619mr380188265e9.5.1789047397226;
        Thu, 10 Sep 2026 06:36:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:edd1:1b07:ea07:35f2? ([2a01:e0a:106d:1080:edd1:1b07:ea07:35f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm146331275e9.3.2026.09.10.06.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 06:36:36 -0700 (PDT)
Message-ID: <f7e97fef-62fb-48a4-982a-881e500fb761@linaro.org>
Date: Thu, 10 Sep 2026 15:36:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 31/34] arm64: dts: qcom: sm8650: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-31-90a252ddbbfa@oss.qualcomm.com>
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
In-Reply-To: <20260910-root_port-v1-31-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 15:29, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and pcie1_port0, allowing board-level
> overrides. Move perst-gpios/wake-gpios from the controller overrides
> to the respective port nodes in the board files, renaming perst-gpios
> to reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 14 ++++++++------
>   arch/arm64/boot/dts/qcom/sm8650-hdk.dts              | 14 ++++++++------
>   arch/arm64/boot/dts/qcom/sm8650-mtp.dts              | 16 ++++++++++------
>   arch/arm64/boot/dts/qcom/sm8650-qrd.dts              |  6 +++---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi                 | 10 ++++------
>   5 files changed, 33 insertions(+), 27 deletions(-)

<snip>


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
