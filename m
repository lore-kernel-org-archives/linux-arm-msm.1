Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501663;
	b=cTT5R5YcfmJzssBAvvsBJODlj0BnyESXwhgdkAum2vi3mzvokm5xr6APO9eB9uNE1mxl
	 Bl2rKVync0TKVQFasY+7WiZqBZtfL/depP2dXBvLTJlYI5z79GDDMFlh7phWVbhJMQi2l
	 xp/FT/VnnX0x8XsruMqfQ/UCA+YXB3Cf+NqFnD572pgseDLgLZJpTL4XkdxBrG0FK4fOD
	 WlKqyiPWolfaoErq67JDyJfWTI7ZH1ZYpJOXaxznCQMNU+rx3uA+dyzHOKCtL241GH9my
	 sXyseOfpvMW0NyekCmm50BUQV7HUWzZ/YOc3318cMC6YbkAB2el9co4rbQtDmjuTePw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501663;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dHtMFy0XbgvQcqpGji9wXowz3KOsd+jONNfR8siOCQM=;
	b=KML6JvkWfrzfrttu+O8MpgZgEbzGfTlBs6IHvscAX8t8bYspjwQgOB300Z1zuG/U6/2M
	 2hDS9EU1gv+tgieInmRn6o4/G/LSVqSt+2/UYViTa6QeiCDWsBQmy3L/uTPlfr/nTT5Nj
	 kubhN6STMoUs0of5ESPEr/HzxyYpyQyv70mjoxm5PJFuBM5EBzX9AQA8R3LaBjXQqRy57
	 JJomazM9g+MNFMkSRj1MfBz6cRBJ8k+tmtZU001VXqf+doCqgizLzske8xcBrpliSoTMs
	 WrG2A9Ee42BnBj66Y7b17e+AFLyaIZlMEsKzwYKwTQ8EIJmbdmO/zOB9t1ZHp8CcOEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T9U4mXOF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cuHqGSCT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D60C606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D60C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T9U4mXOF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cuHqGSCT
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxHQn1292872
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dHtMFy0XbgvQcqpGji9wXowz
	3KOsd+jONNfR8siOCQM=; b=T9U4mXOFH7JOJkvItvsuIFvBGeMaHz2dltnDo527
	moLyl6EazIVCHguKQjFTVMSJC3k2O0+ROhxUeJDvOZqV6KCcwIN4eKEieULyodCD
	+4/HLbg43xYz+wqCTJpxEWUwy4c8ZACvMCObVMgRJ6LAqlQGBqCIHyzqoI4mQtaf
	Xd5qvOZiC/fvwt0B483UTA1rDn6qip4GYUm5nJk1K3NggcCunho0y5caAKNspi+2
	XgPRqZI+yPlZjE3ikTH2rWcpZuPUV0UHC5ShWCkPycFsdKs4CA6U6THVGzLFazk0
	TaqlTWBG48QGXHVWFNvNfWLFOpyyIsftmdYlpERrLvaQpQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2jyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:07:42 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc2c29ba27so455765137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501662; x=1793106462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dHtMFy0XbgvQcqpGji9wXowz3KOsd+jONNfR8siOCQM=;
        b=cuHqGSCTlekNtKPe0C96yXEFMNWIydl9e4c/jA5Z0zqxWKZJQf8f8ZoJfO7E3Mb+cy
         GrWjTSxmP3EtYnYldJQ/fjDHZ3jhg6qB6uPZGXsMiqO3uFTLMhFHXiGjQq2NQ2NUsLsE
         nGk2LmL17GYTVyPFcRHbpYdylUcW4DbfUj4eSvnE/TSz00f528FxmWTtBNesN5Do/9vX
         JzN6hiNveiGt4xm7dx8xMnUzGQVsEwuEfvQnMAuH85yGhkKCfMIDkvS7K96BGObV+Pjx
         wCooAJu7XtxP4klDz3fRWTei34EQZtWp0zNWn5ieDSLc52XQIsT/uN9mUEpPNgZV2fCT
         fQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501662; x=1793106462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dHtMFy0XbgvQcqpGji9wXowz3KOsd+jONNfR8siOCQM=;
        b=ajXCr3vj/9VNAVkfu1CQ2etfgJiv/6o/sbm4VGTET8FuV5wZaRfb9UCx5WzFW3e95H
         tP6TSJlN9bWqp6/OP9HL2sBKvasFnpOY5+kf5x+spa0wB//Qn9S4lEE9TE2yRTQ4qOdP
         R4S11hZuvZLi6b1MGhcINCuIhfGNbES7rqr36sjBQK/nWk2HQ280yYxvKmQtG6E10Zy3
         Mwl7GZsPwp6OEr+QFhCcuDBNbVCNMT9NPakRdjDsaITVrledaQmLCS30w54Ktcxdx9Fa
         AbWON4c9xfdnzxmVBvicEQcli4EnNfIFe2UWYjosqnEVVWT+1AyXxHsoHg6tSxlQ7385
         PZkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEYrGZyhsiF2G5YHY6KLltF2OieBfCv+Sw7NymjY6K48wRvVPXySxzIN4/crrYpVjqbEpqgR+uBVfSLCIT@vger.kernel.org
X-Gm-Message-State: AFq9FYIozlsRcNfP2htu5eRfWm9aOBqNIqJsWdJ+GDpPjcgsbcaeGHwE
	Nh7smff88vhtTlAKjIBwPyRRj/fCM42f1GsOwzYfPotw7FFLgT0JWadaNgaO51aL7vhB4T1Kd1z
	SP00fXQXw4/dF/Dg2I6Qmqb4CjqAX/CNQ7NXvlX8mCbSDJZSIU5u3oj0vQ8Q4s9TOKsxe
X-Gm-Gg: AYBFou1o2yT3t8p+UGV8B6usmRHkV92e++JGlbSUykEGhtjdBYZsHrqoeazFARWo3Uc
	C1t1iMROCVs46twC6E7rPvt6TxUuuJkPa1i5NOP362Rg9VWeASyEhykPlrt2Ruu1h0hsWi5Vvat
	ycsjMe0HpF6d4P/LlXGBMJK/gCmhJsY2grpuU3pZZGSzLu2EH3n9au/gy0ORqs9lSWmOLBsVkcH
	KlPr0PC4lXFTJFsQVWwYYDLTv6v9fNxiBLkcUVZTi+79ntTJXF1i2GlOAjT5K9cvPL8Eo5A8xza
	9twoTIGRbFYS2beoZk3Ayr6BArY8pL7H1CbLufmEGOIxMDT9pzt/ADN6xG53FL835AVNU+9e7Xj
	NPRzWVTZQ9ZsrKFg+
X-Received: by 2002:a05:6102:4193:b0:7cc:1942:c156 with SMTP id ada2fe7eead31-7cc36a827aemr2633457137.31.1792501661541;
        Tue, 20 Oct 2026 06:07:41 -0700 (PDT)
X-Received: by 2002:a05:6102:4193:b0:7cc:1942:c156 with SMTP id ada2fe7eead31-7cc36a827aemr2633447137.31.1792501660992;
        Tue, 20 Oct 2026 06:07:40 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d97b7bbasm4264685e9.0.2026.10.20.06.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:07:40 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:07:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sdm845: Use ICC tag defines
Message-ID: <5rkmjbhbgodmfyhd3rd2w3tbv7onjoclqojiehd6ug7enrnlke@jrcx4nt62r5b>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-5-cae8d22649ac@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-topic-icc_defines_ao-v1-5-cae8d22649ac@oss.qualcomm.com>
X-Proofpoint-GUID: IXG9qFjyc0wjWwvfQUajJ89Muq9cAexx
X-Proofpoint-ORIG-GUID: IXG9qFjyc0wjWwvfQUajJ89Muq9cAexx
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad7679e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=S3dp9cuBsdvKgzaJaSwA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX1I9eznmfqDjx
 Fxcmq2yfWtQurWMIKwCMmWMRseTcaLITh1HjdrmWc1ZnnbQD14Eo+DeobFpktR/auKYf3Ojg8KR
 sQynA5PrzrwVhijaVu5Y3A9TwB1wZJgRnhCfFnvEDvoesEvyjx3O0dSHZ1n9L/pBvQvxwzOKZGd
 LnBKiR8ndSU0o1F+HM0EIskQUvubSdx9fHMGkWy4LhQEWHQoGIL2zzY1/5M087ZMdQ1SNy1J8PC
 +3/tpntQ7ILdKUyXoBrFzfhlWhd+8McjOeBSPxG3oT7o6Wggr4n5FSK92hG7Xsyw6tJd3wOY2KK
 7/sAyIOzGBTYutz1CgzQR5vinqtnd/VLoe0ud/16DGrU88MrOdnb72eKw6iUx5AKN99Hv74nCcf
 H9mSz6oxJfas6q7xaokI7+JY0Cn0uFoyVRmzp8LvruCcufnmD6dFsyzY1nyzeHfLqC+UDg1hQgw
 Wk7J6Giw9+l2s7bGk7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX20ig42yryNY3
 VeLBFBU6Z/PPOF807mN/PBAUI6u3O5DgakBA077MpmfLIB5wW/SiutOPYH93wEffxut/WjJuJBp
 PC/72XbJjlgxLLQQeImkmiw0SWjk6fo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200052

On 26-10-20 14:42:09, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The magic values come from dt-bindings. Use the existing defines to
> demistify them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
