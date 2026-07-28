Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26333AC0ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 13:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247039; cv=none; b=TEGXSzrrK5DuubEqiwfacbrUSCv4btMGNP3BPUGEqdVvVO1UMG4ichP7OThfU6Rqox2McpgSPeXkUQMNA4MTy5Ba9vDyCPkFm8/zn2Eb62VcvXBdFpG/tvdF4bxIB5QvPfKQ5i1+dL3gFDziAbqHhAWaH8LlkO8LgCjSmemu2Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247039; c=relaxed/simple;
	bh=KMJI9j2te88YUxYzP67Yjs9oz3iww6dyMriFxT34GrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POBxdlQUK1usLgZ6MVZsw4vZurU+6nDuz8jFia0/CTSHVic9ILIIEGmMr5iTlzqT98nJbItAXyIoBJDFEMoqiVp81JBTzkokIbBPLCElj+LXGJEx2sHh0cCQhQqZoGD2PrI81Sn8ZMaNn8bh6E0Qh//g712V/ebExwOAnLrOG+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUgcev3L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJt5PKKU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUgcev3L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJt5PKKU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDPQVH2898775
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 13:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J6F4TZN6AddpdswCw+TOERdC
	B6esaNgGvqSJnVXEzNM=; b=cUgcev3Lwxfwu8ATuI+zI93rdwf3J89jA6JvqOa+
	WQc3qvu2tjnnmZDdFWZ43jSSHxR1LvkEc/hO07igQOAs3pA0r8CYX/RZJdt8kSxT
	Fs+FkszihcqyAhnmxluKXWa5DvqPiTTM2gwPGo7yAWZfzYsXA1Gt5VZAxUQbZvwY
	noemk4fpq4dKsjjerDE0m8qmPhK2zVz273yPhYdxZeybR9s/mrtSvQpLv3PNy2lT
	XMSiHj68skavhMxMtc3wtSQK+wc3VftP7y7ywGO95hWu6gyw8n5pr+UzSb07r6jY
	3j3pNFTGGsIdmBVVM2b/CdYXZEeYSYX6B59hl40+vHg3Bg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn19jbms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 13:57:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0f0a0760so88287731cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 06:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785247037; x=1785851837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J6F4TZN6AddpdswCw+TOERdCB6esaNgGvqSJnVXEzNM=;
        b=cJt5PKKUf75VMfm+BW75glCOg7C2joXAglgasHLZKggKK8s8gRY94KuuwdCE9Kydjz
         FGEsinPU2ys8LUJwLpl36WKVkW3bvCEKSs+YQAYIS/lXoxXwlbfcBWuTOTJsFW/rywrl
         4OjhdrAXMEk14SbySozH6M+Hi0RU8CQUT6Agl43w/DHK2hOGhf9eD2Tnmcr3GPNImS33
         /4iVYr5DNL75fi/afHJd4Tput/VDLy7HglmPPFU5dwBMRkiUj4e/CQ9+mZnq+nZdCWsQ
         EOXsRXgtHLMp6eHjvqxUCsshcTMcSNEYUWSm5abFnapVGQRC4hKfVZiAQJ7B2Kc7HtSk
         rtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247037; x=1785851837;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6F4TZN6AddpdswCw+TOERdCB6esaNgGvqSJnVXEzNM=;
        b=KRXrUxkrTiqb1Dn+BbwaNyKg+Zdp/1PChhWfrDm/dR9Ja4CBJgX02EQd6EK6rdf1Rm
         pzMdD9jllfQoCoRa5rfo6C54ujZ5kYtFV0Dsl+ghEvzdvVQ1NlTlVI4+mvxFNweKFAnY
         KrHbZOa9VigJrtYV2Z1LKe47ZRqfFlgICEYB6fLpRpsvFZicKi9Ernz/mrm94fi75VaB
         pvihyD0OHm0bHlKX0skl858kd6dd5tzqpDHrNYgGiZOtI5Y1M9XW5TDmnYuU0kx5xfMz
         FMC7aPUe7zKGF65MsqH+9asDqDlqGeLd3TXOdl/Yj8dTKqzXMQNMiXeDKSEA7ZKNH7wN
         nonQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+PPMv+z6+CUwGlw6OyIdOeBN7XXhcHsM8fXKkMrp7xpVBvCen/Ncrl5T3Mm0gk2DLWFXKgTDGN1kG+Ap3@vger.kernel.org
X-Gm-Message-State: AOJu0YwgRHhb+1sYmFE+xrEo0Az5Z979uLOH6hjMmedypGYD3cHm8B3W
	YN+lYnRN4zDqLayUFPuHJ/2PutCVQbJdQTeTJd0SY833Fje+I7WdQ6dx/4M9mLlwmpQee69E1BL
	vscXxpsYcC0G9PRnMqzwLXIZ5umDjp6ehuOPK2/W6LFFMrEae7v5S09wywnrUDRtfvZvp
X-Gm-Gg: AR+sD11aZa+SLriXtbEJTdINjtz8EBUyH8KDaUGQXNH05MdsbueDyY3AeQsfLFIppCY
	QaywWR1qLc58iQPCMKZK2H60SPr3Z4xN04SFYLE3nCH0hpuGjnmPhZYcsXNSkMRgWJ+ltW1b/Jq
	UtOG95xrUzNsXRAZ2qjiJrUfoSMu8WmZ09yABk1JZpA85lmbc4RG/NkjLxpBvh2kjtm0bDtqMQV
	YzQbcsV62gYAfLC/Y7q9vGK+jcTGK1u7COKPQxvXqiXRu+gH/BNFH9nvpUgKlXc6qWrqiy9F7wV
	Ie77xLunW90jtHzIzm3da1ZuK+t6IcbEO2gysTme/8pc7R80lM2YHMJZ7QhgK+m0uORO4mIs81a
	BlisUv/bJmQd973c9tJgM7raTpbvYAiAZ3QR5YVtvI+NLN8r0JQAXIfxNm64arDv7+mO+APVcFh
	UgzM8WI6Z0w/A6mw==
X-Received: by 2002:a05:622a:192a:b0:51c:c67:2042 with SMTP id d75a77b69052e-529d71da27dmr20415581cf.53.1785247036746;
        Tue, 28 Jul 2026 06:57:16 -0700 (PDT)
X-Received: by 2002:a05:622a:192a:b0:51c:c67:2042 with SMTP id d75a77b69052e-529d71da27dmr20414971cf.53.1785247036109;
        Tue, 28 Jul 2026 06:57:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be077c14sm2123277e87.1.2026.07.28.06.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:57:14 -0700 (PDT)
Date: Tue, 28 Jul 2026 16:57:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Vara Reddy <quic_varar@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Archit Taneja <architt@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Tanmay Shah <tanmay@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] drm/msm/dpu: Drop sneaky dev_pm_opp_set_rate(0)
Message-ID: <twedkppa74qxgbphy4xqhreb4a4s524jfjuzaqydtizeutpjql@tht3pklgptp7>
References: <20260728-topic-dpu_power-v1-0-e7783b859a70@oss.qualcomm.com>
 <20260728-topic-dpu_power-v1-1-e7783b859a70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-topic-dpu_power-v1-1-e7783b859a70@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TJV1jVla c=1 sm=1 tr=0 ts=6a68b53d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=JydwUDacOMusncNaJ5cA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyNCBTYWx0ZWRfX+B4EcpdD5yFN
 4W849Re6gssSFQVRKz8GE+skH8V9PcfpO9aCME6kZmeK0flzr1jrdKgs7RJwuMWDswLsTaButlb
 EvX25lULLZ2YT/pdV7ZKNwBAYvBgcbW3fp9923XrwyDIR3uuQl5OAfPU6udKx9IczocdU0WajLe
 7udmfffSjF9p9p5MLaPJZJfu9iOKNAD/14EDpA0pF+LyihJ6MtTEpkEu51uo95b1Z+BtvmZ7lot
 vR5Eh6Z14PaX6UN4TsA8fVre3VlaZZZec2uuF8k1PbAmaL4M7xP6yagz6qJzXdGYYKcBo7diKLL
 LORD7cJAgZtkABjfRE7Um5LSXucrOlbxiImDZfUHz63qCFmyTXIsKqv4S2N7d5nLbQVs4qyCZwQ
 VbEjjXOncWujzdYmg89i/mSZagy+DKNajOzyH8Kz982TClz79OVRKcziNkHHYsw2gkKlAY4S8bR
 4CNAxrgnfLg9MOIIJIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyNCBTYWx0ZWRfX0/sZU8SVsLAq
 w0R8peqKvnYB6hnadQ1BhDEvJjSthS/6TzsOqch0MJHj6xxfiBbK4A9MeMseMpV4FebNQV6IcX4
 0TT3yHiqsZYjMeogn4GOZEq1+KPUB1o=
X-Proofpoint-GUID: nqwiop6AG1IVGcoMEgol9oHxhLkTLwLS
X-Proofpoint-ORIG-GUID: nqwiop6AG1IVGcoMEgol9oHxhLkTLwLS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280124

On Tue, Jul 28, 2026 at 03:20:45PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> dev_pm_opp_set_rate(0) removes the vote specified in required-opps but
> does not actually park the clock, making it run without the necessary
> power backing. Prevent that from happening when
> _dpu_core_perf_get_core_clk_rate() returns 0.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 2ff255d7795e..fea173e37464 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -394,6 +394,10 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>  
>  		trace_dpu_core_perf_update_clk(kms->dev, !crtc->enabled, clk_rate);
>  
> +		/* If we're going offline, PM callbacks will disable the clocks instead */
> +		if (!clk_rate)
> +			return 0;

Is 0 here an actual case? If it is coming from the core_perf, then the
next line will handle it.

> +
>  		clk_rate = min(clk_rate, kms->perf.max_core_clk_rate);
>  		ret = dev_pm_opp_set_rate(&kms->pdev->dev, clk_rate);
>  		if (ret) {
> 
> -- 
> 2.55.0
> 

-- 
With best wishes
Dmitry
