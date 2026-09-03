Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2383EC824
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 06:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417535; cv=none; b=dAbFwzh7FQsk6sgWmDbWSkpRXtfPPEWVITWnwxJaCCUFMsp8BlpSZPpEATbnOufdkKBL30mSpLB1PaE/JM/oxnF3qpO5PaXM7bcMHXkvjdqQU/F1+PFp06bijjBDfmOjcoyVeLMWIHaqdATxxF8K8qr6T3N+1kjwvU9phOW9W5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417535; c=relaxed/simple;
	bh=xr3EdbHecvtb48ZZz6jAzMvFH3J4sYscKx5MxVg6XRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oACd8T7YUS8hNCfU5GhR1ay6VxFVQsRzEKXymLmuGmlGFYY8hwPazN4hukJHIn5hY8WtUxvHpXvDsxNfNIY8pf9FpX8Lpq9i41vlQpVUHDaCJT8T6u3OAcMB0gaYeXhQtB3E5K2FECGsWh9myT0NjHM5tdto6t6wWJf2jBRHezM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CG27UCLu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NKgzwD0R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CG27UCLu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NKgzwD0R"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lgab3912725
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 06:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q21UaDH1Gx0zZRcuplLYEFLHbV5BirdWzzoxkGKL2/s=; b=CG27UCLuRQNkzumh
	I6Qoqg5E21BRxR4VfC/MDWmPiaJsed6D32s3te8LFDfyXyiaagK6NrCYj/1PGT+l
	0l9Twpearm8Cuf9T43Sle87YWFTWiXehgqyWThvqZOvr/X4+PnczUW1sQQjCuJi7
	HdcH1aBSU5r7Nn1Gdicrv+1AxVgDm61MHC/TK5Gd+kIlehnmRpYytTKAj0aYoUBL
	CAu0ZrXQ3he8Jz9MxPJRdd+y17mb8TabMurRKW8lij0Ypnz4B3V0ozPDl5DN5sXK
	wX67vqXSixWzvdSUZNzNSQRfF+aTyd1YAKzxFvAXTHN3PFXKhzZ4hMXQwwg1sepZ
	c+aT/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8cast-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 06:38:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9349ba88188so44498085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 23:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788417531; x=1789022331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q21UaDH1Gx0zZRcuplLYEFLHbV5BirdWzzoxkGKL2/s=;
        b=NKgzwD0R5oTDpNQ9ZEL+uXEeJuhAnDqvExFP2a1fdbOtQxQjKrJ1n9gLyT35eDwlOF
         SJBbkxsq4zDTcs2zWx1N8AG2tIudQKH8DgtXt7ICwiJDo9EcqVhzj5WXSml0kbv6wOqb
         GdAfYE0It8gcNOAUaom7YXEnJ2r1iApvqFVeD2C5n/LKmlFrbtjtJthrC3Ow6UncLDxr
         Z61l90lFVuuG+RD5OwOHIPPrkrIE6/zWNC04d4v+i4iXmJsnXCi4vX1/MRz9ia5cQ9h/
         jahn+iUF5TSpj/h8DH9FW5zwCUBuoiFyoVatzJkZqPwJrzLzRlTHmk9CB9JgPZ2o1tem
         yXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417531; x=1789022331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q21UaDH1Gx0zZRcuplLYEFLHbV5BirdWzzoxkGKL2/s=;
        b=aFhy1IwBZmUq8GDxbVpegRl1RyPf1qO3BF2FYA6m9Ym5GrIv9adVxXQE9FCXtvSb+c
         jlKmv9ufcujlgX9jCRnxNQ+70XkyvlXSt4XzkjoMKEejfbKS+j8emgbSt2/I8h+fHCfz
         MbWeRXP1aANxcjgm5rc+Ex15ZUAlRxgvYQxP+83BQ/1vVQk6yghJ+nyDINjO65Mp2jIx
         ZdWarhGGHpNsu4FmPklDDUJ6ALTQGDvK8iWwoapjOFJPCX5TO3y8y5svQgHsmf9Enhgn
         K/GZbW78MgWab/mLGHkxEet9xUP8qyD93VGzoLz44pKhGfJ1fk8IHlzaQH6KyPiJCfxZ
         crbg==
X-Forwarded-Encrypted: i=1; AKwUvByCXF4ja0sYCumj7CZJH11IO4nbGsXkOKVBUv5u+8XtQKd1vNGiwliPvAtxoqNDJ7G/j6JHgRskqAq9pewW@vger.kernel.org
X-Gm-Message-State: AFuF++lnU9vq24zFSnsvcz5bAKibxoKucNuvFs4zzHuj8j3zl86lhsDj
	aLYijndu3uaApKaePLBmJIAG/47Ctnqo1VvZTHtG1C7MXEI7UoNKkxoh/ZuT3AlTFaibN2J/dxY
	hqdK5u0Gh456YhlwOTGU1D+f8cDh0ff7wI/8gqagdQzcMWZ6f83/JQG3JeFE8ONfLZ+TQ
X-Gm-Gg: AYBFou0W0CxOIFMXkt7zqKg+mb9KAjpMNtUMkbaziiiulgS4SOdPJ1BmxbYjuAIRyBo
	YjHUfDD2hiD0TOgd2dIXrgx8d7AJOf/9l7OznD9ix87vocNhW4I1Y7THVWIGRMVCErz+5U5RxEs
	Ccc9ETUmIWz8MGHsawpGl394t21jGsYwVb4wjfaUzvJwAYe1f7+elbW6+HG0Xr2FvYgKW7JHl8p
	mgG180Z4Pbzoc3OogbVEGmHiU3GR7JKKmvF8diaBzpAfyrUkeAeA3ypjb6SoFLlr48TTigbterV
	GL4PDsRRsbjO+cSQ+jf2rQohE94W9/19sA8vrUSlFaYLM1J2lhfMeER7JbN0sqq4zRcWb+i24jF
	alaGy+fxSF7KYhoB0pT8tbg==
X-Received: by 2002:a05:620a:a2cb:10b0:939:6b7d:9941 with SMTP id af79cd13be357-9396b7d9994mr362299585a.2.1788417530935;
        Wed, 02 Sep 2026 23:38:50 -0700 (PDT)
X-Received: by 2002:a05:620a:a2cb:10b0:939:6b7d:9941 with SMTP id af79cd13be357-9396b7d9994mr362286285a.2.1788417525612;
        Wed, 02 Sep 2026 23:38:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f6c2a8f6sm40501766b.35.2026.09.02.23.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:38:44 -0700 (PDT)
Message-ID: <ec4c4c56-f976-4e6e-9b62-127952e839ea@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:38:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm670-google: Add NFC support
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Acayan <mailingradian@gmail.com>
Cc: Marco Mattiolo <marco.mattiolo@hotmail.it>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260902-sdm670-sargo-nfc-v1-0-bed1cbbffc46@ixit.cz>
 <20260902-sdm670-sargo-nfc-v1-3-bed1cbbffc46@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-sdm670-sargo-nfc-v1-3-bed1cbbffc46@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BTaqs5D3iWSpWZjRiDKHHAWoChC9cP7I
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a9915fb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ROI8ggJMWDmTJZJ5NsAA:9 a=QEXdDO2ut3YA:10
 a=Ql4v02ufxVEA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX7zpdtL8pXklO
 FPJ8xa/8VSTQqz+VPag3csP8T8tLhXQ3mWeYpr7t8DRKgDMHapQUKYdidlPjGkloiV9sPzTDIT0
 TzBGpbpJs4FXZwrGRiH/GabgzpDVBEZCt/tNE5h5m5d0JzutJxzUGQ+HEXOZ1F5HsIxP9LRjd3L
 uO/5eSVooTMWqciwgWu4WK5FlulqHc8DV2mrDWvrM05VQpc3ktaxtketBl+Qz1pur3WoIgdWeg1
 6lYSCft9l8WOOMLMl3PTWtaUemC13n3fsnD6amqsGQio8mcHUU58LloFT5vUhKfSN2SmGUDc1ld
 UNaYCs3rPrAfyw9dCupclFLN5ZszdqYyDZxW+fWnt0KxBl0GVqi4VlN6dSfsIfwOIeqinKEj1vX
 54XCUEEfboFMVkPjj32LQSpC+hfqg5RHNSQ0sTd5BsE7sfyiWxctI4ZyovVfk1zSpDHth1DyPGv
 xtzyzx1DENW/K0fUk2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfXw2WeL9f8q4sw
 WmtCRLSXYvBLz+WIXg5sbAtid13LEi7RTsonGwS+F6CkSm023jme8lDqLSVUFZBTba8iBYLYLjL
 CX5c+kHMep+QEa/D8nHQOUnbRHk4uSw=
X-Proofpoint-ORIG-GUID: BTaqs5D3iWSpWZjRiDKHHAWoChC9cP7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030057

On 9/2/26 10:59 PM, David Heidelberg via B4 Relay wrote:
> From: Richard Acayan <mailingradian@gmail.com>
> 
> The NFC driver can detect and read an NFC tag.

We would hope so..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
