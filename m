Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C972472AF
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 13:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256310; cv=none; b=rFsUpdpChp2aIlJDwbNHkB03dY8yWLJRKF89FlWcublMK9QMqHFrHY8+NS1VdH18QikBL+YEj8xqDILdF8aNNtqsrytXkJtWqoVfcIFvI7SI+2w1Ea5c/Rdp4MOPRz8k7kEWSW9GgYMPbl4BfRRPEGcD4sU/mNFSVOLgBZuEztQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256310; c=relaxed/simple;
	bh=1lKEbT3Vwes2mCIfD5mDQ8Gnhy2Ecw2AIB6EyVXityg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gUzNOw7SaYWhbMLxHBMxkBxJUw7IyUAHLOLOP2AAM0RDvvhOY3QLe9bKbJSKevllSocK3STCpVxLDten4wt623CaqKnS/oUQyAxK3WQk5U6SlRux2z4CsMsm8F06cjqaFRuCWJeLuzxke2m9Uubnqys5uGoJbxjukn7P3unbZrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EmPrMGjh; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EmPrMGjh"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d097b4939so11494315e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 06:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790256304; x=1790861104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYQCACi0L+UzO/UuTx/CBlh8yUR2BDqMNext39iQHo4=;
        b=EmPrMGjh5QVOAzwnmaXHPtL15Ik19FxZMJa7x5WqjIatGa+48Ai55LO8s2nnwB9DG1
         ySxgN0C2mKCoiMUYEcJqRMAKkZXTywQSVJf6Jvirn2YB42hWHRmC78d44euS+eR1d8hk
         vdmL2JELgARxosKlUsS5Vvgh7C+sQLbmCg3F51auEgekEyH/t+CAK/0He8AeQRbi+Z94
         8m5bxJJi4E7R+ajxVgaH20QbHWAb61757OGd0SK8ht7ml+p+c9WdZS3pS1cOo11PnPtJ
         BRFIZbqLklSpBp//inmsS8c8PLAaVSPl9GvRRLkaAixHvmyrYSRYeNFcMFw4hMQ0MrG9
         blDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256304; x=1790861104;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yYQCACi0L+UzO/UuTx/CBlh8yUR2BDqMNext39iQHo4=;
        b=yj+xBVY52+Q4EnK3kj9YU2IjfGIDXHqHakGVgyRAFSIsAtYC9e7r6AZ1+oUXeCYK5q
         iruaPX0q/dbbPDGOQxmPO6FReiQzBbPSQJg6pkbaqTfmlu9fPhXrFi5NuzhFLr1wLR/P
         nQ/u+dKsAlxJmBrOdHo4SkajdB97+5KuUV6zmZW9S5wj7AR59lP7WeXUPf1LC0kxwikQ
         lz969rOCsLTOEmFJgqCd3toavuv+qAJ5ZNSXs4/1hrGyEm4v70B5iyAPC4S9w3M3ED1W
         0K0kgwfPStCzlNaD52577dFE5VkREInMYfqn2hr2oVAz/ScSkdMueVnmqe5Gw0o/fnqk
         76tw==
X-Forwarded-Encrypted: i=1; AKwUvBzlnQwNtZc/n2E0QJCeRJiXCvdy32B0bpMwSqV3YWCxUEzVMB3+Ar7RQ/icvWT/m37cBO14GLAXQ9OCEk9N@vger.kernel.org
X-Gm-Message-State: AFuF++lArzG2J2ftlG2AZVQtwgxmKrH+g2ImFMZY9BPkrw2NGmIyCf5k
	wUR2ivC2RVpojrKISt8eAPEW5+uSizVAGecX4oTu6yI+lWNHd8xcC9csezj2miIU/A0=
X-Gm-Gg: AYBFou0YPMrdhqtFDiBvaaf5CfyYOCm3J7lrV6hFO6ksfC4Q19/v9HzYsGvMXLYdsz7
	OyauW0VlRzQUWoIzPIHwEZYzxOMK8SF7RTSDn8VL30szlpKhWFtTn67xZzq3NX+YsLtZlydB+aN
	5RotXXuygPgmnVIwCrQf/p75V0kezR02x6ZkGLrt2yo2vaWwqyz+fLQ7kkAThHtI6MT8pJ5DQSL
	/dfGMuH8On95DcwpskaoBwg5tY3Y9MrrSZ/Wz74a1th8gel0kRK22h2CVHBUnpP6y4qY0ld65ei
	2+aEfx+ygbZKAVOdYRshSW29BpsQLulbnrq7v5l1UpHMU3bUQqBM6EcDxJcHs7478JVxRezvMXh
	zjKyqVcWTvCwyACbEKJjgch4XbO/lAGmeYqUH6ePkribGTMt05E3IbQWiMirBvvjVEO5d3IskSR
	IDMQId+0s3wZJ3dXxuae3rnWs2k+tT6zeepLkXdFXkV/u6zMHF9NOs/h5G6mshZt+KlPLKgMqrm
	tOCJKGls86qdcX/nN5IBhqal8En2qVfS1ZYzsXpS5Y/fRjOYHeltQEc
X-Received: by 2002:a05:600c:630a:b0:49e:719e:e215 with SMTP id 5b1f17b1804b1-49fe66fa3d9mr40160945e9.26.1790256304008;
        Thu, 24 Sep 2026 06:25:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a? ([2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5de4de4sm74069035e9.8.2026.09.24.06.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:25:03 -0700 (PDT)
Message-ID: <339d4a24-29b6-49c1-ba3a-85fc62f093d2@linaro.org>
Date: Thu, 24 Sep 2026 15:25:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 04/11] drm/panel: s6e3ha8: Introduce AMB577PX01 panel
 compatible
To: david@ixit.cz, Dzmitry Sankouski <dsankouski@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260920-crosshatch-panel-v1-0-de6e9512da96@ixit.cz>
 <20260920-crosshatch-panel-v1-4-de6e9512da96@ixit.cz>
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
In-Reply-To: <20260920-crosshatch-panel-v1-4-de6e9512da96@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/26 13:05, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> S6E3HA8 is the DDIC, while the panel used on the Samsung Galaxy S9 is
> the Samsung AMB577PX01. Match on the new panel compatible, and keep
> the deprecated DDIC-only one working for existing devicetrees.
> 
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> index 835121b322f4a..a0015ac0e2782 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> @@ -296,17 +296,18 @@ static int s6e3ha8_amb577px01_wqhd_probe(struct mipi_dsi_device *dsi)
>   		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
>   		return ret;
>   	}
>   
>   	return 0;
>   }
>   
>   static const struct of_device_id s6e3ha8_amb577px01_wqhd_of_match[] = {
> -	{ .compatible = "samsung,s6e3ha8" },
> +	{ .compatible = "samsung,s6e3ha8" }, /* deprecated */
> +	{ .compatible = "samsung,s6e3ha8-amb577px01" },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, s6e3ha8_amb577px01_wqhd_of_match);
>   
>   static struct mipi_dsi_driver s6e3ha8_amb577px01_wqhd_driver = {
>   	.probe = s6e3ha8_amb577px01_wqhd_probe,
>   	.driver = {
>   		.name = "panel-s6e3ha8",
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
