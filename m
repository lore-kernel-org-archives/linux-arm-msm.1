Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3648737F72E
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 16:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786035251; cv=none; b=Yd2fPKhzxOCUWckM+37cFtLp+lr39mtY2cSZJExzwN+WxW7bNOJNEz2pZxuWimTplST3IFm29CTa8I+J5LIqguJgVqQp3dj8WABR3mcTxf93/DM8AUHtc2+6JYbcgBZ7RLmWrlfxvDF0Mxt14LWoKstD3ewTScxwILGjeHXtQNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786035251; c=relaxed/simple;
	bh=vef/5r6uU1gPTr6I6ajyHBI08vZSWzfF6Er0iL1Zy84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhTMSqiQwkSreVciRAPl/2G2aTUqYAHtQ8CrB0O6ukRLrXt5xIRxL5hk3Gpokc+Dd87gQiLhwU5AO5VtYvT9a9QmkG62euzryWoe7eDNxTlOgVqTLLQRJ9J0ETHoNiToVFeuD+XvixNybxzMQAEJ7K2CYLQMcVKDsN0Cy0xQeRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXV4lJ8a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KwRfsEVl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXV4lJ8a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KwRfsEVl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676Eo2Cm2575540
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 16:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vef/5r6uU1gPTr6I6ajyHBI08vZSWzfF6Er0iL1Zy84=; b=aXV4lJ8akAoLS8NI
	jknaC2am+nyiMewAdf8W6WZC7HAPyNsdPBYtk2eyKRPRHsGVDFKf2MlwzLYX5Jss
	F2+/fjVerkmydZLVVNOM6cUHXRLd5J24aJ6XcCiJ5cfoeb+fbqRFzulvnHwy4SZX
	ukcMvtOdHM4B7cD38yuztDFrN3YkyJMXy+BiodQ/6a8uwjWk8qmPrmZMzImRad09
	KjiYeU5bBExRLs+QtzndibYJJ3d2UkaPwmwvzCivAK3NA8i9E8Xw0niUdGxRr8jk
	TUA0PEj8w3crCUAKTf9at6y8oXrVuBdYbTjRlyFjT0n6kLLP4ZZ7S7s+eCUVUJMR
	1L4phQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuckhka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 16:54:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so3792815a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 09:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786035247; x=1786640047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vef/5r6uU1gPTr6I6ajyHBI08vZSWzfF6Er0iL1Zy84=;
        b=KwRfsEVl1ZomwIgkfk08aSKpjLlZk8VRcE/VkJXP813QjxqYUAYTWYVs68WlF9XvQM
         oLvqJYddIuZ10PPK9QGIsfIu2FvBg9ReydMGCmLAGrnSOcGYJvcFnFNkYPAahGJgWpt1
         5TVigK8iJMWUAAnhnqUDp/MPGbtxpRLzLbSlGFBSDXlBwtoVLX3LZMfAXt7+v3pENHqD
         Fm2PX9A/e4p2WrG8TpioNvloH8DFrYZgP8hIefLjaiGmtsAncs0NX0kVEf1TqmHDLvR8
         NnmKOjjQccuzXtIPzhsQ/ykEpgbRHsi1mDi5/AaWuBql5H4f1jG/+YjA58wH8QEUOyMo
         GeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786035247; x=1786640047;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vef/5r6uU1gPTr6I6ajyHBI08vZSWzfF6Er0iL1Zy84=;
        b=iw+l51tAgAsQaiK9sRlxn8T609dR3GUDWjNGu1T4Wx7N2URTo/Nu/w7OTQuVJ0b7fz
         VuhlXwehn4nSvsfjN3MEuSsLtFtb2jPCODWAjwXZ3J6Kgjgi3w0fI6ZnVXQiyTmBcCBo
         bheB07GCx4mepH63JDIi5kQHwnupVNlQqhwlfYNNRsuTYiue6lk1Noh8tD+NEq4uGapB
         zxt4ny82ri8wIu3HY9g9ajokFQOpLwY9oGK7VSDPOHeK4ns+2X9qOY/DpL8Z18IcdYsn
         srbtBM1qPzNwWWi+IE+PjMJjY1ATCzW6FmOfS5B8aVj8oR4tG2rNNTL96KniEaE96AJO
         BWiw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+gvP7u56OV1eLAWvW00c+uk0s7qMGGb2XVxkLS+rnBTPWbVvl21i4Z06Pl+delIsT10IaT3NFs6+Jf7wm@vger.kernel.org
X-Gm-Message-State: AOJu0YwJypBuSNfSk4UpZ6FCtTBJ7jHszRH27HDz6llkqAUObw4SZeHW
	esZBRe6M9K/I8//+7/THoKVuFkNnc/OVnU4CLrVmw0i2VxsEdedphWRiYvVljLASl3yqdqHKRCC
	VQ3HtnlkclU/1b1tstyPJIddhbCrwVe8z05zbL/5pFMwzKOJK7lHWHRjcqee1ONDT2PJR
X-Gm-Gg: AR+sD112J2frxSdYWEcKpcUPmz8IUYahjxdVUlIkcxjmdpL9GVOHJJn1kzFS2Uw7Pa0
	QszUt8y4M+KoaDbY/LyZAnX+gBHWmsb9ggk6lh4COdoDdbdlDGcRuR/FixvYPli/3Edirx55kTY
	O8BCpHum631mnG/5SuS4AC9CkT8Sjtatacw4s6NgRyzXm2kp6pZa/WnL4a5Oud0B2f0nYXlS1wR
	daPAlOzzWaEfkTZmIPHI1tdo2dOzZ5ppQlqHjq40SbbsGol8rIPjvEd1b9xHkHYQdQ9C7FhFGnc
	SHd98oFoVb9TbzRd+WVGD9l1k6xxGMFDmZ8uQAiHdAn3l0yKXDTmWBz+H17KgZZI26Xaj/R9vKO
	5H1DTY9oS8pg7DWXSqxKnie5ndq8TkbbD
X-Received: by 2002:a17:90a:d445:b0:37e:b6a:6cdf with SMTP id 98e67ed59e1d1-3903c66ba04mr17215702a91.20.1786035247622;
        Thu, 06 Aug 2026 09:54:07 -0700 (PDT)
X-Received: by 2002:a17:90a:d445:b0:37e:b6a:6cdf with SMTP id 98e67ed59e1d1-3903c66ba04mr17215621a91.20.1786035247060;
        Thu, 06 Aug 2026 09:54:07 -0700 (PDT)
Received: from [192.168.0.7] ([49.204.111.196])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca9111b6sm25952515c88.13.2026.08.06.09.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 09:54:06 -0700 (PDT)
Message-ID: <d59efb31-c498-4d93-a277-c628c9eb6083@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 22:24:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: spi: qcom-geni: Document device-gpios
 property
To: Mark Brown <broonie@kernel.org>
Cc: konrad.dybcio@oss.qualcomm.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        chandana.chiluveru@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-0-c363a9b5df69@oss.qualcomm.com>
 <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-1-c363a9b5df69@oss.qualcomm.com>
 <50834ed2-a3bd-40c6-bfe5-98a7f81856e6@sirena.org.uk>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <50834ed2-a3bd-40c6-bfe5-98a7f81856e6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEzMiBTYWx0ZWRfXxz2bCJx/6daA
 0ZGliguk3RarAeolpFvdrfBCYIhJRdYKIV9tKMVqR9YBbG1tQyihQg2v+5+cc6HsPPWO4FH6B9m
 1vR287D7sg/pA9tvJ+L4HsHDEbWNwVc=
X-Proofpoint-GUID: l0lclN44sr2aN_7suLU8B7VvJjTFCXEg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEzMiBTYWx0ZWRfX/ekL3lzfOIPr
 U94q+++JOUqRurEpS2qooEg+mUoJcnvtFYL6ZMrVUoHVCA0TFMW1+wj6zoBqJrraJFEyH8frdai
 Y7IC+gaD1hEsE2+EGdqjqMn1F44ZZ2zW1TxD+WrdCaO1mALglEjfnsa386astqelpUMCXRCwvR1
 qOQd34zZMGovP+DXi/gY1+Vcr+Z2BBKjQbguEWB9L94TGzLNFpMWnmtcCkXg6/YeEu8g7DbK6Rf
 dW+Z+sqkTVWPLgmJbmOVdm/tKxdTLipL8QBI3lKXJi2YWH5EhnR/+YVqeP5jTiwZNCbI8c9V7Gb
 g9WT9TEUbXxiMjJtDvtMRAQe6NRYRZWhK+ItBySU7AsSaGbRz2HomZiCyY8GsHBHIanBk4vR0aG
 3GoSPkf8rT0HUiX5Jm8v5kgMQORhR13i1jFGuV29bmH0jm2zPPKutKOrIoSloftEkUGkvRg84J+
 z7D+AzOc1U3iY4guLWw==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a74bc30 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=7DW+zsgf7PPjz/i6iZMG3g==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=YUQeh1lwrLxke3GFIuoA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: l0lclN44sr2aN_7suLU8B7VvJjTFCXEg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060132

HI Mark

On 06-08-2026 22:17, Mark Brown wrote:
> On Thu, Aug 06, 2026 at 03:43:44PM +0530, Praveen Talari wrote:
>> When operating in SPI target (slave) mode, the GENI SPI controller can
>> use an external GPIO to notify the SPI master about the target's
>> active state.
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.
Sure, will update in next patch.
