Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD264DB540
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647207; cv=none; b=QhepUTpKWgiUvaBi+gTGKdBganGulmep+53uZpp+oahyk0YoK2yKJhIjAQNWBfgw7AxvMdlRngTVffvJ7LfaafCKsVS1buJZ7PQMLGjOdClWFJ8WQbdiB62UMKDiHrDbcFKLGHIzv2Lwl8keqv3X73ZAXVs3TTeW1NKSrr1ZEOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647207; c=relaxed/simple;
	bh=wL7KM+X1ub6h4dq5bSQLMuQ01DJZ1T8pdavX2+xQTSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VBca284J9RwjG7woftBuobhzlrcIci40GgFmuu/Ib8N5JhjR9STxjbkENswo//PsN3qs7GuKyRH3OJBFeUiQXw+svZthQIp12RRXDNkeyef+Y9jxKhVZ/raudgx385zJ40TpdNIEUixvLL08IKXYHIjfehI/gZg0LfKFZyDC1Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OMh9LHw+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BmchI+te; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OMh9LHw+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BmchI+te"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDgBaf1971533
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxTRfeCtn93ROmdfO6Zm3Tc2ULuGkOPFJBqUEa0gK10=; b=OMh9LHw+h/qQi7oC
	MjFcTtxxued3Cbf8kGzhiH46jp6jU5F7rV1egBer1EedQI4z5FLDdkGdBIIt4Uza
	kuvkvQFWg1cEp+3Y0GP74w4n4aI2LgXux0TJiOmq9+w6Mj0qWhpCcm9IHtL/maLW
	Op3gItYoOYRteSVn1RpbvuLJONTzkLYe0WKk0U4Bf9R9WS9is5cTeAMzRiSz3aZS
	e5SZMXN27pAKM+dsvqXuz04tw4RmRtJDaz3L3pqLewLaKQmgdYf8ai0SQ9Qor3X/
	QKQdbu4GrYmu5chjaAo9Mep76OXzPNhk04ZIwWyDKLXvFp/9qSi73qE6ucR4Tcvl
	HD0gZw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6861jts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:20:04 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bfc23053f6so465825e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784647204; x=1785252004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxTRfeCtn93ROmdfO6Zm3Tc2ULuGkOPFJBqUEa0gK10=;
        b=BmchI+teLOiqx5erobaJNNlUXPbixnYS8hJzqLJoEMOL6RzMgL/Vp3LQKnC27YLoxy
         6RrmWtqF004ZxQaG3StaQGZ35KX/J4TPyHaik95PxvL4XNwrIVX3l0ZGq6fWu4fl23ij
         D3ax8PjSSdlo9OgGUaYzxrBjizQoEywSPlktjhZ5OtxbdtdDcmiTbpxNrW7FS35AK1ji
         W/azUgC5Kw5r10PJsxQ/RXmlv75zYjWHB8/MAJ66TQ+E67nqUHqPXvf+ATsQUx5lWrt5
         KXzcKSyj7dfqB/YZhcB7X6s7H9MyzITCe3R6FDqlp2IBW/DMqoEEQ4IFGN/z5T71Gy02
         cSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647204; x=1785252004;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fxTRfeCtn93ROmdfO6Zm3Tc2ULuGkOPFJBqUEa0gK10=;
        b=A0HErbnZLArPA7ONcH9IMUqQJ+EuST4fjOV3Y44BWP45IrjC22nTaKK0dijHwTbE68
         cR8aSwbXBFbOR33wrCZ3h1JkMdvYgD1k3NzI0vd6fCen2EUwjjkHQ7CdKPpQV2k3YAfL
         mv47MyZdwMvMr58IwqmpwuJrzepFItZAbVpcCo9YXllhubvzxgIA8GjeYQXKOsYjaHfJ
         hQUtn7W1xAAq0D4CyX/nS+Kkpbnvc0ShdK39GwU2O/L5Dxf1UkwIh1/0Y93GVMEkuRLG
         kNjFV3VN2E8CdE3+uV/CVb/QzKj7NieosZ43H1JRi3tSRppGxceyCCQFXQBXifXJHprI
         /tYg==
X-Gm-Message-State: AOJu0Yz9v4KkwagjmgzO8h4FjTIGyHdhIDll8xBIpBRPz1ejpj3V9qk3
	9r9t8rW3TMuRQjDJN0JnWld19dhDReVEvCo+b9pbWQDCroowxtcmasCbchPvpX/bvjyfJGXjp8O
	oICZZ6V5fC77qX4BG2Nl1/8911gh1/Vse6idW8aFaMV8UY3Ad3i6J6fQ+SfBZm5UTBaWOw86bcn
	14
X-Gm-Gg: AR+sD13VUPtXACp0fgf6DTIVGRpTKK1WJ2MJSQdHYTqzFQ36oMSWQ7aWemqnJzae7iY
	7w7mCALPCqxKyRn+4TmB0ceVpv4HCFMFQb+84XBcAGjKa60AqwhpuL5IYVscXLHi4c7wB6FMQDo
	M9pSmzR1xx3iIIqunR3H4e7/b+fRXmteM2bfP+qaV+r1R72EwPEpVG4Ah0F5m2cWJ77t5Bn9u9F
	jnWf5TlyxeDuIj4DoPU+LoT4VOfsZCcH4+Kwe1GdkIcMeBRxWC4DRBG79ZeGklZho8C52vSqDnU
	kj/VkX7Cme+X+xQw4MN+92+YPVTzjCTEyKVxuo6Z3O8oCkRdAltz7Ax/lbWUxXbIlD+DwsHiSLQ
	4bPgebSWRXwKJiyKPstZCw3Us
X-Received: by 2002:a05:6102:370a:b0:738:1ef6:51b6 with SMTP id ada2fe7eead31-74abc8c51e8mr572136137.5.1784647204060;
        Tue, 21 Jul 2026 08:20:04 -0700 (PDT)
X-Received: by 2002:a05:6102:370a:b0:738:1ef6:51b6 with SMTP id ada2fe7eead31-74abc8c51e8mr572091137.5.1784647200779;
        Tue, 21 Jul 2026 08:20:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c170591172esm616060266b.15.2026.07.21.08.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:19:59 -0700 (PDT)
Message-ID: <687006de-f11b-4360-b3e9-cfccc92362be@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:19:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] interconnect: qcom: Add missing depends to Hawi,
 Maili, Nord and Shikra
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
 <20260720-interconnect-qcom-clean-arm64-v3-2-942e8ee7ebda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260720-interconnect-qcom-clean-arm64-v3-2-942e8ee7ebda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MiBTYWx0ZWRfXwoX9h04VfPYC
 ZBw7VthPFRtoUxYrjoCjacz6+F3mFK1iJBozBdXE4kpeIr9WtL7hWWXZW/k4Yju6ZR/a+3R0sYU
 3g0mQtdVR+LcdDNWOu9q+LOkFilR9Lc=
X-Proofpoint-ORIG-GUID: FxOM9_3gSFxMteyCARiAD-yd80sN-gi8
X-Proofpoint-GUID: FxOM9_3gSFxMteyCARiAD-yd80sN-gi8
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5f8e24 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0ZrtzkP0fX5WlaHCARUA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MiBTYWx0ZWRfX3gIYhlEc1KB9
 qwwh9/tFzYKRltP4LYKRJFX5ObFQIyL/jEs6JP31pfmTdJDYN20xtCTALHI3lPftZ8UPioOkfUs
 Y7d8rF/G+0CnAq4fbkQBfC3SoSdjIeWDZq+BCp5YZlT4XyG64K8U0ESjU/1GWkDQg/fx5Xsq2ti
 7Y9+rEO/heftMRE2Ux+O1W0FQDMrRZXz/yHnofaxyJ3Jf1tqVHJrolPh67Q35DY+P3OVZmdnkjb
 lEVvB2PREDECdK03vqdmDazqbVKwXJk9EbyCvWCv8NRVm7olEUxPUs11f/L6YBQ1dadvFl9uaJ5
 VrIdBLpR6ZGZflaoHnb2/IgkXN4TBGKPOIYmIaYQXFS+UTLBY4FUvM5KwVDsMhFKH3FclohN4xI
 qQzI8+xNKvJELtuK+L4/TuQIaWTc++pXjEZpisj53n1JtOAGazSPYGnB9Oe2o3K0tAKTaW52uXn
 c9L9ESfUlzkmh+8VdTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210162

On 7/20/26 9:03 PM, Krzysztof Kozlowski wrote:
> Hawi, Maili, Nord and Shikra were added in parallel or after
> commit 5b696f065843 ("interconnect: qcom: Restrict drivers per
> ARM/ARM64"), thus they missed the update restricting them per
> architecture (with the same rationale).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
