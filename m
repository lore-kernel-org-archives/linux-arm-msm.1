Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDED836197B
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047481; cv=none; b=sup0wn4qRFsLCopJYEb33Pkr11ZUAXZnlQJMQkL2FnFwEORtahH7DqpXOM/oJIRjjE/htCvJTcQRCJ+QOXnBJpkDucf3iCb+Q5v7uiSjYLUPboUReL2ldUjhoCiYQaaqgR+wpz6kGsM1dr3Parrv23OvKipO3mgV7QMiZKQZdCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047481; c=relaxed/simple;
	bh=qWV4F0jtQUrwquRceETKua0ug4DKPai48uK/+HVxo48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgWYxnqJEQXqDY/f10iXH5/Mr/ATVGcLyj27tQtjSgVGb0enf/cJP9NYykMxspvKQxy5GBrQdXVyxcHnGt6AnSnkdf/lit2wIByP0dLD2ynUMhabyilldv6uuMyQZqL/cSQ37u72UJWm+x5VyCS59vVYxacWHnOsk29jMKaDTE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TnSC+Eb8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TnSC+Eb8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso67892965e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789047478; x=1789652278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSgviDKN/LY9jON+NF27RedkCnDOlNiU6ENgKgmxVRE=;
        b=TnSC+Eb80YTNyqJ4MDKOSuzSrfgd5stzkgvIci2WXgN+vcfP12rTWBfo9QYZ8nJdwn
         M4YP3hYlBw1dzjEB8piDPn+pZVM7negTrh5guVT0i6lwUCM+Ay/0B/E6SwNp1YuwHbm6
         Jpm/djTZyJwCnmAlbvBOXIbvoLfClpYIWJJQZpdY05LOiJ0/0Hue4pgc160YpR78s65G
         5AMr1BFNUAbecgSzR5dnwvIrRo1EZXZuBUE41xM8q3gCqsy3jUlcuL8OaogY8hCYSy8F
         xIhzJKiUiFjYcwQKCIFl6AxA5K8fnoWHxY2h4+zhfUbeS/G4o8YJ0JBA0gP1sKW66suM
         owoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047478; x=1789652278;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cSgviDKN/LY9jON+NF27RedkCnDOlNiU6ENgKgmxVRE=;
        b=GzcaLEIYCkKZ+cjpYrHS6JC3liqnlzC1YV8iaj1lBPueqTRtZG7fNGSfcJuQKbeNBR
         YqaKy+fcXdJo8bOE9XCchEqgDvpfUlLW+A9k2eprjt8fOrnS2KjJTejx3cqO+cELvq+B
         CeyvvAscaQWQrh/k+LuzjVy9+HaaedCDSP6m6KcLSnyrP+63zvWYk0/2zbwbUS3oaLAh
         m/CWMgfeCZh78fjvlew2AalipMTF33OWHppUhNlxxVIfxHrg96sACkKmFpbhZ+WWIOAb
         9F5RQKdSgp6oBMGCquCg7bGouxZp/Vgs5h3ZHQAIcfEKj6AHchuXgrd+pNHpkV3ERgZO
         Snhw==
X-Gm-Message-State: AFuF++kZXLGCWJpbthKH/Pj43LHLlxl+tUhBBWl2L1lihgkoRcyPiQ1m
	LY61xF6ULx2weIptbKfAOc6hsdsLyI0d4HETukPHb+Lh9HwIAm1kqqcqO1YZuVgd6l0=
X-Gm-Gg: AYBFou2nRtJvy5wEo63ucR1WAJ0OQGPV8f0PWbNMo/+aZKxdsrbE2Dj2mLiZEYhXhl4
	SYkMepR3PBxyxJ2ak8rMx6L23L0YjLxF5xezD0z24AQ2wfCKUPEJT2h7v8VCwex2oXpAN43T/IB
	WwZQJy00DaqgbuBegWmlc9127Gsi43BdmADVnU3CphnSArLq7fDGQES2DGjKjaAOIlJm3T+ogK+
	arPDc5TF7cG2XwT07e3eXz5UcBToGoWBKFN63HOWGpNvBOzWP0zNP7VlSDxvI3VG5tvQUYnO4pe
	ydRB+K9KHwVQaUCiUxGQU9fHtVgle/yFFUlFgtgHdtjEUOI8IUH4q3P3rvcKqiEX8sHwoTADFy9
	9NhI8qwPtVlWaQvhtcyS/QeChY3pjSr178VNn6+aiCtUVytyNjrQhPSSDwKN5A1QwYDNM3//Wul
	r/VOj02Xoa0sJui++WIh2QwXTiB2LNZmIT0fvp/TDcO0yvl9I6hIvt8+h9Lp0PfEnjxyGG2ZhXm
	5w1jUliK4Lgc0cOdA2RKCrh7Dpey3fpIKnxCeEHijN56Yud3yRFeg==
X-Received: by 2002:a05:600c:5303:b0:49c:fa21:1c87 with SMTP id 5b1f17b1804b1-49cfa211dadmr367002175e9.28.1789047477714;
        Thu, 10 Sep 2026 06:37:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:edd1:1b07:ea07:35f2? ([2a01:e0a:106d:1080:edd1:1b07:ea07:35f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm289732465e9.4.2026.09.10.06.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 06:37:57 -0700 (PDT)
Message-ID: <6fd633ab-eceb-44b0-b481-ba28951fdd0c@linaro.org>
Date: Thu, 10 Sep 2026 15:37:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 34/34] arm64: dts: qcom: sm8550: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-34-90a252ddbbfa@oss.qualcomm.com>
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
In-Reply-To: <20260910-root_port-v1-34-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 15:29, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and newly labeled pcie1_port0, allowing
> board-level overrides. Move perst-gpios/wake-gpios from the
> controller overrides to the respective port nodes in the board files,
> renaming perst-gpios to reset-gpios to match the binding used in the
> root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi             | 16 ++++++++++------
>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts                  | 14 ++++++++------
>   arch/arm64/boot/dts/qcom/sm8550-mtp.dts                  | 16 ++++++++++------
>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts                  |  6 +++---
>   arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts          |  7 +++++--
>   .../boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts     |  8 +++++---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi                     | 10 ++++------
>   7 files changed, 45 insertions(+), 32 deletions(-)
> 
<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
