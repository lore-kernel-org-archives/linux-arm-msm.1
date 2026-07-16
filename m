Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE39429CDF
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784224371; cv=none; b=fpbgRHpzfHOENOpz56I64OH3cJTQo4pyx0YSqKlD5WU5Jtx/0x/A0INYS3q8cTXrSz622DwMLajJIDqgxn1n/FXDRZxZ5rAgwQFMrIB+1LoWCcg7FUq0tIha6PGXkb0CRHs71wvl6ZN3SC6OJ+/hkCVR0eKR/hslveLUPVnA498=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784224371; c=relaxed/simple;
	bh=NZCNiYO94KvxuqiQja332pdoXlvA9ioYr+WhJl3k51I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUzC+pAa8qEDTg/OlkNrZ1RGpxddvpvWLmKXbyVNgyRbWon4gpBTJWB3BYf24T85hGirmmJxun99nmwhp8lomouKZ8SfgToOl//j5Uvl+vRDXR+I6bXtdktH7jPDdG2kIwVvsJzo+YhFRl6FHDMUW22fsMHDraFLFU7DVKFNxu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hNv5KO8a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADNVFIMR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hNv5KO8a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADNVFIMR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSaTR3274377
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gw0Z1SHVJFulCM5qmhp13k8lFUDxKyCXU7hcyfpRyLI=; b=hNv5KO8as1Wn9/Im
	tAQFXR5T0bEUkCSG/2enZbrl6GXyJAyQZymCKMm675FWCkPO8s/U5iF4cn1k5IfW
	m4tENieCARqQB7BIxdumj7mZuEgPzs4CPB35XBndyYfNpqViDZLQo4f8I6sWJa7L
	OuXnotAIRbSaZuSiZ6HghlZYgWdeBdmfkUYTI9Xjtv5hkJ+EGr2Iw6BTC5x8YSYj
	Gch9K5Db+Kch03UBRo4xXPGXxtumdSVq/fHArv3wmiY5XkGT3Q0TwE6FosdKO6Tf
	gMl56bVlUrlIlWpuH0pvvIAMJhplUfBiR3JQojOLFBDK1OOYcEm9OPnZA5O13jJm
	2lH85w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2rg9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:52:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51e9d892f0dso3608701cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784224367; x=1784829167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gw0Z1SHVJFulCM5qmhp13k8lFUDxKyCXU7hcyfpRyLI=;
        b=ADNVFIMR2GJ9UZzWGylFkBguwFJMgCm1P7ZEsRxGPNCtMr1evAy6Uxu6Er8RRegIrc
         zDaebEKe2Byk14LGd7pnMzTBG1g/dc7DpRAsL/NSs29P6X/WOH4cHsRb7TjfDNHffRLS
         7aSGqTuvyzqHUcUSZV9piPa08+mJqrx/jMe5b6H4iB7+vK8HY99sZfsAA2GfZEBTGzMz
         GNMlvS+3jOf7nyhYRzocalc50/qeyqbc9Bp7aLiRd+4u8qND3KI06n58x9GUCAqyI5VJ
         o2U9m9JOdEJy3vhxO3PIdUliHUSIq96ieW2i/Udq1NSeGFpvbtPM3DI35A6q7Pw8cP92
         jqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784224367; x=1784829167;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gw0Z1SHVJFulCM5qmhp13k8lFUDxKyCXU7hcyfpRyLI=;
        b=L14daTBWKFUh6pdQiqdVphsPoy4CLF0tyivEn9MP7detyfkv2XhHE6zlEDBBSKhcxS
         K5tf0+T0bz+RzCAzjIn6JU37m8qw9Cj3Wba+b/6US5MnBvJOITOnTIPXnZWmK9wLHhU7
         zpA3XMEUf8gppI7nMKh1ZUSOytlPqSENyC85IAh2u+AHzXSCxxzWrPNTUBUlVuYMC75X
         p69EzKPixuLexKiWnpDyxhPR7ANUneW2Qp5TG8qk2k61pELRz6soDuxiPU0AqjJWTPoC
         sqIcA2OgK1vGUzkY3rAjFe/cDi4X5bgCUpWz12HgqxjEC77gv9Cof81M01uQ5i2ziLMa
         ryuA==
X-Gm-Message-State: AOJu0YyBQIEl03Y7DkVB7ylaDnWx3cuFLYJrwVzsD6K++HHkC0mOvraK
	DQL01x8kO95cVgnmwfP56O5NqeotEGLxQiAMuDVZsr6IkEmYUhIcS5azzbk6jCFdGPR2EAhiNUL
	A3Ekzk5dH6iBfDCihN/ZcCDD4LP3de1e0kEdcvPAwilHhsF1y2tWNusZ8jThTeNakHJPZ
X-Gm-Gg: AfdE7cnIbtJSPaxAQaJu/BrMvEg0rND+1dDaAgtqDkk7bQ2SilRAUltVx284jFypGp4
	mnnyOUUa31zKh10uuxGU9/RL7G79esfpvHkZ4OiJqVo6hIoQFV7cX4PueM2GzjhjRW2yYrHnm6e
	u0ijV68ufkIZ00MRlwnKNWBufa/Et0CRKFsR0fPeZhPx4ik/ZkXpl3Qe09/HGGkPmZP82nS6qfz
	KQTTGx4yQ7m1FY+qav1Mzg7YV4VUh33rqqafcWjRFofFB8zSQ6BcoPAy8TwvNd0NH5JjPLNKult
	QWZZWjROLARJ6mV3GW7hRk/czjrYgUqtwSHOLPAzNWznJBuvOFuuyKdpdVLGB0WIoLqp20VXbYy
	aEJOvD3BydMmCme7vZvWet1Yj
X-Received: by 2002:a05:622a:55:b0:517:6162:daf5 with SMTP id d75a77b69052e-51cbf0e6270mr189443401cf.3.1784224366759;
        Thu, 16 Jul 2026 10:52:46 -0700 (PDT)
X-Received: by 2002:a05:622a:55:b0:517:6162:daf5 with SMTP id d75a77b69052e-51cbf0e6270mr189443181cf.3.1784224366386;
        Thu, 16 Jul 2026 10:52:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168749d7e8sm245027066b.54.2026.07.16.10.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:52:45 -0700 (PDT)
Message-ID: <2dbeef11-9572-4008-9171-fbd075f5a459@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:52:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: ipq9574-rdp-common: Enable quad SPI
 mode for SPI-NAND
To: Md Sadre Alam <md.alam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
 <20260716-quad_dts-v1-1-74d86792944a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716-quad_dts-v1-1-74d86792944a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yrDbYX1LluTS63FYvacftoAQ9fjIASeB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4MyBTYWx0ZWRfX4ijsj7vzix8h
 JpSdazQkwthMUP/7DDCoSlJ1D5a2z39iNis/FeSzuMWne47uBHszfLqRH1oDEsbNJImI/Jfxb4N
 dF9WBAOs+WlqsL5SLUOk0v5vfHXOwBY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4MyBTYWx0ZWRfXwjLU0gWREBHZ
 SKrM1/PDU0nuh2iQj7bUWOjM5imrBga0R+qUPyLU8d1qU/GvUaFVNjzjMa6ZfPI9g2o5wxxpbOT
 bKXcWZkeaZyWLtnxbCpweT1+K/1qaY0kGsJnAqSVrLXy97Iv+QkmmpLaND7JoNt6cuvQ1U4+eGH
 yn0Hr+MNEQVVY2c4P2DC4fJvxDVVNIusjaSEH3kR902xkFSxX1bnJcqDXjtS6rOgzjJjB5DBYX4
 SjyZqlB/PxCG83wsaqpb3fL9Vlzdd7x7Cenyik9eUmcpqdx62BdAywE70MnXNXIf8ffYXb2pTuo
 fZuG57y6LulrwfbtBW7W9aX2Q6dOIdHnl7LtzFQ6KwPUyHZt0ZMUYQSGWij8qzRAdeQUOwdKh6D
 zeZ69OAB9iEvJr7S3AhsTg5Zp2S0kTuVTaTh0gxSDrz8h4P4olE1dGoShAwt2WSaMBZmroeBxyg
 cGUBF90XqX6tXK6gS0A==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a591a70 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=GgUwph42HZ_mPWe1onAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: yrDbYX1LluTS63FYvacftoAQ9fjIASeB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160183

On 7/16/26 7:55 AM, Md Sadre Alam wrote:
> Set the SPI-NAND device node to use 4-bit transmit and receive bus widths.
> 
> The board supports quad SPI transfers, but the device tree currently does
> not describe the wider bus. Add spi-tx-bus-width and spi-rx-bus-width so
> the controller and flash can use quad mode instead of single-bit transfers.
> 
> Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

