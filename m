Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ADE3DAAA6
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790078; cv=none; b=jL5DYgiPC9E8ijRw3YvitMCq55m/7qc+rq7h5j+Xk+WT1TZnX3mFvjpF53XXt+TZRCwSZdE7rBi1WZzvIN0mEdJ/sTH8mNaw1zgjrEo09By8b2lS+rOOAZ+7kpPqtBtbGIQjCyBnz8Im+FsJbX8xcS8A1OuwBsFhnXaZg2I+5dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790078; c=relaxed/simple;
	bh=zAZ81sCJNAi3t6d0FfMfyie//p5p3THcXqqXzyEhH24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sQdnisRiJOQcmXiiQLr8VLmJPsnNW16BeHyuFdg1UVsyEYwss7ok1blRy/6l+gS08G53GP0K8sU/VvTMdDeqTJ6NeDezM9deRLWQ/0whZGSHkEQ8l92HCT0nLt7yvDrcpQxnIUbt3j296K0ZGV9ZQmNj//myN8XWDFbha2++a1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6jKxxWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSEVA4q2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6jKxxWN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSEVA4q2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N6Ahss093110
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5TBRc7bTqgEM/bqTiAcERw4iIbV60MFDEO8+VBa6JHo=; b=I6jKxxWNLtF377iV
	qFup9vK6zlfzQr8aw1C/Fz+1iiOA7p7wggczZ2nuM33cniG74Yb3KVvRbqS6x25l
	ZjDlyNk+lBUG8Ve3zUg4T8uDmFlTyv9Dffyr5vb2vDzl8j7Kxg+KMYew2sQEg5z2
	HHwfPlscqmBWbs7vypwbS6ojV2jkzcP54q4U3LROJz1OEDOIwpQeynBtrC9jJXo+
	9VCRHHhPJtBmNQ+PxG9L/N7IhJq+qOAiW7vl8EPyufjYtGY9clKkdrNTrm54u7DN
	/gQw4vGjD2nlNgn8iz956/IkWyNj30hLQWp0Prp6mGB/NSxKaKpda1mm45UtAIrj
	nbrmEQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xtrat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:01:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c856470fe9fso332438a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 00:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784790072; x=1785394872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5TBRc7bTqgEM/bqTiAcERw4iIbV60MFDEO8+VBa6JHo=;
        b=RSEVA4q24M6loCcao/1n2CjNngaQ5f2IpMkza+yUeeTxIBU1CKqaAMuE8eVryNR/pR
         xPIWbvmhZudxirjt5P3W+IDNhejpkI+1FfHeLCQRkcrc2PjlhKqY4gjnOAMfXsoIRqrd
         +9MVCOFZ+3KclZp/l8BlgKV/RQlClzaxLPvjQKAVKVyCoHQLoFrcbI2lWo954pLYdi+o
         XGpAJjA5ZQwOvAZ1fvkp9pdU5AfD6sniL5rumRljHhM8skS2VwX8xWAjVW51lwodzzkm
         i/xdiFy3hHs9Q0RAV8W0uYEk43mCScpgI4r/plQBNLv8VbF3UtE/oi9+7HpGtrxF36fI
         IBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784790072; x=1785394872;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TBRc7bTqgEM/bqTiAcERw4iIbV60MFDEO8+VBa6JHo=;
        b=rKEpJrrUZAbGNnfrdFNl/F+eQynia4i1XxmLBT+W1/t8TXJTGmZlB6jYPYjR7N0yg3
         zObdNdqcYTXdvKxATKF2VM6dVThNHbo2DY57IxdHNHhKvpuU72eVo9hbW2wn7k43AZ6c
         oDBrcp5wECl4LcmG4smCsirvjmBR6v4wXbx8W1OWptUqnNkEPXhf2C2m5RFKTBXGDaAr
         cFDeAUwsIbZTwvSFnl+8IDjP74S8ONxrem6pOaiLw36dfI1LI+UoeTjNgwj3FQTj7I7X
         Wou8VdGFTnsvPTsh0QlenaB5OS/U1eeFr/IemT+td3PTuHJCUBhB1UT1/XldjjgkvBQR
         JL9A==
X-Forwarded-Encrypted: i=1; AHgh+RoI6IGdvs3bSIrdWcVpFbGDRNoLB40bJFbsGz3XyMXaCBRW12XXdzvBTtca/skb2+jT/fEf3euALCbYloUh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/r0CG2hDpydi7KYxp8qI8aMhc84uL2Su5dJRsJzxZX1cWKiYI
	HfJfiawrFFhn4GVnCz9XrZcWeDjWsW1lYqZ4npatQsS1uf3SgdwaBzEg5tcBuWoD0vOWt+hjsrR
	sVWW9/fxfnOzytCiTUq896DwF6vrlcKn9Y1cHKaPWXPzZbfcfK3cRqScdN6hs96pSbRd9
X-Gm-Gg: AR+sD12o9aXbHfKSJP+5WEEN4+jTVMgVujvSDl0Gj/Z4g0YH/AtiC+fXLL8+ItR6WAS
	rdD88Z94S1zyDV/h+Fa2OhqAEDxn2n55idHZWxNtiiREMSFL1rKkwgSfvUG9uU+ju+8FFSV2Maj
	x6KAR1RCUryCPxfNMwwKdQ18L74WnnV+bZI74uq4BZwNs1IK1Bz2wrhYRH/e0H7Sg3O+006dNoz
	AQxHHFTIx3pQp1/ebJvDybwu2oNjO955paG7K1KJGG+X9RR2PJb2J4KQ7IjcS19Oxi66ro8Rz0W
	Ee141Ftx8a8x1k3Jr8dGz391nKz+cctAgDYP5zLSO5gU0i31SEIqQRrSSjod/VIrdYS9PcnRO6p
	4CfCozTRqg9Mqy4XppvNrE1cq8zSIF0CB
X-Received: by 2002:a05:6a21:338e:b0:3c3:8fc3:5373 with SMTP id adf61e73a8af0-3c44b1538ddmr1900232637.35.1784790071948;
        Thu, 23 Jul 2026 00:01:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:338e:b0:3c3:8fc3:5373 with SMTP id adf61e73a8af0-3c44b1538ddmr1900183637.35.1784790071470;
        Thu, 23 Jul 2026 00:01:11 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm21341064c88.2.2026.07.23.00.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 00:01:11 -0700 (PDT)
Message-ID: <71649d73-e7f6-433f-96f6-a9122c463d70@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 12:31:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: qcom: iris: Add request key frame support
 for encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260723-dynamic_encode-v4-0-5fd6bd549ead@oss.qualcomm.com>
 <20260723-dynamic_encode-v4-2-5fd6bd549ead@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260723-dynamic_encode-v4-2-5fd6bd549ead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j_tp69K2lcjbATw8vnuAV2qXG-_ZJ6WF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA2OSBTYWx0ZWRfX6yDf6zGU2dVK
 GWhDMwBwDQyM9oaXBggDbkAGRynswQ0//3RbJeB8ydNmJp5xHpGS6q4fOov2ptvoeqAZMRlhha7
 zRJX7mleu5sMfmvg6ndLovUa9z1HeNc=
X-Proofpoint-GUID: j_tp69K2lcjbATw8vnuAV2qXG-_ZJ6WF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA2OSBTYWx0ZWRfX2O2HA9fHi6TJ
 wVi9cUoCEmG+aSH6k48bRiFolhHyswbHT9TArlo//cUedJwJPvTctPXigfcU3Cq2T0btMr0AYDw
 TqeCg49DTx6W7Jf40OfO5tsqLKTPO+iSXfSL0xRyRmvbHOvVKwRnlv3GLU9try0PKhvqe1xRDdn
 RtoSZy8uYldBLIGoH5TiaBzoc/Z6M1TDiNtwk8VPtVr3kGbe+GFvE87m2L424MwwC5cwwL4Y3em
 B44c/PRGdQtllPWoaMvMxfRLgUZrBU55BgWQnH6HSz4nUkn5/X5RpmPI+tCkokchQcjyrVP5abe
 wgQsjOUNNUjrUUeRSCQsOPI5KO5KJj5QXv0Yk1CVn+InjZ4461VtRbhkxfvW1+DaVlb6iLKq0L9
 cocqQZHSHyiOwdBvRoJVhOaQdRQZCaNQ0IW2LDiF1DzMaWoeZJSUkRzN7v8C9E31Cen9KFZzh1F
 ewC6534cC8wOsjc3WHw==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a61bc38 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=BkpJrCez7YhOQuFup28A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230069


On 7/23/2026 8:25 AM, Wangao Wang wrote:
> Add request key frame support for both gen1 and gen2 encoders by enabling
> 
> V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME.
> 
> Reviewed-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
> Reviewed-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 22 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 10 ++++++++++
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +++
>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 +++++++++++-
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  7 +++++++
>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>   8 files changed, 56 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
