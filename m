Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3B133120E
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 06:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850772; cv=none; b=OzKDCVDmPFsYIBlCNWfAeiafqHZKFvi/9CIMY1Ug2YO9UCB1Iv9aUymACo2GZy0xCZPMYnTix2+gB50/n3eDUcpkwmjHS+7KY/8XMkyUChTqnQbdC8hxKxrcCsH/LHiKVv4T0ObrHImU5Fq1BZBP+1Wj0hncaQX44sWGgq6x51U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850772; c=relaxed/simple;
	bh=7fCxURM1AGQCmDMGRSEptUZ+VduxXhPEEzz+5OoRHzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T4m5AY+Z6HGP9cGqPOr5gR5hswAEsUwbpucxX5/T7f1EKVYE4/O5D0kmPz9S5pmiWpjT5eUPcfakrqjqeSToon31PZxE3L1mQYsv3zW0y4q4e62vqPbmYwXfodG0FMLwud6Rj+tz0APfbisuvp+BR0rkVooTP4QMRjSo11r8nU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yy64AojU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dy2O+uMf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yy64AojU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dy2O+uMf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Lr6n2502501
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 06:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85eScO7afUK1ow8GKsvDySdIJKfhsGnJ4YOQKm+uKGQ=; b=Yy64AojUyOvoPBzl
	yOLjDgc0IUvTrGCCLw0u2A8rZaTosTsd3/fDTYB4QNuGG9lmCO3vWdqeW4DgUaGW
	f12zDlt6YnppcyoGX/ApqcuIqcRlDnyyoe1u8fMU/ur8oeM55aR1c7i9HqKpJfuJ
	zxtE1h1hz1aRIYt45ISnKQsgSoAMPHj78Kiqg5Yewqh+Okwzt2/B0ZJbjTTR0NDH
	BbrJEu2LAVj1Cyyhf872f5r4xSklTi9sooPzR/e+SLRzApcjXEhf9WncUf4IW2U7
	KWUNVfips6SI1gzqrD6diGHffJu8S9pa2L2fHzhhfDh7BOS5I0LTqBdcGOirzhJE
	dYYYlw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7g6x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 06:59:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fa40fed05so10549501cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 23:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788850769; x=1789455569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=85eScO7afUK1ow8GKsvDySdIJKfhsGnJ4YOQKm+uKGQ=;
        b=dy2O+uMf3CZNKAfmVIG2QOXSux7k6lN5eXTOmEVIDeSD71YDd4IHPNDzZPir1dDTYZ
         frRJDS5lkJsBOUOpWbwmTmxYaIzw6OPAcIslrvx1B2htdZvnimrioRuiHe4gECyjuNzX
         NaePtLZzcXN80lL1/8S+ZEX3QV51+bAFaXB03SuH1uu7NjrxFtu/O4rO3Cu3hff0Bi8h
         q4oLgnlCGBFS2XU4tMimdqCVxODq2EMAiENFhGr2JYO4q+fRAGjv5JnyT0cLHRh7h1vD
         ADP9pmZ0xp7Kh/uAyn47Mzv5z8uaII10I0mJ3OGfOZ6eliKfnBcBa3fepfhdLOTuzGJj
         JE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788850769; x=1789455569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=85eScO7afUK1ow8GKsvDySdIJKfhsGnJ4YOQKm+uKGQ=;
        b=SSXv4uYNNwWFOx0oLkppjnPnxHB2ZaKD9t58saS+eHVRt4LYnLgENbpCa5mTBqBD9y
         UF1ERKf0Bi/8qouEM/yStzemvW+ZtckUjeZ9cd9jPmrCMLQtu/ttj8B5Ymt55FH6fPtX
         MSXq9pzM1Bz6oNJKq68iAW0eRmPOlI32LJMkOEaZ7jVQ9wUsm13FqCCvljFLZSGZiQfM
         L7aoL/7TUhnZQz1bSGQVDZPhtr1JEZzxGggEP6oC/fzkXZADQ2My7bnY3tzyTKuzylKG
         4ESiLonDXMjqlVENnvpYme/JsiAb8RrdNlkp0h+21f0NzMY1RI97OH4UZ8uUhRvDGU1y
         Wg3A==
X-Gm-Message-State: AFuF++mZ4FvNvYvBtTiCvttvtRm4zpo4rS+OJk1ZXyem8zTOn12F6v4p
	dc9oC7HNTdm5nx2TK6AuGxZylgoSTCbU+EsRut+ev0Hb71RUvgQ/1Enp3sbzCbAJoiw86ZbvYWZ
	Ye9ZmPG2UFmn5+SqCgD+zoz0oVDfMz8G/osJpYvV41x4Jc0LrlO9UaOqeh9tNWBpBdBjM
X-Gm-Gg: AYBFou1kJaoMtHk11JE7RLtu0HQdv9DmYsD4Cf1q3o05tajXwrJXa/JuS2zTO+Z5mTj
	XTZ4i/teFhfpsj6DbULlMeAatS+wJB2pa6jm0yvBU7iE256eu2VjMmJGZ5dZv7D95pK1pEzZWzA
	5Aa5rj9VL00hEoNvzCzfynJdQIM7vehwOKhe62BITuFBklhI954me+jZT7O1zXn9ZvHlbl213M1
	wFWk/QO6Ko+8PM7F3YQ/CJih5n9qXDHvubSq1gFRocRPHxQPdmmP9GPn5hAsSxtO8ulTFhBU9cB
	2VzR+G7wRZIFhZfpbHxrtwFP8pubH9SY5Xu7jyLzgQtnlPk4+fy46km1/YISuj9yv20kiPPEL75
	UOtYme9+dhzPlu96nBfKh4Q==
X-Received: by 2002:a05:622a:180c:b0:530:4156:8ad4 with SMTP id d75a77b69052e-5305613abe4mr224742911cf.1.1788850768761;
        Mon, 07 Sep 2026 23:59:28 -0700 (PDT)
X-Received: by 2002:a05:622a:180c:b0:530:4156:8ad4 with SMTP id d75a77b69052e-5305613abe4mr224742701cf.1.1788850768302;
        Mon, 07 Sep 2026 23:59:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68e8f2fsm5735990a12.19.2026.09.07.23.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 23:59:27 -0700 (PDT)
Message-ID: <9678155f-d1d2-4592-aa95-28ebcb412c9d@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 08:59:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Lenovo IdeaPad Slim 5x 14Q8X9
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260906-x1-ideapad-slim5x-v1-0-7ccffbe6bc4a@oldschoolsolutions.biz>
 <20260906-x1-ideapad-slim5x-v1-3-7ccffbe6bc4a@oldschoolsolutions.biz>
 <2c524de2-22bc-4bb3-9c20-ffe197819acd@oss.qualcomm.com>
 <84e545b9-3c81-49d0-9ac4-1aa84eabd3d0@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <84e545b9-3c81-49d0-9ac4-1aa84eabd3d0@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a9fb251 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gxl3bz0cAAAA:8 a=3qvD5ysIgNNsp0o9aF8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MSBTYWx0ZWRfX1PwlQ9vz/qrK
 rP7uoWkn0bax4mEbL4oqFqME9uOFyHoKqGFZvm+KnmKXL86EFHt6IKvqzlfPHyX1EjhXj7oC1PT
 k3Jbt8dEWyxAMu1OmsnzjuRzA1Otb4k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MSBTYWx0ZWRfX+MqsXrkI5V7I
 xTzZryrLysgc++SNJKYNu2wqu2tpGVvfxapfhBkLN8ZzIerfqfIDcw2S5+JmRU4Oq94ZfB5TNEX
 LGpnfA3tlrIt+XNheBpZhT8Vddqm6E3xGFxAzKkgBGF4J44RSy+fSbIupU3C5gwfa4bhX85TTbP
 bjw0q6q6HIguMP7vAkrrgJSJxx2tWp/HqrrS/0BIMq8yxvhuhhcQ9ImPcgAK47tMh+zRCv89EsW
 0zHqzbOJGvHFei6oZCqbD0cVANTC0UHt7WeEbWWc/FXpSLC2box9QCOqDy+AG6cIbhytCDwj9GE
 8nmr+T71VI8hQ85kD1BvXcQNQddLArhgOtu6Z9Jx0gJYum9svso0lsxA3i1PeJkpStaEAYfToJi
 XmutBRZOoK06x2B28MzpchkDhrenoiEyN9cNKjrYNfCC80ntv5kJnF9kPg6wApitGLMRWrB3aR6
 +U71DixksmwjS6Vri8g==
X-Proofpoint-ORIG-GUID: vCofRFQ_wSoTKupeop47lnzRcdLBE9mh
X-Proofpoint-GUID: vCofRFQ_wSoTKupeop47lnzRcdLBE9mh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080071

On 9/8/26 7:18 AM, Jens Glathe wrote:
> Hi Konrad,
> 
> On 07.09.26 11:14, Konrad Dybcio wrote:
>> On 9/6/26 2:22 PM, Jens Glathe via B4 Relay wrote:
>>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>>
>>> Add a common DTSI plus LCD and OLED board files for the Lenovo
>>> IdeaPad Slim 5 14Q8X9 (machine type 83HL) on X1P42100. In some
>>> regions this SKU is sold as "IdeaPad Slim 5x"; the "x" is the
>>> Qualcomm suffix in Lenovo's current IdeaPad naming (i = Intel,
>>> a = AMD, x = Qualcomm).

[...]

>>> +        vreg_l4b_1p8: ldo4 {
>>> +            regulator-name = "vreg_l4b_1p8";
>>> +            regulator-min-microvolt = <1800000>;
>>> +            regulator-max-microvolt = <1800000>;
>>> +            regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>> +
>>> +            regulator-state-mem {
>>> +                regulator-on-in-suspend;
>>> +            };
>> Why is this necessary?
> 
> I had a debug session on the Thinkbook 16 with Grok where I chased stuck mouse via USB dongle after long suspend. This is what resulted from this, PTN3222 losing its state on deep suspend when the vreg shuts off. And it solved the problem, propagated it over to the Ideapad 5 device trees. I also observed that on the Ideapad 5 2in1 before. Never seen on the Slim5x, but I got that one after the change was in. So, yes, IMO.

Alright, let's at least leave a comment for the future reader

Konrad
