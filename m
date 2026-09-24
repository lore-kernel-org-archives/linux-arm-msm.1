Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5AB4AF678
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 16:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266379; cv=none; b=XKd5JgyWp5hJVmDHNoVVYIzURe7WFBVNWuVwb6uc/7wB0nKAXPYwO0nmhBfdK5tIsQkreMS/Y+9yimcM5qx4SPewcq6gm2y8FDagBxFk0rmanVN7gzHe8IgVYXvIjgm2relm2kNlvhoZdQpBBQ/GWuloDu/fOBAzbpPR4MmZxZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266379; c=relaxed/simple;
	bh=UIIGLNqrA/05Ilu4L3sw/DVPM/il7rj33B5D8qwlOF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UbG0IgAHSzVdXerz9xUr+1LDc0jaGnKbQ82z7z+buyRJHr4LITRzHe8TzObWmly+5sXAX7nh4Y1f7niJZOWqoFs20HePS2uaBqUY5VM6ULRwq3kN1XU/v6aDkwU9R+axoA+f61anEkOv8E59pG7Bpf9yYog/rwARgbH0vvj9zEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VoIvEOn/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TS+XNLHR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VoIvEOn/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TS+XNLHR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFfaCF2757908
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 16:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3i2nVFUpFhG5THnzjBF9/3JbJ1RQc5Dp0a9E48sx2io=; b=VoIvEOn/rohKSjKV
	tKm4Z6awmt1EahUW+JYqgYRbgpC1BK3ClarIpiZTv1q79P/Q7DJ/RtUtZjSHy7KP
	3019wz7gmR48YcOJxQuAxgxjCCJ9NpyAVDY96Iuj1duhEpfUUk6lwIEqRkCptxaD
	4oR4PDvsyQziN4QvF8c6JQ1WY7A22m6ln8wj3JW3RMNcQy/dOcB8ySr5zF6GYHpe
	Rz0PbzSihtCKYo5w3yxEes91AiPLo2seVsNi1bztRXUKb+3QvYd/MVO1YJZQX4um
	+vHHGZNiJfsCbEzrcV+2ku5aYs9XFh/L0Jl34I4S/QnpquFRT/D7oEQsyDWfYQI8
	252Bvw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ajmep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 16:12:45 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f653940ba4so2930613a34.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790266365; x=1790871165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3i2nVFUpFhG5THnzjBF9/3JbJ1RQc5Dp0a9E48sx2io=;
        b=TS+XNLHRpO1+QAc/np6KzwQau/C1STkA4LkxJnouHAVDJRtKYJ5pJ1+WphAmoNzXyz
         HoQSUSPobkVEklXZeGRBdFQJ/dbrJvW7q0vFZWACCR/LWhRnObW5EDJS6rNJ/sXSUUWC
         qxmDn1PVUDv5mzReXEI8h/YdVpkUtuFVJhNCC67XUmVUbNNqpPPpqQ/z1QQOugKDZoXZ
         jhCObtSfUUM0z+XA4lgMxS7S+XRGTX10X7bd/zXx8FJi7s7GhTYlxEwzWw4nicN6fVmY
         oK4eeMGzEqZ/xIcVANaDz31VgN62Ta2l0BOgOw85ONnRuzJLTv/q1B04xqPoQzwkmrzG
         Mklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266365; x=1790871165;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3i2nVFUpFhG5THnzjBF9/3JbJ1RQc5Dp0a9E48sx2io=;
        b=uQ0clKZlzJAhvMLLwaMk5wf7JyAEF9UVHByu+xt3PuvUmAi+DljviGNTvr2yjesTv1
         WELU4X8a/QEcKEN2rlBRycl2R1z/0/TQe5HpI2Jx6TfHjV32xCD4jk/Kho8JHa7GcK81
         6aIdMcNYihA3DGhgurH2oJjg3GckMcudWb05wQ6eBIXSg70FAEwZNVTyq2Gq4HmxMQNm
         JMmHTklnfH3AWMATBykFwbr78TDmC1m7lTSY73/BsoNkLIuXEgFDU1uxDRBbgIGL1Xi2
         Ghr0Sb/FCyiWvzxHi8eBw5+3U/Cu8dNH86GsIYUimJn59h6TOyQvAZLwuYGS0NVKQzyF
         nQqA==
X-Forwarded-Encrypted: i=1; AKwUvBy41dOanYyJVz2SDY2z+zX9TnGxuqdhoCZfJbVO7CEebYI3vBozwRRbxTpAJ5zgbEmZ7DskvrTExeN6RMam@vger.kernel.org
X-Gm-Message-State: AFuF++lzMq/NfdvtHVWjayaWaUrEeusC1FBxWPS0dtki2tF2fLDu2EHJ
	9srBNUOnGnDcd94KDhQn0FQhzVfWxOZueEf/keNbhau8E7/8CcMAZYW8JJKuo1Nj9CvVOZzeDMG
	AScSb0Pf0X5i/tSrHKNZYfurnC3wbwKB7xkw+wPqT3j5PmfdjqnWg8km62NnvcrX/Z6B5
X-Gm-Gg: AYBFou1z7xw5PzIraL5/o096GLrAYGD2Hy6MfI6rYDdfMU5WKXOYL9LKs99hMqvXxTL
	ABkADXZEtPZKX3H0UuN2629DUgpMfN83miFqwGO9UwHjYPLhtFWYz7JMHMl4TjyBgAcXB/ePzXl
	+h+0Z3B1S/3FF104dCVcb8ziYyzwXmkjHJwNla8+vbBNu/7Ar4HnNW7G1n587m2F23oQKPM7euV
	RqUDSF8OEvih186YKAPd5tc2MCPSqMWmjxdSXQRvKiDZSLtI2gnBk31qgeVhPPxEPiGyiP4/ga1
	Yjv5ZEzuoSEbbppgfSqxPWwRe6tJJ1Wy4Gn2HCf6TO6FNhG4OG45SSO9SmgmJddpos5cS4VVzAS
	pvd88RVkCvN51sQG+96AsVHWHoQwf7Xo=
X-Received: by 2002:a05:6830:d0b:b0:800:d883:9988 with SMTP id 46e09a7af769-8177c6bbdfcmr3270361a34.0.1790266365051;
        Thu, 24 Sep 2026 09:12:45 -0700 (PDT)
X-Received: by 2002:a05:6830:d0b:b0:800:d883:9988 with SMTP id 46e09a7af769-8177c6bbdfcmr3270328a34.0.1790266364509;
        Thu, 24 Sep 2026 09:12:44 -0700 (PDT)
Received: from [192.168.0.15] ([183.83.142.107])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81603fc79dcsm6323705a34.14.2026.09.24.09.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 09:12:44 -0700 (PDT)
Message-ID: <b8062f81-7c78-d8a3-aaf3-4425b6bc735b@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 21:42:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] media: qcom: iris: reduce impact of verbose
 firmware logging
Content-Language: en-US
To: Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260911-media-qcom-iris-fw-log-v2-0-6c46288f3ffb@oss.qualcomm.com>
 <20260911-media-qcom-iris-fw-log-v2-2-6c46288f3ffb@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260911-media-qcom-iris-fw-log-v2-2-6c46288f3ffb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfXyR56+baWjyxn
 wqfCsjN3nKO3dwLRk1hSeoMpqYMw2Nz4hWobcder6rQHZOA2I4ysTwfld+jvZQznIWRftiapCHy
 6bTzDYGMTqCWoBglUWwBPXWLbhdkNTc=
X-Proofpoint-ORIG-GUID: fA6WFYVX2l44w8sDZaxdg4P7fzQ4J8VI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX2gt7OlR0aLRk
 wKYfU9Tu1xznJ0amfwkVtgGt63ZcwULiRjgYMBX7U+14bzJANcUOscIkNEY4RrduC+1/YSC1MSH
 PVwV93yZFfBcyD27HyAOwVjlaFcYYELNVwH3QBgFTNP83WVNVYThpB9Ald/04Axq9GfRLlBSYa6
 9ZHUUz20XeKV317C15QCQ+ueK9PzaDwig+DYLC+wlyQTaq/HNoMeoV6CzthteaSGwB2E6OguRwn
 ft01WvOiROXNobn6ylPyphJC3tbhqb9RFYFahnIgc+sRvI+pm76v3iWz90r06AtlYoAqgmMjryp
 1A+lRVKpCn5ifpd9hpp7SBYEIWCmv3hux1Avjftexy6l+zmWMZ/x/lsm1jnUpETdku4SYoIo7Rq
 NTgx7iesHaSaextB8i002cO4IVrkYEXfKjqcvJfcenHnwktHRBT0o85fKVn39vygabULrpwQn3q
 CGaeCn/ZOqczhqEtmJw==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab54bfe cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=BUSZCRnG/G6/Li3ahCSwQA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Fi4TetDW-cS149uIDvQA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: fA6WFYVX2l44w8sDZaxdg4P7fzQ4J8VI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240066


On 9/11/2026 8:09 AM, Renjiang Han wrote:
> Verbose firmware logging can produce a large number of debug queue
> packets. The Iris interrupt thread used to drain the message queue once
> and then drain the debug queue. With heavy firmware logging, response
> packets that arrive while debug packets are being drained can remain
> pending until a later interrupt.
>
> Increase the HFI response timeout and runtime PM autosuspend delay when
> firmware logging is enabled beyond the default error and fatal levels.
> Restore the default values when the firmware log level is reduced again.
>
> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.c       |  2 +-
>  drivers/media/platform/qcom/iris/iris_core.h       |  2 ++
>  drivers/media/platform/qcom/iris/iris_debugfs.c    | 16 ++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
>  .../platform/qcom/iris/iris_hfi_gen1_response.c    | 24 ++++++++++++++++------
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    | 24 ++++++++++++++++------
>  drivers/media/platform/qcom/iris/iris_probe.c      |  3 ++-
>  drivers/media/platform/qcom/iris/iris_utils.c      |  4 +++-
>  8 files changed, 60 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index 8c335dbfce166848892c2b323cdcafe43af4a2d9..bbbb7191c4778d842d4fef32fa95a0a9aeeecf7a 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -40,7 +40,7 @@ static int iris_wait_for_system_response(struct iris_core *core)
>  		return -EIO;
>  
>  	ret = wait_for_completion_timeout(&core->core_init_done,
> -					  msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
> +					  msecs_to_jiffies(READ_ONCE(core->hw_response_timeout)));
>  	if (!ret) {
>  		core->state = IRIS_CORE_ERROR;
>  		return -ETIMEDOUT;
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index a8e34c456ce3f3f178ca66a278d06d1ab50dafc4..5449e6b0e11c3122d1f57aedb6dd374ffa816497 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -68,6 +68,7 @@ struct dentry;
>   * @debug_queue: shared interface queue to receive debug info from firmware
>   * @root: debugfs root directory
>   * @fw_debug: firmware debug log mask
> + * @hw_response_timeout: hardware response timeout
>   * @lock: a lock for this structure
>   * @response_packet: a pointer to response packet from fw to driver
>   * @header_id: id of packet header
> @@ -115,6 +116,7 @@ struct iris_core {
>  	struct iris_iface_q_info		debug_queue;
>  	struct dentry				*root;
>  	u32					fw_debug;
> +	u32					hw_response_timeout;
>  	struct mutex				lock; /* lock for core related operations */
>  	u8					*response_packet;
>  	u32					header_id;
> diff --git a/drivers/media/platform/qcom/iris/iris_debugfs.c b/drivers/media/platform/qcom/iris/iris_debugfs.c
> index 6122b994ad0aa70c0c4f26ea4ce076f1b025f810..77726270b11777acb5ea85203223c6943365a5ce 100644
> --- a/drivers/media/platform/qcom/iris/iris_debugfs.c
> +++ b/drivers/media/platform/qcom/iris/iris_debugfs.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/debugfs.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "iris_core.h"
>  #include "iris_debugfs.h"
> @@ -20,8 +21,21 @@ static int iris_fw_level_get(void *data, u64 *val)
>  static int iris_fw_level_set(void *data, u64 val)
>  {
>  	struct iris_core *core = data;
> +	bool debug_enabled;
> +	u32 fw_debug;
>  
> -	WRITE_ONCE(core->fw_debug, (u32)val & IRIS_FW_DEBUG_LOGMASK);
> +	fw_debug = (u32)val & IRIS_FW_DEBUG_LOGMASK;
> +	debug_enabled = fw_debug & ~IRIS_FW_DEBUG_DEFAULT;
> +
> +	WRITE_ONCE(core->fw_debug, fw_debug);
> +
> +	if (debug_enabled) {
> +		WRITE_ONCE(core->hw_response_timeout, 4 * HW_RESPONSE_TIMEOUT_VALUE);
> +		pm_runtime_set_autosuspend_delay(core->dev, 4 * AUTOSUSPEND_DELAY_VALUE);
> +	} else {
> +		WRITE_ONCE(core->hw_response_timeout, HW_RESPONSE_TIMEOUT_VALUE);
> +		pm_runtime_set_autosuspend_delay(core->dev, AUTOSUSPEND_DELAY_VALUE);
> +	}
>  
>  	return 0;
>  }
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index d8bc0862c54bd229d575113752526d51e863e303..18c852d8b818f41bf5e1b0afd35082eeaf5240b4 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -112,6 +112,7 @@ struct iris_hfi_prop_type_handle {
>  #define IRIS_FW_DEBUG_FATAL	0x00000010
>  #define IRIS_FW_DEBUG_PERF	0x00000020
>  #define IRIS_FW_DEBUG_LOGMASK	0x0fffffff
> +#define IRIS_FW_DEBUG_DEFAULT	(IRIS_FW_DEBUG_ERROR | IRIS_FW_DEBUG_FATAL)
>  
>  struct iris_hfi_sys_ops {
>  	int (*sys_init)(struct iris_core *core);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index 903b60a7380559f4711b0907fb1de405fe1707f3..6b8f952d0d4b54f37596728f1823c9265c637bbe 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -672,15 +672,17 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
>  	}
>  }
>  
> -static void iris_hfi_gen1_flush_debug_queue(struct iris_core *core, u8 *packet)
> +static int iris_hfi_gen1_flush_debug_queue(struct iris_core *core, u8 *packet)
>  {
>  	struct hfi_msg_sys_debug_pkt *pkt;
>  	struct hfi_pkt_hdr *hdr;
> +	int num_pkts = 0;
>  	u32 log_size;
>  	u8 *log;
>  
>  	while (!iris_hfi_queue_dbg_read(core, packet)) {
>  		hdr = (struct hfi_pkt_hdr *)packet;
> +		num_pkts++;
>  
>  		if (hdr->size <= sizeof(*hdr))
>  			continue;
> @@ -705,15 +707,25 @@ static void iris_hfi_gen1_flush_debug_queue(struct iris_core *core, u8 *packet)
>  				dev_dbg(core->dev, "%.*s", (int)log_size, log);
>  		}
>  	}
> +
> +	return num_pkts;
>  }
>  
>  void iris_hfi_gen1_response_handler(struct iris_core *core)
>  {
> -	memset(core->response_packet, 0, sizeof(struct hfi_pkt_hdr));
> -	while (!iris_hfi_queue_msg_read(core, core->response_packet)) {
> -		iris_hfi_gen1_handle_response(core, core->response_packet);
> +	int num_debug_pkts;
> +	int num_msg_pkts;
> +
> +	do {
> +		num_msg_pkts = 0;
>  		memset(core->response_packet, 0, sizeof(struct hfi_pkt_hdr));
> -	}
> +		while (!iris_hfi_queue_msg_read(core, core->response_packet)) {
> +			iris_hfi_gen1_handle_response(core, core->response_packet);
> +			num_msg_pkts++;
> +			memset(core->response_packet, 0, sizeof(struct hfi_pkt_hdr));
> +		}
>  
> -	iris_hfi_gen1_flush_debug_queue(core, core->response_packet);
> +		num_debug_pkts =
> +			iris_hfi_gen1_flush_debug_queue(core, core->response_packet);
> +	} while (num_msg_pkts || num_debug_pkts);
>  }
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index e8dc8751ea939bd544699f464a831736fcc10b7f..1bd4ec0c5ada1ef17de4f07fe19d1fac611db04f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -988,14 +988,16 @@ static int iris_hfi_gen2_handle_response(struct iris_core *core, void *response)
>  		return iris_hfi_gen2_handle_session_response(core, hdr);
>  }
>  
> -static void iris_hfi_gen2_flush_debug_queue(struct iris_core *core, u8 *packet)
> +static int iris_hfi_gen2_flush_debug_queue(struct iris_core *core, u8 *packet)
>  {
>  	struct hfi_debug_header *pkt;
> +	int num_pkts = 0;
>  	u32 log_size;
>  	u8 *log;
>  
>  	while (!iris_hfi_queue_dbg_read(core, packet)) {
>  		pkt = (struct hfi_debug_header *)packet;
> +		num_pkts++;
>  
>  		if (pkt->size <= sizeof(*pkt) + 1)
>  			continue;
> @@ -1010,10 +1012,15 @@ static void iris_hfi_gen2_flush_debug_queue(struct iris_core *core, u8 *packet)
>  		else
>  			dev_dbg(core->dev, "%.*s", (int)log_size, log);
>  	}
> +
> +	return num_pkts;
>  }
>  
>  void iris_hfi_gen2_response_handler(struct iris_core *core)
>  {
> +	int num_debug_pkts;
> +	int num_msg_pkts;
> +
>  	if (iris_vpu_watchdog(core, core->intr_status)) {
>  		struct iris_hfi_packet pkt = {.type = HFI_SYS_ERROR_WD_TIMEOUT};
>  
> @@ -1024,11 +1031,16 @@ void iris_hfi_gen2_response_handler(struct iris_core *core)
>  		return;
>  	}
>  
> -	memset(core->response_packet, 0, sizeof(struct iris_hfi_header));
> -	while (!iris_hfi_queue_msg_read(core, core->response_packet)) {
> -		iris_hfi_gen2_handle_response(core, core->response_packet);
> +	do {
> +		num_msg_pkts = 0;
>  		memset(core->response_packet, 0, sizeof(struct iris_hfi_header));
> -	}
> +		while (!iris_hfi_queue_msg_read(core, core->response_packet)) {
> +			iris_hfi_gen2_handle_response(core, core->response_packet);
> +			num_msg_pkts++;
> +			memset(core->response_packet, 0, sizeof(struct iris_hfi_header));
> +		}
>  
> -	iris_hfi_gen2_flush_debug_queue(core, core->response_packet);
> +		num_debug_pkts =
> +			iris_hfi_gen2_flush_debug_queue(core, core->response_packet);
> +	} while (num_msg_pkts || num_debug_pkts);
>  }
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 8bc94acc4f58ce7792ddaeaad036475c476d5c36..318a548a7ac606594a41d9dae25e73205de1fd0d 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -233,7 +233,8 @@ static int iris_probe(struct platform_device *pdev)
>  	if (!core)
>  		return -ENOMEM;
>  	core->dev = dev;
> -	core->fw_debug = IRIS_FW_DEBUG_ERROR | IRIS_FW_DEBUG_FATAL;
> +	core->fw_debug = IRIS_FW_DEBUG_DEFAULT;
> +	core->hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE;
>  
>  	core->state = IRIS_CORE_DEINIT;
>  	mutex_init(&core->lock);
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index ba5c8dc1280c2e147cd33498b69a815cf7c75683..dbddfd770edce22fba58eff15cb6d45eae5ed638 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -70,12 +70,14 @@ void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
>  int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush)
>  {
>  	struct completion *done;
> +	unsigned int timeout;
>  	int ret;
>  
>  	done = is_flush ? &inst->flush_completion : &inst->completion;
> +	timeout = READ_ONCE(inst->core->hw_response_timeout);
>  
>  	mutex_unlock(&inst->lock);
> -	ret = wait_for_completion_timeout(done, msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
> +	ret = wait_for_completion_timeout(done, msecs_to_jiffies(timeout));
>  	mutex_lock(&inst->lock);
>  	if (!ret) {
>  		iris_inst_change_state(inst, IRIS_INST_ERROR);

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

