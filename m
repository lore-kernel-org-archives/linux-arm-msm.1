Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779433;
	b=WXnYoecfKq2ELhexzCRDhS7xKRHo6MUo0w+2xkU15cgyKZ4GFARYFWUaxbVLwuL6VVrr
	 MFBQEB/xhSdbKLo6Lwyn4WhVJH33CJAMc19NurM8F0EUVa3VT3dFZL6750CYYPX+w9Bei
	 G/EL0le9vZ3ah6HVmAwLcCcqwFshS9kiqQF888zuwpWVbP6/ScL4uHe4zOz6TxcDMoMRS
	 MnT5H37Gjp94aLNKfrhK75gP/lTJxSngbrnL1259+7aY2jsmn0sAaSAPd2NzYOLUV4OmN
	 DKLxVZoRxS3om+Iw0JaGf91ieDLcXcOp5+disMsAJB3I0BVghRVVQ8UIr8duM3L/ewg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779433;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ub3W8bOSut/jTHhCRWfRg/xfkegEtxU0Vyo56Bxv8PU=;
	b=3+YKxy0Py2C5UiDqX9whIAXLdE8MLb2qrcljE+oR8XQBiF+Krpx1ahGHTqljR51eDejc
	 DMKaLgoXETCaO3GmT9Pr3BHQ6oda1i2UAbh0A1I1aGr+REWkPKm+Mf5ik5I2a7OwLXULT
	 rVT7kErxFnNAzl3FEdk105eCIIjYs0G+1rOmF6W8mxNc5eH+cXGJdCvuBeXAEePZI2RZV
	 qT3fXWxiI8s5TeCsF/NvBWgadQGHEfFDpmoakjPnG8Nw5VGFi0LV7DlhrqOe+BxPCtVwD
	 uf3zyEfSpWM4IHt1BzzWKiPGAZIdnsHtMl82S1NjtDjkSxqr68hoaqFn5bq2RlXW5qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NgIQJR2k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPrMQ0GJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1892C606A328
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 08:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1892C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NgIQJR2k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPrMQ0GJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A46r7dL193801
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 08:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ub3W8bOSut/jTHhCRWfRg/xfkegEtxU0Vyo56Bxv8PU=; b=NgIQJR2kMDg6KvMh
	1FVNp5L0EWvVnU5Bq8CVSln3ewpyUsV7Pj/bEHayRAUXLEjpYCDnujxPz1a4fX9U
	X+93cPcL7xDRyiEMLs54jHIv4eMLvw71YfDGWTELeV84byvpUhV4jpe7aDH2RSR1
	KE4oVh/hycHS5OiS1VcKXMCNJwHWQmtnTVXl/w+nNsB4e1pv9iw7AujOawB46pwx
	C9qApE20iw9BDj/GMQM1pfY4Tm+q/8sFJ0Z0Q4yGBuDRO5eUJQznPaae6s6ZS0bl
	z7tTwtEgQwuAN4sogmRxFNw7JF7MQ/RCq5j0K28CmSTcybK5uoNLCUZ2Yvy5j96q
	TJhk1w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8njq49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:03:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb1091fffso8282185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 00:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779426; x=1794384226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ub3W8bOSut/jTHhCRWfRg/xfkegEtxU0Vyo56Bxv8PU=;
        b=FPrMQ0GJuyaSguLfQ1ZBvEJG+Q43p/9mECrmpdDd1D+HdvVyWZ9ksugmiVgQbXrMxJ
         JrjXcRp8yycicvRuWXpdUfvJ+t4fRVBXlPAdi5GQEdjMSALumxAKS+kdCjNSSSxeywWe
         myri/xG9B+32pA/fvKCIv2bOLbXvuCynWhbEfYQnw2/6PysvbvwdxcjHOuDFPnwDQHQw
         dXcJ0Lvm0QSNiov78I4/GG5lvqN8eLpkjfy+kSR0CQtHmVytQXUpbqseuxjLy+uTLXp8
         irjgsmDVnNtlIgohwK78M+cqisuvSxonP1WkYuTndR1mhJeiDX8KQlALTWFsRPW9FrLx
         Jfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779426; x=1794384226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ub3W8bOSut/jTHhCRWfRg/xfkegEtxU0Vyo56Bxv8PU=;
        b=M5MnaPdCo88K8xAY/yaTMptNC2ySRp697JQijO3nO5Lp4ef/7IasceYXjTOOOIBOao
         E9NdGu/ZseRgQKH3sTxBscNl0+CZrSa6ckNPerMPmaKM1cS4pCKd9T9QpjwRj/d+YW/G
         SUSRWmrKIqAI/eelSN5PG3a7kJXCqBhWpw+8D8sUyECvWq02GFCogMjTa5VtOUcXziGy
         R1Syh8U0pJ/xPf3gIRGv7fwuO9EzKc9VLjHMkpF9ylttL8QwkUFpT4jM4D+jxG+iFg3a
         0nOLbdm/r574FM3edys1S/OrHHjC7KVJUJ50Z9JVQD5a5MrB64cwCiHtu0N4dOVtEybj
         9tlw==
X-Forwarded-Encrypted: i=1; AKwUvBy+Oaj28xte5UQ0C6PkI+8aneCdXtIRPO3k2bUyZFxpMFW8N7FHtptEYTwExr1Uaz9h+LFVgxmOOjz7PA9u@vger.kernel.org
X-Gm-Message-State: APuU4Z8KO/yRrRflMWiNAXIonYcIQ9ITCA/y7JvLnEN//9s88HjvbVWT
	4oZce6bQflDkbMYTRsgnrcpddd8vkffEcSL9jQ7atP3vrRboCiZDxH4rb4bXBvHChnErnLtABJo
	ZJOyytMfcKvGEKW4Z+32sFGBTFbc8p+yWF5KQ1Fbgq1pgP/y/X0OaogsGXV/12okrDRSW
X-Gm-Gg: AYBFou2H+RSCtc1fDHe3G28agXpTVCDw8enxCS79nyLlg/92xFG3F5aJnLUyRV8hb+D
	+WKvwbqQGhtxPjujlrCJGG9a4qbVtVc959KA8L856OWjR+2ASpuZhCWC2WkKu0UtYm1h/Iua9BJ
	tLNwIagJvFJSfuj0k//KFoNb0FSNBbrzXNUGcwdb2gL68VyDNzmsuKBq35zvACVIhITpuhXwcIn
	UlbM4zq9VYBgP1Z4WhayDU9BIplTLgoJKkvuWKcI8Ea97uZ+hMbOhU1i8UHFjpxaEQQzuZgwCoX
	U05MvX5YUXGX5oAuf7QW/XOuJioiAfKVVhUX3vojQz4ASaFBh6Impoim9umxt4VCTKxEg9H1XQW
	Aw5abB3K2M4nYnMjoKribE5sOLHq/2yRNb+Fi4m2jWsTwzwKiSp3ppRRtWccm/ihFXvcV
X-Received: by 2002:a05:620a:346:b0:939:9ef4:79eb with SMTP id af79cd13be357-94421872589mr2773130085a.6.1793779426271;
        Wed, 04 Nov 2026 00:03:46 -0800 (PST)
X-Received: by 2002:a05:620a:346:b0:939:9ef4:79eb with SMTP id af79cd13be357-94421872589mr2773125885a.6.1793779425768;
        Wed, 04 Nov 2026 00:03:45 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55abd3da7sm520250a12.1.2026.11.04.00.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:03:44 -0800 (PST)
Message-ID: <1f57f491-56a5-42ad-91c0-9c55e1c6ef4b@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:03:42 +0100
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
Subject: Re: [PATCH v2 2/2] remoteproc: qcom: pas: Add SC8180X SLPI compatible
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20261104080200.135431-1-val@packett.cool>
 <20261104080200.135431-2-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104080200.135431-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfXybBDnqfbrSwW
 IyqArsO1BHp2xSYNrZCkugDUtkYwb4TLnLgwdFhdkK5ABG3n/9nrpsqL/By2/b5sAiOwDq3XFE4
 QZ7oYRcXOS+4MDkU+LWPSANjIik0v2zU6VgoHlX+sEOCipZggh8tsKfSCov0ilUiKKnI6FGqlyb
 rlPBt326yECGmHUVbDFd+qZc+yEnvF29ikAKsFuozNG5ij24i1TTmNssV7xiYB3SPVioVoZy4MR
 i/195NR+b+LH3W+tXzEEHGb2K/XmrMx9RMBw2lxLaCX9bHGWjTsLH/x1sHGXreHRCN+REdwdtj9
 A/qVL8ndek5CApSoLJC3RM4N4AwLGMfKtlzkAFVAyEBWhDdLVs+qysOPr2P8qOAh/z4EANNVcEM
 vnTnbHmEJkU67W8btuZU1EMg7bLZ5uj8Asv9kTfEtboC3k8f/XBY8eNrjAHZ6QMTjWN1PczjLQe
 MsBjXE1h4HbOqaiEMIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfX3cwoEktyjTUU
 NW0HeSh/tNGf/Hb6Yp5t/TaEep+83CbM8i3R7jwAVJTRA/5Khm8WyjoFOt5/800pJxp7V3BoeBv
 NZAiaCeuIQbstybQ+WxyUQ+Au2tUXIE=
X-Proofpoint-GUID: tHYVUH3wFErpIfmXOsLE2P6GNsGYJAdR
X-Proofpoint-ORIG-GUID: tHYVUH3wFErpIfmXOsLE2P6GNsGYJAdR
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeae6e3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Uz0uFBkuobC0VEtxzbMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040031

On 11/4/26 9:01 AM, Val Packett wrote:
> The SLPI on the SC8180X is identical to the one on SM8150, reuse the
> same data SM8150 (and SDM845) uses.

fallback to 8150?

Konrad
