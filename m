Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A58953A3A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170742; cv=none; b=fL2MF4dYn4PqmgN+yElpYfu60vLwnDKtKC6uGmIsNGhahslZXmcjALS1Whm3BeA3jRbJsMzdGXftneX1BOVTYL/AkbI/D/2d1uZoDAEmHsJA9CZW+e0MUgibOlBwfK6UGxhF02DzRpzNED/iEjI0yQ3d4iIcyvgDLJ9udEHEnH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170742; c=relaxed/simple;
	bh=XfL+ZxEDCfoh3jijqnTucyfCC/JyuOUpep+epv0SiVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k12wGVc1ko9gB5aSwqHBf3g2xCp1ZA2XTuPDjjS4cfQfERyG+2YAovgcnug51fEebu1BpsctyAgt4c/o8eGiO8MMA6X6s71coNR5w6w9fKvN47EosJsw+JU60qsBJBDO91JTyTXAg3UXaohTaBq4F5xxAqqsceVH+C+rcjLOuY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOf6n15n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WA7ou0Eg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOf6n15n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WA7ou0Eg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbewj3414040
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IyILZqagdiI0+RQboKVZiglEEbqXmszP8RjuXczTY0U=; b=UOf6n15n+eWC5LeG
	Rvedo3cs6xTTRba9A8rqwkkPZuU1CrXsWiGPeU1LxU8HGmFM5zsFL2EJrGZSB2SP
	OPQl9I/cqN52rhL1TEALopWdcLcCYq6sCpiWh3w60sQ4DAlwylrN5qN5D9fIF47H
	bwqNeznWtNQdRJ+SrpwbpvVGnDE5dX1Z0kkga3O/hg9dqFyuajb5T3wl1OGaFXTc
	5wNk0KOCbJzU8ywTXfIz5DBBeV9xg0qXh6T64POSJfT/TESU/E4Ojr9S26nDUqXu
	2M4q1icjQN2o8W6M/weDxrou860ZZiMzkNvg+AmGIoZYfImPj6XqVcvlm1IeU1Le
	J9d/jA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n27w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:38:58 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c665139c92so97357e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 06:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790170738; x=1790775538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IyILZqagdiI0+RQboKVZiglEEbqXmszP8RjuXczTY0U=;
        b=WA7ou0EgBrjfwwPKqR76rfiCWZhWUuRwt6kDjp2+eoU23qhmWt/UHmbJp+6Nr/XZWG
         c2MZN5jkrI14XV8JZEGMGSaadqKpZJVyTVCi4UDHi6ZRHnv6nTvQbBciY69Gn/s1Cwzu
         Pv+ONqvnzoCZUvnRTmmHb7yVT1jnHT/r76olKL1tbgEbMlWRG+7YXfpEUlIvQZSqJsfr
         JR3e2bsq0o73EKGrD06/tp8hhPsfaRK1snd4jeLGmNP9fdcjcWZENiaCA+C0wgDZMDMr
         eVbFNn82++mNdZsBcmP03GHy3NHdLYA4lMduoi2FRmepnm30DpPpuQ3mjB+uA1/1VkpA
         MANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790170738; x=1790775538;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IyILZqagdiI0+RQboKVZiglEEbqXmszP8RjuXczTY0U=;
        b=jGmR08Vw1UKu/JtODUFhBKenhUU6KHo6InwjAlVvt7PJK48Kzn0R7Dwmf7tmEIKCHD
         VG77zQMB6pY+bcuV1yFrMb8u7op1LYO7dhHXf6oDzu4GNZddsSPYZfhtoPU6N+GCbZZN
         35z3JR1aYQyZ88JLhYvWvexBsFAvyHkjOyOoxT3nATXlgC9FzLtkGmVFrMYdB4WxeH7R
         W4peKr0+tSEOVM0Okcmc6mdkoUTsbpa/dNbrLNOTwV6LcsNYFOFP3gyKVkTBesyZ9G0P
         DDq1vYsN98V620jhtZ9nHobuMXOL5P1+sGvQwyDKOl0V7n59HpAd5psdLEH7PJ1NRo0W
         vryg==
X-Gm-Message-State: AFuF++mbQHI2zM98QDetLXp4gsKMdAnpNIylcNcK+2mhdw2ZryYKFW7D
	leBk8J6KxiCa5EkMvcHqKpNSG8Hlnm9eh5lKJXr3ZIm+Pa3oBDrJIq0LP64PdKcRH1mdpXAFq73
	A3DUR46uVIYurI9l6QbR7Tn+a7kZRKU9DE5JAtb82sPTHFiiUn0yvNucWSp8x70DWvM9v
X-Gm-Gg: AYBFou0kvzYxcGuhe7cWzZAJIMg9LwE+9hUBkbU6JmRCqmLweM2JuS2slqQwO74Ghm0
	aSJuk2cqa4iLtDBP4gcDf2awsSjgBeu14zfNFhERMGy740uDO5pScLndmzTATtUtRxMNiSh4Dth
	tgTuld8YEPIIggXEH2r1/0R54qN/zAZPobA0amjDDV0zZZI0twXfHlAeDF8ODLQBXnsjRDdLNto
	wjkI5LDsXVFU0J0O3czub8vvDZPPpIda9j2w5k2qFm82hdOV8H1bu9S5alL8T7bSg/Y14hyepsC
	oMWzAiRXKhBUCmGJbkcM9t811Ze9IqoqDwMuUBUn3sggq9sIvYLOqcQk6QsTcdJk0rZE9z2Zbpx
	JxEt390gfBbENWSfyLZioeQ==
X-Received: by 2002:a05:6102:374a:b0:7a0:f7cc:5039 with SMTP id ada2fe7eead31-7ac182ec046mr2458889137.0.1790170737667;
        Wed, 23 Sep 2026 06:38:57 -0700 (PDT)
X-Received: by 2002:a05:6102:374a:b0:7a0:f7cc:5039 with SMTP id ada2fe7eead31-7ac182ec046mr2458874137.0.1790170737192;
        Wed, 23 Sep 2026 06:38:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d859568asm626319e87.77.2026.09.23.06.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:38:56 -0700 (PDT)
Message-ID: <fb54f1d3-c6cb-49b7-891f-6b07bd2139e2@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:38:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] soc: qcom: smem: ignore multi remote host
 partitions
To: Albert Esteve <aesteve@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Truong <quic_truong@oss.qualcomm.com>
References: <20260904-port-smem-v2-0-bb497dd3c48b@redhat.com>
 <20260904-port-smem-v2-2-bb497dd3c48b@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904-port-smem-v2-2-bb497dd3c48b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfX2DB73zp3w9Ya
 UdDoZQt2KlEqxqBd6wDeGptaMYL20tYkD1BrJLHVcuRIRgey3CYOywhzjBYpCx5Rdym4OWExnpr
 e8VmNIt+NZlgRRVnIY1xmKQyRzoCh5k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfX5PV4ssIRGQXz
 o/CNltt20AnkTkDLEHQnp3Ur6b/iHc4BEQPyq/IInsKht50Lror6b1IXzohV42i1s+zQrZLHNWU
 cGPdO1lrEnc1KrMAK1VfUFQcxCl845tVkZAjTpNwgjZKM30QQmUYu0yC3wyjbyh/+QzlDF+S0+S
 5j80DRTHcrm7zhqhwRO919ZBBow2J8LKDgHu7zu82/axn5igE22jrPmZFuW8bDWFdtmQG2BctS1
 Ho+iXIocBOclPuJ+tlf1dsgfmKMmJ1vCCBb5TJOjrU4WJYMVyOTvGsPZ/xL5+S/Rb9kccH0F2Rv
 MhY6lWt78+gKrY5E2oz87TXtS+IkbF0dfOw+7libFufCGSQ45BQW38TYB31Qsvlh8dwWopgA2E5
 DLcp7T1ajkMEUdhoAMrbHX9v8Hi+Uhj4gy/Th7LD9XKz/XDl/LTwRXVYSSTE6BmdyQft48viqvX
 G9QrW8O9nIkyVTsZKBQ==
X-Proofpoint-ORIG-GUID: JTEtBijFzslH2JPY3_C9M4OwHObuZemx
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3d672 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=lahaxcoN1zEyVDRkNe0A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: JTEtBijFzslH2JPY3_C9M4OwHObuZemx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230054

On 9/4/26 5:18 PM, Albert Esteve wrote:
> From: Tony Truong <quic_truong@oss.qualcomm.com>
> 
> SMEM now supports more than just 1-to-1 partitions. It is possible for
> a partition to have multiple remote host and the logic to handle that
> does not exist. For now, skip all partitions which has multiple remote
> hosts.
> 
> Signed-off-by: Tony Truong <quic_truong@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---

Hopefully not for long!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
