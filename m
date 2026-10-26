Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016515;
	b=gs7qGTlXy++qGLbcikryR3jXYTyfPV+ZXjtgr0OGlKvRTCOnVhkkg2T+j06ARhi6iojF
	 MXQw50swVd0ZqN6okPXA5Lj7wecMqS7ukKhEZZFFXRKKorjhSsZWxOqKURR/sI4h8Loi1
	 19H3HF8aSZiRe17hycmLbLVEcwqiyayCQYjDUEoFExUs0iC1nnbucfy8LHCEvPLBBvjmO
	 +VGXk1PwkJqpSmf46E1GZ+TA9B6qTr02Lk65A9lMMmoypxKbSbBiVRMqnpM3GAFzvv8AI
	 yEmueTaQqoLSl5Lgxzdy8tSWxxmZbo1ODVputXvDEml6gNa5nj2arWwVRfKwpSIH/mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016515;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I/2wBJIeXxryjo6HX0okQ8Ro7vA8D+4gbgBbPi+WFCs=;
	b=CAy9YVLJfESL4TJMXwbEAIvhWj84c1Yr6vgLH9VIE1MqQex7A0vSL7OPejD3pCYrGG63
	 4RmxaLqAvD4MhrCXbNC6eWxzOiHdfmfuwYuzsqKRJru24Hwjvz4fU1Q88a46Kvlb6vQcD
	 Ex2jcnFTtI7MyjzFPpl4WtQ9LvDVfRQgyDImE2qzoBxv0XlCcKBCB5wlH2ZZrVOCT+1bO
	 YXkz7SpB4EiNVgpOwqdEEAqwyDQfcg54M3SWSGNPk8eln8Mw+WTT/ab9158GeYsVvqiTd
	 9kVg/+ax+UsHbIcXJmMm3qGWZWbAkbwaDMtVo/Ip8QBvDlhh30LmTbo+hUjdYMiC5ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="UBDhL2/J";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hmUzgjuo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CD0606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36CD0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UBDhL2/J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hmUzgjuo
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtD032734116
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I/2wBJIeXxryjo6HX0okQ8Ro7vA8D+4gbgBbPi+WFCs=; b=UBDhL2/J/zyEE1ES
	R2dhUXcKJ496SiaNwrqaAJUCufFyKrbi8c8zvCV8FFRwMQoKjtwvI/p4RdIzM5MU
	yGZ4KsPjvttEEpgjItGF5hplhLM56pblraZxnB2OUYTscekRqR2SURG/rNCsDKS4
	6X9U+lzzGlXlQaW4Sk9ZlezTl6qlfF2QF3r77qaUbTC48SedJIUuBuvTyDTDDiym
	rs7K6TdyZJ89X/05yIM6DSbgyiONBaIcDiqZv9LStHj7dtrghP0WlDXJqmvfWBG2
	AEjQ6F20erx4cJT1WJhD44jqbFbWWZRrETXmR41IvAGjl31mC3lquO9AppNM3fdf
	XCB3Iw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8hsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:08:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3580c07911eso9662167eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793016511; x=1793621311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/2wBJIeXxryjo6HX0okQ8Ro7vA8D+4gbgBbPi+WFCs=;
        b=hmUzgjuo7VFFGDaIrIXGKMhoKl3Q+HziWx8RhAy6HxVoyGQdPnN1uU9Nvz0PQPae5i
         bcK4Uuy+AZSupm+037zr7hPaYkT7+/ezcj1ZEAmpcWJ6RCKhv5EsDh/k48jE4vzftAsT
         HZA5/1Ofxb0K18SFfsFdq5P67b93nUw2g8prBoGaGgGgFMUMxn2qgt0IyNlSeeUuRTCv
         ya3nIx29i726/TC+HFF8uQAcTR3kaMgYK5C3E3NSKkZTmXu+vIBOAtF80hmvef40LI26
         kqMFCsJWtb60s2G52ZMnsQfTLWg7qYpHh87PTyIRW9sDP+sVc3EMVVTVPsnTnHE40W10
         RO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016511; x=1793621311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/2wBJIeXxryjo6HX0okQ8Ro7vA8D+4gbgBbPi+WFCs=;
        b=V8vNlqlK84tlakIoVyZOQCwagHVY/k35/SwlbzoBbVosBpukRSANknCvB9/4qNvPgs
         Mz8Nn4+L+klsyt98MydtYsTX4HjYnIDgRUm1+CGQ3LLaEOpfvD4Xui6atxCbOObPojiM
         E0bkojLWzqAqXgHhVByp1Nd38Tqfm4R20MBRTvc9/CEbvBEMXQ86XOryn2IMy3DjKKE3
         PXZ2mf9zb7rUZCc1l+F3stFzePWUmiz/XQl8o8Ekke+nbQZ1sUtrZsjV0tWXH52k8Fg+
         lKHqm0SXaXW46tyvMo+04FGIo90L3TSvx2fM72grATlB4hpHm8x9+PZ9E/XRBshbs8VV
         K8Eg==
X-Forwarded-Encrypted: i=1; AKwUvByUZaMY0sJJe7NhaMiQrtT/c4uhsx3MbQl/8901w7UgM/wJYdch0IS/JA8aaBQrgNF9zoRgwBlMjYi3IUDx@vger.kernel.org
X-Gm-Message-State: AFq9FYLQlKK6BXzDL2sOEZ++HyxFZjE8fekMPCvR8yW3pTRrwbi5tWcz
	FGOLgP0JnFIAD7l2LyKNOYvxUGQiKs62L/iGY84EDAmlZgzqYTJ/mAU7tfizuaSM6MjXFK/bO3o
	hUABoL7Q+HQ1hEHhFwiZheLbABdMY7XZTJzosafxDuHlWds0WrvgcxQZsnUoCN37aukRe
X-Gm-Gg: AYBFou0T3GAQ4A9kKqHpzV+CnHQwAbJJCoGgw/S13P3rg8qxY/UohyU+Ps9AyKD0clp
	ZiQGiIuHVjljgBnOGm5DJxkwoCMTey6Nd2NhiE0bNzDOvcGZRw8IQAhG/uvX5U57zO7zoC5+tIf
	6zg/9F/O34CYOA4fqsmCbhDhEddbvYtlKWR+3nYy6SgQqXoJJ5HQcpy6dA+EjJxSEv+KVUI9IBc
	vVy/0e08odVjQDWZRFE0g7iMzJIxcDmhfLZm3ydbaHESRCUc9bzxc4w3lhHj+q7Lnfa5ZL6Ej+F
	hYVA5MsG46tDttHUi7bF5i7y/9MXKd2HouHuWoiiBI0AuRzq43L7/N9P5FRtuNZslVBaU9plySq
	Ctqt7luDH5Bg1bjEjPvyvSrdSZqIVeSGe
X-Received: by 2002:a05:7301:7308:b0:368:74ca:1c5 with SMTP id 5a478bee46e88-369e861d8abmr9880684eec.37.1793016510995;
        Mon, 26 Oct 2026 05:08:30 -0700 (PDT)
X-Received: by 2002:a05:7301:7308:b0:368:74ca:1c5 with SMTP id 5a478bee46e88-369e861d8abmr9880620eec.37.1793016510298;
        Mon, 26 Oct 2026 05:08:30 -0700 (PDT)
Received: from [10.204.101.25] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm19980167eec.21.2026.10.26.05.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:08:29 -0700 (PDT)
Message-ID: <a0ed3cf6-a58d-4a74-939d-62c9e6643b79@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:38:20 +0530
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
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
 <99a419c3-81a8-4b37-b9c7-2dd56978162d@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <99a419c3-81a8-4b37-b9c7-2dd56978162d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0OCBTYWx0ZWRfX03DzNVfmRgy2
 QYKAWGRk8g6GbMKkm2IUJKp9ZFMlV2rIZsUK/Rj3Frq1PiIS8jYqczxIYTNhGTQnebGCuyyloI2
 FqX6anMnuzgkxhKwQqak2nerciyuJCtqfJVTZEZFQ9/ac28m9r5JjX2ZFLr6tNjVlmB6t9C9Gip
 pF0mtNmVFzLgfvFNL50qTtXpNAQATiOOG1My6KGXZHfZj7gPIgr2hrU3PHsaMVmT9ME3lSE09NT
 lGJQD2VUwe4rSeVyxS72+Dc8G8isur7y8cyLm+Td+LCFH3eX0TsmwbpLaVFhxkE5taVSbHx53lq
 OLrx87yrJyXSp7lQCVhbzYI223DRFac49zQCr1r05IiD0/tBslQMjUl1hLQusbiAfahigUlUjDM
 jk9DVd5Scf7wdt6atTT7T4gTg8gp+7EYAfNreQ7dAUWfxkGUtsn9fZ+sFJ8qPyREPtXfh1x4jXs
 2Y9TAY0RTNT9BHDYdRg==
X-Proofpoint-GUID: 0kyzXAqFSNdWv3V1dWRhg_JoyTfU3k67
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0OCBTYWx0ZWRfX6E3cNiAIfoCh
 2YlAZfAR6J2hYcizerhhxB3zanmj3XtwfsvrpOfjbCHQnIDFjhrd5iXiiubRwj19ZjVh/bww8Da
 P0zL9K1d3xLm4SxDy0qS8b/TyBJjM6A=
X-Proofpoint-ORIG-GUID: 0kyzXAqFSNdWv3V1dWRhg_JoyTfU3k67
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf42c0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=394QqUzTKF8zEEn8ObkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260048


On 10/23/2026 9:11 PM, Bryan O'Donoghue wrote:
> On 26/09/2026 07:34, Vikash Garodia wrote:
>> Reserving an IOVA address using "iommu-addresses" requires it to be
>> placed in the reserved-memory node. But when "iommu-addresses" is the
>> only property being described and there is no backing "reg" (i.e. no
>> actual reserved system memory), it does not really belong under
>> /reserved-memory. A device IOVA range is specific to its own address
>> space, and does not describe the system physical memory to make it
>> qualify under reserved-memory. Given this, place "iommu-addresses"
>> inside reserved-memory only when it is paired with a "reg", otherwise,
>> define it within the device own node. It was discussed here:
>> https://lore.kernel.org/all/662f7093- 
>> fb0a-4564-9ca0-98e03e68ba9a@kernel.org
>>
>> Existing "iommu-addresses" property expects a phandle, which does
>> not make sense when the property is defined within the device node.
>> Introduce a new property, "iommu-ranges", to specify the device
>> specific IOVA ranges when there is no backing "reg".
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/iommu/of_iommu.c | 128 +++++++++++++++++++++++++++++++++++++ 
>> +++++++---
>>   1 file changed, 121 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>> index 
>> a18bb60f6f3dfdba853b6e16dd2a8616f6a731c7..9766a6944d0e11a6cd8b74b1b89428acffe3dfdf 100644
>> --- a/drivers/iommu/of_iommu.c
>> +++ b/drivers/iommu/of_iommu.c
>> @@ -190,6 +190,111 @@ iommu_resv_region_get_type(struct device *dev,
>>       return IOMMU_RESV_RESERVED;
>>   }
>> +/**
>> + * of_iommu_derive_resv_regions - derive reserved regions which
>> + *                                are outside of iommu-ranges
>> + * @dev: device for which to get reserved regions
>> + * @list: reserved region list
>> + *
>> + * A device can describe its own usable IOVA ranges directly on its node
>> + * via "iommu-ranges". Everything not under those ranges is derived
>> + * as a reserved region so the IOMMU allocator won't use it. Entries may
>> + * appear in any order in the property.
>> + */
>> +static void of_iommu_derive_resv_regions(struct device *dev, struct 
>> list_head *list)
>> +{
>> +    struct of_iommu_range {
>> +        struct list_head node;
>> +        phys_addr_t start;
>> +        phys_addr_t end;
>> +    } *pos, *new, *next_range;
>> +    int size, prot = IOMMU_READ | IOMMU_WRITE;
>> +    struct iommu_resv_region *region;
>> +    const __be32 *maps, *end;
>> +    struct list_head *prev;
>> +    phys_addr_t next = 0;
>> +    LIST_HEAD(ranges);
>> +
>> +    maps = of_get_property(dev->of_node, "iommu-ranges", &size);
>> +    if (!maps)
>> +        return;
>> +
>> +    end = maps + size / sizeof(__be32);
>> +
>> +    while (maps < end) {
>> +        phys_addr_t iova, iova_end;
>> +        size_t length;
>> +
>> +        maps = of_translate_dma_region(dev->of_node, maps, &iova, 
>> &length);
>> +        if (!maps) {
>> +            dev_err(dev, "%pOF: failed to parse iommu-ranges\n",
>> +                dev->of_node);
>> +            break;
>> +        }
>> +
>> +        if (!length)
>> +            continue;
>> +
>> +        iova_end = iova + length - 1;
>> +
>> +        if (iova_end < iova) {
>> +            dev_err(dev, "%pOF: iommu-ranges overflows address space\n",
>> +                dev->of_node);
>> +            continue;
>> +        }
>> +
>> +        prev = &ranges;
>> +        list_for_each_entry(pos, &ranges, node) {
>> +            if (pos->start > iova)
>> +                break;
>> +            prev = &pos->node;
>> +        }
>> +
>> +        new = kmalloc_obj(*new);
>> +        if (!new)
>> +            continue;
>> +
>> +        new->start = iova;
>> +        new->end = iova_end;
>> +        list_add(&new->node, prev);
>> +    }
>> +
>> +    if (list_empty(&ranges))
>> +        return;
>> +
>> +    if (of_dma_is_coherent(dev->of_node))
>> +        prot |= IOMMU_CACHE;
>> +
>> +    list_for_each_entry_safe(pos, next_range, &ranges, node) {
>> +        if (pos->start > next) {
>> +            region = iommu_alloc_resv_region(next, pos->start - next, 
>> prot,
>> +                             IOMMU_RESV_RESERVED, GFP_KERNEL);
>> +            if (region)
>> +                list_add_tail(&region->list, list);
>> +        }
>> +
>> +        if (pos->end == PHYS_ADDR_MAX)
>> +            goto exit;
>> +
>> +        if (pos->end >= next)
>> +            next = pos->end + 1;
>> +
>> +        list_del(&pos->node);
>> +        kfree(pos);
>> +    }
>> +
>> +    region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
>> +                     prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
>> +    if (region)
>> +        list_add_tail(&region->list, list);
>> +
>> +exit:
>> +    list_for_each_entry_safe(pos, next_range, &ranges, node) {
>> +        list_del(&pos->node);
>> +        kfree(pos);
>> +    }
>> +}
>> +
>>   /**
>>    * of_iommu_get_resv_regions - reserved region driver helper for 
>> device tree
>>    * @dev: device for which to get reserved regions
>> @@ -214,10 +319,14 @@ void of_iommu_get_resv_regions(struct device 
>> *dev, struct list_head *list)
>>           memset(&phys, 0, sizeof(phys));
>> +        maps = of_get_property(it.node, "iommu-addresses", &size);
>> +        if (!maps)
>> +            continue;
>> +
>>           /*
>> -         * The "reg" property is optional and can be omitted by 
>> reserved-memory regions
>> -         * that represent reservations in the IOVA space, which are 
>> regions that should
>> -         * not be mapped.
>> +         * "iommu-addresses" must be used in combination with a "reg" 
>> that provides
>> +         * the physical address and size of this memory region, for 
>> an identity 1:1
>> +         * IOVA mapping to that physical memory.
>>            */
>>           if (of_property_present(it.node, "reg")) {
>>               err = of_address_to_resource(it.node, 0, &phys);
>> @@ -226,11 +335,11 @@ void of_iommu_get_resv_regions(struct device 
>> *dev, struct list_head *list)
>>                       it.node, err);
>>                   continue;
>>               }
>> -        }
>> -
>> -        maps = of_get_property(it.node, "iommu-addresses", &size);
>> -        if (!maps)
>> +        } else {
>> +            dev_err(dev, "%pOF: iommu-addresses requires a reg 
>> property\n",
>> +                it.node);
>>               continue;
>> +        }
> 
> The if/else doesn't belong in a path entitled 'Add support for "iommu- 
> ranges"' as this changes he behaviour of iommu-addresses independently 
> of whatever iommu-ranges does.
> 
> The reg update part basically has nothing to do with this series at all 
> i.e. the code you depend on later in this series doesn't declare iommu- 
> addresses so... this is an update to align with a DT schema change.
> 
> https://github.com/devicetree-org/dt-schema/pull/207
> 
> Perhaps splitting this into two patches as an iommu-series would be best.

Intention was to keep the patch to add iommu-ranges property as part of 
iris driver patches to show the usage of this new property.

I am fine either ways, whatever it takes for the maintainers of this 
file to review.

Regards,
Vikash

>>           end = maps + size / sizeof(__be32);
>> @@ -258,6 +367,9 @@ void of_iommu_get_resv_regions(struct device *dev, 
>> struct list_head *list)
>>                   }
>>                   type = iommu_resv_region_get_type(dev, &phys, iova, 
>> length);
>> +                if (type != IOMMU_RESV_DIRECT)
>> +                    continue;
>> +
> 
> If you look in iommu_resv_region_get_type() you can emit
> 
>          dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] 
> as reservation\n", phys,
>                   &start, &end);
>          return IOMMU_RESV_RESERVED;
> 
> on a mismatch - which is not what the code will do now. Mismatch will 
> warn and then not map.
> 
> So maybe dev_err() saying you won't map - in the new patch for reg. 
> Either way this isn't a change specific to iommu-ranges.
> 
>>                   region = iommu_alloc_resv_region(iova, length, prot, 
>> type,
>>                                    GFP_KERNEL);
>>                   if (region)
>> @@ -265,6 +377,8 @@ void of_iommu_get_resv_regions(struct device *dev, 
>> struct list_head *list)
>>               }
>>           }
>>       }
>> +
>> +    of_iommu_derive_resv_regions(dev, list);
>>   #endif
>>   }
>>   EXPORT_SYMBOL(of_iommu_get_resv_regions);
>>
> 

