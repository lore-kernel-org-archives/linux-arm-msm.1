Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991748;
	b=MwB92aSzUxajGvdRtGOukgbi8SH+t+9JEdwxZotc3Mn/jIzOajfYjyiDoxbHCIGn6y8R
	 tDmS6x1Jy9A9jJezECi/YqACK+++eInwK33nKJFMC3HFBix9YnFJVB6yA4EdtxemLAIYk
	 WVzW64MxDL+ZI6Kb/oD+/trQPf/k102Asm8A+AXSr0kaA+qNpZuALQjXTRNGpfEVI+B+H
	 7jqOooD+r/Q0kYbRB3sRRk1bTt4Wl1s6z1mCXj44BwjkLdI0QI9SFMavfXRQsNfG/57dG
	 OV7IDKihKPoY8P9vQXnVELpfTI8O/50JY9zaMaBfe+bBtuEwnyoQMeIDOj4ncyvaVAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=8IXnqcqxd3NL49qeM0I03VzWH/O3oCs/K8YTj0sq08I=;
	b=K1GvKtnCGR6f7W8adZoUw/cnTwba+c3+SGkDn3fpwCNws1icULWscV7aZlRvI8u7fSbH
	 dEx4A0pmxcyxiV2/BSUKKYkR287kwpjU56r3lwPBqGEm0tbUAbWRt44RYHCqeb7seSDfT
	 w/VF2CQGuh0Qx4qp9x4Au3EoRTj10SUqo6Py3sfVuLI+1Ja+MAf2J3QDIP4CmNoxM+NLg
	 ZVA/QUa8E/0i/B+2NLrjF6gPXF+wGwftTvdy/hpua3fnu+OojaDx/cvZ2g4xnWvjCI96A
	 T5s/9cz1jlVJw6LiszBzYOMYtjRe3zshaH87AY1yqxciQ/+zdXAhZk62LBNZ/H3/QjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jDLw2V9n;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C4F606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7C4F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jDLw2V9n
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so532073f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 00:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794991745; x=1795596545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8IXnqcqxd3NL49qeM0I03VzWH/O3oCs/K8YTj0sq08I=;
        b=jDLw2V9nur76U8TDiXIGF+zTkWgap3nNI8PLBGUV4Og8qIYAbvNJA0HuX/MxYpy/bB
         V3hE0WQf3zWqElhCzzg4zcJR4x55i/Qh0M3Id1+kbI+4Y3VPow70YNtDeOWK2tOzPKfn
         Suu9/yzFUE44Lv4FOz7nae3BOhsUJscLKbYscGaxDUfWU5vCYaIiMjXASyjuRIwWe97d
         JqovmPtsu5efidgmd9A3ivZh7vWMhsHrWQSCSV/OTg0d7P0lAKN4SLtdcSGRfi1EIQ8P
         eZPPGgj0EcOqlaa4IrLZAL2xVrkPeUtywwQyEYLfaBdd6ZZh+SDcgLz0k/Gr+M82jtby
         yL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991745; x=1795596545;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8IXnqcqxd3NL49qeM0I03VzWH/O3oCs/K8YTj0sq08I=;
        b=nnSXK8np+rAKuiOS4kVj2dI6uTqNSFtjDuHJmIdzAc3/I7qQM3FXG08K5wJXDRZrRJ
         us0DfiZmwqdQYH7jreTJ5E+bA00Qf1M6Tn71XX5/L+NKJIStkbXWpyxp5TUK9zkG0SQf
         tSkVBL9TUZqrUP2ZUSB5LvVtAQAHvayQfialudTdHfyvTyE4A2hZDxUC7+Bqf3INa9Y9
         kn3lHkqYV1XZ41bPrJV8RXFGWEhcj1ylb9dZ3oMghpqgzvh/O6NLdCSTVv8mOLkr4+3M
         +aMuU4zPH1NL3O5X44coNOHAO5XlV1/fYFmyJTw/xyNq134Kh8Z70YXQtPs86FOlLEVd
         jEAA==
X-Forwarded-Encrypted: i=1; AL+hErEW50ZVSjbTcMZJNl4mL9NmZ+RfxG2p5RwZqrnewCA694iJl2RavsfDrbZsTadjvKps1/EVLCNNr1d3os6X@vger.kernel.org
X-Gm-Message-State: APuU4Z+DYpdUPO8wldV182AsjIJbMBi4qMMBjnz6n9vq6+tkExEwAo4Y
	I2EcnqQK9vbdxoTqh4giWrnvYzHxp9lzvKdW0WDHSquvB0pbs325Oxj4oJ6j06w2uWg=
X-Gm-Gg: AZFdTZesFmlZH7g7x105ba7KyBEjsSP18PSb+0mq80tsG3xgIJqCMtZAacSWf39VvUV
	QBeTbH7UFHTww3JxyzpB/mkamtTiEQcgRBCn2rKolwssFI37Q/q0am1AjTcp7QHlWdI5xz7nN/U
	/tUNK8P7LwZ4ZzMGN+zqx/Xk1q5rG5qtxAf0rvT/Mgo7l980E7lXw8L2AP14yK0Gjnsk8oBSfgy
	0cy3UBBLTkF6NqfSdj9Z7QdcQj7Vnhp41Lk7LjCNb+1bcxZlXfMAyhSTwJvRcIt9TLKSn9A8fxt
	5viHT5P7DlZwDsu5Pr2hMadP2SW9T2UbgV3IQXN0JYg1Jz2g0zh55IxaxZSvcpGrTYfIe3ACEYy
	MaHYolVgMbzMax3Lc1pxcJ7oN593UByIF7/a2iWPF3kv+Ggdr0UvL0HOiBW4uzWOcFmYYohHmFA
	6h80N17/vr4x1gn/LUiwGlc/nIduk2T/r+L7DVYKbWLuA+GUqcCi5rXI+atvVU5gvZsyzdPuYfZ
	XOKxOEd+loKm1nkbvNA9W8WZLfhlDGqzumnbahuIPYsHfXRaa05zN9sjeEJSWgoDipCKtzvYoe4
	Omc+t2yqeCw8vePl6579YCD1YCCjEe99HvcSZjA3AhSCSALAUvlMPxkoxOJnTrtX4Qh9c87S9MV
	mMcPi1Q==
X-Received: by 2002:a05:6000:4703:b0:4a6:4f35:31fa with SMTP id ffacd0b85a97d-4a64f35323dmr3609717f8f.3.1794991745189;
        Wed, 18 Nov 2026 00:49:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:4c8:6fe2:5534:d99a? ([2a01:e0a:106d:1080:4c8:6fe2:5534:d99a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656b1cfdfsm3615721f8f.47.2026.11.18.00.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 00:49:04 -0800 (PST)
Message-ID: <a641c291-115d-4aca-a0f5-71dafcaee898@linaro.org>
Date: Wed, 18 Nov 2026 09:49:03 +0100
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
Subject: Re: [PATCH 1/2] media: qcom: iris: gen2: subscribe to the picture
 type on the encoder instance
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261117-topic-iris-encoder-fixes-v1-0-169ce990d12d@linaro.org>
 <20261117-topic-iris-encoder-fixes-v1-1-169ce990d12d@linaro.org>
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
In-Reply-To: <20261117-topic-iris-encoder-fixes-v1-1-169ce990d12d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 16:21, Neil Armstrong wrote:
> The GEN2 iris expects the HFI_PROP_PICTURE_TYPE for the encoded
> buffers, but HFI_PROP_PICTURE_TYPE is never subscribed for the
> ENCODER instance in iris_hfi_gen2_subscribe_property().
> 
> Add the necessary tables along the vdec input and output properties
> table for the GEN2 hardware.
> 
> The tables are aligned with the vdec and downstream iris driver
> implementation subscribing to HFI_PROP_NO_OUTPUT for the input
> queue and HFI_PROP_PICTURE_TYPE for the output queue.

Sashiko recommended that I add:
Fixes: 92e007ca5ab6 ("media: iris: Add V4L2 streaming support for encoder video device")

will do in v2

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 23 ++++++++++++++++++++++
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 15 +++++++++-----
>   .../platform/qcom/iris/iris_platform_common.h      |  5 +++++
>   3 files changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> index 79bbd06ef8d2..3b0fb408f05d 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -1906,6 +1906,14 @@ static const u32 sm8550_vdec_subscribe_output_properties_av1[] = {
>   	HFI_PROP_WORST_COMPLEXITY_FACTOR,
>   };
>   
> +static const u32 sm8550_venc_subscribe_input_properties[] = {
> +	HFI_PROP_NO_OUTPUT,
> +};
> +
> +static const u32 sm8550_venc_subscribe_output_properties[] = {
> +	HFI_PROP_PICTURE_TYPE,
> +};
> +
>   static const u32 sm8550_dec_ip_int_buf_tbl[] = {
>   	BUF_BIN,
>   	BUF_COMV,
> @@ -1985,6 +1993,11 @@ const struct iris_firmware_data iris_hfi_gen2_data = {
>   	.dec_output_prop_av1_size =
>   		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>   
> +	.enc_input_prop = sm8550_venc_subscribe_input_properties,
> +	.enc_input_prop_size = ARRAY_SIZE(sm8550_venc_subscribe_input_properties),
> +	.enc_output_prop = sm8550_venc_subscribe_output_properties,
> +	.enc_output_prop_size = ARRAY_SIZE(sm8550_venc_subscribe_output_properties),
> +
>   	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>   	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>   	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
> @@ -2032,6 +2045,11 @@ const struct iris_firmware_data iris_hfi_milos_data = {
>   	.enc_output_config_params_size =
>   		ARRAY_SIZE(sm8550_venc_output_config_params),
>   
> +	.enc_input_prop = sm8550_venc_subscribe_input_properties,
> +	.enc_input_prop_size = ARRAY_SIZE(sm8550_venc_subscribe_input_properties),
> +	.enc_output_prop = sm8550_venc_subscribe_output_properties,
> +	.enc_output_prop_size = ARRAY_SIZE(sm8550_venc_subscribe_output_properties),
> +
>   	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
>   	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
>   	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
> @@ -2920,6 +2938,11 @@ const struct iris_firmware_data iris_hfi_gen2_ar50lt_data = {
>   	.enc_output_config_params_size =
>   		ARRAY_SIZE(sm8550_venc_output_config_params),
>   
> +	.enc_input_prop = sm8550_venc_subscribe_input_properties,
> +	.enc_input_prop_size = ARRAY_SIZE(sm8550_venc_subscribe_input_properties),
> +	.enc_output_prop = sm8550_venc_subscribe_output_properties,
> +	.enc_output_prop_size = ARRAY_SIZE(sm8550_venc_subscribe_output_properties),
> +
>   	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
>   	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
>   	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 388a36ff2b07..6131d22c579f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -1059,12 +1059,17 @@ static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
>   
>   	payload[0] = HFI_MODE_PROPERTY;
>   
> -	if (inst->domain == ENCODER)
> -		return 0;
> -
>   	if (V4L2_TYPE_IS_OUTPUT(plane)) {
> -		subscribe_prop_size = core->iris_firmware_data->dec_input_prop_size;
> -		subcribe_prop = core->iris_firmware_data->dec_input_prop;
> +		if (inst->domain == ENCODER) {
> +			subscribe_prop_size = core->iris_firmware_data->enc_input_prop_size;
> +			subcribe_prop = core->iris_firmware_data->enc_input_prop;
> +		} else {
> +			subscribe_prop_size = core->iris_firmware_data->dec_input_prop_size;
> +			subcribe_prop = core->iris_firmware_data->dec_input_prop;
> +		}
> +	} else if (inst->domain == ENCODER) {
> +		subscribe_prop_size = core->iris_firmware_data->enc_output_prop_size;
> +		subcribe_prop = core->iris_firmware_data->enc_output_prop;
>   	} else {
>   		switch (inst->codec) {
>   		case V4L2_PIX_FMT_H264:
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index cddab9a9c375..cf5ae420f646 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -303,6 +303,11 @@ struct iris_firmware_data {
>   	const u32 *dec_output_prop_av1;
>   	unsigned int dec_output_prop_av1_size;
>   
> +	const u32 *enc_input_prop;
> +	unsigned int enc_input_prop_size;
> +	const u32 *enc_output_prop;
> +	unsigned int enc_output_prop_size;
> +
>   	const u32 *dec_ip_int_buf_tbl;
>   	unsigned int dec_ip_int_buf_tbl_size;
>   	const u32 *dec_op_int_buf_tbl;
> 

