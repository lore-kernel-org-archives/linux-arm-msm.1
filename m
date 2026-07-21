Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1CF1D5CFB
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784607864; cv=none; b=bM0vGadk8Wkn6hs5wBWYdmC2OJsRh0bShJ26SVoOeLjSdJhNUsMtkRgK+qJsg4iw1kITnDkBEYxz0t0iT303BtZlJFwm29PVcEdU5Ik8uxUFTJwzv+q0HNAZnwFBROq5F7f+E6xuDdfAd3jUStGg8JZlWuTBgTzPBMnbKPQeJXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784607864; c=relaxed/simple;
	bh=EpyQ6y4Z+XCilzchS+OWjLtr0nkGIpUDEJuyhxPxTFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NqS3n3maq5l3Bv3yQaXxvjMJTCADYgJjed2eCO/Q5iBgqFuKZd+ZB4jPrl1xW3011/+0uYrvWpRvybpvKYRqZdlcaj6UIgUE4ZcE8+2eQ+hZa1dyFfcDHSGXpMt1ovHRYEdEJ34WirPidxN2jIs+UnnMaGx++6+cWYBIUPSXB/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSBQ9YDc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=amTCQiwq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSBQ9YDc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="amTCQiwq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCRvP933219
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eqqdMOtWVd9xfvkuaRwNW1E678ghvBfZd8MCCpQ39F8=; b=ZSBQ9YDchNLYArbX
	3Zc6Wn8yR6NgWc8GKPdJgDcJekFQP1LEl+gcIMBtXFKsG8WQPXNvm83051ZhC2My
	zAPnFzEuYXWWMxv1MyVs9sSQbrAKtQoUAQJlg1gr+BEsO4XxA/ZjSCc8UHGmaQsW
	lx002D9CLFqU9S8SH2zbedeVS7xe6E/AwleT+3yJ/5Ie6MtuHLTE4tM7ZU3eIFDC
	8QoocP17u79bFuPw1/lqevsJ19DqngnOWZ8UN7fwUS1Tze1KGFCc56kL0M544kC7
	ierS2yYwKso6u+K1AgKU7+VM9OP7YoP6eJKy1Y/dAToTcNZxrXM8oJLNQDph9bZJ
	ruUjnw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5t80d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:24:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccbb61893fso228180755ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784607862; x=1785212662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqqdMOtWVd9xfvkuaRwNW1E678ghvBfZd8MCCpQ39F8=;
        b=amTCQiwqZQVIg+HPgpM0a/yYPXbwPMMWS7j3ykMTv8uVoI0aQBM7ekRUtG7tK45jCD
         btAhWNKRQBo5qoXMQt0xBP56j5eLLvgjSkDdurDR1lcI0XhQQoK3NRNtSt6RnVl6u0yu
         p0TupGlOWXDzShIUQNkPLmyjG0uqZAW/UzzMNV+jBYiEoqJyfCAATd2hCa0TWxUQaBob
         JpKCXUcMZB3Hjtus+R/YB/Kn2gDEPX9yNLjCbxUaryvw0buJJ/isbuf81DAlS48ncb0D
         0zZQrSy1M3A4oiZ4oTewUHiQ4F6WLlStch8I8A7hmtoKPVvAWqmzqsHzN05y0PWWwjRL
         JcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784607862; x=1785212662;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqqdMOtWVd9xfvkuaRwNW1E678ghvBfZd8MCCpQ39F8=;
        b=Z2rOaFffw2N8AHp+K0pqbDTEhZDBeOHBHBnGRkl5+U+S5dkz3QRuuAEruHlc1pE6rG
         t7ZSXGlfRNlFHI1VulL/4IqJh/fEIzLWMJSdyeMJEQEH9IQxYr0U3Uev9eOzYOGBZjfz
         lHHkxcG3V10Lu1f8FgUPyx6/V9Yq4FvB/KOBMuk3cb0OjyYOiO8m9xVT3xk1xKtyKzqx
         Kf3Z+oFCGCYp8QagQkXqjkogZ4AwyMVahUtShfUaKkXIllkEQNmsF6R2SUlBhofvf5jc
         olR1Ksh599W9demPZ0uZuEvmTqxMhfaWb6Fql+G0dJ82ImVr5gLN29OF+mWux2CLU/WR
         r3vg==
X-Forwarded-Encrypted: i=1; AHgh+RruARtaMcJcGQte8DeTk4ShB3TWcH9VVcRqG/q+uYTY7lm1bZGhwyxmCmKYAblw2/qfoDww2S++8895vsx0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1LPuWOEqYUpkxj4wRyDtiqYp4+j40SIKQmfmD53zk1yR7GDdL
	36uf5NHSNjMhbtdWqklTo36twkhxfQtIGRYY5DOfEkcbfe9YY5yTgyW2BtAcRQur+uMX1BH9inJ
	fPD0ThvAD4gI9XziL4fN2fl+B2CtcvQaz8ihJG59LVrVgS/1s20ok9py0J1zvNE2PDvpFkGDCo5
	KW
X-Gm-Gg: AfdE7cnqvZrlLlKC0seHLZnN33SmtrALIFOxf72a9/pxbtXS1+mjZ9ph9jeaagidFs1
	8fkraJxbT2Zycy+uTKowvyKNzOkG4cYn8hFYZaQGY+PwBIA6/FXmhO45DVUdgFCkPKdV0XTBNo8
	mUXdSTFI0UkgJC3c93TBvEswBsY1DgyB7A2RpaqOsGpcYc0CLTZcVuEgyeEgt2Mv8YcyPAv1pfY
	JSuG6b2CjlkrRRuQnG6IPU59LUqVtIfcRDXC9HhGYXpuroSJnBnKuETfnwXIlqt/nxEz2EtK/LU
	Ttd2lZMmrZSkmVk8ZMUxGpQhpSEzFtnKz8tyDk92kigr2V7gf6b0KiNlmBXBD4vKxjqvhtiQ26w
	GIWOLJv6Tryf3Nizg4o7c5LzLXHB20EI0
X-Received: by 2002:a05:6a21:62c4:b0:3bf:735d:7fb8 with SMTP id adf61e73a8af0-3c3ad640c51mr16441347637.27.1784607861690;
        Mon, 20 Jul 2026 21:24:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:62c4:b0:3bf:735d:7fb8 with SMTP id adf61e73a8af0-3c3ad640c51mr16441324637.27.1784607861223;
        Mon, 20 Jul 2026 21:24:21 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbaf6sm38100411eec.17.2026.07.20.21.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 21:24:20 -0700 (PDT)
Message-ID: <651ceaac-bdd7-4dbd-ee45-6d4e56f78b39@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 09:54:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] media: iris: force stage 1 work mode for CBR RC on
 encoder
Content-Language: en-US
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-iris_multi_slice-v2-0-9550b1feb39b@oss.qualcomm.com>
 <20260717-iris_multi_slice-v2-1-9550b1feb39b@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260717-iris_multi_slice-v2-1-9550b1feb39b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zL-p8wnVxEfina0HVMkoDNNYSfT1x03q
X-Proofpoint-ORIG-GUID: zL-p8wnVxEfina0HVMkoDNNYSfT1x03q
X-Authority-Analysis: v=2.4 cv=e+U2j6p/ c=1 sm=1 tr=0 ts=6a5ef476 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hhjTFUP8Xi2ExFBNaNkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0MiBTYWx0ZWRfX1B74XOZH9/vt
 zV5W8SCO5sPjjVmsxZVCBEWC7hKvfcq1L13aU0nLi/BQXN5fxnWn5V7fvzskN+q3EwXMb/dgLXK
 TzwTcWKlsuiYFuuxgBq9gVrE9tx3Z4E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0MiBTYWx0ZWRfX7rUkKDmv0e0E
 yltQAyQfZ88bk/SnIT2Gm51wwveAF0k5LHb+QtZAc+5+9pRUID4I7COH00DC+NFogi6O8Vu7GNI
 ViQ9HbyGrlg5+nmQ9zEbES/EYbKw2lBdEMvFtLEc8UmJyHsXU7EqnQhcWJQR9i7UBtqDjo5U3OJ
 EyJwzo2vY7Gi+wk20MpXjC9pfm982v4x665wJjMViLBs5GVQu6F/LA8i/0eaj9aGL9G1jKQPvJR
 CB1GNRGHSIu34BbXyUJjiLZiBDbS8ruI3C5Xbeg2WXV4OvpWSCHem5hVcvMk7XWazkBldfLDQwo
 IGx8NOxwB8RyV1+7QdO6HNYRd86CgfTyfVkhEsku6moaBbVTvMPgJZLH7FFikxM5ihEnd/fhJy8
 nFuyb03sxaru447oc4xT9OZNEx2pV40acVhmTqJeQdn1vFMHHXAgav7JBeGfSJSbFqp5gmeHNbM
 3fIAvkU3n6UDtu+IE7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210042


On 7/17/2026 12:21 PM, Sachin Kumar Garg wrote:
> iris_set_stage() currently always picks STAGE_2 for encoder sessions.
> CBR rate control requires stage 1 operation, so force STAGE_1 when
> BITRATE_MODE is set to CBR.
>
> The BITRATE_MODE fw_cap value is used instead of inst->hfi_rc_type
> since STAGE precedes BITRATE_MODE in enum platform_inst_fw_cap_type,
> so iris_set_properties() would still see the previous hfi_rc_type
> when iris_set_stage() runs during initial config
>
> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 10e33b8a73f6..6c4eed62d7e3 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -519,6 +519,9 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>  	if (inst->domain == DECODER) {
>  		if (iris_res_is_less_than(width, height, 1280, 720))
>  			work_mode = STAGE_1;
> +	} else if (inst->domain == ENCODER) {
> +		if (inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
> +			work_mode = STAGE_1;
>  	}
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

