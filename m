Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482850;
	b=oHV8td1y7JVpvSQX/NHTNfy+rWAFchIgN2dBmR6PkhM11K51s+CvRexwca45smJA8vVk
	 m5HdnWFoN70TBDDrk1d9GKfMWlrh1/zDt3KbhIn49Bt5743SbVB/jaJDPyDVTW4j1D0wh
	 ay1tnPTCju0pkE4SMZJ0foVeWUqEon371CH05KbUPfn3H29t4g2p/xoVBE1tkt2kbh3/8
	 Wm5OWLt6tAa2qlca2xKi1HoI1kaCC5+WAkaZpQOAkjGBF58II2Je0ipDGIPxBd+3D9XXo
	 PzySO7/v7/Jlc+8TbvjmmTfVPkRj7ivoymtu2DFtoDCaDs70JuJypp5CfDAHu01m7Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482850;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=L1zJJ4fGyYwiUZN4gA26Z8ebgEKXLwJ3LM/WjuTr6cI=;
	b=sl2giU5ks/Q1IY9h6fLEA9XxUH77NSokuw0igdkXZRdZGbZCqBZDxO6KExpOC2xOSxz9
	 7zPGXlghgshLqVprecIll+GVbjnLIJebeAO42RUl0kWpk46AA5zYAnAsIzm3AAvhHxqYU
	 XZ5TDQxh6OgnxPZYf/V6JqVWTz/L+ybWjBqUqHNT3TKOC0Z52ZMQSaB03+MJ5gKsjDoqn
	 HuQLKxOcKPpmVBS50xmZCfGtG1/PoncKcUoVfpzdvHDXhXtYv5WeC6cD19nNRExOgcgnC
	 ozmqHyvmkHK6wv9XSM2lSxXrlhiygzzbt5+S3lmrPBdNdZytJCXchA2jqrKTlnBOP4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g5Mspk6N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="PY//PgIC";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14225606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14225606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g5Mspk6N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PY//PgIC
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tCT43305458
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L1zJJ4fGyYwiUZN4gA26Z8ebgEKXLwJ3LM/WjuTr6cI=; b=g5Mspk6N/4GC7ZKW
	EtBg6svNTggQVEvZuGHEDBNb2OznT9IEy7/HD8dNI6gLC+4xYKc3fMq9ojwf5Ntf
	i1xJD2kJ9kwJo/vNfkViHVA84C1hLqXRE8BVhWB+LeAf1aT1BMtbHn3hPTcEoSO8
	hp350xhm+p3oCyryD18OSJZ762+UIpvawKNY3p+X33JyIR8siRl2ww0kycF8dUp/
	u4taSY6xmTSy7D+NIbSuDOHqd+ezT7Ofo7TPEAmQYWDcj9uJnzK19icBZ7ykgYT5
	8Tmfgf1SOhF6eoC5WzM3D34/8bD3NcmCut2gopS9evRFKmMoAG5o2MTg2owDYTPV
	mmIAOQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ssejr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:54:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2bdebfc5so97820685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 00:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792482847; x=1793087647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1zJJ4fGyYwiUZN4gA26Z8ebgEKXLwJ3LM/WjuTr6cI=;
        b=PY//PgICNWuYzyjJlEJVbKWFkaGrpiiP52kHMlXFgSOFuL5mRmtdn7VHL5lb14hN5z
         8KOwzWcQGIrDuH9dm/8GJrKpCUTPyPq1NV0nj5X3JmWksBMD3rf0Oh92Ncerywhuvtgo
         RRp5rHXVMRmNOx1r6UVTLfft6sOBtzOOvNNkM9ivfJQNFIaSVi/Abh8hJkYhpMU/nyYE
         uV+MuEMQtVsc9Nh6aODBaAJYh2Gb3HDfwirWF8lpEiwLA3mAzbKHkpVGI/8pmlGMbcR2
         HX/+QTucgdZ9WuF/LhMp4nOrjAtW2DKNImKY7uxx3OAckKr7+TTUHGrUwxbFuv/Zq+K/
         Z5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482847; x=1793087647;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L1zJJ4fGyYwiUZN4gA26Z8ebgEKXLwJ3LM/WjuTr6cI=;
        b=moJkVJN2/paXix0ZXGXaIE5VwWaLzh1mOrPfBi5rRDiSS6am7SQrt9rEAfMxyzmg2c
         Se53G5d45jbbhssQ1kBGKagDRysZOnEwnudgWUOMu2iuqEoUe1uLtnq8+n6eQ6JkfDVx
         E+E3JlLSiy+SYZW3LuYu2bg27bvV7nfPgWi8mCJZ0iG1eMlcCY7LIUUQnDig4O7kN00H
         ISChCe/ZXjOdkkjA1ZLTgUSOMCdtJFjuPjbXsvioT220puYpOGs9sU/ygXgLYDHkdgLG
         n7abRfWeliwvN7PGlwKKqii1pFgps5saQJBy9M7ZhPXrvQL3J2jS9d3diWgHT5Sh0NT8
         XqPA==
X-Gm-Message-State: AFq9FYL/9BPpqWxn4qMin31cIzz7tSd8HNTaWg56AkFF0EaCnllef1Tg
	VrBhOjT05iyNRgMoVVPWXv0b2EwqcGMPqZDplcW3pRUvyrYTdgzS7eH+o+HEXDH1r2cn5dBUfow
	MGUv4OMoDTXbnOEOTMc9e3Fo0GsCxe4/GKthWsES6a8n7uqmIicx3tl7Dy+zV+JqnmSFn
X-Gm-Gg: AYBFou235TtsLBV4qBlE5D6Qk8627XhXl/qjaAhNw2E2ceTgP3FnBrQs5j4IwrKCy4F
	j6wAQ+8L2eJQqRdeetN3HpD/1PGtEJjpqZ3TMXoAzl/++85UDvN4ZPZbSnad+LZ2eDpkylkZ6r9
	5PCqEPZTJlNyMSydjNvG8lyElJVa9sY1ljbms0Vuc5UsfXMgXx79gcxESnqCymnOt7zomHHD9wS
	I+ciPc4d2pqWFLZ2inJvaAyjdxcoEtz4627tZvHyEOV6HIHjI46mHjrBHEIjgSwvtN3XzHMSQjp
	6EbSFxjOudcQAwdOm5KA2r8AoIS13yHs8KSCJAwPLhJA7iFWpWPVMIBnWLqV0r44HikZ+IDLmqj
	kQOt5v0D/s5eUbRW+fbjpGw==
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1887618085a.4.1792482847111;
        Tue, 20 Oct 2026 00:54:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1887615985a.4.1792482846657;
        Tue, 20 Oct 2026 00:54:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e3284e3sm442950566b.3.2026.10.20.00.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:54:05 -0700 (PDT)
Message-ID: <0675d408-874c-4ee0-b587-da8e6ce8d0f2@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:54:02 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for IPQ9650
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com>
 <20261009-ipq9650_llcc-v1-2-572e40b18522@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-ipq9650_llcc-v1-2-572e40b18522@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX2cXzWr8u6Sch
 ZbIucgx3QN3wfLJ5Ug5/92VsEc30pO+nr+TCJlVBJRC0mi2TbEM/guuN7nEe7QxhR8UR0n7EbjA
 fJZjuo39jMsGpmZ1WJEqFqmOOgyQvJ+V8wXLK8lqxIr8jthJhrk92ISOBXHxCIz+sh4JgVmN81j
 l4Sf9TNI8yKvK6+4hF/4ZPxithXs8OvsANNDj0B6Zk0toLoKLLshF2izgv54amzAdvIfTFYzQ7T
 s0Pr3ihsVqGc3Cszz9yKn9z51BYpYqoV4OBguKXUEUdFME3n3wX1T4S8zy5wJHgMFoOxbrJj740
 jfMnTyb1AHzf7+MHKSTa/mcpCehQsDUhUMEqhlCUe2vSEYsq7wiV9nexc3d5bWk+ksyOjfOO8fk
 XFfBSQ1A4/TwkAmNC93ADA/6zUU5bDRH/b5pLksMZjyIZnoJ1NxaveVJ+jMM2CNHFulgKCj3O0C
 U+RPZWVnSOm5DCzgzzg==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad71e1f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jr9c3DReKV2X8DuSQbUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: f7OnG1py1nnI-tWH6ef3C9RVLgGeWryT
X-Proofpoint-ORIG-GUID: f7OnG1py1nnI-tWH6ef3C9RVLgGeWryT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX06x8lIqIEF5G
 WXtg3fXLOPCV7XqJTKhRkcCqwfliA+GNDRSILOA51yZiblS3CSXN7QJmQF6u05IyjQxeVAYThUe
 stc+qw7dialllDCHOzXCp8ltQ63LblM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200031

On 10/9/26 3:50 PM, Kathiravan Thirumoorthy wrote:
> Add the system cache table and configuration for IPQ9650. The LLCC
> hardware version in IPQ9650 is v7.1, but similar to IPQ5424, there is
> no broadcast region since there is only one LLCC instance.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/llcc-qcom.c       | 76 ++++++++++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/llcc-qcom.h |  1 +
>  2 files changed, 77 insertions(+)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index d7a42a8040a1..7ffe6b9019d8 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -696,6 +696,66 @@ static const struct llcc_slice_config ipq5424_data[] =  {
>  	},
>  };
>  
> +static const struct llcc_slice_config ipq9650_data[] = {
> +	{
> +		.usecase_id = LLCC_PPE_RXFILL,
> +		.slice_id = 1,
> +		.max_cap = 128,
> +		.priority = 1,
> +		.bonus_ways = 0x007F,

Please use lowercase hex consistently

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
