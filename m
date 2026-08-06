Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB903F7AAA
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 10:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013534; cv=none; b=bnSMyf1MB2wZ/yLT7VRLvXuvQNljhzR9wA5y5tyU6xrazV0Su2URQVBevguRC/upuZyyr4wznlgm1NErteYo1XY4xDX/XtQhGmtjOh1swzHa8bQ4UAk+InESjPp+gGnpUeqYQPK85/prcFqe3ljcVvxbExLPow7jwZAwFacSbLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013534; c=relaxed/simple;
	bh=pG3nTZWIqo0Akp9Sulb7iX4hmqwWP/CuYA0lfOGOYc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FL1ntwkk12Yw349uxSyH/USVeuKr5tB1eZPbudhdAK9AGp4Go6qxzmoN0GN2jOG3WF01xQT0ir951ezMsMCu/f5PbbHXINmDlACgAoWTj+ifoY39E6oxazIRChsID80FoyP1dfQj8tmK8MTZrqDA6V8LPvo1jOZh9Cw06HTVktk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TN7C9A2G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S9YQjjG8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TN7C9A2G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S9YQjjG8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nej7865580
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 10:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZA1oEgRFCJzqGhqDxYrY00E+txiTv+g+wlBr6oIblSU=; b=TN7C9A2Gfdz2+qXl
	YoG1tIrU+lOBQY3+H34BKsB7wR2D1n8tHybk7U4lRC2t6s9yqRnk4GY/HVLuPyq8
	UsVUYd/A3vnAmBHXNNSVk8k6gyds0Bfys+zhEI5ClLyFT098E7HoNRghTqahrzTR
	O9IEJV+ZnAvjgZcohuklwFylucH0+G22L9K74dcCdYUYzTRSQgapVrzEXOezGLn5
	c0WSkOYvUrA+IGWLOvJAfHJzPTGASSXSUmjzfppxNoz3l0NtJr72ZAWyQipeP86a
	0J5OEHPEaKYlGTqzuC1hhResJKntqWC1f70P4dmbJynfjjiDbhNsCfZQdeU2hFaa
	lz4+zA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9f5bs67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 10:52:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2caf4173b1cso37318615ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 03:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786013531; x=1786618331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZA1oEgRFCJzqGhqDxYrY00E+txiTv+g+wlBr6oIblSU=;
        b=S9YQjjG8mPyECB4ltcJeZyHH8WgVTNLtm3QydenKOEopxatmlMYnM1hpwfIh09TnsG
         bH/vVcDGGgsm+msdJrByJFdIvDAlSRymGm+ee84Ci3yGfNv6gmtotDe1eCE4cNoNg97/
         KPSMYSlWBpoBh+4hbLnsjQ2YV6J+xROvlxyodOgyPDgRJM+ga/NndY923eR8FuGvV9QR
         6OXCXdDp3ZQr2sbhtV/qY8IvenwCjKz6xlh4D0tDBqcweg8+fiMakPY46ZGEVbcVJxVy
         iBK31pbM7daDlbkGrBzTeNbUUPmI5j9IAOFznfN+ugiQIZ+J6YLC1Wa8G0dU/Lqk46X5
         vZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786013531; x=1786618331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZA1oEgRFCJzqGhqDxYrY00E+txiTv+g+wlBr6oIblSU=;
        b=Z0ADp1twqKOh8ONChbneg7SjLtamUX/FJuqj++SE0D9/FIcKCiHRZREjHwhPoSYT8z
         dgx2pxUl8R38kMzyK7ntW0sUyDwLLNlwkL4a/2z/WC9Z+GS/zBrTc4P7esqoorRfgNfj
         BkQDyLr9R6WdpJNekOs7aJo0elVb2godMsLTZXTnLpVrp8bWhnTdqntCRbFPs5ovjQOf
         euvoz7hHRfjcnfK/psgD7h3VoxV3XXWEiiiLh3oJjfWmrQfa7gyUWTczg4UUurxs/S//
         IC4yTPPzoLD2DvL4CzqFq2jyUZ5RUsUAl9fFdpsauRlNvKGq8X7z7/GSCOIcnEC9Qhd4
         sKmA==
X-Forwarded-Encrypted: i=1; AHgh+RqHyVMBTo/2PZN96QSIj4jwquZLiEbpEngsik30nIeSr8k93kJlzBDM8S/q0keMv46BB6lmGjrTTjNO7BYf@vger.kernel.org
X-Gm-Message-State: AOJu0YziAUyKgPUIMh27NVK+CJqfZcyTnBV1KuXqS+W4LpL8yxm32RUn
	JfTdz4kDhIn+Gb6AfoQT8tUARExCfUZ6nAX+Pwckak5h+8Ouh3p1cJLxzX3PiPyPljAcOuisTRc
	ycO2tZicaVC+UPkbDSKJ6zaXPjOSYyEBWGTN9Srk1IIRd8bNNnDQY6BkZL4H3ZmyXs4DGz1JR3B
	T2
X-Gm-Gg: AR+sD10gRHsVziZwy9fW9k5RoHhpid/mnpS3PP0luCNCJiO7WgZb5OaUs10oOGOYTNr
	efhET+yatkFw5AwYZeeTe3ld9aHdwbR/vx5Ku/sdhwkkV0O15ciVXdzqfY3g0acNFEJXBxSAW3H
	w1NWpL8smqKE/YniI7bXDKnOggQuK1+xIHQH9h42cF4YC3282DuhwUgKkx/KDxObW9l8Cx1aWGn
	C97scH2uH0m0C/9c13HDEpP3kg2XekCCXWeks0bCVdeFTGLgmyfp1pbxFHzZzSefn6dNlAtWX6P
	x/xWGuQjig89PidVO8C4+oSmuTkOs1DHODiMNyX1b1wvF5P3vgObOyb1M2XANfTrZYXtI4d33At
	kHXsB3dSoZb64KZgMqNhRfNnB2oLKN1vd
X-Received: by 2002:a17:902:f546:b0:2cc:aa36:c046 with SMTP id d9443c01a7336-2d0ca77ece3mr148064595ad.14.1786013531432;
        Thu, 06 Aug 2026 03:52:11 -0700 (PDT)
X-Received: by 2002:a17:902:f546:b0:2cc:aa36:c046 with SMTP id d9443c01a7336-2d0ca77ece3mr148064125ad.14.1786013530978;
        Thu, 06 Aug 2026 03:52:10 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4930e1sm29469905ad.41.2026.08.06.03.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 03:52:10 -0700 (PDT)
Message-ID: <bc1096de-94c8-4713-88cb-5b9e96b5419b@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 16:22:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: iio: adc: Add support for QCOM PMIC5
 Gen4 ADC
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
References: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
 <20260731-pmic5_gen4_adc-v1-1-9c49b2eea6f9@oss.qualcomm.com>
 <20260803004940.0277c0ac@jic23-huawei>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260803004940.0277c0ac@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: h2b7kUhPG906ofu2aBRCq7A6dkVUbZaN
X-Proofpoint-ORIG-GUID: h2b7kUhPG906ofu2aBRCq7A6dkVUbZaN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4NSBTYWx0ZWRfX960EaorRm/Ea
 0N+FbsKlf3K5ZnU9R58eajpWN4KNKLAE82zYeGBrsYmOCQQ4T8fDQ0t5ti15lv/uSIA3chpJTZk
 Cnfv7Z8ZVdclyG3uMn8ts+5Lv3rF7GA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4NSBTYWx0ZWRfX/wDb6BpnYnkP
 oBkl9O4GEMuOxZ6rT7kppKOb+iA995OW3q64qjoUqhphKkvjqwG1OPFt8b+Y0WSeQJgNsOAGJTY
 QwJTH8rPHtuGbg6GLoPyJySvBoKO2ZGJ0gXPQAdvpnt5bsaBmoHFCTBNDfL6YWji5D9J8zdb+pL
 tPDlTsKEsVDd7bj5e4OY1egiu6hHEA0j2i41bvKF8r9VQU5EAB2ad/+fI4oXB39Rb79v81RW+NX
 BYwh8vC+81NnrS9oVJWmVelgbP+sBXUp/jE1eIWPcjsmYrv04mw0YaC6BlZwm7QSuvhlD7l2cic
 SOASBv+I/sG9zzZ8TO6CNyV1Y1OspsDoWTAurtH2v89ZDZ0VVtGfgzGJHRDWxkzV6zvAH3wI7Bw
 wydnZsxVQlG7GCsx9s+gobpfHitOGym7auhkhfWZ3O97lkzNrYNkuzBTC/mQWhAFv3gZ6K8rC7Y
 PWcaNC7MyFvsuf6n8Nw==
X-Authority-Analysis: v=2.4 cv=d4bFDxjE c=1 sm=1 tr=0 ts=6a74675c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IlOKGWYkYrl9SAkidhAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060085

Hi Jonathan,

On 8/3/2026 5:19 AM, Jonathan Cameron wrote:
> On Fri, 31 Jul 2026 23:36:14 +0530
> Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:
> 
>> PMIC5 Gen4 ADC is similar to PMIC5 Gen3 ADC, with several changes made for
>> improved performance, mostly at the hardware level. The main differences are
>> increased ratiometric conversion resolution (from 14 bits to 16 bits) and
>> increased bit field width for PMIC SID (to allow communication with an
>> increased number of PMICs, supported on latest SoCs).
> 
> Hi Jishnu,
> 
> The mixed case is enough of a surprise (to me least) that I'd expect
> there to either be more discussion here or for it to be handled first
> as a dt binding patch to allow for v4 channels on v3 hardware.
> 

If I understand your comment correctly, you mean I should either add a
description of the mixed cases in the commit message, or split the
patch - one patch to add the new compatible and one to add the new
channel properties ?

I think it's slightly better to add details in the commit message
and keep the changes in a single patch. What do you think ?

Thanks,
Jishnu


> That would provide a place for a description of why that is necessary and
> then the following gen4 dt-bindings patch with gen3 channels would seem
> like a natural extension.
> 
> Other than that this seems fine to me.
> 
> Jonathan
> 
>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>  .../bindings/iio/adc/qcom,spmi-adc5-gen3.yaml      | 47 +++++++++++++++++++++-
>>  1 file changed, 46 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
