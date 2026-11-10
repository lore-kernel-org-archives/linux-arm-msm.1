Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321768;
	b=QCRtKKfLVtXj86bo+2viDT6pBJ/JsJvMRJTl1zPgK6AGtaypB1Esyx5HX1L2gmgU5bOv
	 J7w4fGKkXa9kdcFKjRk0mnD5GCgrGR5qHxmODo3v94Coxc0437CeZeoz+Cq/PoXEGXRUH
	 CwuUsMd7MxGABFtW2PCNWLkK2Ue6mn2SXeP8gobIhhGi42CavvQL2Ugp63BJI/Bixuh/q
	 08Od+q58DTtnI4xXzeoXsCCAvvuPJiV2IvnfHq+r3aCTJiRmei4PCjwQbOkfFTLFIy+qd
	 7SYqQchAPeEvFcQAWo0dRHz6W3XJtAypt6Sd2PH118dGyUxcGdMY0GZi0q9IOipVtxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=iU+EzkbKMFrOZFFUWDUX+jv1j+DUirQeUzUM2Odhqp0=;
	b=3wGa/R29nlTnowrLlSLM9j/VeLC6lbuYSowwPa6JNUaCzaEUcZURVMlFoUUpZC8HILvO
	 s3vSayIVTfo0rf8Xd2Ecxj7yf+3A+212mJQUg3a6qSwVpAvyfzGA9m/M/1hBuLtoU8KAk
	 b37Qc+ilPnI1yJlrOZ6aq8LmNmDR8JhROIQkd3JNV10+GqZkldI8MRTZo/onHBiWd55Ec
	 xe5pITnnpEFeQrBH7dKVTBYtfOtknRcLtlpSSkl29aiMBeAaWJR9n7EJShDILBAAl40so
	 9Lkk3zjriXjv/YMbuKFlKNVzYvoN3v7K/cHUvFQI7SY4+O0rS5bqFc/mvIZ4fNDyXOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zpSlcvgK;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBF560A260E
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 14:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DBF560A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zpSlcvgK
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5060a48ba9so23607666b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 06:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794321767; x=1794926567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iU+EzkbKMFrOZFFUWDUX+jv1j+DUirQeUzUM2Odhqp0=;
        b=zpSlcvgKQl4GAF+LAEWwXo102Dk6lRikWqRJTDbMVSdWsHj7c3FRe/SdIx4D6DmgCj
         +TeNDxHm/XD7kdkMGcaXqBUFnkHMTqxgb9NhSUWUm7n1o/xzOd3YbjcZlRGl1Ly+rrf9
         Ip8WihiP4WCqVbJBKydkH0HRz1sRDBFGoQ8HJafvhSQrODlgYoCpcZcg0U2HLEX1IRF3
         4TaDSGjDgXx/pU4U9x5GiQxlFjtGhUHXnDwhjtMPqnXHwRsp4vMms1LgHbg0+/67vCjZ
         /doYZIydqNjewM46rQvM56F8F/poFKOb5HpYtovpd5bT3je56+Rn4ScuTIg2GqUDPHrn
         zTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321767; x=1794926567;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iU+EzkbKMFrOZFFUWDUX+jv1j+DUirQeUzUM2Odhqp0=;
        b=N8x7Knd719TOceDdKPF/pYHAk9lAI4zKd++9voshVnzRZTcHzj/Z/MRbZzVkQoFdPJ
         aLoDpPztlJ1Nn4HWWKobJNyNdfDk9Abwi3EI8NmB6eaPPyAA1O45vlmZp04w2NMUqhML
         BS81vF6gZwlgi3mSlXRd2d1QdQ5BQnkQKm959F8ksO472CH7WhzQs31lFWP1R5Wwi1+3
         OURY+9BsoED/dWewQk8yvV13GGawYF13vVdAPolS6Vreut1swne7PkpdEjsvUDf6Aau5
         Gdib3dtrN3exz+XkYBMkAwOUEdJob6N90q8u/9vUw1ig/jHSuQ0Wf87lLa27if+nOHAP
         J65g==
X-Forwarded-Encrypted: i=1; AL+hErG+syxmcnw7UU6VQP9mRphHJco+Y8M2e9Qr9JMabk3/sHMPzTd4oS10KrjeE+yxY9tDcELS0KcCIKnMLAce@vger.kernel.org
X-Gm-Message-State: APuU4Z+Yr+Pgn9gHLbEYuf079eGc7L8gneBk94kAUIEXyIxACZ/Sa495
	5Do/Gk1iDs+H1lfkV0IUUZcXZsaPn5ylFtoX8J42DqYzoPdUgY+z97VK/rjuzekTjuwKRaFe3mB
	AYFTd
X-Gm-Gg: AYBFou03daaOrC4G+a6CIq1CWy0K/PjwAHpYxECwTs/tl6ByHOT9Z1cxypW5Y97n/qv
	QTb0c68pIQQcQW/kwBe/gDhA2MO9s3qXra6WG9tvOLudIlCRuoweDQYXqY7NuQOjOvXNUrFW8Ng
	BnTCPovJkYcKSNC56dookPBdQjHY+TJ7xNNisXsZQUvQPV/JDuF+uE0m5jgAn1o+JPJQFWjRZmQ
	dakE3Ac45pK5uvHRz4oy4Nun1zFtry/fHdwyL8YJ12+cwif60DJQhr8Wlh48BTI+taAPqO+otYI
	C4V6XO54KGF8XQ1jy6mbN9+CMqI9tesdPy7z6ogmdTf0b/Gu9Fp3yLdlNFmuRqWGSVp0UAXxWjl
	18s8JVYoNBTPNqQsNFocKj7tCYPrc5qlOI+xNzu9S1XVEDnJypkbmgHDV3ulc9Z0sX7Ixk6eo5d
	gtdtUeeBDzwjMHOu+WxuRtc/naLVTGEIbf1+YUJlh/7DtKC/9iQkahlAlUXhN+cqDsJAEO72MQo
	DRoBvVATcRwKCbStA1vscDVSqhJtM2AzU7U5fGKYZNkJpwOUl+sBvtV+5GHlpD7gP+M5lnqC6fz
	7GxumpAAVginzhO0VdmhdFJYPM6P9L/PzyK3qxb/dec=
X-Received: by 2002:a17:907:e849:b0:c49:9383:a28 with SMTP id a640c23a62f3a-c50495ef6d1mr244854866b.35.1794321766382;
        Tue, 10 Nov 2026 06:42:46 -0800 (PST)
Received: from [192.168.0.167] ([109.78.220.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a65f267sm112205666b.71.2026.11.10.06.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:42:45 -0800 (PST)
Message-ID: <ee2aedde-6688-4cfd-9f92-3703b081247d@linaro.org>
Date: Tue, 10 Nov 2026 14:42:44 +0000
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
Subject: Re: [PATCH v2 3/5] media: iris: Fix use-after-free on unbind with
 open sessions
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>,
 stable@vger.kernel.org
References: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
 <20261110-iris-handle-unbind-v2-3-86d5f6f1dea8@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261110-iris-handle-unbind-v2-3-86d5f6f1dea8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2026 14:09, Vishnu Reddy wrote:
> The driver can be unbound through sysfs while a client has a video
> session open. The core is devm allocated and freed when remove()
> returns, so the open sessions then use freed memory.
> 
> Only the core structure needs to outlive remove(), because it is the
> only thing the file operations of an open session still use. Allocate
> it with kzalloc and tie it to the reference count of its v4l2_device,
> which every registered video device holds. It is freed when the last
> file descriptor is closed. The other devm resources (register mapping,
> response packet, clocks, power domains, interconnects) are only used by
> the power on/off sequence, the clock and bandwidth votes and the
> interrupt handler. All of them are released with the unbind, after the
> core is shut down.
> 
> To make sure nothing uses them afterwards, set a removing flag at the
> start of iris_remove(). It makes core init, new sessions, command
> writes and the clock and interconnect votes fail with -ENODEV, so a
> client still holding a file descriptor cannot power the hardware on or
> vote for resources that are gone. A client waiting for the firmware
> only times out and returns an error without touching them. Runtime PM
> is also disabled explicitly in iris_remove() instead of with devm,
> because its callbacks use the core.
> 
> Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260926064921.976721F000FF@smtp.kernel.org
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.c      | 10 +++++-
>   drivers/media/platform/qcom/iris/iris_core.h      |  2 ++
>   drivers/media/platform/qcom/iris/iris_hfi_queue.c | 15 +++++++-
>   drivers/media/platform/qcom/iris/iris_power.c     | 13 +++++++
>   drivers/media/platform/qcom/iris/iris_probe.c     | 44 ++++++++++++++++++-----
>   drivers/media/platform/qcom/iris/iris_vidc.c      |  3 ++
>   6 files changed, 76 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index d558475986ff0..bdac6b8c98e44 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -43,7 +43,10 @@ static int iris_wait_for_system_response(struct iris_core *core)
>   	ret = wait_for_completion_timeout(&core->core_init_done,
>   					  msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
>   	if (!ret) {
> -		core->state = IRIS_CORE_ERROR;
> +		mutex_lock(&core->lock);
> +		if (!core->removing)
> +			core->state = IRIS_CORE_ERROR;
> +		mutex_unlock(&core->lock);
>   		return -ETIMEDOUT;
>   	}
>   
> @@ -56,6 +59,11 @@ int iris_core_init(struct iris_core *core)
>   	int ret;
>   
>   	mutex_lock(&core->lock);
> +	if (core->removing) {
> +		ret = -ENODEV;
> +		goto exit;
> +	}
> +
>   	if (core->state == IRIS_CORE_INIT) {
>   		ret = 0;
>   		goto exit;
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 3e4cf652bf39a..379f0666a42cb 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -62,6 +62,7 @@ struct qcom_ubwc_cfg_data;
>    * @iris_firmware_desc: a pointer to the firmware-specific descriptive data
>    * @ubwc_cfg: UBWC configuration for the platform
>    * @state: current state of core
> + * @removing: set when driver removal starts, blocks core init and resource votes
>    * @iface_q_table_daddr: device address for interface queue table memory
>    * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
>    * @iface_q_table_vaddr: virtual address for interface queue table memory
> @@ -108,6 +109,7 @@ struct iris_core {
>   	const struct iris_firmware_desc		*iris_firmware_desc;
>   	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
>   	enum iris_core_state			state;
> +	bool					removing;
>   	dma_addr_t				iface_q_table_daddr;
>   	dma_addr_t				sfr_daddr;
>   	void					*iface_q_table_vaddr;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> index 545bbe75e1740..e0cfa5107d1d9 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> @@ -128,13 +128,26 @@ int iris_hfi_queue_cmd_write_locked(struct iris_core *core, void *pkt, u32 pkt_s
>   
>   int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32 pkt_size)
>   {
> -	int ret;
> +	int ret = 0;
> +
> +	mutex_lock(&core->lock);
> +	if (core->removing)
> +		ret = -ENODEV;
> +	mutex_unlock(&core->lock);
> +	if (ret)
> +		return ret;
>   
>   	ret = pm_runtime_resume_and_get(core->dev);
>   	if (ret < 0)
>   		return ret;
>   
>   	mutex_lock(&core->lock);
> +	if (core->removing) {
> +		mutex_unlock(&core->lock);
> +		ret = -ENODEV;
> +		goto exit;
> +	}
> +

This locking scheme is looks racy, what's the point of this granularity ?

---
bod
