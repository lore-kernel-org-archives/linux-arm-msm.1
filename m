Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CCF459AC4
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 09:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787304435; cv=none; b=oJboU3NCK5EJ0FoKqf64+ye4VOClBcJE1QsklCc1C4kmfHHgnsxFXDAxNGpDaArIHDBg/Z2RvyIvaNR75IGbmSGWJWezdZ1BO8i8cdYcJCKw2cnvckAdvMNMHZl8goCg3e1Cx1fbQmTq1xtBix/woC9qQMIixbZ2cbfLinCio0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787304435; c=relaxed/simple;
	bh=zhz5Eppg9gK9VKs9NQeg/l+USZdAtPwCXPJ500zxdFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kueKPONX2ruTxTmc0FOdIyOqvFCQHbKwP3azB1tLSjtt9vpiGSw5rnHQ0OfqiifpL6+ow1SDIp1zHmSyy4fRQFo9fdqEiV+eewUCtrjxYS0toTOQ9ioVaEqwT0S8qHgsOz/gbSH4011bwgKragn6fV/J7k5Wd7ZjLz0mGC+mGG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mEPiNhXG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZfIlHlpH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mEPiNhXG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZfIlHlpH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LwW12006112
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 09:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y9FPPE5oV3345poAfpF+CAauvyxVxyljY3apmDwlfD4=; b=mEPiNhXGzw0ysy7k
	+JGVQ32GD8hEYY4EwMIzEh51h2pfifIrHMoDwRar33RCURAgNkY5pO5X2F2xeziC
	U3dBNJ2zngOPQ/ZOA14nYetNuAZz44Al5duIEEGMa1/hSyBJVoM5RLxLlBJeyYMI
	ba/K6+MbIxZyJ2ze9UrPPiu3LckHNstNKzYe4+5uQNbpRFNwTSa0nOZWM52JWEEw
	IX82CatVWc21pq8y2rE1g1Dmfvq9mL/7ikacboz6qC4Lgo+aIxN+MBG55001VE6z
	vuaOxOx0TztdYBhzniNVMfzn7TU9pNebY3lceLPYRGuKVQLql3EnxYcV3jhjfSQZ
	krhvaw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gddgvtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 09:26:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so1461418a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 02:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787304414; x=1787909214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y9FPPE5oV3345poAfpF+CAauvyxVxyljY3apmDwlfD4=;
        b=ZfIlHlpHcEiC5gfp9+dk0AROM22YnneYFEIbl+ciJ5OtLMB/2UUhURofc8/Kqk1+jq
         2Zg7UJn3sI+BML06R+wXav6wjhRx6floQaN3Oyd1y089YwVO7cGdjgqpYlCylAbrSeHw
         ybUJ0YA22a/MNcfzJZhiUrpY8QbLjNE0KDWyiJMec6oZ5D3Bnc2pcx/hK9ErtFPJFJWo
         2YA7CyalpGzhdFTlvkj/lwq4FGCZRPK/FNsYo8mfxQPoY/bVYA9mg+EnU88jhawwVFp8
         h+IfKqaLbJVDm+q8LxSkRoX61FD+6E6qldf0NlaqRcJUmVFmNzVQNc6c8o4hYlrGfTzG
         RtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787304414; x=1787909214;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9FPPE5oV3345poAfpF+CAauvyxVxyljY3apmDwlfD4=;
        b=Sq5/vsoBkgDy/itE5gpaxBk6VgrLu2PgBkD21dxA7NBFnlXqVvqfAlzAC3o4n/GjPG
         MUnaZcT1gy8+Dea5ArpcjGXnTmnUzPZdQt5Js5g7P92UHQfLuvj8+WL+QwSUchV4K4Ii
         pMmaAQeGLI5WKsdWPdO4z49n6pA50M29znaS+/0Yf5d7WJMMgBZ7TXH6Yc8ErY5UH4qh
         JDWUL1c69KOjH+1C43HD5tQ/amKw4ccs7hZ+7vUtF9rQ03saX/CX52kCUGK3oIiHiNNs
         cHcLG6gIARYjMpjBZU4xzrBoKWS2mLywLtcmpAacUgXP0oNuH/mGf0rQ00T2JJCExvsX
         Ulgg==
X-Forwarded-Encrypted: i=1; AHgh+RpTIhnuLIlftMiW7f0DjyjEe8gjAgWMjphjji9uwitMiiJvaNfTa2vPHVW2JwXrtnIXqLCsExku2RMktOEB@vger.kernel.org
X-Gm-Message-State: AFuF++m6MfuEIzIM6f09MO5KpUL9iFwMtJOJzSld49Pq0svjQRpHmQjG
	Ln2keWOF2bfXJQ19Rh51QG9pcllZWbOj0I/D7Gp6MTozrDxTMQtyM3Mkp4rn7zPph2yfJEUVvPB
	nhIEV0RjEWCHD2fpt1qxjaXidww/tsV1Ty/dyOT9FOnXurfcc41cntM+C2TwGgZaFuTUC
X-Gm-Gg: AR+sD13WHctTE/ieh6U/W5hDOSD/pPHQER/Wpi7k+A/pEkGnQix7WLMleqnpL5le4bl
	4BmrPFRVw+1GxARYz8cdywRxb0hmphfdNhuQRydvtNjsmppnEwbWJWRh/7qWdOn1r2ueETtW0HJ
	h+PT5eV/WY3lNg01uSJc9cdY08LzpKtAA4oCdtT5cqTscDLBO0yw9iTKsKo36M5QYX9dllpq8ki
	TLsCQkIsGjZdOYT7YeUGQzfiES/PjXvGiGzgLWXnjIDcRoUI0fv+cKskQVCkIaSd0lHSteThHhI
	pO7epQIIMBc7jPVVUD1TClbPPLHy7+5s1/43t4D+QxGXl3ITHyGA2JACmgERbAPExyNAArfECpN
	qICUVF/EYlG1xhC73lEjDtkz9zfQ9IiePsp6fYGGqrND8P2uA7epQyPJ33atlqQgGL1fpNq4=
X-Received: by 2002:a17:90b:3912:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-395c3738b35mr8102086a91.13.1787304414056;
        Fri, 21 Aug 2026 02:26:54 -0700 (PDT)
X-Received: by 2002:a17:90b:3912:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-395c3738b35mr8102020a91.13.1787304413572;
        Fri, 21 Aug 2026 02:26:53 -0700 (PDT)
Received: from [10.133.33.40] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4c37996sm2309454a91.16.2026.08.21.02.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 02:26:52 -0700 (PDT)
Message-ID: <7db3d44a-7efa-4eb8-a80b-d3b23850063b@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 17:26:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 01/25] drm/msm/dp: introduce stream_id for each
 DP panel
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
 <20260629-msm-dp-mst-v5-1-2ed6aee1867a@oss.qualcomm.com>
 <7fjeip5h4jzvsuowvfgmnm6krh7tvulrv3l3laa65quscq2jzp@lor2elvhmhia>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <7fjeip5h4jzvsuowvfgmnm6krh7tvulrv3l3laa65quscq2jzp@lor2elvhmhia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA2OSBTYWx0ZWRfX42QPZNcXCXWS
 xRIEyOLxUwxYx6GdJoCRzgbBIubt4DJHq2QbjubUGtswLCWrl1+g/7ceHNYbpED6zz7bBQAYChh
 hbuuLsNZnhywBJdk2OGGBWLrNjRp070=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA2OSBTYWx0ZWRfX67o6Wu8q2BNf
 Pb0VAm8e1MQ9WiNw961wTOnIwaAuAFAe+tiAudSVtQOVbQdC9dbXyxkFaryoqN7B6tf8Oe4KZXm
 fFdKRTQQQQaKzgUPUU7oii3/698YbZD48+R6ZXwEUTOGd23LsFe0aoCQ8AzTfPUQI3jAGU72S9T
 78payvlOrDtt8E2DViBTdt9H9zfabbovA7F7EMGfRgx/nWoQS7vXt8tPUcGzYZhWetowuvD4AoQ
 9c/V3SXPDCwCV/kmcD7tBp/je1PndpqjqSP7+QZo8RU0ImuuxT94dTYgp2ZdWsed18alDNPYMjh
 PUOPaYpG4Qr8lHpEsZqNJwYJX5vcVsvY7qbHYBzVoj3GaeR5tPciTofTFnoqNqmfUgvdvrFbDOb
 R1e3m2JJaxkL5ozYr/SujIDxSyT0juvoLQyU0gPs9Grr7p9vH6O2QYxjGqmp5+I8ABy4e5qsNyd
 JJj4zv393sDafx5Kh+w==
X-Authority-Analysis: v=2.4 cv=ApHeGu9P c=1 sm=1 tr=0 ts=6a8819df cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=lU6QALhYSBwYHZQzA1gA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WDi0NumZ0PVjXjwzfVkzc29e_FybWy-D
X-Proofpoint-ORIG-GUID: WDi0NumZ0PVjXjwzfVkzc29e_FybWy-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210069



On 7/12/2026 7:11 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:14:22PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> With MST, each DP controller can handle multiple streams. There shall be
>> one dp_panel for each stream but the dp_display object shall be shared
>> among them. To represent this abstraction, create a stream_id for each DP
> 
> You are not creating IDs.
> 
Got it. Will modify it next patchset.
>> panel which shall be dynamically assigned to actual stream IDs by the MST
>> path. For SST, default this to stream 0.
>>
>> In the MST path, panels are dynamically assigned to actual stream IDs at
>> stream enable time by the MST layer.
>>
>> Use the stream ID to control the pixel clock of that respective stream by
>> extending the clock handles and state tracking of the DP pixel clock to
>> an array of max supported streams. The maximum streams currently is 4.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 67 +++++++++++++++++++++++--------------
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>>   drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>>   drivers/gpu/drm/msm/dp/dp_panel.c   |  1 +
>>   drivers/gpu/drm/msm/dp/dp_panel.h   | 11 ++++++
>>   5 files changed, 55 insertions(+), 28 deletions(-)
>>
>> @@ -2188,38 +2188,39 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>>   	return success;
>>   }
>>   
>> -static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
>> +static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate,
>> +				    enum msm_dp_stream_id stream_id)
>>   {
>>   	int ret;
>>   
>> -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
>> +	ret = clk_set_rate(ctrl->pixel_clk[stream_id], pixel_rate * 1000);
>>   	if (ret) {
>>   		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
>>   		return ret;
>>   	}
>>   
>> -	if (WARN_ON_ONCE(ctrl->stream_clks_on))
>> +	if (WARN_ON_ONCE(ctrl->stream_clks_on[stream_id]))
>>   		return 0;
> 
> Is it an error, defensive coding, DT mismatch or something else? Why are
> we warning the users _and_ returning success here?
> 
This is primarily defensive code. The normal execution flow is not 
expected to reach this path, so we only print a warning here.
>>   
>> -	ret = clk_prepare_enable(ctrl->pixel_clk);
>> +	ret = clk_prepare_enable(ctrl->pixel_clk[stream_id]);
>>   	if (ret) {
>>   		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
>>   		return ret;
>>   	}
>> -	ctrl->stream_clks_on = true;
>> +	ctrl->stream_clks_on[stream_id] = true;
>>   
>>   	return ret;
>>   }
>>   
> 

