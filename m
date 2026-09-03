Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CC54D8DAC
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 15:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448898; cv=none; b=jAQH4MrEUhlGgZOJVFZiONNS2aL0wHjLKQp/tGRYsthfoHJLR0buqqM7olcJDdXf9rYJqvXMFZu5J2R5Tgs/HsM5Yi9kxn9S/CAHztcNqpFa6x1Vxn63QEaRL3ombvv7bDLXdhSPe2Shjmf6YaYbBLi8d9nmRs/q+yhyHQbbkMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448898; c=relaxed/simple;
	bh=AJRmnZv8TBL24Tq4Nk/MVvTyAGNJB3SKUgQnbs7iPxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJVKyr2hUt7qrQDITsdoEnQui8sklE36qTtGAWD1j29xBERknck1s61iN68hoH+QuM30mV+T5veOdtHLX6CIZLGWPLgt4HjnACHXM/2/b3R+xc8138CyUClmy1E+z8j9hTlW41HungHkpdm2Xbu95Y0DIxY3NBTHSHEsKNZnx1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VuImJggM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZiDY/CEX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VuImJggM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZiDY/CEX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DALEp1705133
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 15:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MDXm9sakiTVow2HHdoD2Gmx3gY3Rs3Pfdamjmd0bvo0=; b=VuImJggMuzKB4UNo
	4VSWxjGM0gt7Rnn7mxvFDlGUG9Vjfux/uR55j/BDqogQzf7KWKHUgkGkxQDFV7ii
	EDGnXWpSAsTTwy0gK7N/X39QdokV72HJAawjGkkt2eV9NmN8NbhltQEZQRFImDlJ
	KdI1CHq4SFfk+9wveFkZq79j5+DHMcPjouWifhq7uTXOu+CR+beoL6JXTuSJC0Mz
	16kzkMiBVK4GB6XgkCQqBc5vSixcfRPPe+CrXIBYpa3rmNjt8Nu8UDklfqF+wd5b
	1PB7Nedvp2Ca5bqpSlHTbW/EcdagcwxyZVGTBykfaGXCvT1uv2BOzjVRvhRsVesW
	EvgsEg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b18mpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 15:21:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f75c1219so49976185ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 08:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788448895; x=1789053695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDXm9sakiTVow2HHdoD2Gmx3gY3Rs3Pfdamjmd0bvo0=;
        b=ZiDY/CEXieVktWWnLcOWtpqNcuF7VQBalbR+hLQ6BKG30IkoJCeW8G13jHMmkGleeR
         H1znJljFJO9MuWbcuoX08vUbD6NDriolInUFAh2znJiq074uaBEVtwU6M/jvpxXuGcCK
         nmncnxPRyAj29NEQ4sKyPSb4LDOTIUmh5v7ObzwSj6N/WPlNuqhEd9kasrnLiT5TWumM
         Lp9biusaCqRaJMN7lkAs3bRVJlxrh9+2pEYlWavXKfUYGJlwXGBVmmd7/CjFjEB/TrFp
         cPC79J90otBkFQotI7nzGawaVLp2OFsMVLSIrcxZE9oK2ZzOOATkkJAT1Sezceg/M/av
         cboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448895; x=1789053695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MDXm9sakiTVow2HHdoD2Gmx3gY3Rs3Pfdamjmd0bvo0=;
        b=LpEZDP5pnTIG0C3Dp9X2v4pHtKYbTeCO9C/+gSVNXts2VkxMWF2vi3zWam8HuYt+JQ
         0l2boCE3B9rGclKt1kivlzOu+eULnIsaO5MZj+59sp8mwQaOr80roIxnlwPBHTI8eWd1
         8ujp757UBoJi89UviODvLFyKmUrimZJU7+ti6Q6r4fcmxZrqWfhpboMqs2wyI0CG5opJ
         BkYRQqB/UNcmL8xAVy801P9QUTYcOTfwuw/i5skgHK1Lhf1l/VMbQV58A8ujPzBl6GQk
         BNQkL2mPR1ywLfR2vsIqigumErriGOeUXlUxVOiJ2dFlvOqfG9jUl8OrXjIxkzvfRGjr
         ogcA==
X-Gm-Message-State: AFuF++mJsY0HD5MbsjiujXLU2qz1qrZbELzMqq8vZ8elNs8nRxgihNI7
	fzFMUiGReEqA6l4ZB8dgJixu25VvXBI+Kh10A6KcibCdCvI2lz9xFAEeKTGo5V/L6mur6LXr4wC
	qcSKRhDqkRUwNNQxruJ57PeeF1Gmx5gNLjCzPoIdJgesOnpLHMNgrHL86uEn9voj6Ly5d
X-Gm-Gg: AYBFou0DYLV5kxX466FM7WOMu5KnMK0T2K58D36Du+U50nj3elxhrepXYo1ffg4TN8n
	BZUod97NG9BASCoyWLl8CmmcFkT4I2Cfm01xTIpX6+dozlRjJ6Sr67yimFC3GQI+LL4449vntmR
	r+SxUp1EgUv30zdXBgj0JESBMumv0o9WWloHzIrva1tnsaqZwI5gGVl7PHILYJ2fKhcAAD6iik9
	DFLUDMG2o0ikaTkONS9Y5NmJ4Yu+EYXbMyPSdpkYaWyFHEsIxdORlNB3ZF4LBf2IaziklWL7T8L
	hsq8U5oTA5WULIlC7tJScQQxm7+0I8/UTpLoEhNsHgYUTrKMxMX/TacLmcDrUrx0VXRc7wuI0vN
	cOzf8DlU9UJtEylZYGcufl+OAsEcfjunDg8uAgf3Cp6nkwyS38GhAy4PRbtkhsxy7
X-Received: by 2002:a17:903:22c5:b0:2da:eba4:b640 with SMTP id d9443c01a7336-2db10518c67mr5530995ad.6.1788448895641;
        Thu, 03 Sep 2026 08:21:35 -0700 (PDT)
X-Received: by 2002:a17:903:22c5:b0:2da:eba4:b640 with SMTP id d9443c01a7336-2db10518c67mr5530325ad.6.1788448895091;
        Thu, 03 Sep 2026 08:21:35 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe62d8dcsm11883625ad.26.2026.09.03.08.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:21:33 -0700 (PDT)
Message-ID: <75246b2d-4787-4748-831c-d66e3b42faa6@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 23:21:27 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-7-21c3db378611@oss.qualcomm.com>
 <7e32b791-b27a-4b0d-8143-ff4eadd11fa2@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <7e32b791-b27a-4b0d-8143-ff4eadd11fa2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GruO9l6oKItQ_VA8U9okOIMIl68cKY6u
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNCBTYWx0ZWRfXyextNS7Rry4e
 ZF/8MOGHxBAsjbDqFXWUw9oQmaQrlkg+vw+Vb4JejjULbXkYXehgfBHQIb35zUxaFVrYuD3cqrM
 QjPrSufetwt2bxOcEJH8WIjNktKRVPA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNCBTYWx0ZWRfXx3SrS6KvPMMC
 xfUO49ejP97VBPzJ7u6oc6E6bHS+KCs8awpFmMhgR6/zT8DX9h9NhDVbs+QZ7ygonc4jE8EJ4Uk
 8ix9c1iwhybUvsDBSKsoYhOJr2mGxN9rBN5nIoEHFvVMtWSK2DHvbecUOzf35MIvdvd96OQXCbt
 aKkNLT3D/VsSbg2hV8d33wLpIzW11gdwKaUkz03M9Sr4Npg7I1YFxuZhtEIN08SKw5nDzvBvHY3
 i7RUUs5kdL/w2Qrg1VNf7EA5oweUGrkRdsmm27demB5QothKXP+IR+L30/6qqFRRIRAMb4XHXLl
 tuRI4rhnEdXq+MjCboBps0tXh1jDw0Kd5O3nb/531RTstijPWu3rET4rd2vgqkOXVX6zdsIMsuo
 dNyV2ezTEOT5GnqJyelSQhKnUBEQCzHvYzA8Gnsd6Mt5Q65xQPU0D2CU/5krLiUFplF62Qx+Ami
 lBOATBUrnxiAWGyuFpg==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a999080 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=eyD6XQoqffRT7lHHdTUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: GruO9l6oKItQ_VA8U9okOIMIl68cKY6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030134



On 9/3/2026 7:57 PM, Konrad Dybcio wrote:
> On 8/14/26 2:48 PM, Luo Jie wrote:
>> The PON (Passive Optical Network) reference clock's parent is
>> cmn_pll_div2 (CMN PLL rate / 2); it is then further divided by a
>> configurable 8-bit divider (1-255). The clock supports two modes:
> 
> [...]
> 
>> +static const struct clk_ops clk_pon_clk_ops = {
>> +	.enable = clk_pon_clk_enable,
> 
> clk_enable_regmap
>> +	.disable = clk_pon_clk_disable,
> 
> clk_disable_regmap
> 
>> +	.is_enabled = clk_pon_clk_is_enabled,
> 
> clk_is_enabled_regmap
> 
>> +	.recalc_rate = clk_pon_clk_recalc_rate,
>> +	.determine_rate = clk_pon_clk_determine_rate,
>> +	.set_rate = clk_pon_clk_set_rate,
> 
> These seem genuinely new
> 
> Konrad

Thanks. I’ll fix this by converting the PON clock to struct clk_regmap,
setting enable_reg and enable_mask, and using clk_enable_regmap,
clk_disable_regmap, and clk_is_enabled_regmap for the corresponding
operations. I’ll retain the custom recalc_rate, determine_rate, and
set_rate implementations as suggested.


