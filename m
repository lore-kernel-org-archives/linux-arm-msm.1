Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0008481A89
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326931; cv=none; b=WPl1rzBdBV/ee2ALNP4Zs35Bc2zAxlyugMA4OSsNDE0nW9Fz/ZkhlWaIMvK2QTjwATGK34IE6v8sCyIYneq23pFnI8VACPT7umGVjKPPRdhVn5Eg+fmWnMnjFlkNsUBXNPgkw89bUwCzVzxUxZ16YEW9ZCdVCBnaN4E9s1KMZyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326931; c=relaxed/simple;
	bh=PTACpgriF3fXFc1znUvCKOHkbE6BdgVeSMikchLtn60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LhTN9YoIiS2Jj2GH29rM11Sch1p8tAoeZy4Ds2FLZPLn2F5GM/qWbL0K4uV9CuU/ph9Po4BmXtyqni2kn+rwSkIGw7DPFqqoCXApZwowT4RJF4TAc+VlFSlnggkHjLGR0Bgx7rJBDm4pRSqZMwH7J81apbTYAlA5b1fMst+yUqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MJaypqnL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUW05ePn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJaypqnL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUW05ePn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBh2qQ1724493
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhc2V/tJ39Cxy8zcEAYYMH9/BpAcMyrPkXXGKtbgZGw=; b=MJaypqnL0eWQCXCd
	bcKIJi49b756Qvvb88O5tAGJreZdpY794n6SI+l+2i0RXPnrkFm0CtuS7UeckuWf
	c3d9XNpE1Hg1xxx7jsdkRAOil0hTNARU944K1yqimn8NH+EbwqjDNdZymYpbsDQt
	sSGThJfRCCN7lNoNa3+FbEiAnHoYCVnUnHwcqNcni5PgCM2l+C9+ELEk1h9pY/Qk
	PLW3ViXmSwAV9C4hdT/Q24ikwVb0vPyyw3CkzBQKmwG24vY4FbH2UwdkVGw/3YhZ
	OuO5MFDuk5YPUtYPVOLxJvxHr71Y3Nso8sbI778Y7pgx8xhrjTZUZiXO+0WZLk7j
	9ojSGg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgw0g37n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:08:48 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bfc23053f6so15974e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 05:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785326928; x=1785931728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhc2V/tJ39Cxy8zcEAYYMH9/BpAcMyrPkXXGKtbgZGw=;
        b=cUW05ePnFGQ3LY2KR1PWd7l5UlHdlNYYIRmBQKduu36gUkF7EnAW1/vabJmk0XIbgD
         58LPHvqm9OYMst+2KDaSGKhCjdYqg1Rkw6urMz2Dir9lG0CGPtEmY2QXuv6+8CT2EC04
         p2C1RbSKCX1NhHQEumRFnsaQF56y606/mQGLXUF27zLKM1xS3Q0J7qtecOIfQ5ps8MYH
         DhgnvO2wkTDTzZyFFr9/CVeGrHIGQ51t9+AcbHqXIXq6WfH2Ty9wGfW/v0rGCE+SIIEo
         tDd6U3qvT00xcLAEqIpx0HPNSllRWgRZwVpXGD2rdW7r4mQDh93FpabZrxaeeTQJYPIz
         ejTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326928; x=1785931728;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhc2V/tJ39Cxy8zcEAYYMH9/BpAcMyrPkXXGKtbgZGw=;
        b=JeV35rzZxgClOtd4gtePBv1R7BvcgTMujvALv5UMGKmKUw53nhP1V+d5oLmE7WRSSC
         r4UvxtRQPKVoU39ULb2xTGTc60mNAUl0yGrj9s39spWm2hzYIUhrbhr+X4wgfXXeHugQ
         QdQ1mLPd1RfgiuDveX0d27V4ajlR+56nCgrAqiGNANp4SVgfaB3voRfQSE45dHm/8Vax
         KIn+kjdQ4WMRmKnVJq07Eb8O2ygkBMwZrk+rZuj+fyRowQCQ2y9CaogCEgVMOLsIlUFm
         xfTqvXFF2gP6GO7+lM+5PQ5CHq56p4I5eEKS002x66jNxD/49nph7sfyF2iAdDnNyYjs
         A3zg==
X-Gm-Message-State: AOJu0YzJG1lHqLfh4SMoAXR9ZfNfKuO1ltaj75DJcuwyUVxageWBpqXy
	oE+wFyDvcPzJeLJiSUAUrH6CenhAc33PQ8IHMVGIv0jeUIOyL1LawbsED1u9ZYlSSddxq8Fq6+1
	/5QVQCgNRetBX8O2oq1rCN90bnGsTvcz4SZ3YvWAMytj2hDEUzakYJF6IvJVD2b7NmztV
X-Gm-Gg: AR+sD13T0cTC1SjQkOqvAN/b4NIMUBhlWJsrsWDcGvA/fgn+p0C7Inirb2Y2nRhBU94
	rCiJKXXi719IpiJnxcMvLBAN84fvF7FH/JYK7AuClTIJJ8zFgM7qLLjztXWUUrGqBBJZBGT7UOj
	eRNUEt2c+dUbilt/TiFDa/KFRc+zIJT1QHLptgGxJZOClDRG7Yfia6jAHK+lodTXPIF7XU+iMo4
	q8wr/lC7lFmhK+0A1LFbMy1FvWk8TpJQ6BPe+DZPEMQBapn/XkX8g2Rf4VVubqNoPhJKCuVhSgC
	97+xixl5Y1xpdQ/pUpGPOUf8xElYb+WoJLgLyCiNrpj8w0Jq5NPOP6emipjdlO2pcRjUKp1GgiP
	obw4iXHA3ttMzXie67YQFKdSs
X-Received: by 2002:a05:6102:3f01:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-7549c77cc44mr1326091137.0.1785326928125;
        Wed, 29 Jul 2026 05:08:48 -0700 (PDT)
X-Received: by 2002:a05:6102:3f01:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-7549c77cc44mr1326069137.0.1785326927671;
        Wed, 29 Jul 2026 05:08:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050bb9f06sm746967a12.3.2026.07.29.05.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:08:46 -0700 (PDT)
Message-ID: <11f0df89-8bd5-41ed-85a3-b7164123f8f7@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:08:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: ipq5210: Add nodes for multiple
 peripherals
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com>
 <20260724-08-dts-v4-1-65e61a1061f0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-08-dts-v4-1-65e61a1061f0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gI2ipXqJ1AL5elIzzOsY54lgF7-WKyh1
X-Proofpoint-ORIG-GUID: gI2ipXqJ1AL5elIzzOsY54lgF7-WKyh1
X-Authority-Analysis: v=2.4 cv=AOkSgtoa c=1 sm=1 tr=0 ts=6a69ed50 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=f3PlIj8-Wq_HpPfY3gMA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMCBTYWx0ZWRfXwo7bgElyY2Sz
 H2NIgpP+1qYrAtVNAe13L38Oc1OpkXzEROwSm0iEHpr3sd8Z+enL5aC4Utyzw0tPtnqjzRxHw30
 kA7LMDi23d3bK8Hpecc8D3F81QAxZb0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMCBTYWx0ZWRfXwFt1YkOVavNA
 ZAgVENUaTGCvkgxiPX1P24t/ihB/8eGDu9wKIhp6EDPz4HqlIF47UpkUVm7ZVEKnvtc+6pSE9Lv
 kxu9LDDO9bwL8tscg9ZVxULDiSdtQNGPE6JrDGC/YRfmx0k4by33i5EWWeEoWYVLN9ACOS/V+MH
 +WOFbL2UiBWWG6rv8trU67e8uELRkWctx2f6+263QdSFfbxIK1yDmUqfnDWHAUrCV38icQopSLd
 HCY3M3o7B3xFQJmrGMNgTVI/GQbaE8BcGGXTe5+vm7oHARWF2Fh+e9GV2SMfvv54Kx4gi+cTYW6
 Kb7EvpbGGO8Qec3hzaOdAVEkR+m/SYnR8PBlHBM0A71l4z16F7Vom379lOF91PaXeE9ydQsmMgH
 YR+doWp8iLDVQg8mv/Rv28Z6cV3rMBO5OwnrooJtLPqS9TuMHYn1vQhAIwBFOu6+1JQR2uAShL4
 HBON/FWCexmoOc1hu7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290100

On 7/24/26 11:54 AM, Varadarajan Narayanan wrote:
> Describe common IPQ5210 SoC peripherals in the base DTSI so board DTS files
> can enable the hardware they use.
> 
> Add nodes for USB, PCIe, QPIC NAND/BAM, QFPROM, TSENS and thermal zones.
> Also describe the CPU OPP table and CPU cooling cells needed for CPU
> frequency scaling and thermal throttling.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


> +					trip = <&cpu0_thermal_alert>;
> +					/* Set maximum frequency as 816 MHz */

P.S. This comment could go but anyway..

