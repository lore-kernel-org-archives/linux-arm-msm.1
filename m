Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F7746A5E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648874; cv=none; b=DKw7mr7tFRm7cZoeSQij1yxmPGuBbRPeT9wR6IEY5knodsjve28ygF0c6RLx7+85fAGHxVJDzHYDAlKE8oxk6/oHp+Ode5KmODfM8qDYy7u66vRnYObzGs34NXDncU4+8aoVCJh8/KKZFYUfpn75w6iY8tyLKStndmB4GX6lV8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648874; c=relaxed/simple;
	bh=w7Xd+rjHN6jeQqJhbPV6IEbl4yUmOk3cFanvmCOiUGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HeDY98zmg0KJ7wfzobYjiFL2e3YRilElBJcf1jrPQN0psJb7KBIDopYxrmHoBPBh4RRU5Q/90cms0zcuh+/pNN5NfYc2GG/7qUurclo6eFqHT0FjWWc4SiSrECJ7yx2v7tYFzcTW/BF46/qayG8jz3zj44Qjfz+oUn3GwOa3eb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+EixF8c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EU+cyK55; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+EixF8c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EU+cyK55"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfn742962558
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Z2OxDaDEsanl4tBQsLQ91rTG7HMhdsh1GlZKUkWMr8=; b=V+EixF8c8KN4zdTP
	OeO63FLn+ms3Z4LpTR8xsgOdNrtKj/YcYggDdEoJqtli+leWX0SWdW0qnFf7OC3W
	vjXLXLX1aeLMXGqqJZ9TEpZ33b7xXBTorOFfqNeHjkrgEI0VUiCU2mV0Y9fQz6Jo
	WvKDzqyr2DXrUfOyevQIStKFgBjOtXnOBo5578Og0qp5ppZsIFzrSYsFIAKXuYI2
	nIgkHMgIMU2CHZX60zmYC64uVqIo8I9sCh0bvR0arFU7cA2IqIJfoCW2N2/Ro84u
	4U9SF2DomR3qhSg5Hk8PKqPsaUuhMFXrtFdt8AjHF7cHygHYUF55T7U5AQB4RoXB
	kOn3KQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nssmss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:47:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so6128886a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784648871; x=1785253671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Z2OxDaDEsanl4tBQsLQ91rTG7HMhdsh1GlZKUkWMr8=;
        b=EU+cyK55+Ygbxf/r0xyMfOX5BMilsGn6X4WIrqNGtCRv4X11vsDThaMnnh3Pzb2wd0
         Ef/6j84oqtOGLkolkrLK+1dIRlQJABXB7Tsq2x35e0DIVXu2qkF/tQi9lJYX3OWoOGhq
         vz2OCF3I5DJtxcg13pgzXVdA07LqH6m72y+SpStU56Vwc6OPpU8F0ebgdHSDuEavMaJX
         erRX6NwNhFsAfbLkqISopsMo9PQv8/lrWrKe5GS1QZDTOr6f/oBee/B9DUPz36Pv3V/g
         aBQ5ZinwbGXv0Xc9C+1i9PG5kyzZgFbFMk/kEoFGtgWA/rHdcVOcCjWgJliCIKDnia9F
         pdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784648871; x=1785253671;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Z2OxDaDEsanl4tBQsLQ91rTG7HMhdsh1GlZKUkWMr8=;
        b=gjPl4SIPewZz2BDqCE1NY+45peA15Hfof89fPG+6h81QRVO/SWRdXApICa1pGxWdck
         Nis195XOaMTQspbKGLsKEfNYUfeSi/eDxD8EJx6XE05eXROrhD9WxAhmBAausPDGwT9c
         5bedBf0U7JXZbKAVeecT2pZIKbS+XTU1A36GamiyfgGMmMuUFa7LnPvb1b8mhDjtjWIK
         FGzILKy7tMl+veYFlEZSBA+3sRFqTHjyiu7z6tdp7EhNSLh14ez174OEPeLOTbWSrcK2
         xcqCu/aTFLfKVkHTgLhpssudZrFm/DSgBtCqutZyzLRWn019RVHhJi9GGk498ON3OQf3
         X6Mw==
X-Forwarded-Encrypted: i=1; AHgh+Rql+3g8i96f2eRAWpZscAxM1/Oz8mVzUJJQd8ztKqlfc+YfQHfyEdr4gsIPLWc6AvxR0RVshfdFaaBDEXIY@vger.kernel.org
X-Gm-Message-State: AOJu0YziHIsLQzVoROdNhAc2/sl8JJ9fjhqQ+tRFzLGckBc1YXpbRShA
	0zIRcloynGY+zYvW7VFtnXgbP2CrwrHnxCXPUlx5Ld56L7A8fP82nWi25CrCVs0Ui02bE/eVdi3
	z8lD/pWxWb+jx34sTyGWefifcma5UDLDZpKQigBZTa519CnCMJP9PqPadKd0FsffxNjxK
X-Gm-Gg: AfdE7ckJ8uDz/qeM5BrhLVoqNncAHaiMwvUhVTM1tldSXvj+W1H/07QXRDLXyvZg1pE
	7X7d+mdLDJ2tVbX9xI6qMy3k5Yuuj39HRIaYqypBVI++zMPI61rEcCFe7YuNSc/0CvpBr4Pfz1E
	fDhJA8AIiqc+mkRR+W+tEsgMx4Z0xhjDniFkheppfoD9bHHNlN38kR/7yQxcNxg1+469U+0bIEs
	2yU5rlj3jK0DhDlflf7PiRBSTPt2UBqigHb91PbAW3OLqkgfGv9pVY/HOZe7sdMXDl5S86LIn1s
	BfWkE+2N4BhthjAulDwAqx1NjQIezFy5IxjOYFwYKiV/VF55Mwicnmxf6PSa9slXKxzIY0AO2Tm
	gHN/srE3VTz9rnMKksXkhE0XzKApkIvxJ
X-Received: by 2002:a05:6a21:7008:b0:3a2:7ef4:81df with SMTP id adf61e73a8af0-3c3ad7a4389mr21789510637.26.1784648871407;
        Tue, 21 Jul 2026 08:47:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:7008:b0:3a2:7ef4:81df with SMTP id adf61e73a8af0-3c3ad7a4389mr21789475637.26.1784648870876;
        Tue, 21 Jul 2026 08:47:50 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d0784011esm7959258c88.2.2026.07.21.08.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:47:50 -0700 (PDT)
Message-ID: <eca1f2b4-e3c2-4ead-a86a-e23d361bdb96@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:17:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: qcom: iris: add request key frame support
 for ar50lt encoder
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
 <20260721-shikra_ltr_support-v2-3-702842f1f3c2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260721-shikra_ltr_support-v2-3-702842f1f3c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VEEo4QB5UuEt3zjFPZnQEXJxLhJccUJb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2NyBTYWx0ZWRfX3ZTI3m5haE8e
 e+IXiejMW/ApBpq5Tk/cL9bN9xU1pYJHnrAx76BT2Y4YHr5GhAGB08qo84aqthSax9/0uEokGWx
 wgi99IVB81FYyGOcW7W5Dcv/q8tb/58=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5f94a8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nnydvRvSTfBi2-e1R70A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: VEEo4QB5UuEt3zjFPZnQEXJxLhJccUJb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2NyBTYWx0ZWRfX0HDb4l+dKuWE
 Pz9PvTgG/J6TG6UTbXRDuuGLM3FOmsZQJTmyYz6eYt3Tk12ihAIDCbwnI3yMLtXskytGzqFBlyo
 W34LloL1k1UaiJGiUTV7zjJzllw5vpy8CX4adD+/LFTqZqa6OshW+KsdhavstMxRZZqmfxvv3wo
 hJ4na0hAitboB7qnF3/A7WL7DPa9lJnY63zhWYHlb1trYu1FkxaQCQreLKWJDtsXswIsMVCAm97
 aRlPMGO7Nsic6J8YhKB+JQUpPAz60AOa1+jerksUjlpz+nde4XGnIAq760JzHxDda3uDeMPYNUg
 O6vKA5hNgiMr4/EsXZGeuXIsQ5QvEyrjt9UEu00cXq8E5fadaWeyx7yNZI/JbbqSYsEJAIW8J+B
 aJLAObcBKuFZjxuteiJ4tB2rmUMHMTEMPH6lRTgMNNmuEYRnyM/zvC3U7pJbZI2Eov6tIdnaLV9
 0RI/4ombTKiokAiiYLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210167


On 7/21/2026 7:06 AM, Vishnu Reddy wrote:
> Enable V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME support for the ar50lt gen2
> encoder.
> 
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
