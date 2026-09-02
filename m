Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9EC42DA3D
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 12:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353109; cv=none; b=f8vnDFzyPGgA1BzG71fdbVsGFFmvCZ3s/TfmtXY6XqzT2Jd+ju1xDSuKGFrM3CcgYoT1m6fkG6zHCJNpaSj3UKS73z9XB5U81yjPI3jihIUyV0Q646F9VN7UHaKhCtoBh5y0Wz0EODe2LgmW/aZIC9OiRxXKQrkhXPgcgaRhxIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353109; c=relaxed/simple;
	bh=S371zcMUWzIHOFWi/1yKjlfgsvLnkrHmWNy6VFMSzbQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Wv52kcJhKpJWPTaNiXvhQ8xBoyD6WoegzwXaB7qnu7DR0uDlrptpSqDdA7pDyD3CtVG8TnLoi9c7RKQNKhkYcoo0EbO9i6KybjE42e3SFiJnd+vlmxqXoKMT3IuzAroYxfo0nLzQwCYjtdGp3oyU4swSVa39k8BYZpAZnf6E9wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFrVYlbs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MEk5z+sX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eFrVYlbs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MEk5z+sX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CR7CD2252121
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 12:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WVgNOrBJ13icUw/RU5bG9u51U+93bZ1CQveedgfARFk=; b=eFrVYlbsye+dG0bj
	xuXhj4a2MwWtYcr6GMzTvHab30Ae+xutvRqWYx9PN97agXPLM3r8hszQIJxahEwr
	kM5mQ94wfFSncVSTrgWVz1PuGwOqc4D7L/9jgRp4hiTFRXUfnSO5+J+ME1mC5b7U
	Wa6cS937XstGt2eK57+R+xzHhYEKHVdnf/z+S17LUBzPm6iGntpDyrHKvInBtJS6
	OXiw9qOeMeW4+HjEksZ9O512J49MEBK589wJIwCjvJhm5KUJeIh+b3+pKPkHqhs7
	fap6hjmM9KgpvCqfN27hxGih/uBmXorif9X0HncufDqvhkYkNo00qbUXqfHYrEEO
	xVcEtg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gebsx214x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 12:45:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e1da97175so1384023b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 05:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788353106; x=1788957906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WVgNOrBJ13icUw/RU5bG9u51U+93bZ1CQveedgfARFk=;
        b=MEk5z+sXwdjQXLM/2u7f2PCXwvKOySv2vR30KFAX2U+i/3Y1TfD0I032hMZkB8qNKt
         a0ox8h5cafV+YXFv9Hh7831+kiTpZMUB89+0MHRy5HYLMANiEzsSzRINitD5fD84Omxl
         UhsZgScNnAwiYvQSzY29FVXxxO2PbxC9uwEXhVJ1FGtjDaRMoGgy01ZjxtPsHpbXoSsG
         BJIwYpRfKC/UC5keIwBDFbJqnWUOf2zC3mcYWaX3vqbVRzRWG870yiKK1/5zfoIUUMQ+
         uzJB+PRvZXm9ckMT0UYNy/7N1jNCf7Vxgv8k7KefCImgsmo4NhK3ih1ZgtOShlzhMBvF
         dWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353106; x=1788957906;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVgNOrBJ13icUw/RU5bG9u51U+93bZ1CQveedgfARFk=;
        b=M3ERxWmswGth+HNiCDOxAnKcjyFUeGn9+dt1v4aitq5G14gRYhRCmayNgWAOCPQlHF
         mBvMdilZOblXPoL9mnp9VyswrV26FxdysvOzpki4gE8dgSR961PSrUIXkWLl28fssKph
         rg3SFbga+fTIqOIpXKK2DAh8qphyykWVSoFWK87X9nHW7VVDZnC8RRSosC8gLuzICd/q
         CnSpCs1Q1wCIufkw0HbgBNJevbDOdUtTe4ZzmNtRqKs0DsNNnteiKhrtmtnEXX6u1KcE
         bCPFqp3vmBNlZeq8yGwbIp3HhzmLinLNbs+rAba21LD3t+vjMesnq6cOVFInqjkLe1Nt
         kORA==
X-Forwarded-Encrypted: i=1; AKwUvByDXUk8SYarQ4po4SKtPKj+GuAzRJ3SjboytnzZ8Rr23yPxg4JFxfm3AHr0C7n4n0vbWTmvpq76Ex9YO5NU@vger.kernel.org
X-Gm-Message-State: AFuF++m/P8luFCeT3L/gk61WwlJKhLNlwpdJcY+M9PQtumn0B/Hk4++8
	cN+j3PHSJLk1HfR9AcKIerNcDWnYT/2m0IcbC3lF1XdfFOMtEdNUdHoO5FwECNH7FGyM7gd7MuJ
	57Ck40iObYMqjszPoARrcM19hA1sevCFtleoFTiggm0rm0ajHTStL8cHzLH8L2s+te+U=
X-Gm-Gg: AYBFou0/fXly6zPJ+w+5zBGeB+eRjrPLuQ1e4lkeE8maH9R61dc9VGuM5K/ORXU1+q8
	7rgxgVtVHjspK7rzNAK1JtbCKf2KiJWamhOljiumSoqFbdvNf54H+sAEtWrXGnYoL96hPjOgYSp
	9b+9tnT0hc2BabWNiJpgX5aA4lyZdEwNnkORY2NGoglAn1dBzKB9qMXRmJqJD6oOpydY+9d+mpr
	YKoBfAxNJdys182hUPDOyR73crCPtdnTXMJuTYjnjR4fxJjGSjv2Z6kmJmPdqSRIyDGKtWGDVem
	Oahpvv17LJI4GNPk2pahUISIhBv3H60m7smko/hfi2Tmi9OorUYPpefQdClI7o+vkshrNzu/LAB
	Kux5j36QIShrFqEfhcdD8rzIWU3lZKx8=
X-Received: by 2002:a05:6a00:420c:b0:84f:a170:4f5b with SMTP id d2e1a72fcca58-85ed6790ddfmr7638214b3a.8.1788353105876;
        Wed, 02 Sep 2026 05:45:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:420c:b0:84f:a170:4f5b with SMTP id d2e1a72fcca58-85ed6790ddfmr7638098b3a.8.1788353105212;
        Wed, 02 Sep 2026 05:45:05 -0700 (PDT)
Received: from [10.218.33.235] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003a82bsm1286626b3a.33.2026.09.02.05.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:45:04 -0700 (PDT)
Message-ID: <fe6787aa-e15f-4bdf-9004-99eefbf9cc50@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:14:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: power: reset: add PSCRR NVMEM
 recorder binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        =?UTF-8?Q?S=C3=B8ren_Andersen?=
 <san@skov.dk>,
        Guenter Roeck <groeck@chromium.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
References: <20260819-pscrr-provider-v2-0-9072383e0f4d@oss.qualcomm.com>
 <20260819-pscrr-provider-v2-1-9072383e0f4d@oss.qualcomm.com>
 <20260827-spiffy-effective-hare-c05f53@quoll>
Content-Language: en-US
In-Reply-To: <20260827-spiffy-effective-hare-c05f53@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -dBn0zuh4j32_QU0eNPc2hh1Fp3mX-Ek
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDExMyBTYWx0ZWRfX8/i1Gf7IJ+wE
 tAxWeasYgm8eQdHf5X1c2OknZsQpNhwRWz6S5vs0JM24vg2wLCML5lOW+5brJnSuFe3vAUhBfEk
 /lBR2QqnpYxPuGLYuWXbE71opN9sC3cEJM2OZzwU12uI0bgWattBv1qW9GjrUEczqsb/k16aETu
 9lfgxKFuaPXEx3oSjzVHeECOSNIMKdYQk7ygWwU4uwYH/V0eOVtowEBoGijLQHJXHHpsvG0Ft1P
 h1UpmuOA3HOFzdLjYPuOs9optEn4Dsd7EDV/+m3ktzEOWsYyI1QTvtWvLwtBgbkYTLrsnZxupOt
 wehTWnb7d7eAtWNI5QL3+lDVABbrmz1DloPP4Nn7PN5e8SqDr1SlGksd/WeRlvSnXBfLH7NTmec
 d3kt8PKrEEfu7El+M1GJ5kDjAQO+7R8uxvJ+U8zhWb7kTMqUgn2B6tR0FG2v7qz/UGvXIylKPcL
 6+qCvgpKHa7DJT9695A==
X-Proofpoint-GUID: -dBn0zuh4j32_QU0eNPc2hh1Fp3mX-Ek
X-Authority-Analysis: v=2.4 cv=AufeGu9P c=1 sm=1 tr=0 ts=6a981a52 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=pgIzJ0-J4Cnj9ACx_iUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDExMyBTYWx0ZWRfX0dLIMp58V4yG
 omZ0E7tUiqARDx3b2zkSmLT+XF7EppObhSy4FNK3gGqH7IOj81pR7ACxXaWCyE23SGMvqNZ5kdO
 cxz/m6t66ZkQCFpmMfopsA+al5nP+Zk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020113


Hi Krzysztof,

On 27-Aug-26 3:15 PM, Krzysztof Kozlowski wrote:
> On Wed, Aug 19, 2026 at 10:50:43PM +0530, Faruque Ansari wrote:
>> Add binding for the PSCRR NVMEM recorder. Records the power state
>> change reason into a small NVMEM cell, such as a PMIC SDAM byte or
>> RTC scratch register — so the cause survives a power cycle and can be
>> read back on the next boot.
> 
> A nit, subject: drop second/last, redundant "binding". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 
Thanks for the review.
I'll fix this in V3.

>> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> ---
>>   .../bindings/power/reset/pscrr-nvmem.yaml          | 59 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  1 +
>>   2 files changed, 60 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/reset/pscrr-nvmem.yaml b/Documentation/devicetree/bindings/power/reset/pscrr-nvmem.yaml
>> new file mode 100644
>> index 000000000000..5334c923d644
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/reset/pscrr-nvmem.yaml
>> @@ -0,0 +1,59 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/power/reset/pscrr-nvmem.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NVMEM Power State Change Reason recorder
>> +
>> +maintainers:
>> +  - Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> +  - Oleksij Rempel <o.rempel@pengutronix.de>
>> +
>> +description:
>> +  An NVMEM-backed recorder for Power State Change Reasons (PSCRR). Persists
>> +  the reboot or shutdown cause into a small NVMEM cell, such as an RTC
>> +  scratch register, a PMIC SDAM (Scratch Data Access Memory) byte, or an
>> +  EEPROM — so the reason survives a power cycle and can be read back on the
>> +  next boot. The cell is referenced via the standard nvmem-cells consumer
>> +  binding.
> 
> I do not see how this should be a separate device. This should be rather part
> of PSCRR, reboot handler or just the nvmem. Otherwise it is just device
> node for instantiating driver.

There's already precedent in-tree for exactly this shape of 
binding: 
Documentation/devicetree/bindings/power/reset/nvmem-reboot-mode.yaml 
defines a standalone "nvmem-reboot-mode" compatible whose sole 
purpose is to bind an nvmem-cell and instantiate a driver that 
writes a reboot-mode value into it before reset, for the 
bootloader to read.

pscrr-nvmem follows the same pattern: instead of a reboot-mode 
value for the bootloader, it records the PSCRR reason into an 
NVMEM cell before reset and reads it back on the next boot for 
PSCRR to report. Like nvmem-reboot-mode, it works with any NVMEM 
backend (RTC scratch register, PMIC SDAM, EEPROM, etc.).

It doesn't fit cleanly into PSCRR core (hardware-agnostic, no 
NVMEM dependency today) or a specific reset handler (it only 
records the reason, it doesn't initiate the reset).


Thanks,
Faruque Ansari
