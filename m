Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655140;
	b=d8n+6mWPaGmLF40GNHlCJt+plKVLpeF936RvZPL6REBakKz2SlblX3NGGTFv4mCQVmPO
	 uLzAimpj6sKltUGsUEOX9rmHE0Uz39v0YeWpsDotprKdBJKmU0OdMfMF88k8YvYlETEY7
	 bnmGAXWuL0cnTLzfekCto40uivDoImF0JEQmFL2D99hmcPu4gCRdjtQoO3IpnOBduNEjC
	 TCQy7dTWH1jPQhoK2dGElHVxrX/05nzqmCHn3f3FSuxNnWCVjFFXTyR3RB3ujnWaXTxoU
	 uxBC+n8F7UUED73Vrp/heh6zfm97Ek9ftIcBunJa/IwIQnc4AuvmbHj1EsuJY5FHYZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VWNhUBbEj98a0eKk1XOTo+BnFUwSU0QxEzvHKDZ337I=;
	b=wS9bCuRpp2FqNjyh9+o+NqaFSr9ly02qFpfmHlcyoyKXVy7FcnLL5+tM4UPHiQoq0KwB
	 JvIkr//uhIFT6Ty4TxlWoP36+8BMYvA2xlpwh/emOsQghWBAuCM3P5F5izgjSz3tEpQmo
	 BZIUVtqbz4qvMDkIW0zPvmTNWD45SGJMCPF6AEo5ZESVtRj+0cGjcl543NKWJF30z4qOh
	 3Z0r+EWpzHOQrwMqiQ/v57gZclHboFxkawxA/FPxH6hlPr1DdJubXLMu7ImsVOpp8B54u
	 UOyNc8kIoxwUFOU34jvatrxWT3wQ5deo8PUYu3PkFbCrTSx8uOsipxUQ+HxwXEPqcTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=daya9Fgv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PaV+ukH7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CE7606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10CE7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=daya9Fgv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PaV+ukH7
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xvEr1560115
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VWNhUBbEj98a0eKk1XOTo+BnFUwSU0QxEzvHKDZ337I=; b=daya9FgvA3PourQb
	baUmIc9oFQBTsU/VeU8tgdghMEXnbBsqOktM/8Ftk6g94URWdBADi3HSWuFk1d8l
	ozeS4fNIcWYXJ9gVVvet9SiOZPUODXfO1zOM0fBk4ZQ/NRXa8qW/ktrLXZ7haueF
	frwOElWV9U31UPNoAq+JfGmGuiJR1qOnAC4wUFslxCfCkvE5OxeEz8//ZK1uTbhI
	a3qfw71ZmhzYacKpTYP1ydWzKZSlodWTBwrZQ94wexk7KI7OfW/yInRWdcf+Tn+J
	yRRuy/75xC4hR8ruji4zHGW4pn4ZRKVZUp6ENqtALpsW0/TYANWgAQRnL3E2R3C4
	ZEPp3A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahafs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:45:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5362ce9df1eso2401191cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 00:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792655137; x=1793259937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWNhUBbEj98a0eKk1XOTo+BnFUwSU0QxEzvHKDZ337I=;
        b=PaV+ukH7ZvMqvdlZZjGTiO422mxvNxeYfxXOL5hnyqYVE3hsOrm7skEPc6n1kJSvK9
         YzSWBzd2CDBKL63OdFPzcQUDLnT5HSl5L1bUxXWAwW9Dezg1NvS3bzTnU/enb2VodoDf
         q/VL+eGYOaUzZwtYz4Aot3oTqD+OeA9czv+BYoq4PLwTsOny1FtJ67gW16iCKw6WlQhk
         Vx38M5MYV0wvtczMgF6iwKwJFYuhyXpuhnlcLo9m9lxfFKMzjBPKPebrjObwCmOI7lCt
         b4mOgNjn7jubBGhcmr8S0wPNy2DHJqQP+Nr1EPGqQxwUqmmbBRmq+h+dLiPg1lx8WXrK
         /Wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655137; x=1793259937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWNhUBbEj98a0eKk1XOTo+BnFUwSU0QxEzvHKDZ337I=;
        b=lRmGovF/W5nLg7Qfb2Un2BD3hGcGsqXBlsl7WgBAaIn+eWnUi6KA5IL0ckD0NTfdc6
         4OP6YVwL2xRy8gJGGO4AUZvn/1CvjC+ZSj8pylMfDveN/+sybn4mSwa6XX5lBKyvcmYp
         EtKJaxB/LjfaaoU6pzMKWyaTMXCgDUIN34mKPPhqz3sEQ0mnziMcLLl3VqiQ+G3bSwKF
         rGqR3exDJkBN1PGU4dHZGvN2Q1PfxxaKaTt7Q+Eq0wzn573N9lpwA1Bok5ybztrhfUEp
         AP29wEq0+qIkRED1OGxh4C3MJG/fM6UNRpR+lZKgPtzsuJ2VAFAoQhcB5j1X4ZR/2kXQ
         lHjA==
X-Forwarded-Encrypted: i=1; AKwUvByrpXcMfEIc/iTPFQGMQW/FqJZTc1OK9l4423pQtvwfipOAR8HkIzJhaZ8ZKN/0kUBaWBlIXIQrd7TOEBgG@vger.kernel.org
X-Gm-Message-State: AFq9FYKz3hRj/SbnFD72mnneKw97ZL9HDLsk+0zPy5Oae2gyA2Nb5be+
	4jAoq7h9Xg45bL947sq3QnX2MNoG3N/2uPsId084YhdxfmxJZsZqTs9pnubwCUhqtFSXfS3l67f
	h+2f4kfrNzyEqtYlJ/PTVy0UzxvZVFfejwwYkySQi9cAENTm4YZ+fVK4LRFS9cPgCMAy0
X-Gm-Gg: AYBFou3OWIFG+XF4QI2CrYpzXYleAwuvauyUD0W9DvAOx1Q62TqKMnvjmRBWuJEC6Rd
	XhlnESyKbAUyoDV/IXKsxKEOEnXLrqb8E0tCojaObf8oHPIp8d3oYNhJA1dTxQ/XNldP/fWXzn1
	cCx2VZWU45eEoQUmnKfzShfARiQhvhohK+DQIYV3eM4ZkP6KJ5+qL231mgC16Lm2nB15POJcr8q
	oOexx/fagtBBoV1v2ki+CV09EQPpRI3jhwRZmrmpDK504908ANnqAFHPfJvIWMfkaAULbOBcG0x
	VY1gpwOEOh7o9zdhShtA+1Xhb5eRPDsVeyZWJFTEXxcHGJLUVZ95deySY/s5c+tQnRQjHqB8oCp
	tY22XrHdwox235x986ZAw8Q==
X-Received: by 2002:a05:622a:138e:b0:536:662:3776 with SMTP id d75a77b69052e-5369b857ce9mr84820361cf.3.1792655136828;
        Thu, 22 Oct 2026 00:45:36 -0700 (PDT)
X-Received: by 2002:a05:622a:138e:b0:536:662:3776 with SMTP id d75a77b69052e-5369b857ce9mr84820081cf.3.1792655136379;
        Thu, 22 Oct 2026 00:45:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59689bsm76332866b.48.2026.10.22.00.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:45:35 -0700 (PDT)
Message-ID: <6b539621-20a4-42a4-bf1f-1fd58f803581@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:45:33 +0200
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
Subject: Re: [PATCH 1/5] firmware: qcom: Add a generic ICE service
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261021-ice-migrate-tee-svc-v1-1-b035be7aab0a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-ice-migrate-tee-svc-v1-1-b035be7aab0a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMCBTYWx0ZWRfXzJOlwCWVcK4n
 wmJyu5wY4ENijWuduDACmqkfTFJJGsHE8lK14TYKzk153OHblCzbofa+1biB8tVuebtuXP9TevG
 Z/tdtIn6qi7QB4US6Ugip++Rgn21XuQ7J0L/vFhzhfLPC+751d/qhJUpSJ6fhKuLUrCe35E5uNh
 czOTkCh/HIW26OFw3Mdp3kKC67KZKe38rgi7IvcjC92ceK4H7Bbi01jUljCw7Ad42s7XqaaVN41
 60XoLELrB4+/VADrKZWJjpHX51jPmQEMF8Ju6qfvUPch6oZQDhqEkjz8+q4xTQSC0Dhxqka4Gz+
 t1HxwXTkpDAgKv1CniI4mWqqVzPj8Rzg5IY9WeMYJjEM1rn4aN/Pt2h2D5+gUBNY66GbHfKJXdl
 hgRzsaZ59xqyGxHVzNNi3arSKkjgxkLZ20tneWoWRIEXbi/HyhRy9NNhQfP2I7T1I7HxgmXrdYa
 KRLqgFnkSoydFrzhETw==
X-Proofpoint-GUID: 1W_ApvoBeimaXgSLfgqXe-bj52oQ6CPn
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9bf21 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IgLHovSQZjQVHc4R8FYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 1W_ApvoBeimaXgSLfgqXe-bj52oQ6CPn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMCBTYWx0ZWRfX0PQZ6UFC4oRJ
 ynq9qlLcU8IQzfgElAyTbb+2a4bV4/bUNecoIWCELBPakSE3MjvsiVMaNmLDbpTvww5KKWhdhAB
 tyulPUsBDiCgYAHaXLA63gfJ2qAXCd0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220030

On 10/21/26 5:43 PM, Harshal Dev wrote:
> Qualcomm platforms such as the IQ-9075 EVK now boot with both QTEE and
> OPTEE. However, the Qualcomm Inline Crypto Engine (ICE) driver
> currently only makes SCM calls into QTEE. With the arrival of ICE
> support on OPTEE for Qualcomm platforms, there is a need for a generic
> layer which re-directs the call to the correct TEE at runtime.
> 
> Add a generic ICE service which acts as a common layer with different
> TEE backends plugged in whether it's an SCM implementation or a proper
> TEE bus based implementation (such as for OPTEE).
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---

[...]

> +bool qcom_ice_svc_ops_registered(void)
> +{
> +	/*
> +	 * The barrier for ops_ptr is intended to synchronize the data stores
> +	 * for the ops data structure when client drivers are in parallel
> +	 * checking for ICE service availability.
> +	 */
> +	return !!smp_load_acquire(&ops_ptr);
> +}
> +EXPORT_SYMBOL_GPL(qcom_ice_svc_ops_registered);
> +
> +bool qcom_ice_svc_available(void)
> +{
> +	if (!ops_ptr)

Should this also be a barrier read?

Konrad
