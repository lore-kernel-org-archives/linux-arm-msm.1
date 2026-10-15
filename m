Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE2E3DA7DC
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 05:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041064; cv=none; b=WmJSCElFA9x6pznhtJ6pGQ2B2KBQxiOvHJVOJq4NbM8Xwylz0dloB5aZra2M6EQikW2DAEp9IHpTLiyIdfww/qRTN3VKBOKNrbY8tZE/HbJhw65pQDXxBvwyDXgEwHknBT9lrcGBrFb2LU89yJki0ZdfZqIQrEZqvc+mc50EB7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041064; c=relaxed/simple;
	bh=sm5TwyuxMbjw2W5KMBmRQ4e5FhlMTD8LsbI3/uKdqXM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=T3LNKFPnH40zW02vm5bGw7iYa/60B8VsuWcreYJYh9U7fH4UIc3NDeFQyxGcuZp2ysq4nkRUe7Q30HX8GzbQlZSVUXU1CHXuWZKfg1ijve7GN9gKnUc8xGjRrNyZ8C7pHr7e6gV1wspZp6DRYruebwF6uTKgOJ2t8NhrzvsGB4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iFiYzgo1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bz5y+WYq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iFiYzgo1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bz5y+WYq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ENRDH3586364
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 05:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jUQL9dOzv2INUxvZeNwYyMv07Pcun4iuIBhgEk/JqT4=; b=iFiYzgo1QWBlPjzE
	RtUHieRmkWw7GaqhtFp5PmLhyulxxtnaTgS3axv4hFmAxYCx1Z+b60Cq/tauSx/b
	l4qrIdg+CuM3dJo4b7EtGxSLru9SAHaIhyMMg1a+KKG2gz4TraHCnyj4LDrZkdD1
	ILCOuRj6N7vUo0uTW9TNg/YlHIy2YawQA5y0N5XuMkrX8AAUjuzHhwy5AtZiLJJh
	yqZvy9lHS0Zq2mYIhbl3N0ezwLvVZ+D9MA8N0jWprEaLpX3XBzuw//i5cFZX2jvB
	eFGdJU8quGVCL8pR2Q49z8o6nKzAyG2RJYDDqm4UxzaUBbgikoUpCOGvzytzWEL1
	89MDvw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdes17y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 05:11:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39deda201bcso7962349a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 22:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792041060; x=1792645860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUQL9dOzv2INUxvZeNwYyMv07Pcun4iuIBhgEk/JqT4=;
        b=Bz5y+WYqbfeGgH0N/rJcG/KWUZUfStZ8VmlbZMXs7OQsZIbdYtBH+UOXO1VQsc3hu9
         1SEamiQYmZG6553XisHMbqCLH1FnNeQbzNUoAzBLP1GaPbKp66BSUXUTkNPdKM+mEMN5
         W9K5RYr2HV7YTJ+7RuKgErrej5isYCBXJgo4HDl1Jg1kwumxlYy5VfnFZoZLsiaMBN5p
         4wpQfNiwG+gI/XYP4GcwQYXK32QXiPqzR9t0WTG+Y0DOPqyjVSQZ6Ni3Kra0t1LPtTGw
         VwgMp3Vpr3yAXKOWfpDDbPBPpayBE6u4cmgQVZpcoGy3XTGi27+osMYYDPA/iDlSs0P8
         qGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041060; x=1792645860;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUQL9dOzv2INUxvZeNwYyMv07Pcun4iuIBhgEk/JqT4=;
        b=DG2OpNSGD3CWZ/+4ht8wvHcutQMOsAvFjHxf487bBb91oOPRNB/GCGIF57uW3TNonh
         +Owr9vlRsqEbaO6T7cu5r/slsP+U8oCt5aDbiXkF3ppoYeJWMskmRcybbUVGUxem5C3R
         PISqShp+cADSvdD3zV7pz5Q+ivpx9amph4Oc2OBdLh3Muv3ef1owLUWnc3DS1CvmBtA2
         cRpnbhg7p20C5UP+MnGeTNdD5u+FX668ruVQiaetDTQyejifyudRoQZ+3vspr5Lq/70q
         u3tDit8X3AdxzPNjWEqrFb53w0zXa9ReO+wOLCiWtQjULJyob/7BaLoJmLzJxBXTHCIt
         hopA==
X-Forwarded-Encrypted: i=1; AKwUvBw8cWr9OdQi+2JP5sV1JB8JHFqo5cMwX+bINt/JH2TrtiN/iakk6rb5QvlC9txmabEszplWAQl1viy2uJUA@vger.kernel.org
X-Gm-Message-State: AFq9FYIYvZfaR3TWxp/qWQ6a1jH/SA+HBVS7ZhW/JPbawyyAfF9758Tu
	80HDkM3/cworjV6F1lr3ZSDj6FK/i7gdlt5ltt3V4LqzyAjtplsabn5RJYExfIA6uxn+M4uM/r0
	vubD0zRbWNe1TmotsjRUOazp35bUeVcZ5ig4vRs6y6mbhz+3QKuCiXwUcaNhDRedy1feC
X-Gm-Gg: AYBFou2CAnBYv59RnINQo65+18AlgxsNq862pvb2YF8REIxWA9hv1rGQKJkiOTCEo2g
	CENsY2RyMu1q2X3ufggXDxA62ZuHFn61sIIEQnJDubP7LKU6wgS8D8K63uIMm+7CmBPNr0gCRZa
	wU5Ja++QXmzH8wZCEBPm8lF7pdpmln04LKGVfWMKMJwzHBZcKc3qR/6fBXAnt0bzMwVSrwzgsAF
	yqBlI8lGM0LjxhMr2rAt382ZVluQ3g0Qoabdy1OWfYFmc4C9q6qAuYFUsIA9mAjcalLQlZvbUky
	TKYjYgsUFSRjFNU/dui0m+lM4DRcvPzNA9lk0Q1asmkL+xvJue4ElGzhll/aCEq2hDtNR4u9YHN
	Cb0RaevT4QDbP67ZZV5QGYciGtlM=
X-Received: by 2002:a17:90b:3889:b0:3ac:929d:ba5c with SMTP id 98e67ed59e1d1-3ac929de508mr1843017a91.45.1792041060242;
        Wed, 14 Oct 2026 22:11:00 -0700 (PDT)
X-Received: by 2002:a17:90b:3889:b0:3ac:929d:ba5c with SMTP id 98e67ed59e1d1-3ac929de508mr1842976a91.45.1792041059761;
        Wed, 14 Oct 2026 22:10:59 -0700 (PDT)
Received: from [10.204.66.72] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947cf9a5sm2342462a91.15.2026.10.14.22.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 22:10:59 -0700 (PDT)
Message-ID: <cda2257b-4d7c-42bc-b402-3b720ccbe7d1@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:40:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: media: Add CAMSS device for Hawi
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-3-fc93222da89c@oss.qualcomm.com>
 <db980e07-adf9-464c-9fee-401581986508@linaro.org>
Content-Language: en-US
In-Reply-To: <db980e07-adf9-464c-9fee-401581986508@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad06065 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=AlLrfJGOdKqvsMXHV-EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: RMhoVhMwsBZVjRGVx5IWI8_RxqY3zBEZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMCBTYWx0ZWRfXxOE/w6oAjxwq
 schSJ8HUdbMkZZG/O6V/7uDcQkHe37W9+CLCd0tRYsDfmH0P+OM18hpEpeQTcUsCP4HBnXd/EcF
 GBw+vqpmprd98d1GA5d1uNW9JLoBlrvYfCL2LGV217+q0U8+GvyLC5D0+zlMhgGz22m/RSiY/MX
 kdyrCibuI3J6tEdcifmdRamnyDuQ68KeoU4+ZIGMd98Ay26BiFOtSHHkEK4azsbNSHA9h1yG5hR
 U9JvMafQmKNph2RIUKdQDXN2Kvc8wUpmnY4Lyc5J/82vlUr8RWI940Os3Wlj07vtd+dBxKHTURK
 mpGoRI9bKH0EYkro6XsyZoTQkqUaqLf6kNWZ7+xgoF49K/QtBaTy8lcwltku5Mqnszv0yxjPMm0
 oLwWoEPcfUYRrhJHCEa7urJlxLhWUlEbpDwRhEvdy3SAc7YOyHQYhhs7hVEc6PV0+1iuHrUaHKr
 NADEaJgTFVkAcgPAkBQ==
X-Proofpoint-GUID: RMhoVhMwsBZVjRGVx5IWI8_RxqY3zBEZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMCBTYWx0ZWRfX4/GpHooHi4Ze
 JcUhIKycuf9pCc6IPm1dr6+/2/e2UvxhUXgL+Xz3AcVww83z9E5St/X6OJoDYHIwYvBNTpwfWFw
 sK5pubpVdBX02UlA7Oy1CkqPjbLOlAA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150020




On 14-10-2026 15:07, Bryan O'Donoghue wrote:
> On 13/10/2026 12:02, Nihal Kumar Gupta wrote:
>> +
>> +  iommus:
>> +    maxItems: 1
> 
> Just the one iommu entry ?
Yes, one IOMMU entry contains both IFE and IFE Lite.

> Please:
> 
> - Make sure its just the one
> - Include a comment to name the one in this file
ACK

-- 
Regards,
Nihal Kumar Gupta

