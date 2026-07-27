Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F0B38A71F
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 04:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785126979; cv=none; b=oGQimeru/m57avHNeyBEjQz2iWf/cQTfCFq601t4fhEAgZ1U76KROvwJu4rJgLZORcakI1yc6ELjrmib9as2O0YdA2vbYyKeaFRPw56ELas5mmeZ084u/LEtBnVoFN8XZPxsDdU+SnHXD9bcqBCwO7Gct4avEMzsPDRmDqjJq+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785126979; c=relaxed/simple;
	bh=OpkEkk3jbVeV5MrTx6FPVxE8QuZYIguCkCIzBD2ATT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bqjt/qMgvmjenFNr8hMeqErIIuOj1u7f+9/4E6UlS7JI090HtYNs9F0OnpUbkAaGnJsfwYHptOTFvciU8ptxeR41aptifJTdFNbzq+vRPiFhfgTaxFR7U3euBBT5tpbsux/WHL+wZw5xJeCHqY2PuFHyq4k+9i41U81x/gWKcyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GkegrthB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R7GjmMDW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GkegrthB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R7GjmMDW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1gNil1769331
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 04:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qr4qG+4xCNN2gbsB6WsO04DOPM2VsmsoKamq6H18COg=; b=GkegrthBEXnqZPv9
	+d93sblE2AmJmXmb+V/Fy1DUtSOQbS04+qzWjpDEHCnPJbQMlbZJrB95nXOTVfeC
	xANstxzsuyODkxywA/5+P/bNgm+BX02l9sDL6/DOAJNUqvDCtfEPcQK90CF2t9gH
	Zevf78qdzNzXdbt/ibxlyJQqEBUsiclemjE0gfMus5tNzcAaa0lIP49O7+kLpVQP
	80hGJC7cPHVEZClbCVR1N58X56Gdg0VLsl+yCSd4so/HrWI4Iq6Eir/2LHiI5C7o
	lnZqkUi7xpk5NamPEA6vtavRgQLrpy1cT6I+0SaLezuVsOKJlm6qpeOLhVQvWkVj
	fe/JOw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajm8qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 04:36:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf6acd760cso27677955ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 21:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785126977; x=1785731777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qr4qG+4xCNN2gbsB6WsO04DOPM2VsmsoKamq6H18COg=;
        b=R7GjmMDWoyDrOIuwTPzk4FZPeC7X9DmckL7JDYE/htea0RILFHN2R8vP/6TC/zki/+
         mO9LVRv1D01Hi/LOEaPYGOjcxB1S3z6LbhHRhuCQNsStkXzoUZ2mDHw1BupdxLpYA5Pa
         1nCdfHaI7jfGkr2VBt1pvlZDvB1kcTxqXCHyHux6rlR/lkkQJjE/p94NjUE23hvx1R7Z
         7/4Xs5RDSKJnUn00JUPohHxn27T5KtjbWycoUzlUrOFPTvK88j7UbhNXWyGH2mT0v2is
         C0bCXZDVmEYZXl2yHB/zFrV+qQdFJtOuvlK2TWfV8sJL4+85skbViqAf9hsyvX5gK8a0
         mpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785126977; x=1785731777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qr4qG+4xCNN2gbsB6WsO04DOPM2VsmsoKamq6H18COg=;
        b=sdpr2tNu5Cxgf6oVtxkGLK7FMkMmOA8HHwkL4DAR6kkesZlYZUkgAb6UWwZXG18Jfz
         GlCtMBONF1Iu/8GdFSqz4DRiCnPtrxqF0tvSBlntHAoBFxK1ippF09nRG1cMuMrbPHGi
         ecuOvLbhXM09o3h64ZyWyUkX755HDdd/kMBENL+XkO3u6+mDjb2bHSeqYyPFWr2bZSzb
         mdy8Uwpg77v0IBxFT3HyWBFMV8R0RaGO9Z3q7URx982E/rsJpXz+mS8HylhU02/2aixu
         fqCVNoIj+o7pBh9n48BDnkqfUqMgqbLGeq0sQUgYoBGGoiaMPVvrxH+SzBN4JN4fQhpT
         LOQg==
X-Gm-Message-State: AOJu0YyoFC20FGZHn5l6b41c2t/5xaDgSNKK3J4m6ORsHLRcx3D6h9u7
	JDTvxNJV2Q4+CI7gtE4ntxnMyFkNVWvxfaw5Hmuq2VkT68edhqXDQoRDxhoXCGTC8q3JyyOIJpC
	nCdrGn/AJ3NcK0mf1Qj6/NROSlcS74lV0tYfuuRfOKBg4LNf1ZpSSCf91hGX0l60574k6
X-Gm-Gg: AR+sD123ghc6dUWm2sxquSWnkb9nZNAsLzX61vPLEe8h/4zLlD02ciycavSLvRD51SK
	W6+qw2KQxiunfnLeY6vWCN/hYhXf9opZkexJ/Mkm7vgquvEc/6pG6parejpfNJt9nOJGpgTZLsL
	O55MbQuUeDUHahXOFHyXdXlPDT9hCR76qvzaC0v8og6vT40qGdIGmkyePJ2FcAXGEU23xoyD6BX
	ojEhltdDp0X3E8/IKcX1cwMbxY4mHXNObWq3MYbnIt34IESsKVLAt4ekch1jM78cvJMbphEhkh4
	Z1/tvo1rBksbuDLcYNQNV7mZdVc/oNFtCyBzF7UmFYMNngpJBkJsya8XTt8ERhKF3uPTnOLLSNZ
	ft0uYFn4L1Fdyxah6xOSts+fgIyJAtCRJ2A==
X-Received: by 2002:a17:902:e809:b0:2c9:9dc9:e423 with SMTP id d9443c01a7336-2cfde84e377mr72868795ad.25.1785126976474;
        Sun, 26 Jul 2026 21:36:16 -0700 (PDT)
X-Received: by 2002:a17:902:e809:b0:2c9:9dc9:e423 with SMTP id d9443c01a7336-2cfde84e377mr72868295ad.25.1785126975991;
        Sun, 26 Jul 2026 21:36:15 -0700 (PDT)
Received: from [10.217.219.96] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc549cacsm27102186eec.16.2026.07.26.21.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 21:36:14 -0700 (PDT)
Message-ID: <0581856f-bcc6-4a2f-b13a-db9fe356c3c4@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:06:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: i2c: Add Qualcomm I2C slave
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
 <20260628-i2c-qcom-slave-v1-1-8b0a5c01f9f6@oss.qualcomm.com>
 <2a21f549-294e-43b4-aed6-b779d84cfd4b@kernel.org>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <2a21f549-294e-43b4-aed6-b779d84cfd4b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lfPB8ld3tQAd8u5BsU8zfTVC09r2ypIp
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a66e041 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=BpNlaLRTw972n_5ZLSgA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: lfPB8ld3tQAd8u5BsU8zfTVC09r2ypIp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0MSBTYWx0ZWRfX6bnpmVNuiYaP
 sSMQ2zDfjOfp3s/MdxWm/6DwqGqHK/iN75sLMt4R5O81KXrew2eswvjbhlvqyXgAsqsHMIszaMw
 4hRoSpMGS0GmFgWF5+KGkqYfDL+y8hCputUlQa17wBoAxd4hdwvSfNNOC1vFCAS0aZxuo8OXsJc
 H6etX24CZnQkrIJY5YjNzGXk8rhE40j5hcvipiSHby7+nsxN5KAZtI7ekM0NqBQp2s8UrOho3av
 4i66ypmOzEfKKgUJh/pY4Rql/kJNaIlEv3yhVpeUpWHVodqspb+j/m1ujWMqxV7gQpS/VNlaTqt
 f+0Zf5LIPR/0XjfWa4XX1zhdGRaqn7FnucvsPPV1X4LSpEPMxjBj4RmTCZNJeURLYIy63H/nKF3
 zMDH0+6XTIjSwEAdfy0RtzrlDOd1CfqHBvnPbKhmYtUbdR3lgCoOlzh6G3XA4lzzBBhsF5b3MbK
 nsmljtEG5tt5sr2zbbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0MSBTYWx0ZWRfXy/EDxV5o23Bv
 iS9QSKZbwKeOH4RicrmUsI+cBN/oAieAeWfIT2xiSOMD7ZqxTaTV8QEDQ+8OmJbGe+y/BMdsRA5
 gJIoCcqCDMfTQ+zASCg8fHi0L37wigk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270041



On 6/29/2026 12:02 PM, Krzysztof Kozlowski wrote:
> On 28/06/2026 16:39, Viken Dadhaniya wrote:
>> +description:
>> +  The Qualcomm I2C slave controller is a dedicated hardware IP found on
>> +  Qualcomm SoCs that operates exclusively as an I2C slave device on the bus.
>> +  It supports FIFO (PIO) mode for data transfer and does not function as an
>> +  I2C master.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,i2c-slave
> 
> Such compatible makes little sense in upstream. Please look at other
> bindings how to properly create a compatible. This has to be device
> specific.
> 

Sure, will update with an SoC-specific compatible string
(e.g., qcom,qdu1000-i2c-target) in the next revision.

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: XO clock for I2C slave
>> +      - description: AHB clock for I2C slave
>> +
>> +  clock-names:
>> +    items:
>> +      - const: sm_bus_xo_clk
>> +      - const: sm_bus_ahb_clk
> 
> Look at other bindings.
> 

Sure, updated the clock names to xo and ahb in the next revision.

>> +
>> +  qcom,slave-addr:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      The 7-bit I2C slave address programmed into the controller's device
>> +      address register. This controller operates exclusively as an I2C slave
>> +      and has no child nodes, so the standard 'reg' property cannot be used
>> +      to convey the I2C address (it is already used for the MMIO register
>> +      range). The address is configurable at runtime via a hardware register.
>> +    minimum: 0x08
>> +    maximum: 0x77
>> +
>> +  interconnects:
>> +    maxItems: 1
>> +
>> +  interconnect-names:
>> +    const: i2c-slave-config
> 
> i2c
> 

Sure, will update to i2c in the next revision.

>> +
>> +  pinctrl-0: true
>> +  pinctrl-1: true
>> +
>> +  pinctrl-names:
>> +    minItems: 1
>> +    items:
>> +      - const: default
>> +      - const: sleep
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - qcom,slave-addr
>> +  - interconnects
>> +  - interconnect-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/qcom,qdu1000-gcc.h>
>> +    #include <dt-bindings/interconnect/qcom,qdu1000-rpmh.h>
>> +
>> +    i2c-slave@88ca000 {
> 
> You need to fix your terminology everywhere...
> 

Will update in the next revision.

> 
> Best regards,
> Krzysztof

