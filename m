Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78539486B80
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 18:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040275; cv=none; b=bir51gnc3XtgTbwh1CYzkknVWELk2RrqYMUoduDBUoS/N2QZTSBjg0ODrwysQdzsNDRYcS0plhF0m35Lxz3wjt/pO5JaR82PCVEmwKhb6q8ASPeW3y0idjtTdh9VW+jAbnrNfZIyFRcd3cFzjI1/pbipIYttiq26kStK4kcbJvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040275; c=relaxed/simple;
	bh=XyHQVGmrLWTjFYPZtM3QIQVJy0S1AV8IITairKJRPd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s1NCijewtrP6h1WvpuXSRAXqE3WY912R1FlFb198PTUCMHogKJTiqo/wCeBVAlBXvSK6QA9c8vHtofQ6iGyWraPY/AN75WdAWN7e2+zxTM+M4SVzinhq52o56o5D+/CzsWn+uQq+m0arWzQU7p2sx0nzd0v5rZQx2FZD548iHGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B4Vs6gmy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QoM9nHg3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4Vs6gmy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QoM9nHg3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676IHlue2791609
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 18:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XyHQVGmrLWTjFYPZtM3QIQVJy0S1AV8IITairKJRPd0=; b=B4Vs6gmyszXWhDyo
	42wZtGktWpa2GNtixSrBQ6U/kDgiSeJr+3rFL+Fnp0MuJwVlyKBT7or9uJCEzUjQ
	SU71wM6xJVuWAsix0eRA+7cGvVYY/KNkKnLi2zaVpWAAuRn6bsKTR5y920Dw2JUr
	b9bOi1M3kxvuYnB5MjmcOobDtThtNHbMHZ4ei4y69GKjW+wjeg2kgjMw6JWRfLb6
	L0MqPdlVv/7gzmNjtUbA2ONSRyrmrqQWlWjO2NZt3gxd1Tb/Zq0fFvmySa/zcDgK
	SHPzXAc9N6PdylVPyei/TjyMTH3fbLXimsbGI9mIZCVhBFpX6aRKPiEM52tLnfYk
	+Hhm+A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jr2em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 18:17:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so3993686a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 11:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786040273; x=1786645073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XyHQVGmrLWTjFYPZtM3QIQVJy0S1AV8IITairKJRPd0=;
        b=QoM9nHg31lkAVcXMErr54Ys8CmPNI9JnpzscoKMtNDznefYR+5RzKMfAF9nPj7kyP2
         XpSIeQHySri3QUgf+fZfpUGeM5fkWpg28Bxz0XNFmEm265XC+HL5uKzzJggEKxDwto6k
         0aH8Th+4M7UdkUG3x4TBLw8ITSSHXPirnKxu297AEwKbe0+Hmni85k7bR1xFDMUDCtqY
         v0z8FOqZGTYPo1fa+SCrPa41ZX0okX/qzrMl3JyHw3nkNrVhIh6fpb+DEgF8VlDwM3q0
         eWP0g2YVFVv5Bi/DXW/DUWbu+CR7C+pm8tG3boGQXkTGV/KGb5K8gCYKB61x+IqHFksE
         knWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040273; x=1786645073;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XyHQVGmrLWTjFYPZtM3QIQVJy0S1AV8IITairKJRPd0=;
        b=XWRNCQvX9fqcRrJhxzmCGpCiivbcKLtJwLL7pR8RvTOC8KffVBYInu+vLKP9E48xVh
         pFU9j4NsGW/R2KrLjl0P9/fJf+fFxEf1uQ0t7uj5rl31A+svphC1MCl+RtfcIRXT2Xpu
         EM5lDJAscXMiWzt4C4yKADylPwMZYr7keje54polNHFzH7nRncVzErVtVwo5LLEGCAYs
         2GiZFfFBboydJ2bVfClaMzLCD3co0eqRA+9CBbYk6R55gVgch7qH/J+KzLTgP35E4hBA
         c+h49zyG62a9UQaW6tcmm6Aen4V5antpg6IaCR1i2lLMt1f0zLAToo+UTQLb2BYmtKod
         ZK7A==
X-Forwarded-Encrypted: i=1; AHgh+RrA0b7YDfrCyxsBPduJNlN79tmsRV26+nygyGqCrMjgKZXBKn3s3mMk+YWxCvhd1d73uKLpjyF6VDswTpb1@vger.kernel.org
X-Gm-Message-State: AOJu0YzZpWFrtmZHXwLya7Vp3n8wG20Obc8BUceAhLq8+qqj49dHdHE7
	gwMJnTciHGTu0nxEYwcIOKYUXRRamYSmduPP9cZ7Xg4StY8oMkjgZMp88K3AGO0VlEeQkbmwfJ4
	3kFHjdaw9fUfrS2zB0asTRFtn3KnXvREOycu5Gzp6se5vxxXeF/jQitsppvGDikRKDUhC
X-Gm-Gg: AR+sD10jbUiO8enBQH8zt8brYdXhG4QqDUPJCgH4xDXR+m1HOzPUxql64L7wiBj3oZr
	lq4hrkmyZWV3hSqRSvcRKeoa/hH8iDpgo1dQTcomhFZKGg/zoqFeo2LTnp/TtdNY7EEELM/Aqyj
	i4q8qzHnKxthNEgb2obz+D4UabC5XFGZkrgfPVbpZ9Jk1YAmwhlnUVtQHAvExgtb3k6Igbm6L43
	QpCZ/lB1OzmXh12coZQoGRAH2OkWwR/RBBw63UnKCSzr+usCMCrBq2Ws+GtIrn4w6d/8kgL/qTK
	1ZkkTTxxVVIIQSWD0Z3VE0+WqTbLFHt/c5Xvsx4MJzTaS0GpoHvz+1DfydTmRlvMskFGSFTRTiu
	/xBBJZrGWrCwL3EytHPP+ISP/K9UtuQVO
X-Received: by 2002:a17:90b:3a8d:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-3903c5b9f70mr14946523a91.13.1786040272886;
        Thu, 06 Aug 2026 11:17:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3a8d:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-3903c5b9f70mr14946468a91.13.1786040272307;
        Thu, 06 Aug 2026 11:17:52 -0700 (PDT)
Received: from [192.168.0.7] ([49.204.111.196])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141009ab943sm368899c88.7.2026.08.06.11.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 11:17:51 -0700 (PDT)
Message-ID: <3594bbdd-e457-4a88-9e37-7acf0f3d87d2@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 23:47:46 +0530
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
 <57719877-b8d8-4df0-acce-2c4faf5a5899@sirena.org.uk>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <57719877-b8d8-4df0-acce-2c4faf5a5899@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rt/16imK c=1 sm=1 tr=0 ts=6a74cfd1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=7DW+zsgf7PPjz/i6iZMG3g==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pBl_9jDRoQriJyM8ii4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE0MiBTYWx0ZWRfX84zJrDVX3xMZ
 wUxkz6IclWHu0q5PtNWGvi6Bmr54/pamzBOLIKnz1ebxTryx9Fy0SXaEjDx4YiS4KxzdxtoJglr
 GAw8O4CjydvJaTKLfEK1mBAFTSeymPxDbUNMnB/PdYMWrnXqWacff35eBp3Ob+Lj93F5/LRkQUu
 JPnDkMuEF9lGFsWjmHySqXXT2DwxvM4JZT1P0DcYUZMif8dcb/RL13stzPB53g34SveOOQ7LHA9
 /chPUeSJ6MTvXNw3GkWrLszro/EYHIgxSTc7ZT0vSA/bRqFPwGDruY7/PaqG3BRXqOQD1skH26C
 ATOhfBA3XhKj0ArwaAYrFVPwvmSL5RQNoMdeeGajvt6u9n+EpMG32J0XrF53GBY0HrG9PbHZFcV
 ssDZXt80q7Vc0R5ZFnvSR3fvZC7sIJ4fsLRgoela7gFHTwfXAWx71vegRQ0rDUN1lTW6DQJ33gj
 0yg7Jz1dJFx8/Tf1pjQ==
X-Proofpoint-GUID: xuOBdAyM_bC2DIepD2sOKe2wFJdID3vB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE0MiBTYWx0ZWRfXx4cSaKSDOrv2
 QUgtjvzKHe77B8e3v0+lT0trwDOU03n/tANAzSPyvYXXxg0Ow+Dw+aLsgMsazLzrSVYaFrtj5Q4
 GvxYXVqEATYpiGiLWu3ae674yNK5hRg=
X-Proofpoint-ORIG-GUID: xuOBdAyM_bC2DIepD2sOKe2wFJdID3vB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060142

Hi Mark,

On 06-08-2026 23:05, Mark Brown wrote:
> On Thu, Aug 06, 2026 at 03:43:44PM +0530, Praveen Talari wrote:
>> When operating in SPI target (slave) mode, the GENI SPI controller can
>> use an external GPIO to notify the SPI master about the target's
>> active state.
>> Document the optional device-gpios property for the qcom,spi-geni-qcom
>> and qcom,sa8255p-geni-spi bindings, restricted to spi-slave nodes.
> This seems a lot like the ready-gpios property we have for some other
> drivers?
Yes, you're right. The intention was the same when I added this property.

Would you prefer that I use the ready-gpios property instead?

