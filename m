Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C945C4A49B3
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642151; cv=none; b=DmphLQEh1yGw1b3i5lsEkFMEsjAGh9grf4VqwvmPF98O7uVEwvKfGCIVbUhDApoXQ19WQn0RRbWNkQ35aD9Uwu2on4F2L+OB04kxVdO5itVv2xGbnuXYE+m3nunzMSbo2MBDU+MecoUsWxKRJSF/Lf8SzoMRHE9sqE79d8V8O74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642151; c=relaxed/simple;
	bh=eZ1R02TktGMoafWc3iB44QwiSvxM9+9cWgD0hJ/GFXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZsJTMCYMBhFUDgN7MOnhyISj6EDDBX2CZw72U7HXPffVSDM6zp/M7h5BATv6cOtkOhu6x6WB9qenMzN0czzQ1wMWgvWZBn/FoiJIvbedRSbyvI2/gk2aNeUR2WuaEcBAj0DpTGEdH9zz4TXmzRkKxgECKquYCMDlCmdPPcDz7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0driMJ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aESuoRjG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0driMJ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aESuoRjG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZVZ02410426
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 10:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tnso/dK39CPl4xYVq096jLstw/svSY24BOldvEqgn3s=; b=Y0driMJ1/qlH2QYJ
	6RSWPCsoXtE9kJVKN+DoJ3LKym8hkI36vPzB+1ZDeDFoiBP9rzv8gx+mkScpjvgj
	5ZuimtJ18KZdHIzdtG4ynDvgJqHvl73tUhSoIodZyLGuzOvxBKy+gemTJr2r8dlv
	XclVpA+T0dktZtz7Was6jrdAZHq2S4Y3RTK7aurVxg3R0FWP0U5x2xCsy8VONl3m
	e0mwbdVSXWl/wiN4z2ifvRuVj3GoVRxwAQ8O38XOZCJHNBCss5tIS9MNyTXBvaBA
	X5GWNoEa/7spXd+RRMJQ43PrTsBBzO2hBIH3k3LTdSDc1T0evBmD/zXlxYMelAOB
	Sw2j8w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6gckj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 10:48:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e18af9f48so1234661a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 03:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789642136; x=1790246936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tnso/dK39CPl4xYVq096jLstw/svSY24BOldvEqgn3s=;
        b=aESuoRjGQFlBDRqIMj1+Vx8xOcmqjXa2pDsAk8G3IE2Fq4jsdIwwu0ZARhmtGklDf3
         XpbE1zlSsiPkAtlNi6M/AUvvdwjwjx4/qDCY83aJVSU9fYcXuanz1w6kXenOhgw90DGr
         CA++EOZGFEkUKBsleeyjVPC+TnM/7gZWQx7/wrdwVm11yoO+F9PyuSipZP3cf2x6WJTU
         JClwTf0TM+P8cuylQ12wxzXbXZ+UlFSNF2baWWJK0vXB/jElz2WNA/by9UGs3OTrVe9y
         17Sr9AlgDxg03+L7E3qJP+jh1/jFVlmbinNzXRG8mcqngwOuvw9StvBP5mmJcKD9Djtl
         0ZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789642136; x=1790246936;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnso/dK39CPl4xYVq096jLstw/svSY24BOldvEqgn3s=;
        b=TGPNPbOGkYRel9fjwuP3BPI6dc8VPbI8kHzQMFK3kQq91OBCVt+mHHX1/A/uXZic4y
         2+pV3V+1h/eAoUye6eVrXttwUGmmtd1e5pxEKob1Pl/1ecvifsPqph/rIWxhd5ErMiEp
         eSx3oRpu10xdDAdtTlmn8fBkWRDyOXMY300sajO8LCZk5oY8/okylycYOSh112htrXsY
         WBOukh8Q2DaFaiuOwkqgzJgeiv2Gvr94TfaWLHBs+oj68qjeIfbLlGV5OounjE/9m2Q2
         xwwn8lnQLmwPULQC9Rw/Dv5WjroAz30KM7wH1ne+kzVkYXaJIqJo+Os5lV7jQLcm1Rem
         STiA==
X-Forwarded-Encrypted: i=1; AKwUvBxxtllch5+pFNJ+z/3g3kC7uhN94Mz3TgmhBkqoSo8wSZ839IgtlTSX7HIYlnqy79NxC/xm44Cdt5ibqhZi@vger.kernel.org
X-Gm-Message-State: AFuF++nRK/di/U3JMT1D8fiiwNw6htTiDpZVzbnD/fUuCWnw9gZ+vXoi
	wjpofiFAkdpl8PCJ/3rdXbslyBZkvrZVP0upJRzLb7MYFt8vvvUhv8nZbdNsZyae9zc8iEBSkXR
	jXodzeo1YtXHmDYZnaGhSZ0P8Hi9vNZaynQfwVkOjISzHErU5EUBLabSFr/nN91oEMYkR
X-Gm-Gg: AYBFou32aFb9hrUCEMVp1ZTM8R9nCnY/EsIA/1jtt/+eLktxV4C7bM/Iia6mlIvyb6g
	JkMRbPpwDP8I097q4Mn93oU6sA3B10WYaPK1H20wLHW8dplNx3fJ3f05hJlNFOGz48YAVuHAuYN
	IN+EZWftzpD5/igDQJZd+kdWYOcCSHYkGx7oIcfahBHTrRLJ4TrAiFWj6zfhcqbcKfbbpVM1kOn
	js/NDtj/ouFw8JYYGRI0yDKf9cSwLwh6BzDMQjuRnZias90hP4h8KmVdSIm31jyJ//ovmvkB81r
	A2qwWw7euIXAFtKJ2BU2CkrlgSETjXOUzPn8OSGXL362TW8gycMG0qbnTKd72agQl3/AzKqRfjw
	2Lvh2Wjhyr4vSoxygQg0gXwWlUyj3G3YES2w=
X-Received: by 2002:a17:90b:3f0d:b0:39e:2c5c:a689 with SMTP id 98e67ed59e1d1-39e361ab7dbmr4771623a91.30.1789642136554;
        Thu, 17 Sep 2026 03:48:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3f0d:b0:39e:2c5c:a689 with SMTP id 98e67ed59e1d1-39e361ab7dbmr4771594a91.30.1789642136132;
        Thu, 17 Sep 2026 03:48:56 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.137.165])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d4a48fsm12639770c88.10.2026.09.17.03.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 03:48:55 -0700 (PDT)
Message-ID: <2beedbc2-f47b-4eb1-9191-597c360c70d8@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 16:18:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/19] media: iris: Add AR50LT core support and enable
 Agatti platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zH9kZItqIewXCV1ynuZbVD67mkSa2nQg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE0OSBTYWx0ZWRfX/HRiJpXKvsX1
 8GIm0w8/7YYYnQkp+3uPx1Qzufaedg7UhTOtR2/HP9ZUBwLaTY3wr9TS2CaTG9z+WdCKLWyYtH4
 tzPfs+87f6jSiz7wJEuiJJLA0EFG96BIe6iQN5VrI2lCUXWOAdsiCUXlo3eCwRktiioQoau1Gyq
 VFFi0v7I/oSHIbqfzdTL8VCknj5l8XjEQoAC2h6isivhE/0bdCUpAPoiRXlB5VjegKPjXBt0XdX
 unoCebWBmEcjlz4tuCWJKFEQb6Pzr6npi5YF+G8YwFrU2Qm/TdDGnByfazkxxJpC6USPtRbFP7W
 MkggIvNL3JJxmMgcvxwdkZ8ScQbsRHX7yU4JDM2PkaPLl+SdsqnD5yDinh8TRXFGrgN111CthPl
 E3aNnfwNyHnk4IV7qZgDXWvycIOw9Ii6jBjmJ+i+1pC20P0SYV/lYGuH7tSWycyAqbTO9YNqSSS
 Y7PDGYL0S2+NqMyp1qA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE0OSBTYWx0ZWRfX+Rqg2tajLxoa
 7XEBz/RQE79mQ5rIsYYQVL/nZcvFYuVQ3I1f9Pp04q20xitRgcUgRHGudDuk60F4iinviqg6ZLm
 n8NNeBFEz2uZSqQjgM4Wz4aylRB/roQ=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aabc599 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=/MhRiX8TZM4BB34AAREmLw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VEuCN2dkXrGIZYAknfoA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: zH9kZItqIewXCV1ynuZbVD67mkSa2nQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170149


On 7/31/2026 5:18 AM, Dmitry Baryshkov wrote:
> This series adds support for the AR50Lt VPU core to the iris driver and
> enables the Agatti SoC to use Gen2 firmware and HFI.
> 
> AR50Lt introduces a few platform-specific requirements that need to be
> handled in the iris core and VPU abstraction layer. To accommodate
> this, the series adds minimal hooks and updates needed to allow the
> firmware to operate correctly on AR50Lt without impacting existing
> supported platforms.
> 
> Additionally, the series wires up Agatti to use the Gen2 firmware and
> HFI path, aligning it with newer generations of supported Qualcomm
> video hardware.
> 

<snip>

> 
> ---
> Dikshita Agarwal (11):
>        media: iris: Add Gen2 firmware autodetect and fallback
>        media: iris: Skip UBWC configuration when not supported
>        media: iris: Filter UBWC raw formats based on hardware capabilities
>        media: iris: Introduce set_preset_register as a vpu_op
>        media: iris: Introduce interrupt_init as a vpu_op
>        media: iris: add vpu op hook to disable ARP buffer
>        media: iris: Add platform data field for watchdog interrupt mask
>        media: iris: Add platform flag for instantaneous bandwidth voting
>        media: iris: Add framework support for AR50_LITE video core
>        media: iris: Introduce buffer size calculations for AR50LT
>        media: iris: add Gen2 firmware support on the Agatti platform
> 
> Dmitry Baryshkov (8):
>        Revert "media: iris: Add Gen2 firmware autodetect and fallback"
>        media: iris: drop IRIS_FMT_foo enumeration
>        media: iris: skip PIPE if it is not supported by the platform
>        media: iris: add minimal GET_PROPERTY implementation
>        media: iris: update buffer requirements based on received info
>        media: iris: implement support for the Agatti platform
>        media: venus: skip QCM2290 if Iris driver is enabled
>        media: iris: constify inst_fw_cap_sm8250_dec
> 
Hi Bryan,

When do you plan to apply this series ? Is anything pending to apply this ?

Regards,
Vikash
