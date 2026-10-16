Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ADD3F1043
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143821; cv=none; b=I3Gj3Qw/U7O60wwf3PcKN7c6VnBqJfRZ3VtGn/b2Kkbsd1auKosIxsLVLZbiCHFtx28XPIehoc8wgFqefYYn2k2P3FjkWkt8rA5gc9EQZnU7JmF0S+ifW7DgFwC9AUYyQe0yyjpFJMRl8zGWCkEpBNtL9PCWzmjI9etgkO7G/Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143821; c=relaxed/simple;
	bh=1D9mv5SGRa+IFU3D7tfHuRGEPhtf1iQMl2p+LrBh6fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZzYg5b16AyUAnSPi187YxXJqAVtPVZyxSGpbt++21N1hBI2fkNESlt/F+LISaJMvpoXmWLgGaRt2Ik9UctcrWxNyf2cKuNy0vmLgi0I8MgB9Sx8XIQofAbnsd7cdhHD+KuZFCiVN+Nzc1eMLYkSbRCTzUFfA8RpL+yw1e1ONKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGZVjZyP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCD7zrLp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGZVjZyP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCD7zrLp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lepK1218643
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xOMz2w7velsYwKXfya8wXK5ooPMNVK0K+i3nKM/esAA=; b=aGZVjZyPSSM+5Mqw
	RL6BjGYpsGD/b5no9qmxy1EyFLcq1WqcF82/4OV6zv0NrYXAV7XUuYV+QV832/2Q
	Rd/zA4mvzEkR2aZC3QCydUYJSqg3XNQBDilVKDz6Sud3EpNnTK8r8VA5p/DUGnXY
	0jdXEEBgGJLH0UVM6Q/gljkCz1tIJwDvnO9DS+HkgHLOOBCbU+4ISQC8gQeAgnLd
	84JHfTfOL0kjwHDjRXfygtxYJZD6Bi9nuw+73i5pujuO9uyWkwWt3qOQHhF0RYSQ
	K4MlV7PIPCPipT8b0lQmQ4kZOx52vV5qFZZDjBA+Ku9Sr1Xqp/HxamUrr+EKsHUc
	YeZ5JA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb5seamfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:43:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-533758f24f4so16017611cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 02:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792143818; x=1792748618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOMz2w7velsYwKXfya8wXK5ooPMNVK0K+i3nKM/esAA=;
        b=kCD7zrLpoyqFxEIFmAOyqDBILoxvmBvZ1Ku3YHvHzRG+roAibqOwlWGVwcrkaxvl4Y
         O4ztF+1CiLQM7x1gag9BY/Vv042vbi8vns8qVF3AdXEUJT4MCFLeDiObKFuCtcIj1N+9
         tLOJpBxymw1XSw5JM36hiRep11b+payg71wmEW0w1jGW9Bb37KuXKafxC0efUTNmFZai
         Jss3HLNO+zkSp4JeupUv7WNj5bEhmTxIxkrWA5ytPbioVFezyXWriPbokPRcu2U8NdlK
         Orq1Vou/S/JH/cjYnTD48IcNqqEOjrdbQD+TGAyHIpbykRFIzFPRx34QgikQygcMk2J5
         JSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143818; x=1792748618;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xOMz2w7velsYwKXfya8wXK5ooPMNVK0K+i3nKM/esAA=;
        b=pSYNhH+Qi55XvdBbSoCmygYs6QMcwXOLoXU/n+iJ3CqkcuQaCGgAS2HpNQWJvDGcQL
         nihjS3orBPYjsWzflTp9EjaJ/bKalwOYSLZYCFIa90qakTu19c/Il0GAgZqLuOv/4qLI
         FVLWnDzuToSFPP9wk2ukSOQY3XyN6+iNEyVR0sb6E/Ce2+JkN005ld76I7g1ZCihv4Ts
         k47b+JDz+t5lPDGyTWam517c/sUo6iniUdeipeecHBt5b8pSyM+E14qOqxXegSTtAs9Y
         Ng5ODnWiqXjowQa6TDhk+yWtdp4JHBP125rcSXfzASkPlcqluDWgKM6JdQTSLcbpVRfu
         VLVw==
X-Forwarded-Encrypted: i=1; AKwUvBx1OheocmENFBocUenafPFIVzS2lOr4rG8N+QcJn2aLPvGC0RfZ+/2/2BZ0QB32GooIo6L80l25PjTJ8ItM@vger.kernel.org
X-Gm-Message-State: AFq9FYKbADZeNQgucIZJ2ZS1He1zTh9Lb3ntR6mD1hIgjOozAB515auy
	cJwYR7ksv3V/dkEHhMKKfYItPzzlCC03BwleeOLqg0jpv4Wm5mmDAUAfsUTPrwsHyKIoykK+N0z
	acWzpagURccZDrqM7tRroQbuXPbm9o5mCUr4/ryUR0u3CvFx5CJ3eQiQ0hXhFInRtBiRx/Hzf6r
	wC
X-Gm-Gg: AYBFou3vy1wrxKd37/rGwVPycbxUWflMSe7XJ36dANWQI2PusGT1i/nG0+ms2dZgdRl
	ZktlZvNw3Vk3Y+6qHA+1GeDRHZ3V59vjQHfzkf5VBz2sT5Mt3FVWH7PdQbcdbWpgU2j+PO3AzIV
	edjiecAWPiyEbr3GyoXOhtxM0rf3ehpX+R8UbiSWA9HDi1oshA8ZDx4y3CK49T3pzbnLLOVMNfw
	kQBVsA6ra/RUfhavNdfOdHR3GOWv12qGxZRN/yRbQQbXBNhiexjq4ewtyJGBfXZcz9sWGtTl4/J
	g2LlrJVu8mHkEI8vu9nMBZo/o1xUEFK+asjpFTe/2L76SF+/sQ36RW+7ODB2toq4InI2wsADrI6
	If4iYFf1FHZVeNTyj0MK3Lg==
X-Received: by 2002:a05:622a:310:b0:535:6cc1:589b with SMTP id d75a77b69052e-5359f489440mr439000681cf.1.1792143818163;
        Fri, 16 Oct 2026 02:43:38 -0700 (PDT)
X-Received: by 2002:a05:622a:310:b0:535:6cc1:589b with SMTP id d75a77b69052e-5359f489440mr439000231cf.1.1792143817558;
        Fri, 16 Oct 2026 02:43:37 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce05csm56418266b.33.2026.10.16.02.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:43:36 -0700 (PDT)
Message-ID: <ec92875d-2ce5-464e-bcf1-8596ce0a769c@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:43:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] clk: qcom: fix SM6115 lpasscc register offset
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <3a4e8d1115a46c45cb34193b6ceeb02891fdf716.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3a4e8d1115a46c45cb34193b6ceeb02891fdf716.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfX202AdNe2WaM+
 VP0SMnneAbeIyRtJ5UzNLUggp+WZeiWMFdNTEiFxtlJLddzYbWFgPHpMCRq5hwNSEl0g1gUj69Q
 7ooA0eW4p7ZYO9Fm/UEy1c7sAuUQuBw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfXxF6V+QWN2kTF
 zmb7MUb2Ti14wMnVATiesBR/V0bMzmP0JpkKWZi3DRW9jt7twQ9SyTF18i5r6EugIadQUUrfQxD
 UmqK8ojPKdBLdcCXf07gw3xnv/CXBCsC0d166fwqUBzQs6NnlC/eMdTxXWNJN6hk4ifxLMTcIZ8
 h/GLJm4Y4ZzNmVn3QOia6Wrn9KjJMp6YdEX1j2SjCsLmFmrenZTTr/8v7lM953oMXk295Jj+Qn0
 84U0btfxaJzgaNe/Oqmsw6hfUhOfsZuey1yT2Ly1SUAyGwJa04SdwEYmTi9WAgvxsiKwWDb8x+W
 a4AYr/b1l59bF/PCZ5pQWIVjihy+k4lZzVilkVk0DeM/ZFtvuWGrQQwu+T0XTOZehwxKBWzXeW1
 w0JHsMJxuQGY/YZHlWNNaRvVFzXJv6YxOBus6lHWYxQ6eAiAc3PDBR7S3Gb8xHDhvntHNqsVNcg
 m4nUog3vQNFqF4r2iUg==
X-Authority-Analysis: v=2.4 cv=P4yvFSAu c=1 sm=1 tr=0 ts=6ad1f1cb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=g9NP2d8Y7Qd1zHIpgpYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: fW8yAbj7nwdbnmdpKI423I0i_ltdSyxF
X-Proofpoint-GUID: fW8yAbj7nwdbnmdpKI423I0i_ltdSyxF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160038

On 9/23/26 12:11 AM, Srinivas Kandagatla wrote:
> For some reason we ended with incorrect register offset for soundwire tx
> controller reset and the regmap register max was also incorrect it was
> 0x1000 instead of 0x12000 which is full register range for this IP.
> 
> This was somehow compenseated in DT reg property which got it working so
> far.
> 
> Fix this by correcting the actual offset and max registers as per SoC
> documentation.
> 
> Fixes: b076b995e225 ("clk: qcom: Add SM6115 LPASSCC")
> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
