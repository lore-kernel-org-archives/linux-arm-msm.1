Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0244F3A48ED
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787730557; cv=none; b=kaD2XtSVgjETDuYK09Ro4z7un9mUE53drfM8CvdG22L9AX8YNDEfLuxP3wCPwllckb+OxVVLSVnRr9IpEnDKkPolH2QYqJsQ80ztBJpjMo8nVwNR3HclYkr40+7nqszzIEY0Fa1PVubOO22mmf1zq8SN4LCFfbzg0PgIc85kAd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787730557; c=relaxed/simple;
	bh=6ocZhRLw/F2XxO4SHZxtWg0n+5C2r862DeT3i+TWk7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FSa7AfyCtdYq/QJ4Ff5v5kS1ryXzgbMH15ai027Bhc4NTiT1aT2fCHlUzo53JZrr7APr8xjpBPnnsdjDfH4j75OB8KVGTvLcj124KJ3Xg8XaYcS5mlVt+xpHeHAqkFWqM1/lpF0tkTM5Z8WSWO9+DlLZqGoyTV+0WDEKt8ozUlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWltw3kN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ehNig931; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWltw3kN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ehNig931"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q7UH4b3272234
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S0XsFRYzKpYHY56wQV41jHqVJYDkSElvSQdFTSDDPBQ=; b=FWltw3kNKLHZMZ4X
	L9DWqNwFEunZ+Cqoal0VdxlemRCJfXre07Eq0TYh/CFEsffOeh/2fH1QHTWHfTdc
	cmN1mRWpRxVTrczd4A+mLwdyuyPh2Z7VcvF0Tur6/8l1ASuUFvjwbJFkY284WI7u
	v5kwaz2d/zEXHTd2M1ovRzltgOtdbN5gkvdV3gscaXNEYMdaIzdcjmIkh3JoQhKV
	LInFZc7syDAuG/6HbSDh8seaSOULqMnR6VGOMf2ELb2znoWwEGILJ5bVC61emVyd
	2PR06bi4fC6m9NXMTzj0ElZVwcPh+iMzzN667wQwLK6DKmHCivd49K9X0qBm1OSw
	OvomVw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthr2pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:49:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso1013122a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 00:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787730554; x=1788335354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0XsFRYzKpYHY56wQV41jHqVJYDkSElvSQdFTSDDPBQ=;
        b=ehNig931/2aX7tHflpGcbINPG/89JZE6IpU1NS+hucLi6sZ/LlfujB1+E8XbT7K9fj
         hu8g2faCPMbwFW5k/RBfH2OjYdPRTQtSPl4vzrdpkCo+fAhe06Sm+9dsY9iKZW+HlP0u
         55g1GfatP2F2uYnlIRpVOCPC2GliJLmd7SMau58Twills72ySCxBrB9pwpdap60CRBNx
         a+Mn8pgDsLvpITLIRztOXoOxolo77xA8Gc6e9LlwHxR8JXLUSpqZTajHSjxqV95OyA9S
         fDyiFeUjFy0HlhpoD4GpqOnC5onoSWIDZEiCQ/ErJe8dmupe0Wg7w35wB9t0CdwSqDmA
         ECeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787730554; x=1788335354;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0XsFRYzKpYHY56wQV41jHqVJYDkSElvSQdFTSDDPBQ=;
        b=E9XwQkzN8XM1fyzJ9sc3tM7MN/KmTDgEK00Oyeg6OjwJEbzSa4lI8jqJFLIJ2cJbHC
         f6UlqDl2KOIA4OwUaeD/x7uYCEgWYMpdRD9GgmKT01DwazLy1dI7BfVFpNtHiPr6VYW9
         Uea2mItyGbdu582uveqaeY4g5Oi+0iUgrr2DDVhTh/WqybxXf6gIaAauy5hzcDKWFh8S
         k41S6ZHX/24tu3XY8f+pTs31pXR1OcfOZRF3ObwEFAhcOONvFqZXtX0v6ks7hO4k665d
         0ow54t1qiMTVEhWyiyzaC354XZTv/ihTCJf/l6gqqNiDu5IQfcrk9ESs9NlqCf8ix5Jh
         xItg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7nUW79+l/G7ltyn6p7tJU7E8NdGZraeWZ4az2vs73vBHrYIXKZLS1xt7GiPNLHPNbfcq13U25w89LLPqZ@vger.kernel.org
X-Gm-Message-State: AFuF++mVPs1VBj2XgGLaaLaxpGmxNqf95UPPyqyG0fSwOwakxF+7I5Ly
	u4ALBBSgrMiGlpvLLcMe4tdynOp1L4HqiXcnQOH5bgkZfCnj6EEMhSSi2jyrf7aqtiGTPMGasWs
	KfRzWlmERpJCbduaXcvL1Btc+jkMF3EG2i+TH9KGvBRIHjuMQFSg5u173BTK8nY+i17pe
X-Gm-Gg: AR+sD105mFPZfIGCgkVD24jEtIU4pbRQAtaGEHPkL9mNUNwX9+3a8xgAVcUKHt6gl05
	crHvTN3f/Q+Zkw8gHlleXbYWAWvXpsfj2mIRxJr42pVNpjiMR/Zrz4skpq2aFLZI8Rg35OP/mDi
	j22f+AuaG7xSxWU9/2AjAGJQ+rzDxbqxiAYPxKcf/oH4FF0PC3vXMv4R8OTV6z6lhQrWHaVvjMx
	zgUipgBkgrZxXCUNByvST1zUX1Rs0hxXcIWZ3fZL63HyD5mEpQJBCWAE8oGGZu356BXZh3CHUpd
	cvZCOjmDk300NXlYsaVkYsLMl/uvpVluzpDzog41TexynaKT9LhHJpH16HnLhTfocWwSn8wR4gN
	mNg9a3C9puTu5mE76moXVc59Yz6s8O2kKWFGopmo8T2LSMj87Nnc4bDFqFM9d1/XAArPoCrT9
X-Received: by 2002:a05:6a00:2342:b0:851:c2a6:172f with SMTP id d2e1a72fcca58-85373bb5653mr9072532b3a.7.1787730553708;
        Wed, 26 Aug 2026 00:49:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:2342:b0:851:c2a6:172f with SMTP id d2e1a72fcca58-85373bb5653mr9072431b3a.7.1787730553215;
        Wed, 26 Aug 2026 00:49:13 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535cd8a41esm588474b3a.29.2026.08.26.00.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 00:49:12 -0700 (PDT)
Message-ID: <4b15dc5d-d9ff-45b9-b46e-e36319ff0570@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:49:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 17/25] drm/msm/dp: add link_ready to manage
 link-level operations
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-17-2ed6aee1867a@oss.qualcomm.com>
 <2ciespht5pfxvqnrik4a26drkmow2ilvxbkcnpt43jprhndryq@vfetl33dz3yg>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <2ciespht5pfxvqnrik4a26drkmow2ilvxbkcnpt43jprhndryq@vfetl33dz3yg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8e9a7a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=e8pokjpGc4Y85sSXAHsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zLqzYzW2K4lCZum4aTI651K8XHRSH4WA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfX1Js5nOifAtyL
 G9YKCedzJb8UK2O8Gv1q0egiMz8fyhsCkiBPRun728x28JkfGgYd9LaxPdFAs9+rcyENxXQY2E+
 c2/hROxgO1lkBOsAUXAv4+gAZ0pn7YBhHSXELHweXO/zV+uCjGvtkSMzYUoOsIkLdPfB5wQbwa0
 dzALZCcsXh1WmEzatM8YT+euLH6A88IJzgf1A/X/aWwpc9Fh/5NQqGVfrUNb4lkuJY+21zP9XLO
 G+oZ0wJPS6byOL+GZSeRKpk+vcz1zYpcaG+Dh04jFLdp6MsOwt9/dNyV1KSV/ponIeWb/yOPtLv
 EQZlt/tV9Rl3aBQ9d6AhBA/5zIGsbDpzAmQGbRO3BdDgbQTuqPfyFXcqdnGKTHdk7c0ya0VpPSk
 XB6L/XtyfYqAhEXC77U0DGkBbX5Rdo3gYahtzSECnjh46NpLY/py3OncXze7tEkLAWoM+ka5PbK
 9OnSE7pOT3hNtE2InvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfX/d2mxcB4We85
 E/L6x+FHDzDKi92DHwwPS+vfnwP/HxDmB0gcUAFIVMJ4mB/bvEjbWRHCCKMiCSrQ47Kz8Eq7RbN
 Y1sAaIkUgtj/E4MZmQgoeV+FX5aGbMk=
X-Proofpoint-GUID: zLqzYzW2K4lCZum4aTI651K8XHRSH4WA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260063



On 7/13/2026 7:46 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:14:38PM +0800, Yongxing Mou wrote:
>> In MST mode, multiple streams share the same DP link. Track a link_ready
>> state so msm_dp_display_prepare_link() runs only once per link and
>> repeated calls are skipped.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++++++++++++-------------
>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>   2 files changed, 29 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 2a74302bcb7c..d56ee10ee065 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -702,6 +702,9 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
>>   	if (msm_dp_display->is_edp)
>>   		msm_dp_hpd_plug_handle(dp);
>>   
>> +	if (msm_dp_display->link_ready)
>> +		return 0;
>> +
> 
> What kind of locking is protecting this variable? What prevents it from
> being accessed concurrently?
> 
In MST, the entire function is protected by mst_lock, so concurrent 
access to this variable is serialized.
>>   	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
>>   	if (rc) {
>>   		DRM_ERROR("failed to pm_runtime_resume\n");
>> @@ -714,14 +717,18 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
>>   	if (!msm_dp_display->active_stream_cnt) {
>>   		msm_dp_display_host_phy_init(dp);
>>   		force_link_train = true;
>> +
>> +		rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
>> +		if (rc)
>> +			DRM_ERROR("Failed link training (rc=%d)\n", rc);
>> +		// TODO: schedule drm_connector_set_link_status_property()
>>   	}
>>   
>> -	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
>> -	if (rc)
>> -		DRM_ERROR("Failed link training (rc=%d)\n", rc);
>> -	// TODO: schedule drm_connector_set_link_status_property()
> 
> Why is it being moved now rather than in the patch where
> active_stream_cnt was introduced?
> 
Got it. will move to that part
>> +	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
>> +	if (!rc)
>> +		msm_dp_display->link_ready = true;
>>   
>> -	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
>> +	return rc;
>>   }
>>   
>>   static int msm_dp_display_enable(struct msm_dp_display_private *dp,
> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>> index 676213a48089..0464f8941e8d 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -22,6 +22,7 @@ struct msm_dp {
>>   	bool mst_active;
>>   	unsigned int connector_type;
>>   	bool is_edp;
>> +	bool link_ready;
> 
> Please group the status variables together.
> 
Got it.
>>   
>>   	struct msm_dp_audio *msm_dp_audio;
>>   	bool psr_supported;
>>
>> -- 
>> 2.43.0
>>
> 

