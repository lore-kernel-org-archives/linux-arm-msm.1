Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC1E3750CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641792; cv=none; b=pEmencHCUWmxA1OCZdTdilWov8h8iCsFg0SoGN2dC93yy8u2Gjk8elOJp/PCJv0XxdM+OV6BE2/VDSVpULYFtQdoCm05LzDGAR1rxd9Z+xtsHF2e9sFOgPtCvMAQ+gNdZVl/2x3COsbPnBcApN9DII8FB0mwkJ94/7se7e+drYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641792; c=relaxed/simple;
	bh=wDxgpgB4cqvzORd2Ng0Z7chN1T6KmCCz8/zVtbDTCVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QrzXMLdD4nPmbF9yRa8q1+Wz2bpnrn797xzjhLtC/hJwhldgUpMvKjBXury2QVWRaPgErZ7lgj5RlTATxhgbIHyocpnEw/KMDV6SsUn7cMO3I6kQCd5drRZJ2bIkR832wzOuQCQfOjIgoSZ9AXQ3XuNrSBhpoAPqUwbZuPnUlRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKHA9LOw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UMrhzHdj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKHA9LOw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UMrhzHdj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg67x1805622
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4J+xoisba7u9XVXkc29nbVSk51yrBEFXVXFsqh8j5x0=; b=CKHA9LOw6QpmFIgO
	wlkbEsxqO4uwWyN55jAFPMpmq375eaXSIxHhXA4YFgN02dbugCr5aImPoJYFQisL
	VaeLOwit7MvZHSS/2QT9mFGR7L4ngD1M7HDYinX+Zi6zr7byyGhmVjvqXaOkhuWz
	oBodb6CiY61unLh01GCUAFA2dY1KmOvs33ms7GLvpTHSQ3ZZ16Ho9P9zuAnWEYW2
	Rk7I1Miko85hhUxRmA65l2OIP5NJMH2jy0jlOfGaXihlDDUh0+PRhRiZgHemktBy
	kUxnVaILRODCaawgTE2aUWtNstuCJh99dW5GSDSaSe9GQ2dZyOs5uxDfvK/hzYwd
	PL/otw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pa90ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:49:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9c26587e67so5548871a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784641788; x=1785246588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4J+xoisba7u9XVXkc29nbVSk51yrBEFXVXFsqh8j5x0=;
        b=UMrhzHdjQaA7YQqzhrbborfyft5NqBfSyJPRO6nvNpvaJoyHa/db2pLE3ilviEotC7
         IF26G7yD/+0lhJN4b4whLC4J9V9hWzVI/sAoGw14Hub8ooa4M4ibJIo4/fnE+ejRJ8oN
         roZVlmbQZYIvMiyz6XfjsvXCxbwUCO/hrezWbGDSh3RM2V5W5ZHedpUkZ0egWmE1TBTR
         NYd1CcLcMQf1y52pU4HqHJX2jyZL16+m6aj4BDnvC9Uj/137XpcuvkPg+I8+/Mz/ni9v
         Xsc2CXb+l1Czh151pML+T+n/OD0Tyi8A/Xa0q4FTMcAd2n7nspwzxVZ0913WYwOCSDo0
         kQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784641788; x=1785246588;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4J+xoisba7u9XVXkc29nbVSk51yrBEFXVXFsqh8j5x0=;
        b=IrTk+RBLmlYfX/wWgjVSt9IaG5fWjGQyoGNmcHe9aBeJ5HWhYdFd54cZPWFNdQG8ey
         Nteow3AzH1BnAIvL+G/5P8F0Br4xR3pGjjMJ8i4qqyu09B2DAV0lxglJOs92qpf64AS8
         EaO2/Qw7bdvlGjVpakPnmKP3zg+Zl3yhNJleOF39d9TIjn5sKs67OxiN7fx3nSk2XQ8K
         n/JwDeE/QXJoaZGgmFyMnwLNbHph9DwtpMi8fys/+bpQMBB9P0LNrfRYarRnonX2O0Ep
         nbCbIVDZ4qZryfUqimRzAJqqvBVSgIgT3Bs/jP1CiEMuBwjoFOyWHJfVWqDZugByOGCg
         xDSg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6AFe00nll/Qe02FSff0h/rqV9OMYr7ojE4n6PKl9jNkAfg2lKvDlChyf3NUgSDsPes02LQ2X1obac/p1m@vger.kernel.org
X-Gm-Message-State: AOJu0YzOxiuoFPaAEZKmMQ69adOlmv5xk553Aqsd+y6dm0Ph760elZcJ
	EC2d3E/swovAREFiGjP9Ek16SfY1jEmko7S3iSGMpkVGVVernyf6pEEL+fsBNajuDzshLK6iZ7j
	G5aJNqOwL0KX4QYVWZuIV1G0oigFa2OR5WAHpA02wX+hOcm4/1xmCJgVpfbMu/WaTXjmz
X-Gm-Gg: AfdE7clkEoTZVXu4mTalL6m6s+ixNOe/laIO1Db6Fxr0wnue9j0td7618BklO4vActx
	vFU+pqFGe3zg2lBPDjzxdKJlJ0gjlzn0cfDvAkuCZZ21si3QaPV3eosZfBeeOr2mRbOOV31KRPi
	Zkpn++ddkCAbutNK/sGmhP0b6sD9GlQlV0l1cHElMBN3IBgrSq0hupT0TE+f8Fpo+ltGA7SUK9W
	EOZMh4O61YxYqUvDigfgaF9Zn5cJ0jNGfbGcFJRjsaAxfjjCRWT9sMWhGBNimrkMw9zGaDXKFb6
	YoukamMfaiYrucZrkJi1bo6jxhEJqO4zFGK5p3OAN+b/kBH/MbeUA+9KWOTq83HI5tPyft8Mcg0
	9WVslx2PRNuct4qf3nViXKVFTzbBcuA6M
X-Received: by 2002:a05:6a20:d52f:b0:398:76d4:c7e9 with SMTP id adf61e73a8af0-3c38dc13d10mr25501342637.35.1784641788373;
        Tue, 21 Jul 2026 06:49:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:d52f:b0:398:76d4:c7e9 with SMTP id adf61e73a8af0-3c38dc13d10mr25501307637.35.1784641787769;
        Tue, 21 Jul 2026 06:49:47 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbda9sm47202871eec.19.2026.07.21.06.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 06:49:47 -0700 (PDT)
Message-ID: <8b26445a-6df5-4fcd-b17a-211120fe8301@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 19:19:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/18] media: iris: Add Gen2 firmware autodetect and
 fallback
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-1-76af9dd4d1f6@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-1-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vhgvFY8EN1Jm_mDkHOq-4q0BSurhkaz_
X-Proofpoint-ORIG-GUID: vhgvFY8EN1Jm_mDkHOq-4q0BSurhkaz_
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5f78fd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=GWEVztfZRELcCs27ssoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NSBTYWx0ZWRfX5P9BPrLeg6ep
 3OZH9wUytCmLVScW9ZHThKB+fCcvLTN+qU2JWhIg8aUpWN1Vmx/SLJ/hSQbvWoDqUu0cRXg7bjJ
 PY5lQP8DUR2BG00ka2hMQesZ0GNTSUggphzsrDAXaUa1hoWmvyQUtGfD6XlmMff2yoEHz/xsXNj
 4KfE/xtRHEBYdaoSD+gkubLXq74wD3O2J4T2p5I2PrqtG04tQgZhx82IEemBU+ETLafs0yC/p7R
 6pbM93tpIj88bADsJ7E42MKGXU76T9PjrRtinYIpjxWjaKc0rBXu+mncf1GbeALzhDGh6XaO8uC
 lO3TnSrnrief38LEjK63umWI17/3qePLeQJ/BQRZ5hwv7bTZsPKEJVvT7mCKSzP7WYMxLM9z3uW
 lqUq7xEn2bw23GYEvgV5SYzRDJfsIJCIDMX8WTjwUYuyTXwpXFIUMIYNO4jfgjT/ETi+Ufeaqj8
 spNbv4QbRxB1QmnOo1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NSBTYWx0ZWRfXy9DVWBxdVnlq
 DUqyGThr7zbH+URe9jLdKInJDQCnNtiO82JZgRnDhBcSHqGKhLeTKedd9aZjzyH8fuf3IoBzdJh
 RBy4f0wbpET3aKoRHQHbBADmuRGgK60=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210145



On 7/9/2026 7:11 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
> Update the firmware loading logic to handle this generically by
> preferring Gen2 when available, while safely falling back to Gen1
> when required.
> 
> The firmware loading logic is updated with the following priority:
> 1. Device Tree (`firmware-name`): If specified, load unconditionally.
> 2. Gen2 default : If no DT override exists, select the Gen2 firmware
>     descriptor when present and attempt to load the corresponding
>     firmware image.
> 3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
>     descriptor is available, retry with the Gen1 firmware image.
> 
> When a platform provides both Gen1 and Gen2 firmware descriptors and the
> firmware is loaded via a DT override, the driver detects the
> firmware generation at runtime before authentication by inspecting
> the firmware data. The firmware is classified as Gen2 if the
> QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
> "video-firmware.N.M" format with N >= 2.
> 
> If a Gen1 firmware image is detected in this case, the driver switches
> to the Gen1 firmware descriptor and associated platform data so that
> the correct HFI implementation is used.
> 
> This change makes firmware generation detection platform‑agnostic,
> preserves DT overrides, prefers newer Gen2 firmware when available,
> and maintains compatibility with platforms that only support Gen1.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.c       |   2 +
>   drivers/media/platform/qcom/iris/iris_firmware.c   | 146 ++++++++++++++++++---
>   .../platform/qcom/iris/iris_platform_common.h      |   6 +-
>   .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 +-
>   .../media/platform/qcom/iris/iris_platform_vpu3x.c |  10 +-
>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
>   drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
>   7 files changed, 147 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index 52bf56e517f9..6dbe18be5b49 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -6,6 +6,7 @@
>   #include <linux/pm_runtime.h>
>   
>   #include "iris_core.h"
> +#include "iris_ctrls.h"
>   #include "iris_firmware.h"
>   #include "iris_state.h"
>   #include "iris_vpu_common.h"
> @@ -79,6 +80,7 @@ int iris_core_init(struct iris_core *core)
>   		goto error_unload_fw;
>   
>   	core->iris_firmware_data->init_hfi_ops(core);
> +	iris_session_init_caps(core);
>   
>   	ret = iris_hfi_core_init(core);
>   	if (ret)
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 1a476146d758..a3aa41aa1e66 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -16,20 +16,138 @@
>   
>   #define MAX_FIRMWARE_NAME_SIZE	128
>   
> -static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> +/* Detect Gen2 firmware by scanning the blob for:
> + *   QC_IMAGE_VERSION_STRING=<version>
> + * and then checking:
> + *   - version starts with "vfw", OR
> + *   - version matches "video-firmware.N.M" with N >= 2
> + */
> +
> +static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
> +{
> +	static const char *marker = "QC_IMAGE_VERSION_STRING=";
> +	const size_t mlen = strlen(marker);
> +	static const char *vfw = "vfw";
> +	const size_t vfwlen = strlen(vfw);
> +	static const char *vf = "video-firmware.";
> +	const size_t vflen = strlen(vf);
> +
> +	for (size_t i = 0; i + mlen < size; i++) {
> +		const char *found;
> +
> +		if (memcmp(data + i, marker, mlen))
> +			continue;
> +
> +		found = data + i + mlen;
> +		size -= i + mlen;
> +
> +		/* vfw => Gen2 */
> +		if (size > vfwlen && !memcmp(found, vfw, vfwlen))
> +			return true;
> +
> +		if (size < vflen ||
> +		    memcmp(found, vf, vflen))
> +			return false;
> +
> +		found += vflen;
> +		size -= vflen;
> +
> +		/*
> +		 * video-firmware.1.x is Gen1.
> +		 * video-firmware.2.x and video-firmware.10.x are Gen2.
> +		 */
> +		return size >= 2 &&
> +			(*found >= '2' || (*found == '1' && found[1] != '.'));
> +	}
> +
> +	return false;
> +}
> +
> +static const struct firmware *iris_detect_firmware(struct iris_core *core,
> +						   const char **fw_name)
> +{
> +	const struct iris_firmware_desc *desc;
> +	const struct firmware *firmware;
> +	bool has_both_gens;
> +	int ret;
> +
> +	*fw_name = NULL;
> +	ret = of_property_read_string_index(dev_of_node(core->dev), "firmware-name", 0, fw_name);
> +
> +	/*
> +	 * A platform may support both Gen1 and Gen2 firmware; which one is used
> +	 * depends on the firmware image installed on the system, not on the
> +	 * hardware. That installed image does not change while the device is
> +	 * bound, so detect the generation only once and reuse the chosen
> +	 * descriptor on later core bring-ups (e.g. after a system error
> +	 * recovery). Besides avoiding the redundant probing, this ensures
> +	 * core->iris_firmware_desc and iris_firmware_data are published exactly
> +	 * once, before any session exists, so the lockless readers in the ioctl
> +	 * paths never observe a reassignment.
> +	 */
> +	if (core->iris_firmware_desc) {
> +		if (ret)
> +			*fw_name = core->iris_firmware_desc->fwname;
> +		ret = request_firmware(&firmware, *fw_name, core->dev);
> +		return ret ? ERR_PTR(ret) : firmware;
> +	}
> +
> +	has_both_gens = core->iris_platform_data->firmware_desc_gen2 &&
> +		core->iris_platform_data->firmware_desc_gen1;
> +
> +	if (core->iris_platform_data->firmware_desc_gen2)
> +		desc = core->iris_platform_data->firmware_desc_gen2;
> +	else if (core->iris_platform_data->firmware_desc_gen1)
> +		desc = core->iris_platform_data->firmware_desc_gen1;
> +	else
> +		return ERR_PTR(-EINVAL);
> +
> +	if (ret) {
> +		/* No firmware-name in DT: select by probing Gen2 then Gen1. */
> +		*fw_name = desc->fwname;
> +		if (has_both_gens)
> +			ret = firmware_request_nowarn(&firmware, *fw_name, core->dev);
> +		else
> +			ret = request_firmware(&firmware, *fw_name, core->dev);
> +		if (ret && has_both_gens) {
> +			desc = core->iris_platform_data->firmware_desc_gen1;
> +			*fw_name = desc->fwname;
> +			ret = request_firmware(&firmware, *fw_name, core->dev);
> +		}
> +		if (ret)
> +			return ERR_PTR(ret);
> +	} else {
> +		/* firmware-name given: load it and detect its generation. */
> +		ret = request_firmware(&firmware, *fw_name, core->dev);
> +		if (ret)
> +			return ERR_PTR(ret);
> +
> +		if (has_both_gens &&
> +		    !iris_detect_gen2_from_fwdata((const u8 *)firmware->data, firmware->size)) {
> +			dev_info(core->dev, "Gen1 FW detected in %s\n", *fw_name);
> +			desc = core->iris_platform_data->firmware_desc_gen1;
> +		}
> +	}
> +
> +	/* Publish iris_firmware_data first, then iris_firmware_desc (the guard). */
> +	core->iris_firmware_data = desc->firmware_data;
> +	core->iris_firmware_desc = desc;
> +
> +	return firmware;
> +}
> +
> +static int iris_load_fw_to_memory(struct iris_core *core)
>   {
>   	const struct firmware *firmware = NULL;
>   	struct device *dev = core->dev;
>   	struct resource res;
>   	phys_addr_t mem_phys;
> +	const char *fw_name;
>   	size_t res_size;
>   	ssize_t fw_size;
>   	void *mem_virt;
>   	int ret;
>   
> -	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
> -		return -EINVAL;
> -

#define MAX_FIRMWARE_NAME_SIZE can be dropped.

>   	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
>   	if (ret)
>   		return ret;
> @@ -37,9 +155,9 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>   	mem_phys = res.start;
>   	res_size = resource_size(&res);
>   
> -	ret = request_firmware(&firmware, fw_name, dev);
> -	if (ret)
> -		return ret;
> +	firmware = iris_detect_firmware(core, &fw_name);
> +	if (IS_ERR(firmware))
> +		return PTR_ERR(firmware);
>   
>   	fw_size = qcom_mdt_get_size(firmware);
>   	if (fw_size < 0 || res_size < (size_t)fw_size) {
> @@ -66,18 +184,12 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>   int iris_fw_load(struct iris_core *core)
>   {
>   	const struct tz_cp_config *cp_config;
> -	const char *fwpath = NULL;
>   	int i, ret;
>   
> -	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
> -					    &fwpath);
> -	if (ret)
> -		fwpath = core->iris_firmware_desc->fwname;
> -
> -	ret = iris_load_fw_to_memory(core, fwpath);
> +	ret = iris_load_fw_to_memory(core);
>   	if (ret) {
> -		dev_err(core->dev, "firmware download failed\n");
> -		return -ENOMEM;
> +		dev_err(core->dev, "firmware download failed %d\n", ret);
> +		return ret;
>   	}
>   
>   	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
> @@ -99,7 +211,7 @@ int iris_fw_load(struct iris_core *core)
>   		}
>   	}
>   
> -	return ret;
> +	return 0;
>   }
>   
>   int iris_fw_unload(struct iris_core *core)
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index c9256f2323dc..55a4fa356985 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -289,11 +289,7 @@ struct iris_firmware_desc {
>   };
>   
>   struct iris_platform_data {
> -	/*
> -	 * XXX: replace with gen1 / gen2 pointers once we have platforms
> -	 * supporting both firmware kinds.
> -	 */
> -	const struct iris_firmware_desc *firmware_desc;
> +	const struct iris_firmware_desc *firmware_desc_gen1, *firmware_desc_gen2;
>   
>   	const struct vpu_ops *vpu_ops;
>   	const struct icc_info *icc_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index 6e06a32822bb..961dce2e6aa9 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -22,6 +22,12 @@ static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
>   	.fwname = "qcom/vpu/vpu20_p1.mbn",
>   };
>   
> +static const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc = {
> +	.firmware_data = &iris_hfi_gen2_data,
> +	.get_vpu_buffer_size = iris_vpu33_buf_size,
> +	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
> +};
> +
>   static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
>   	.firmware_data = &iris_hfi_gen1_data,
>   	.get_vpu_buffer_size = iris_vpu_buf_size,
> @@ -65,7 +71,8 @@ static const struct tz_cp_config tz_cp_config_vpu2[] = {
>   };
>   
>   const struct iris_platform_data sc7280_data = {
> -	.firmware_desc = &iris_vpu20_p1_gen1_desc,
> +	.firmware_desc_gen1 = &iris_vpu20_p1_gen1_desc,
> +	.firmware_desc_gen2 = &iris_vpu20_p1_gen2_s6_desc,
>   	.vpu_ops = &iris_vpu2_ops,
>   	.icc_tbl = iris_icc_info_vpu2,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> @@ -94,7 +101,7 @@ const struct iris_platform_data sc7280_data = {
>   };
>   
>   const struct iris_platform_data sm8250_data = {
> -	.firmware_desc = &iris_vpu20_p4_gen1_desc,
> +	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
>   	.vpu_ops = &iris_vpu2_ops,
>   	.icc_tbl = iris_icc_info_vpu2,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index 2c63adbc5579..74626b35d9cb 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -90,7 +90,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
>    * - inst_caps to platform_inst_cap_qcs8300
>    */
>   const struct iris_platform_data qcs8300_data = {
> -	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu30_p4_s6_gen2_desc,
>   	.vpu_ops = &iris_vpu3_ops,
>   	.icc_tbl = iris_icc_info_vpu3x,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -119,7 +119,7 @@ const struct iris_platform_data qcs8300_data = {
>   };
>   
>   const struct iris_platform_data sm8550_data = {
> -	.firmware_desc = &iris_vpu30_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu30_p4_gen2_desc,
>   	.vpu_ops = &iris_vpu3_ops,
>   	.icc_tbl = iris_icc_info_vpu3x,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -154,7 +154,7 @@ const struct iris_platform_data sm8550_data = {
>    * - controller_rst_tbl to sm8650_controller_reset_table
>    */
>   const struct iris_platform_data sm8650_data = {
> -	.firmware_desc = &iris_vpu33_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu33_p4_gen2_desc,
>   	.vpu_ops = &iris_vpu33_ops,
>   	.icc_tbl = iris_icc_info_vpu3x,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -185,7 +185,7 @@ const struct iris_platform_data sm8650_data = {
>   };
>   
>   const struct iris_platform_data sm8750_data = {
> -	.firmware_desc = &iris_vpu35_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu35_p4_gen2_desc,
>   	.vpu_ops = &iris_vpu35_ops,
>   	.icc_tbl = iris_icc_info_vpu3x,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -220,7 +220,7 @@ const struct iris_platform_data sm8750_data = {
>    * - different num_vpp_pipe
>    */
>   const struct iris_platform_data x1p42100_data = {
> -	.firmware_desc = &iris_vpu30_p1_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu30_p1_gen2_desc,
>   	.vpu_ops = &iris_vpu3_ops,
>   	.icc_tbl = iris_icc_info_vpu3x,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index c2dcb50a2782..7fe31136df21 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -251,8 +251,6 @@ static int iris_probe(struct platform_device *pdev)
>   		return core->irq;
>   
>   	core->iris_platform_data = of_device_get_match_data(core->dev);
> -	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
> -	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
>   
>   	core->ubwc_cfg = qcom_ubwc_config_get_data();
>   	if (IS_ERR(core->ubwc_cfg))
> @@ -271,8 +269,6 @@ static int iris_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	iris_session_init_caps(core);
> -
>   	ret = v4l2_device_register(dev, &core->v4l2_dev);
>   	if (ret)
>   		return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 14d63dc76c9b..33edbc5cab8f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -9,6 +9,7 @@
>   #include <media/v4l2-mem2mem.h>
>   #include <media/videobuf2-dma-contig.h>
>   
> +#include "iris_ctrls.h"
>   #include "iris_vidc.h"
>   #include "iris_instance.h"
>   #include "iris_vdec.h"
> 

with that addressed, you may add

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
