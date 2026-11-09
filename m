Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794210826;
	b=zEfHsgsazeB9bT2yF6HneLYxPViF/dulv6KmKkufIyE/kvwl7wvgCaRqpg9MvbHEclhz
	 vPszgHq+10gjlxFg9bIpnCB2neYZ51weVidjh3qizzMLLwlIM+fyd4EreeJg5LC/VKjlo
	 zNCadRIvabNXTrjp3nOEd1x8veA8TJj5OEeFgG+W/gSS7sdVzRSR8a4ahhc85v5M4NJCU
	 9YvwIDCXq9bq1VpoqNk8l68+KcdjE+JR8yCEKj9QTgm8JHLKA4FMZOA4gJoXIzy56699u
	 Pbl4VP66r+FMzBdLZmYfI0gGktUY6wl3CKDBD/FWaMaoW3JP9jgJ0RiGTxyXIN4kzig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210826;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o+haZWFojym2Cv7RGNTo1dLDTnfV5B6AZEJXSj/GaWs=;
	b=FHwEbYzzvO+KPR77ems96oBut1ZxpXs8d9UqWOm8TtT081QPWazu+ZE5c9K/FMRtZyUe
	 Luvo3D2ouGPvLnwdWNCsGgJTfEXRzi1uW9KN9/7T7cr2AVsC1uZKwEhWtT3ieHMPsOXG1
	 HqmPGGit7NpaGcgHX0IqUidAt8qIldhvAPlgQr3sGm1i6rDfWqTJ4lq2cKUBR0V9Od+Pn
	 DchBwC+S2MiVzYHRFhLRqSwtF9Xg/XG6mBDedjCZlJ2IlnB+yanejlW0wQPnJj6Ck1wzk
	 VPW3eQPlbg9r6qdcmjllmy6ZfHOLUqaad040i8jMc6grFU7Q3Omxra4l5Qi/waLikvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwM0zqzP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jpPfpnWJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8A0606A323
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 07:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F8A0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwM0zqzP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jpPfpnWJ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A2Jd3611149
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 07:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+haZWFojym2Cv7RGNTo1dLDTnfV5B6AZEJXSj/GaWs=; b=mwM0zqzPE6GbLpxf
	fPNNojxyfYZePnBTqYOCrYvsGhQc2rrkol1ZfbQ0XXT9kajSnpYIV61DfyfK3c7K
	MK2DX7MjIcC8XkVNr5QrB7PqnqUZfZkErmJ0bfXPAzzl9dnzcxds/J2JRXyWk7IZ
	kFcbBh/orXJNJ+L4Ht6g5UnVWFOKbNy/ad3GI/yDT3o5yyJRyt120Dg/LSe8SeBq
	99U8/4iZI08rtlVGptz09iH2SdFdiUVseuDqxbdDHemspBUeYyyhrn/34rVIwHXc
	4Z2u8GpGTwoGbJgFSBv4wclj6TnnAgcw+0O9FA1baVlD6D8N0WYOnDH45SPMrxtp
	dDG4rQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnwqmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 07:53:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so1766464eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 23:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794210824; x=1794815624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+haZWFojym2Cv7RGNTo1dLDTnfV5B6AZEJXSj/GaWs=;
        b=jpPfpnWJtghCTeee6Wyao8yI4UTBDlfr3M0mVMaO2nBkerY3KPE34LIXra4jzPrfA7
         rBz52E+gU3P4xNzYlgUB5Magqh1Gx0JOSJKuOuA63K5qELbVisv6m2N0aYSkAb3w7wig
         3nK+z0VxEahfqxK75m+8Ys7lg+YT/RzOByDs+zgWRFtAayi40rVlhPKUI2f9YaMALhY/
         JgBPX7n/mcCZwtoHLeSwd1/cXo0QNl60bW9ogMQG4k6mcStr9px7qdvliz5QrcUlRElE
         0X7eNPdomFYXJ0qQ8JnDXhil25cIhwEMnUmCwDSobjGoPx/jjseG6Gop5cg5QZRx6iWx
         O7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210824; x=1794815624;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+haZWFojym2Cv7RGNTo1dLDTnfV5B6AZEJXSj/GaWs=;
        b=K8ZWNckcg0QE1bIsb+jYD+7bB8vxv7lvlStHqQJDldw/V/wIGzsCENysPSoPmdn6sF
         YxDZ63urO+38Awh8ZxcCIU2ZVZof9rfNVAfDF+Q9GmT68GEDxuR7WGFUKd5gWqM++Uz2
         XU+FtFMwInGrT8keXei1i4DCYJZfm6C+zJ/ZZ+lXCtTkfa46UpvacAqbTAV4dINBLnR7
         OlvUPKME9vTMH1qYTTgal4GxQGxfl0viZQx/osofeI8V/yzm8NQrJNon3VHuc3dMuopY
         +0axFR7NhBnd+OVRKjsD2QGJPh61qRZqpg2noZ6qfxIEWrlI5n2bM0Mhgd8Sc7QsAaTl
         IMmg==
X-Forwarded-Encrypted: i=1; AL+hErFT2ulfYg5lrLdnR7qYolC3xTsA4y+4/kAdKTfpmQy+bhLj9plKMJyV/SzRIsyxPbeOmxKZsg48FOt4nUH5@vger.kernel.org
X-Gm-Message-State: APuU4Z+hWnsqRGIVxGC74OsvpGFDhwhzZHppvCz7zvn7MV5dCZx6IR6d
	Ue12JIU/pKzVe+8PYZXHoVmAK8SBFegqDXdF+4huhLER6PL6zq8s9S9K78XAjEIpTcW2TK3GQXo
	wdcu1EDGmzMfYXeLBTlOdOqEk0smh13TRI0GTKZqgiSDUExMDXprYTmo38ZVsHoL+GKYu
X-Gm-Gg: AYBFou1DuVC4zALN5/4v7fSZqMm9eR9HeU/Gsg4DGUnGTzGZtNo3q0odGnJg0Ci26at
	6yjouqQI3PIgDvUBcRHc3tmA0MeILrEb042US6RjWuXk6aBy5HouGWv5AfBxSwtQ7d63SmF1ApW
	X1XZGMDHwSHRMN9slU0kiep0zpMIav3e5OevXHXLOFYAHDxemEfxHn5p9h/+jtXGLL8RaIHRM7E
	I3Xp+6PSdp31dHHkwPE1dW/oCQSYvogZdnwSJfeGhvv2UwIiWgAhlQChGNB6NijTh/WLoI3HOPk
	lYtVSi0QHOefusPZLKeEen5mGHlcELdZEqXT4zLP1QP22hmR1Lu31wn9EOBcgUEMFU679GrJHUN
	ek8cZmEJUHdxhF+UxhnZyDWdqxuinWaYQwlpkLwVThmPwBRqUgRBh3lfexKDM4Nx2e7rQH1ThcO
	Jp+yU=
X-Received: by 2002:a05:693c:4003:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-3725d782bc5mr5640848eec.20.1794210824315;
        Sun, 08 Nov 2026 23:53:44 -0800 (PST)
X-Received: by 2002:a05:693c:4003:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-3725d782bc5mr5640810eec.20.1794210823672;
        Sun, 08 Nov 2026 23:53:43 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372669d2826sm11874478eec.29.2026.11.08.23.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 23:53:43 -0800 (PST)
Message-ID: <cf7b6956-90a7-ac3b-1b2b-545f95a14117@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 13:23:37 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] media: qcom: iris: Improve diagnostics for system and
 session failures
Content-Language: en-US
To: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106153126.120858-1-dipayaan.roy@oss.qualcomm.com>
 <20261106153126.120858-4-dipayaan.roy@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261106153126.120858-4-dipayaan.roy@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JwNa5evTUqWTxfxQuWHDTzHsMCuZdew5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzMSBTYWx0ZWRfX4xiUPQUuDhsT
 /Za0a7kioGyy23GcEuI2n6u0Pw91XKiTjLIHuTNQYxYx5LTQK23oYA0KD+rMEImB9z6uSPR4O0i
 8kVq/limcWW4X/MONY2jEENN0+5gq6WSF9F49WijtEDAfTop7gXgl9yfDijttb4s8zLEv8IUHrQ
 0hK1+djDAZ7yKorqSwc9VwEz1Vyn+Sd8vw1IjD+0tLGAUFwGORUWn+G6c66aaHLB0RzWG5XUGYy
 xOHmsJV+TevectiKYBj1ibl2yTTh9jS9BnJa9viBIE+jWZMPHJQfdv9dhDuyOTFLRLvwZMajmW3
 INLClEqkMikdfZ3yelftG/BSv3QxcK9MFypPYMPSlzbPTdPjNhWFV2FMwergj409/YbnJJFe/ya
 RZU9YWbzKciLwoHyg6mCiBkP/ZqKcLPHppHseH/vn2hr7kIakplDyLAYi9n22CPHOfLjq/PMrWH
 Gouhidn8bmPbxWufeuQ==
X-Proofpoint-ORIG-GUID: JwNa5evTUqWTxfxQuWHDTzHsMCuZdew5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzMSBTYWx0ZWRfX8Yt0HPA1i7pD
 pDjiIQFwskecEamTerdBtiGQ8R5zTTwvcC8wGvX+lQv4MSM2HrMhsGnj+JTC4aHW0UKgOC2HGtI
 Oo5V/uiZXjOsB/wh/Pjrh+Z5+jjqxPM=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af17c09 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Fb52MO1wo91ysUZOzKQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090031


On 11/6/2026 9:01 PM, Dipayaan Roy wrote:
> Log system and session response timeouts, firmware-reported failures,
> and failed recovery attempts so the cause of an error is visible.
>
> Add debug messages for unknown sessions, invalid state transitions,
> and successful recovery. Avoid a redundant system init timeout message
> after firmware reports an error, and rate-limit Gen2 session response
> errors.
>
> Signed-off-by: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.c              |  2 ++
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c |  8 +++++++-
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 13 ++++++++++++-
>  drivers/media/platform/qcom/iris/iris_probe.c             |  8 +++++++-
>  drivers/media/platform/qcom/iris/iris_state.c             |  5 ++++-
>  drivers/media/platform/qcom/iris/iris_utils.c             |  2 ++
>  6 files changed, 34 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index d558475986ff..4224feaf1caf 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -43,6 +43,8 @@ static int iris_wait_for_system_response(struct iris_core *core)
>  	ret = wait_for_completion_timeout(&core->core_init_done,
>  					  msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
>  	if (!ret) {
> +		if (core->state != IRIS_CORE_ERROR)
> +			dev_err(core->dev, "system init response timed out\n");
>  		core->state = IRIS_CORE_ERROR;
>  		return -ETIMEDOUT;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index 1ce7f97d4087..5c411e69e5fd 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -284,6 +284,8 @@ static void iris_hfi_gen1_sys_init_done(struct iris_core *core, void *packet)
>  	struct hfi_msg_sys_init_done_pkt *pkt = packet;
>  
>  	if (pkt->error_type != HFI_ERR_NONE) {
> +		dev_err(core->dev, "system init failed (HFI error %#x)\n",
> +			pkt->error_type);
>  		core->state = IRIS_CORE_ERROR;
>  		return;
>  	}
> @@ -740,8 +742,12 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
>  			struct hfi_msg_session_hdr_pkt *shdr;
>  
>  			shdr = (struct hfi_msg_session_hdr_pkt *)hdr;
> -			if (shdr->error_type != HFI_ERR_NONE)
> +			if (shdr->error_type != HFI_ERR_NONE) {
> +				dev_err(dev, "session %#x response %#x failed (HFI error %#x)\n",
> +					inst->session_id, hdr->pkt_type,
> +					shdr->error_type);
>  				iris_inst_change_state(inst, IRIS_INST_ERROR);
> +			}
>  
>  			if (pkt_info->pkt == HFI_MSG_SESSION_FLUSH) {
>  				if (!(--inst->flush_responses_pending))
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index b82f50458fe1..d5b4b27e0549 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -296,6 +296,8 @@ static int iris_hfi_gen2_handle_system_init(struct iris_core *core,
>  					    struct iris_hfi_packet *pkt)
>  {
>  	if (!(pkt->flags & HFI_FW_FLAGS_SUCCESS)) {
> +		dev_err(core->dev, "system command %#x failed (flags %#x)\n",
> +			pkt->type, pkt->flags);
>  		core->state = IRIS_CORE_ERROR;
>  		return 0;
>  	}
> @@ -929,8 +931,11 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
>  	};
>  
>  	inst = iris_get_instance(core, hdr->session_id);
> -	if (!inst)
> +	if (!inst) {
> +		dev_dbg(core->dev, "response for unknown session %#x\n",
> +			hdr->session_id);
>  		return -EINVAL;
> +	}
>  
>  	mutex_lock(&inst->lock);
>  	inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> @@ -958,6 +963,12 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
>  			if (packet->type > range[i].begin && packet->type < range[i].end) {
>  				dequeue |= (packet->type == HFI_CMD_BUFFER);
>  				ret = range[i].handle(inst, packet);
> +				if (ret && !(packet->flags &
> +					     HFI_FW_FLAGS_SESSION_ERROR))
> +					dev_err_ratelimited(core->dev,
> +							    "session %#x response %#x failed: %d\n",
> +							    inst->session_id,
> +							    packet->type, ret);
>  				if (ret)
>  					iris_inst_change_state(inst, IRIS_INST_ERROR);
>  			}
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index dd48fa750013..9cefe090466b 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -306,9 +306,15 @@ static void iris_sys_error_handler(struct work_struct *work)
>  {
>  	struct iris_core *core =
>  			container_of(work, struct iris_core, sys_error_handler.work);
> +	int ret;
>  
>  	iris_core_deinit(core);
> -	iris_core_init(core);
> +	ret = iris_core_init(core);
> +	if (ret)
> +		dev_err(core->dev, "failed to recover from system error: %d\n",
> +			ret);
> +	else
> +		dev_dbg(core->dev, "recovered from system error\n");
>  }
>  
>  static int iris_probe(struct platform_device *pdev)
> diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
> index 5552725c614e..bcb138ccf08c 100644
> --- a/drivers/media/platform/qcom/iris/iris_state.c
> +++ b/drivers/media/platform/qcom/iris/iris_state.c
> @@ -56,8 +56,11 @@ int iris_inst_change_state(struct iris_inst *inst,
>  	if (request_state == IRIS_INST_ERROR)
>  		goto change_state;
>  
> -	if (!iris_allow_inst_state_change(inst, request_state))
> +	if (!iris_allow_inst_state_change(inst, request_state)) {
> +		dev_dbg(inst->core->dev, "session %#x invalid state change %x -> %x\n",
> +			inst->session_id, inst->state, request_state);
>  		return -EINVAL;
> +	}
>  
>  change_state:
>  	dev_dbg(inst->core->dev, "state changed from %x to %x\n",
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index 1096cc4b01c3..5ca4d8e0836b 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -78,6 +78,8 @@ int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush)
>  	ret = wait_for_completion_timeout(done, msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
>  	mutex_lock(&inst->lock);
>  	if (!ret) {
> +		dev_err(inst->core->dev, "session %#x %s response timed out\n",
> +			inst->session_id, is_flush ? "flush" : "command");
>  		iris_inst_change_state(inst, IRIS_INST_ERROR);
>  		return -ETIMEDOUT;
>  	}

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

