Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6430422E3E9
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784906564; cv=none; b=Zq3Q4fcnwiCBKEFULAXKdXOJKryPgjBOd+Rd0F661SUWp5en50B7x/KFcMMA9Ht7zaim2m2KLO7J5PgEgOFQJyb9BSNmHiCYlYE+rULn0aT3RJBEwcypk9dnBu/MTX6qV4ckJn99LFNjcdPg2eLNnsoyZbK1RJeGFDnKizz1yig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784906564; c=relaxed/simple;
	bh=BjasvDDkwHhNv5BcQv11IQz/Auu0rUBaauAiyQZi1wQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A25qZycHLTTLhmXSwwNGFCiXnCAqUh8E8qjBm54JF8Ckpmidyoc0P+/xXhJXLR7fy1Y8binY7NSNQWakdzbVUXayW5QmzM6Lh68r6xBlsOryBAgZBqUcFKHLem6BVSKWy99MPTUdQ7ymGXT6DeqjpoELMQzoA/LuQyaEmPCflKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bb6CY/pf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=guwYKa2E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bb6CY/pf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="guwYKa2E"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODblCu3309252
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MTjudTjsFZ++4fLu4bdOkAsyjNhKcu3SGdGBfaWfL5w=; b=bb6CY/pfdNV5oL3N
	ZGWCM1KpDfhyJx7YS5ao9gqjyRvheK0mr3jASzphXVg7Y9dinCNfJlczfrVm+80W
	usYhVxenUVaft5g3nQpb/G0SZQ1hV1KuJ3cM3fEjDjzr2w98SdXIFwwXm3BR2Qkn
	12w97lFEQNXrMBO0fnX3ejnfmwo/dMNh+0lEWyIzxtsTLf6Ux9foUIk21BwMFDyr
	fGmmzS4m9mwwcPVO0hvUixDDvhBnwNesdX/0XN3FpYUpmatTcciwPLpW+W8YfnJz
	QEFWK6d2P8s1V8CANNBSvvizgn1IeFJ2/uJhldAvtGQGrMRkxSpCh1iwemUEQHH5
	1COiaw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahukjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:22:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-901fdbfc3abso1449226d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784906560; x=1785511360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTjudTjsFZ++4fLu4bdOkAsyjNhKcu3SGdGBfaWfL5w=;
        b=guwYKa2EATB07ESn4eyiO0ULVhfH6LrL2ECOQjyrHBU+UGMrveXpwaSh9oIPrgc/jM
         ZlosGiRbXYZLlMCyB5mqnuctYU6uLgJbD8y6KpJPUtPScU8HBW83GhVbBt1kkaXNOKuH
         ietKMuc9vS4MZmseszus1auo7iITWuVE+nLGrfI2BpuNw5V7RJPAgxii9aAJk9Ntxhjd
         8AxNDn+xayZGMpLpDugG62lZeA/K/IZ19AcpSttFWcW2awHLhW1nMtmm+A4mQCRomkim
         pII3ss1X5bJpj5Cwps6SVHVyAQkjzAzF+wG6wTp3nMMdlZMS8QQUO7Bo1Ril5ltwAYWl
         iCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784906560; x=1785511360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTjudTjsFZ++4fLu4bdOkAsyjNhKcu3SGdGBfaWfL5w=;
        b=UZBg1ROhnk+jKPoalYgYm+WQR/DtqZih4Xsod468EDnZriYHFLmDqrH8Nq/Naan3ER
         8e/g3CudUCihTzrQ1dnJyUbxqEOhOGVna//dLVQFf/2BCbGtzFrNVgrrCAdXgLqsf7MX
         IvedG6x/3cc/2HfnEJA/kZtMF45Zt7h6e6r8aT14bd7lq5c7BYJRbe0Vfex0b9kaPGLk
         SkO32JDFClXtzINo7bmYImwLx/ckiJ6CgFQVnOZc6ajXTApDKz6h/JBlQxOqe2Ov3UUW
         TMaR+U/G/KQttEXks4cqM7KnMbR7HAoLz7EZ6us5tsdxfHFUj7pDExv1holdcllSh3hG
         KyJg==
X-Forwarded-Encrypted: i=1; AHgh+RqEW3RPF0kXt9a5aq4HFsfSLMsbDp8IACb0iF/yf9nWnbPzDxJ02arxFLbJ/pTaVd5+x/vam9verUkVcX2r@vger.kernel.org
X-Gm-Message-State: AOJu0YwpL7vooQcChzeAsKCRCs6BT48cziMgg+haAL3k+N4KK/6mlRZN
	cSlYzD/cHluLKSN40nbl653PME17CvWiBvTo2T9zCAa+GAfU/AptZXDNP3aRs8z7ynS06aCFfaF
	fwNvFHKnp+2PGY1rZTkc/WfCO98PJ09kJ4vzBBZdjZnlArjAK5sEDBgJvrDNxIyXNCveFrFKPHT
	sz
X-Gm-Gg: AR+sD13SEv64aBl1AYqk8TrU1diQEACiktp33a5KqZ65wHIk6nq24OYk884QAkreovq
	s3AefDDgHIpa4wA/COnf7nXgmCiUjlPlKKRJcYNAUM031j1Y5pNHvdACBHNj/YkL88ISWyrlk6S
	1HSp9402aIqCLK8JDUfwuUg7Q9++3+ptOTH3+jp9FI2072h45yLOeEbLn8mpL7mlADqXWRe/z+F
	aO+8paVdybjhvU0TzXFr71IoB6W6BBaWxr8rPzJFZezWRcvJkVYraJGkPlrCcbp9KiqhqK+hyrl
	Ltg6d0vWOgUj8GLWmtXxGZxJU2LjVu82K/Z5Ls7Z2Xos3t4T5MjdX1YJmXmMwn+aSK48pgmWd2k
	cOKf/t7d371PXWki89oq327w+
X-Received: by 2002:a05:6214:4382:b0:907:8b2c:ef0 with SMTP id 6a1803df08f44-907d77b19ebmr44100856d6.4.1784906560506;
        Fri, 24 Jul 2026 08:22:40 -0700 (PDT)
X-Received: by 2002:a05:6214:4382:b0:907:8b2c:ef0 with SMTP id 6a1803df08f44-907d77b19ebmr44100346d6.4.1784906559892;
        Fri, 24 Jul 2026 08:22:39 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac0fa4sm363635166b.20.2026.07.24.08.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 08:22:38 -0700 (PDT)
Message-ID: <f258f8c8-764d-4789-b3d2-6b3bb5b8df75@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:22:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: monaco: Fix CSI I2C controllers default bus
 frequency
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260723114844.63093-1-johannes.goede@oss.qualcomm.com>
 <111bfc31-7f02-4875-ab58-e92bf1ccc44d@oss.qualcomm.com>
 <b690426c-94fa-43b8-a805-7413e45f2849@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b690426c-94fa-43b8-a805-7413e45f2849@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfXzHnglwYlL6kc
 10QQkjUkuJOYg2ng8XVCeLUdTk7H3iPDh61ieRYgdfJeaONuIzkdqn6u5fq+bJMbjNUhBPD7k5o
 lN8O4mqGPmmgwmB9UvBAsg7RUxigNOc=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a638341 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nlT7P3IE1B_2hipTTHoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: U0Zj3zRbpnKPzOYy2qlbPTMmX3B8EqDs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfX9x/Aw9GDILsT
 4iTvPaKnDfaMzXVKAKKLoY3pgZZ1aCAmh98w4NQKVF6h6uzlzGysC6uulNdPZN/lixt+BHTtZ+t
 0wYWrsB6P80Qekzw49WddyVrusMTV9nEyjKnLAlyryrf/olHd21DlqjByqiWN2lO7yTW+j+FREO
 0Q/NeMTqIK/Z42AkvhYc2agrh13K2FCkg+ZXL0l2C+RGL88DLmR3RFzyjmVf2q1FjykLYkzFfFa
 StiGSOFfLVroGK+noasnbWdEMFYfz1YI50/NnqKWqjMx423+o2VkglceMPx3zRRJ3yqI6AYFJY4
 r+xl5Ftrt4DBv+5AEO+WBiQ1dV+/8DQ5Wxa3eTgHeDUXAm2yqRsqA+yAzfPnk/Tg9vzUaf4j2Gp
 TN4mLH3nUIXmuJ2zV9QPodyTm+3APvwe1hXGen7Fm3dR0NTwc5PFI5vM8LIHBK42btdM4MHOpnX
 GVbhI6eHlClc+CFxTrw==
X-Proofpoint-ORIG-GUID: U0Zj3zRbpnKPzOYy2qlbPTMmX3B8EqDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240138

On 7/24/26 4:22 PM, Hans de Goede wrote:
> Hi,
> 
> On 24-Jul-26 1:42 PM, Konrad Dybcio wrote:
>> On 7/23/26 1:48 PM, Hans de Goede wrote:
>>> 1 MHz is quite fast for an I2C bus and not necessarly reliable, change this
>>> to 400 KHz which is a more reasonable default.
>>>
>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>
>>
>> I guess this is a question of what's more common among client
>> devices. I assume you have some that aren't happy with 1 MHz?
> 
> Looking at ACPI tables for many x86 devices 400 KHz is the standard,
> with some devices going down to 100 KHz. 1 MHz is pretty much
> unheard off.
> 
> Note the official I2C spec is limited to 100 KHz anything faster then
> that is an extension.
> 
> My specific reason for submitting this patch is imx219 sensors on
> Mona sometimes failing to initialize at 1MHz which is kinda to
> be expected when going for 10x the I2C specification max value.

FWIW I don't mind this patch but wanted to know more background

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
