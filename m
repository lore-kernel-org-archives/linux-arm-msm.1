Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37EE447806
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 13:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246982; cv=none; b=f83vDGDelP6ATPPyLdW6JRGTQUt1zeYbL71675PtylQ9xX+/V/RvgUjZnnz/XVHHeBRgH0uo4Duf3WmNndCFUQsX33cIg8EeZ2p18rkDWHYHzVEN62F3sWq4AIJniIGJrgmMfNdyZ9S8/beolXA/NLfRlgEZxRxBcAFgBKmz4lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246982; c=relaxed/simple;
	bh=f82iOnxjy+Ty3QM5+KrjuF8CnMVxBO558NnZMmB783Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TiWcB7le9xE3a7x2tEhjQM/p4A3ede1I9CqiMFecAy56IAiNi/N4W6Qix8yF6G/RRo4oFdBL3QfOaXqxv/Fgf/MJza7qRI1bhdSQINcHjgLcOeCtOE9L9hT51IlHe/q6VpRGBvVD3lO/bCKCiRW1BsuKfz11SZXyU5GUUckOZak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ygf+M6nL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESIYLsh+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ygf+M6nL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESIYLsh+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDOWR22816684
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 13:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xxoz+34qkVkkaCkqzIrALQ4y
	3r0ocs3NKveRxhoBSyE=; b=Ygf+M6nL+AJp8XYQ56WaTUW3Yl4G1I2VY1kFYxRk
	o5N0UBEX14C0m0FKWeMl0z98zYjkwcqhPZRGbUXxJt/rn+gZKXXDrEz0LqWbqZOI
	+b5gqC6xgr3Pp0VHwZT6RVjnbyXkm03iv4UkBDLJWagAZGxVaJq4Lh8tl3CfQOq1
	A0zPaJjeXIvV8hdAbjEI7owe1PryE44GWW46Xkaoxp2LS+Ix7WbfXe2OjUS/meob
	k2e8V45GwgNZ3cNdL04d3qHsoFAHC7Bf8CSQINke8qDHUe6bjsDfKajQ1Et3mTIK
	k3eMx1WRFUrH7n+Ilft6lzT+DsSayLomc6hWd0qILZTakA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpqxjhkdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 13:56:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ec3314f65fso49668456d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 06:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785246978; x=1785851778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xxoz+34qkVkkaCkqzIrALQ4y3r0ocs3NKveRxhoBSyE=;
        b=ESIYLsh+wKK0xUspZxrIM8PWxHeNPOBs7EO8lOKYfpZCwJOu7lm2CsTohRJBk8r9k3
         Dm3Wex4veL4GLryqPL/lMYBMc2m354L9QkuarzsjKsWlhNOI48Mbgk5lCKKKzwxsI3dD
         IgWtBick963r6mRACVMIeFeSkF77NRivOCq0rVaPjWFdM5/6/ZrOaGHTQ72onhzIPZ4/
         iicoji5dVa/Xb05Z03UNzex0q60mDn6o8mTzRoFcCpxCkwAS41jEfO977Q5MpcrE5anU
         6FGJdCd3168kZmn6DHoh4ix95O3gW1+fvSimdTIt3ilBFieSOTxciU1rvncIGHbPCw19
         dRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246978; x=1785851778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xxoz+34qkVkkaCkqzIrALQ4y3r0ocs3NKveRxhoBSyE=;
        b=dvPVHkxAhjGR8zrZWdpFWZ702wCV4IF6bqwXhkfmBMZZxyXKf7AJwjSQ2aReZxVX9l
         X2Ds82C09VzUz4+YwDR8Dau78z7WjuCo6PZxarNQ8BVwJ1Yag9z8LoBos8XmZNs1ts5Y
         wvEhiD4qGRl96ssSfuuC51P4KWdlqPpgALsOpoA7M+K/HcA9P1wt3SzO1wn5/TtfUMaS
         TGYrBPH+9bKsFeXVNt1VO5cEtVrflchlNMVQESKiPQK+V3sFsulGPvQ8RIEtIk5SggKS
         xiP9FugqI/U7vJhObSmG4uMOllcgJAP5v3kDhJyXsC6xF4ciFvdaWm3o4XgFfNnzHoF2
         TugQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5/xxTv4mgWE9PB7oL7b+F6F8/3oscW65xlZW3qxBUizJFwvp21FDu1nb6FJTI4wkerBf9Rs09i7Socr3r@vger.kernel.org
X-Gm-Message-State: AOJu0YxpW6FDlxH9ct35f9AibINaS/znWGngT4wXEzvrQ7w0oTdvZ/zF
	9hqR4Nqvip0upTg0v1pzJAHIDUqXIJw/Ocq2db5jBqiQTRmXcfADCLbOoNKxiB8bdGpLW/ES8fc
	UrWyGV5CyKI9i13BQaMpuRswjfKSMTwRfkxZMIli/F910e6zT3cKcu2f7t227WVdO6Ja4
X-Gm-Gg: AR+sD12997nsFuaE91vaP1uT4ABpkn753CO9Tp0bqnIRbGbar5Wp0CbOBSYW1BjZZuq
	pQadjp4G6Aq2YhJb9H7ovvph4chGc+BTk+VtkfHIcdb2+FvpqDxvRS2VBQQeRx+6IQdEczjY3Hp
	CsCy89Pjz8TA9Oux84/NVclL6wtjsJwAVZSeFTe411MnmFn7o3jmoAQrkjsJGKQggMXZe4yQsqP
	MQV24IqmBSnP7pP5uXp7YovJ51qJPhuF4vxW6hsE3UQW/8CJOsyvsrySGMQDE3ZeCDHT+zhKFmo
	vFI6u6XHAO+jwg6Oy93DDS3RrIAxT8+GcbIL6KgbE0FdfelL4+kUhIRHbAySgY/vHtzlTXoHeNY
	7hRX5pRruMqKhrOn1LuEe5m9SysgvoPW4hCMTYVRw9vjy0XMUMScsg9BNM0DAjkyiR5RcqUSohp
	W256t6CgZMTw7ROA==
X-Received: by 2002:a05:622a:1918:b0:51c:94f:8ce with SMTP id d75a77b69052e-529d6feaef4mr22346361cf.34.1785246978077;
        Tue, 28 Jul 2026 06:56:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1918:b0:51c:94f:8ce with SMTP id d75a77b69052e-529d6feaef4mr22345991cf.34.1785246977639;
        Tue, 28 Jul 2026 06:56:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f22237558sm18744421fa.19.2026.07.28.06.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:56:16 -0700 (PDT)
Date: Tue, 28 Jul 2026 16:56:14 +0300
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
Subject: Re: [PATCH 2/3] drm/msm/dp: Drop dev_pm_opp_set_rate(0)
Message-ID: <atbh2v2p5bq7dvr25y2l7nal25hd4j7n7ikzxckrmfcfqudpmp@h7v3f5vv4bln>
References: <20260728-topic-dpu_power-v1-0-e7783b859a70@oss.qualcomm.com>
 <20260728-topic-dpu_power-v1-2-e7783b859a70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-topic-dpu_power-v1-2-e7783b859a70@oss.qualcomm.com>
X-Proofpoint-GUID: tW0zrpWlojzZLa6p7kSAX2VzMiXkbQaz
X-Authority-Analysis: v=2.4 cv=MORQXsZl c=1 sm=1 tr=0 ts=6a68b504 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ze_z4zfmBB5lhDDjiZgA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyNCBTYWx0ZWRfX0xXIXZfIFV+d
 QNZePdEOwvDsG42xRGeIlaVqscC610xCidF9CsliYTdfzH3YdhTA0dk0jyAoWYcEpbr98sWIQtn
 SDIJuFGNQxoSR9u+i0NzUZwIqoY6PP0=
X-Proofpoint-ORIG-GUID: tW0zrpWlojzZLa6p7kSAX2VzMiXkbQaz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyNCBTYWx0ZWRfXzYDNANxN73Tt
 Hn1MBQPE6DRywLQ0RR7hf9rT7SlK0Dr7xzHC6f7FVQcvOZfZBVlnPmSQtUncgDgAUpXx+T0blFS
 yjH7AHBUZ1dao1aZ85FA4LoLJa7ULV9Kvm0FGAiMaxkx3B+mQR52OL5rfi1yGYoFPezskerZZyh
 HwkPChNjpd4QLPNTbr47Qw7K+sNDdR4bmTu/B2vsVyS61m0PcZlEW7/rho0bAGV4S8Ib3bkBYip
 zngM1Pj2e27HjxkDovb6omTLoQOMt56fxl03G2k5zsThOcF1Ad0C+k5weE27F1U1Fd7K2y3qmew
 1CYyBWuXWIoV4jJcSIXcOb0+JsEaJt3BYhQqzFheuG8+C9m02TfoAhgiO+2ccCk9Wmcz4BQz3gG
 KTWfMVNyYQlwl7y5lYCxP/l0OYvO3ICB3fiRg6sAYcRi1QwHKT68xSNqiERyPn/I1wxNngTZ00Q
 GxSiTFVg0m0Jgewed8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280124

On Tue, Jul 28, 2026 at 03:20:46PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> dev_pm_opp_set_rate(0) removes the vote specified in required-opps but
> does not actually park the clock, making it run without the necessary
> power backing. Drop the explicit calls to it.
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
