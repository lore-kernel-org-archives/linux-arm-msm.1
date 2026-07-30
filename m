Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9E236A02E
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429691; cv=none; b=jUh1zASoLIA6XAKsTQDi5roLlpO/X96QpLT+StatPirSw/5j1kcGO8CcQfktLtQF7uzcKZZTrqHOfh5pnudsQtWBV3tcQ+k/lC5kJmEayhIxIWBoNzFsKbeNEafCeXKdgCdv4/zFW6/MbRMctO4oqePdbthAkf98Eyc32jJC0c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429691; c=relaxed/simple;
	bh=W1qHPOfiLKP9reR3QhYi9YeVhYLovQs0sDLJcbc29/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4UzCdyTo6m9VQcXhjbLodrFNHQ53tVc1G/REcxqefbdoABMiSpOlHtLHGvdBvRpplpsfIsl+xoUtJf5NuOPy5QyE5qTWvOvvEunNZde6EzcjUocnnmw7lEpeJ3wKaBbjANflK8fBkBV1e+cfSh2Fb/4VRb0fISaitFyctIU0L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0dTlVDc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hNPFOvHN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0dTlVDc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hNPFOvHN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGXGWG886058
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aF+l9BeJEjOCx930xc+un+WIoVHa/ZgTrH/eyrfC/jI=; b=P0dTlVDc8DfrJ4wI
	pytp3nTccA75LMtWp+hPPaH2FIDyucvJc7kaK5q8mDhNrGle7ySsOMYKUqPib6Ul
	n5BUUdH2o9OU6mc07tT2CVHB+KYKyl6YA3TeYBaHKxsXDhjDB/fK1LmSlom44ubz
	dJuxLCFcbzcQqer/yZgurp/AxMGPYU3fBu5eyPGylsomifbrpHShWeBY/+RwUSPB
	4UxFKqH1ynlD1DmpEiExcjSSP/0AVE75LqRlRRwG2uOGvS9p608BhwPmzvtP4ZRl
	MFzGDEfbPiLoJxjtdzWx3A2V1ipYpx6ycV4dmSEXgjY5XBxy45AgwG0ZOZqquiAj
	mV1tFQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8j7rpy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:41:29 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66799e7a177so6481878d50.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785429688; x=1786034488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aF+l9BeJEjOCx930xc+un+WIoVHa/ZgTrH/eyrfC/jI=;
        b=hNPFOvHNfPB7M7/sL1hU0w+URzSY3c/KCWd/YiPqaYrGBi3P3gjWnXCCcy1lN0Xtua
         lvNM0+9k/+ZrrdJ5mYGYZ7mqMRR8eTUzlv6U24VkF+zQ02fP1vTqmkFQ41Ws2byK89uz
         EogKm+x8QIkCsHLJTchWPfsWHqpXarR7IQptLYmc7wyFjXmmaU6rzGKm97JqaOz/brBF
         4kULrl3Jav2e7b3hOD1gt8FSx3kYZW3E1EVCoIsBPgOWr4HEnLyvsqEF7vtWj45XTSUq
         v9wU7H1L8RmZRkVfaCHzldBLXyYsGo3PqN47uvj1uvedxo75V3QJWTep4zrMhONssK5k
         WgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429688; x=1786034488;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aF+l9BeJEjOCx930xc+un+WIoVHa/ZgTrH/eyrfC/jI=;
        b=jjPZdl+vu5MhLLbrZP7jEda0DmP++k6nWz+VBCTq7w++ioP5RzsPkH7gP/9J8XZO6V
         goBmZDLqIe++JzlZSJ8XETNMjkV1hhYQICHTAzuYcTE4Uaw1HMtE6fL/MO2JD6I7nxCY
         m+so0JwyKiH5Du4rqAMc8RN8dsn0/D8b9iSb1mdQPUEbWTcG0nG33Xx+KLYZbP0/JnJm
         NvT6GxOqySffjgr8DvY5qecUyroSXM7FpXMaheiETNCunBgynrwSBEQ/PsG3wXCJbM5t
         DrBsNSBzt3z7dVg9E2rIx6dnz4RURZecVtluGmy7rUXsCwwI36+1qjSmeimindctrTxp
         rLAA==
X-Gm-Message-State: AOJu0YygLlvmkvsZTPniact+GcfsIb4TInOv5zWffMnCHtenb8Bd19rr
	erGPIgUXaZqdpLmTis4XzUZw8zd89sJNZQUDjS4AKGRa+SdJCgZ2FZhfJEa2LvJSGfykEeuljja
	8T2DRu9CWdyufBmYLGql7GRvY8BjnvGbENPiLLw9Pwdr5kUNX0hhU/by5t3RFLuIMATBawDpKpd
	0ZZzbwWw==
X-Gm-Gg: AR+sD11LeJyP+tuTSchIfQ7uMEddoPvFi99JX+mvK7deSL5Pu+ypCTCV9DTseHFS++j
	RNk8gYdAqSXHSY95DtA5ZXJik/PpXZm2fYFjgyc2pwIhWLzlxHzeZ0xNSaGnD559NQRNGLEsLfe
	NrW0yBhRSIEmWiWXqxeRcffipO6ivFyz1tpdZOAVIuWvVWgd2vcP6SXKP4NYG9yy+aUd70n3E8l
	ISwLkFvoH+F8R6WjdEHZh7sCY4N8n79GNC2uL9C/hKpIR1Al6JfOZxyGk5j9kdxpLGbSMJQKyA6
	JqxHIT8RIfcvTd4UML6KAdA2rpsfGf0p4cibTgbSK8ijyNlMDfwEnoyZ+W9sWUkLaiHCulpOxTf
	q6r80hItT2k0AuW46MZb42FkTbbopGzcPqAkrCltWLkv1nle6kaoxY67G8CpOZHhIOQ==
X-Received: by 2002:a53:aecf:0:b0:667:b5d4:98a3 with SMTP id 956f58d0204a3-6693a62cff9mr530847d50.96.1785429688488;
        Thu, 30 Jul 2026 09:41:28 -0700 (PDT)
X-Received: by 2002:a53:aecf:0:b0:667:b5d4:98a3 with SMTP id 956f58d0204a3-6693a62cff9mr530830d50.96.1785429688008;
        Thu, 30 Jul 2026 09:41:28 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:2206:62e9:bbc4:c360? ([2a01:cde0:108:24ed:2206:62e9:bbc4:c360])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6692c95ca34sm1627738d50.17.2026.07.30.09.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:41:27 -0700 (PDT)
Message-ID: <ac813518-1fc2-4262-a166-dc54545bff9b@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:41:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] arm64: dts: qcom: lemans: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
 <20260727-b4-qmi-tmd-v6-6-973cd3a226af@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260727-b4-qmi-tmd-v6-6-973cd3a226af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNSBTYWx0ZWRfX1HV5AkNyKt8/
 lyWljRW7AYm+T5S9dHPLKPYP5NqId3eX9eTo9K17OqZJH3175uNrjqlZgCYpQCJIH8AwpPOR9YM
 sFxg8I6SnT3/nJxEH+kdYXIP1i/zXmLlfkidHGF3VI4Y4Wn3u5KoRACnOZu/BVHVM4x8OQMojux
 we7C1IQoc8snrJAof24di0r8WCxwFkXeMpM+FPQ7Y7INJoNE3Hi4XttcLz+2+joemj0oqQrheh2
 tfBmxOgi7Jv9ySgdEekz10XyCoSQE2/otG0x+V6F5j1RKmbYZzoxkTZNsLAv8N71jKigH3pKnqj
 1xnYdxtYalyEPDzVhaIP0wDiT0deWwjNKQL4Q4D71A7JmbICEHLIcZrVyY8JAcco8Tg4mRYX7fx
 CUNHSNpU0a76rNwwZZV3a2etbVW8h9MQpZ89PRP4ha87tjReEYEISoxQNuzq9ZxnNPONviCGS2q
 l6zNTfCTflvJNsyZkLA==
X-Proofpoint-GUID: zaHynIsvsJbjkA5TiI8J_t5Scfkk4rqJ
X-Proofpoint-ORIG-GUID: zaHynIsvsJbjkA5TiI8J_t5Scfkk4rqJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNSBTYWx0ZWRfX7todOekmnUhO
 qV+pT9bCgmWRJXXPw2bKHnBN/K9PjDRxtWx2P9vvTcrI8hqqwcZP6xT2Gck3XfYqMdKFAB2zvHE
 SlyO7yTHZeqDcvYA/te50zfS2aCbTYA=
X-Authority-Analysis: v=2.4 cv=LraiDHdc c=1 sm=1 tr=0 ts=6a6b7eb9 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Oo7k-GI02y8c9wmTVmcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300125

On 7/27/26 16:22, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in lemans.
> 
> Set up CDSP cooling for both instances by throttling the cdsp, when
> it reaches 105°C.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

A side note, not related to these changes. The passive polling intervals 
look very short (10ms) on this platform, may be worth to double check 
these values in the future
