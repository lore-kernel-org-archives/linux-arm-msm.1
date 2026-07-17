Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422373B6363
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280360; cv=none; b=aCVm2z9XyP7El+MZqK1RDBGDtnWoVjdWhDEb6txnwXf3gspkEg7SHBHd0XvswV+0BLfgZkflRD8EISnewILVnVB7826gQBYNjp2JJFRvAQl5or2AYFIG8QY/pi03TRuukXn/OWB/ZwXf7I3YM2b2Y+aY3KbJSgLOejNqK1i3igE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280360; c=relaxed/simple;
	bh=UUu0yhwA6E69V9YantX0L2H5+v2Hw2KIgH6t8T3r2jM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uLxQuTK9ooZAzX8toO0Sc4xvhDTrHf2BDyk+57h6Jv1EGVIFKQKHCml86vWxKUO7vlJGn52YQV0Yid4+FYqHppe+CBTuvVVDuB6tdJgpNl9jE6d9enktwGxVsw6QdtSBUBUa3m83nlLXsT2MQZx6Lz4eU3q/GNOrARe7VRX0ydw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQmtDInR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aeWLYXIH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQmtDInR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aeWLYXIH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cGEq1065334
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZtH+sYSpZT+y6pPmChaU9tOu+tanPYeojGGHeDm89p8=; b=TQmtDInRRYSNWJut
	JqnBphO45X22XNBtCJjHCdoHFq+iG+LsjqbCy12tnaIZL89hlHNVJK1AiV4Aj77a
	7qVVI3BWfSQ4YK/p1l0dtZFz2kzf2efnyE8uPxffnNZ2ZQiVeveGMeAMXYhSt/ZV
	WNQvhqr7muz7sG1CFP79qnlnr1XJ13aE8y7Nqhcuc9iXq/2NsmRTP9MmOEXL3T5M
	OofL6zPZVveu5EBRMMiWL2l/SEyrcfRgTLe2FNqdRtrsuOF5+a9myLiZhGuroksj
	Fj4+pQjT8c7n3NLiLEhVqgdKsF/jKjaX1e/hUp2rx9r1A88l6DdijzXr0bamH1L6
	S+WYLw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbquhdtk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:25:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso56959701cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 02:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784280357; x=1784885157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZtH+sYSpZT+y6pPmChaU9tOu+tanPYeojGGHeDm89p8=;
        b=aeWLYXIH+kscYkXDI6jgJSt7MyLJI6KNu6rsEIj6vG2VKX045MDX5B/XqBCEsn/+DS
         7XMaW0ciivAISoOCKgmVs0r6iJwpABxt0pdYaoCK7sdmf9JOL7YB0XZl+bn+4AJDmtK3
         8JuJiwHfve00wYm36//m1DIO1yLoYUfQsauz1n6YH3SF89iEv9dVRRaYEmnoHjQ8RtTX
         JIo+/UaZ9ddByru6eG0jOHyRuO6MCXu9CyKUX1gaZUI+adpn2Ou1ez/P9h5oIEJeHSeW
         5+vhSI8GFGEsNpvf/c21ZGQbt9abZ4e1w/dkcYpXqodB22y0uMtkTZ7u8z8NrU9tFExc
         PioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784280357; x=1784885157;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZtH+sYSpZT+y6pPmChaU9tOu+tanPYeojGGHeDm89p8=;
        b=L2LFLJYch+DlxA67bMb2CP/OyLBYvwpwmjwPeRlswdVE7q/OrFcbGbI9SLxWkeMEN6
         wsuyNFIZs4+OhPeE80m4uSdB8KdP4mlFCWc8dPlHDJnpDJnzvJowKMz5BLACEmAQIzlX
         a9tEkhxXBUcISAMnfjPh/pGzSXRZQRrR1KtEi1DP/nOlbGuEQ7Qvfug/G0beR6CGS6Ro
         JfpSO2gr+bBtMheWpBvgCNWFImN/Y1xac9pHfdEnEjG6gApWSBDLk9Gu2bPLQQ6PK0BE
         7o8Y0FIpA4OKTivL7972vOByJGhNsn5xFv/JsBzTWT2YLWsO9DrvHZB5m2zmfDe/79OY
         TEOw==
X-Forwarded-Encrypted: i=1; AHgh+RptxokvtrdNThbhSdh4C+w4XUz0y6ijxUpVo8YNaTefY+KNDX864Q2f5HxyM7YPdgvW2+K2OQLwbbpFEbpM@vger.kernel.org
X-Gm-Message-State: AOJu0YxBh3pWfeH38L7VQoA2+weQUsS1B61QxdFil/m+TP1mPRWY73GQ
	/3MolyVUPS7mqLtY1S2cqZyKabNOQ9oebHoOtWQfqb2nOUasT6earcIMJP4I/QO55SPB05B/y3o
	A/+u73wqJEi6QkE7Rdyrfs7xMXIyEBYC7f9vhgdZPGLfzxIXzl9B+8VcpCYmFEZqY960V
X-Gm-Gg: AfdE7cl20ssQkxCRMrBkifTwLzNTRgW6oCNAbmrBe1iMraMlkMxcXXIzx3Te+66bHP/
	SMaAoy7PMLevyXEI5xLnITRF74ZaaC+Ti+tTFHoj8/FKkJ7mN1P2nWoymr3dqwo56PGdmZ5gESw
	G82OtA5IepYsCLGSOm+Z0RZtdWatf2XPliyqBvv6aUe7pjouYDniv6Pt9gMZ9vQCCDwzA6xhmvd
	vA9knmNLwmO7aDlbaPW/L0FRTfboWjXt3/GClero1MFqXlRtqtU1Tzg64PsDHqSlhMwQ7bncLeq
	6BNh1IngW2S2G//YkUXZ15iCPKfMCssjjl0mJj/CUO0y2W5YwYLsojVSgKujUkAcS5PYCYAMZS0
	SCvG3+D96F6pxk/kjpkpBGAewnUWYeg==
X-Received: by 2002:a05:622a:2992:b0:51a:8945:3136 with SMTP id d75a77b69052e-5213e48ad0emr12623551cf.56.1784280357532;
        Fri, 17 Jul 2026 02:25:57 -0700 (PDT)
X-Received: by 2002:a05:622a:2992:b0:51a:8945:3136 with SMTP id d75a77b69052e-5213e48ad0emr12623301cf.56.1784280357135;
        Fri, 17 Jul 2026 02:25:57 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b074csm34097465e9.6.2026.07.17.02.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 02:25:56 -0700 (PDT)
Message-ID: <0da6b426-a9eb-42c5-9476-9227a61f0794@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:25:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] input: misc: Add an initial driver for haptics
 inside Qcom PMIH010x PMIC
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-qcom-spmi-haptics-v4-0-b0fe0ed30849@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260717-qcom-spmi-haptics-v4-0-b0fe0ed30849@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -6tDQ0a_GViI9inDRUzHPz8mDpsF3xc6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5MyBTYWx0ZWRfXzpRkLxe5zohQ
 hXHYx9Su4CA85OL7rFEXSbcSOq9Ejr+Ob4MgUrsnZcPb7BTiDbYYIfqFbUGoQ6h9W785ngL8Rkw
 ktCa8hrnMs1xbR1sB01FwzToryWf9dmJ6wdGBG896xKvlJso6z21s/DBWwCdkEBAj2YjzQu4rBF
 lrtfBqEjHVtFgO9/VS2Yj6gExzYO04k4IE6Z90M9Tn68t7BASLjnUeU7rhTE5NfVxYQqDKSWBU8
 nSrXBR6RDJcAb1KimXYK1U7Q1ZmfwPd6LjwejdlViyeo87s2L4gMlIzA1vJCkp+XohKUx3yoLg5
 o4BF/76g4DLbgJSNzNF8dugBJGUcPr2nXJtr+qG84CZXbQhXpzWYUUYSb2q7rjKvhAXaUaQPCPo
 8DOW0OtMXCwlTlgXzjdSPLAW+mTH9gCAb3XZIFmmqbSdzdKSuRWqps+tiYeLZbdc3x5LuJthDJW
 cAhmFEFo5o4W3jvXo8g==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a59f526 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CtGaIe7eZSrXIIjUQnIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: -6tDQ0a_GViI9inDRUzHPz8mDpsF3xc6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5MyBTYWx0ZWRfX+2BxfRK6Fkqg
 oa+eErj3+qXbshUUrZLu4Wehp3eQIdPs98AzoTDxXh6IaKr4aw+zE9/UbT5/fSXMl+NurDbL+Ii
 O2d8uG9e9kKt0JRZu/uef91em8ZelnA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170093

On 17/07/2026 09:28, Fenglin Wu wrote:
> Dependencies:
>  - [patch 2/3] depends on [patch 1/3] and they should be applied together
> 

Why are you cc-ing internal kernel@oss.qualcomm.com?

I already asked you TWICE. Both times you ignored that, so that's it.

Best regards,
Krzysztof
