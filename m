Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD30446D083
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 16:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822833; cv=none; b=V1tDOaw7CqqOcFllPepSnI/D7mbATwwT9YALIRdoSfLrDcpDVj8zG0VKIPkdyFVQN6O7zKgcqAW4gGsQOcAxiJASxzdBu1Hx4639IVEbXisikUZEXJvQTddrPNZfmIgBzmqdbV2wm1GuMANOew6DGwZpjIESrfTzzbJAjlosRfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822833; c=relaxed/simple;
	bh=ZXtMHVAz4HYSnsOa+kZYTp9PTgUV1FfFoj3cbqVBzQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oKvH9/DLewulRqhw6SflqDFHqk+2inltdtuCNzVtKyhhOw2ygD/Wc1/yAnGGLthb5NfGdu2iKhoEQqg1uQeb5ZO0TSXlKZFtLWiTBnmzPNvcqRdxutawjWLPP5cvQx+OcG3G/qRQz2YSLNsNfD3IWYsWajsfiQ7lAcTw2TMn4So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GDgvCcHX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CiDfreNE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GDgvCcHX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CiDfreNE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NG5HMY483134
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 16:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMVUSKeqQk/HVpPVZ69ldyBYUnlOk9XEnsC6LpCZDvQ=; b=GDgvCcHXSENcWL+0
	Y4f2WqjBDcOrvudKeQno/mcVJ+3KXGk3IDT6iY5lY421zgqE0PCk1wz6aaeBarZk
	AgjJ07AkYjLGOwHwJduJU6qHk6c4fqEGpqpRFqk8JjArK8s9+TO66gqJKmH40XX8
	Koh6QLcSsw5EzPAdxy2SMAzKl/l84M9cKWsquhb2R1qJA367sr/ZFqUqZRBGmUtf
	0IF8NVbvB1RPjR+JhIOwa3lFzOxjf/1gPuL9LxGfPNmLlqCEced/53+1436ELdHc
	ROG4DzaCrjliJrDuvojh76A+iC3is2u5oudVyJ9iSrAcoXAH4dmuJxfoxxHbd6dB
	HNORqw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vg0gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 16:07:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so1175163a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784822829; x=1785427629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMVUSKeqQk/HVpPVZ69ldyBYUnlOk9XEnsC6LpCZDvQ=;
        b=CiDfreNEelkPjQzXnS89FHdsVBnyFLijaUM9yHJhOLCo00qcCvfQ6E5dVKCMXnoVhi
         B4tLUsHeI4p5ot13TzK+Aypb4VtpvN1BA3RlzxKbxcVvFBsPnDYnafASSzCOzhlAyN8X
         GFUPaJp+me6SyJIH8NxDnfW7eCZ9E4Q9fYMen/NKiiQ0wnDcjVNCky+j9kLV9kdzhAvP
         Z8I7bfVcDX+ODTsTbhXIX5Q87zmAkBlNN1MEzqmndbpHhKcsBQmL3ix25p+ty9LbNyi6
         wWG+k6zWVjRiEnv137P3vO+Q+p6WYW4Z/QupSPRY/8pusxmuLqQNYj3y+xmY10PXvtFF
         p8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784822829; x=1785427629;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMVUSKeqQk/HVpPVZ69ldyBYUnlOk9XEnsC6LpCZDvQ=;
        b=qP7C1GrpR1ygKu6XFpgDYMqQh8PMg7vKBJVvZz2cpTkcNxT0QrYLEjBDbMWmOTH2yX
         ge5XxaW8Dx+XsfVx6HrIC8s/o8aQul48a9FyFkRf3F6fORUYaKZRDFOqgWHVUw4UqpUj
         C7Gxd7hyXR+upqrK5POgZkq7kKTqs5/vOVIQ5LXt3sTuLoqAGZcqNXbfJuOfRgpWkdtk
         OwWQNq3m4kvx/QlG+2mTBz4ILGg5afcGw6Hi8FdvYIW2GAsdW3X6TvMtRTdJygqL2LtR
         Sk84h9/uY8+KKibr1t21umWyGkp2bCAqRJUjAX8jISiWnTt/0KE3o8ukGsXv3/uO4fR1
         Tz2w==
X-Forwarded-Encrypted: i=1; AHgh+Rpch2MyBBaAjysGdOwZwEhzCshtDOq4j1bWv4w6fQgqRIKAEtXNZrteVTo4ekScEe1DYkl7i72f94Qiy0uM@vger.kernel.org
X-Gm-Message-State: AOJu0YwtkkhsFFXUpKWwV+RQtkxU28qhR2WixwEPaaZ0ABK6oL8nJl3S
	fFHQSNnqUC3KBceyfYLRsWJDo9TY8pDVOV9TvWcjLlWdifjcreQNgQ3iTtbqofC1siN+uDLFXSw
	v5fpgCflDCGMRa4dNT213d1E7u3l/jBMjkUkqgEAP7OvhPKDaJEL+C2X+mC05S2/o+ZN2
X-Gm-Gg: AR+sD10zmQAnR1phOcTlkRMU/KM4xHTtEXBXmf/gA/7TyaucsTJ4/Y282nvBJoaLbEd
	2iQ/fo225Z03SID+5GXy8bfRHa+Sp1M1RgISMuDhYvPHXgN0+E4yK/5o7rjCSdzdOCtxN6uWSMQ
	MKNZdZ2AYZy5pwHk4hR7pW81bC8eWhk/6VqVE4pYXaPAcEq9IiC9oecj5zLEaa/vushrzckcYRI
	cXi65S7enHNxMxj8/f566Rv2F2AefCVNT60NLCfdMZ8Dwy7iDub/rVNHW7bPgEEFhg6Sg1RkQx6
	QZgeJb3Mp3Lg6R4UDR1c/VozFM8TmIxHWS4XoTTKYcH0XxV/pIwrhVEB4BE6D0K5m5MLw/pJ00w
	TLMTht5uN59stVTYZoGWjSaLnK0YhBSzuPv0=
X-Received: by 2002:a05:6a20:2d28:b0:3b4:81b4:9b79 with SMTP id adf61e73a8af0-3c44b18d9cbmr4508583637.40.1784822829068;
        Thu, 23 Jul 2026 09:07:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d28:b0:3b4:81b4:9b79 with SMTP id adf61e73a8af0-3c44b18d9cbmr4508527637.40.1784822828486;
        Thu, 23 Jul 2026 09:07:08 -0700 (PDT)
Received: from [192.168.0.173] ([49.205.251.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc9d932sm20688730eec.12.2026.07.23.09.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 09:07:08 -0700 (PDT)
Message-ID: <66e699aa-2491-4d72-bff2-f3248e1b9504@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 21:37:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: iris: cache work mode after computing it in
 iris_set_stage
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-iris_multi_slice-v4-0-45f0a3fe7fce@oss.qualcomm.com>
 <20260723-iris_multi_slice-v4-1-45f0a3fe7fce@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260723-iris_multi_slice-v4-1-45f0a3fe7fce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE1OCBTYWx0ZWRfX2Dwcuo6EHFmk
 hSkTA2ea1GJ6VRxiH/ip5i5rejUniHUx2i9Bfqz2FdQhkNcvooafjt3Z53AThmKvscancOz4AbF
 1jniFJSEOJANb5iNIu70r6quewNOas8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE1OCBTYWx0ZWRfX0tut2lCAqRl5
 FyBxUiNEjPwfjZCe/xtOd5NFN/FtwqivsW4bCfACS1nlkZ9xaGz4aN1JdXU9PJ6RwldRrnbhlAy
 C4HOiLBmlxJCfGh4HvtI9l8r97DWMfgEU1QsXzwIK0FgJUADpzhcgY0U2N9fKtxIZZLkN7oigAd
 Z4tPQq+L9nBKbLs9Xc5620Pw8F4U6CgxnAGSQzHNn8wcBZmkJ8hTa8haPT85I9fjYvq9m5a1ZEs
 SXKsfLlw54jTa6qyUmgJmb/Dsi7hO4A6FlVjLhTG4BZaHiPnMtqkLvb2RjBN3jK20ofhw8MZT/K
 1s6ZMuewQqbKNQKELX09uR4N8kYlmKfGkNdxRF8nbn7uzDWc8Ete5b+6SiWDf7q56QZOxch3JeH
 47BmhfUt/0lSoE9jbczrWe5Ep8+7qw0C5cAdNKDnU2gyYfYJyEgxj//Dbf8wUCzsqphGVwE4M0B
 lxSsgo27PeJKmje18QA==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a623c2e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Am0+rXbGVt9FyytbsJdRwA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JqmFLhbGZVWTxik8dDAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: s91JCnoRyHUXy3gCFm6xkMMqguxEkAZb
X-Proofpoint-ORIG-GUID: s91JCnoRyHUXy3gCFm6xkMMqguxEkAZb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230158


On 7/23/2026 3:51 PM, Sachin Kumar Garg wrote:
> iris_set_stage() computes work_mode and sends it to firmware but
> never updates inst->fw_caps[STAGE].value, leaving the cached STAGE
> value stale. iris_vpu_enc_bin_size() and
> iris_vpu3x_vpu4x_calculate_frequency() read this cached value, so a
> stale default causes them to miscalculate buffer size and clock
> frequency for sessions actually running in a different stage than
> the cached one.
> 
> Update inst->fw_caps[cap_id].value with the computed work_mode
> before sending it to firmware, keeping the cache consistent with
> what is actually configured.
> 
> Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
> Signed-off-by: Sachin Kumar Garg<sachin.garg@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
