Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B92488DAF
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 18:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040610; cv=none; b=hi/6tWo6R1k/V/AtoOoZsv4kAiSyQ/x4HRcuNb0Xx3o75/pLcU0Y4tdVkoNwhXavxgCl9QNMDYuFTcxKgrzpJRFRo4fR9J1DA4zou+JbDCCdKfyG3WHp7VUSqlfDEK9/ceYqZZTedUYoTorhdfBV3n0ODB1qTXIWWnGOs5wh63o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040610; c=relaxed/simple;
	bh=b/Sr1hbeibbvfZDxkSEa3bvTdm/2wnt7RBMqE4Qxw0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I3Uzi2niVQeJCLge7NZSm98OjG0BsG25Fp0JfB+V5PSXNCMslaUaiyEj6AyXLmjXNl2MgonVO7+8wVDgbIgmyPah7HV0s7c5+vLfSeB8gubG9Zla+pc0+ScQ9RpbiEaKos5aGtiM/szGkJPeJ5mqmSqAOExHdS9h2pXtie8QlLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDBkwkiL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GK/hhE18; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDBkwkiL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GK/hhE18"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676IHxIT2402899
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 18:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PVxFjJI2FGL2wgYbVDpiXGdE/1kLH289ltHpjPDSqJc=; b=WDBkwkiLnKHKNJaf
	YOIyAHjtUnGyaxGTXJbXfpQy5ZniKzR70WqY8EddlAAYnzobHvMyIzXu+OMUsX9w
	L2Xap9vKAaeqLslinur+nLP7O9fJW1Qrx6j1JD1bURF/EEesLdQojRgGj+09HDyT
	0lwpdWk/kkoDYblu6z1QMGL6j6N5bfnn9e69FqUNROfAeCxdkGzbKgJN695Fbnf5
	4Nb1U3AKDSC28sQo6jC+EIkgrN3FMrZT12s3wG9OM+u/u4Wbx6EreFqpmNPVeDuZ
	N+cl89PilL/gZ0O/+eJO9U5fOGse6nSgUCHpeBjIF35Pc0aEUlRwXXQQt/Q7zqKJ
	YDBdNw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jg35s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 18:23:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84859a64079so4347493b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 11:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786040608; x=1786645408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVxFjJI2FGL2wgYbVDpiXGdE/1kLH289ltHpjPDSqJc=;
        b=GK/hhE18aC45eqL6LSKfA7zHjQ3fm0sMP2HPzjv/Sn7k7d1zQxr7q/cJw9n+kL0lSY
         AHpen7S88tbr2Voe6VJDSofsHMeVHugb1lb68tlYhuSxHsV67GsOrCw2TO63Dj6b3aeO
         C+Zf25aM4pr68SrBMi5aovbMJGe6LxxzjsmyOqaY6h54fond/bBqQZD8Ljl6HlxOsWdI
         g6wdGCksD7LLyga3qOxOWvsO4Z0iCpE2B1no6omJP4ORaLloyDmywWM9sKfQNCZIl5/P
         468QH5+dJD4rQopo8awJ4c/bRUerz/cQxltm6gUR9FLDr+teIsL2s/bBOW6rlkIjHyoI
         sgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040608; x=1786645408;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVxFjJI2FGL2wgYbVDpiXGdE/1kLH289ltHpjPDSqJc=;
        b=pGKF30NT3ezPtHRA0fToW+nPMYLVI9joxPJMbCOrwYEo0XnZFkcsfyb6Wbog+srwkH
         EXmRs49pJIsLSA0NeNZmUmUDueuYeANBUuZw1Bw6NhX0MoKothDSdvyxbh8mBItEWYDc
         +6qEWKNage8MB4Cz24QmOf/DOPCvFviSJha/Yi37ah7uxWnPCix+IFHiy9wqyep+jFNp
         /ME0pQ+Emk3q+AsoozdokZ5Lf7NSdbr3LF/OOiCpDZLYRNoVDpSPHawwg5iZHpxl/1iZ
         aXUcG+NClDOTtgxEU8H5tVCIQg96tbTtFS0Sdjk+E2A3lkkr3patHvbYHq9XODA/Z89B
         Nddw==
X-Forwarded-Encrypted: i=1; AHgh+RqB+b011LV3B48fA4XKlUg1UdLzhVRRjbGRYTKpKk4qIxN3yFSPSoIRYbFSA/YHPZWpr/h9qEZiAPD1dDXo@vger.kernel.org
X-Gm-Message-State: AOJu0YxxxWpp/FFlSe/BgXfsC/jfuRLnwx80ZNXJaVjPrjdOajgDV1Ov
	KYY7N43toIKYeHK6KTXmsU/6SeGVn061RRo0vZL/8fcnBTdvL/eOOucs5ib8s4FbjGdkRSdXvFv
	dAH+KkB6HRoNfxPsL9FIAzpSy3Rn88LsCDG1iLrX0nP6LNI4o95t5Uzb638C0AXShOP5D
X-Gm-Gg: AR+sD12rmReiD4D/MTlx+kWjBZY+tYMDveWSHXBqUrd/OQcdYA37hqpwOmHj3LC8Lpd
	IeJQUU51+9681iEk7LvzGq/kAZRgGEabvzvBedrxKnKfX8kZdR+/4HlpSM9Z+B76pw+gLjXilW3
	DmNpjeLNz27LosA57R4hZfT7FBsyK/xxJpqB+fX8vxoG0OupGCGTIGcKoxMzyiO9ZxOwYS8ttuu
	QfK1ftLjAgC5yg6AnTGLAynnwq6qVkx7aYswqECQt06azF2JQdH9v57wYzhjQZw/EoFZIbk0tkX
	G0LLwZkLxlwrP+ux+K7h66ylZ56bxSkxVIl9efNH0yxb8tnNhBQykYNZWs2b1GkihA1N+/8FyUb
	fQLvrZKYfZrjWtHyi6AjtMlbG1Gk//iqU
X-Received: by 2002:a05:6300:6d83:20b0:3cb:9a16:b159 with SMTP id adf61e73a8af0-3cb9a16b43fmr9174292637.6.1786040608026;
        Thu, 06 Aug 2026 11:23:28 -0700 (PDT)
X-Received: by 2002:a05:6300:6d83:20b0:3cb:9a16:b159 with SMTP id adf61e73a8af0-3cb9a16b43fmr9174233637.6.1786040607520;
        Thu, 06 Aug 2026 11:23:27 -0700 (PDT)
Received: from [192.168.0.7] ([49.204.111.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b0bfesm30664455eec.3.2026.08.06.11.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 11:23:27 -0700 (PDT)
Message-ID: <48a0f889-7cec-4f8d-9cb1-9196eac4d53b@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 23:53:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: spi: qcom-geni: Document device-gpios
 property
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com,
        Krzysztof Kozlowski
 <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-0-c363a9b5df69@oss.qualcomm.com>
 <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-1-c363a9b5df69@oss.qualcomm.com>
 <8cbd912e-0f50-4fa9-b534-7ce1a3c77d88@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <8cbd912e-0f50-4fa9-b534-7ce1a3c77d88@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE0NCBTYWx0ZWRfX/RVzY20u90l6
 2F/KN5ydsosp843zQ7HSmGx1USzdgcxcAyEtN3C12vjqpOEiZC+/2H6N4oj/F43NuBpNHATH/XJ
 Fl370lzHfgFmChc+lM2Fj8ZgjKbS/zvIXEaRKVBxDvC7mNPSNRH+qmI40A1461TcohX6OvSyqrW
 Vhlpf8QCNJ6pzCJ1zUKOPVEgtKssGEmiAaKCuz9QsJihsYDklju744rtHovhlGcBop1smuqDFEE
 0cvvK2vQVV+/+EiP6Gj8QBGVOTqfmntGw6J/oVqRCeVN3ql54sqqd7JT88OLN8bjbzTXH+2t3Nu
 r99RL/VCDorWJ10AX/LVLe1kZ5E/q3bhg9g2rtHTPxxEsnkj/ani/FUDkr6pz6GTBht91EAawg2
 RZwcNiMTAf+J4AVhSuaWLXv1rnVM2tZZaDtf6R9eziBLwQbdBaTvweLymv4YKdR+Ppwsj66Yb3x
 FCHZSMplDBzJ5XmTZ2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE0NCBTYWx0ZWRfXykLorEI7zVY2
 Wtz6F6XfQ6u5/Wxf+SMrom0kC2/fM3zYPq+UPVHdBKUOgQVdsb3YRrPCyccyh84Nd9wIfs0GqIT
 vyPhMr9r48XBWFER0AbxYKJxQMFHN88=
X-Proofpoint-ORIG-GUID: ZjyJk9lyOgVsthp4IVdxfiFmGVHr4uWR
X-Proofpoint-GUID: ZjyJk9lyOgVsthp4IVdxfiFmGVHr4uWR
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a74d120 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=7DW+zsgf7PPjz/i6iZMG3g==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=BarMzL54zy4tqfeHTiAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060144

Hi Mukesh,

On 06-08-2026 23:45, Mukesh Savaliya wrote:
>
>
> On 8/6/2026 3:43 PM, Praveen Talari wrote:
>> When operating in SPI target (slave) mode, the GENI SPI controller can
>> use an external GPIO to notify the SPI master about the target's
>> active state.
>>
>
> Is this active state meaning target is in ready state to communicate 
> with master controller ?
Yes, you are right.
>
> When will it set this gpio ? can you describe little ?
I have already described the behaviour in the driver change.
Is additional explanation required in the DT binding as well?
>
>> Document the optional device-gpios property for the qcom,spi-geni-qcom
> seems bit generic name, it should describe the signal purpose, not the 
> device. Something like handshake-gpios OR ready-gpios ?
As mark pointed, there is already ready-gpios so i use this.
>> and qcom,sa8255p-geni-spi bindings, restricted to spi-slave nodes.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>> Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml | 9 
>> +++++++++
>> Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml | 9 
>> +++++++++
>>   2 files changed, 18 insertions(+)
>
> [...]
