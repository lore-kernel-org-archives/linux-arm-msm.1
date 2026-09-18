Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A47C49AA4B
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726155; cv=none; b=g15KLerhBHIYnrkPhV6V0MqKqNZt4KJbfK4wORbnwwRZ2Furaqo6x6zQTeUdVbFj2NH7rwTIpfEFUncQpoa/luvQD3z2c2qK12W+fCw9XPoZEeh4r4XITm7PkqpvlWuvyTAi6ahqDo9FvIOFJXYJf3Tkm14TSbU1ANpsrD+xeo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726155; c=relaxed/simple;
	bh=PdHZlWD9stRXw95qKhpl6GcX5DTPEE/+zggsNCbuTIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BvkHJUlZMmau8fhVXZtiCkGGVZYte7IX0ow+S5tzpUcnyTIQva3c1iMCNksX2NmndBZUkVYiWMzyri9EYPOMQ5vjOfFtkxUckyTUSoW2csYNL5DiHGJ8vlFKlQ82voKZAoxbbijVbWM8pba6BG35ert+qvQNkUfeCbGPEfEqb1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqOtuCAA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RfVLDy8I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqOtuCAA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RfVLDy8I"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IA3aSx3208428
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l7aH3G+YIfHjUylzEkTWI9QbsyYLvYVeAmPcb5XjIHo=; b=LqOtuCAAc+0V0MqO
	kjsdn/DItTqi1uN084zlypVQY/pCnPnuMgHsHdyMPRpGCfhcDV3PFA7jbiKzfehA
	OmC7uFYddN4YjWeG7Iu3YJwPweKm9SCjQ4z9pQ9CWJUVyth0QbbzHpZXUSHKUiKX
	7+DLKuc1xmRPUsoxU9v/HmEvEhSx03GQ1ycKWlQUH8H8BIcMMxRYpMroZPhupyz9
	tSnwUfyj2A5VzO4IcKOZfCaQyz3FlDt78mWpDl2s1XIxxnm6qa5qpRrvuYwZQF+d
	1vxDL2HKyBA4dEChamsSVhWKzZ94OEiDime8q8YNJShhIKaFEn+WnH6U4fUBQTnI
	NWbpDw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dg0mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:09:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a18b457bcso18287485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 03:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726153; x=1790330953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7aH3G+YIfHjUylzEkTWI9QbsyYLvYVeAmPcb5XjIHo=;
        b=RfVLDy8INFpOzz0CzYOwaJI0hn7p3p6W4v2A+yq10TRMXQnH7Xgraj8aKzocM6rZT3
         QIGrmNE8Oz/tqnuWFwxpMVbZ3FuCYCKw6v3n5rZnQPbTqA7yEnPDpxPvKZMfDEudDxiU
         TJHUdoZC4AG5rrHHVAkZ4vCPvzpkEuBB3s9WRUpNxUWlqi1EN/d2dmtMnIh2w/JvCFP7
         0+6652o5UIRnLJE4E3gtiudIZ1ouPMGmYRQdKHqsN5W3GTWnMXsrBUrvyL8JfxxBBQR8
         ExfEP3fgok27et5L/TYtBbgZQhVX3QDVGD9up136GE2NT1DAU/nGokztkvSfwmlK7/c6
         OY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726153; x=1790330953;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l7aH3G+YIfHjUylzEkTWI9QbsyYLvYVeAmPcb5XjIHo=;
        b=2rVVsYU0VPAzXOLu8JHSw03sFM/kgkNXQSjsNomsn/zPrYvBw0+1PveHz+Ff4qwg7J
         4zsndA6Q3gDxcs0+04CF34pBmfOU7eO2IKz+KlZLlfxNNxRsokSC+JcUGqJs2YUWe3KG
         W7S4iylwivA+kxbQffPixT8dvZQY2QFwMF91fWV7gviL6GI5tg5vU5lWS0U/yTQIrKaK
         xBOq/Bo2LCKYxjLMf25AK7yMU92m9vjT+yw02m4KEKIsZgndad5MqjWOX9iPlkNibWoF
         p4/s20H+G0zQJj+ptQs2qRJxTh5LNboJma/y1dksoeREUPRvYOmjavaH1qohecNIEXvk
         Na2A==
X-Gm-Message-State: AFuF++m5AjLa/ztw777NuUsXkN2VeocGcsYPv2LpBdvHojwo8CZOBvys
	c7+pOLuSVQFVtk6qq3MKJREG10dhnp7F+msD4gN4jdCnJ+uvdq8VV2m6UtD483woUcBkKeSa7yV
	u9kqLnuTbLw+e/vy0wQ0Z9VqZG0L/NhgmRTgDjHpogGPG0RqfLgFcPNN7YO7DNK9AEGSi
X-Gm-Gg: AYBFou3azWs6I0tY3fTsYHv29R8D0ZiUWzaYCt0bWJIjwmBmzhnheDO5ybmHZ39Jxqu
	nalI0bV4n9HrBSKYAdpBIPbcwwc8L5FlPHHx4JEq1m1dumq0PT5R87b9EdhDNDMkAoc5Bmx7IwC
	+lisg6iCDQJ2S6zhTnZbVtjUPMqi9WOEM2UFAwHRdvgAFqvPhN5UHDjiIdYP0Relm32Uc0nrX4y
	bJXWzu/z+Ev0gU2+oVWOtWFzt7KkCkYK2gxB9xOeWuCj2fiz+IyI1igKZSSOADXn/wmqE2tbmxk
	8xRxSo5G7Ej+4bAeOPrdLLs8ndolrruAPt8f47OSMDXpSJGTYprUf2qynruugoJ4Dqkah+pxOAS
	dETIteLBlBbLn8M9av9ha5Q==
X-Received: by 2002:a05:620a:2704:b0:93a:3e11:e2f9 with SMTP id af79cd13be357-93bdc6df676mr293460385a.2.1789726152626;
        Fri, 18 Sep 2026 03:09:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:93a:3e11:e2f9 with SMTP id af79cd13be357-93bdc6df676mr293454085a.2.1789726152075;
        Fri, 18 Sep 2026 03:09:12 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb88913sm40882766b.37.2026.09.18.03.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:09:11 -0700 (PDT)
Message-ID: <f1a7e576-b84c-40ff-b4dd-1da6bc0f3990@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:09:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] arm64: dts: qcom: lemans: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-14-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-14-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MSBTYWx0ZWRfX6Qimkb0CiojX
 UTWdUzqf5HUmIJTPhRy3HNPGA6t/0y+3r7b7os/16RyHoA4kzo9AwTUfaFnNMijtdV2AcRNx+R8
 S8z36tydrX/yd+Eh0XS7a/KzKLL5joE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MSBTYWx0ZWRfX3pHTDIQh/3jN
 Imc0yxRWYGDnY5Qb4/5VXpyVhRa380uvwuAKFmxFeER+GwGzrKlL2A3PvzkFF6XfQLB+jlnMkKK
 u2JxG3jXNPpfPCXNY8CDv3XPcRMs14JBVSIj4ArQGyPFEVGEluIdQuDbfIZ9c8lN4Erkh1QcMKi
 1GGS32yii6u7wISMONQgkhtbF+QWQmQWAOkWO0erBnC15cqkvS1hkaUzL+cNmJMHiKjlDz6KsCB
 NYRoWa658QdZjsI5trtWoC+RXhNmyeSC6XnVpsuYAscKEQTz+Zy6G2vF/2H8R+gYzFVOP31kxLm
 d1WgUvUkXOaSYxTHuGXdLxxXtE5q8ViXi0FdXODKWXgc1t3K5vEwXPkTYOy1VxxLVdtdvj+EPLh
 KwunRZCduuj0d5pQupF1OknqHdqgv4YQVnacaflgCHpM9vm/P9aCr/QJBiU0m1XxipfKI4NWFKd
 PtpukdEV2ejal1w9j7A==
X-Proofpoint-GUID: WBbz6-nhfcgTzdA0cE9lib8jY_o1a2xF
X-Proofpoint-ORIG-GUID: WBbz6-nhfcgTzdA0cE9lib8jY_o1a2xF
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad0dc9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CLDG33loBYVu3UNdBq4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180141

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys from the controller to pcieport0 and
> pcieport1. Add the missing pcieport1 label to the pcie1 root port
> node to allow board-level overrides. Move perst-gpios/wake-gpios from
> the &pcie0/&pcie1 controller overrides to the respective &pcieport0/
> &pcieport1 nodes in the board files, renaming perst-gpios to reset-gpios
> to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

> +&pcie1_port0 {
> +	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
> +};
> +
>  &pcieport0 {
> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
>  	port {

ditto

Konrad
