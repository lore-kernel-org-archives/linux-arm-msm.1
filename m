Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DE5544D73
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085101; cv=none; b=OmLlHKbxZ2cDnYZOUR9zaQMM3qP3DSkYMIGKny+KQQgoniyX5cLRIumIhS6gDKJOZjhQp5sn4Pj3E9MT2+d/+TD84txEoMzZzZwA9uDZNXPqpSLC3mYCS5u3yAzubZu/hnvDGlJaH94YAKw/RBDdBY4RJLong9FuIg2WTNhy9eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085101; c=relaxed/simple;
	bh=exbDvCW6zscOSTFrNqipgAyryDy+MLtmidYj8IbQmq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLyoAQo8P4sYf3hAb2zSkCVT0gicgXF/SxcMynF6GGWZT1IvEcim62raPCYyUEhMIzb5fscmfzFZZsrpTCNKH9+k/QRXK2C7rzyFuzIli/64ktjLh5VFAZ9rbIPhdTqD2DYyjlAmta92ptICWUfnpgtBi41XxyWpFny5ZZHtzyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c3vxQMTh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X4R8on0k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c3vxQMTh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X4R8on0k"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBP4a13670751
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSrlbnrND0MefPgcyWNpCB43rB6rNnrLVEDeeWiIRsg=; b=c3vxQMTh0N8lp2XV
	0w8PJs6Z/IhJxCovX4k7jwcXzyLnP/p+1sG7S4scSBvVPvvVxbUfL7HsZ+R8jTji
	3LaxYzkm89Fu5znDyL6oAPLUQsKPInaDS9acnHmsyt+HBpJIdHF6+s7f30/BTG42
	ZWqJh4G/5IJgEgxCxNdEHGpAJSx2pTRGTVLxLKVJz7CplvXB7BmgvQsljJbNZEos
	n5PacQxpzF3m9diQjrcluDp/3WxcBDCDSBcnwVClBNgu6eupIR8oQUcoP6yKdR0/
	W57ucSDVM65bNG0AZXTJJgO+jEKJJ4k3GqtTcfGTsrg6eFUDMZBZ1ls04cHv9ULh
	AbRY5Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurnt8pqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:51:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so7474060a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 06:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790085098; x=1790689898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSrlbnrND0MefPgcyWNpCB43rB6rNnrLVEDeeWiIRsg=;
        b=X4R8on0kcSOsTsPHfGY2JUcDlEcgMAHcGBXFKvTLj6JLO/cySfcvsM7oHPzC0uJG1B
         r/HeUcH8ON4bpk4Kq/EC12Ez3S8AZ4N6OfVUqC5YHOK4fIs0DiFgqi3qLDCLovnpqBdh
         QPeaROJMydv50zaRPhuBe75n5tl9s4eX4FIprevkknKZjjhUpAc+r0IKto+InKWipYJJ
         eAJ0sdp0l3hFTrUrF7JeslyDncOJ5bcKij0Y3D+OS8+tOdKisSpru2cLPji4VBheR7jD
         CU/vDCd0BbPyGPIsicdWWsccFwf5XkiPdtLayun3CmW1VPM3whjyfETe6kzKwQ4/jTFn
         S87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085098; x=1790689898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSrlbnrND0MefPgcyWNpCB43rB6rNnrLVEDeeWiIRsg=;
        b=K7sIAcVQgM3q/3TyDbfXXFx8UdtGo5xxxqYAmav8BLb4RWfZI1ZiGokEY61BYaowEI
         klTf1Vu/7dXqz9ZhaNTV5rJ0zFKbVzvbt2uIXwkadeBHoIiBnM5XmN8qX9VkZpdDvIWw
         7YtmdXXqf6GcrXn1WeXz33nIPCU3CfQBxu7lJ5JqDH4iRoeo3Er5podP4DhMeSPbdq+/
         1lXSkk9emOAAdyWYyc7p77umsjIwb+1us6tAoNjtx3tobagfSj44C1RF4iBu6syn5xT5
         mkFkc9sQ8j/cOOkYVR01IdwGltHGJubKZCItMBB9RxXtT6a74XKkaXOu/UTalysnzBPR
         U1NA==
X-Forwarded-Encrypted: i=1; AKwUvByiueWRZ6hS/M2lA7paMkld0VfkqAmptybLPGuxybXLStb6S2vybgVvq7/FeGvPN7+E2LxdPWukpt8PmYlU@vger.kernel.org
X-Gm-Message-State: AFuF++mfVnQcMYhjBjjdib6ZZXijyxMHM8rP/rMdofBlWsSQT10GrzHS
	xH7Xk7Ems7NaaRxK84EA2QodsDxdI1mvMlBxqSh584lKellaWn8mlpdEnI6PZCXMQcU9lvfWNnO
	PLgytx4PQ4GiZLl1oza5Bu2ToD/1NfKuvkbx8TYt1ZqthdZ0z8JM+bn7Y6tNK/O7MJR2g
X-Gm-Gg: AYBFou0KsSGCqy4w01SS5QCRojBOrfVnsWjV+l/6K6qpMAbkXiwsCqIuKTqoihO/OpV
	1ua9zfk3BeLftAVzi+ibWzWL1yQfF2bmZx2TKs+CMnv8I/UaR981CFApWYs46VPzvebk3og83Ro
	CF2S7vPIij/yDbkneEAzzcZVaBXWdeLQrqMYu9zKaPWBcKJJiiN1U5TuNE9Df8iUP/81Z6lMAUn
	p/gyPvuUEZwKG+E7t7Hd7czJDfWA3gQxTnpY2O/CQiGbwdvr2Fw4cS4SvEMOtfybuedEbxMSEJ2
	RP29DW//5cTXFwXmBsRy6MwTkgGxdI3ZyS1YkQFCo+ZtneeGiufNXIH22fEwjd4U42x3DDmh4D3
	oDlxS3B+XWgoC2WpvceuIknf/v0KpjPM=
X-Received: by 2002:a17:90b:1f81:b0:39e:6c6a:6574 with SMTP id 98e67ed59e1d1-3a073226d6emr1443311a91.55.1790085098322;
        Tue, 22 Sep 2026 06:51:38 -0700 (PDT)
X-Received: by 2002:a17:90b:1f81:b0:39e:6c6a:6574 with SMTP id 98e67ed59e1d1-3a073226d6emr1443260a91.55.1790085097761;
        Tue, 22 Sep 2026 06:51:37 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06741d485sm5032091a91.8.2026.09.22.06.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:51:37 -0700 (PDT)
Message-ID: <8cc02f82-43b2-4ef4-9110-ccc775de0e7f@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 19:21:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: iris: add support for vbv delay
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730-iris_vbv_delay-v1-0-7b5a7953bcdf@oss.qualcomm.com>
 <20260730-iris_vbv_delay-v1-2-7b5a7953bcdf@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260730-iris_vbv_delay-v1-2-7b5a7953bcdf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w3VodefcHl7-LYdNVvqZIvNCa1Dnk1dI
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab287eb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=oKMEzaGHhaSyBDVYNLEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIwMSBTYWx0ZWRfX/cPJDAr7YlTw
 a78wcfl0XYnCJDH3t7XfAIgKnDvQjgf0Zc2Z/P5XkZbBaVajnuG3Ti6t5orEA5jKQMMwVWUjolP
 yKLMyIkEc5lVNGhK3kt8vlnMXj9yyycJx2JWGs1y4yzw+R7M/o49TzyA+cRikme7zAIQlMlhTSZ
 H6wedgXgJ6rh60YveUwwVfaiJmFJhCvlHJ4NMIc7lsVWsO1/6xhsUdzHzzJdQiag3/kM8nKYDL8
 bLE0zqv5hRQbBQsaZEQpIVKDK1gYWueFOb3FlDVTEIjXdIKFgsPAQhPwuin4lacYg8NYu/lLBKF
 DmqpTePn6H4fkiChQ/j07gRyFp4vA7x/HG4lg5B3Fyzz4u4FX+w+xt5X9BGV2Wg1Vf/uNovzYWv
 zAMeFSY8jYk/EuOGd4pWSLlnHmIKLmef2RwnGfCrHVQk0rntn+0sKDUsywN3qeXEZZqtKJl8RhP
 qDEA7sLdgSsv1c45Vgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIwMSBTYWx0ZWRfX02poRzE57C0s
 XeVKZ6+flWEEDAEoeQPkYEVKONfVYEFekvtHn3hjte0oXBBj3nUKzCHYaOEHUKG0k/d5v/med+I
 jhxtAICCc3duCgUNBsasWRqSU71bCfQ=
X-Proofpoint-GUID: w3VodefcHl7-LYdNVvqZIvNCa1Dnk1dI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220201


On 7/30/2026 8:25 PM, Sachin Kumar Garg wrote:
> Add the VBV_DELAY instance capability for the HFI Gen2 encoder,
> exposed to userspace via V4L2_CID_MPEG_VIDEO_VBV_DELAY and mapped to
> HFI_PROP_VBV_DELAY through a new iris_set_vbv_delay(). The property
> is only meaningful for CBR rate-control modes.
> 
> Low VBV delay values (34-100 ms) require the encoder to run
> with a single video pipe, so extend iris_set_pipe() to force
> work_route to 1 whenever the configured VBV_DELAY falls in that
> range.
> 
> Signed-off-by: Sachin Kumar Garg<sachin.garg@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 31 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 ++++++++-
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>   5 files changed, 45 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

