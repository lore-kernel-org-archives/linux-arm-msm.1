Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768E13DE431
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784792420; cv=none; b=GBX7GBXrEwB2zUmPf1AmyaSTKlpDDnNRVNqQZ7VRwaKIvEbfTt3nxEhF9TXVt/5Vi0RgF4AaOelZSnetGB0UHiIh196UcmyWddh6oFoUfrFd9GLcytQ60jMnU2zks9npWjsilspGCqqV7jk/+Zc7aOoHSFivHAPRxeDfiDyoD50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784792420; c=relaxed/simple;
	bh=87kbs2npqcqvfJFySp/OWE/pJx7RjfrsrY3bV2Ot88A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZSmghIwwrHFZP+X4DugZXdAQEfJC220BDs+dFlgb+/b2sVOfSw/6eJ5YYMHz6ZzrS3oJBaSMfs+facljEEwabWmTWLoWFJRTjdaurFa7yHxkmJmDPgsatRm+4ffSPslBN1swMJWm9V+k5KIhwhjnk6GfEo5a24PxodJ7CD1OFcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbkpRXVa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fiTzx+5s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbkpRXVa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fiTzx+5s"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7Bm513158250
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ISzK1DEaHk+EZOYCpng7ILO6U3frD4mricOPPefehcg=; b=gbkpRXVadTWyCcVj
	s7AMcO7zkK0PWvwy6BuzZjeetuDFHMozlpkN8PdRy86J4tq7P2u9w1/6/ww9EWuc
	hH3xNV79Y78tUmtOB5DnZgde8J6mctvJXwkXdGBrUZrk3wEpFGVy5B70IpYBz/bz
	6O8uw0GiMEpUe8zgX2djHCeELv+ieaPHaGFANVURZj8UuSHyTU4bg8MNUnd7Wl1c
	VURN8BKfL1bV0OJuxnedHz5mM0a4l5E9ZP+FHQIwLI7HsnxXk0/dmePOWX4tbxw6
	H4vZ4hkeDk3sXBet/7B/dsFL40TvCeDC9kRiPQXt6Tij4mD94eJZKQKznUtV4jUM
	vVXX9Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke0kr6e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:40:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc5faecf01so11166905ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 00:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784792417; x=1785397217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ISzK1DEaHk+EZOYCpng7ILO6U3frD4mricOPPefehcg=;
        b=fiTzx+5sFSAwBZJXcb+cK4v7pCAk81H/f4Qrxn/EUHqRbGFeQqP+69dgme77tW+1RP
         hAK3eW3TCkMhUr9jJ0ehyl+yZrh39hJVYm7+98RYWl20XoKruit3WqTBqBcj53xAvf56
         AeOJ+8cIW53mVtcM86EQJ7Hu4eFAg9OPJsuQJSb5hrt1tvYpeIpf2ZdfccRG/dkXarRh
         NacwSixUiq9Wie9J7Tb0e+YegjUHPeQ8jtWCDUFHAHIqa3hIDP1c8EmrbTN8ZMpKHmKd
         bHbKUkALRabKsuEE/7alhM4Qwpr56X8f02kQDkYyUD8L/ZPjyJV+kkKnIUqxrlV9jQU/
         zocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784792417; x=1785397217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ISzK1DEaHk+EZOYCpng7ILO6U3frD4mricOPPefehcg=;
        b=sy2tvD2QrqTp6MI1liPKOOmMxvZQp/QWOKMQZy6ZmZNFqzf2UFjE9yIdbUbmlidcI5
         WFghZFOdO4wZrWoPMBJKoitL1dtztEuFPvKnN+KA9pRBtpeCiEhmJKnPH27UoDZDA11n
         UsrjljfNCKYSQ3nEuWdqe/QVmfhZGr18VnsX61qkouDy2hFdXuQ66QYjhX6VB+p4uVEp
         hos+xL2LyoKVLHlsvYwVRPu7WnzKmYGNpwIjYdmNlJAzsImaHWQWFOgL4EAsV1AFG3r4
         MpAtA0BNXUQMV1wBcU9YrTBVMyJZ/4MEjVbf95kD4xFVzTEjlJ0BYeMB6S9xtV/rBTqs
         MGkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrv6E4EeG/aIJLKbdzwk1YVH7qug/wNQZzwVfk4zdK+wH1GeAeQJMMjd7mSWXvg4hVmxOX9mfukIoY+1Nbm@vger.kernel.org
X-Gm-Message-State: AOJu0YxxMF9qcj98Jlv4NlDovSjnxCVvZrL/mkUpphwH4fpm9c+w+MYJ
	3TDGKEyOpxZ06xmjKPwy6G1W0WKrShQgOANr4iGBGNwBG31rG32KF3b3J0lsggk+Ua92R4s6iKx
	TKcPh+YdSGaC1EBpUsEVDQI7OvQFJdgXcqlWLv50Oihn2do28eWixghXqM0wEzNzn2bYK
X-Gm-Gg: AR+sD117LS4HkRr7oe2JzkY/T1N5H9+8sDCcj0gJffWe0Tkhz3Xcm7Ta+nG/wU1XJ76
	2/y3e3wJ92P7//5+r8nG7Lyfd2qNNR3yI7i1sf0/3dAMMjR36kZSxf+4q+F/Vnzwosg3eGdg6XT
	98jkZN+VAv0/klB/I01aDzzAderfzXnUSRWKpi2QNd93XRdfpILRlEu+DR0XaGPLsrnne0dqB6V
	oQgZNexx2Ui2toFBqrv66g6gKYucLZcGK+JMPYuz3P1B6gE3FW6gWIkheyOrrBzDThafYqzJQVO
	zx1gcW6lYMJR/OSALx+R2+J0Yl61YrcLr2KfrOyo6BIzDd3ExJ9yTkwB8R2baXkGsbqLp7lmsmf
	i2JrGboWG96h/8kezhnJ7V9FNNZ40IMM/pw==
X-Received: by 2002:a17:903:41ce:b0:2ce:8e70:3210 with SMTP id d9443c01a7336-2cfa7436e9fmr24584735ad.16.1784792417165;
        Thu, 23 Jul 2026 00:40:17 -0700 (PDT)
X-Received: by 2002:a17:903:41ce:b0:2ce:8e70:3210 with SMTP id d9443c01a7336-2cfa7436e9fmr24584415ad.16.1784792416640;
        Thu, 23 Jul 2026 00:40:16 -0700 (PDT)
Received: from [10.92.198.88] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd8a9csm28597255ad.30.2026.07.23.00.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 00:40:16 -0700 (PDT)
Message-ID: <1dec53f7-53a6-4905-be0f-96c3acee8938@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 13:10:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
 <amG0f57O5-e_Qg5z@monoceros>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <amG0f57O5-e_Qg5z@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: K2QAjmCmB00OaaCD72fzS7rbaxBNl4-7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA3NiBTYWx0ZWRfX03dvbqgouUsq
 NLoycAhMpP4rmJGbnr23GgcwlnaQKnvIuq1qYB+Wfzg+9oLImz2+Bv0/nwc+npnVQOg7WJDLb7l
 LO7WCmV++STXNDkU3KwUuNYhD3/C/RA=
X-Authority-Analysis: v=2.4 cv=S7DpBosP c=1 sm=1 tr=0 ts=6a61c562 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=BWQAxAc5KOlRlpeuKSQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: K2QAjmCmB00OaaCD72fzS7rbaxBNl4-7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA3NiBTYWx0ZWRfX+gPP4bjEgtSA
 AV1DY7Xc7mh5Rti/jf4kUek5DSQylkzd79X8S0Q1mvfGy92+q8qnf9TTe2iJJ/svGQVhS2SqD74
 38cUiE0ciwC0BBYsFUq/8Eyyi4cuRuJERMYIT2jUvTSSsOT9QtU/w2vlckrSJr8sGFSw4KitEIg
 AyBgdfyM9kb0E96ImRB5GoRd/PdfcYboV5RLvKCWzKuWAvfXw64/Pn1y2mmNxYm/jAomV7GtxH3
 3wPpswyrtfeo0M8dyYSDlM4Kdg9YtlNOtVZ8XpuczS4US3IZj1jVNab3187gKraxCBikSC2UID1
 bL1+v/ORtA87kmqA3gVEURXYQjcSNGedFhM6sVVFW58FzD4vu1jQShNtp8ID1bFSzseOvWgK/vV
 yGdizU+TmRIWpumVIT9wT952ah7GAc169E4WIDG5QL1t54wn6Tp5wJ4+E/1slLY2W37byvjv1Cs
 E5R3XPqmUsC9ra7mfnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230076

Hi Uwe,

On 7/23/2026 11:59 AM, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Jul 22, 2026 at 12:00:07AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> +#include <linux/mod_devicetable.h>
>> [...]
>> +#include <linux/platform_device.h>
> 
> <linux/platform_device.h> already provides struct of_device_id and
> <linux/mod_devicetable.h> will go away soon. So please drop the #include
> for <linux/mod_devicetable.h>.

ACK, thanks for the review, will remove it in next revision.

Thanks,
Manaf

> 
> Best regards
> Uwe

