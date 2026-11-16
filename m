Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864243;
	b=3prNkIyMRgOnJ2tPN2Zi3BPXW3k+x7Gq8WVc2WSu9mU/V0pQxKzEJ0C+EajJ/IH1/7ES
	 exbJ+S4vI64i+OmbPCV1eL8VAsAbSaI5AOTKwPtHZGDA6glzzb4PdDwtnQjN88mIkiMUi
	 Thd/JK3xP2ou4dwphpzgjSi4N2YFMpd1F3zWhZJy6s5dv/DdO+fBtgcFTkleTIuIQaney
	 Qxa02UiDGLTj0i4fceWRMBNQnfqK9pkwJXYxfCf+NBLrJeW6tfT7GEyFL+ydxNMOpDnk5
	 dJ6bO1RupPyLbripLKZyiDzJIS/EDsNp6vWloQ5Z6zJbT0t+wpsBQVdv3GE+MP6ImIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3NDCplZK7ik0X8Yf2ESiTaq7yDLCV4EImoCaTstoWM4=;
	b=b55l9fVqPtj8aqHja9z3EAe95irrhhSf5KkmkMvaEpRsSJSu/ZUHM/27jY3l116I3Wa1
	 FMDb2fNsCmTRm5x6RsaRp1w9gOoswfd2aAaQSC04qvwk6dr+uQKTqgM2DJ1ixXiJSOj1P
	 IBR5QseQoT+psI6Q6nOEepHb5mwMKEiXjHyLLnjifBAyxVUnO27EVjb47cl3RNg4fmMtE
	 rRizQ1jLlcyKOY9w2jbKyzWW8XEVzMm4aGsP1Ke3VWvtPUha8U24HcI9Uhply71zI3oi2
	 eJKJkyXtg+PbKWsMqZotOcIGW/Z1FShMRJ5pcmDABx74edF87gQ9O6sldO0B6Fowo+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dFXwQd7t;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A991F606A32F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A991F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dFXwQd7t
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so25892155e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794864241; x=1795469041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3NDCplZK7ik0X8Yf2ESiTaq7yDLCV4EImoCaTstoWM4=;
        b=dFXwQd7tTuURj2BECf1IhZuZKNJtzMvXRCZY1JBMIbvQzl61PWtjZLwQb6DtvGAVNP
         r2Jh6UvlMoDYUGGIUTooz/fVGQU1cYBgbRn1fYjXnMLGkO+j/rUJsjv7b4hsLbxCTnsP
         Tygqyc3qziyZWxwkLhEhgmIo4yfpbR6HfjAya2uDzxoxPStl1nTjwrVSxxUIc6F/1tI3
         qNlQxH+mRIxYcY+jcvoXQQgbCAe9dI+Kr4lIWtFnHqJzpOW65mD6FoafA4eBrUMKAAg4
         UqSsiCjhMlDD3ABhRvMIS1h+CQgCgFngqhpNR3NCCFRhTfqYVnV23jSG4KrjvPRAQw+T
         WWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864241; x=1795469041;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3NDCplZK7ik0X8Yf2ESiTaq7yDLCV4EImoCaTstoWM4=;
        b=fd9DUzqxvPzwnxZ7ySTkV3JKaj0smWyaxwAoPlWZNTGcOrF0PT/Yq5cVrk/yUvMAbN
         hPgX7ah2uoCVYYvMz3bs+8Iv9ubP2J3dTs9cdV2D3GWycxURNgHWSNZxjt3vPqu328mB
         X//fAqlb+Ow90Y87q6G4Gh4HCc3ntGszSF5CINokJbu4w9zUYzt1ghGO6lsfLxOz7w61
         pBupXFJUI3DwRVXU4p7zQjQANwitRi+IdOZpxo+iv3OgrrCh8c5xINwAG6I+pPsrUTQE
         qQ+JvdJ98gJ5oU2h+504YgLP65FBWiR6mnhXg3E7+bqX9fketpi8pHabpZiaGlbuKWis
         IfRw==
X-Gm-Message-State: APuU4Z+tYu1aQRu5njYsX1unWkK5Tn5LDxe3SHNMnhk8LmNzfzD6lbq5
	PdvpMuGSXqyHzaUC3Fwa9IFTswsrKnpOB46f9RY45GtZaplYcyzDrZQcfwmP7QeNV2lx8XAn72x
	PbEzIA8k=
X-Gm-Gg: AYBFou2lvuH6WJkrZ4ordf7hxmSKXMM7AlY3fo33FAsbNpXMBKWq242tU4uBj04eKFQ
	V/V2AZ4F6DCI18WFGxQTnCCWiF5lrnhSH77nvOsXmpsUgiHE+KhbcCHzdDLvnAPEnr9YFuAhhhr
	wZRhu7B4Udpqa7rxxtZK5WDSwyTHd9UqpfKLOK93MpKBJDbjWLu5Ulj5ffpRnRYdWldsePQEffK
	hf2a64hvmuUV3V7EhlvfCtQcfRG9xmns2UtfZIHucCa4TAZEoo0rPBmat00iZs99ZAaU/Y5nv6p
	LUDPjfuih+tC+GzxndxSNGm9P6sQKzTFvGZU92OWOUJbTc0PIQ1TIXK5HrDZcQNCIrRPoi1giZ8
	QrxdMKssCEVXD/dJcEIpeHaEsVjvKVQ7aT5U2XZg5rrVObnVi+L1dvWFUcOKMkwBGmHivwX0RI6
	iqK3+1g16NXkmGOkw9dmB06eXQEMq1NSac7Dwg7650KjFH165RrpWWQrqxRLclvzciq5iZ1nVPV
	hfPHMmXTJYnpLIerbIkJFjUBOBUHbzZwLw1lNHf2hVmQtxxtQyM/P/2aN3t5ThoRk8uzZMi1r0i
	l8N9r7+VoexCKvWUF6hQ9vAUO5d90yKYey5FoBDyowP90IDTxzwUxSAIe+0wVZhzh24yHPepgOr
	pnQ+vIBXq
X-Received: by 2002:a05:600c:c84:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4bb55a68429mr264065535e9.26.1794864240857;
        Mon, 16 Nov 2026 13:24:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:7319:1134:8f94:f341? ([2a01:e0a:106d:1080:7319:1134:8f94:f341])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571d7e87sm220605515e9.3.2026.11.16.13.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:24:00 -0800 (PST)
Message-ID: <63a95c40-2371-439a-8974-4dd7a65d14c8@linaro.org>
Date: Mon, 16 Nov 2026 22:23:59 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] interconnect: qcom: Don't read back BCMs without an RPMh
 address
To: venkat.yadlapati@yahoo.com, Georgi Djakov <djakov@kernel.org>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261116-icc-bcm-readback-v1-1-36b533d66a69@yahoo.com>
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
In-Reply-To: <20261116-icc-bcm-readback-v1-1-36b533d66a69@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 21:19, Venkat Yadlapati via B4 Relay wrote:
> From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> 
> qcom_icc_rpmh_probe() ignores the return value of qcom_icc_bcm_init()
> and reads the initial vote of every BCM back with rpmh_read(). When the
> command DB has no entry for a BCM, qcom_icc_bcm_init() fails before
> setting the address, so the read goes to RPMh address 0. On Molokai
> (SM8845), whose command DB lacks the QPC0 BCM of the Kaanapali gem_noc,
> that read never completes and every later RPMh request times out, so the
> regulators fail to probe and the boot stalls:
> 
>    qnoc-kaanapali 31100000.interconnect: QPC0 could not find RPMh address
>    qcom-rpmh-regulator 18900000.rsc:regulators-2: failed to read ENABLE status ret = -110
>    Error sending AMC RPMH requests (-110)
> 
> Skip the read back for a BCM that failed to initialize, like before the
> read back was added, when such a BCM was simply never voted.
> 
> Fixes: 11a44c6087c6 ("interconnect: qcom: implement get_bw with rpmh_read")
> Assisted-by: LLM
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> ---
> Found while bringing up the Motorola Signature (Qualcomm Molokai, SM8845)
> on next-20261113: the boot stalled in the regulator probe and every RPMh
> request timed out after the first one. The Molokai command DB has no QPC0
> entry, so qcom_icc_bcm_init() fails for it, and the read back added in
> commit 11a44c6087c6 then reads RPMh address 0, which never completes.
> 
> Tested on the Motorola Signature: no RPMh timeouts, the regulators and
> the interconnect providers probe, and the rest of the boot is unchanged.
> 
> I used an LLM (Claude) to help write this patch and its commit message.
> I reviewed it and tested the result on the device.
> ---
>   drivers/interconnect/qcom/icc-rpmh.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
> index 4a2a746a4e59..1fbf4c960e1e 100644
> --- a/drivers/interconnect/qcom/icc-rpmh.c
> +++ b/drivers/interconnect/qcom/icc-rpmh.c
> @@ -332,7 +332,9 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev)
>   		return PTR_ERR(qp->voter);
>   
>   	for (i = 0; i < qp->num_bcms; i++) {
> -		qcom_icc_bcm_init(qp->bcms[i], dev);
> +		/* Don't read back a BCM without an RPMh address */
> +		if (qcom_icc_bcm_init(qp->bcms[i], dev))
> +			continue;
>   		qcom_icc_bcm_get_bw(qp->voter, qp->bcms[i]);
>   	}
>   
> 
> ---
> base-commit: 3fd56a2833c22f62eb84297d0dbd47739632f1a0
> change-id: 20261116-icc-bcm-readback-a339f8caeb09
> 
> Best regards,
> --
> Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
