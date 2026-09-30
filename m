Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAD34BFE71
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767073; cv=none; b=DLsXBK7XKsO6kV4w2oKouYDkr+BsACCvx4lCXi+GyRKgjqzkUSIj0A3Djv7RuP3cNxRPJzbY8EdiAuCgNMua6cDfOGdm/o6cZnf0Q5W1VzlESEF015hHaG53pNF3RQljhkq2RgKT9MoVvRjR3wEalxywcee0i/OItS8sMAxTGXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767073; c=relaxed/simple;
	bh=nVli7s7SIG9R8Ak8hDj233cUyczfZaKTWK1A6eda47Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B7t1GMJ8AjVjEF0LtR2e1T2PeYBnffeSV+n9uWWBNYQt0F5GqrzEIvxkRbIMEsWXJVeXujdBO/LsptpLRAJQUQwpQTlR2nHIK0rKjcNiuK81IhBvrYYFQnlI/bqfYXWIzdEHr08Ksz1+YoOcmiTxIBZFRELF1M2BgENFFTOHAbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=on+Amdzh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TxXPgclb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="on+Amdzh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TxXPgclb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB8KmE2898191
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jN1MJymaRVBcVG6FKC724CFrGIYLlKb1UrrRV1ot6zc=; b=on+AmdzhiABp4AVN
	jlvqS8amDfM2NaX3SIIGVQW3fAGlyaI7+iZrcM60b+77ycX+JEi4k7SWTf48cOux
	lcrxtIeSUtGLKV2lHpEVhwXfJTYBfjiI5YDHzeK1VisBmqwh6Y6RjFSTBxTB6uBe
	KBspyxMzrO0LfQZhE3SOJyrAr7cwZwPD9TaSraeb+H8ggWhE9A78FMQ66lvHiWIO
	QaaEIaN4I/VgRwnwnSZIuz4vfGQPCPpeEvEYmguwYjFCcMF6WfpU24pn2zKTlmOK
	ZSWD3GW43+kb/NMGJorv8BInNiw87hG97x4XY/LBorbyHSJtzRkoKDKn9Gc9y0z8
	ek+jhw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn1w0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:17:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179d9bc964so1207936d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 04:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790767070; x=1791371870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jN1MJymaRVBcVG6FKC724CFrGIYLlKb1UrrRV1ot6zc=;
        b=TxXPgclbuy5CzMv4a9GwrUVEjjMJiN55dqwX0w2vbcvtp6diend2N2j8Yv9zs9Kv/+
         tYPLq5KTOrtmO0Dbe1q6IMqgE7yLjuCh0FZvBf13kV4gOE8gxMwtrefpP2vpj2wDFo9Q
         Ra6rRECphsHCMmurIwWvqzdtOj8m9br2pWPA+gYZAtzPPcXCkneUh9vTFfZnFWisoz9/
         yLhlvxk8Yu3w5DxAPV3uPumNif/OH+qsCgb3KiX9b5Arls8YyV3K8JCdWO6+u/rDuxJ/
         XDgb/ef8KMNqsbpSEmrdKvQ5pn+HaiumTCte2usPaBp0thQTAHK/WovVM6AfbVVZzRp1
         b0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767070; x=1791371870;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jN1MJymaRVBcVG6FKC724CFrGIYLlKb1UrrRV1ot6zc=;
        b=jemanr5T5ruY5ZY4ULbMOa6wwucp16Y1zmTvwo6TOma3SLpavbmTNq90aQahFp9w7S
         +Z06iVaSMbprBLA1C6/qdhvni0JleOzmEQhSqU0x6fqmKdnP/QXj0ifSdz8jWgnDjvho
         0an0ab44t+448Zk4vivr+WADIkUVnwnJ004gfJlu8D9sEN19gdSrgRuYLEruKgLkT/tr
         WXw7N8mbFKTd0nKqXnbSEwKfFwNU1DaPGJrabnZQLv4wBVimTAYDJutflMZ5wj2qm8RM
         pKFK78jTV4B24vhot0eVD48+H1Q+hN/77Fp26+f4UCHB0vRINh1/3v3b9xasvYsgOz6U
         Mt8Q==
X-Gm-Message-State: AFuF++mIWfLhsNugoULVFTtqcnfcNQu+Aylrze8P/QwiyB6m6yT3jTOG
	0XGku/0y8BGb9TVgv7OLN7vqjc/bev4wqaXnUuLxlpSDFXGyPwihQu5S+889ifSa+xspKfVG00t
	mh23wKrYKiktIjpwT/PRF99eX1LtLtbM6TL4qjTE0B5wcHHGKdNFrMzEixJL1h/5ALbp8
X-Gm-Gg: AYBFou1CRVyEwwn7Cj99wYPDziRJeNxx8srXXUHXCbo3z5gtpf+9TKrznHDx7PZjykP
	dY6CFmSSaXSMDb8L4MgUG5hZ0t2ihoHNB+dcngp8F+3WN5avOcJFPSOGFPUeEGKKW6d/CPkxis4
	B6n5hcwYzAzYLx0bqacGC1cjx6c8qAKEbSDVZp6U320XyJ2Xf7d1bcRVuqpxgX94Fsf4t6m4zrh
	qwNvSmFtmSfnKBlAbCvGVixDuofrX9/H6aIvvuDYVqTVzMSvC/XeWiq4kzPx5u4JwHzHQfiarxL
	pY1EWCh36OLkdXJGyXeBMY0FfS/Jw599gCaWVcy7Cu1gTf8+tb+8BvfKsQNeAA11q2hGAT+Z8u2
	XkpmsCR6PVkZJh7khtOiMYg==
X-Received: by 2002:a05:620a:318d:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ca980197amr163469785a.4.1790767069588;
        Wed, 30 Sep 2026 04:17:49 -0700 (PDT)
X-Received: by 2002:a05:620a:318d:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ca980197amr163465285a.4.1790767069147;
        Wed, 30 Sep 2026 04:17:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f61b18sm51194166b.35.2026.09.30.04.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:17:48 -0700 (PDT)
Message-ID: <317c7e66-e4b8-419a-bd52-38430a9ed6e7@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:17:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: hawi: enable iris on mtp board
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
 <20260923-add_iris_for_hawi-v2-7-016ec3d24b79@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_hawi-v2-7-016ec3d24b79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abcefde cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=AG5diU-uafisgQmFzkcA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 9KpX3gGdto0OD66AXD7wH2VLLSQwGyQA
X-Proofpoint-GUID: 9KpX3gGdto0OD66AXD7wH2VLLSQwGyQA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfXz2ItVhmuZLu7
 c5zP0eJonF0d5BcbceP/xoD/x2b4Xb03nGhoTCyOuJIXbbCrFWrIk53hc4Mo41x0LXFFqTW7Epr
 3fU2a1v8ROBG5u6We24fnHyMqU5Mh50oBFYnCe/fICYOXoxtLkmQ9cKwBE7483bRSf8SNXzOVR8
 XQm/yw/TptV2WlMIh4SHFRn+TmtTxzGo236FsMJS2U0vwyihWnNsH6Ab5iXYdtZqtv3GCg4rKq/
 y3MRsr6fhT6K9vQbkno+6+PfeDC8JGl+hM6UZN0DiwL23GQc7cUf+Fj8NPsxH5S8BTivEqo95EA
 crNG5/NZsCWgVN7E8ip8jggIMP6F7AOeuslub4WiviYTfGEQKZWCRezPJlKcwV00w3haMX7gyvK
 DfG5t+OfxdW+oYOZH1hz10Ah9lOJh+32bqWbkA9cFsOEdnxf/IBBKwfOVItqBnjo2y8zsAqLF76
 +DKA8n6ZtElko727E+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX671URjGJUqcP
 h3awqjJZZjj0fJNh0gHB+wU1pwo6RSPBmhxuQ1fN/NU9h8IM+eXtxR6fbhznVLUP/hy/Ogonpvf
 jjfRsppts3Vb2dM9a93uLQ2ac8TEKEM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300044

On 9/23/26 5:27 AM, Wangao Wang wrote:
> Enable the iris video codec on the hawi MTP reference board.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
