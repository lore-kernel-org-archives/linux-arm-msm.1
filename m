Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601938;
	b=X5cS9XAKV0tGC7tOXeMVmYN2Btqw17FcR1mkypyiqSAnhrcfgnBdqdY5mIVJDVLS7kkd
	 D+ARlwzwEK12NKkd12/xwWG+HfFLGRgq8OZ/UtlOSgqBuopk84GiHTVNP3IZuiGlUAifN
	 CDWy5vwhd7FdUuYSApk8Rj7o9zaZnD3okF+KhyWZ5auZxaZsGPwKKWk2y2dyaDHwLBo3G
	 XOBIRtD/6bF29DdC78dE1xitwxNWR36hflUWjq/6p+/iCDbFs80aDrJDBd1gFkbwnPH3R
	 +hxQqi/x3oW4WY9jpn1T0Sd0xGP4y91nGQcr7E+/riWeyGwvQczkgWgj7pH/8BxUpWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qgfBpFM+z2YBeezRZEwdMFkwU1ZfAT0p5BExL/+QJaE=;
	b=k408QIJNQnU97YS4UqZohU9K/XUdptjS+xyw6tVGjbjPx3kvJN/ubyPqcjhqWdkUnjQV
	 pV/GCGraNIXFGOhjR9LrkFs5IqjR3p/FIaDmauZIqGxvQjYqJPyNndXBx0EsBQQwCKMtp
	 ofFZeFTnvueVV/YYGPVca4DpCHxlPmtMtNKE29h7pCTvM2MLgcvi7fJbFy3+EM/5rmA5S
	 mllsPmqMW7v8IYFDOPZE2p2eKnKxg/kbidGDWXhZ6c/phc7aa970dUp5IyegafKMC+HD4
	 aYsCIXHs7N1vF3iwS0KfViAeYA6zEVkCMUMF0/AoNnQmDctj6HNyqB1BRwMR+p59EeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UlzkiCmy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YWsGyCBf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF77606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF77606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UlzkiCmy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YWsGyCBf
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9moVh3611838
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgfBpFM+z2YBeezRZEwdMFkwU1ZfAT0p5BExL/+QJaE=; b=UlzkiCmyHTJB/y37
	5duvhkt2WYUVV2iEzzGE59afXH0OzbrZNvqIJo5FDb+GbFGiDqMJ1JmiTNA2kIaI
	QKcSqSrEd03iugMw2D7CrdsIMFq6/bk306S6KExjZ/VpVZ9gBzqo7fYtPLnOCEd9
	/ZowfVrwVU2EjJi62/g5Az+vb9MwKAmSvG3gzHPAK9SmbUtIVd98/CzGz5bikF8Q
	XfKzG13XWsBRZyA0DFfhh9IAnp9K/abcVmNO37NycEmZ5nvuWwasb6E3BpWUCS0C
	Iz3BC7my1zQ72peifXykvUoZdkiy1ShCVt0FmXPRCeIP6JwhKvqD4TPQXQ/yTM+p
	K2OYRA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsb3rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:18:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530cd3dff25so14257321cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601936; x=1796206736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgfBpFM+z2YBeezRZEwdMFkwU1ZfAT0p5BExL/+QJaE=;
        b=YWsGyCBfUQFi2YvI4tdS8b+hf7hYCTuc55Lpb6Xrx/AS9s2Eo/Np0nACBoJfYU3JGV
         RcsjtTOWIYAuv8d8JSzOrECzguumws8mkynAMlj3NGlGL4ioo3pullhRiFwUGL7yUg1C
         /tdU//QB31lrrndiXElc2pwjYpgjH5YaJSmpZZ7avAL85otAklPwKfNHwHM1KxAFO+TA
         F2MJ2QVVdM8G46EF41FwmErK3UUNiAR/OA4Ts2DMjERqyuapPPA9abkTPddeQVt9120T
         ImeXArbAHwLXDpKlSmcLhyx6yaJ9XQIUnT/NVT+K2J3gVUVcrX03NHOQNX602Iyn/CtU
         5JtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601936; x=1796206736;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgfBpFM+z2YBeezRZEwdMFkwU1ZfAT0p5BExL/+QJaE=;
        b=QmyYGqTCsDHiilzzpR5zTyODe5hhNIoczx0INKWEYJPJxxLwbJeKo5tVg+KawaoUwz
         Q758debKVidgqvNhJvYuWhs5zFNPZDXH2iG8okoXxxUOznBgqO5BgprXZpTqRLGatjPc
         Pm7pFHfCEzlJCV4UFBugcPLHFFsHohYKP0dl8YZPkqsdcyhIrgc5GaHIF0gvKye6DmIz
         UltFC5NE6UYHbcwtWAGFTAlOurlrHJzAqRhsGD2dApMqm27O6d6WYQaaNFEXAzgRl8RQ
         77iqUCTcE8wQjaymPWG1yW6ig4z73/7gdKubf7x10S2A/9TiIvI0eK7qG4J/X1b9GDo6
         rCPQ==
X-Forwarded-Encrypted: i=1; AL+hErHRKgDKlbqWOldmEw9p/spZcEbSUfFhl0MGo0hdMltgVJMc5xSR8nIH8zwAVaQndwqjGqXkUP/BilSvzVX9@vger.kernel.org
X-Gm-Message-State: APuU4Z9RsAOTW+maEUbN+UEz3gQF2WU2K4iiEKNvdu1KJPbzBlz+nq3t
	w+PqiN/z5ZBabktdkdPhiLjTlgFgcN1ifNVMPaZxsPxaoNPu0OcZ+U7eIJ5Ioxv3o9ru9aRnZtD
	ODnvvEwn9ZKTvh06xNN4LfJ8B9als0i+cLFewS/W8teegsS9UoD2unf5WIfqvGM/Hy3em
X-Gm-Gg: AZFdTZetddYoBenK+2QQBE3LN+V7S41PbA8sZiA/6tuy4IiOKnHDFuoUIU2fKWxFhx3
	u68TJixImFE46hXy4+iCTdpn2nybPNhcxG/2YYR+RZ1jDYgXQRhohhchJK6G9TyaI+R3VjOC3/O
	lyoyF2lNxYs+XiVTjomGB/65tStmZIgvS2eALb2hEtW1nvArG7E4U3VWd3PM5Xkac5Px6nTZufQ
	tyTNr70wyMf/Mk9YkUAcmECdLo5rru4tlcPdmYPdv629Z8fG2SdQeJIAqu3Wx90pGwuYVcDS+qh
	+2WIS/OKOFZyYMqiw1SAvLEOM171+uh0HM4sRNiMkBxTDDcXLs0HowRdDH0kibRiY5jxNdVTv3k
	H1oPciJai2Q+HNZw01LC2wtsAdJK2H1uLxQHM4tr8H9XXRT55qgOSFtODVDs8g4UIbezXrH0=
X-Received: by 2002:a05:622a:ea0b:10b0:55d:3798:5ff3 with SMTP id d75a77b69052e-55d76ad4456mr300294261cf.5.1795601936052;
        Wed, 25 Nov 2026 02:18:56 -0800 (PST)
X-Received: by 2002:a05:622a:ea0b:10b0:55d:3798:5ff3 with SMTP id d75a77b69052e-55d76ad4456mr300293971cf.5.1795601935658;
        Wed, 25 Nov 2026 02:18:55 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68284sm629439566b.18.2026.11.25.02.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:18:54 -0800 (PST)
Message-ID: <0a0544f0-9999-4c35-b370-0ab291e3cb62@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:18:51 +0100
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
Subject: Re: [PATCH v3 1/4] media: iris: Fix runtime PM reference imbalance on
 failed resume
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
 <20261119-iris-handle-unbind-v3-1-52d467a13907@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-iris-handle-unbind-v3-1-52d467a13907@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9XlYX_dvqgCRYAACxtCv334M7s5ewI4D
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06b611 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pyCJf-qXJP2HTA3QtQoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX113vH/mprpvB
 ZYFAUxrRQrxkE5USNE6iKit67aBvtR2PVnnt25IxEhCAu3prs+EtKZWqa2vCAgS58yhFplg0qvc
 WADxNZrVQ8hEqGu2iHr+ynlNnkr/cpc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX5PCK2kqYJq5T
 rE61YHOd3xxZcZfgwiAkMh+RfG40zC3MoFQInoPPBxVrgBiMT2oYroIzetULe6AC3wUkv2jNBj3
 aaSyZcUnr5w5zVzuLvbcWOzjx3aGLGBNjKrpO+NAM8J0Cp9cbnQlNzqHyf0qyTRRrlC+S0FfGJb
 SEvScb67jLFFaojJkkR70ap92car77h7hYOgLJxyUhgOxpuHwJ2z1Kf6wK9XeyuD9+6paMkVGQ3
 ++MFp+H5zaffiRhMgUxfY7HAh7vL5j9ePIVjXciSVCDE3qFkvZpmdaAxcQanz+8gz4w0yxknkhL
 3J25wpzio62l++1suUEBRVRVWpVH4n7ucBwl4gE4jNwlEeDstMJupPZ5I6zXfsEYa22kIwLkwou
 KK002frd6S504LQ4WF+yW7SrCWq+kdWo/iRZnvz8qN2Y0rIxhZqvstQKq0aG94b23UY/uAHM7y4
 wdOJ60KuTZ8m8Fy5NTg==
X-Proofpoint-ORIG-GUID: 9XlYX_dvqgCRYAACxtCv334M7s5ewI4D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

On 11/19/26 12:45 PM, Vishnu Reddy wrote:
> pm_runtime_resume_and_get() drops its usage count when the resume
> fails. iris_hfi_queue_cmd_write() dropped it a second time on that
> path, resulting in a runtime PM usage count underflow warning:
> 
>   qcom-iris aa00000.video-codec: Runtime PM usage count underflow!
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Cc: stable@vger.kernel.org
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

if you want to go hypermodern, you can use
PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND (or another combo of
these, defined in pm_runtime.h)

Konrad
