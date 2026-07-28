Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7E4381B05
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 16:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256850; cv=none; b=GLco21t+ZuSVtFr1wl15tYtG2YOhDJfPrfkHH3B4WJ6aJnZK7JTSRDPaHbY4CL60RhneTjUjTedpNMzH1Ki1VaI9VTZcWXBDXFYyJubGkAIiGOJVtJc+3tSI/UEqfyypqe/gYUpdZ7btfMKwbCzsRWcwhEYoN64DXmtSBfaTQK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256850; c=relaxed/simple;
	bh=AXR8cSp5A8kecGeTiuEs0/pBr2zApiUpOTvoGoyOvFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=soQCI7dUQsSD6d5MLyh0ocLgy2lDNi4am5L6cUJPsim1BdP2aim+G6h+ZvGJDb/c3JouX08HJTTUiwnFPXOv1Wbj9CP20Alis3U3lEK76BRJJ12FXTnnAni64kQBQxKr90eoCR4W8PAmyj6wWgD6BzQJrr8JEZ/dv/5vhzqjDEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ohjcwOzd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIgW5q5v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ohjcwOzd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DIgW5q5v"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEcqTA3239039
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 16:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6XIAYpvOZNxgfjo9PcaotLY0G9PU+jDGlLgxgEzrF9U=; b=ohjcwOzdL6AkZGFs
	gzft2ifcLHgXwDO5sF/vklzZAuWYqB+Lnz05gIhX+C0AefvCzbMX7fJu1YxN5ig3
	DKbRkbHZeoiiv1DZS4ABaQWgoFGTC2u4gID8O5MsvgudL40l5YdYxphTocJaNijx
	v6x1SWh8DhNwKXXgDHzwn2VRV28D5hX0k6ugKXFwgcVDgrMW1O9dcniQCixiVZrF
	RURGZm6X4D2MqEdHEinQ6guhPrGk7kp3Jw4eAaLz8hlV7m40HA+EFXFuJXrteLqI
	TqcpIM45cQMp2o6Yw8Sr09I9MTpPH/IWTfpSMSxZdhp7McA9C64ZTElRXrDXgL6y
	OgtcPA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7mbx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 16:40:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52845bd815bso87921cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785256846; x=1785861646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6XIAYpvOZNxgfjo9PcaotLY0G9PU+jDGlLgxgEzrF9U=;
        b=DIgW5q5vvmEWVtirl57bEUxmvA8DSzptqbIMGXrHFWRx7rcbo26WS2ehRnTliFdhdd
         PYhao6cXMylEmgD9P6Np9hwZ98ippevmXyBq6jFfk/jSipGPZvqjNFNwB0eukMovffDH
         qaicnK0bu8yJyw8FCJ2mNVsLrnowrtsa/y+R+HEvSxSvfjJ1s7jR93NGSSkLpNPVFEWw
         MVk0m4ynvvh8+wDdNvsLAyWCG1Il2bCF5sF2uqh7Ua2w6m4Q0Ii9PVJDEXBHI83Mz+OH
         IfQbCvfJnj9bEm83SC/R9+LhIGxtt/8iJgM+PbmT1/rP4ozY88Z9ZjhorZWyHubQ5YnH
         M+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785256846; x=1785861646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6XIAYpvOZNxgfjo9PcaotLY0G9PU+jDGlLgxgEzrF9U=;
        b=eSl6Yv4MZgxLq0cGNcL/eySYOkegBj4u70UpmBY/Eql5Ar5GR6SzRVpXUWCLUs1gqx
         DE4WvkiEhinUp+QE+nwhm6Uz0IQeI6ZYRV4OVGLgcMyU8g7VN3k+WB5lMLR1bKciqTCX
         jfnjclyTNix0c4d8muMdsPSGgWvQB8ZGQ9QswQ2fJAFhrb01hm51ZeDriCNWhw1TTAxR
         DH+pLQK3+R+PabvOOphHe3Lkwk/B4EEWqatm3qvX8NtLGyC/KnMkxn3kG0MRvhCrsCkF
         2Rp0I8QCsx0x1oXogjEY3BVTBqq6PJ+2SEDUOpu9W3OeByAIKlPMOva7iE/+EnJQkfgm
         FjhA==
X-Forwarded-Encrypted: i=1; AHgh+Rqw2HPTgyPlGG/yo/QZ/c2/ydQyz4QQ4UIDXVQnExXI+mFy2zLVChlfmB/4tYm18Ax2EdOTHmouw+S1+2Mp@vger.kernel.org
X-Gm-Message-State: AOJu0YwjXvnNZfCnFc+GiMmLU+zWqecxEi+ADXRstJWJqrPO/2PkU/LQ
	k0uHIMxbFXIbs5p9p7CykGqK3IdeSsGvARN0hnMwAZkWiCIgKY0uhTjiOf042abzspm0ENRFslz
	47MvNZvWihEzG7I3addMH1jWeTZGU88Y5EQXsMUrn2tyCHvYETuLikiygqotiurZnQnWV
X-Gm-Gg: AR+sD11V8axk+SXIE8DEN8LoqiQHR32M6ydJt/NrUBBQ9LCO93mBeWjrzefhmdMoz1r
	PmbqHaEVZ9tp7d7Rf/mmmyjnbs6ze5++2e5Uu/qY6o0ZI4GkP1rx1VhdrR119CS5TX/eWnJElwH
	eo/zk9DnHCVC+Cwfmd6C0D2F6JMl5lsX4dpbvPveDZl3+MJIKKH0iKkPPhfmQYGU4y2C3osQcLc
	t3wJSI8x+fROu1VZG7Lgx6qBGbUBsykLqn6T74iE08J6BCSFAl+1N+MuGa0oxx32jvkwebCWT4G
	FpXakPfZ3mWmtzKLZsKxXK3YbeTaOC0KMHg9F/84W5I3BsBp7LpXsgXXbGx3NfSVbA8NYjB4A2y
	4HWCpU4a6eHDKj3ynfv3Y80Gc
X-Received: by 2002:a05:622a:a98e:20b0:51c:1c73:51a6 with SMTP id d75a77b69052e-529d6fe33e2mr18917411cf.5.1785256846475;
        Tue, 28 Jul 2026 09:40:46 -0700 (PDT)
X-Received: by 2002:a05:622a:a98e:20b0:51c:1c73:51a6 with SMTP id d75a77b69052e-529d6fe33e2mr18917181cf.5.1785256846019;
        Tue, 28 Jul 2026 09:40:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83d27f47sm8254366b.26.2026.07.28.09.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 09:40:45 -0700 (PDT)
Message-ID: <28a1cf31-1edf-4980-90c4-a3bd89b638f5@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:40:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/msm/dpu: Drop sneaky dev_pm_opp_set_rate(0)
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
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
        linux-kernel@vger.kernel.org, Tanmay Shah <tanmay@codeaurora.org>
References: <20260728-topic-dpu_power-v1-0-e7783b859a70@oss.qualcomm.com>
 <20260728-topic-dpu_power-v1-1-e7783b859a70@oss.qualcomm.com>
 <twedkppa74qxgbphy4xqhreb4a4s524jfjuzaqydtizeutpjql@tht3pklgptp7>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <twedkppa74qxgbphy4xqhreb4a4s524jfjuzaqydtizeutpjql@tht3pklgptp7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE0NyBTYWx0ZWRfXz5NtfO42Mx73
 z9KLo3RzXWXU3z94AU6h03ZAUIUzuEzz04WrsbpMU7fl6O5B3Tf9xWX46H7hWrc8WS13a6wXz7E
 bV6HXP6YECtBbkDjp+2oJ9yAVjnoQrIysCQ+BKveAhxdczpisYaz7uhKJM+A+GBQuWERM49U3eN
 OkWNp9NDin9Q9zR1NNQoR2NFgASapM7tQk3JnMEIY/kKJnOXoRd98jBY/i/X18vWFzylvczjJSw
 M1jG692PZAxxJWCzAQmKzqWs12V/4znlDHtFM8VaR4Hz6xr6ZtedGc64D2yHO1bwU4Q6pQDmWNj
 8ODtUGB1+B50Lxo6wlyvnrnmb2hI47tkcYygHEwuS/J9//uzSgSlIBgoWUgNtnx7p/jh64ZN5Rb
 fg9BAqp7zETk9PsUju0hddgyS8t0rZV8T+I9vpgWhsqdpHLax3crtP5YnIOFR5DMLA8d9sIdI3n
 aqRl0y6mFn6PTspSLpA==
X-Proofpoint-ORIG-GUID: xYTUkZA7oiqESfPsJH8secbXRbpFfNPx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE0NyBTYWx0ZWRfXwkACYuMO/8OE
 RbVI9SZWRnm8pKIN3+opTwHG7/z/zLvLZGhUirZr8HcSe9xZUvO+VvutMWm8A3CJ8SU5BVQDlGy
 E2oek+9405D7ykRZBVJdXVofeAxB/po=
X-Proofpoint-GUID: xYTUkZA7oiqESfPsJH8secbXRbpFfNPx
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a68db8f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9gYuhPn4vmGLrIwqE-QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280147

On 7/28/26 3:57 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 28, 2026 at 03:20:45PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> dev_pm_opp_set_rate(0) removes the vote specified in required-opps but
>> does not actually park the clock, making it run without the necessary
>> power backing. Prevent that from happening when
>> _dpu_core_perf_get_core_clk_rate() returns 0.
>>
>> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> index 2ff255d7795e..fea173e37464 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> @@ -394,6 +394,10 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>>  
>>  		trace_dpu_core_perf_update_clk(kms->dev, !crtc->enabled, clk_rate);
>>  
>> +		/* If we're going offline, PM callbacks will disable the clocks instead */
>> +		if (!clk_rate)
>> +			return 0;
> 
> Is 0 here an actual case? If it is coming from the core_perf, then the
> next line will handle it.

Yes it is (upon suspend) and it will not be handled because it's a min()
and not a max() below

Konrad

> 
>> +
>>  		clk_rate = min(clk_rate, kms->perf.max_core_clk_rate);
>>  		ret = dev_pm_opp_set_rate(&kms->pdev->dev, clk_rate);
>>  		if (ret) {
>>
>> -- 
>> 2.55.0
>>
> 
