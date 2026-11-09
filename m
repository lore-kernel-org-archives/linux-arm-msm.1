Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231498;
	b=Or8LfX4nBrt++LFsyFVEYgDY6DDBBgrc7UZI/OKUHct0blMEBY5/2/UwfF7FynnqZ0EK
	 s0huYreEuKeVOwfUbllHvO42VRTVT5g1T6y1248S2HZ7C7tLTQcrdNuXNWWxZTn5Upra7
	 IxLqn1Yu443ZM02gnvaFDPZeBYeVTFxXWgCMkHYbzXPDH5O2RqanCmEYcTbs1nt1yvj/j
	 lvzKpBLA+41EXHyI+x6tV+XE6ag+FMA8LxkhMTQ4vCkDxQLqvH33Btt2vkZp5ymMDzqDm
	 VwN7FzXsJyN2DZl3Hp1bThX2mmiR4rHup1KY7LUvQMxd/Z5W8JTBsFh1xp3GSFsquBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231498;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y9yf0pWezKAH9/ruPl8hDWgVQ5poWLQ5Tg6+XvGk1vg=;
	b=oa99+xA5TmRIbzK73kUjL5mMj3bY9I67AV1FYKlcgndNvazIgaWcx7GFku3omFo+4M8N
	 U4+lh9y38x2dnYjUNXARvxDq5nuBFevHYC5qiy5zSzTWsOR/k7Q0SuBy+tTzZVh2l1wBC
	 N025ycPIwxpzuNGst1zWXPL+VdYsEs7BwYx4DI7jbfZm19n9JUo6DwFeQqtDZj8fYxKzP
	 79QlV35LQlooEJEOOcGRyUsToaWWyzieT6Nb7qkX9Qwd2ETWEIQfY+asaZ8hxivGNZqrJ
	 NZn5YCn9XxNhuCfk3j0fjE70I9hUa7IX9o8Ptkllatq1jB38NdBkjFg4byLLtDkJmeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bwlicMj/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RxfG5L+O;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897A0606A330
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 13:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 897A0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bwlicMj/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RxfG5L+O
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFEVV4025868
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 13:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y9yf0pWezKAH9/ruPl8hDWgVQ5poWLQ5Tg6+XvGk1vg=; b=bwlicMj/2YBlnHoZ
	1Xmensz5q/+lmIIm5wQUr2+54155guGT8o4G/p55XGJtuejazP4vR7mwWLkQGYp3
	eJHVpS/YepBJvBb3VRKfKJIJ7cTnhhKu6hhI/xkXCbkKj1VBvHACZwoRmDDKjAua
	AWHouNMFdJkglHupEyN7TibakT5sjH2OTpyzVQFIM3r1MdiJF/CJVidtAyG9AGxh
	Kujk71Yp+oxZBIbahhNJdpWNUhMUk5iMuvMgvWBqQD5eSzU1Pff86L/uQSikpevT
	XQ7nA6Y+7ptv7zcFDiWCVPn8HDre8rsNw4wThlSPNYhmV++WirCQgXDee0NwDpED
	TJL4YA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua58962r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 13:38:16 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c97957d83bso24696e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 05:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794231496; x=1794836296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y9yf0pWezKAH9/ruPl8hDWgVQ5poWLQ5Tg6+XvGk1vg=;
        b=RxfG5L+OhxtewOLCj5kCkljtPOPkcuejDfc5wKJTduyG1pmDv51lw1G7YcmpyofxKX
         sxF5ps7JRURQoxiDsfF9Yw4VbOJO7Gnoibdm/1EUuHByBAFDK+Msj/PC4733+MfH7Yvu
         SaPkH7dzGwD9AGwfseeYz9hyp3IC3uwvH7PGJCSdxEe9kRQY6xyhc6YumegoSI//FSbZ
         D4EYMo3INiqxTWvy5gd0VAWybJXyvrWECbYK9O9knPDCySrmgO3H7DEwAZiriSDoXMu1
         tAFwMdxOXLVXJ4ow2jg3PlXZvMd7FDFmSnMGti6KdXg7fze/fgiOlj41Elk4vtktLP2s
         +TuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231496; x=1794836296;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9yf0pWezKAH9/ruPl8hDWgVQ5poWLQ5Tg6+XvGk1vg=;
        b=2IoQgW8vRpDIQbLpFiBD8jjt0bLUao/6LUwySiGSPvA9zEucoqcRlZgPucIkaRqHu0
         54rZs72WLz91GADPrBJbQxbr40yO1z5wmgPpgLBogk/VkTRJsXDuHeq2llSC67JL5yQa
         Be9fkL5oSMmD08AqFJZGVhiWVgl574Q/SUTIW/h77EVbfrcorn0DdXnyrFA6DXK7VCJP
         7+aOO0A3fqptw9R8yFSK339UgVK7PnAk76IwZSri3nXOfK1X62Y+qCJH/EXX+BfGKJWE
         l0qbabtDJ3o8Wp+4jlF7FzEk/cfPXaLenMnPRkh7UnI7UXRO/MXK0s5pGodhfG0OjF5/
         Rbjg==
X-Gm-Message-State: APuU4Z/7zSueSVr/4vxD3thP1cvatLo5ux5MQZIdcUuwdypsfQ6Dwew6
	xO5yE1PwNTvLSd86UXn314AO49TkNIUd4/4J0wr8GXcXjiU1LR3/Fb9HXHD61ReDq5gSzJmFZRM
	nE3wdV67K6jwCc7BtSK3C97MlEeQgC5Gm6HxzQzZ0J3yL30VCrXfcnMXZoymhx9bV465j
X-Gm-Gg: AYBFou0v0E7MfxC5T61bZ/4N9InlII2IIVyHdMTn7Gwa0QEHvOyWkhzSc2+fDfkHfw3
	7NvxsOfCIvixSTg4PINrdQonNm+gL7PXEubWtEWWaEKi+x4LDlRsK0qmDWGwA/BfRG8s7WK+FJb
	ORIK0t5ATPnMeUdGxywLa37Fm1HAuUo53L820IXiEH8SAqPDL8RP78DhfTcfnQFrzL8ziYH1n5j
	+Q3Irv8A2GrU2D+Gtzw81EOJT7X4/13849/PRGK29ch5/A7WGG4cMkNRVAQ6rjZXMbcQtnhNREe
	Bcfte6ZDxYOUiMjhqcy3o0tqm+tW6sAByGLOYVg1X4sn1IDJT9O3e2xo8xrnp2UgrTO06DcTqb4
	wQF53e4ybaxXJp0UweVY80JlV4PYbUauIm7eRuEyWT5F2Ox2wbD8J8astSPJHhFSd7i7kOw==
X-Received: by 2002:a05:6122:2c2e:b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5ece7149335mr927569e0c.1.1794231495688;
        Mon, 09 Nov 2026 05:38:15 -0800 (PST)
X-Received: by 2002:a05:6122:2c2e:b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5ece7149335mr927556e0c.1.1794231495103;
        Mon, 09 Nov 2026 05:38:15 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a5a460asm166802566b.60.2026.11.09.05.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:38:14 -0800 (PST)
Message-ID: <bcea16ba-019f-4fbe-bc70-9f9a29461a30@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:38:10 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Fix
 LDO voltages
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261108-t14s-gen7-ldo-voltages-v1-1-e0ad0d528767@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261108-t14s-gen7-ldo-voltages-v1-1-e0ad0d528767@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NCBTYWx0ZWRfX+nKizsF+0R5p
 Og0HA9tbmDEaZLcHrPrBFUlr9xZ7lFLhVhBzqob7MbVDILT83ag6tqtN+GjT1VWQuCiXG/VMtlf
 wJMRjH9B/i2LYMVPDr8MXk7B7DbR0EcG4QRhkWp75U6T+iIoY6uPeYDjyrEKfvJNyhIPBRRlNLg
 NDwVbCuRo5Jf4BquG342W8Rgdk0tN+rNPByUpEylSe9LOJm3foDWUY5ww9XXejYSmeMK/KVmPbm
 J6wFkhH28YDWOmA4EmSDxE6dJFCtVF3XChZuMau3rWXANqiwteAf9DSvHX7wL78Wj1rsMt77v97
 4F4Pe62ZQfmGylittVpU+FZD50NDVumz07/Y+pJ5FuJo4T1fQrP8TsitlWjbhlk/lAejHu63/0U
 nKP8HjjK48bXdO9xiiA7FlWT0lPtaBzoorFq1yJiMPb+DwUCwNOwfiIcCyA0gcrzQ5UYY0+h/1s
 91tOumEZl6K5kSao7Cw==
X-Proofpoint-ORIG-GUID: ao-QDxzZ1_Qb5Kp4FUpemJRcQjPwDh3u
X-Proofpoint-GUID: ao-QDxzZ1_Qb5Kp4FUpemJRcQjPwDh3u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NCBTYWx0ZWRfX9L9ydemcZjBC
 jIVwE1isITEu9Wg1a0x4a/00o2kNf1GpfOcjhz2rmkpacIzzQbsS38VZ3C+pkJ4w2oMKps+PccF
 sFus5TSHJnazO76FhQdbTou7rsoMbwg=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1ccc8 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=M1jp7Co84lAIlnRm40QA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090054

On 11/8/26 10:01 PM, Abel Vesa wrote:
> Several LDO voltages do not match what the firmware votes for the
> consumers of these rails (the PMICVREGVOTE entries in the ACPI tables)
> nor the schematics:
> 
>   L1C E1: 0.832V -> 0.912V (PCIe4/PCIe6 PHYs)
>   L2C E1: 1.144V -> 1.2V
>   L4C E1: 0.72V  -> 0.912V (eUSB2 PHY of the third USB controller)
>   L1F E1: 0.88V  -> 0.904V
>   L2F E1: 0.904V -> 0.88V  (the L1F and L2F E1 values were swapped)
>   L2H E0: 0.832V -> 0.88V  (HS and multiport USB PHYs)
>   L7B E0: 2.79V  -> 3.072V (eUSB2 repeaters)
> 
> Fix them and rename the labels to match.
> 
> Fixes: 300f5c59beb2 ("arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Merging the power grid consolidation will fix these too and I'm
hoping Bjorn is eyeing that one, as I would really hate having to
rebase it..

Konrad
