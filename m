Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A942A2EEE7E
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075387; cv=none; b=UT+FozPT0uw8hAE27O2/OPMmmCEkkxxskYrFExL59r0QEIgIotJAy/viR4A/72uO2jvDTXiO21S61oA5erJjklSWEXJqsAqKVaVrwXVj1Lht4dD/9XRLfCFoPYDHDEo3wF9Jg3uwWIlbouaAzvXmpT/uk6qorREse3TGHLLTcWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075387; c=relaxed/simple;
	bh=tLbfeLUBRz9kckFa/m+pJGTBBECpJriJUZabU7HaqE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YlgGKGB6fph8+fB5h+ibIQ7mcm2HP3gkxf0vrj7qqpQHWTmSqYran4yIyR/X15+MpF/GkQS6ucG9gRTjev7achF/K9sV3fFXkAaDk7JKAw8IoerJeNcHFA9ofhXMHIeHxCvPbODQLHLIvRASzDH2i4qi5Ik4O/0aTnwzX+HJMtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9lFjmry; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CcjR+uWI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9lFjmry";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CcjR+uWI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPdCJ4100189
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	80tjiWpoCbbPBE3onl4nOGkJVFrI+dWTU+A+MkoKPJA=; b=V9lFjmryGDIEEMKP
	vvEjKem2E+mBiIQd6HfqM2z+NkWa8HGtwJXTXUwtdMXaS/FOSEfqTL0UFBueok4P
	DQFAd2uATooAw1dujFnWWtanKvRy6h8utBlCmCVR7u/V+rjimWTFZo0gASV1T2m/
	44wfIoehgwOv5feAWEp3X21obQdoCUDGZL/mhi5cjeavCGfDxSlG/I7/Bj71KQuN
	n4d1My6BRqlBxOWNgv59keu/hKBVWGaLOb1W7jQxSpSkmItpgx8HTap+5LjOv6Li
	udkS+BkPof84ppA1LIhO31yCAkgVwddsW6djJyChwCoC5n10s9xA4Uo/ND0U97hn
	xqV6tQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r909f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:43:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso97466285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792075383; x=1792680183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80tjiWpoCbbPBE3onl4nOGkJVFrI+dWTU+A+MkoKPJA=;
        b=CcjR+uWI6PxgvkXAqNRKa/M2S9ZB7Z0zgZ2mYLmhvaAtRPN1jhussYdkkHRC5NlmJh
         aGEchQvmXM0qkEdA1AsNgtSWQvwPuHH/GQ52eVoOREzKIuuixDnyQrbqRxGHyYeCvsrG
         9YYnpaHsI9n2ZcPhIxRGHND6SXKj/okErf6Dk8sQpciCbWVLsy3hu5EKwVcLJBuEVZIk
         Ya98ilEVRH43YDGqcnNUr4ajwPugT5jFOTmRLQkBs8PsWTN/stDSm8QR5FYvSaG55Zsb
         lnrfwbQypPPFWrikktkktXSOkxDI6Qo3FPAMmsFgZ4ZrFDRNBr0DIG6lxVrqHRwHJ4pc
         gCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075383; x=1792680183;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=80tjiWpoCbbPBE3onl4nOGkJVFrI+dWTU+A+MkoKPJA=;
        b=nNm5JWYLKiuDsLjvdhAYLBmkamMqv1I4tIj2y0kTKLlhoBs8JTg9C8eROOQAjcPoP8
         s68ov4d33gyGkBID0uutgiHgBPtAMSVvFESZNXCbiIHMUm6X1i2ufq5pjGqQXcBR8H+O
         Fa9Ts/NB2mFWjnhwGIlk2XGA279Zh9h39p/SDh7xSgW4ccIQ4zkEPb3ldG4hQRrh0VzC
         dXdDlHb0zBGE0+6w1LqTUboJOAHQ9zd2cmbldF0fEvMyq97QtlwpW04B353NiV9JbUDf
         cOZpFiNEMRSrE1EBl/qurvZ2VnlAo3KWd9rZmxLeX1V4rtKSVRJr1AJ7tQ6bWNnE0/be
         0QfA==
X-Gm-Message-State: AFq9FYLhsySo9EtgQ94JM/vcvdkWck63lgD4ev7hUqaF5IXdyMWPPsf7
	0c+I/PUDR7QMtOMYaeU4t2D4UciC6nnB2+OGXAq5XBdgCImePmspJW3FfGvxuFo3C0XTht56ZSw
	G4Y73uk9Yk0hrHWFW2HmAlYRaFV3ivnt4hO6/jKTa1kbSjNaGfpTQdYxKW7kKbwZ6ZRXq
X-Gm-Gg: AYBFou2hF7l2zKUKhYvOc8nREfbJeGOiYdV4DYoNf0j9SzMzg236PMKbLyVcS1lTnf7
	JYgGWh6jv3OxA799+ZUC/hQlRPknOrQTSkeCB0E4+yA8MC2xnLNfRoAaMmimybnDUO0lYgBwKyK
	v/Rup6zQMLOpyzz7K6hpSqn0PttCKmiZ1G+DfSHmMP+Kivd/bz92SGOkZgwoW86Df1Qx3Y5jGnh
	10jQmmjwsnTBoSLdoxhBKZuMzcdgXeh5ug/QoRVY9Zko86dmSKfXtfBfW4BVvYIDiiu04YQybuT
	mFZWZl4s/g6/ylWtJNhjnzPh4LUtJge3BTTm2asD7EueIUPGR/YxJDic/B3LNqhr0f3V8K7Mvhp
	l46JnChGqQWFz6laULXZORw==
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr3533922785a.4.1792075382622;
        Thu, 15 Oct 2026 07:43:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr3533917985a.4.1792075382099;
        Thu, 15 Oct 2026 07:43:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9f3deb1sm134751566b.45.2026.10.15.07.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:43:01 -0700 (PDT)
Message-ID: <aa0aa4e3-6541-4cfb-b947-388c62fd4b72@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:42:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfXyI7IkN56spLG
 ZQ2i/24USJQId0vBei7n2B9P0j7PaqPBRQUuoTEIa4W+lrOrEzOYYuVsFZIwSkJV8/0VAg7LDWE
 ZCbKM4pMRV1OmSlOmWoZFpvWjaX/5dQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX5RTHcqbQTccv
 p+MW1NLqATMQOcwIGkCSds5cPiqpPQ86eSwTaXIKuMVEYeFSTKGnpdYAfYrR374hTF+ht+f8Cz/
 AUQdpi7QUTalO9tfx3nyfMRpOI6DWgOvA+9pqrt8gRFeqbPKIxYBkQ3Xa6qHYLuytul9vJyKiFt
 RIMa39s3TX+qobd4roMZMU5/CXHfGdsPTIOP5OUzkFzzBQ9plYZPFRSbtD4EvRam6NxzMN9MK5k
 oFBWAR2gdGInU2WNpufh1SzunjmTKm5Lc/uN9glRCXokgF/41tavhy+SKT6okWplbV9OGrayQqr
 7/vvlF9oVGJ3rV8vK4JmTPHWMpMC/UHBG90fvxWPV7Gg5xuSSghTnAlBbwG8iSFd0g19f08i4Pd
 jHleN8mg5FTvbsgPJ8+q0Mb7UvzmQLxKZZ9Zx63QZ8ChHUTVWWb7OUJ9w1bxgvX9E79O1+9s/uc
 bAOKl4C1R0rCoEiJ3mg==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0e677 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=foisExlbF95jOuBURZEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 79_i2DXZHyzxBRKA-6EIpIrgEKigDLyE
X-Proofpoint-ORIG-GUID: 79_i2DXZHyzxBRKA-6EIpIrgEKigDLyE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150058

On 9/29/26 11:35 PM, Elson Serrao wrote:
> The EUD hardware can support multiple High-Speed USB paths, each connected
> to different USB controllers. The current implementation uses a single
> chip-level role switch, which cannot properly handle multi-path
> configurations where each path needs independent role management. Since
> EUD is physically present between the USB connector and the controller,
> it should also relay the role change requests from the connector.
> 
> Restructure the driver to support per-path role switches and remove the
> chip-level role switch. Additionally, as EUD need not modify the USB
> role upon enabling, remove the unnecessary role switch call from
> enable_eud().
> 
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

[...]

> +	path->np = of_node_get(np);

This changed because the binding now supports both bindings with
eud-path@ children and without them. In the latter case, this np
ends up being the `ports` node

Konrad
