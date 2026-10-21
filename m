Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570028;
	b=pViKIkrRjyY90rKlun6VxPCjhfMCxE0m76O52qzCNtRr70tFxXq3STXsNL/a0P6wpdcf
	 GUQFOxMGeT4Zxq3COg0lyornV6050VpyFGsUwnMXbjXbC9OqqLkN3QUc4LtEH96B2xicl
	 +2BKTzpSeq179ZwKrJ24PGWAPS+j908yeQCBbCLGsRi66DJfv/ELkj0vpjSNa6n+VbpZC
	 QEgv1RojfzWur8DT7yWr56Q4208O3Wkg801JMJTIvVsPUxBDGfidi+jyFM11cJ6R0IhP7
	 xCKgI5XkOxQ6TQ63yth6L6A09I8dvLOF4INQyjdIp60Lpue3vFl6U5E4PGLm1QyADeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570028;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=;
	b=38GxmKAet9HyDNKW5gPqnYyFwMpVCFAzWZPQW3BrvGa9bOLqTTwvmuwfDNGv17lD9qsY
	 lRMg2S8UuwwM8ZUKFSxCMe5zPtdKwvqwJQSJ5vDmepuTVMKP0qdqcgM6lvX/QQAtOWzrE
	 vJ8KfCoILQj2EQj2BX5/+zC+jmN4JNzsdZ2LqBFVZjl751CmPfyWAR/kscL+FwZJaIaY+
	 P0TQVuXSr01FTUT4uVquvC2y1MKJWpTGxRWSc3SA265+By9d6/6SFSGA+TQWeOvDsRUMU
	 e5W8vlSmYrXTNoJFLdiGCz96/zK9+7xy+8z/nlxGDTSqUqxAJcOePCbsItQ8eS5npXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D469CcCT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dbed3YSU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9F6606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE9F6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D469CcCT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dbed3YSU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j36e3355940
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=; b=D469CcCTYrCmjf5e
	kTVMVJaULrG6V/52/UBW+zUCeEHYMCS23FR61DZ96Zi+KVMtk4LceZ29x6hhnSYO
	u7g7S4mWz+7AVzr8ffWfGlLqmwwSbZjyHQuosD5fgfEGn+bTD11d7E8QQ/o3KI5n
	NB3ZJebwsi7GSYNA0aRGmSuR0emoZ4GXTvB3lahe9bJ192bC75gKLtpFK68ivodd
	o++Qs+GexfZMcacEu3JnMV4CIebit1pYaui0judywSnMRu6DYSJv9n3vY8tg2Sae
	byiXnqXIR2QcYJVZurzj8a/kHE0l8Ug8hpryf4l2a71O7fCPKEn1WDrxWUqc883T
	As38xQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0jq8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:07:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179d9bc964so1619266d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792570026; x=1793174826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=;
        b=Dbed3YSUsOsde+b26ZkuvlXrUqVe9wqvw/2pafB51IGGl/JxdXiH9qSBP73EFYRGNs
         NbOOsbGJcNB9wUqBNThytp0xJJOLJLtHVzf3iBK9gAZJSgI3/oDLtsK/nby3/7FJlS9v
         hffhn4GspvtC185St2XQyvTwkiDnXepoEomueOjqc8xd1GiMc24Agzz3atjARzsBsQJg
         Zmuzsv5ih46LCe5UYCPdsmrynID+Ey24t8q9xuFQta8h44Pa0xG3j968trSHcINBQxuc
         5bt0L5OMDAD0DoHgb5x2PPouBPnkix+WbL2x+u4IqOKPPImmiq4rOfkUcRVrs/wAwUwM
         elog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792570026; x=1793174826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=;
        b=VoEMWXUN4q6UaiQn1m3IT3ylyqLzTS5GtUdOfuQN/LhE2lee7ife+3wYeEn6F6q3x/
         DGkCCrnNOKEhmRFiiWs6iArNt83EcbTgU/O4DcnVVjAFYqWGx4BfzuDogjQ/QEmxnGDx
         kPTRaQZqp8yKLiaW0uAZ9c7EWKEl/GIw08wCRH7NHprYRAUprU/2qTYpmy+IsK5R/gay
         g2WeM4UuLWK+md7dgBLrqq06tLxGM+xgQO6Ehm+8pEKNFXThI5vdJqU9uyzWJ2GLuM2k
         /MLkkkRB0S+6H4+V4CePwyWCLeVl8JYLhIq45CHq7ttI8vXhlAFCs3C8DSa0dyQ2CPFi
         JGbg==
X-Forwarded-Encrypted: i=1; AKwUvByBbcwxDE5NF0rpj1wXOi9aHulUPThUaMMr/ALPCUmJrGVxJeBmpWkPjT0WjFYiQieprH6fP3pt54vDH4Wi@vger.kernel.org
X-Gm-Message-State: AFq9FYLvHVNhkGrUyXw6ypyI0jp7cubCjXM8+3W9QAaQODtnJyrwLRYj
	8kTn95CCYwDCEzesC8eQZkISc94WS+Aqb1nUWdBLH+CBn8n+5G+BC9sYO6bzV6IqN0KiYTShedd
	RVNu2dAhgL+nmXJDyEme/6cne9vNVsEJMH7hQW7+dQF6z8RPnA48U4d8D5e9tGzm29XCt
X-Gm-Gg: AYBFou0x2No6NoyDAbUx5JyvYkddFr6tN/Jnlgl0saf6S41lZl7O3HpSmlhOkV3/8oX
	2XHSLR7Up0hgq0NVQ0y6+Exu4jS5LTu7REbszYaNXHd9ewj+xhCrDut9oedlu4bUlQAW7LWIzES
	+RnZR1V/K98bO8SRerT+cjdbfEHo6gSkBthx8v9yBYEMpUqv7Mxuutx/Ii1dB8wrz2gDpeemjJ/
	LHxzRUfYxHt+vNbQ6RqAzaz1UP1WJcCPzQCkNjGvRk9nzxpAuTZqTP/qiVUvHDy4/XJjwaASIxP
	K5keG3Pf7MZiibqskLuFzS4Gj3nyCmJUs96uKzUttJ7ozDfBI7pQnAYCDayIG5o1ka0qvXrvmv+
	Lm/hWjr1xOBDALzXIGdbLPw==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr360715085a.1.1792570025868;
        Wed, 21 Oct 2026 01:07:05 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr360710785a.1.1792570025342;
        Wed, 21 Oct 2026 01:07:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fd5edbsm48905266b.56.2026.10.21.01.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:07:04 -0700 (PDT)
Message-ID: <c5901e68-67c7-4118-8d24-91e6881cb0fb@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:07:02 +0200
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
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: ipq5332: add support to get
 watchdog bootstatus from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
 <20261019-imem_restart_reason-v3-3-e6b1ff5de841@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-imem_restart_reason-v3-3-e6b1ff5de841@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfXwVwYD0JDgmHK
 3ENbmVjC8MGpIJXH5Ksjijd7di9MRR6W/glsiJNVxgT6e7eJ1EypJjeGm5ev6CaijtLzgUV83DV
 iane+aIsBsDWXdQUo9Tb1kk2dVnCa5nIr22JE84h/RibtqQIXcgqnsZ6gvPto7QQb4anY9BL+/G
 NgTco9wb5xqb/I+pamuCnMytA+1DhfIgWIwio75BpdP0ZIxUmQtvkiPVtOWf3EY7DuS+Or2coiU
 GkOohc1iebtWZZ3f+ue3Iah6CS2MpCYFNtUl4expDCqH9ckc2STsaw680yX/ZFZJNCakQJ1J4EQ
 X/fnbKmP0Ijr1MvxJPXoN8GvZDtkaodOEQpPoDzOJCP1iKBQhzXk8gEF62/oq+OfUd7gs5L7+LA
 psbq+BPWveG5Fk9wndTnzVldSL+zyIaD++E7Y8XOFMeJfQ+VIcbcb+mmMOfBcbRY99LhmBZJqOY
 aS1tBAgBfw2m8RWJEew==
X-Proofpoint-ORIG-GUID: LLhjuJFElrxqy7a6NtF9KaNb-L2u5Wa9
X-Proofpoint-GUID: LLhjuJFElrxqy7a6NtF9KaNb-L2u5Wa9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfX9LILkH9KOl2i
 oLOh3J9lpaLXhR/pHgwt9xhzyY5JCwXic9Zsq0NzQvmuet1oT2NP81hOlHwyXl1HNl5k4AKhISN
 wvco/SUQSHlHjPz61FI4gcZpnx0bVU0=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad872aa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=V2dyZ2dXe6VeIo8NBxQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210032

On 10/19/26 6:46 PM, Kathiravan Thirumoorthy wrote:
> Add the "sram" property to the watchdog device node to enable
> retrieval of the system restart reason from IMEM, populated by XBL.
> Parse this information in the watchdog driver and update the bootstatus
> sysFS if the restart was triggered by a watchdog timeout.
> 
> To achieve this, add the IMEM node. The overall IMEM region is 32KB but
> only initial 4KB is accessible by all masters in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
