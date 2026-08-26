Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13EA3B27E9
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787730533; cv=none; b=Wh3Vw4xVOPe1t3Y+KHEtzOnbMN1pBcrt604Rmx8oJBKz30+htT/nZ1f7pJ+gSd8DmHIAmn1sip//Q/j4CYajJ4ihh95rZ9hzXsBOqZboiI380sdQ0LNgeWlkLAyY6dKhKDIseqEnYXxUHqqyQvM1ppHhiBSEXEprXnRHWQgV0Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787730533; c=relaxed/simple;
	bh=j4ZqrATIjp5lUae6FNVzyvd4rHXLoN9BfLy7TsZk/1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7He+kNuYHUPIolO27W9JPYJxJgT6LnOZMLeaRgR/EBZcB8A2UX+7ifaJWXW70ErmB/NAa0Ck+6AWLnVeKpbhZvcNSAE0znV2DrRyGK/06XdliBHQBXvv0dkdVuEK/Ay2coCf4n1Q3GUExWnal2ib8Vr5YgHhl6VsJk0yjOivVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqgu7SYY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jFMdpDks; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqgu7SYY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jFMdpDks"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q7UKqB3272866
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M01LbEstjQwAvWYYJO2xKIyxBlaOYO4NSSppT6rzH2g=; b=jqgu7SYY4b79aTgV
	CjpYVhdntB6IbqmTWJ0gqrIqtfUrXDEMX6jkrlLRiFaMHSl2LLKlfmXgkD4Rp28j
	0EHiHyX5w74IpENCa9Qff0kleoYYcz7P2EBk7m8XsFirm0gUoTI91ToKnZ16PG4s
	06dWJmR48wYD2sQFay2DshBKJ7G0jSuZ5/yNynwAkwBH671muvKKkKb9e9my3qTw
	5kVoVv4y/DcW9oyJUEtc7awdIBRMX5gA8VM86uL4HXf7BGREkQjYrBxbRl2OtzLW
	X9yZT5SLG7OYCgOIv2hUS0spWIucuXRtInb4Z0AxLHufdVktI1mxKfHYwbN/vMoG
	Y1MA+Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthr2mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39640eebc57so1635082a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 00:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787730530; x=1788335330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M01LbEstjQwAvWYYJO2xKIyxBlaOYO4NSSppT6rzH2g=;
        b=jFMdpDkszjh7yzyxle6W2MOYMsLO6AFVjWd7YFqPUwpT37FQ+Eva/hsFPXX0rfkgsn
         qAXgUPODaHt9GnGbIv5P1h2c3nhbzO8vPHwgRBf85B2hdY9Dg/Wdw1VoKVjAUtATYRi4
         cf1TCp2HhB/xO78NI65YGFA9aoeXgZWxBmjVKdXrL17i+8V8C+lpVEW5SdyZ3QBXtmgm
         dWLNnE+KLdws6u24uv926zMWvt/ahHnDVT6aTJQRtzGTYGmDK9Q1Dydd1hfCt09iNP2D
         LlbHoWHSODWsLyOH7mhouRQruQqSk2OAD/uJI5Mj09YEQ4I1F85KqPe84z5v1B94X5iV
         kjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787730530; x=1788335330;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M01LbEstjQwAvWYYJO2xKIyxBlaOYO4NSSppT6rzH2g=;
        b=iqJnpzo/lu/pFHK/GFAUrY0f9LmKDzC6EvhLlR3U7jZl0JnRT1x4k7Ke7GunBNj+na
         r2BiV8k3EDmrjClqGdK/o+6/qMFpdRccDhjKPT77H2mDdazLfwEk71Q5UZZGvV/QApVg
         PxyK0ugSnTWs0FmXNfqK/Q8jCxFhcladmRIqdoe7oC/efl6AuxaDo6iCXd/uuzNCpk+j
         a51Yf2HdXim9EMAMDRIZg/a+CBU7tIWFshKGUdY6BBtLGDP7Sikbsl1zumn+Z3TZsaUm
         TGTlUtyBTxMFe5AGvDa3EUjZmEIlbN5XL9gZ2A7gipJrbZbqym0jNlpVpreFfipC+swO
         Xq+w==
X-Forwarded-Encrypted: i=1; AHgh+Rpqh8AIdU242WSjL235cZIe0WU3VR3y7BmKWxSVk/ov/BbMWy9Ws7Fo/jX2GGB4W8wqZ5T6JeRuTKlR+G6M@vger.kernel.org
X-Gm-Message-State: AFuF++m/e1XxdWDsXRbDwLkKMLvPxph0EmxgzwHSkfyiEKvdI+pxeuEn
	1j2JRuU3K7hb/JESVoTLdhJINZMO09XeDWFbFrb+I//+POyxs169XwBjfOVAeWWVzUHJJQILWJu
	UPdnLDK6Bc1VuZEoX/Rkf/Ch8qNWdCOE10V1NTmVSggRnKdP/EL6zhVWmbgOvXB70/5ds
X-Gm-Gg: AR+sD13QqBdJIwY1d+hPamXv2JBSCsn2Xts4eDHy12jl8ZVxlV7mcZXLUr/DaTRR9QN
	/pyaWhnVHrnSNT01/b8G/lEfoyGowZE0QMwh4keGuByuDu26D1wnaP8WjjZPOwUhSJPkO9k+q8Y
	H95amYxs5r4MB4VcG3AMvU1+REFiavGTgTmQOg6doDWxRfxPwHc8Be7DwYmf9jMx7qvptsPmRJU
	gmGR/FwrqqKJHHllgsCCm1Cf/fxPnVl5V2FbPLMCuHUQ5Vf6I4RzXnBv3lAYoDdCAElGm44pkhG
	zk/2mP67FlrnfxNoAUhS1g7XztIw51YTGEyj5vxG3ZTf2jQj+qqIvnoJmzZplV4YXLG8htosGME
	iy/uIVSfJL8b3+ULd7WKyVVJwqBJ6G3LwOMZIJPgCc+u/tlusMVPyl55W6enfb7iPkO+jOxoZ
X-Received: by 2002:a17:90b:2791:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-3966cffb1c7mr11428791a91.0.1787730529702;
        Wed, 26 Aug 2026 00:48:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2791:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-3966cffb1c7mr11428726a91.0.1787730529320;
        Wed, 26 Aug 2026 00:48:49 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a5832bsm3060969a91.15.2026.08.26.00.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 00:48:48 -0700 (PDT)
Message-ID: <2fa275ee-85a3-4037-bad1-14b45dcb22e7@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:48:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 20/25] drm/msm/dpu: expose dpu_encoder ops for
 DP MST reuse
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
 <20260629-msm-dp-mst-v5-20-2ed6aee1867a@oss.qualcomm.com>
 <uja44sqcdoegy4lm6hmd2eoqmpdtai4bdbndlgtgw7w4k6lah2@hw4etqvmcj3v>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <uja44sqcdoegy4lm6hmd2eoqmpdtai4bdbndlgtgw7w4k6lah2@hw4etqvmcj3v>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8e9a62 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=D-WeIjmAtmHmNwuUf4UA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hd3Vr2fLBbaNrUEHVUpmp38bsZXRiax2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfXwg1iClzF8bvA
 hhdiSlGbuawzaV1nhw9yRIeN3ibon4ELHLk9vQfZvE63WDUG4rd+90XUYR6+dov7REsDBtEdOzR
 4ASm96TqKJuXuihYx+ee+xWNzVeVtdPzASL0lGvmmNCcaG9x+L6exMyyFYmOABFNzbyRLoLApq2
 x4fVtdRyqxxIn9qO0qn1I9D5jY21zuRAA1NV7ZLUtu2cAwReq7o4wtRwaPFfNyG7+c28Bo9LpU+
 4Pd5haUg/KjJthg61lQ3JPqIgLbJiybNcnKs18ZV5jjPMI46K4M8P2xE0NpcvkYMN1bq27tUOUW
 0LLUPAQQICAlf8p0rf6BDbzN+7haF0qn0XHcYf/+KdI3z3bMr8SQq+BMtnR+V14des4n0ktqTey
 oBP2olZwUJ772p+xe9ySePpKlmjFoxSpiUYf3x9uZjlVl5HFkV/Qe5BBhvQIGe2KaRZVRmsIdK5
 j5lViamoRmxuqkp0R0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfX2D9KzuZOMu+n
 wRAKtoJGXm1EaVJMA+LIe8lQPPJshsuFjF2+YwWNtLYTtb8ca66rjG6tys++UUhSWTXuOec1oqT
 eUP9oMFWMRWmh33YHHRZSuI5qkX/Dmo=
X-Proofpoint-GUID: hd3Vr2fLBbaNrUEHVUpmp38bsZXRiax2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260063



On 7/13/2026 8:01 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:14:41PM +0800, Yongxing Mou wrote:
>> Export dpu_encoder_atomic_mode_set, dpu_encoder_phys_enable and
>> dpu_encoder_phys_disable so MST encoder helper funcs can reuse them.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 ++++++++++----------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  6 ++++++
>>   2 files changed, 16 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 778e231d4967..1c74ff6f0dbd 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -1149,9 +1149,9 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
>>   	}
>>   }
>>   
>> -static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>> -					     struct drm_crtc_state *crtc_state,
>> -					     struct drm_connector_state *conn_state)
>> +void dpu_encoder_atomic_mode_set(struct drm_encoder *drm_enc,
>> +				 struct drm_crtc_state *crtc_state,
>> +				 struct drm_connector_state *conn_state)
> 
> The commit message says nothing about renaming the functions. Why are
> they being renamed?
> 
Got it.
>>   {
>>   	struct dpu_encoder_virt *dpu_enc;
>>   	struct msm_drm_private *priv;
> 

