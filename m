Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED763C4171
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786956124; cv=none; b=lfEVJY+qYbI1CAR+jYQuc/bLVdyBBoP8JYBAaIDR+wBhFMGFf+WgfQTqL0qg0TjYzFBRx62ogktLyxVqCEdds0QcRAD4BKJz+0jt8xxL+4LAPdKLbiMVJIVrfDSGxIz5zW6KWH4lNkSIiT1BpYa++BRXSlYhrxhdGdjKfaQfNko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786956124; c=relaxed/simple;
	bh=J4yphZldgZo/38ruJpoBGKz9KTb82Aym0Z3MCsbuOSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mm1B0lz+a3qZF6DAu3n2Q/GZpAkqSR0QVnGwputk2dfFtpjXAG+0RDe+BdJr4W9wSqZ/dfcig6fZmtxPmQ2aZeuoWaJ0QexNMneTTetCLRuXuX6IbOTImeaKt8sraaDSWkKMr1DGzxhoCiS0947vrqnirMaEYjzSViYSTm6paac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xa7K/CIm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M72Nw/Bv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xa7K/CIm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M72Nw/Bv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H7suMA1297289
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ebzg2U5D7wsaB7Ye3B3vmB+6OwLjgSGUlCyhzYTVsx4=; b=Xa7K/CImaCmltH2p
	/O1trS07rbjjoj6IteYCiKYRakm/aLMokcTrkhrJt058Ebl3e5AQWyo0cYavyKLs
	oJND4CXbbxN6CW74gw/hxdJvgQYJPTGXMvbwX54Nkdmc8aVy8UFVAdfbEL1nZ4t/
	P/j/yEMSr26PeYGQFva3dNENncE/qOZxCAQNLwxilUAEApE0K1dAJ9o9jFF3is5l
	q1is5p/ll5Pfo+W9mXG9gke73+CsUk6ZQ7DTma8Dh9hnncvKSDyXPQz/5ZtxO7HT
	3P7Ed/niTpRmlKO5XEXLn/mBo5T9Z/By+azzIXlz8Whjp96GC8IS91DBFRdN+zhd
	i0HvSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xb1g5em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:42:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21be5bb4so9069691cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 01:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786956119; x=1787560919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ebzg2U5D7wsaB7Ye3B3vmB+6OwLjgSGUlCyhzYTVsx4=;
        b=M72Nw/Bv4CZi2vaSRbVKVvlJ8sn4d+GzV/ut9JFjqiZzwHKCVnxeF2IaM+ET55fOlG
         j8zL3rp/HbVS8KTozR9MX5kKbhsTQ9aTPdeZWT+aX/w13DGXRSvwaltrHOxEbulwpe1D
         7DR/nyXwNj5lcXVTsIJWphGPMkVnAHDPvuGgMfhskLXGwQW/arBZorCzOHAcZSk8LsS2
         4Y5vCC4/Ga+0e13rLKz/Htl+pZVpyY74vD18UVCNUHXDRaSY0M9Fy90EsjP/1GxzPNmc
         KY3BdY4Vs0AaDP7TQVqAHJkLpR7MoUZvIT5jnbvsPjsDQ5k9Gw0LH5ylnK+rTqgo4DAN
         vmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786956119; x=1787560919;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ebzg2U5D7wsaB7Ye3B3vmB+6OwLjgSGUlCyhzYTVsx4=;
        b=n3Lta2FuRCCDhZf6WdyR3PoTpeU/WUIsSWwkjlUoOHBzT+kfUoUmBDy7CetQ5gDfmW
         R5DROMGN5BwA6pO9GaQaMgz2k6y7TEFOi6cdEXAVhBNj3m6E2rZDy6Lp1+kD+QPgjVRT
         0vqGg5jfZ+wMVJ3clEI30sQCKfCay6uCfql+TVY6HEbPJRSAi3PKfFKi2MSfLEGtU3Et
         7sRgKN6LLlsk0fB5RpwVjMr/N5M26JjEaWucQxpQdHTuQr/VuDrZ/OlWZf3BYki9nPtX
         IULrPm9yflEz9O58z/RcdFSFVb58DxenAOiZvpVllrvqyecOohO3U2qb6y1N897cTTXK
         QYHw==
X-Gm-Message-State: AOJu0YxgjDE9MPvMQ2uvcEQKexOShvodG2mvp9QvwA0TCpUlFPlI7iYJ
	mydJfiYOuVag45AlRWdFBkYFxJqvdR1QIHS+qF4YjfnHGQGCMWfLGpUaJ7ouPZRa8PUw0AN3oMT
	AtePYN2qHZ5ciNejhcXSRe4vkqNhDKckveMtT7T5YtOQMTaPv79B2YQ7AH1wT2gQFxyUX
X-Gm-Gg: AR+sD10e7SEgr3v0dj5ZfIsPIF1fYrus4xkbd/nNI1aRccMnYRxtuLPjxLiXuLyhvLL
	pnWvCL1o9PPq5kMHoYdpLkinhWt8MoMpdJxJm+lBf90cp22iBNhkFmCQTKmE/18wLvF16FqB62p
	PCfzp+h4yUb/vqdICZSIsqWjolnwRV2HhpmPbtc/KDi+GD8vRn4rbJdWm93gW8/BHwUcNTBlVXR
	jxuXajG7F1HYACRs7A6Ei45MOprxnLYPZ7+h7efhmmrhYxHWnwaAXbzW3ext0IYniJYla+LIC+y
	oClKMBmQWy6Xu1pRZGFOAcO/0Mq6+YrQIfRojNP0T0eMs4+voJrNcctqMLxf1du2WDpn9E/c1qJ
	B3YEk9Yj1kfZMC2WqoQPuygRd
X-Received: by 2002:a05:622a:c2:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-52d852f49f4mr184346671cf.2.1786956119017;
        Mon, 17 Aug 2026 01:41:59 -0700 (PDT)
X-Received: by 2002:a05:622a:c2:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-52d852f49f4mr184346491cf.2.1786956118454;
        Mon, 17 Aug 2026 01:41:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8588499sm346934a12.14.2026.08.17.01.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:41:57 -0700 (PDT)
Message-ID: <f964074d-d926-48de-951f-7f34c5646f63@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:41:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8974: add MDSS reset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260810-msm8974-mmcc-fix-v2-1-5c787d79c0fa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-mmcc-fix-v2-1-5c787d79c0fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ua9hjqSN c=1 sm=1 tr=0 ts=6a82c958 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=RxubUlsj00UXaNeQfKcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: JQT8PjIwvEsJeVcqYbgK14LzDv2AWbpr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA2NCBTYWx0ZWRfX+Qz3DBIznq9y
 o7j5V5fBrRxncmQ4JgO03N9FiAgj0N0wR3l8zuEARyRtCn0TzxP4WfYubHQw7sU71lWEnlIK21Q
 SIEZVgvQ1gKhX3xeUCkRxg9VdcsczwRY8j5nnXcI80dlZ3VhGgyAJkQn4wsgC/ZKc5KAV7YmgcA
 afVHi2bO0Xzsc9gCygla7CZ7kTDgdLGTWdREiO9QkQD2wDkAphJ5OSs9BcKXq0OnUkjzb4/+Aoe
 aaXyqVZtv3RjKt1SNv2gz2TWz8VtAHscRUtVC1bd3JR+itx3cqjl+7LcWr3fuiNsChGJ4CdYgNS
 nlFeopyCEeHwi5AK16cgAaxJMqWUNAglm9CyNdMREwspZKtYb2Vr3jXrJ1E7LErJwPkd/NZ30z9
 2iwdofoCuBS9Gj0IkMKBWQ2voNF+GQRBaN1VL7gWRgD/087isFyvDN/vMhqXgxLtgesKnirfIPq
 rBn5CcKltMWTgZp3GxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA2NCBTYWx0ZWRfX9gandVBGcx7k
 L9BEMGiWR63sPwPr34C3QoTJoRf471VGZct+8IJzZBcrWEKyRnmvr8yJ3WFY4epWI9s2wVBNc8R
 LKobxV2/0rMwa1o/t0Xzkt78QUlmFww=
X-Proofpoint-ORIG-GUID: JQT8PjIwvEsJeVcqYbgK14LzDv2AWbpr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170064

On 8/10/26 11:01 AM, Dmitry Baryshkov wrote:
> Commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until
> late_initcall_sync") kept power-domains on longer during boot which is
> causing DSI clock to get stuck and fail to acquire its configuration on
> DSI bringup. Follow the example of other platforms and add MDSS reset to
> the display subsystem node, fixing DSI issues.
> 
> Fixes: 5a9fc531f6ec ("ARM: dts: msm8974: add display support")
> Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
