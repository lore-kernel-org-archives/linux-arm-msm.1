Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587415;
	b=2UPmq1XQnVoHBMcKVhC4c0C2Yc7HPYCAVhiy+E5Wr7kUjTfvUBtKYjcM875NZYIGK6ZV
	 uqf7bljq9GfB+80Ls6Muh3d4bSoE/isDdtyz9huhNFHxx8fSVkpKbHgRdxfjrlqzveOEW
	 G9qHjtCP7OrhojbhZqndYTDhvPTH9xHzQ+qyNhM/vHxuPjieTjwTXa26akl7QJvcqL44y
	 KmKgDcnWrrAMoSU8jc/msGbf5niNw/u2kdDEFkpKsh1NfPjto0qJQ0VHtEWdW9TvSftWg
	 JxviVrcUxZ2PWIKg3L8k/t8guAwFba/ELqW942LUQWQGB0VD0ti4ZQROHxRDsB29pow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587415;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8N2TaHMWI8j5xcPeZMdsXt0buMI8vI6KwHU5sNRNuKI=;
	b=qXXGVO5e8t2GkD8M0WEmz3KLvpf/NT1ihDyJ1g8rwre77c5YUg3OjxE8f8pFYoJ71Wg0
	 5y+6b9An4PmKPntB5NLvFtzLgDYWyTJv8GWmv22RoImGCm1VuKLBwyPeXQ0UV4dEM4sQE
	 cxDsocb6kGvbwFlTp/PSPxjtlSHYeeaJyXoCTJMTubmzaHaaq8j4OHU7qctrK85TTq5ND
	 ytt4br3AbI06QsNpoVagJEB9oIhSW6psPyXL77ivB8+iCrmdl2AvDwiQXye+jma9OXsa1
	 RBNCWZ77NtechWejkg9lHD8gEIZ2w2DTWuH4s7cMOQUPMnOmuPdjIAO0S0/CNJs7Qvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFnH0X1v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xq1MaR9S;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABFD606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ABFD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFnH0X1v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xq1MaR9S
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgJpE184031
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8N2TaHMWI8j5xcPeZMdsXt0buMI8vI6KwHU5sNRNuKI=; b=CFnH0X1vYTNqj+Dr
	tnTyG31yDCu5C2kNe8tE3NzeAcDgYOHqtYGUh+P5odDF+jUSuP2IYlcfYQvpCmJD
	Pazu1aTtkDWG+1z9JdTWaiNI0S8sodgXqoq4fbNpcyVy62LJPWB/MZTJctCWBoWi
	M7cj5PFPS0xXqpAVT+pI6EYr7huerP4XY5yq+71EA6Tv8I2zXUdhlbibPZ+DatQe
	si8+lgieUNfr725H54kh7LV3GwxZz0B9seWVYhftGLGA1LNsO7rMgg/1bKR+UZRo
	J0KC7cv2YLEiJY0c504iMSd0oATmOTeZJmBKZizsxqR57QBp1mkdeAnIPWSAeom+
	tWnvWw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9huxhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:56:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc50fb0d2so12874385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792587412; x=1793192212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8N2TaHMWI8j5xcPeZMdsXt0buMI8vI6KwHU5sNRNuKI=;
        b=Xq1MaR9SsNT1w5grT45+tEpoPZJ29Y3nwNAmlSE/R/ykfcfWgqv6Ek9YBUVLJGp84R
         83vqLARubbS5Ln9ELNkJRxQZNKcivCFtPOE0FiWhKHSm84qeen7B7H0hU4c6IF7y55DP
         2/q/1cU6j9AH68H3jyhXSGjiBbTaVIrA7lLLwAvwiCdsI7iOChl9ph9B5FnGBBqW+2ig
         DSs9T5pBsWsb0+25J8J9KetsL7vGm3OeyIkSc5T0LDdvrK0i9vC3OW6RFaxo0k8IiSiU
         maWK9/f9QhDjb+31qhLNSWGd5qonmtb5NJdACkj7HKXshkN/RkCg0ckM4m7M1zHCXi0v
         8hLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587412; x=1793192212;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8N2TaHMWI8j5xcPeZMdsXt0buMI8vI6KwHU5sNRNuKI=;
        b=EJY8U2xNAJiYRKC56XqJf/VJMPLmfpn8+QEvVpW1Sl+bKTydLqI80F2E4a01lrIHLG
         Hpn/Vgcs8g8TzH/NNFqfPstBqNyynAIidupTdZV2BsmWgxModFporjchrab+KcvpuMo0
         XzBKfGIP+lyD6QzCPljqrMoQy+baSFuGmaoNo/lvQ+RB8XIhSabcaISVnDf7nOARpi3Q
         SuqftNwF9SFspqHvsRaIj7IVDzxPVVLKt28IEnwyLZca10Ia9JIQ6cHtAvWxB4vnOnrs
         lZXJc5cqhSSkyV3XbZHr3brlwaMKtCB8za59vBAQMA1NfibjHh88ldtcMxKBTNRVti5E
         Ohow==
X-Forwarded-Encrypted: i=1; AKwUvByvhDXH21OQJ8afV36snjZAV8UrJt/xxF6Xfklyu3M0UKmLJiENafZZaWeIOvbnaJ3BjJURg6wnX0ff8IfD@vger.kernel.org
X-Gm-Message-State: AFq9FYLCB88ivkV6SvcHWHPIXHrpwDgU1CqKfwXUGKc6f6Y6+uKWIcgG
	0GDyS0tFgdkPS7P1w7HiFSS7AZI+dm3MuksY0fQGCsL6C3Ac/elGueVjU7iUH+OfHgR7lOj6VNV
	WhAZpOGkbLcyXoiyUInm7syLqvYui0/xD6xY8lVX2AbFpz4M3AwjhuK+5qg3+d1KVp8IX
X-Gm-Gg: AYBFou07RzTBj5uo8u+ZAmw1c7yJQqoNxnxqdMtB59Xv2bs1B33rzANyziFYv7j47OM
	BnD7C1F+hXUzg1lcheqIMYHLyx7hLoRiHBL2mGswQLVVR469luHhXqVqE2Cdu5+YtEJauFlq267
	A241WTUuSYVbFLNIX0CmXU5J7uf97zlbxVgYR6KuAmEQNcCTBvpwsNRMzaOhDLLTEM3oxmgbkXr
	4JWpgPDfZ5rea9/uoA713xH/Q3Em0KmmfvCDSj78ZVDJuBanJcJgPC68/dETmkZmBxNFeiVkdeB
	oPrpINAB1s5jpYxHYOqLUXzUMRjD+RAwcQKmE5Dl0ZgbDasp7L43rhueEBDTRv32DtlGB5icMww
	rZIyy7nLtMy6rcdMyNnxuGw==
X-Received: by 2002:a05:620a:6087:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f57d6eb34mr480104585a.0.1792587412575;
        Wed, 21 Oct 2026 05:56:52 -0700 (PDT)
X-Received: by 2002:a05:620a:6087:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f57d6eb34mr480100485a.0.1792587412035;
        Wed, 21 Oct 2026 05:56:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fe6f4asm75163166b.65.2026.10.21.05.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:56:51 -0700 (PDT)
Message-ID: <9e902800-8c51-44bd-bec8-5cfbcceae64b@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:56:49 +0200
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
Subject: Re: [PATCH v8] firmware: qcom: pas: Make MDT buffer retention
 explicit
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad8b695 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=oFv1cWL6vE1NE88U30gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MSBTYWx0ZWRfX3pnrG69lJkgB
 H+OAqBfdXayl7zk1fjZI+GXj/Vg9J1GNBBua3zWYyUXxySWHljvlCur0M137aZtrPxdH+zCbv/s
 MYFm2tYqeaHviGBchQBUTEsAAWlCnbk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MSBTYWx0ZWRfX+xWMlp6QElnL
 uqvZXZWX1OndqlhlWjuNwJu8Hm6pMFOJkWzBOJ/8I8sERoH7lxWPTNk4FNXCE7vd5CPTgIBsy0k
 Klbx3gWbgRhmFvzHGe9iutB7eYMF5TSANRauwMn2mDSn0DGeE28QstLr9IokNTQMbs1DshyySug
 jTGsPSEzo8r32O9PoEfK3oekbFrGwd9vK3ePBeoelwIZqnfBSD9SOstG/wmDBxzmJbZ8Z4OKtD0
 622yLfD4mkCggPdlRKv4YILNbOT+dIN2jRkw9TGWmpYbzFZOC/ZDVFjlLLKwKlLijtgNl/8tioB
 aN8/25EYHPUuUuR9nAMN6zRngKrk5Vm9n0toKFfVU7dsw4FY4QIUZjWQE6AVgacatTljOaqByZX
 z3FdDMMIxKmCgPhTGnkWRcnynF2XdNrBQGt1+CNJjdSQmgqft7NlUukJLw8TtSuXu0ViMi8rzsv
 OF78i35QcDWzekmk7iQ==
X-Proofpoint-GUID: 2DDclTi31jd7Z6c5b1kKTzbfx4DF3mx4
X-Proofpoint-ORIG-GUID: 2DDclTi31jd7Z6c5b1kKTzbfx4DF3mx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210051

On 9/25/26 6:52 PM, Mukesh Ojha wrote:
> The PAS image initialization path retains metadata whenever a valid
> qcom_pas_context is supplied, although callers may not need the metadata
> after initialization. This leaves ownership implicit and causes unused
> metadata buffers to remain allocated.
> 
> Add keep_mdt_buf to struct qcom_pas_context and have the generic PAS
> wrapper release metadata unless the caller requests retention. This applies
> uniformly to SCM and OP-TEE backends, while qcom_q6v5_pas keeps metadata
> for subsequent PAS operations.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
