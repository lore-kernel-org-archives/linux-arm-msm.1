Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2843F86E6
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 12:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784292897; cv=none; b=S0pQ2BLnmd0HJJXLQCdiKKZKGl6hpp31D/XwBUFDwAniLOLPyQ7ygGLkwk3rDNSZUyEw+9bjicNxJqpyH4Xz/V2x7pqiF9IY4Yovt7mCURRbvOUjzbeamhfWPaDFoNn5oylMd4+Cb0x4c+hKoMfXlEKsmzSBrLlztsfPWc0GrDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784292897; c=relaxed/simple;
	bh=FMQbLCZIVBlFvilgBWXJ5CXf6kwmbRy28h87UQ9QJMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EcuE9I5mSPeHWLVnigu5K90iwt/3ygYsHTA/I9dELP+asup7mS+Wv10/P6klpTVeUklgyeiM20tJVsCzn6wezpdtQGMT87Ogk1Baw0ADAWTuIc+Gp5CPRbtIYll+7txMruyqqN4d/H01FQ8DQJ8rymxPa+ptb8E4cV/DnwmvabU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRrKUIGR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LbqOggp0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRrKUIGR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LbqOggp0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HCSnva1883966
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 12:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/I/1fyZeVVo5EmsKe3AogbAV9WwrxlVkfS7F6TW8TAY=; b=PRrKUIGR9xdwudUW
	9fDE/gw5+B+sqwu9jOxj1pQ+tX4fy8h62bDQnkrwIMoDDxSoDsf2VO3CKerPJg+Z
	uFo9eEQlMlL4VVUFVXPt0eihD/aOD89dLS2bbgAaRqogx4WyuQxmoISfpvzW34ic
	3dKehvy6AXVW5nqSf4v5pN5EsGJlZmXd8lcvI6O8h7mQJz/5QRvCybEUzpVlXfTi
	wQ8ndfqMGcVF40NjoIBK2C8ZwB6ZQsIKEMA0a9nAQjIOPtqmAcTJvpCk/GSGx3Gt
	gv2aO76NZGesmji9rJrJDy8+TIQn45/2qOCyO28as980xmppQNO1tYyB43YgvCVJ
	sKh/JA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfgqgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 12:54:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e57e56ce9so155445785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 05:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784292893; x=1784897693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/I/1fyZeVVo5EmsKe3AogbAV9WwrxlVkfS7F6TW8TAY=;
        b=LbqOggp0+FxCSt5Ni/qk3dIn3gJDIfwCE1w3Zh3I14z4XmrHaiPaRQdSQ4z2Ex7GAo
         gGz7w9JSnVUymk/RG186WG1O2nzaAtrPScI9tMSU2k2liv+QVcwE70ixdDPhopY9e4Ot
         H18PqJNC/zvfqiewwifOLdpS5BJLMGzrOOL+tw182o17srIOqfU4s7AI1ZP6hj7sPhfU
         uxMRCpJ1SnealobJFxs2CDE2z04f9ZsujIXNZnpzYKpf+w9KrnZyaCEIQtsdv/o1OM4+
         ko7JcIlnLwPt0uVacwqoIE8+6TJxmsGLlwoC7kej189YufcXrT5LZPnNIcslWoZxpjG+
         8Sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784292893; x=1784897693;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/I/1fyZeVVo5EmsKe3AogbAV9WwrxlVkfS7F6TW8TAY=;
        b=Hbvh3nPuy6yxG0SNwOrdtJKPtNXiyjN8U+oCZxn8xb17nLv3G8L/ZlL351FQaI8Lov
         M6iJ4kqJsJROXjlXQ2TeVUDYOpJaURqvor3DKwIhLimcm27P3RRfFHMDW/qffUFEfiNQ
         lOXziMVf1Pzwb//gxCpVNEsuhybX1C5451UxrPIO7LcRVmhE10ATzu2o32lKQvR2zl4o
         NdoTW2eWjFEm7h/H7wxjHCyDoAMkfI8LUZLkcwQjiLVG6vuIP2TnPw0ESiYidssybNeL
         qPthGN8kXBaUGIrprhYI2Eisnc6iwcTXj9MV3171O5hx+ym/DtSZXlQhy65kWy7fUUkc
         PWFA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0vxCnWGszRLu660OHEMcaPJNh9Tv4j7s7cAqbu7j0qNvWbwz2DiGKf2tTxmcBqpMl5Iz56aGdFqrKLu5v@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcb3suQvia1hoI6XCC+tjraKAuQA/gvvkfPS4kstCBHdBcMQYw
	usN4J2Rypd/wBNRQZtUcHfstcFWthTed1wsZVb2Ai//ctWg1P9LYm2BobLSVceVK3Qomcrf2skj
	EAZhaczGVhZm7mbtHqFO4HkiZpKx/aqHNQX8K6CaqRKukzecjHdE+BVY08NwbncfF/jFn
X-Gm-Gg: AfdE7cna8eyXCu0HnXzQ21AV9ARX+1foRBUyDRdQbNGkhBtgwd7NhxXQpKOd+ptLkYh
	BC2UUKD3gkb8cBPJeuk3MB+EYfl/vQUPaW2hdrT6YBD8vQPlhoG9zYpoUt0JDBBJ8AtVuA+hpxo
	xEiGCmfsB1rYkSZRYFJ3Uwuek/t4vVMoonimz/uc3fVe9wc8ct3a1hB2Q8bB19HJ7LKtXBY5XNj
	zDHjy6o8MKD4XTmATsw19dBqmO9YgScyISTkrNa5tkvfQVFxUWXioB73XJ6dz9I+7dfE56Yf6is
	0DiV7daJ7MAgQojZI0dqPC8znDhTZKFWQzi/X0IdA9UuOrWzmldAItMDee4X+y+Rsrst0HJKD0n
	geixISdAWjs3R2dYqD3FV3mFS
X-Received: by 2002:a05:620a:2711:b0:930:aff2:b1e8 with SMTP id af79cd13be357-930b433be83mr209107585a.8.1784292893667;
        Fri, 17 Jul 2026 05:54:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2711:b0:930:aff2:b1e8 with SMTP id af79cd13be357-930b433be83mr209105585a.8.1784292893257;
        Fri, 17 Jul 2026 05:54:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fee3304sm673740a12.5.2026.07.17.05.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 05:54:52 -0700 (PDT)
Message-ID: <e6a6c504-40f2-4510-901d-77d88ac4ac5c@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 14:54:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/14] arm64: dts: qcom: glymur: Add iris video node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-13-8cf2cbe12a07@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-v9-13-8cf2cbe12a07@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEzMSBTYWx0ZWRfX41MJyDSohFw8
 KWswBXaJZOuVVboLlhSQok/2F1EgR8hQI3q8XtfeVb9Y2hdCxSbFWpQRjV2loQkQw1l5yIlKEKh
 PjXzhR95epEngunrAapn0IYmfDSMnnYnMQHBb39g8CqP0IEIc4UqeJ4jlpGkgWZDqVvKlN26KAL
 zvCQGTAy1Jv1JrrsCkFLboeiF6xJNIn2xJYDpr6Re6jRTvQIwxvYjfAYSO4xtpqn54qbGrYQayb
 2wVoqMTfMkldxIhXZJ09IBS5P0krrmsT+x5M7esJXDhtICrz0BQBICCDiNoPtYVcbPm00qIvXJK
 W27fQO0oNBE7nDzFBnh+a/shG5OjgyWrLjgGmyjDcnhSeLLsQZTLTfgAc5R4apgbUaaVFbcrmvO
 ImgG0WyYGLvYX+aJRAe4iem4ktPpJYLPc1pJdWtBTRFSd0AAsA6MkPnfZEC37TyeT/3HjMeRgCS
 Xvc3XouZ6fU7lQzHwaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEzMSBTYWx0ZWRfX4pIKJ+JJfPZq
 eGYUkNj9N2k4k0FuQMGXwqXa+/M8SdmlZgzwxq2FoNI043L5+8hdjtzlpwMJEcChz3hI46VM/sE
 5S3qDaGJvHOnGxfgsm14OVScNjTRYpQ=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a5a261e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=xYufHl49NKEuV1FEiosA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: YVCsCzG3OprLHyHbexI0qF7LINqVFQTa
X-Proofpoint-ORIG-GUID: YVCsCzG3OprLHyHbexI0qF7LINqVFQTa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170131

On 7/15/26 4:10 PM, Vishnu Reddy wrote:
> Add iris video codec to glymur SoC, which comes with significantly
> different powering up sequence than previous platforms, thus different
> clocks and resets.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # X2E94100 Asus Zenbook A16

[...]

> +			/*
> +			 * IRIS firmware is signed by vendors, only
> +			 * enable on boards where the proper signed firmware
> +			 * is available.
> +			 */

I still find this comment not-very-useful

Konrad
