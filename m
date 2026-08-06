Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43F938AC87
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 05:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785995841; cv=none; b=FJZ0Gw7JnwiPPokOvyfSNJ0j/7KtwFm8OBXcqHQHxs0uN8uwEpvjNBpCdqf+SRq3YVM9TknkqK1vILuRZr159dghkl74M6jPfN0CZLfG/7ly99XEvXVF7k9i3/vwJSjpSsVqnMyD9dyOQPfWsxfvJ8KdutpEdX5Hcks66Pf0dtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785995841; c=relaxed/simple;
	bh=+etWgH7eALSzG74DpU6hco6q11QwVWoPwFcHZX5VuUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mA9iRs8cbGvUaxhuLuZLb4sZOwMQbSmocL6/zlqpZdzCa3Rqf7yYtFmVRDRLP26P8edkQn/uR817OgBCVmqcPbgXBzENyyPkLxJPyg0S905ofp1Dd615V86W25ytS4fnRHDUrrROIMnOs/Da6AHFJ7e0QXZAOJrxyKgUFnUDaRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WlV589DF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GSwfM9pd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WlV589DF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GSwfM9pd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wV78775062
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 05:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oWzu8njMijKyxxvoGKtrZQ/ctHCEUks1+oY1aZVfLWs=; b=WlV589DFx7bqSDAM
	p6SCDfBsuyHMO+DSyb7qT1NK0sdmPTg9MHBQM9XYAaiBwZasAYywfXnE+SfDjrLT
	c2TCH/Tz8nR6GP1ymWSuIvq5mSiIGr0YA14N2u5fUyqZDo+k7VwRQPvbWyxFQJod
	pZ2pF4p1ZCWy2D9EPBpyIzmY68QHFs2gd72H+AbNpcpwZ61/qbP0H7oOt/ub8BT5
	OQHEdUXgyhbQ/okguJkaR3r8P/LhDiA05AXnVNYV/8r9+2JvvhDKbntd5Rd6Ivr1
	l7JMKeg//RiZmYoNCV2nZpHW5mFKhaK/Pky/meYYMGIRdzMKNer31EZyi5MmgEiP
	5IUiXQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8gcud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 05:57:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc88e22f92so39372785ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 22:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785995838; x=1786600638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oWzu8njMijKyxxvoGKtrZQ/ctHCEUks1+oY1aZVfLWs=;
        b=GSwfM9pd7VXz14c7/acLPgNa8y/c5ZfhIdri+XellU8qcqoyzNvgQ3I6aj2p9MgmNg
         W9S53BH/hEo7c3w80X5wfQ2fvKjE8jd4qZdBcTHNVd8odAoORimgDnY9a0gdDJX/fJdC
         cnNqvt/UF/C/MXoYA+PKQWtGW3Eb1MW2MmgFsxq9yI7l/TtWuB7OvffNN08fMpXz3mSB
         nMB2US83IswjP2YMn/zrvZEJ7+SEwebgZzTWPHwLmhG90efiaOTrbqGyY4Xz4gLShK6l
         acBKM61fXpxoaKp29eUw7reVH+wUICCOG84DqHriF/1I9Mov0QBQM4pdEBmscurc6AOZ
         xiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785995838; x=1786600638;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oWzu8njMijKyxxvoGKtrZQ/ctHCEUks1+oY1aZVfLWs=;
        b=Cb5Eq9UGmNoysUN6xb4VicgNukLtJ+STzha45wBAr0/XUqerFFensD+M66iBe6zVfZ
         TiUtX+XTMk5ZgvIHfC7cGO1xuRRQp9P6m70SfZXEcCqdAfMhzAZGES4EUszciPzJi1G3
         FxZc43cKgFWaDc76Wi1/iKTfS/26omDoUerA/GEtKzNkbFJX6MrtiM/aI6lk80bIKYdz
         LNZ9nzDmTAfjzyMcBsK+MOW4/4KMP99V+LtGXwPGaU6DeEyDj6Ta3X+ugQZ6+o0wNVsP
         P88/Z9UDo5kWChYFlLj3KXRddQgE7k7xrVj7L6n3gIykrI804dBY9OKlEaUYfVparG8W
         +pLQ==
X-Gm-Message-State: AOJu0YwWSmAsQHwqMscyA0z49LK37HKnlXHZ9zVa5wXekNSUW75eSxKu
	ocPOnJ1MRN804zqoISIAX1ZnRN6MF1Rz19ZXdzXHyHGoJg+K0rBc1ZTr62Tsh6ZYT+R+ekniaBe
	9ZfAx8MaEiyS6u14J3MRX5Fp72TH6FcB2PwGsLcrZJYAlDW9EO1IM0MkVTdUcS8WV8uxa
X-Gm-Gg: AR+sD13pqm8gC/utn6dqdHVWkhQA9kxKQmmpaiYFbV2BY+YYTkzKLmqLpVksk2jqdqa
	i1GLKRvEJl8VaGG7EKqlyB6yD8Gl1fz8wfKOR4ObKpXL05jUWu8uWC2xGzALdqfKo19VgVDSXzT
	1wwAqzOU2Qx4QD24J1VALVf/B4MS99e396pMDZx9jiChKvgjTngw3f3rfPGbdAetD+UF1n4RXvI
	0386wjgodJgACiwwpph0PMsnChRZpgIWWcgeVkdcilVeEthTgblmze01ckqyMo8N9+pm4t/Ci8e
	0HKJ1tC8XaK+J/YYfrLkyxIm6TCmPbbsDkueo3YPyIcOAATfdztj/cYZwgUKiljPeWPmRae6D29
	7+6WyFMTpu52WlBh2XUJSOKz8x5RAO0f6lw==
X-Received: by 2002:a17:903:3248:b0:2ca:ecf6:910e with SMTP id d9443c01a7336-2d0ca14c351mr162645725ad.0.1785995838555;
        Wed, 05 Aug 2026 22:57:18 -0700 (PDT)
X-Received: by 2002:a17:903:3248:b0:2ca:ecf6:910e with SMTP id d9443c01a7336-2d0ca14c351mr162645415ad.0.1785995838148;
        Wed, 05 Aug 2026 22:57:18 -0700 (PDT)
Received: from [10.217.198.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa492545sm25461725ad.48.2026.08.05.22.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 22:57:17 -0700 (PDT)
Message-ID: <6fd06d54-cc60-46fa-ac5b-c32d1c67c2f3@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 11:27:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] soc: qcom: cmd-db: export RPMh accelerator type
 string helper
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260717-rpmh-timeout-debug-v1-v2-0-81ade4fcdb49@oss.qualcomm.com>
 <20260717-rpmh-timeout-debug-v1-v2-1-81ade4fcdb49@oss.qualcomm.com>
Content-Language: en-US
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
In-Reply-To: <20260717-rpmh-timeout-debug-v1-v2-1-81ade4fcdb49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: No_8snmGXMvg7CTHagEDSpGb4GOqeLGW
X-Proofpoint-ORIG-GUID: No_8snmGXMvg7CTHagEDSpGb4GOqeLGW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA0MyBTYWx0ZWRfXwg2a/PPBSMc4
 HhiJOst/D8ZYhTtD0iAn4pWTLWWdbyonRHwsHf4ksJcfxxEN7kApgHVobp4PMiMEzmj5UHrKMOD
 kecf2SJj73h4CtcogIFQD8izfonwBbwrfr1T0fK8FMFOO7rDXdWnhHezqrAgJRiq4Vv6gcktyQi
 TLFjVCLgQtBRy07vL7J7ci6lVz/bR1jyYhJKgrGKUPCweaPG0ZFSMGte7ymNdSZ+9NKvdNUmF9F
 UWjtJWjXWsspFuJnyD733UZHik9fnCt4pYBIK8/w1Gl9aLzRUbkLDYDvBtFeZkx1qruWwddFneg
 DwTCxTnMJ+ku3y5MJNM3zYsA6sKxVSHrNqcuI9G0/SrIKbopqTSDyPjfHN0zet7K3JuQn7vP2ii
 +T9wGhTygEpcEz8qgh5Ij/5ZyInNbI9VOePwPMfL28YjP3ZBrF11j7pqTP27+7Ji5wY/x4D5jNI
 ldf+GxmhyzqCXitLC+g==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a74223f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=S180665jWhtScyE4BKMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA0MyBTYWx0ZWRfXyjMKBUkDqBJf
 H9lw/xGMAwppEIYOoH6mWr2HNPsx0WIyR++90KNPJfB4/oj720WROFZHHwCLcIQ16HYInEP5kML
 gi/BmTt2xXcQFV5L5DnXtSgtgcVD7IM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060043



On 7/17/2026 1:19 PM, Maulik Shah wrote:
> RPMh resource addresses encode the accelerator type (ARC, VRM, BCM)
> in bits [19:16], matching the cmd_db_hw_type enum values. Add
> cmd_db_hw_type_str() to map an RPMh address to its accelerator type
> name string using the existing SLAVE_ID() macro, and export it so
> drivers that handle raw RPMh addresses can produce human-readable
> diagnostic output without duplicating the address encoding knowledge.
> 
> Assisted-by: Claude:claude-sonnet-4-5
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Navya Malempati <navya.malempati@oss.qualcomm.com>

Thanks,
Navya

