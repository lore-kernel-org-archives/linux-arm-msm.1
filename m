Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625517;
	b=yes2ZVY4dgzsOdXJBCQ3fVkrF7TLkTef4JqHffG7t9I1JvFO64UDjYS4nMtcPIevyyap
	 dTrOaNCDV2iDiZVBRr9w9tNUJMPIYY7A+u4p02CwG75N2MiYe6Usbp2aJwtiP9sx/yKyF
	 kOs77ZTnhGzSROJheku/urlk0u1dATehA0veVSljLtm304TsSjT6hl1qeZ5h28Jgxqz/A
	 mnpebuqGszOPY0OlXyT6Uu4ZDKog0Kd5Jeinc1nDd3umCdwfMHGkZqidI94QjiDKYECly
	 Sho1rBlnxip09/BDjDhc8oTIO5vP89J7cs2egc2Gyv0pUaKrjzXTft6ovgpqf/0XJlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625517;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wENrlcnx/TfX13LE4fmrSq6Sfd1Kg83k4NkVHnz3yWc=;
	b=4CxKht8UzXcdLfhX22zA31YHKNlKzSAM+MdKHLHfVXE3kSPZanQ/O3sH9nEgZm1IvRrt
	 0sfpqYrdPO+nSo5H6kI7f7URleO03JiLKofYm2vXVbCJkWdFPht8fvIMKWOV21Q+zl5DY
	 oR0K48EyqyWIK/Ei6aIShYl5R9DnXENyR6TfsB979O0am+kqB5k2DueG4y/uVuDRTqhP3
	 ceXoUsgQ2gkdlj/thnB7p3EmYqbN1nkTTKF4ePATVjSS1hMMWwvVyoHyDBSyHUIQ5fmVG
	 pM83s6k8isIx4cib35h+zkohvkaaERsFyPYt1rn6qTuFmcT30GCfm9E4NIQQH055vvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JAfho2OI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G0e8fJIq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69918606A32D
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69918606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JAfho2OI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G0e8fJIq
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DALnX2902371
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wENrlcnx/TfX13LE4fmrSq6Sfd1Kg83k4NkVHnz3yWc=; b=JAfho2OIO1VS6Znz
	do1h73Vq4cioW0TO68GheEso+i0lhSG/eJSiveij9JZ0IEY0tfSRLr/KTnXZdT19
	jj+QWDf1cKBAtmLdJoNAG5f0Ov3/qQeKV6pinJ5MYshRQFzROLssCmIoFnRGA2ta
	3Ohrf/KxYZZdC0bhYumFSNBYuIEC+2Rni/gozwMYYboy3O2Y+EmHum2vRSHeJy2e
	6ZBh0+gwf60HB84h5pxk/GpmR19d4wSuUAgEr+R4q1LQ3kE9h7B8PVWkq9cwccOz
	2sOFI0SbIoHvPMpPMeZN3IjARoLBlj1qh6AXL+SdrTJm3ZEH9nG/XZU5KgHlq1Gn
	h2CNDw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavgfcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:18:35 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1ac19c6bc71so2285355c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625514; x=1794230314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wENrlcnx/TfX13LE4fmrSq6Sfd1Kg83k4NkVHnz3yWc=;
        b=G0e8fJIq+aWUaHHIH6l3pbYLjlbnMxlhA8rVnREJJCame4jV+b1UUSeMGhpu64aUEO
         KIg2qJiQhkg3Kx8XxklwJ4JecBzH+FnHaBz8dVEH9JqpNIYhUAJ/BrYL3RgSstioPyFr
         7jnxrpNt0e0UqkoytOrVA3l9lf+ogqY5Bpc5+puD/tnDMmZhmYA0/+uOhm2BsciUHCFu
         S96oUCpNV43O+UoD+XzyNhJyT+PxdR+MmiLA3ocGqK9fLO5TnCj9hm/ns6ghvsYa1dJJ
         W9/cnJyBZ94tJn1oSLIPAP6rLOOi/ZZEch6pJTAumEzNiOLGoYYRVDnW5OaXtfulKeqe
         MoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625514; x=1794230314;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wENrlcnx/TfX13LE4fmrSq6Sfd1Kg83k4NkVHnz3yWc=;
        b=wrrvjVMXcf/tgzZ4TlUULPFpsZob4Xouda1O+GtYeSpVA5C38Iqvua0RV5nuTZSMUN
         uQ90h474bPD0EB4OCqO68VjzZf1XdkU7fE0TT9E10ONmFdaHvAjUxyKFw+XX3Mtv04Wk
         SSuZSt069e75HGxGywTzz5d0IP4aJccDOMZ7iSXda2hqMtCFZxVrobBPsSq6Nttz/JZN
         A62xLVbXjyYFW8FZPsVX/LA3VAMCDgBcCjuEhR4MTAYyAxpS1DPVRVCngYCTC+etIh2i
         lqmhKQ75BTKSupBE14CI7eyXYSxG8H6d56/CPbVS8tV/fsl3j8E2qb5ayMX1p2HDG76B
         u/Qw==
X-Forwarded-Encrypted: i=1; AKwUvBxztDLHKQfOe8rFqqQNnVVnKdceiHExgNOLERsiw9sHy0v9m1UTHQ1wRX+CaCLezqUo7GT7vTkhaLeT//j+@vger.kernel.org
X-Gm-Message-State: AFq9FYKkXLIQqE36DApZC5RqYTMvz6IC6AtB8pgJ1JKLhx3/08+cd+Mq
	AhnneaJtl8ffH62Ymxo/LhNJfgXDEzRfp1YdD4rXQa6/hOFX7+J1Z2h3LpX/11YGRJTc6YC1Xpy
	htxVbAv8FJk4kMJX33nh+ZkyzM3Re3ZD/QgRYdqWXhV9R271La8sW8JWGGxZgHgnmbMBQ
X-Gm-Gg: AYBFou3SzVUB8vdzmfMKVSxCE27db8Ncp+I3Fyk7nusDdtfv9F8KRTLRbfi3JQ4mMqI
	/2bPUhXcMIN7Vm8Gb+hj8W+c5ZrpTGn+1RzmfL3H2EB/fGlyNwYV0TF/MhVPkhqXojTAg88Fxq6
	w5PfS6rL1wHj65PQJPiScsBpgY4ogOBA+oGBybQQzpOBoSdRyY6jCYiy5r/r7w+p2KyqK8HuqKn
	JYHxcfn62YIztu6rzfFtJ775el6e8BwB9Fsz+YCznMr6zqnYV1rLcdHA/Q+g3vuLFxgbI4iFri/
	CYihM/uxqCJ5Dh17OJbNEZJO3lIU/KbtOjkIL3pk6hKrbVoS+1pWTyVp7j15sjig7cvrDHr1KL6
	mk1rK4aHZy5XhCGLe1zGbJdl9QQghxDMRS1L9zfouZdQwYSgMNTaBEmfJ4beJt2v8XFgT3uY9VR
	/crvt07Q==
X-Received: by 2002:a05:7022:eb44:10b0:186:5b49:90d8 with SMTP id a92af1059eb24-1ac5782fd31mr16463753c88.4.1793625514104;
        Mon, 02 Nov 2026 05:18:34 -0800 (PST)
X-Received: by 2002:a05:7022:eb44:10b0:186:5b49:90d8 with SMTP id a92af1059eb24-1ac5782fd31mr16463714c88.4.1793625513450;
        Mon, 02 Nov 2026 05:18:33 -0800 (PST)
Received: from [10.204.101.201] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1a16sm30918429c88.1.2026.11.02.05.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:18:32 -0800 (PST)
Message-ID: <366b19af-326f-424d-987a-bb0fb77d3665@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 18:48:27 +0530
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
Subject: Re: [PATCH] media: iris: Fix VSP clock calculation for high bitrate
 streams
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261006-fix-vsp-freq-calc-v1-1-53532d893852@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261006-fix-vsp-freq-calc-v1-1-53532d893852@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX+lM6qADQfCUS
 ZrvXsw1Mf/qgKrFq+eaAwq8JmstXj7XUAw8rJXcZeBP0378RZFLWtdT+RKNA5tqjjT6C0cv32PV
 LcOPBApNglXlZel17W6KV8ADNWEvGheq7z7MxzzVbfHVBhLEq+cFBK8QHf/wxOYxZx6SweEktlc
 UJf0WOWV0MnfcuQHFfI71KksDRfvJXLe5TQhvGm4ZKUS50QXts8yEQnGgWBNz+zi6HnuNQJL/Xt
 8g/AP7GUZq/QTJN1VelRVk95aSsMhaSFvTLH8ClkaKBdCknKm2bob9OrGuuARYfP4d8PbjnAAXV
 YlXUL2cyuicOqFOvVze7mheRM2HMTT0ZvOH/RCCg91ttaJa+8KI4VyOS42/u4gP0RNnoIGSdYCS
 Tw224eKnZC1pmBQrm5YwEB0tX/woedQOo+gFRn2ek7eYo9t3ftMStErXjyQ4TpDmFEKXNEfOmPn
 c6onMhbZvSEsKJu0kGg==
X-Proofpoint-GUID: kGlidc5r1_gExT6VR4r8VjccZqPMdqcx
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae88dab cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=actxAcgqoPy2R-xb-rkA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX0aWF9Qm8xNLZ
 f3HNDoPQYgRWDj+OPNJjQGNdEiazvMdC1cOQU367rj6SwIYWEEk5/H2JE2N96vu/yZjpg75Bfbc
 Colr5qdHNP0tYa6Yd3Fr+AWIy94MsBg=
X-Proofpoint-ORIG-GUID: kGlidc5r1_gExT6VR4r8VjccZqPMdqcx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020052


On 10/6/2026 1:46 PM, Vishnu Reddy wrote:
> Frame drops were observed during high-resolution streams decoded at high
> bitrates, as well as concurrent decode sessions. Analysis showed that the
> Video Signal Processor (VSP) clock requirement was underestimated for
> these workloads, resulting in insufficient clock scaling and reduced
> processing throughput.
> 
> Update the VSP frequency calculation to more accurately reflect the
> processing requirements of different codecs and bitrates, ensuring that
> the requested clock frequency is sufficient to sustain the workload and
> prevent frame drops.
> 
> Fixes: 82b96a8d8d6e ("media: iris: Move vpu35 specific api to common to use for vpu4")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 29 +++++++++++++++++++++-
>   1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 243bd845349f..c4762229a1de 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -454,11 +454,32 @@ u64 iris_vpu2_calculate_frequency(struct iris_inst *inst, size_t data_size)
>   	return max(vpp_freq, vsp_freq);
>   }
>   
> +static u64 iris_get_vsp_ref_bitrate(struct iris_inst *inst)
> +{
> +	struct device *dev = inst->core->dev;
> +	u32 codec = inst->codec;
> +
> +	switch (codec) {
> +	case V4L2_PIX_FMT_H264:
> +		return 150;
> +	case V4L2_PIX_FMT_HEVC:
> +		return 140;
> +	case V4L2_PIX_FMT_VP9:
> +		return 70;
> +	case V4L2_PIX_FMT_AV1:
> +		return 100;
> +	default:
> +		dev_err(dev, "Unsupported codec\n");
> +		return 1;
> +	}
> +}
> +
>   u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size)
>   {
>   	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
>   	struct v4l2_format *inp_f = inst->fmt_src;
>   	u32 height, width, mbs_per_second, mbpf;
> +	u64 vsp_ref_bitrate, vsp_ref_freq;
>   	u64 fw_cycles, fw_vpp_cycles;
>   	u64 vsp_cycles, vpp_cycles;
>   	u32 fps = inst->frame_rate;
> @@ -485,7 +506,13 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
>   		vpp_cycles += div_u64(vpp_cycles * 5, 100);
>   
>   	vsp_cycles = fps * data_size * 8;
> -	vsp_cycles = div_u64(vsp_cycles, 2);
> +	vsp_ref_bitrate = iris_get_vsp_ref_bitrate(inst);
> +	vsp_ref_freq = inst->codec == V4L2_PIX_FMT_AV1 ? 533 : 444;
> +	vsp_cycles = div_u64(vsp_ref_freq * vsp_cycles, vsp_ref_bitrate);

Please check this for encoder if it is calculating the value properly 
considering raw YUV frame size.

Regards,
Vikash

> +
> +	/* VSP FW SW offset */
> +	vsp_cycles = div_u64(vsp_cycles * 1000, 1055);
> +
>   	/* VSP FW overhead 1.05 */
>   	vsp_cycles = div_u64(vsp_cycles * 21, 20);
>   
> 
> ---
> base-commit: f0406245cb9855e6318335a8a223551354291a46
> change-id: 20261005-fix-vsp-freq-calc-19b967b79e62
> 
> Best regards,
> --
> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

