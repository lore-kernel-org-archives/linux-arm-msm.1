Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E562B3101A0
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 11:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784200222; cv=none; b=SQUvxHanaHZ6/0/UyINsXQsbtKAEGgocOv8LIdwwWmSHPERcJRiaITI1C8Dh9sko26sUUM49npAWgSulM5Dn7bLyxQqYHMOdw6HqfptoegCP8zMD2g27Uws0VgLi3jG9XSEar7Y7lGuOVvv93LhdAvy6rtt8ec0pTDNAD0OU8dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784200222; c=relaxed/simple;
	bh=VS1DNOy/Cl2K7mK9aAa4L7mA+BxMKG5ZGucF/etqAkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPTVj11tvdCSAJNJXNPLmjzbNwQ0a8Hf7TGNdJSbMunNtWxStX+pvgfdKh9cXj6HXXRdE3ZRfuJgUDWAQ2wlu87NwGIjxKLJ80obmIU8+OI1klNec8dNo0ULcip9J3VtDO9UpZfwDfzR+8u0AcUnvYOFdkdAkIetgSy/Qg/G428=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZX5DEri; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b4r1Bv+p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZX5DEri";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b4r1Bv+p"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9rHlZ2259598
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 11:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	But9yWYuJfwQsmOxUxGCBVIj5+3+kBHnnxzj50vS3uI=; b=SZX5DEriBSO+MYXQ
	ObhImhp2Whq4JtoOngZT2eY0pYpnNBIk9kG/iNBboAC72LlgEqrIj2+KMDXUv8Wb
	49MFytd9A4W/r9N4YrBcvlaUYcblGexYPn9EeYbo00A8f/U4/6raO94Hp2udOo9B
	nU+n7sDODoWypDG9aZLJBbLHHzrul9nsl64qyWHH0/BWoqOC6PMKxmp1o/T02SWO
	KinslBcBBSljYIEgrk0J4xZOq9puFyqvN9XvL0Do2FvGxT075qZgJiMt7iZV1NEm
	d4i/WafzUfJlv45gC+AIVigI8TGaFtzMy2/j4MTvTmfMVxQoG2iujC4ZT1StIy3B
	3OJJgw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv0f84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 11:10:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so10114470a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 04:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784200217; x=1784805017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=But9yWYuJfwQsmOxUxGCBVIj5+3+kBHnnxzj50vS3uI=;
        b=b4r1Bv+pIUFcfdU8u97m6Fc6THbN0VwqwXMjjHJ0U9/C4MT5bIDaLRHOMo4q+nVQmu
         QuGQ90jFn9TZ8v9Fe2WoB/DFp79gOZ+QVAUGOt41StEaxNtv/0v3dd1cdtI6RTzPMoIK
         aPuyzAD9u0i+gV3jD0R0zwxKsezHHIEV3FR/z+NKcwV2h3pAlawgWkaAO649GJwwKAcL
         2QC9yUKEmmHPFaAqLtNASmnFSzpM+CEwTfTfIpgYJ/REntjlWH+7NWs2lDpE/Sb8f2tm
         YV69soYhQiIAnvUIskkMK7s41BMup7xiwgPT6/6MCOtfjktF/uqddLho5DqlzQlM02Sg
         RRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784200217; x=1784805017;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=But9yWYuJfwQsmOxUxGCBVIj5+3+kBHnnxzj50vS3uI=;
        b=U1QzlC8KA8NSKCAlup47GRyolwg0yrwgja2EX8yCjZPh1TSn9LlQmMZWHOu3dwCxpH
         XrVzz9b/vaCSEPHnlQ6mTzrWzLPgLxJLlmlHefTl51j4UoNqojOvXh+KeOQlcuph+aB3
         iVMpn4ONgnA8lOj3mVPLXDOWZ6S5Wo3ROSW0lyUDgpWlVh1s9tXgLbB1RxeJ6N/kpx7x
         Qe1xgYfOgA1kEvCliWwge8sIZcxkKnuOCxtuCdEw84Nj0igy3FcIyCrDYXsPS3uIFKV5
         TEiVL0WwW4qM9vqnfEdcrZdKQefyseizD+kYTHfcB5HJhPQjMjyuY8MnEsRCIo5aKYyB
         ibXQ==
X-Gm-Message-State: AOJu0YzxptjBV9TmOYafLndiqr/0wLH22kY0DjlYtuu1uP4Cj9bseUiS
	hEZVegCAWSnsaeNByGz1p3MLF2OlP7tgTeUEFXILaAQw9N9s5AdDd1KO0w5H6ctV1RgPfEZkQWV
	N7ipqs7wyS272wIHzhrsLGCd4uOGRe09Fwfl31SVeQAaVbavOEUaaGiD49CDPhzmFbFZIl7MinX
	4e
X-Gm-Gg: AfdE7cnD9E72MDpLI81fxieLpnc00p8IgZGu89u55Ev6qnK9yrkeFsFxpFH2dNNGGd3
	WoXJYckUMPiqoifIcFoQwagSrEM9RtM2UsdzmJmfunjmz21n4NGMcTeFNXKJmitiLWj0MB4QM8H
	BzunPc/trS14R78HnZkZs+DhgX7IUQ2mTCq2lzjw6XxS8G5KK4s+IcJjdkVGKmO50dHtutaKB12
	FJ03m2ImJx4c1L3u4mTGMAduk7XN1VrcIjqRj3seFzY5ESlCx+b++lINpxas7gYFyFgz0eYOusY
	1ADsdzup589aeGOTcfyXxCTzIWhUTl+0TEGPtldttEn0b2BrKmgd3IqwADy1ZSKU2AFNstkdm56
	eFttNjwfyTWB/uFOgpQRhZCNE+I5L9Uo=
X-Received: by 2002:a05:6a00:a114:b0:847:439b:ae30 with SMTP id d2e1a72fcca58-84a6726fb07mr6139598b3a.20.1784200217025;
        Thu, 16 Jul 2026 04:10:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:a114:b0:847:439b:ae30 with SMTP id d2e1a72fcca58-84a6726fb07mr6139551b3a.20.1784200216555;
        Thu, 16 Jul 2026 04:10:16 -0700 (PDT)
Received: from [10.218.6.76] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6beb97sm4643536b3a.30.2026.07.16.04.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 04:10:16 -0700 (PDT)
Message-ID: <d10e2b8a-ee88-4a92-8a95-7468c7a514d6@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 16:40:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Add irq_get/set_irqchip_state() for msm
 gpio irqchip
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260424-pinctrl_irqchip_states-v1-1-85286f078916@oss.qualcomm.com>
Content-Language: en-US
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
In-Reply-To: <20260424-pinctrl_irqchip_states-v1-1-85286f078916@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDExNSBTYWx0ZWRfX6piR7MrDWsgz
 mi37jcShIOSJ4pQ4lNPuzmgXdg8cLTIrlPbGwoULm2YV6eSC8txZtjLEDiVcbPsHkG0NO9daBRj
 rdYQJlCMws0ch0l6ln9VgCFlUCgAkc6KKKmELsiqXGNc8nOtJs7KQj+xEz7BqqVA9a6nSFd7/PL
 k8lQP1l6u5zJsQyeJZHUnZocgmv1DIcFiEL6YMz655wHRq6OI4oXMZEjxTr+EqCJqMm4dlZF2NF
 QVG2xwi13S+iBqNFXFvekHP+iqMz0UGevWWrWp1BcM/bcAGwiUPdxkzQ0xjkJYHeKAiVmKIrMDr
 hkRG5dUe/NRb2dJUiMaiOcbWQ2T+hMz1ajSyMEodUHGPtCtFfhqBKrzpCpOdDSPu2Q7kdeEJrd4
 +iHUrgnIPU7rUpQbUlm1Xou/oNXTdiGA/uVSUQGsBHnaJ6FwaffROREcQ+wE8GfCmIP4Tc8hjcY
 evczaZ+KIpB3RF1JiuQ==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a58bc19 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jlfPM1XiwSsKjbdNI6QA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 1qn4X-Uqc0B3hZEtj2nrEYSUrp5EjbvH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDExNSBTYWx0ZWRfX3Q21pY135NqX
 dHFo3cJxRE0/jr0mUUsIRVDXFIvucOR166Toz8touME2BbvVTW4TsiEr96HAUgK4qbRthhxQzAg
 FmfKigh+4dG8zfpY3YixsaQWgoLBmNc=
X-Proofpoint-ORIG-GUID: 1qn4X-Uqc0B3hZEtj2nrEYSUrp5EjbvH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160115



On 4/24/2026 12:01 PM, Sneh Mankad wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> MPM irqchip monitors the interrupts during SoC sleep state and after wakeup
> replays the edge interrupt by making it pending at respective irqchip by
> invoking irq_set_irqchip_state() API. The msm gpio irqchip however do not
> implement this function making it impossible to replay the gpio interrupt
> on any MPM irqchip based SoC.
> 
> Add the missing irq_get/set_irqchip_state() APIs. Implement only
> IRQCHIP_STATE_PENDING case which MPM irqchip uses.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

Reviewed-by: Navya Malempati <navya.malempati@oss.qualcomm.com>

Thanks,
Navya


