Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F6D50278E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 15:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903880; cv=none; b=TnAZOXdPD7t6qOeuV0LQO3T0nIi0TExKiWW8F4jBCHnSr6juYcBEDb3zlxKfQnOgAsl1fWxUGiNxUkK5h9GmFmY+F4Eh/QeAPKZSwqW7OVXO6oHlenMtiKRBBseHbL51OE5VwJwnMWEWYCKBqTXDjJax8eFHDDK3oFyJfLsh9cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903880; c=relaxed/simple;
	bh=YwJ/4Kh8dgIbqE3SXVnIlum34oAB97j1aaSxvl4JjT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TS4PSB5BmEsnf9/Kkc7mZ4yifsVaqrNGQPYkv+iNZ3lhbiCQlnNsM7ktHHT/uQrcO4DOOsW5prsM9LKXNBUAK9rpMezY8rQZ9421VNVo8jOMg2Lv1Guk7Rc53wRcYoZdzPA8zVbavj/OHxQTbxxe2GysKbSHtHj5a90QV28JML0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bc9TZcGX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HctcgWR9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bc9TZcGX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HctcgWR9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3ZwW443059
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 15:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TPK3uPVCdiplnO240T4BT5juz8bHcffFNDKBRzJrh6M=; b=bc9TZcGXX0RUVy6/
	RlvZU14waSJxX9UDqnxpiQhwDw/UrzN2l5KqwUbMnKN0XU4Uov9spoCzfv3xfS0y
	P/84TpmlCIusv1RJlvpYOfVs7/wFQ1AHOgVIoFy1E7nys48XBdqoJHJMx3FIpFOe
	Xzg9mWDk16PB9Dj6YTrjWOQGE7GsHf36tUVxL+z8C/z0qzY9dNzlzXxCe9O8DFqu
	uXlKG1u6XTbQnyczpJ8eYBBWK3qNa0WjBAye85R0oAqvhnx0pfgujaQ5PPiO/mU2
	+nv/hIl2dX1gD4wDJCfmmWJWx4DyPbQmYSqaKi1d+3Z86rpkHNJMM8MAWYqdKxea
	vQK3eg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9n71gjnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 15:04:37 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e915fd8a61so54205e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791903877; x=1792508677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPK3uPVCdiplnO240T4BT5juz8bHcffFNDKBRzJrh6M=;
        b=HctcgWR9+HtTlmKJZeKe9tINLcgVpZCn3TBN0n74FOroc/C0WX1R7T7hX3S1RXIdyb
         6ujh9jWnXzKl4aVR3/2kDe+y69qReyWrZaUnREPdhAgCCuhlfhkH3ox4In0+BypnMwp8
         kqHBlJQunNpYBH7kVUcaelr688OxsGQO7lpkLZAiVUSgXmZqpCOC+9I2z881OUlXCTy7
         qVa2QdM468noaVXJPYSQRg9ApiAUQaqjYR2cUZPWI5ynGXP8oPImmHuXO1ltfI4URDF+
         siqGlmpt8mW4v9jZGYXl4H4ESF6ndcRV8UZHNRWrMgsaoRMZAW6ECtu3W3zHik9co/7M
         4W8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791903877; x=1792508677;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TPK3uPVCdiplnO240T4BT5juz8bHcffFNDKBRzJrh6M=;
        b=LnDLfepTEQY0R+tEEMgFZSG6RqRFn/UC2fD1TQMyt1TkofZyZ6HFCyvJQdK9PmXPlR
         cKscp/NmVIs6SSAwLvFAnKC6jWDnPUY4b1Kn/+cM9JXCtDvex9Y5risB3L/V0ljqiPf4
         C4p3wkRBXe6nQWt8Q3W21hDz0svr5ocUlExogbxIBwDjQOHgRyf9AXHTlj6KaJCCE+Q3
         isK5sIO2OsELflL2F0RI5lxaxCdUI78DTqReB6lSZK2VWZxt/4C4Ne14AXM8tJlRb/L3
         sJlpV0VDYeGuujM9giQUdjusIbtHfaS77bZV9N4ldXuwi+QgPz+y+9xsjWM6gbX4+S3v
         ZcCg==
X-Forwarded-Encrypted: i=1; AKwUvBw1sp08vGdC6zu9H7YI3MzB4h3P756XxVdUSN7M3aPrUMgMYN5RlaAVnkuDTskSa40pY0ZXcvRRRlHP2wtO@vger.kernel.org
X-Gm-Message-State: AFq9FYK2iNgM5QPkS0T02omJkatHNK80L80CY+cx3f+6/SIqo86mMGHi
	tpK7nZSGNjOCvKGcD5rSrqrFwXhaQmxddTfFXfwn4a3+KO/PxQo0uZoa9UVUvIIchcUjIAAOYej
	SYncioSPN/FNKbTBhqilr99yp9u66cYdGYnNFdx+05YD1WVaHJXowSDy7ukAxt5InO8eV59jd94
	Iy
X-Gm-Gg: AYBFou1pNRYOgRNzyQNlqufY6wGDcy9IY8GtiOT153Vbmg/iPNGgSthcIXTXRPFS7oJ
	TCIIeb6yDI4bbQ1OoeuLY95XLufaKHcy6pV48mZIaJbcl44jPOx+htOU896BYM+swJ3KqZ1+htA
	EegUEt/h1Ee3iAftXximfv4qoILYjR5kSJw2FNCtVSjIRo+E01ihvP9owRv0xYPgdTxuBPLC9L5
	gi/D9zMNL5eMFp/eb7zhoxeH7xgsXg+U7YLLM2x1IouOje3IOyHY8xhVKCEVZSpHB2pqccqF2IY
	H0OWS5ySjxWlRNCgQGqOxGEwPzRvgbO8JfQW3NdV5P8kIpVkhZh+wP4NeWy5Q/gomv/rmDaRKgZ
	5emKJI/wb9F+A9RjeWrJ36w==
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr1052085e0c.4.1791903876779;
        Tue, 13 Oct 2026 08:04:36 -0700 (PDT)
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr1052049e0c.4.1791903876180;
        Tue, 13 Oct 2026 08:04:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a9f776sm595740966b.48.2026.10.13.08.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 08:04:35 -0700 (PDT)
Message-ID: <0c195d46-64fe-4d27-9147-678ccd561329@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 17:04:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: glink: smem: preserve IRQ acquisition errors
To: Avi Weiss <thnkslprpt@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Arun Kumar Neelakantam <quic_aneela@quicinc.com>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261013124328.1273340-1-thnkslprpt@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013124328.1273340-1-thnkslprpt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FuqQbGrq c=1 sm=1 tr=0 ts=6ace4885 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=RAclOZT44kLJCt7_HWsA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: DFCWVbxGv1wA4fj764VHz1W2XdtucGEZ
X-Proofpoint-ORIG-GUID: DFCWVbxGv1wA4fj764VHz1W2XdtucGEZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1OSBTYWx0ZWRfX19ICZHNZ8xEC
 hZHTEYklpBeEG1wQRbvE3P/QLzLTAUR4GYBMECJLhZBIAsdbuZ1ZAo/s8xlNzWhGU8cXH5LMG3y
 EYECIvR57cTNaaBr+cp8OReS7VeUiDbHj5GUN+9LzstnTuqvIRcAcx52j+n03vmM9YZ1GbEHuVK
 VKVt1znpEnlUhmjodPSG+31xcaIzLkc/03TTtESOs6L8vbZoFL0VW/wL3l9YqcwQHsoVLUXrg7v
 DYFOSxk/RoOQX0VHK2nqQpW7GkFHEmwSlCSNSJVDSbaQ/tRedd/lEwiNPZNO3iwF4KHSNyBqBQB
 DcgMO9IWRRrxYh2nG3R5b4ChP+MXs7RgmSGqK7Lms5klR5kWZvD5V/nUk9B+vUJZj5+MFo9vjzk
 NMOh/e6ePt/e3sdysr/lHDtqAJ8pIBxn7/4UkKtB9DigVqm5icT8mPqVm0JsjVeYY/Ttpgr/RMB
 q69L0+kwb9L06QrawvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1OSBTYWx0ZWRfX46NF/Tsx4UXf
 /SwUeaQ3Mdciuy2fQEwcVYeU0uSBYmatIMCQkTRRHOSw3B3sEDKEGH9ynxckNO4DNuI/xjFP34I
 YO4uDplDQ361EVN8J84D8lwlZkS6itA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130059

On 10/13/26 2:43 PM, Avi Weiss wrote:
> qcom_glink_smem_register() passes the result of of_irq_get() directly
> to devm_request_irq(). Negative errors are converted to unsigned IRQ
> numbers, causing the IRQ request to return -EINVAL instead of the
> original error.
> 
> Check the IRQ before requesting it. Preserve negative errors and
> return -EINVAL if the IRQ mapping fails.
> 
> Fixes: caf989c350e8e ("rpmsg: glink: Introduce glink smem based transport")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
> A dev_err_probe() diagnostic can be added for IRQ acquisition failures
> if preferred.
> 
>  drivers/rpmsg/qcom_glink_smem.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
> index 35bb03e67ae8..010a7da64906 100644
> --- a/drivers/rpmsg/qcom_glink_smem.c
> +++ b/drivers/rpmsg/qcom_glink_smem.c
> @@ -312,6 +312,11 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
>  	}
>  
>  	smem->irq = of_irq_get(smem->dev.of_node, 0);
> +	if (smem->irq <= 0) {
> +		ret = smem->irq ?: -EINVAL;
> +		goto err_put_dev;
> +	}

platform_get_irq() lets us drop the zero-dance

Konrad
