Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40833DDDC9
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542041; cv=none; b=RqQ4idIx9CTedMF/f27oaq/WHvh/SMuaBuw1qNdBUvZQOmWMJNi9xBbSoqH+fquaF/Lk2sajAfoDgKa8GItEbpBl/+gliHre4/hWKA5K80DdJVnS9if+NnzZ+Zx0+KWCozbDcXRIFdj8Dsa4fkKvGiy+Fs3cekvg+g+6Xxjg7Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542041; c=relaxed/simple;
	bh=tzQ9eHfyq3kzitdu3/JRiyY3psgb2hIO0GfXWpOqYiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aXTs7jawXGzVIJq/JMklJv4VXEOluRXW9Z63Ko3zWQiL75j9yAxQAo9FaQ32PZAD0+eoOkgRWkMif+er7W2h3NZOZwm/KnAfbOQ52Owj9JRG20C6ILRxvbUk+YyysZRi1dR2EPLebhoHMvFd4bY3YwTjunsLxMOqH3b7KbL5ttY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMO0Bdj/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9ee149S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMO0Bdj/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9ee149S"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vmgf2140110
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j3Y+UGlZuJ7U2i6U7ZQmiNteHAgHWI9jGYqp7rYzg6s=; b=kMO0Bdj/k49N74AZ
	PbXInzxTO6y2DZHyjRk1s6tOWGeUMb6jMOVwKTJbfM0+3CP821y+7ZP5qppJHdNw
	0DC3W1NOCkUveisjyKQPslCZ1QDF1CrEMQSGy+NIqPmbQSMwjudgiTELc4bpG3wk
	Jf4ucmMu01j3Y1nQLFw5ZoLIfoW2nTqcR10hM+ZR1YrTpKbwRCYaeSddseN/l0OP
	+nUFCCmI5xRCahDY+2QGqEY1B3AX852QdffZicONw5tB65RSh8N96G5UfFOA2NWR
	RWinP77MKyYs8jG3qNAHLnZJeBMdGRzDkhen6rOQxVc6FDZSCfySYxI2cDQCwJaj
	WmRGrA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0c0sj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:07:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfa45b280so22810301cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784542030; x=1785146830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3Y+UGlZuJ7U2i6U7ZQmiNteHAgHWI9jGYqp7rYzg6s=;
        b=B9ee149SHO2CC+GViSSOgzYp+qxPnr5rpcRK3ETzcyWN9r+/d+sR6Xc94p71sycWT7
         5/5CBdXgU3T12gOzZnkK7FIUXbhGvvT3i8Iow9BeimYReV38nrstBxBEp9+MNEQ8zobn
         LbHV3hqXmhZuLoRbsj9CFsIKIzAMvrbBhdrKucbjy0i0GfRoXZmO7qKIPyLRGqylePBO
         XjQYdQkMxOMo9gZssaslmenqevaBOby3cE4ZdKv+fdy42sfcxlM51wwGW21IBBebieS0
         V8S5Fn3KU8M6Xjh2m8SLGQWZ2iLYqZCnTEJ19csBBw2dNPQDhAUl16/usAnQ4HMZvsJf
         RW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542030; x=1785146830;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j3Y+UGlZuJ7U2i6U7ZQmiNteHAgHWI9jGYqp7rYzg6s=;
        b=GLt+Dw26sGGh7X3MngYzBpP4sP5HUuN8s53Er8SyDKkgHO53oyrr4jBTZNynqzWnOD
         zzXFMQ0RvL8Ge7LGwz/71+u79KMGiB6UnD3LtTHs3M5Kf29VnjrXmNESmdw6gyZNw9Hl
         EQKeLQ8WI70I0S8AruEvnK382q7Geg6qsZVhBCf18s61u/Vj3fkj2vCKqk3xD2Oz/OzR
         sLjykkP6/pBPN7vdcPdG4GTGtbXACPWut3ATuUx88jptDfA3GLcKCXth9+ADtZxeqp1l
         7Ju6Ay8oKB77S+YGQf37YypNe5TSpVBI4HdXnWPYddD/QROjiVtthrwfXuK0+Fx0R9uo
         yEQg==
X-Gm-Message-State: AOJu0YwUbjCnVy301BMv5Hbfqwbljr6pY4whZ/umoA5Np+HL2tWD9sEV
	ArAhZPJGyCC+mKw81Dh4RrdG7exbiK6o25Uf769KS+iOvEPWAiF/Za+AMCaCBoCTu/I/YW5Gisc
	GoqYBARu0mqDdeNBPgtItyETcYXN5w4mIKr9Dcq6h7A9bW0YUnW5g7/99woaNJ1e+Y9KJ
X-Gm-Gg: AfdE7cmBgbXhXNd+3HKk0MLAwK5ZAOOOGh9sKBonq4WIGukB56de359JkGrDvQoAQDj
	IH36G0nXVB8qNj3nrLnG4PEoUnccZPtwZI1WV0bIiuFcGsiM2CZd6MjiIFPyqqgOyJqiEj9cuIV
	LKwMCw/UhfG4LdL+N7ty7chUMK2zmbF0ZmKYB7hYzlpPfodmqzdHlZFWZIApda0JrJfl8dL4Lpt
	VoloXoa2b6zRqRJDMXJs5eRfSVQV7Ok2vz4/iMk2gfTszMxD1Br03ozXhwKRwdnexbrQMB84DA5
	nV8X+/R0yMr2zZFzwpVVsx4QRyNr+9b76t6zuqHkCHS89Qu6PCGEX+85E73shRNhmx6P7t+4Oku
	i7ACZkA8Cyf+9tvJm4UL/5rVX
X-Received: by 2002:a05:622a:2515:b0:51b:ff1a:3d80 with SMTP id d75a77b69052e-5213e67f307mr108566291cf.7.1784542030119;
        Mon, 20 Jul 2026 03:07:10 -0700 (PDT)
X-Received: by 2002:a05:622a:2515:b0:51b:ff1a:3d80 with SMTP id d75a77b69052e-5213e67f307mr108566091cf.7.1784542029722;
        Mon, 20 Jul 2026 03:07:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf3ad3sm440846966b.55.2026.07.20.03.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 03:07:08 -0700 (PDT)
Message-ID: <c1bf749c-46d7-446b-8a32-12da14d474eb@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 12:07:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Flatten usb controller nodes
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-flatten-dwc3-v1-1-b18be56bebba@radxa.com>
 <2cb32deb-4266-416a-8db7-1b3b46b52162@oss.qualcomm.com>
 <843419F943CDE487+c183d00a-3967-4ba7-b6fe-fc50749701b9@radxa.com>
 <b461c125-947b-4e06-b502-abb354e0cba6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b461c125-947b-4e06-b502-abb354e0cba6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HeYkiCE8 c=1 sm=1 tr=0 ts=6a5df34e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=0Miry4rRAAAA:8 a=NEAV23lmAAAA:8 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8
 a=Pi0YOo2IrXSleUiyJT8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=UT1Yo3WijKgCWNxi40OF:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: 7bWcdXqtuWF59x_KGCe7Lw1Ke8jqRed7
X-Proofpoint-ORIG-GUID: 7bWcdXqtuWF59x_KGCe7Lw1Ke8jqRed7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDExMyBTYWx0ZWRfX9Xecjl8yTklm
 u5k371SbgaXwwEtsvbVMIGZh9qiVX0mPFKxpXZwiuWcvupLN+QqWyl3NDddEGiWcuv5TgaNheeG
 Afk1npC5hPJDX8+N2eImaA3MWIlvtZ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDExMyBTYWx0ZWRfX/WFFbfqaUJ4Q
 fT6NS0IZNuN4YfvF1hteH9FXKHI+R7BpWMT36reg3MvYoncSnjzZj7YqXeiq+NcaQgtS+L6bXeB
 JJWc2fYatNHYiOk6CVk0eJVy/T705PNZi/nZ2fnOk3rg/BGHF9MfE9dsNEX13TXt6QT/tN+fUJm
 7F1+liUoOX004889VGQyDFw/Q1ZsBd578qbOUSxdRJ7mU1AOlg4cTkVoIL1anHaHDvpxtvFVaCF
 +3O30zcdlQuD8Uh4gyja8AfkHYVkcwFGbKTUoV40s+5WaaDQRZ6HA7GP3VQs1l36wDjQXItPlkJ
 rxLV6m85COc+Y4Tn7OxANxjgRD41azOR2CjYs1Gyc4OLPgnkLKuPAotzjOcKCm6Ju+0V8jvi0Hm
 hfFCM6wq98I+qF6SW5eOhP8YUsNWtKlDqJR/Dn+9Zv55u1TzTvpDmWBSLVeElzcheSDJrZiyj5Y
 4VUHFSnFDpgG2t6qw3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200113

On 7/1/26 6:12 PM, Konrad Dybcio wrote:
> On 7/1/26 6:04 PM, Xilin Wu wrote:
>> On 7/1/2026 11:10 PM, Konrad Dybcio wrote:
>>> On 5/7/26 4:29 PM, Xilin Wu wrote:
>>>> Flatten usb controller nodes and update to using latest bindings
>>>> and flattened driver approach.
>>>>
>>>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>>>> ---
>>>
>>> I tested this on a CRD and an x13s, both work fine across suspend.
>>>
>>> Turned out in my local experiments I made a typo in the name of the
>>> interrupt that was carried over to the big node..
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # X13s, CRD8280
>>>
>>> Konrad
>>>
>>
>> Unfortunately as I mentioned on IRC [1], this actually causes random NoC timeout on reboot, which seems to be related to pcie.
>>
>> [1] https://oftc.catirclogs.org/linux-msm/2026-06-11#35405057;
> 
> Ah, you mentioned this:
> 
> https://gist.github.com/strongtz/50bbd71a9f41d0d1aa9849b8cf1dce21
> 
> This is an attempt to read CONFIG_SPACE+0x0.. I don't really know..

Could you try adding something like this

diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index b123da16b63b..5e08cb239e78 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -43,6 +43,7 @@ int noinline pci_bus_read_config_##size \
        if (PCI_##size##_BAD)                                           \
                return PCIBIOS_BAD_REGISTER_NUMBER;                     \
                                                                        \
+       dev_err(&bus->dev, "Reading configspace+0x%x as %s\n", pos, #size); \
        pci_lock_config(flags);                                         \
        res = bus->ops->read(bus, devfn, pos, len, &data);              \
        if (res)                                                        

(perhaps with a WARN_ON(1) to get a stack trace and only print for the
crashing reg)?

FWIW I can't repro on a CRD8280

Konrad
