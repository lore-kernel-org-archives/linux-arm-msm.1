Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F58141D21C
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 17:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786556766; cv=none; b=SI/VT1+xAGZ50C0UHd4SmB8NLtYh0ReuwSYO63xMvF6L2YL6Od20ZjAkYgvLgmuNIpuJIMtoGu/HYzieftB7EmUD/RrhO+Y1tgpRV5eD1YcUp1XReDpxT3vJF226NWa7ESYlNpGGy2Ig8CEaIxbfpWTdeD74mZAkXvEDjZ1GHgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786556766; c=relaxed/simple;
	bh=nk1Fl85AwLsyujcFprh5cdau31/9RiURmNkcfy4b2Ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j8PbJwQrYRximaXNXLj0jDFbJo1s8GJE1yge6NN35UjleqrwMZ6KvLgYP4OrbfO7rvTJ6Z0xnGImM90UylrSJfXS4ktDioXKqoCN/Maz+p7fFvrqKMfMHtpjKqZWocMPVix1HQE1wHoFpk7SMYLInchSNiQ3lxVg761rE3ZWexw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fICjw5Fq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JY7dH+vt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fICjw5Fq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JY7dH+vt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CGrGIN114021
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 17:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahKXfZ2L770e/Q//+DHZRZ33E/ISorZ8vk4O7I/xg/4=; b=fICjw5Fq00vBYH4W
	JrS/qUZTzH/X32ppo5i4WDq2vS6JekO+X/ppz4ABtdKnKVfPTEc4wuolfRxSZJt+
	CGBJelw6oJ5/ws8qDI8k/KJV8j/EBq6F0z7JYpTGxpIV+sShx7IStRDf9kg+dryo
	Nx1eqCu6KPZpk0/JhIdDcLXQX+T5Jo1NuVJ0WpbBLMBQdKqXGvdcnYpBidpdKCLW
	kDAy/jVnrtcAJ2NU78D+GR0qUEd7PzGVq0DZtjUkDklsHJm0adepZat4Cooqr7rO
	sCJPSmGSREt5lBqGVEFQ83GIDMV54AllJW5Ut1ZjIY6LPPKhpxkBZ+uABJr1DNHy
	uSNDTQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj1kd5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 17:46:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc86a9ef97so24821715ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786556763; x=1787161563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahKXfZ2L770e/Q//+DHZRZ33E/ISorZ8vk4O7I/xg/4=;
        b=JY7dH+vtge7IyvRIo10iGDLuaEusEgXeXfq30CHJsSrUSXeq/8AnZ9yGMuRtg5OE0k
         Z2I0Q4TVteAZbLQ3REFRuCPH3Nkz7yFIt83aL+RC2k8KsrGUb8ZFPRTwGkcEO+miFYqE
         +Jx3F2P855uy4L8olChFdotLGBP7gsp3nxX95EQBlUYk5Ltr76Au/Q0sTnb/CngcXSuA
         mISLuOuBhAgOC0A7+xKQlmWovsafYdBrGrn6OA7HzKgQyE3LgkPtQnhY5/3Wy7FZ6ccg
         3oz+hthDTfxzOinZ4EbUlDgmByy1NwpTluHb/1n3kH8QYGVdBZs4Mfs/nLLIHrUt4GOH
         N8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786556763; x=1787161563;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahKXfZ2L770e/Q//+DHZRZ33E/ISorZ8vk4O7I/xg/4=;
        b=ZEvuLMCnB1XWe476XGiATgb2Zr6zMvSM8TS9nuR+Q0fTLqATChNuuGe83BflFVSCoH
         jWbbQeomg6HF9tIJ3nIEqBAGwYOEpW0VMyrgSz0wVUKGv+GQshym8iqXnTDpkXSDpoiJ
         uRHOhubBnSaYQhhd3KY645AlD6Nb94SIauqSbbczPbE+oyU077T9D3hwZZB9MaiBjeNa
         ewAQ1hXSSW1PWoaiSUpaQE7j3rtWMSD+MSlbDeBSfTTB/+laKzYwURE9h1+59KuTfGeB
         5Lh+lgKCfeupaioDD7M+9q8LHsyRH993KYcO3BCACqwSc8wRlRD/lZHLAIXJVyIIkpu8
         lekg==
X-Forwarded-Encrypted: i=1; AHgh+RqC/LYs7RaAehL0Xnb1SqXWZKkFWGDpxeH2+VcLGDYrmVe9nDeF5cWUdjMm2cWSgB/XUj97pdJ97vrXX+na@vger.kernel.org
X-Gm-Message-State: AOJu0YwPRRrBzWIU264qquGKAbkCRwMiXd7pWl6ozrdnCZ8pHGJE+Qu6
	Q1i//cr3G4Q5t6GrKxCjVQUaQBrEyTamWHlIFW392NKRMFK5ORIiBNQcK/TfoeIUhUpg32kH5Fq
	2sV01ViGdsMk5SGEdoRu7hEtd3CvYuOfccV2ULafU+xUrx8kPt4FJI1qKwaw9laYKzOKb
X-Gm-Gg: AR+sD11usiFgcjxggdArQeewR4/PyLqRwNDeOuCj0CfYUei0yE5oYecqBpbxBPoKnMI
	eQwMRCmjwQ/IM3glOOU2y2In9QEHFEVTB74x5dLAKul3IU7JyG2e/EnmMu5JGs59zxfYyhFhuTK
	70d9bzImzFutXroU364NM97r78naB9LUv5Yr6O/CLDCnhKzZmwwl5NYkqfKdeCzhUAqH0Bm1qVC
	vpBiJZHezGFBHI5wm0SHNXgax7BTh5uNL/apRloYF0BQIiu0jimie2wPB7X6hfsf/F2flQf9x4r
	xuw1qr+UwmpKUAkP2KgBYTDL7uNJz1sge8sjIb6O0exRCKu8eMo78tHOAUWbeQ9QQ0mmoQNKV3i
	40HTnd9XQTI0wKQvUtcafccrs5YcCI6j0PRA=
X-Received: by 2002:a17:903:292:b0:2ca:ecfa:1308 with SMTP id d9443c01a7336-2d3456637e3mr88725145ad.20.1786556763179;
        Wed, 12 Aug 2026 10:46:03 -0700 (PDT)
X-Received: by 2002:a17:903:292:b0:2ca:ecfa:1308 with SMTP id d9443c01a7336-2d3456637e3mr88724295ad.20.1786556762588;
        Wed, 12 Aug 2026 10:46:02 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.230.104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c49ce11sm79005ad.67.2026.08.12.10.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 10:46:02 -0700 (PDT)
Message-ID: <eef12701-e916-4c4a-9dc2-2b6836e7cf59@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 23:15:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] i2c: qcom-geni: update frequency table to fix
 timing parameters
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260812-ipq5424_i2c_scl_updates-v2-0-e09cd39d01d7@oss.qualcomm.com>
 <20260812-ipq5424_i2c_scl_updates-v2-1-e09cd39d01d7@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260812-ipq5424_i2c_scl_updates-v2-1-e09cd39d01d7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JbYHXzVsV3oelWxdF6U-MtVbIX_Tl0dz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE0MiBTYWx0ZWRfXwuSiyRPCvT5/
 MszXiB1kgi27yOaWJNOuAB822CeV4TqagkLDkk8Q+lFEopX5X93ICryjLrB260+YOam7FggkZD9
 tMkWn/iwxOUhjUjJ2ROsbhuOIxCb//+oF+htSsfN/nvzG+c4fI3iaAo8CMXYJUXmRyd4IaxuXxx
 Redj+tktwJiyaD5SyASjCS44fbx9J0CFsdVdRTrAgF7BRaXc9MTLOnAJiWbjVbDrJFB7pIrHeHG
 c4Evhq6pROPHEyYqo1FqhVm8oM05bY7Ts5jot+gvrHdpiO3ByWHONUU4iQiuoBrtqzsidMcabpa
 wQtieB6w/zsulvMV30lqC7JOwEdgbGGstaXhb50t4hb2sbxm95RpDGgMo76l4WQDTLEWo0bxYit
 M7vaEDNxiyXIMrWGt31uoPy7u4iM8jVMMcIehL6o3+o9555ZeJ5M/dLIvOTJHveqoH7Fow3d4io
 CNb7ewtEzwjUtNdwfgw==
X-Authority-Analysis: v=2.4 cv=K6ES2SWI c=1 sm=1 tr=0 ts=6a7cb15c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=hsRoOqe6K9Dtf6G3Ghy1+w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EdN727LykUWWqtJ7AlwA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: JbYHXzVsV3oelWxdF6U-MtVbIX_Tl0dz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE0MiBTYWx0ZWRfX6lVUprI1J1v2
 8EoCBLxq2XhH2T/Aixar27/Frec+Rl9Ln5fXZK1o2/WWHTgaO0Eqrd02yiDYYoMRlfAuxi6HWmp
 ax0hVXFzxxglUZttBTgLUWVOxhBEpUw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120142



On 8/12/2026 2:00 PM, Kathiravan Thirumoorthy wrote:
> In IPQ5424, to meet the setup and hold timing requirements in the
> standard mode, update the frequency table with the values recommended by
> HW design team.
> 
> Also remove the stray space in the I2C_MAX_FAST_MODE_FREQ entry.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 85c34532849d ("i2c: qcom-geni: fix I2C frequency table to achieve accurate bus rates")
> Fixes: 506bb2ab0075 ("i2c: qcom-geni: Support systems with 32MHz serial engine clock")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
