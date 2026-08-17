Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488DD3DDAF6
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786968068; cv=none; b=KosiCjk19ZsQvp7la2qaLB1kXF9o+JVo+jPfsHJ3MIUbRr1QX0EfOzcP+IXtHyeoLL9jrgQJA7xPvVYZFDn4a/BmTvEMb16kFy/wb3orxkYwxlI4rjb+SbwJh2j6A52/H7ENhqN63U4hZsz6ttmBLkXjqqzAi6CekQm8ZlFdEqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786968068; c=relaxed/simple;
	bh=5SxJ0kztCTJTT8C0fDB15TkIPl0ysLuwbhFeFyfsBmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CL3SSRBMZLqjNE+KUc4Ne5/jNjQkiW9rqrXn+9qd9NxGFE2vTlIjT9oGdE3WMSrCv/q/11/9eHos66zdfjtkJ+pV0OHUtY1NgHu1LF93J+LNyK7mUcP4qAIlozDsX+Qpk3wM8RKaWKWdUsokyLBeoMUuidf89Qz0KF/778k+DgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0a+x88Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VepioWuI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0a+x88Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VepioWuI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9dgn32991286
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRqInRFjr4g8d6uI8kZ2yR16BwVUWq21eU3sFx6HoE8=; b=b0a+x88ZPlyvILLS
	wFJN4nZcNgJzO1ST9v40H5+jEHsMLNdebbtbPsUN7Ek1XXdCuuEAQrWLgsd95KsX
	6pYCAEo0wu4JYU4mFLLwOh077ITqlGvtq1ROxAA27VW+D2YYNbuktZQn+lyerUwK
	CrCaV1D2+sGWcYx/TxOeTgjIkTIlsIBDG33tQkFxKS8LjiOYXYx+V+L5YBFHdNMo
	Ew9T2erte0SO2GUSj0d8ZXOqHGaCnSWdSQTBmwDOAYSqG6B0YkDJxzP7IXFvg9jt
	M9IimyrQNCJEk8rJFnxgjjARGsLlJdD6b/4truxQBWX25lEbzaHIC1ggMA+vH/vM
	vuy0fw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7krnnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:01:05 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7386e55c63cso46798137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 05:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786968064; x=1787572864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRqInRFjr4g8d6uI8kZ2yR16BwVUWq21eU3sFx6HoE8=;
        b=VepioWuIgjeg0IprKmLKSM4l7bgqipMf2pH1wLnexXS3kHy4B+tkGklaVmKRVW6xt8
         YOR7HbwP2UcKlIH1KOc0L6XLsYz0ken+hqUtRGVndZZKl89QUivIMa3hJsqFmuMmu/mi
         59bZnk2s9yw0n8rznMwjphNhpgY1TgSnoyqiGGjA3eyp11qMI/59XYC7R3o8qlQLJGZm
         xsVlKb7C/Mzb/1HxAxN+cYUnd46NH0uqDIeHkmmB8dZ3TAOc7hGK58x0UCt6+phCJXpX
         vfgAUcI7ui60s3keXXItebxGKahsq76y16U1GkQGn8PMmweMQJH+tsmuPSHwUtkZ0mre
         9f6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786968064; x=1787572864;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRqInRFjr4g8d6uI8kZ2yR16BwVUWq21eU3sFx6HoE8=;
        b=TWd4/EjtTuLDdTYlU1a0rIP/UMabLoeDWK24xvATjbmsbDIaEEb5kHGf/uTgSikw5j
         qpL44aMmQnKQ7dOq3hGMPMeq8P0mw2LLZQ6fmZQ9SDOVeVgyeqhKvbu0Hz7Rr5otjQ0E
         PX3Sdk+PSPdpRwI8ScVSGDFRqv91ecNHAFD8kj1X3INonLSWPR/yijcIOEIarDJsxfRv
         Aky32qKRszvVM1soGgB9cKhjbqmTvUuyOk4U2VIR8m1v8xGugeDOyAWfX4kYdFiD/lzj
         Qw0QAAfVhz9b8xblHurlBIMGQfiaF70soyJYkyAhwMZqLGlJJh6H4KpVt6L2pXMBiyWH
         qO9w==
X-Gm-Message-State: AOJu0Yw88//BvPJYj44UJr+6yD0mZ7zDnuouqke/EQ7B3xL8A6tzotfA
	5dtTTRN5fhvwJDO1xTTV/72E3yZVUAxqSmaLOX0f6w2S3L4lnpizdlHtvdza23pDps2p4VqLoXX
	n8iXhCQFbT4DZd28rRoZPHRmB2bl/ISmOwbBCOCaIWGBn+YpQU38Fp2E51nVfK8vSzpM2
X-Gm-Gg: AR+sD11WbCEWy2KgRrtGys0VsbAMDzsuSPJDDMVnxHaQheNMb9b4YTV6nNIHRcMg7MS
	bwbzSV2MkWU6vgC0Gdvcz9Daw8/6BL3iREN/6qwoKRe6EpXmRDdvQX/LSKRsZd1k+FIiclAf81s
	aqNI/ueW072p63JQBMXJBjrq6XBUy2CVe/upeW0xMUOy+QfwYXSBzLYRo/D61aY1XNnLt7zWZc0
	luKEnNt4t3YwAk03/l5XlqcJSCAQ1OW72iq6aIN+t//X16kuEdf47MF3+JzvURsqgby1xcymV7r
	hE3+J7IKikUqNZIrsPLMZH+++bme/RLKzK6uO64pM+TWT5rSOxjjgwkwUpomnMYQKfmtI31GXeP
	ApR/NSVpwOTDaIIo3+AKkggkA
X-Received: by 2002:a05:6102:3354:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-76f2afe54edmr1670684137.1.1786968064453;
        Mon, 17 Aug 2026 05:01:04 -0700 (PDT)
X-Received: by 2002:a05:6102:3354:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-76f2afe54edmr1670628137.1.1786968063786;
        Mon, 17 Aug 2026 05:01:03 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc66bdsm12587866b.58.2026.08.17.05.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:01:03 -0700 (PDT)
Message-ID: <072b5f27-0f6e-438d-9097-40a5685cc4d4@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:01:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8750-qrd: Enable Adreno 830 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
 <20260809-pakala-gpu-v1-6-207ad1fac1c7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-pakala-gpu-v1-6-207ad1fac1c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 931KfLcRVQD3H5rkP6emftVD_urst1aj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5MCBTYWx0ZWRfX8Z0OBQFJnGHV
 xMwgc4U6V+RTBZpHif87ULNKFOeo6s97kDGnIU94e/xLXYu4/UqUNjpZyNkAldFJ0wfxW77M08R
 Symz5wnmxYnVrOsbBFY3uwQl8QMiDc8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5MCBTYWx0ZWRfX5UHtwxT2vwyU
 hFS/eNCGNuBNawmIqHBnbmbH9V/kUltfRbuQpLqGnqSxbSPt2sWuy+6VE5cZeRHhJx7+E4OamPD
 9Q27AILkNHNb3wIlFuyMh1D2StDBk+ZoOYcGrvwhXEIhLRjoGbT/8cV5+xDadQBSJW/quCqbaUw
 IM5hYfLuxY8hM3WrmeCB/8A9o9vFtkgV2gMp3OflW7jw8ygCayzVfsNsFw8tDQz+XksL+0NOkpR
 lePzkSa9+zAkPW7SR5C6OlHG/Skguz3dkiXobe+LuiIR4a7iin7eFHK8OFG/c4TtXbLVwDhwhxX
 5aheBKbBNWiuEAjGE26dM6yLhh3U9EMFYZ/WOcb7U571GV5MIIPFvZtxLXh1QC+0tg5SRQZ6EI8
 k8SYEEvlvHJaJ17txHr22Z3P33GUfvfvxnPu/+hnVBbM9xMfVMWYBpsFStqUPUk2NiCuJTXbyZg
 jVGr8LLemdRef13gYAw==
X-Authority-Analysis: v=2.4 cv=HYEkiCE8 c=1 sm=1 tr=0 ts=6a82f801 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: 931KfLcRVQD3H5rkP6emftVD_urst1aj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170090

On 8/8/26 10:23 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Enable GPU for sm8750-qrd platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
