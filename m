Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585055;
	b=Su3mfoTKfhhcQugt1QkztqhRsQBeXgKJy/GbI1dcT8X13hPoVzkJ2aGg6TsEhTy09gCy
	 QxbSK0kSUWqmmUstsqOXlxGfVq7AKXpbL5zQ7psN5PmVveiMPDv+WkO+s1UPkJaxyNnfq
	 SWGmbE5UZ2c/WYrMkhjSrgs1OT4B82of8zonpFHVJN25QBizkoGMX0rraObnt9vWqbFNc
	 /tTFyKQYnsQ5G8WV29AofSCfiGMRRt5IMrF9cqXj83B7iwCd0LBZcuMGsW08u3+x0+xvb
	 ibaHrxPmWIiHpt2iOFrK+U0WWTpxjMof6ARuRH5R9vl1yfcpiLujrost6OIHifclr/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585055;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZU6PoNWZ5NCCd4q+Ok+vNmLM5ByE8F5bCoJ7jkP5aB4=;
	b=3ZTdJwIrt3Hl29oaOpDNhHUsF+vPgST4+wDMLhtqN/hdDhig0AiqhhYMnDQDNARWOU/2
	 u0hrf7+/MTPmogWgW6QfMlZqX8hBC49u3OqBqIUEFEXHXICXx3wbYzsXdtt6EucYaXVIV
	 8NrsAE3DAg9iad2iYLBnh+iUNmGd3TXX10BKd3tzq2M8DJ1d71d7uNd7pjFDFMUlS7J8M
	 Ppb0xF5XdIZWHxVNhn3VhEM99PEbTj2qc1guyBLC8K4qjYiSEiDT4XSHKVvAmMD94+dls
	 x3LBL4VT7ubjVTtvmZ+UisWpxkiFhUGPXNXZasx4tHvrLH65d7+zXR/TXcc76+9dVdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hq106wdr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fKkrU0u6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B92D606A335
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B92D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hq106wdr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fKkrU0u6
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBwcEm1090411
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZU6PoNWZ5NCCd4q+Ok+vNmLM5ByE8F5bCoJ7jkP5aB4=; b=hq106wdrCvnaZp0/
	BDLD2cDahdCUmhRWtZjpB+7YCshF6VxeNFrTXtBUIvGmxn8HfZUQBQtFWdETR5vq
	aYsCTkQ2WCNu0HvEYe+8sKcEXmkAKQ6+wxJsvtFiFQPQGE39zUTmrvtj0/GVRT5T
	bAai/mO/sam/re1hV/u/G7r9+KNmOpzi4qG2FEEyEX7L9zIo/QklZBferOfvRFjH
	JDO+ZG3pcHZtz4eeQTsjPvBqlg8PGlKrMZ3hV8rM6QPf3JNprzpU6Wjh+u5LZyLw
	Vob4+9lHqLmibwB1StTXcUvs+Xhf3V0ORWrzQNNcAtVDBEvjfhAIvBJiPHwI/oFd
	JLmlmA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajktgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:17:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1440e081so16022285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792585053; x=1793189853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZU6PoNWZ5NCCd4q+Ok+vNmLM5ByE8F5bCoJ7jkP5aB4=;
        b=fKkrU0u6A9fBdR3M++1pZHdvYPfCEB95kmPNClgzKscG2EiXw3swQIZIFBG3xKuMGf
         BcfCcqU9eCvXcTd77EChyxcgqzn9qVEJdcXu2bcvtpSD9/IjDc87zlDO4fZgjT62AfZf
         8HNk2bu44xeCv31uNynYyID3P1J2xLxUfpzC3pPD7jcdUrrarLcOv5ISm7Nc9L7Eij8X
         sxu8JrAPfcQS+uwqWS5RJpURa02cnYkHjTJdZDh1U+bF/g8kaqM8qvjlR8RAdpIs6UvZ
         DvaFQTF7JdSy4xwvABCAHj8+PMscWhjNqfZF8F1kbmZ3tJoMxpqFt906pgh5uv/hktNl
         TGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585053; x=1793189853;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZU6PoNWZ5NCCd4q+Ok+vNmLM5ByE8F5bCoJ7jkP5aB4=;
        b=njeUMoe7MqFTGOS4g8yuDtTUm5VkK3a9v/QaPuucAWZ2JT0FaazPS8qh7BUEM6cNXj
         nXQImuwyvasAdIKfohECNbqCFr+z0fYt8n7oU3JKCjCqsS6DemSvRGLBQCclIroGtb+e
         VIR+4vdiLv/PYEWpKTW7VfpJy4tryH6S34QDxtslatOFU4mtcrfsR5uBWuaPE1ZsHQV4
         j/XMt6KobQ0gUUQQ84wjpW+nzsTKg6h5bDcfgiuxHI+Jr30/IGGRzUJDBB0twVvpXGEd
         F7tB9QJzKTqd5eXOSUsYzY2lm6r6ICqnxZYu2RpPdbLIFZdCH5uLhkDnep/cQqJQEsE3
         VI4A==
X-Gm-Message-State: AFq9FYJbMICioNfXCDhAUD8BhBib03B4kj96hdUHfJnthXqEf9O+Tgrf
	xV/EEd0ovdTdeUxfWv6sGyA3yFCF4+GTU2jXojXM7ojYovTgXL9WNFkIkliFUYyC9De1k1Ntn/4
	nclwQIYCNkWFciYoxPFlVmBL981SgRWqVWDqrSU3Kpe8d5YbrrI+nTH+fDo5oyW4hq5BF
X-Gm-Gg: AYBFou3Uw6Ya9QzI8lZEAhwcs8voz3UAGOhffWgECzOuNcvAk0pdFA4K5u+8fNCQyvO
	6pBVX0wfqmngx1XQ+Y+aRfAXuuGi67Sho93eL5rHyacBN/sEthtAn/I9+fFBPJHabuTm848kWZu
	PeVqNodi8bTH5cVx99uh+65HfD6tk0qW5ja+DBdpPAk2m73wfsjrRIcRO2XWQvVE68f2J4I7quW
	cw3wRUZ5/oP+PAptjN+Vu/8J/CkmDCOULCnGUelwH+xXIVwHaoKGHSvINL2iEWAEMFVGMk1xRkN
	/ONZrTHMDkR29JgPN0xeyX0bOkRIf361MOUCZNUNcAwG4mzMWUORfx3v/miTCZII2ZdM06vBig4
	TOX0J6DXpo1yjz7Yx+/ccMg==
X-Received: by 2002:a05:620a:6493:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f57ff1ff9mr436658985a.6.1792585053148;
        Wed, 21 Oct 2026 05:17:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6493:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f57ff1ff9mr436652385a.6.1792585052487;
        Wed, 21 Oct 2026 05:17:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f7c55asm71894466b.20.2026.10.21.05.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:17:31 -0700 (PDT)
Message-ID: <eb5a2294-2e1e-4449-827d-eccea61198d8@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:17:28 +0200
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
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: eliza: Add iris video codec node
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
 <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX8vHJ13C/DpvG
 sdvB+EGBliX3LlpbRuA56SbWABDA9gRBqpxpDDlTNgOpIgph4mQ1OoLMS5CYJCgw846Jal8YXMj
 BVXcTwXWtG4MmIi4up/tLmTh9jOfQm+uBMX2jLEu/3jLiN0/UOj+fX23U0nDC5U7TBzMsSmcw0b
 ffXM/RC1fcTBMq+fnLz/OHspbfVn5sFLCgRLwpTfYlSh0wB00//Mq6PVNRO4r0554zpY+Xozku8
 PIngrLdNXTZXiSz4O88o07BR7yGrjShayvxmjo2awJK+KG8eLkKF60MmchAh82LRFgBSVUQMbKh
 YyuPtdC1Yzjz5wexvp4eY6fBNNZwk9QKGkC9HlKOG/zMkDWESFjDL6UoSENej3DZtCloiBlO82N
 iA65DgBnoj6CqrkJGXW3wpgqiVvxHYvsvi6TDVlVpcmYiMEoHFwqzztYb5aRp9VdvBY07c9L4Dq
 lLKrsCze7p2xo2yzlBw==
X-Proofpoint-GUID: viGr2rhDSmaKJDG6EQUvINkxqqIAYMhf
X-Proofpoint-ORIG-GUID: viGr2rhDSmaKJDG6EQUvINkxqqIAYMhf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX8txLpvaN4T2N
 W7HASodVJnaaUXz63z2Yr2IDtPAUX0v0TXXY77cJkVK0L9G+hSLkKPp9DHA3DN57geot80qo651
 kM1TzYin71KTSAojiTkRm+DJyU0qmvY=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad8ad5d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Db7omukDTCqXEX29fTMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210048

On 9/21/26 11:51 AM, Wangao Wang wrote:
> Describe the Iris video codec hardware found in the Eliza SoC. The iris
> node is placed at 0xaa00000 with VPU3.3 hardware capabilities. It uses
> GCC_VIDEO_AXI0 for bus interface, and VIDEO_CC_MVS0C/MVS0 for core and
> codec clocks respectively, along with SM8650-like AXI bus/XO/core reset
> support.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
