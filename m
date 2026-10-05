Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B65747F2C8
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205235; cv=none; b=t+UCfR1ke6IGByj34PDEI/aeXSUH6Ip6ETfWzSRhHMf7nzL063eow/HRoFw0ad9eHc3Ehh/pryP9RebAU75LKmAtg7ISN9NuYKDc4KF+WVV2bkeLZHq0jnpJS364wo0Ztt/HJfXAjF+eoSi2nd2rWJYlhf3Dhz4JZukn1zvi/5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205235; c=relaxed/simple;
	bh=y/DOj5Kxtb7coTB6QB5NVnMWGcNdmwOCmTlT8mckYQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=goMHFwCVRiJBko7UtDFumBjv+vBQn+77FxsC/RBj0brfldysrtQzdkhEQMQWpT1QdUR6TN85GwpvoBJ7RLKRbEG+ynK6kfewva1BfsFiB812V21Wj9FX3r3Xkg/zHw/6gsV7sAtC16NnDkXOOpcx1eTQAuvEt+7ZYAAMsFjiyck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ER1teMVN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UjvDYe6y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ER1teMVN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UjvDYe6y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFh3S1893373
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 13:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BPfFEOFQnUkSvYmpAmpRp5GRqU+z/sLm9AJz2jCuNpo=; b=ER1teMVN7KwQmU/5
	3Tk/S1h0H6gRZldInKL6PDosLB7EVaf3Vb5pvhUdzRp8bEKPUwWwyPvRdmDsRTuE
	Qb4b8BQBOsQk5jc7gr12BxIyvO4JC362XJ3zYDvUMBDmq2BmC99KA86Fx66b/nSC
	FDklqorkEW0OnTo5B2NT1B7w+zSqoRZmAA17t09Mc5V9hTcigi2R25PhiR1bZ+pU
	G5ImtczX15CykX2lDjftYDjV3yVhM1H1t0WqxGfOM9VCmuW2qaWYRNYQhR7l4fKm
	ERtKbpXh86YtPzYrHfEuss8b0P6mE2/OE9DtUfn/x0wsvBRhmh7hDO13vVLffR2R
	oDdRNQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssudwqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 13:00:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34d62bb27a1so7511542eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 06:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791205232; x=1791810032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPfFEOFQnUkSvYmpAmpRp5GRqU+z/sLm9AJz2jCuNpo=;
        b=UjvDYe6yZFhlUaHsPWrBx35Y9ZgvVkx5NJxryJta5uXVBeOJkGs5Hfzt1M64BJ+7E9
         FQJWfApn1e+/PtGK+0O0EWsHq3sIjPNL8RteAfXJpDdzci1oXKoGQe0mljhsfz5TGGHk
         4h9/rftXNTL1EqXeDM3A8s4A6SkYwyXSn0P0TGhS4n8qnRy2ZtFgw6FFZFL/VEKdAvOg
         4i2lpc37Q8Mh4vZeQNEUY4vGSb1RWU+k4p3a2HkE1/ArCFz8uu0j8GMngBFFbnzX5MkC
         ToCWLyDp11j/lX4JI98MzXZ/VZAVAt5bn1wEgc6PTXWhoGj2/CJk7lUYvkuGqFVKF33d
         1peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791205232; x=1791810032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPfFEOFQnUkSvYmpAmpRp5GRqU+z/sLm9AJz2jCuNpo=;
        b=eGXZTm2CJhEaZthsrdZVvEOV5ENNZHavXcvclQbjXAORlV0QZHD47hC1KG3uY+wh/u
         svb1Y9JZvH2XKfLLtagGzREI5cKA+eiLf1TvQ0zlqF24xAngRTRNZ44i9DTd+YW2qi79
         jRm5TfzmCaXz0I47V+ugRGLiMXWOIDsSyIyVcNtybXRD9+3s0ISp7AkJTHyRXrO1dXpK
         LTy8yjrZpwXO2lVmkice3EKqPEd59kvLmbMrXPIzRtfV7j4rMsgyiXLHIZ4XUjBglASb
         a9YDGl6B/UK0oWxK5zHqhvuxT731MpXgDnN39wgZ5vr1hWXhh4QLwAwF31/s18aTzRo+
         XH7w==
X-Forwarded-Encrypted: i=1; AKwUvBxfRevCefi4mFVZB3pTTDlQSa/mRbCkBmUdHlH4y/NhKA3ypa0BGLz4BstFn6ud5+uvMFLNtmC0zbE9hfoi@vger.kernel.org
X-Gm-Message-State: AFuF++kcogGtmcLVCARvY4ME081EVQubRe3OclPlSbJCygDvI6oqz8M4
	y03WBrjZjOauXgMXWi3RfNLe+RMoN+yC6sAjJT28Yinc/lm4gsE/RgKD5xbLzdgd9avfi4GWd+x
	iY7X0FH3pMUMXs5rlcq0Ao2TFWqCAParvIDqx8tLsJA7KaWOo7CyN393RVpo561LAhfbx
X-Gm-Gg: AYBFou0eLVq1cE5as8cUon+kcMPt9qvI5S308aCzUx8GsWAUJSXVTb+nQ/0i44alcRy
	eCpIJpdjVU5HF1h3Zp1P28unfcIl3hScg+KrszEfhqjs0x96MlFBAq0iujUtrAgl3AK7fixoZcz
	9GrozN02OWcaz6bE3sYeBWoBihyENSHT/5e0nZzeMJqNA6JXDFMwgwegSBGMBKhu/TyaeCqVCq5
	Il88asYo/0Qxu91yfZoTzBr762bYyNKu8X5FTObCswe+EKUU7I5AG+sB2iPW55X7GRQRgL7fXIV
	rA9LWp4svjnUHL2kaauBVovItI8bin0rWOaQmPiHPARgLU4JKTiHV+PBkOzS/LfpAAnZldJNmR6
	lP9F6BagWK4h1uFKsb958TMctZDtRpe8jLQ==
X-Received: by 2002:a05:7300:24c9:b0:351:2696:bf86 with SMTP id 5a478bee46e88-3512696c138mr6042729eec.14.1791205231660;
        Mon, 05 Oct 2026 06:00:31 -0700 (PDT)
X-Received: by 2002:a05:7300:24c9:b0:351:2696:bf86 with SMTP id 5a478bee46e88-3512696c138mr6042580eec.14.1791205229446;
        Mon, 05 Oct 2026 06:00:29 -0700 (PDT)
Received: from [10.204.101.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351271847fbsm22548670eec.15.2026.10.05.06.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 06:00:29 -0700 (PDT)
Message-ID: <17c38615-1689-4bb4-80be-6aadd3b91d18@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 18:30:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: iris: Retain firmware confirmed video_format
 across GOP restarts
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-read_video_format_from_firmware-v2-1-21a606cdd288@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260905-read_video_format_from_firmware-v2-1-21a606cdd288@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MCBTYWx0ZWRfX+OR/gyZrBM7x
 TQ5x9VBbL09OQwGWhrCP+Ls96u8sWwTHP0jOlftJIpeNW1mJwuVWAAzYAgyePzIj9/qwCGDm5s6
 H1f6xl58OZfbHUOAaZuxEMGdgWv6nbM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MCBTYWx0ZWRfX7wi1CThHSsry
 EHk0aK81dyCJ+chWDIIsaUPYKlUT5DS4mWkRLjzUPEvJKAqhqoxd37x8Vd9C+WiHvrLA1LStipP
 G/vqMk4Uklfhbut3Ov6mxJo/ItFtn9QT7Bvl/VjRhNu+jgHSWDbioI2W2vF/YBvrcsZVSKTpmZT
 r2ju8ruU2blo0vEE81Glkb/fKuPuK9M/awR2yEsgzdWYHQWk0ip+tN91eYBfx62oJoMa8MKP7Sz
 Z9TtT3xZdiT+IHxwZ9cW0wdIpemq9S/WbzRHuj09NCElw2QekumVczF68W7CmjmA5cVu7KXDR92
 C/duiXKDY63TyCPQqVTtZ8SsI19uJIHgZ1eeahNBOSa46xnVHJIoNXSs8j0qG29KpT7CnDii/rd
 ODPjDtYT0Tw+3Gg5/yi7/L4LpsYrR/4ZNGcTi8r9EhL3eiqAacmAWh3e8+gsWBJAe8JwBPXvr4/
 F9pdYz3M5ksBkgoVGtg==
X-Proofpoint-GUID: eJM69J_wOociZy-9Nz1Wes_cpjifQmTR
X-Proofpoint-ORIG-GUID: eJM69J_wOociZy-9Nz1Wes_cpjifQmTR
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac39f71 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=w_nWnu2JXzorbJeL33cA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050050


On 9/5/2026 7:27 PM, Vishnu Reddy wrote:
> During speed-based rewind, the client restarts the decoder queues once per
> group of pictures (GOP). This is because playing a GOP-based stream in
> reverse requires decoding each group forward first and then showing its
> frames in reverse order. Each restart makes the driver resend the colour
> info property on the bitstream port, which firmware always treats as a
> sign that the stream's properties may have changed. The driver never
> stored the video_format value that firmware had last confirmed, so it
> resent colour info with a fixed unspecified value instead of the real one,
> and the value firmware received kept differing from what it already had.
> 
> On every restart during rewind, this looked to firmware like a real change
> on the bitstream port, so firmware sent a settings-change notification,
> and the driver treated it as a dynamic resolution change and paused the
> port. The client then removed its buffers and built new ones for a
> resolution that had not actually changed, stalling playback once per GOP.
> 
> Store and send back the same video_format value firmware already confirmed
> so both sides stay in agreement across every restart, avoiding the false
> settings-change notification.
> 
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated the commit description (Konrad)
> - Link to v1:https://patch.msgid.link/20260901-read_video_format_from_firmware- 
> v1-1-499edea4d200@oss.qualcomm.com
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_common.h        | 1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c  | 3 ++-
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 2 ++
>   3 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
