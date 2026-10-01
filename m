Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABA83C76AD
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 07:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840913; cv=none; b=aL0pXHVbHzoy5jIG7YplVC7F/soi/nkgjDekXANBvsasy1CKNsd+hRU64U9sChmOpXw6Inn8SHiUvHZjJNFdrnUmPyafideTSz2wFHLcT2HtqCOy19UFl/9BNQSY2Bcwd8c8DMAjKGfimZJlj82jXt4IOPx8YwaYp5Lf7ZO5dxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840913; c=relaxed/simple;
	bh=l7UA7Xgr4sL9aZp+d9F3ZQnQjiF7VA/iVCyY2p6aaAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DtkoLpLHo17KXIiF6ypuwLZKtxt78zfD+jHQVHla4gi5rAjiwzYUpS/GFdYpRGITcn3nC4OaibC/47ykxCiDPoKjtjGbamULFPd1zHux2jyKhBLNCWm4mXeAceD0KCvh6O9sLUOAa3PbRdbZX7LJ+4VHB9jfU59+bfgq7uKQCaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddDKURof; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cBphe96/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddDKURof";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cBphe96/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xjal396111
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 07:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iUE/x4AAkeHFO216HIlMg4ngpja2zUSnzj99mniJ9e4=; b=ddDKURofQRcQ9hYy
	Hq2aYwXGPVLXz+PHbeakAa7UV5gYiFvF1GeSwOqA8BykI38LrnOhvd2BgvVNGh9R
	8IhFbBaieVVVYQ0aSNAGDSTQO7lwLm5GIK7uXpU4xpNkOVl/o/8Gs2mHybN2WLwb
	xVQkwFMjVIoGVXIFd7WwA7XqUmvFgVY/Ne3CLan3ojNQSQhU+GoDPq/Gogk4IrzY
	Rxcasv/xQYbkCrPZtxxjVjO3WyMufTTbhIAXi0QpbFxTOg3bkKx5ShEMhQP/imXm
	Sjw0GjE8+ZRSqEm5NKvj3G0NJ6GOYnKT3CbFpy2h/X//7Nuo0bP37MUcfnHfNNkQ
	ewj3eg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh59mtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 07:48:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91795e52969so4208726d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 00:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790840910; x=1791445710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iUE/x4AAkeHFO216HIlMg4ngpja2zUSnzj99mniJ9e4=;
        b=cBphe96/4sy0q/tNYGCHwJyF9aKA4HYS2lnc0Plqn67F4PYtq4qaZu/Xf83frA1Twi
         yV84XPxUU76Lpaz1VYxyj6uDoczB74eCAow3ob5vM5Kn1G28FOlNlOPYgdsQ+HaDqDkC
         o7yzgrDixXKCEGPXkk8i171eNeI/46DK85nndptom28ZdzkoYfJyK0cYkh+vL7y13edh
         DSD/TkPxZUWBl5VHhsUwt6Ve/DJ6KTvdSQA5HSs/prPZBlFtTHCr4fmlL/SwazN1C6B+
         IhoLOfRHjTKTBAaeNeuR5mArw0sbaRpQCgQVk8VSZNDKd+EmxDy178WDZ12WaJjnAhCT
         xoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790840910; x=1791445710;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iUE/x4AAkeHFO216HIlMg4ngpja2zUSnzj99mniJ9e4=;
        b=hzyCqhUAHrJIuCWTrRhK7ZzQ6//CyyP0MyrTvrjoJH1BAXG4gdUh6ud69WgAoQGG+R
         ltXGmHgc9m33ZmWqmXjmJoM3bAbGgjpSe8Uh8t0Cfqq1saPkahdKW/J+MjSuZCHUHWj9
         MsX1ypGzwoIzVUJgGURHs5Bai64g8V75NkiDdMk96AAiiMPP7WFO2QBNxxr9OQxwn2LD
         2H2qAmf2iz4MXaki8t2SxI7HO9EvLIOFnZXh989JAXHVov85grtACJDFzWpY9Wo1XQEd
         9uUMj5Z0lrafLtw0hrtIbqCd4uTj/j56ej1ZVd25KICNe7nYU8dayJhoKouO4Tu/2rYW
         4Mgw==
X-Forwarded-Encrypted: i=1; AKwUvBzyH6fvABY2jV4zvOnCf0mJlna90MmrHTnzQ1LOAJsof65vxJtfZgkZGofve6KUVqRpBjNqRrbYgPHHs22T@vger.kernel.org
X-Gm-Message-State: AFuF++lh3NJE6gh5sKyRjUzJSkGz4y0EodGmKndH0oKk1PHp1LS0o5xB
	BXpFj1mqeTKxYZOnLuBCiBpB8haAEx3SkwYelUjllTJp5CfUyIkVlJNQ8SK7FnII2L42npiC6y1
	0eeMraWTO8V7dWkjtkSwKPBUj7q4JSJcmyNcl7bf8vQwQO9MWSNb4vkI7WP8Q7qigPfKw
X-Gm-Gg: AYBFou1hwCDG0XbH+NVWrUm8KsxdCoDxlbNl2BEIitaTous13QKcjfoOY4J5GvsMwq9
	GROXywblH/PxiElDQ+0HhcyNsKQvbN5iz+6n2x8hWUnVIf2wwao3ocpyn0e2RufchKRCXs+wd9j
	irlgBHPJudo85sABjuik5aVmIzCSsxKtbYLM9ayEX6N1JokalHt/GFJI4QW54vPJ7DZCgUQNC3i
	H1qZ3fLYKIgYe65LqYZA5jboi18iJf99xT+4iNshJBZ6XcOZaWogKU0LsDMMkAqyahuPSQTIrPb
	kIdpJmZ+FrNfiFMTJq4TxjxBEeLVbAWEcBIHMl9nCE+QFCcceOHt4zWnwmaJbm3IcR0n0rsilKU
	7WmRmRDEb4kD6iNFXfA6DRw==
X-Received: by 2002:a05:620a:3726:b0:939:94c4:b799 with SMTP id af79cd13be357-93ca9776d92mr691546085a.5.1790840910273;
        Thu, 01 Oct 2026 00:48:30 -0700 (PDT)
X-Received: by 2002:a05:620a:3726:b0:939:94c4:b799 with SMTP id af79cd13be357-93ca9776d92mr691541785a.5.1790840909631;
        Thu, 01 Oct 2026 00:48:29 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae4c7efdbbsm597303a12.5.2026.10.01.00.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 00:48:28 -0700 (PDT)
Message-ID: <557b1ce4-fdcb-42fa-baab-429c53830129@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 09:48:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a5xx: don't read the GPMU registers on GPUs
 without a GPMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260920-a5xx-no-gpmu-v1-1-714200254f76@oss.qualcomm.com>
 <1eca3b55-fce3-4a39-9e0d-2c6d1fcd6a86@oss.qualcomm.com>
 <5ibc3ap35a75ovwrhyeq2qrc55qo6zx43tsp2s5obyukzlivhw@n5tgfcsslxrv>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5ibc3ap35a75ovwrhyeq2qrc55qo6zx43tsp2s5obyukzlivhw@n5tgfcsslxrv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMCBTYWx0ZWRfXzCEZermnsIFo
 7RLnw8O/ymES1nJjSd1ULvdalby4VLDdSud1/iguh6QPHmdEKEGCVf40t70HTIplTLfzHr6vt6k
 7UjZG2DhQVt9DGNmwYLJFKzMbX5oiwmO2FkXJbI+7e/MLmDMbBwXv3Ffc0h4fZbL6a0EFPmyZZ9
 diiZgD7AdlWzhjE5H6q14Ywl4Vl7Wqq2dQmHPXj3/PIaPmF+xaERtdJSlMW0sQ6KIbkB9P+Pm8j
 djgWj+IfeMV+lVwmQsDr2YXcs2jKd5kjvF4mJwpnMz87GrRkOYszoJ9Wlbhqwi99prsrMdDf2/Z
 VsuhZ1vHv7n+hqLzQIjshYf9vEp98W065TuoB4FsmHDMtZ33AiHCljiIgZu/XyexGZ1EG4+1YOP
 weZeBAxeoKhL2M8LAniyMbjvm93jVfxn/6gyjZWpwBQBt4uV502dBf6oA1Y27dtGQumM6SDCkU3
 U8xy/6FhrKLja4Oitqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMCBTYWx0ZWRfX71Vr+efLxavf
 4n2fRGG8pibR6UHxYeIC1VQwD9TqoEQdYT/wpj6bktz6TgxQXyj52FexezBhUwt7sLYAz0LGY51
 WZ33X4xWWkRl5sapSRNehdF6f9sQF6M=
X-Proofpoint-ORIG-GUID: dvQZwFuhP7V1KNcjYSohzbXJgv9Q00Wa
X-Proofpoint-GUID: dvQZwFuhP7V1KNcjYSohzbXJgv9Q00Wa
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe104f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4YALIuPG6eELS2f6wpoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010030

On 10/1/26 3:53 AM, Dmitry Baryshkov wrote:
> On Mon, Sep 21, 2026 at 09:40:35AM +0200, Konrad Dybcio wrote:
>> On 9/20/26 1:08 PM, Dmitry Baryshkov wrote:
>>> Only a530/a540 have a GPMU.  On the other a5xx parts, reading the
>>> 0xa800-0xac60 GPMU aperture during a crashdump resets the board -- on
>>> sda660 (a512) a GPU hang thus reboots the SoC instead of recovering.
>>>
>>> Split the GPMU block into its own array and collect it only when a GPMU
>>> is present.

[...]

>> I'm not sure if there are holes in these ranges in the hw, but msm-3.18
>> (8998 kernel) simply has:
>>
>> 0xA800-0xA8FF
>> and
>> 0xAC60-0xAC60
>>
>> (both ranges inclusive)
> 
> Yes. However these tables list registers to dump. We don't need all GPMU
> registers (and even if we do, it should be a separate patch).

Fine.

GPT points out that crashdec doesn't recognize the registers-gpmu section
name, rename it to registers-gmu or fix up crashdec

any which way:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
