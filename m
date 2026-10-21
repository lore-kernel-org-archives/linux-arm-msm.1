Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572000;
	b=joZzWNYUHCLnDMAbejoHeT2bEd99eeqSzOly5Xa7uviwYeC+dZdIaXPDil2P+FfUu39o
	 7ToHBmy9YvMbNOOeKT94rmQQjAIJ0/Eghed/T6mYFeAY7Jn6Ss7tvzbVAqU+VC0zNonta
	 ZAKWKQKiDIjjNzbH3AV3SfyPTNCRhnGJo6xGzkxqUzdv2eNOO7sDcUXBLB0OEhP7Cy7H3
	 a3paweZJXRxBHq1mcwy3GnoGqPwBkVciLLisfCb9YvUkAaHk0KVAoCAAJCcsqXnyRYUdh
	 hOO85FIA/hOU25aTfAKpIr9/MJECmRPfNwCK4KHXcCeB8xc87Y4lCqwcNu+C6sYO8bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572000;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Eu+VlkZRyZabpCBno7qI5H9BN7q4P+DGNA4Dm+cX548=;
	b=eVAxiVMVXc4j7HkJ2FboicxFyHQewLkObeXImDAlTCoyhA6+LAyP0xRNSRCODZxHH479
	 cN0jdESaFOq5p4lJvU78H8LkPrsroHzvbZ78QfUSAS6+Nw+DwKeWAdFVtq8nzJaeWpOx6
	 d6Gkgsurxkgo55qp0NV8sIaaEurouJxRs4BM+URoeA3W79ucWCdiuvLKJWDLewIWtAYMW
	 1bFYx2N0UxhLP9Fn2PP7IhI251j4r1bZjsLfY/4rQo1oBnyzR7OE0VypB+W1heQq84p1+
	 1ZFq6UDCaC4i7DMt1qxHZmI1wycSKCA2534uUDsia9mBT8N2RIfx9KEib+r2f+nEhCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="T/qx+OFc";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DJKu3I6o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D94A60A261B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D94A60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T/qx+OFc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DJKu3I6o
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L6Xbw8357330
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Eu+VlkZRyZabpCBno7qI5H9B
	N7q4P+DGNA4Dm+cX548=; b=T/qx+OFcw9/2D6aQFQ52yElW5d9+dtOlK/AYphrn
	1Kp7TdIIM468zvynEAvijO1JOOeBLIl447DdhN+9JiOY5RjehQVo683FKLlgnTCj
	nB0sl6YcUQZ6sseYks9D7M2fyJlFEsxloKuRlSLUOMxjdS4Ekk+VmHIr4xo+S5XO
	aSCjB1TPVJz0DQkhvpPcSOessj+f0tlYKgAegUGyZEwBe+C8fIFypS6noTiper5Y
	MVJ1AJg7ai6n64bi3jvMsKsjH7AR9kv7zRSbNG5iDPnEm9738wmzlawdMkn4cPO7
	WD3up+RFqEmptY0SwGP/A4RkYW5GpL5Zd6jIvn/qA1sKQA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajjy5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:39:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so51606585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792571998; x=1793176798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eu+VlkZRyZabpCBno7qI5H9BN7q4P+DGNA4Dm+cX548=;
        b=DJKu3I6ozPRQajuG600bNUKwedCy/gzNDD8EAx9afw1KYbpnRUYC1grggvaKNrvE0E
         dTCzi/Re9VfBmZjmqjGCrG1RKgF47lAXutpCDIC9igoyKEYmt7+1a8zkG/110yf4YHI8
         Q4o89X4vHaA5bKSwE1Geagu0FVl3I7IorfvqKhsHz5ykv29JXUXwLNpeAzXzki6ufgXK
         tj/U69B712pFQA/RJtBqYwUJt3kMa73v2Zo8ft0saux+r5HZmxn2hvGfzFGXlSU1d9A6
         qtT1iTvEiGt2DxtJrM1yh4XFc/+/MvvIeYgA8XK7iCONWKIj1RHifpdkvtP/IQPJQre9
         MBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571998; x=1793176798;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eu+VlkZRyZabpCBno7qI5H9BN7q4P+DGNA4Dm+cX548=;
        b=2fHuwCKC3a6YPWhMu+oF3IXX1gXdCIMNzSNH54WXEYMo/RdZVeAyoCi8vOo2sJilAk
         8w1pncp/F5vw24BBY+BZHlq0xmGs5hXHAv59GcWvyPPnP1ccrsPi3XLTNE6EAparBLsM
         71iLzPeKT/AN0dLv+b14xONf4L5PU1df30TY1s1ABT48rON7MFzjV3WDuHBz/JuqcXcr
         sy55wKsVObKorFBhaAU7+RkpQrFWVrNYeeO76OAtsWqy+VrCJWuLvpquEvBmYg6Zo8Nq
         CWoR1cnkcELefIMpDvxrhAMvCXbQDIPJ9F4VrPHRS36VVC0KveHZtGCd1a9FrmyGOU2Y
         QWtQ==
X-Forwarded-Encrypted: i=1; AKwUvBycspZXhPp3amN4+v2VF6Vi1tbeIVDv3ZVgj8sx55VjCe7etP9bhVoWJMTV5CobAvuMJRnu/wA+WL9AXCtp@vger.kernel.org
X-Gm-Message-State: AFq9FYKXs/4+5ZaxiDIFLbiYd1tZg9iXJDNA3I+QB1o1LYkv5T8hhLJj
	DB4qaJsL0vsYyiJmwGvjNOAuXjlkmfaq8Mt7RWNdSRuHoGFCNAc60kS/SlOLxj5orCcJ6bHkt2v
	0sSFAESXNvusCcnh1pf6GyjqvK6sCJGWwC1eiinJmKVq4gGlwZCajJMscNDh/iqCmWrDH
X-Gm-Gg: AYBFou3lCcPCA09sKUcbzAsnkHtcsxqD7t6HfOx2KYt4bFjDNtatUSmBXLMO01eKo0L
	lfX2eqfBoLYJy8EpaVjH3VwNhdrVDHVNs1GgcL4YkpF7A1Qrkhj2bV1Fltzn3BJsyLs0Nz4YrOh
	FZhxAlvhnlnm7m/iSFTx4iXulObeq19JQQaY6ztXdgh0yJ4GFNyJ/VZGI2yP659tcdvDZ5L1g7s
	XDGUdvF3l8KE6ciQZuA4q+az3DQp93NF+UVWKJL7bfZskyj3fXZFIbpxFylvAwGpiE8yNUL5nRa
	KuDZPHg3Xc1hn57TaMInijIhWQ9aJne7yYWOVKMMEjA4u90guY1KowU7h5cSEUv4aS9g+hoSK/x
	hWKxW+73lMXCK5nr/
X-Received: by 2002:a05:620a:44c4:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93f57f8184bmr302265285a.45.1792571997383;
        Wed, 21 Oct 2026 01:39:57 -0700 (PDT)
X-Received: by 2002:a05:620a:44c4:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93f57f8184bmr302262085a.45.1792571996712;
        Wed, 21 Oct 2026 01:39:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581eed3sm4383464f8f.12.2026.10.21.01.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:39:55 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:39:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sushmit Singh Rathore <sushmit718@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to
 bi_tcxo
Message-ID: <eqgi6p625bizyb3rnrwmdgnnzrwja4w5cywdy7rjdgokfc2vd2@i7e4da5ymatc>
References: <20261020142157.1749-1-sushmit718@gmail.com>
 <20261020142157.1749-2-sushmit718@gmail.com>
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
In-Reply-To: <20261020142157.1749-2-sushmit718@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX3Fhr78u3s3le
 zwPiO8Z4nQbahtsCMOwJuTE+zbno+hxQ9uUQ9BrENtijBaQ2p5TlL0UwbPsXj4KrJgiriE94PXo
 Vnwds8Kn4+6+vTlQeq0gJXH86N9Lsk4EM9DHI8p/P+yTpmApY2x9BWS9FN9dJztFPm9JIO1gca5
 Z4Gus4MhtMHRjjJ5mrWyhT1iUZeQp2Nb/8XxSG1HPTOF2n/1iCNtYL+4xbNDrwVFA6NkhqRhQce
 bOHNP6fNX1bpsX3Jutb68zY4SrDqeHakp2XPtjkn96sfvSm6wRYWLvJ6LcTiMtugHP4166xf6xW
 9xWdfOhnDCbbnIIwufm6DocbMaUPoodRN0YbQMaqJPInCokTjsnXOi6kJSQ92GjeiA1lgYZqgBI
 Bd4bOiGxSgsmODdjHHa2rWL4Q2H5WuRQRNHNxPypHDUjSIe8ftIhK39m4TaCHNnsv2OAcHmmiZa
 SO+haWf0pEZ6ZUUYCvw==
X-Proofpoint-GUID: yteoSG1XBAsqwoOnTTiULx1UFRwj6HRO
X-Proofpoint-ORIG-GUID: yteoSG1XBAsqwoOnTTiULx1UFRwj6HRO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX9oCfrvDrA/Rx
 pZA17oXjGyYPPeI47JBKG2RQCqFoDLEmyRDo98Drquiy6S7fJjf2f6p1kKQa8Iqd20CUpxW0e4c
 VVI1vOVauWhvmswwAb+X4dZTRRhbYb4=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad87a5e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=b9oLyuJ6L9Q2BeRKDwEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On 26-10-20 14:21:29, Sushmit Singh Rathore wrote:
> gcc_eusb3_0_clkref_en gates the XO reference to the eUSB2 PHY, but it
> has no parent, so its rate reads as 0. On SM8475 the SNPS eUSB2 PHY
> takes this clock as its reference and rejects a 0 Hz rate as
> unsupported, so USB doesn't probe.
> 
> Parent it to bi_tcxo, as tcsrcc-sm8550 does for its clkref branches.
> 
> Fixes: db0c944ee92b ("clk: qcom: Add clock driver for SM8450")
> Assisted-by: LLM
> Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
