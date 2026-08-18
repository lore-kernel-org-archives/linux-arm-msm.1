Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184A03AF65B
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046545; cv=none; b=pOio3bO+VZBYqYGTahkp3xaeD33jTwxyEYTl9b1N26cRWphtU11buw+NMWYEb7mRaAZNPJT/awNGH6LLPh2GSdOW1dFkDEOwPzcP4SL6DiMAfm58YvXxUZyxhZSHJfAHLZhGg2bjDs3dzG1PGDnzPm2bQj8u1pZ9ZigPQwvxYak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046545; c=relaxed/simple;
	bh=BSalRNMerJqm+c4gy/JBwF/p0B21/T9pP60CXsqs3Dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qg+aSIZn+lXnxN05y3KqybS387lSTAvZsq3A71AmhedfnhMss063e8XfaBjMRjTBnpDsjPM2MFdpTcGpEbBipPu3ynbPFqPDoY/2ETNfh9sOxSsMZ4LupRSbej89yZ1AxaAzGSo4JEOpCWO5B8JqEaStsST4wVq5foCkv/hYUfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fpv2gwNE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bFqB76YD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fpv2gwNE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFqB76YD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BMrs3991166
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vg4886UBjaM5jDA+5B8WNJXVBq5NN1PsHEk5H0Q8S4c=; b=Fpv2gwNEEZ6srAf6
	N1+1qnSzUtzTjVf+PlUOu6vpD0GudxkcNRBdLks8ILxEiRuXo9op+PFGj0qaqEv1
	7fEihUA5s93FV5O0vHMRleJ+f2Stgq2ZbsUrWby+iHWaOJf+m1GQzN0ABKE2O/+q
	lMF1rsC+HFfkg/Ez9AzzFhgWoqG2pTuHGs4W+KiQN4IuUNv4WnvpdPHfZ0OeRKgF
	C/6CDDvbxodRLayKc4rXqAyXK1BQU3eJ8M5UpSaGB+YrSWbap9Vypsy1wbTRKe8B
	eDwnS++P5YCDCjqpdPRFoq0tb0BPBUTxjCdWwGfXWiQZzVcrixbsr2gpX4ILh0O7
	TOsH6Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4f5psk13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:49:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930a312222dso27914885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 02:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787046542; x=1787651342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vg4886UBjaM5jDA+5B8WNJXVBq5NN1PsHEk5H0Q8S4c=;
        b=bFqB76YDf9nnGdLgijONgg+krrtCS8hsqPWojartis+iJjyETGETZDsaNUP7p010Xb
         HydPKieLyjdl6AUlVX4lEAGP07/KAvmhKLBk0vJuznmrsjbeDpSzDRNICLb42YlVIGPo
         yEwL+xf5xVV3YAnZ9+PQ2aTv7ZyVvoaX/e5NLhp/ecTSL7p8VC+1trYzBusFwmrwkEKr
         KSV8aLhDehZ2EvE1jpfoHCLYoImKoqSBGzHVbEhnMTKXiXpksmJcp/GDcJlm6K2TT5fh
         u4k9/P3NHz1exAdgU+jqPN0wKmplkzqD8/L7C3peuJccPabARCR6jGbH07TE2GrcIjAd
         +yzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787046542; x=1787651342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vg4886UBjaM5jDA+5B8WNJXVBq5NN1PsHEk5H0Q8S4c=;
        b=SepDS9XlnSm0Dqx40mUafkP+sEZsLL1HrcSGR71HPFwpanr4sGygSw+VIzUgoE0QWd
         qlz3Rak4ZjPUCiN95P1o//H7FY/gZeo1WKjBTnToTDEjP9FwU95sgVCT6E3uZR+q+73f
         ijbAHxS3c1z6YrJQhWxIph2X6oh4aHLSnqUssFHnlVDoNOsUzshWQPzcw5W+dJNqXjaF
         MZpEfE6hXNjH77jktdWlXkZCVWGUlF+dfjuOnSUPyvRh/Cvzc/y2MPKxvVUZsjv104zo
         gp1Vyl9OIkfIiQ54OyrWeduaZESCZes2JGu33hrZvIVNj+euAC+H80NCw8tRIFJuNCFi
         SY2Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro3u6NfBEHpRjQDKLZ3zttUNLh0uIElhgF/MSi2k8NilMkIaDO/uQgh4IKUmBzOvIuUKsUXviRfzsbBPWO3@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ0nCZC2RBx5CK+UaU99M8JlopkOvs06wZ5mhxd6H6nBGMWo9H
	wP8RhFqNaAmKYxhoEM4KPUKDjHU+wNoZ8OaLndXppom9dLw4wwd5GAC7fXIU4GQkZIVLEqRwfQy
	iI0Tj5GH7UxFzN7dTMlFejj1YYM3+wM+Egtj3Ikxd/bMrBS17fLan8QBHm8F2NXVDQi5/
X-Gm-Gg: AR+sD10lkRtIEsvta5rex9e17oqPVgbd95oru4Op+APqo8fa4FMT+enD4TCXPLVfX/l
	LzCLvuuY5fOh/4zbXxBkBOh4ccOdN/PhGTmHIS1xEiE215j/rQhwEbxLQpzXiytcfL9897mdehb
	0ZkkKFOuMK/yv1RXFR+gt0d1pjoZFNwbOiO+etb6hbo9gbZAm8aHuZZzsO56oX90r6x17xBkFWo
	J8tMGa7pIWl2/anHoudTmpZl02OC0UWQJYcxd9Z9lJ1eoo/HXzwUC8c3wQk3Z1H77QVb+RmK4Ig
	tlUQx+0T/Vsx16bmOe7U0MKlQKd1aHkZ+H66vtLesDoLuMO3JMKftYIOItVJd2BAHGBa6DKzi5L
	TFtlD1HaHADs97kNKu5Ge8Y/Y
X-Received: by 2002:a05:620a:3712:b0:92e:5ef1:9072 with SMTP id af79cd13be357-936d235399fmr2328536885a.2.1787046542225;
        Tue, 18 Aug 2026 02:49:02 -0700 (PDT)
X-Received: by 2002:a05:620a:3712:b0:92e:5ef1:9072 with SMTP id af79cd13be357-936d235399fmr2328534885a.2.1787046541792;
        Tue, 18 Aug 2026 02:49:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe69cf4sm160289566b.3.2026.08.18.02.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:49:00 -0700 (PDT)
Message-ID: <8728ddab-ec45-48a3-b2e0-93b85938d8b5@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:48:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: skip PUSH_IDLE when the link was never
 enabled
To: Jesse Casco <jesse.casco@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260808171325.133041-1-jesse.casco@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260808171325.133041-1-jesse.casco@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+/pBosP c=1 sm=1 tr=0 ts=6a842a8f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NeJdD9iz2wSp6K8K9msA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: vx3UFGeCrNzD7zNQpkB_FibzwmJDz-PQ
X-Proofpoint-ORIG-GUID: vx3UFGeCrNzD7zNQpkB_FibzwmJDz-PQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MSBTYWx0ZWRfX3yhzqU1yv6hs
 kRAdK30GmlPmEXiQI31zjnRyoT4DBee1W+p1cQazhrMbtiMwMIvmk9rQ7VBtJVw4vNPfChSJKFr
 dkGdRYBtB0Hn7HVN8qnINL18Gv+ngApIXPT5slfOsrrL5PXvTWO6VdhlIiVXcVL2L4Y2BEj+lnx
 d1DVQuQsNUScsrivFA48NwayTsVBsv8NYaObUXyP6ANAKkeJQm6AAfVAL2mrpE1Bc6ENe9epHJV
 1mB2edWlvKUhrachLMwvINzmrlGPJdmGnHOClw2NzzaCh0elIGFMFDG3Psq79cV/ek2r109mzH4
 oc3Rx9aLQmMJR5wahXi26GOtBpM3lB+Dt9FmlKydogpZoAaQ2VYAh5sbmVG+w6hnsuIuTaV3tqO
 rR7dr/beyQrQLexU1/l98GYlArh7nyPWTiP7vGdcfX9ZwrWMbpMoEQfl66M85WZl0Z9ACFWETqf
 2Lroac1v9/JQnxjE60w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MSBTYWx0ZWRfX4J/NmV8bSxkO
 XhkzeqO86+vjktsUV1NtX+bZK0rCFM5FEskKB0J8xCkn34AquYeVSy90i7yfuQ1Mzi3jyD/Bbzr
 1CYF8o7PwgADuAkM09YPky0quHLouXA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180071

On 8/8/26 7:13 PM, Jesse Casco wrote:
> msm_dp_display_atomic_enable() returns early when link training fails,
> leaving ->power_on false and the main link down.
> msm_dp_display_atomic_disable() nevertheless writes DP_STATE_CTRL_PUSH_IDLE
> and waits for an idle-pattern completion that cannot arrive, so every failed
> enable is followed by "PUSH_IDLE pattern timedout".
> 
> Every other step of the teardown is already gated on that flag:
> msm_dp_display_disable(), called from .atomic_post_disable(), returns early
> on !power_on. The PUSH_IDLE write is the only one that is not, so the
> controller's runtime-PM reference is then dropped without the link having
> been taken down.
> 
> On glymur (Snapdragon X2 Elite) the consequence is not a warning. The SoC
> does not survive it: TrustZone force-stops the SOCCP and ADSP remote
> processors and the machine resets silently about 50 ms later, with no oops
> and no panic. On an ASUS Zenbook A16 (UX3607OA), whose eDP panel does not
> currently train, this reproduces without any compositor or GPU involvement:
> 
>   # eDP enable has already failed with "Failed link training (rc=-104)"
>   echo 1 > /sys/class/graphics/fb0/blank
> 
>   [535.645455] === marker ===
>   [535.694833] qcom_q6v5_pas d00000.remoteproc: fatal error received: \
>                  sys_m_smsm.c:512:TZ force stop
>   [535.694875] remoteproc remoteproc0: crash detected in soccp: type fatal error
>   [535.728857] qcom_q6v5_pas 6800000.remoteproc: fatal error received: \
>                  sys_m_smsm.c:783:err fatal notification received from TZ
>   <SoC reset>

FWIW the rproc crashes are only a symptom - if the system is going down due
to (among other causes) unclocked access, all remote processors will be
forced to go down and this is what Linux sees

[...]

> +	/*
> +	 * If .atomic_enable() bailed out - link training failure is the common
> +	 * case - the mainlink was never brought up and ->power_on stayed false.
> +	 * Driving the PUSH_IDLE pattern into a controller that was never
> +	 * enabled times out, and .atomic_post_disable() then drops the
> +	 * controller's runtime-PM reference without tearing the PHY back down,
> +	 * because msm_dp_display_disable() returns early on !power_on.  On
> +	 * glymur (Snapdragon X2 Elite) that combination is answered by a
> +	 * TrustZone-level SOCCP/ADSP force-stop and a silent SoC reset.
> +	 * There is nothing to push idle, so leave it alone.
> +	 */
> +	if (!dp->power_on)
> +		return;

Dmitry, should we even be reaching atomic_disable if lt fails before?

Konrad
