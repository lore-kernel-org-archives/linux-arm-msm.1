Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486FB3859C3
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 07:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851047; cv=none; b=kUCQT4Sj+yQCs4VtuSiGJkJX1hopGOX8Ef5sd1HjTQ2sH53Xt8AZm+4HTsquH9S9PnlEJlaR5mpQqVvhKi0phR12LtW1QKdWIr2uyuizZiSbg8PaKTK+QABfSZ2uvhpCrooTrlPV61+fbabnE0SbYq4dHzC4/XVoxfxtlSOm+80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851047; c=relaxed/simple;
	bh=GtHEnZk9MyBdKv7ubuUHgxN1koWc+wxdG4Xd9W9NvNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HM+IKkbX9NxONNYui6gGFHtNWL1g6Du3lCQqDXlUPxSsEf8sWOIXdOSkFoWhVQ4T7rJiXF2CRVr43PpLGSAFGa17SNiDPq5KvkYTtrmOTqen8r0VJLtBKQBkSIB/yH9/FxOael6MyctyfF5/OS8pb4aws/Kdh6ogaDtNXoqXDJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mlzeTykR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U09ZI6D4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mlzeTykR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U09ZI6D4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Li9t3299258
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 07:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSgnM7WQLIr2JaQ5sXzvM8SpynBQx/3leL7JcFUsetI=; b=mlzeTykRkXaD+r/e
	qHrt6wRxHQgbe8cKzUm6jbUJKOKQowVaNY/rFVyO4EanxNfPn89LV+es3Txi7ePw
	XKI5EGhjsigTTh2QdUs66wrQjpoJEawOtPYWfB1EyW+ND2tUc97tuQCaqt2bSkqI
	7m0PQYt5aAwusVD9PK2kOAdbkf2dY66qEi/Ohdya4K9qBkyhQfLGC2BwSsdUBFPr
	UQCoBg/54M/JjcfHw9ngzrd0h5zCXmDeAoN02vAEI7mpg8g6FMRpum3yFZQl/gEs
	3ByD0RnGyZ4uYlEltGlPxoxudohx2XV0dxu58WvPFs5HaCWqFNa63r8VSLjTIgNL
	U68zzA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0p8m1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:04:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9310484c005so56215685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 00:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851039; x=1789455839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSgnM7WQLIr2JaQ5sXzvM8SpynBQx/3leL7JcFUsetI=;
        b=U09ZI6D4peYFqu3z4sbrfBuZOKxIQc5J7JGIwOnNACd5WGvzGI8fIA7IrFG4AGx4ZX
         K1mXS+FcYv2epq6J5OaseKpiMyKLR/RCP8U76iORMYUTThm3U4egzPECZiKshhLH2x+K
         LGjwPMJldIp4X7RIQL9Ew14ujKWZc5+mqa+cqaNGNYIvSpVccB4fGFuexb9JWhLQsnDE
         f4XaE33oCeSoJsRUygExG4mpP2DmIkrQhZYpH+ZDtSlVDNMlb7p+FrU/s+QzJtRiPuPQ
         2gO3rBH4FY9Y9lIRH/jhSV/0LrQ1yUcfxnDFC31LyYjk/XlQw+2k2q+vx3pNftcwYFDu
         hDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851039; x=1789455839;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rSgnM7WQLIr2JaQ5sXzvM8SpynBQx/3leL7JcFUsetI=;
        b=GJ8hlj5JBM86/IBJuO7Z9UxQJ6CldKKTtZCMtagI9a1VFBDipqrlzeLBCfIR7d+89P
         dr58c9GHXms4CGflTXpFHeXaclwSoWIJJlLjeqBHzxxJ0ufupK5K6tEQPgI3vkY27aCc
         toe6aH7NskrsIFtwG521rnAdt1nhSxM7t/5hlHe74WWtp19bdPfmSWAsecpqIB3IIVY+
         xiFgjORMyJVVCHfWbW8v2GRgn3ItEkW3Ie493Vnm6nX4WbLGMw0ZbdikmMB23OWpF5wF
         NXq8fu+JbQYKgdbbaw9lOjMu9SJwRLQ4/ID8frFsdfftlKmp6wj3lKkreeR70ZY05SgH
         pFjA==
X-Gm-Message-State: AFuF++nDC+Oi2HlP+GDbchIdPOf7Lm5uiDxC1cxT9rQHAWW7Uh6+LpI2
	JLv3iRtUFuCFs58iZU7bjJmD9Gc46UOTJxfM94rogHsSUeWojBXEvls3WThXVicgDwYE1WN+yWt
	eUQRf2PqQzkChY6RExIyNnXkXDTkfldwdeLO/4KOEUeTWofK1mKsJAVg9+oByKEXpWDDA
X-Gm-Gg: AYBFou35sTdMA3Wp1JBk/h83Xpx+7EoerOamT0qcWmO7o8Bv3O75r5MJ116hxJtxNFO
	WwhjfQitbQvc5NWIuH2aJW6simQX5IIQI3CcYJmFIweMZSXSjbfgY4sWxkkmjU8DumtvMHi06iL
	toTY9E1lUWiNvx4+50aD4HPEb6KTbu3mnq3qbWC5nqOipRdIMVKWfF/+WXWHXpHSo2MBIuwWCkR
	ptjFkUJ/4s6u0m/9Dm4LOPYbXVW02K2T1U+ZTiKePSKkjhYvTr6zQMVSCzUMJTjuAJUyqHUe/Pn
	vmXGivNiuF2Yz6yEF5J6BjZTrPswakDBT8OevWJN4MmPnnINT4+9FOwexAX//n8d7ctRCmxSy2P
	StPYwrrbbqMx9j0aDncwF3Q==
X-Received: by 2002:a05:620a:4623:b0:931:23a:83ca with SMTP id af79cd13be357-93980be17f4mr2342010485a.4.1788851039385;
        Tue, 08 Sep 2026 00:03:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:931:23a:83ca with SMTP id af79cd13be357-93980be17f4mr2342006485a.4.1788851038866;
        Tue, 08 Sep 2026 00:03:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5497cbsm564096566b.34.2026.09.08.00.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 00:03:58 -0700 (PDT)
Message-ID: <80eb9f51-9cff-4c07-822a-759360617cbf@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 09:03:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: K8lzMJUtB7tkNo8BFNxWkhhMyXMa7wFp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MSBTYWx0ZWRfX99lrz0rXGD8A
 P+bBFzduYhbM3tC6ZJZISGZjgkw2pQMDDKIO0tYDOJH81CbcvpoFWcHc8nhV6dD5HbJJJnWOnU5
 m0U7v9TKxFDpnNjpZOxxHMxrmEk4O8s=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6a9fb365 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xJso4tAO6kuAywU0jPoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: K8lzMJUtB7tkNo8BFNxWkhhMyXMa7wFp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MSBTYWx0ZWRfXxS8ivDx0rZzv
 N3+M1iq9SPD3Su3F/0UkUWKWmrMfNHWjSGiqOepn4IEwFdq8d/ir5QVXnVLk8XsdbF9WvKHt7je
 nzum5Uh/DD2KmQwa8TR8gezeVm+3CaFwT/P27a/KD6uQptCVUDOBI94ipRBOXAvAC8pHcLrJcHw
 icv0i83Q6uxhLT5g7K+UR1QwaWnHxaLXKsWoAJqR7j+eAbYf6VBL3x7dlaa3yQl6QcHCTWAKWws
 BPJbe7+PIZNfAgzbT6HHoQz3eXcHN+nZggnoiPqr4DHlklRsiKtt2VDdn/02HWjcJBO8eSJZGCp
 vSk03lMQYptWsHMJgpwOhrV2TXzJQFW01UtThzqt3Rek4kih9WneNyOh+AqEQ2X/cmmoLqKONIz
 s0fdzmdwiMWG8Cw5tNJlEhN/VhX6BFWimvxMK0ItQyYOsvO7sTEKMYZYHi8H+50FNhUxYUgQQhG
 RFfc0lWO0gc8JsWyAcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080071

On 8/28/26 1:13 AM, Dmitry Baryshkov wrote:
> The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from
> zero whenever the GPU is powered up again and the timestamp reported to
> userspace jumps backwards. On an a702 six reads three seconds apart all
> land in the 500..1200 tick range, stepping backwards twice, and on an
> a530 the OpenCL device timer conformance test fails because
> clGetDeviceAndHostTimer() returns an end time below the start time.
> 
> Save the counter in the suspend path of the affected generations, while
> the GPU is still powered, and add the accumulated ticks to the value
> reported to userspace.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from zero
> whenever the GPU is powered up again and the timestamp userspace reads
> jumps backwards.  Accumulate what the counter reached before each suspend
> and add it to what is reported afterwards.

Could (some) a5xx parts use A5XX_GPMU_ALWAYS_ON_COUNTER/0xa879?
msm-3.x defines it as KGSL_PERFCOUNTER_NOT_USED fwiw..

Konrad
