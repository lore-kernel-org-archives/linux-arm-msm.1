Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329BC402B8A
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498090; cv=none; b=q97c7oJkQXzpnQXcVi6xfPYUdJNftU3WZ6CX0/QjRNJB/WWH6ZcFppOuSsxj2bff2XxN8EpyCYJxh8E2R/j6EMcueVarIfq8i0Z3ZKWvhSUBA8tw9LZhdQcHIteBGGCyLaw9TVLQaaSfL7iP7Kz0ljPYsod5W9NtzQLgsjmID+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498090; c=relaxed/simple;
	bh=t/AEkos+c9EqibZwHZd/yyWTAgGTemJDxjqXLp+xsmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCqj5FoC0Nc8ybupYSpM5ixZENrMty3L81JgWaVl/vEu65xampmM3cMexSxO3ZiTF9XnADSYnAM9ZKyaI3oC5+vbMrx7O6av8DZEaRLQhDXLNFwJcA1li1+qmQfQCq5cnA2TxusMlzHti6AKJectyOYxHy/cPRW1BaLNdWNzM7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Al84V0sM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iyEpiFp+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Al84V0sM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iyEpiFp+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBMERB3855624
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Su0oDlMbfDedbPdZAAnG9t8RidvVr7z4UsL5r+t2C4A=; b=Al84V0sMZ4qO9Xcz
	kqiAIhFYS6nv7gG3KvhImTx3pF3oHTdPA1hKlUJ1xrUxDfpknYpqnxJIYyVFP5V8
	u19DoBaSFw7EfnxVF/KjqqmLL932ios+D4DUjUoIf8sLFsHJQnOgGb7JpxsvPhQH
	5J2fy7xaOq3Es7UyUMa7CghqH4RXHtdHZln9JihyqiBjPqYTOqyiB0IZNCZ+cIIV
	cYwWgLMk3sz6SfndWZUowlopuralexPxByzvKQ/0SmNM0b/KxJp0acQSV9QR8/qI
	mrTKatOtTWKRTPi7/oXyn12m0akwmmoms1ABtO5OSXEvutCpqssx92cGAqCVhaVB
	0JSZ+w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtms83n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:41:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ca37ce4c3so1698801cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 04:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785498086; x=1786102886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Su0oDlMbfDedbPdZAAnG9t8RidvVr7z4UsL5r+t2C4A=;
        b=iyEpiFp+Ky2W2k5DM3ZOQ54BGsLwYxGnLEQ6B07ztrlJGMyXUCW0MADG89hf8xxBsU
         UW/rT9Zr0gRLda+g3GuD7umZL/qYaJYrpThMbAIQne4xqABtlAJpIFuUoGDMr0nmXO2g
         poEg5nkLrHK3ivC6Z6NfsP6SwOR+oYIT6Feq+sy1kJ7N8blj8cp5iA8g8eJXaDh4Q94R
         eUWjWbqqDJ3Nby0EcPCVw6eSI5FTiKI/ikkali/qZXgysqbJVrXmkrAMffI5vuqUYTLe
         TJBFVsL1K/AptdEQjkW2oxJ4r6ZppgdRUOoD5z6W0MhyTpppl/x3HzrZNtXCnTRzz0d/
         oYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498086; x=1786102886;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Su0oDlMbfDedbPdZAAnG9t8RidvVr7z4UsL5r+t2C4A=;
        b=e/g7G7BHTcCKPwN/IVrzqiwTe95c+1Fwe5KM4IClsPoiL6H4jzWQb5BFP4Olpt4Lm2
         ALBSUWrMlwXeL+VFQt/T2B3EsFSMjwStvS+BbwZPOzxPtEDmoZ/Gsfqqp0CxAPbROT9z
         0fjIbyX+5NTRI8L2H15y9L6fKYUQPA7O3TPdCs5MMH8WtbpZ/JcLG5+qKogXXjufgfsA
         bzbJyDvP04NS+kq2L7vbJNG/elX14YtMgMPwBX9Xy30D+h2/8kVq9tx54mFE9nwmAYdY
         sTBKfJCTpaYPMD6oeNNLEmmLmUh7Amb6pVNuPOzV4cf0QizB5DGvEbIPSP+90KnXlEuZ
         jxfw==
X-Forwarded-Encrypted: i=1; AHgh+Rr2fWKfGWDNLhuQJFUzNt9ejhgNL+AZ46j9suh5OCS9jpYxx8gjOt/e9LlbzB6UeB43ps8bq5L/IPH05CFD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx19R3tdAGAmjBCr4CNtbbAn9NMoGpK6Sg7ySd18OqW75MxdsLN
	7DubFyHRUXhkabb2ZDhEVsCOSLuNm0don4kolMWGro4UWmchWt+vERQZ8wyMN4vE9tkWGiu9gWA
	mRPguFfTPtivvK65+PcWo/AOKjSuC4Ya9+EHGYGybwqx/emmLu43S8imt1tHIw58IlrZW9A+rL9
	GC
X-Gm-Gg: AR+sD10/b7s0x4AV9n/9N9JqQRHuU8Cv1vAmfqZLmA6iLW1c/8b6IoXmyYuY9o+wlZk
	r8jUpUc3Tg74FSW/WmAcOLGJyznBlGoFTdVkqGtbB/3+dM0AAzNpnXscNfOFmJ0EB9XtteBdCYa
	tcXLMXm8esOyOwUNqb3afPWuwhOQCEhTL6izKFw+QguT+6twBQlTKrNiF6ThUsIKnjLhKfmydQO
	kMOVRhxw6PKFqBANeqIVNBQde6YqsuMphzLzl2iXl870Cw0/lJHdUepDsFuILynn4ES1ZjH9/Nd
	0Bu9nBmb7SNi1nKY6IAu1Lqx6kw8PfHzZLgf4wmayDON9L0hn/ZftnBySBeRD/CyKd8vk1LNbi1
	hxGcDSJ7bWSwB9RRkgqvD39fe
X-Received: by 2002:ac8:7d83:0:b0:51c:d8f:d77a with SMTP id d75a77b69052e-52b4aebcae7mr19725311cf.1.1785498085492;
        Fri, 31 Jul 2026 04:41:25 -0700 (PDT)
X-Received: by 2002:ac8:7d83:0:b0:51c:d8f:d77a with SMTP id d75a77b69052e-52b4aebcae7mr19724941cf.1.1785498085053;
        Fri, 31 Jul 2026 04:41:25 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4453823sm129487066b.40.2026.07.31.04.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 04:41:24 -0700 (PDT)
Message-ID: <8d0c418d-849f-440a-aa56-110e8b7dfc07@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 13:41:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] media: iris: reject open() when the session limit
 is reached
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260731-iris-fixes-v2-0-94c002016a09@oss.qualcomm.com>
 <20260731-iris-fixes-v2-4-94c002016a09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731-iris-fixes-v2-4-94c002016a09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bgwr8_zjQIBLGExnPDlOlIS_1M5nk7hw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA4OSBTYWx0ZWRfX4FjNM9MiKBsw
 7DgqxSMLYVHHgQiol45iQp20XYxT02hbsbB53Z8b/mcWdY0HqMxmG5a7Qc3GijNEM/FtFYHsZYA
 XDnK+yXxoszUyXiSNuxu4O2nqqMChtnZ3OR2OZ8SJkbEqKWX7E21NFjEuhDN+XFmvX+IBsqkuWO
 BuUMQ4OMKJJDs9OcXNmdrA0Oda1b4uMHfYS2ARWEfTSV+/upjid2THpfPLOol9tTYxfJ9cCFWJD
 ZRAltt6h483wLPQ+bls3npsrSIs5bWzuGBEtmEz0C0igibINxz5b5FYG07FLkqyrU3Oo3QQmhqj
 mmpM7mV9P0AeZS2dXlbF17X0zsp/cA8bd8C8SaCDyiUeIDscMiPQVZwFvceSBZfyAA15QW86RbD
 ncnz4xvidzSwtXzoxlarQn3z+6ay8VBJb+n7ijvNNhzDwjoDZ1ERxpW6Lfmbh5cmg5jINExwodc
 4gSkmlQtC4vmoWNPQYQ==
X-Authority-Analysis: v=2.4 cv=SuigLvO0 c=1 sm=1 tr=0 ts=6a6c89e6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_us7XynFyZs99I6bamQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: bgwr8_zjQIBLGExnPDlOlIS_1M5nk7hw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA4OSBTYWx0ZWRfX6Wp6vLN7/UL8
 SfXVTb6uqXavZgRZWUtwXs8nl6Bo3HhZxFVNxLVo/gKLMZQpzuJfQVoDABe27F091r/8xQXUZIP
 +x8wlRZjA8BMxlmbucG+oZs58sCima8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310089

On 7/31/26 2:31 AM, Dmitry Baryshkov wrote:
> iris_add_session() silently skips adding the instance to core->instances
> once max_session_count is reached, but returns void, so iris_open()
> continues as if it succeeded and hands a file descriptor back to
> userspace. As the instance is not on core->instances, firmware responses
> for it are dropped and every subsequent ioctl times out.
> 
> Make iris_add_session() return an error when the limit is reached and
> fail iris_open() accordingly, freeing the partially initialised instance.
> 
> Fixes: 38fc8beaba55 ("media: iris: implement reqbuf ioctl with vb2_queue_setup")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
