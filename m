Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDFB271443
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786452118; cv=none; b=Mnoj8cZg6SIZKUm1UXgK4/nGgNKnZM54zV9QMwaK47w+JJO3K6jq4HzxklRUf3ObAOuNgL83SzePbMiPkecnoJJh8LkdhhE3+AgNcxGHr31IEzx3CstY81t3PSK9IYSZu8rbjO1gmjuzSM0c8vK3Q3a0bFgN2ncAdk93fRBXl7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786452118; c=relaxed/simple;
	bh=VPIKZN43hVd/gv75GOW2hcsf58m/SGcocwt5Q6C6e7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=emVu1yrRGuKDr4Y8yAfcIITGQwsq3c+aihQI35pEywvs39807HQKBHvwl+xjIzf+qRMrw30BtlES4CNZd8SWlUNuDnulKU/jHLFiY8BBZ5GogREdLo6gr1P5qxxW39Yob3NGqxXfJfDgT511E2eX3OaSsSTnFFOndHusQ/PN410=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Op1qx4ll; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BWYDdUtF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Op1qx4ll";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BWYDdUtF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BCRTTX1169595
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/F1QdQ5yJlfEpKwu40CWgAdnMbdNMa5TKXAj/fxbeTk=; b=Op1qx4llBGa4qUTT
	M9Z4GksSKWD37UY4QWfNrhuEAjkZY8aDHipoDv1aB+oY25XrERohsznQyyV6r9Km
	n023hD3c9EAgrE2dsC8P5DYlNhRAyTwARy8oRPOlJBMsH5nc9Jfdcf90GstNM1bU
	er9DgtroyorWSGpx6143oglDlI7w/ZGlf+dY+4r62lE/nL0UDHPaKFe8o2t1eKr8
	jkt39jNVbFjSxOnJynyQEBwbqEl0qwh+69p0c5vxplB+6ijKt6yyZX0gF7N/hj4c
	lcCmNXFe+CwDEH3OPgBny57QhtpWjVWCEIw2HP5ahhHh34htr6HuJWdfNXLSIKmu
	dWNDOA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyqmk2qfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:41:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce8a76df2dso50172915ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 05:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786452114; x=1787056914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/F1QdQ5yJlfEpKwu40CWgAdnMbdNMa5TKXAj/fxbeTk=;
        b=BWYDdUtFpGvDOF3m8GTSGT2D0J6rg+imbOiG90bi/FLdpgbEkCoUdzgvo3qClpbhOM
         ikOLHFo6ICoT9DgCR/UCu9RH6H4Bc9ZRaOLZ6OV+OWDYgnBluNaGD/DAjPMf7/g0bnin
         hRGds6dAn3Ts2LvEfQQdOo6gIFMUHFAEbF09X5570qLjpCcE019rHvZsTwftOaRPK5aY
         tgxvN9cpZJX7e47M5Jxq1EM2gJ8k0Z1g+ZIaO6UPDTSFBAEF3YKRkSSKUNB2oPldyL6u
         DTe+UVbcoV64scQryx8o7b2xQoGxvbilEXtKCkMOUhBCcnxKxq79hi7bWD4JaZ6eD7dw
         iEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786452114; x=1787056914;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/F1QdQ5yJlfEpKwu40CWgAdnMbdNMa5TKXAj/fxbeTk=;
        b=ZbdZW81LWoW3r3f1GMOsVigKhyszEogAcclqE4PjDql3nsf2fBUmam1L+7WyJGUnSJ
         66JQhQvgp6tKEE1sFK2+6nstF6NTmaRqUjvzyIfDgHPSYnqIFXqR/4iFMqxnRgXixusx
         mWiw3uneGQ64Irz51fDaQS5V0JEgls8DqgcnbSkmt9CHci7ZcNK9VfKKpoz5AE67HSXY
         1MpqS286Knj+q3dk++0i9gkoqXr9B3FJXpzbh8D7Csp514ai9R06PT+QOa9bhjhXhSNW
         rSnYhbwgK+v4z/giGS+bire6SmrDcCzdi1y8aFa3juRBfrHNwa+ajtgxsY3RI9q2s6YH
         MDtQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpxt4mt8Wymk5mGdkdcOH4RA/Xo3z3gO+Bw1mj+kAL8gJ5r/YWD3hpnIqigODh0oY8qoEX/XQlPkkuQaDAR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6AlSmXGv+hZiMioSbyJ4wg832FhuqiGSn7IvMaFe02G0/1+S8
	gvOS5p0NLbb1ZtVfGxkug70KoXWwo859qFkW9bhDkMj2R38YdOsO4WUPeGMLOwpz802Nqbnbezc
	E88NYPgUtr5U8wIYx7z/gsEGuuir5aJWAFyTXFSCbf4FrwaSXpZt9vCpu2KrBmsHBWSZB
X-Gm-Gg: AR+sD13faf3BMk7H7Z9N0rGHZ9blO/kAuPwJGRQ7p5ysWJd39xvk68CJ06pUUtdH2q9
	Pk0dUMEupBY8jBDHT2aMQGYtyqeJcgtdlF3cPO0fdGVVEw4bx7SkVXW3nWZ4jXnugvtiDuYnZbw
	YkjRytfkh2WazvxQYO6IkrRmrhAY5QRLZr1iOiz+jpmRmw/niDRP8wtdJEs8P6wuFWsOehH27+1
	4LgdQgzGQ0tJ09XM876UfaeaVfApYXXirHpn8IryKPSYysX9aA4AbSSq/KjVon0V1wVRpUHvkax
	tQrGOhc1/JhO31+Tik6lXU8p6f3Me2/Vpq42vTFcS+plIteJjsTeKGy7ELkdDsq9W9KWSUGTuyM
	aXCRAar8INW/LK/bav8JhLkEaZIfE7cH3kzsSFtz1f5kBNhzLki0L0clFCmHZQ4LwF3VTusNB
X-Received: by 2002:a17:90b:5483:b0:38e:8300:af51 with SMTP id 98e67ed59e1d1-392ec3a9001mr3689011a91.8.1786452114393;
        Tue, 11 Aug 2026 05:41:54 -0700 (PDT)
X-Received: by 2002:a17:90b:5483:b0:38e:8300:af51 with SMTP id 98e67ed59e1d1-392ec3a9001mr3688945a91.8.1786452113801;
        Tue, 11 Aug 2026 05:41:53 -0700 (PDT)
Received: from ?IPV6:2401:4900:1cb5:973e:782a:16ef:897c:10dd? ([2401:4900:1cb5:973e:782a:16ef:897c:10dd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d5381dd3sm4097263a91.16.2026.08.11.05.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 05:41:53 -0700 (PDT)
Message-ID: <148ca192-52bf-40d5-8ad2-9110600eba72@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 18:11:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] I2C SCL counter updates for Qualcomm IPQ5424 SoC
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260811-ipq5424_i2c_scl_updates-v1-0-bddcb2ceebda@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260811-ipq5424_i2c_scl_updates-v1-0-bddcb2ceebda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwNiBTYWx0ZWRfX3AiS4Jp3Gzpg
 8PMqGC6JWa1qdu2MedonE+LmJ8wokIePCJjimIW0h/62FMdtjsOsp2ePDAYoON+bhUeVKTfPzy6
 ZaCssp/pBEXp4fWkBapMDumafZnvxyQz8yG+MOE/gIMrUYA68Nw4Gmb9qTsCcq9N7Z82Ee/F4yr
 Xp3R6VmN/mPDl+XYH7daAfa4pseEBPCHJAsvTqmzT4w5+yRPT5fOSyMoXXvYPv9DnbJcG5llRdi
 OEebEfKnV3jrJGk0th4Ona9hYtC0aOLbtAEOyXgvuAOI4SMYgnW/0OzQzhBwkVK+zyrq1VQWjHW
 I6eTY0/eHe9CsPc6v63+IXags22qagYMESUv0fbTSmANvhD2hGrMtdVMtTUeK3FQ5U9ankKAcaR
 2dqp6/RTIJ3U1tQRZ6jfqUbsosCWO+NPUhMPwj+JuYbE/MfK4q7gWCPpm4nSvI5+INIQmbGDoJm
 fWsyj9AFiDHqAZUfq1w==
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a7b1893 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=NFv0j6h37eyNFR9rI2wA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwNiBTYWx0ZWRfXxMLMsYWaB2XH
 khoO1PEXAv0juqVNMW8bT+5KJ0o2QkfiPsD2fWaWWa/bAMXx7GQMiEe9QSa8TLLoHywPSXXeCSu
 sad0qjdkdZyGM+RVzYVtjyXo41IBfXI=
X-Proofpoint-GUID: asp4ZjxMjY1fvBh1jHusiav_mZaEg7bu
X-Proofpoint-ORIG-GUID: asp4ZjxMjY1fvBh1jHusiav_mZaEg7bu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110106



On 8/11/2026 2:53 PM, Kathiravan Thirumoorthy wrote:
> To meet the specification requirement in the standard-mode bus frequency,
> update the SCL counters as recommended by the design team.
> 
Patches shows that you are adding frequency table for standard and fast, 
for patch#1, and all three modes for patch#2. Please, Correct accordingly.
> Also, SCL counters for the FW based SEs are different. Identify if the
> SE is mini-core or firmware based and chose the appropriate counter
> values.
> 
Little better, select frequency parameters based on SE is is RTL core or 
FW based core.

> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Kathiravan Thirumoorthy (2):
>        i2c: qcom-geni: update frequency table to fix timing parameters
>        i2c: qcom-geni: Add I2C frequency table for firmware-based SEs
> 
>   drivers/i2c/busses/i2c-qcom-geni.c | 27 +++++++++++++++++++--------
>   include/linux/soc/qcom/geni-se.h   |  1 +
>   2 files changed, 20 insertions(+), 8 deletions(-)
> ---
> base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
> change-id: 20260808-ipq5424_i2c_scl_updates-f1696a0590fc
> 
> Best regards,
> --
> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> 

