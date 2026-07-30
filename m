Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0435E33ADAE
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785393433; cv=none; b=F58Gc/leQei3qGK6zi9xr41t3ym9Ov2/T6AlbGdKC9fUznF73Wtst1qgTtWgqr8kWOL8Orj0Slq+e5CUCZocVIzZI5J41eVMLb8gFLEPY0qRrElZS4OCEiazOzHfWa/+wjU8vsqjQ1WqlOHVebXopnySby3uD1VWaNIzXKy2dAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785393433; c=relaxed/simple;
	bh=143qVcfHrDUndtdM+/SnV2vC7F35FUc3Kc9bqs9KHT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kE2yL/bJGzIO0jB90PvG7/sGimAhg1an+U9JOT/MOVe/5QmQsu4/wbbviz28PVn+HfSo7mYtZqhDiZMHcpqYLEX9WeqbQ29OMH0uksowllgz6FVdiyAaI/nhzGYlGhL7jBmXx+iNfj4fS/cBRtyMySOL3P4xTxrpKa1cvCBxGoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TvszRTw2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EiswUGuR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TvszRTw2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EiswUGuR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U6avjP3729276
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/UOShqbHnV7Ke1cD00vlv35wu1bLj2I4lxM25OdUZA=; b=TvszRTw2kHk5SD7Y
	m+VGxf/yguCwWTSiZg9FVjbmDotbWjZhNkVEFe3fcYTTSXfJdHX3/xu3h4ad2XiI
	2/+yr4luMgp4VF7ak2Vf7iY+8VYLXrtnFBNZVkX6Mio7pwA8wE3aFDZn4CTEBfpR
	Oa4TsIFZ2ptSBS1cY0P/CpC5j++lZ88DjyxD2zatgrHbSC3GYlxkg601imFOyiMw
	Q9ss/7dDPgao5yigLKHGy8PAAoDSz4KVHSK9YR596OUoIRVx5wOVVtIoG3w+hWrn
	aqCC4IohOteltobyui0Djth6C1ELRZwEALlVCt5hsdQWOIpd1I7kkI74ba+i8+Fz
	OFFwcw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr19ag2f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:37:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8487eb67173so3192636b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 23:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785393430; x=1785998230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/UOShqbHnV7Ke1cD00vlv35wu1bLj2I4lxM25OdUZA=;
        b=EiswUGuRdyfj7K6MDuLf4wmn2uQXu0u5uARka1Q2Ag2IYZzH5L3f4OdJTXEQ3CN8Nz
         Ma+kaLH+i0fW4i5wc5N5WUjZlo8/LYX2CkEItKfheTYjgqeX2jz7Np5r6JDPXf0kl5Lr
         K5zrkG5JeYjfHVIPBNhAiqXNgrAShAQqaWTr0QgdoCAK/wTPbdSFvWIo/LQ9wOcEUWTd
         vyh4OkX9JzS6FUqFtUXhUjf97jJxyCDp2n/4X3QwlHc6OH6hgukcaZh4B2eTnDYlmyAb
         FWFvGIsQT1xYT3XMwu5y33v5vEgLiGz6qocFrq0CxaC//ouYFsjsl/lyUYhkyMeIDpwf
         WDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785393430; x=1785998230;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/UOShqbHnV7Ke1cD00vlv35wu1bLj2I4lxM25OdUZA=;
        b=SnKtAJJ5G2Rc0B8FVRCgpOz2AEqOtqErIGt20D75PwVnKPRM5o0q/j2KDQ1lDbjHKS
         LpdfpPYLTDNebMP2jDCLSf3gNaCDz03uGvnPLn//P8wjcnMptY/MWqHw2ykMSiCUvFnM
         joC2EjPtTTOdBljCmdpyYPHi/5iB5VKmunwxNWZG1HvpmVtIJndZkJxYTaCJxOZBgHmp
         KfTwO07xirO3Bj1RD4Aa4pQvs3n3rKZTJTBrQP3x0nbnoFdmqCq3KCXQec3KtGsvBqpP
         BB2GTKcHjjCo5fblRWnAevC10kMTl0Ld7p/d7PugO4bMZew5QSa+rSQ+X92IgNdYs6xz
         ff5w==
X-Gm-Message-State: AOJu0Yye/4cyUFFzvM+9tbiGmMBR6U3P4G5PHJRgwCS3fKi1g+hPxj07
	RFBl+aFBYt9Pe1M1RdRMhDrRawhB82bs5cWVcCQt1OCWkqCvURKLe2lhtxKyxiUDQdiaMOP5jmA
	Gyt+SjJPWqlGhjwmtAw2rK/nCcgrOvw9L/xTPfdzLGx1fxranYJEHloAqbPlfGl5ZlGMX
X-Gm-Gg: AR+sD12qdSslmEU9RGHRxK8tHn8A4O3Ja4gv6XQOzVSnIPZiSgQKNFFdGDf6XwUenMf
	3hOXROgXZyoD5DMBNeuGRKOlz2t54xyNyN5a/6Hfj0kjkG6zw4AyHTOba3RjdDDRf4vl9pIseXm
	Iyr6sXv3V7r0sNg2iLLAU7UY9Q+Bj3CQW1J+ItJ0mU2b79Ofh31HXWfIx2rE7EkGRZT98oUr5kn
	oEUTxUQhrObqZdFdADR0xvEiMP2jfsLXQNtwu8WufmuuL0tEaKpc0bBO5SkgPt9k0f4iH9COIOk
	srbrl04OrK0QEgZgmnrNNtwU//KZk9RzslUpUaOhrb0zRLy1Jc3VGwC4ve/1MLXmdZTTf3DpcIw
	bUkN0eBHWnYzuCTu3+4Tu8sIB52SVCRALDtUFd4MLN0oOXqj6YalLBq1gLnVkjnH0t04hov1KUS
	C7zTjjVJsXCCOu3g==
X-Received: by 2002:aa7:88c9:0:b0:848:2f73:9002 with SMTP id d2e1a72fcca58-84ebc4247cfmr1485955b3a.75.1785393430544;
        Wed, 29 Jul 2026 23:37:10 -0700 (PDT)
X-Received: by 2002:aa7:88c9:0:b0:848:2f73:9002 with SMTP id d2e1a72fcca58-84ebc4247cfmr1485930b3a.75.1785393430157;
        Wed, 29 Jul 2026 23:37:10 -0700 (PDT)
Received: from [10.190.200.192] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0373cd3sm2457635b3a.42.2026.07.29.23.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 23:37:09 -0700 (PDT)
Message-ID: <6f2fc314-9e39-4bf7-b1ce-b51dd564daf7@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 12:07:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] platform: arm64: qcom-hamoa-ec: Verify required I2C
 adapter functionality
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-5-771abd65ee1a@oss.qualcomm.com>
 <b451e31a-cc1d-4e0a-9686-c04ba33720e2@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <b451e31a-cc1d-4e0a-9686-c04ba33720e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA0NSBTYWx0ZWRfXw5Ei2pw8f/Ch
 EkPwnz7XrovUWOXwoswj8MQMH+/h9gMDI/aJ+urbDcn9i55b5skWe6fNW2ZnQeuLLY+ubszqBII
 u3oSR8/sQSaSqNBQj9e2bLkyidaCNyM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA0NSBTYWx0ZWRfX7mGg/BnNe02+
 Kz95sphE7iRovvZTdKf73AMIK+jnPcI5SV9xxQbMLJ8d6RQziW6VCiDGDI5Aql1SQHwyvVJ0Em4
 Rf/YOlymD459AADHCiNbJLSOtXUsw0a2Gx9Vc/vHrbPfFOFIv+svnAwkymbUz0kn6EImZ4bmx1b
 +l3kD77pRhguZrViaW7kxhghrDkm0m2gtZrerXT/7Ol1mQBw02+anGG66A0hx4yWkjwq9LE9oTS
 e/6p7w7AWsGoXNT8AhfmzSfgRU9pY4/DgVJWRBqhAzHuDzp8sSY8Q2rbzu/8/t+qdIN1ysse/WT
 TUESzEyVmKajCEWpf3QwiKZJ+TGflEtd5S3KVCI8Ir2KsTUCvX5tLYB3OXmhDgp+92o9HPsiLGI
 GbaA2uIRdbhw9ZIhMvSBCktuL/OaMhUsH5ofY1nFG1FBgRkfVT3B2qxhxGLfiqdikZ8TXrAUSWI
 aEZCekOPC2upuKuzdUA==
X-Proofpoint-GUID: TRzVmq8o2K5aYdSbu7mya5SXjG-yQrFt
X-Proofpoint-ORIG-GUID: TRzVmq8o2K5aYdSbu7mya5SXjG-yQrFt
X-Authority-Analysis: v=2.4 cv=RPuD2Yi+ c=1 sm=1 tr=0 ts=6a6af117 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=CFGf0PpD_GUA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EJZTz2ZzxWxwHnGGTj8A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300045



On 7/29/2026 4:38 PM, Konrad Dybcio wrote:
>> +	if (!i2c_check_functionality(client->adapter,
>> +				     I2C_FUNC_I2C | I2C_FUNC_SMBUS_BYTE_DATA |
>> +				     I2C_FUNC_SMBUS_WRITE_I2C_BLOCK))
>> +		return -EOPNOTSUPP;
> return dev_err_probe(dev, -EOPNOTSUPP, "I2C adapter missing required functionality\n")

Ack, will switch to dev_err_probe() there so a probe failure due to
missing adapter functionality actually shows up in dmesg.

-- 
Best Regards,
Anvesh

