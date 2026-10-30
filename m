Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349390;
	b=zLu2JH9w+l/ccfTM9vluAWa9gpSdE8kWl+42g1bxKFcHPcFIy/nFlVJdw7il7Q9SiC7o
	 C6bxqogD+rT4COLN8sT3XyGc9XVsYsXms347zm3roX3RhDoO54hRqsvR982P5tq2hlZW4
	 wReOEkT4HYUt+5jN5dc2njKeIRTdYinAz0L8RNMyEvPCA1zSDEiCseIAoU/684kd5jIad
	 zJYT5VW3oDLYtq2navVxWGtfZg8pIriBsdpUl5EcZR8CZ++/cCIb1G48FJh5dvyQbdCbi
	 zpUvtwQmY0P4u3GrZGoOlvckeLdt2G49bFd44HGGSChWnCx4N87gAcdjaDtft9ffV7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XiPjhUsig5pIDEdVHn36C4Ya/fLE2sA7Ys9Oot6koy4=;
	b=jWmuPO+wuoKoWMfCKF4gS16dFlH5VOCQrrqjNYOZORC+X8Chw4BYR4zguD73lCu/NNOa
	 RzQNRTofTh/kuvtqkp9YvwoOHjFSUrkTSWu9jMeZTkLSwU7HLz00AI7C2dsUo7hmWlv5C
	 z3gAcxwkxNNj9o8OF4vmhZjd1lBM7qnWZTSz3JqUSC0dFwDIlG/wvJtG4bn8iRkJvIm+M
	 iVQWKIcHW4/JXewZTLd8oiN5OmtTlSGGdpWj3PC46IArOr/vNxwQJJjELIM9qxITYHkya
	 Ti2w32iB38AArweFH4m3kpE9jO+3b2NgL+hYXB9Qh6WtRcDwLtYzKIWU2TR1P60DGgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zd30QhU2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRjezXQS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFE4606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BFE4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zd30QhU2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRjezXQS
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FDsr3709496
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XiPjhUsig5pIDEdVHn36C4Ya/fLE2sA7Ys9Oot6koy4=; b=Zd30QhU2iqk9ntL7
	Sztk6fR+WV/ESgBM+fdkzGRewZFpYKWSK7k1RDaCmvzYLBuwKV0r59AVg9A3nLh6
	Yf4jqKashRRwzzC1x7o7zl5rEhuZUTkPe9syChPxNW8Z0uYTGjKv2ahMd5y6kec6
	rnpZHkhgvNsJfbDLhavhtEDJucsslX/jDA6uw+L1a3vMK79tLxsQ+844ND13vxht
	nRNfr52oilXxbAOq4qvLZc/jGJdRLziDUnt9Us9ap8MbSLMNGKx1vu8zNnUlwizp
	Rv9891tfjHSxzaEre9iiF5lAwZXyOxK2bi4fIrvzo7o+Gs/VGOGlAGeWVhsoNUVE
	se+bGA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rj3c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:36:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cac495d99so2394085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 01:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349388; x=1793954188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XiPjhUsig5pIDEdVHn36C4Ya/fLE2sA7Ys9Oot6koy4=;
        b=dRjezXQSkvuEYJ3daXgErwKbHJIx7z11OUgALKAU/Y4Ta/HyldA9WLM2IpnnXbh6nU
         pIqdE26yUdQc9oj+o1OTIazrAGa6yyUdE4CjL0gsQwrB9oszw21JEVTNJlRzdpWOWkXi
         yp0JVgWdEDgOCOB10XonyVScZn+LJ7eRkqfNvm+SxuitVYz7nPcAEwwlgkpXn95hk+T/
         YRCOniNNFv8/t92oPVd6qbuJeuFqIwhfaHX+pQy+yobwtKCzdFbPPyMfKLFVdx2Kk8yB
         +7+t5AFL6s7y6uAwyqhgG0VXlADqkB2xmfXCM5WmhSdm+s7lUY4Wjka9gEs/WWTR0vAf
         fDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349388; x=1793954188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XiPjhUsig5pIDEdVHn36C4Ya/fLE2sA7Ys9Oot6koy4=;
        b=qfNfRp5p69PUFVQSRk+YtWwvg/fgC0ffwas57FQbKA0sTe7Js7LLUT/MBwB9cecdrl
         2tXPjUDarHsaJIQigiidesBUiM+XSXQdSNUEWlRmzge7I00BhXSjDiGh7l5msV9uoXm6
         EqkhjF9gajw6bAZ8LTmg3nKMCm4Q+UB4eAP6cMKbNRCV3VMh+OLPvC0BoNEMAp/fN0aI
         tnFgkq5U1sxNY5p0PEeoSKB2ZbBHZkykWl2uyxJCcESRYUePEZW/VUqEGrPbjJhdBidQ
         JxqnJxKnHL/W+T7BtBcvKuBjTnTP1fsXv3Y1V9W7BGmTs2WM9kWzeIhmCBfD+8eYY4Wi
         +O8A==
X-Gm-Message-State: AFq9FYIbCJYjYlXjbBeeVUVFx4hpR2dn+tS7XQtQDkEYvL0jCA89gUNI
	fj8cvjXOjgh3WIqUUFbnQ9QKsVSRAIQLeZ2rG/7oA3lx7eyFdV6ghg3AYk2bBygpdrFc+ZmdVZ7
	n25hihYtqPR4OeM8Rceqt8rMCekbsN31ebXtzLAuyJc4ndylAlER4aNh76Yk/hX+TYH9p
X-Gm-Gg: AYBFou2vVEwzat1pr/9beBpP0X+8+/hRC2kIA/OaT4EPEDcggZKvKzMS8ZObJ3pxYFG
	drqbBL8CqalAYHOIbZoXzOmujLRykfYDSbceCRrUoPoyv2wNi0PHTZrNjwuzhINFHn5ybkh1o3m
	RKPLBth06G61Tx2opfNbxYVhAvY4K1aPT/arZS8m1cKe3o04DM66cnBOfGHWpld9v7ezRb0Wuaf
	h4y4mq6rz49+hyeWZmSsfRbyWVueNesXIob2wBZajNsUs0zoiEj8SzkTgskqH8j/oeDLG9gFGqn
	d3L0P9S4hz0XJgDjKTR/dL6tRXDAPQc27ANuyoEHvVbdINy82Jdz7FCGGh7rIiRz1UB+h5J5aVq
	9O7hfvB5L+urpkXBhRHVVqnEvdLOVX7cbDBcBtc4NBYRjM86HbidVdn/j530+LBopJuAcH3I=
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr264143485a.6.1793349388419;
        Fri, 30 Oct 2026 01:36:28 -0700 (PDT)
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr264140085a.6.1793349387893;
        Fri, 30 Oct 2026 01:36:27 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe96185sm38480866b.68.2026.10.30.01.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:36:26 -0700 (PDT)
Message-ID: <f2aa28e5-abb7-4ce8-932b-6540b38ffc6d@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:36:24 +0100
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
Subject: Re: [PATCH 2/6] arm64: dts: qcom: lemans: Mark USB controllers as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
 <20261030-usb-dma-coherent-v1-2-3147b8f7aa64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-2-3147b8f7aa64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: v1y5-TlMdZe3nmgDJk3KYHC1eyyf3v5J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX+XE3vVaiRG/d
 ucT7bg80C5hdV8YlygPVsijtf52yavwxlOeqLWX6l9aa6rpVeBcQddVCPeetFScUIEnlbZqOnvF
 ORFdJjEdbfzmf+wj0oOcYejJbwho3cs=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae4570d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=B4nYI1lvG5CAbMSH5Y8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfXyceqGaVo2Ll6
 GTGI5HvySMsulfTnK3u27xEmbpuGVe+8OgwYbcNnnxCrPH8NnHzRHcLEiZi9k0eq7D9zNt2UoNN
 vwRjMcOvtdUsLRZRlSFW5cI23ePFpKVRorMZDSX3aUXG0QscmrR6KN6Se3hoeL3uQaElQe4OTch
 TneEpwNNz9pe5TE+q9O+7+rGl1URCLWPbJtNUVgyRG2DAD5vRWOMcZZ6XUfd+ornedFzhkjMXQH
 5kcPrh8ZEJgmzj3mtyrjoFk+2gMGFWPbDNo2wNd/SXZPPZ3uuASIFe6mqMICxygL0GN9IjSY2Hw
 3PulW3HgcqFbp+hDIbvxN2KZXF9NWFlTFP/g4jxFSYtWvVL9GjuvrQv/iTu7ZcOxCBPO2NSWbMS
 OLR321ut7Iqd/gE0CaIhfirE2SlYHCX+HUjAe76J5yyBrNUggwnIfCDuNLlImLcRrLnx7bAeRXj
 ggP8Fgl9mY520OMql5w==
X-Proofpoint-GUID: v1y5-TlMdZe3nmgDJk3KYHC1eyyf3v5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300034

On 10/29/26 7:33 PM, Krishna Kurapati wrote:
> All USB controllers on Lemans are DMA coherent. Add property
> indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
