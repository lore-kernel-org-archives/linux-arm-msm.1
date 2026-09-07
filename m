Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AED5501F45
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798930; cv=none; b=rt//pC7eZTvII9Mx9qpLDkSCdxSphkqLTN+RYxJ/3CGP12mm9LUM0oHrjhooKNUfsJSBkRUP+VyCubrQJ5XbOLb6TgOwTqSjmwU2o2ll7XUIo+3RGdcs39I+pPuDdGVmoSPMopPAEgopM6BKthTEraJi2RYVdQMrMD/EyfPvXHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798930; c=relaxed/simple;
	bh=pdFwUWw0ytnDXO2E5wVuQ9iGr0tZeXH+2vZIpxu4nFw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sOIFitZBWmRamximjJtYf1oEe7uyxdilXoVjABeZNGzTmJ/jaY/a9ejC4Ifgr0IsviuPPVW0KCGXdWgtpy2aRnXL/t2gJvtzgyx7HYYg9tSYXeYYQnWma1vDBYlp7KW8DX+9E9fobtw8KIlot20XAoyhXZSGLXxcGck91sJq66M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ts/dd0Jt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ts/dd0Jt"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b965570d7so44107665e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 09:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788798926; x=1789403726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJ38KZrQ1VU0wHJvFYCofD4vSHW03RLbTPeGnMYRlCc=;
        b=Ts/dd0JtbQRQEOozl5rNOpN8v2/FmjT1VRZ+v5gWd7j/vyqHPV8Ygeo83WSzulaQPT
         nsZRl29X/e8El3fYSA5K4o+HzBavS8dxbmn4B46ym7yzwwdoFlEpXwObNrdVFGbBbAQn
         5Hd+KOkXg1UIgXSji7ny7g3yK61Ll7Vao4k6t3p+lMgFS6yJGyCCGpTmLUzDp9UUI5j9
         3Wf00vw65F5CPLsBBhy6nfPG6dYHoa6/XfWJcOucMZ/RULl65ckS7YL1IBEKMhL0vH6V
         youYH0CJdlSUCXR+K5ph4e05NF8k30CUNfDaADM++EE+0j9Ep9RwB2mKjCcxb8fkZTkZ
         9uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788798926; x=1789403726;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AJ38KZrQ1VU0wHJvFYCofD4vSHW03RLbTPeGnMYRlCc=;
        b=iGWRhynIiHqAUcYDScMFumoFuGVSfM7aLJ285ze8fNOVEVvHBZqmAOpM2qZIXMoWlP
         S9Kt219inftpO64bFFfUaAaG1i8OXOkCGhGimcj7ooxEM/3IGpDXZh5YIbYS9lNNh+iA
         S4lHOQwvhwwPMQuN0KG5CTqUnHzDGKX0r+TMDShjCtduSynRld/TEQzGby0yqFmr+JWw
         rk2BDseFcMJ/xMAwyD5J4Mvx59Qm5LbBF7h/7IdX50FM1+cIpVD5m95XNfnJ11gt5awG
         cHFDYcfIwVQYAN4AwNFaw/tLg/LUWSqKkQ3hcY6He7PDicuQ5XZfc8RfvecuKzd0S4fN
         vdLw==
X-Gm-Message-State: AFuF++nwc3RbyHIzef6XMc7rZEI8s8L0lndUfxBRuPvKTDp5LWTloRnb
	SfUlZ/zrYngZY6i3F9UXpsk5aV18aPoWj5QcalZ/kGP7k/3Dg4flUVLZX5FWRb2QIyg=
X-Gm-Gg: AYBFou2VnIaYV0VZjdB61B4ghts5hCXX5z2Md4KL1t18vAEOVCYV2AOProuKbdG2GGW
	zGGaCKEOl71Gv9KfTiEitPWgPUcuBZkvSJKuzRoBrlcwmYdHAl3/nMXq+fiIhwk+thwolTTfZzj
	A0peI27DLJtKnwHMfp6FZmsw1k91D8DSvijJwV1lu/tV4TjzZfEj2QnbeGZaGcE7GOcjfjlkF17
	BDHGabXdR5n91dtiKUd3mffvw5MLijdQv2GjwKx1cedBf9o+4HapoOmPca2oPmFrHZxRyImhxlz
	oboWqGgjHt06uRL/5NNiEqQulwgH/C/M76tt7sMN3vfaL8pEYGEs4dHnt8zECUi9eCGhcgwlOji
	2iKOazkFs9dmwj9XEwe/8FHu79HtxYLIKqN4tkZemH/sGLwY89J/jGBVB+qyMo1YQLvAo/NB2YW
	KKB0mnNEJkO6iITBvj3YuOSSYHwesoiPSAEcLGplFJjEmqzRAf4sCZvsU0LyMPc2mBX4gaBJNHI
	Z5fWxUIfuifPWMPU2eBk7tNMUEBgtI5/4lLd9Q3FwE=
X-Received: by 2002:a05:600c:530d:b0:49c:fc6e:8cae with SMTP id 5b1f17b1804b1-49cfc6e8f24mr189817335e9.18.1788798926391;
        Mon, 07 Sep 2026 09:35:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:74d7:9035:e283:b480? ([2a01:e0a:106d:1080:74d7:9035:e283:b480])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm28013294f8f.36.2026.09.07.09.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 09:35:25 -0700 (PDT)
Message-ID: <e1971874-6e06-4ffb-8118-c4acc40144eb@linaro.org>
Date: Mon, 7 Sep 2026 18:35:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: SM8250 USB-C DP alt mode: DP AUX times out in reversed (CC2)
 cable orientation
To: BurningHoryd <sjunhyuk1@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Vinod Koul <vkoul@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20260906225206.2994952-1-sjunhyuk1@gmail.com>
 <f0fc4211-2040-4115-9847-6e5cc3fe8161@linaro.org>
 <20260907162643.36585-1-sjunhyuk1@gmail.com>
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
In-Reply-To: <20260907162643.36585-1-sjunhyuk1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/7/26 18:26, BurningHoryd wrote:
> On 9/7/26 08:40, Neil Armstrong wrote:
>> This means the nb7vpq904m is _not_ responsible for the AUX swapping, other
>> boards have the wcd9395 or the fsa4480 in the middle to use the AUX line
>> for the USB-C Alternate Audio support, and does the swap.
>>
>> Could you check in the vendor tree if there's any reference to those ?
> 
> Checked Retroid's downstream Android DT for this board. There is an
> FSA4480, plus a GPIO AUX switch, and my mainline port models neither.
> 
> 1. fsa4480@43, on the same I2C controller as the redriver:
> 
>       i2c@884000 {
>           fsa4480@43 {
>               compatible = "qcom,fsa4480-i2c";
>               reg = <0x43>;
>           };
>           redriver@1c {                 /* nb7vpq904m equivalent */
>               compatible = "onnn,redriver";
>               status = "disabled";
>           };
>       };
> 
>     The only node that references it is the ASoC machine driver
>     (qcom,kona-asoc-snd, via "fsa4480-i2c-handle") - so downstream it is
>     used for the USB-C analog-audio / MBHC SBU routing, not by the DP
>     driver. The codec is a wcd9385, no USBSS block, so no wcd9395 here.
> 
> 2. The downstream DP driver does its own AUX orientation over GPIO:
> 
>       &dp_display {
>           qcom,dp-gpio-aux-switch;
>           qcom,aux-sel-gpio    = <&tlmm 8  0>;
>           qcom,aux-en-gpio     = <&tlmm 9  0>;
>           qcom,usbplug-cc-gpio = <&tlmm 65 0>;
>       };
> 
>     TLMM 9 there is the same pin my mainline DT currently hands to the
>     nb7vpq904m as "enable-gpios", so that assignment is likely wrong, and
>     TLMM 8 (the orientation select) is not wired up in my port at all.
> 
> 3. The redriver (onnn,redriver @ 0x1c, same I2C address as the
>     nb7vpq904m on my board) is left status = "disabled" downstream.
> 
> So the SBU / DP-AUX orientation switch on this board looks like a
> discrete GPIO-controlled analog mux (TLMM 8 select, TLMM 9 enable), and
> my port is missing it - I modeled the I2C redriver as the
> orientation-switch instead, which is why poking its AUX_CC_REG did
> nothing and only the DP_CC2 (pair-swapping, 2-lane) op-mode ever got an
> AUX transaction through in reverse.
> 
> Does this look like a job for gpio-sbu-mux
> (drivers/usb/typec/mux/gpio-sbu-mux.c) - a node with
> select-gpios = <&tlmm 8>, enable-gpios = <&tlmm 9>, orientation-switch +
> mode-switch, wired to the connector - with the nb7vpq904m kept as
> retimer-switch only (or dropped, since downstream disables it)? Or is
> the FSA4480 in the DP AUX path as well, making fsa,fsa4480 the right
> orientation-switch to add?

Yes if it's a discrete SBU mux, gpio-sbu-mux was designed for that, and
keep the nb7vpq904m and just drop the SBU link to the redriver and replace
it with a link to the SBU mux instead.

Neil

> 
> I'll wire up gpio-sbu-mux and come back with reverse/normal traces
> unless that's the wrong direction.
> 
> Thanks,
> BurningHoryd

