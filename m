Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DF848987F
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 18:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790100685; cv=none; b=nmQC+cgpLwxnjHNRoqpDoKZspkLuQ4fzQZ6KPQS73Hea8Hnh0uQvThLGxRSTuHBfhI0SYVEalpViJWwXCf13kJ7tOqVLyoMeBdK0yWBMiY+DtvTXs+TK9Rbnnx8o0lerTdx7MacY3WirM2IL+XCEjFRwjRk1a+G+gWgR43UBE7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790100685; c=relaxed/simple;
	bh=YKr6r9TaiLIpPUWDV0xkTF5KFQVZkNaHc0UaH2PmIW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQpPimgY+x/GkmX2YfKQ76YRikBDkMjPFst1evKnIu+eoAetbvnKkBRmsMPLOn3dk2MIdYsPz1sPLNwwFaeOt/yW428YVKDnW+Yqwhl9Dii4tXfHr0y2co5dQbCDLT/SLwAtcbughBLikRZzk718XyJlDEnNFadjvt/gRoyLzEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mq5xR74s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bYFa9eYh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mq5xR74s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bYFa9eYh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7eYQ3757236
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 18:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CWIwxqyDzc+G0ifYXGQ0NxRUVu17NP66iLLTZQkvEVs=; b=mq5xR74s0W1iC71v
	Ws9VU0XAi9kOtRct7TTaPdoE8RuEL1VVSPqK7qk0nybUd3UX+hHdBIWBMfVzrWja
	7Tpsz6h1G0PdGMgtV4dtbzWBtqQ5bBQV9hro28fTJjsrHssFqa37sALSzSnZ1+EM
	jN2T3cgXUVT+F1mfaCskhJxcvQn5C5m8quVh5KMY4S9EbYQfB5IPNOzJKTTqIbWY
	NtNuQMRxA0BhBzQpPEzIuMF16WxinLFR47a8AwHUD8oqzCmujTfSBlkVfDzTcTjc
	kj81I4PQqA8LdZ9rpXhzB6cZzMczvMe5fdoOG6u+gPAWTgKixNOwFjYDuw7HZU82
	RLOcvw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj113r0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 18:11:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-331b2ec616fso259974eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790100682; x=1790705482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CWIwxqyDzc+G0ifYXGQ0NxRUVu17NP66iLLTZQkvEVs=;
        b=bYFa9eYh/va1t6V08/+/fa/b8Xj0qCb04Ozc3qBhF6u2VC2k4v/kkXR6naAF7wSbk0
         YuYVXHNEOeNMeFbYGp4RD1I1DjlQhcIhfp/uOd5o3eGLzz7F8FNc/csFeARSnh4Cim9v
         JorqThyojkP6Cf66kdVX91cN3kafpnQtwwPtcB0AuGS0BOulGoA/sZ7+Dc6vod6qy5R5
         0KC7ISYfr3rAvlW5NSZjMVpChdLb74itVSYnOZ2+wvGRNnLBVABhzOfYp/VNwQ7Xv4HS
         vZm2EhCRpRmvwunPjZPSOsudO9yqp0vQ0/UMbINVVjKdLORKTFiYJQIWW12Kfvw3LlvN
         m4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790100682; x=1790705482;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CWIwxqyDzc+G0ifYXGQ0NxRUVu17NP66iLLTZQkvEVs=;
        b=h1+iCNbPCtPlDynjJ24n9Ls3oBSPR0cFCd1CjKLv8FgsQa7muMU0Ngl085+3PLgyoz
         4NwOMKOXCIuRsGguPXIP7Ba/g5xefEFwovFiTZbBVq9GN96N78Qpjbmr1SuODjmxQS4d
         YfaT99GskeU0r8CXfzafe4+LeZOiir8Lq4/pAazJXm/C4BtVqadZFwIZMTP18LJ9NANE
         JMhvjLSwHViCiH07LDk0ArJ1XZ6EdonbPlL8FrYZyInZKm+9C1MM/63vhax35Pk/yYMm
         tjGerAq5b6zNMxACZ9PIQ3YcQLee7N4PSVJWIUe8jZ/EeIPoNj3pk79PBqpIUoPQCl8H
         tavQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZWOB/014kEx4wOz/o/BzcYkRNnYowm7eQIfKBntS2wdvLmzPvxf8+/np++c7vHCVHvSLn4c0ZRdoGfsj6@vger.kernel.org
X-Gm-Message-State: AFuF++kY2b9isEufCcn/qa0JMIOWswnqCbLQLo11wI8Pp9VwCzrrpdDW
	Hp9lyQouxBnWsDf3ZVq4AAvFN7rc6ssQxVaXAiIDP+7HLYz0FMbvEflUAYnbWbobi43BE/nupn8
	B/HmPt77XjlggurhJekO/WMQ9GMBfH/zIfXRapmxeoVA93eXyVDx9qyLi5hgyfu5JUw6X
X-Gm-Gg: AYBFou1SMJfRAGI7AxtllhSybhwyjZzO8sRe1ZvktP/jTJi4GxlMYucETX+P2qg2UiO
	umOKi+UICZ7u06Q0vM4x7shfgya+UBu/hHBRyH3LumMCxdqWmMWWwm8BOo/nzBtuINLc8Y1NnFv
	79TURI+YWls3y/4ccVAb9JH6bYH6GtLrUk5mmMxfQEJHosnEuEB3rsw70PcvQ+zX+KTb1pSbfxQ
	e1XmrInnQvBVfSHD8rj3JBQdZqphTcD4/6227tiKgGZVECi5HCTHIwXDnWIRp1iqDrvUef5wgk3
	VqR74cihgd4xuaFSFZnPQDsj8+C1qdvQrtLwSrbk2R+HyR8Focvp4lGI5V1I3Af5ehA0Xftvuya
	mhoacOdS8fLTaUimHNxCX5skXj08FAj08Nw==
X-Received: by 2002:a05:7301:8605:b0:334:30bb:5e87 with SMTP id 5a478bee46e88-33e8e3af1d8mr90118eec.36.1790100682448;
        Tue, 22 Sep 2026 11:11:22 -0700 (PDT)
X-Received: by 2002:a05:7301:8605:b0:334:30bb:5e87 with SMTP id 5a478bee46e88-33e8e3af1d8mr90065eec.36.1790100681597;
        Tue, 22 Sep 2026 11:11:21 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7d003sm16349eec.9.2026.09.22.11.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:11:21 -0700 (PDT)
Message-ID: <7bcc736f-e994-463a-b363-9854aafd5649@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 23:41:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 6/9] media: iris: Add support to select core for dual
 core platforms
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-glymur-v11-6-e0c8bc914742@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260917-glymur-v11-6-e0c8bc914742@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: D-G-rpd5a2m_DRR8imcpjZeY6Ya98BWy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfX4cNRSt5THIPX
 NVFCWz7x66hQqW9KD35ijtlKdNRBIh8ELBF9D/T5PVjAOihJZc9BkEGKXZQmHJDcr1kdHaMiivR
 NVqVxdqhP7VG8us711SNnwmzNvz5wLQ=
X-Proofpoint-ORIG-GUID: D-G-rpd5a2m_DRR8imcpjZeY6Ya98BWy
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab2c4cb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0GF_beopZQ-buuiTRkAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfX6vIPuZ07z9SF
 dLEhKjOL5gf8s9rWdoYg/ul+o13nwW3RhdyMURt/2neWBgNL+AtKffiRVz/lEZ1IFfTM+md0evd
 6n5/o2dkbb0Yh5nmI44N1TZarxgqoZbbfNRPX5iFd2AYPEzceWlo5wgvfzeEEI/E7IGSDDUJ/Fu
 xJ332BsBByl+DOrKqCR0//Ra8FgHK/BxewFwKzJF4piSIEE3dLojJW3OmrE6VN0Z/ubbaIaPxnC
 MhjG1UodVZHIA82FIzAr2mVQolc7bJnehkoHyJydYnmW8lo3Ka9f929+NXC4eJ2f+DW0y13x+b+
 4e0vS16HdX6XRq20AI1hwGiPKxg/SguRVBr7iDvzPnSgjUOuCDJx9cSfsgvpkViQFBikRcDbCyB
 pmChON+LtpLfDVnSZJyPR90ThoqmbFYXTOZ/iv0XoK4VADw1mCn66mfrIllMvswGYGofi8qdsXn
 7HHJEPH7Q1wZ8Qcfkdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220265


On 9/17/2026 10:30 AM, Vishnu Reddy wrote:
> On platforms with two video codec cores, select the hardware core for
> a new session based on the current Macroblocks Per Frame (MBPF) and
> Macroblocks Per Second (MBPS) load on each core. The selected core is
> communicated to the firmware via the HFI_PROP_CORE_ID property at
> stream-on time.
> Since both cores share the same clock source, the required clock
> frequency is the maximum of the aggregated frequencies across both
> cores.
> The total session count limit is scaled by the number of cores, since
> each core independently supports sessions up to its own limit.
> 
> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_common.c     | 10 ++++
>   drivers/media/platform/qcom/iris/iris_common.h     |  1 +
>   drivers/media/platform/qcom/iris/iris_core.h       |  5 ++
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 19 +++++++
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>   drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
>   drivers/media/platform/qcom/iris/iris_power.c      | 20 ++++++-
>   drivers/media/platform/qcom/iris/iris_utils.c      | 58 ++++++++++++-------
>   drivers/media/platform/qcom/iris/iris_utils.h      |  3 +-
>   drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
>   drivers/media/platform/qcom/iris/iris_vidc.c       |  6 +-
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 66 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |  2 +
>   14 files changed, 174 insertions(+), 24 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
