Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367836;
	b=PJxHgexwqhLp8T8bYQ68ER9gx64Rpel8kiBd/HM8gZxahnf2U21OByU4dro7FglY7GCG
	 DcMLDWqTi1CwowAZySjVITgn+rxsktpwkr4QhR3HbFtgpHd7tSTqyTcdmrV/JX2Wk9L95
	 CkWtNw2dzJmGqUg0xDavkWtAomtMbqYS9fQ3V8ZjUIlLQCk7iwtjwG7JXIAa4FHNz3lO5
	 K2jzWzQlMPVODJLCA/BD/kOeE1KnPsOeroDAqQ6CVwuA5cTlhKfpu55Ep+Whap6emMrZJ
	 TxeCV1xxPj5czDIC8kQogUdsp1CCDmrcjzaZjyin/2hfl7F/SvYSer1cih7H37q0kHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367836;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AnxQ6PgXNPoh4AK/7SDAcUKVphAB2OZtUU8hUXH8Z94=;
	b=iaXunMq/ZpUBX7bVIxBqv7AnykkOauAxaqqcV0VLYxRxEvlw2i+DoFuRka7FTJKFyIiH
	 ye/3wxk42TzrV7m6xopgjckQluSy+ZdZYbkqJohUQwKTx17yhLcWTSvKotwOWAn1lsq9k
	 eNtID06vd9Sm53E3NQeqAtA5UPmlRKW/6cbzBjz1QNdiFFOk63SwDNsWEW+BMapM+HwlF
	 cysZj4Ph8Aa1fvjfLCYpjSPVjQMt3YtzBOLUSZHDLSYIvjQ7kiOl/R7aryUHEGyLc59md
	 73XMqaNNwiAE2fe6FOHsr2i5gpln0pkAjhEhIQct+nRO+kHkWlotFy7fAiac5LWxFOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CZIKp/RP";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FazTtAeV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519ED606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 519ED606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZIKp/RP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FazTtAeV
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGPid2784418
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AnxQ6PgXNPoh4AK/7SDAcUKVphAB2OZtUU8hUXH8Z94=; b=CZIKp/RPLME6DfrF
	SPE10gPeUrah2znQd69xp5oovV7pNqAryW3wJXcDH/jHIiYyPvM/fTW0VDGKEDmh
	BXneRl1ay0E8Cb9rQhEoc5WUmSJ4tL4ND/1F7gs/VYH5N9HLuqf1IZhl4cKIQPs6
	pLp9mzSWjSXEp1wkz3ZtbgeJc0MXZVfdQdM7XN3ZpwKDeqDRQm61bMvjHY4MtGLQ
	8Z1YwowZnT/Cgbz77jAG9FItePivJl7GMkaxfZ8sX9E6JlGw/t6pSANWFqILo6pV
	IKqq7GFPbtBMwChhHwU0EFz0Ut9QntRgEyKYs4G/Wq4tEQLVyq462x/mmx1e6v1o
	2vRopg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk9b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:43:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3960dca5so5881885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793367833; x=1793972633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AnxQ6PgXNPoh4AK/7SDAcUKVphAB2OZtUU8hUXH8Z94=;
        b=FazTtAeV+Sz+ms53pi5BKtR2kjPOkQXhQ84th3h7XqV1DBgAqJ/1psizdYfV2Icbys
         /ACihpVdB56eu1y7gh4iGq6CtW9Bfpubh0ql6Z7Q7U7T1b9+CGGIQ/iSapfzvT3NIcJd
         Ra1BjIeRNr/fcuneujEqM0spTdRubZdMgmOAHTZbEh4cs8nqV+PRGP4XZEpXNfX0jBqA
         vtwyvgdRAmYCX69e+ByRbkTWpK0yGqDtFpgcGG8js+GSRtRHK6lxB8OaRz9nS2J0wR6M
         D/YB2Rzu4QteAWjUiLjr1aFT/ZZoPYTyC6OzaNJwNyvChldtbuSc903jadJ++tguteQP
         ZAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367833; x=1793972633;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AnxQ6PgXNPoh4AK/7SDAcUKVphAB2OZtUU8hUXH8Z94=;
        b=KvyWS742V429I9dGi/hPQW8YoYWUHQWYF7vzVHf4ZayJJG4idxNDdSJ5MtHWApzwXr
         d+MtU0tC9n1iY4/0JfyCsdj6dpyP1rMQEgXF5fhLIq42OS0wjy4GyRJWHL1u+KdXJfaG
         t4xbC2c/UrtGKiQlCdB88vJPOF3xUIWKQ5Xs+L4NqlRlbwxeZtzaFFOxG62LfrNyEGHQ
         qvqnhh4I1csrAbIvV8VPtNQ22Daiho4o2KPDeNtU+cY5RLcMBbkNfjV5FVihRzs6Hzx8
         EXECTidwwxWXyukIi84JeGlLFEDlVnQGUrEEuitAPjR2xpscZXcF2p6I+8BqPctWRm4+
         SoLw==
X-Gm-Message-State: AFq9FYLq8WUSpw9KZt8oFEIoz6CZV3Vsz9psu409axeHDtzxUWWos50k
	iguznFOwvszoLb7Fim1cz/50HffHp4k/x98OYyhyCL7zHgV58PIzLCxwB4dnVCmQ8JgU2KRE3gd
	5CNUsA/N/krxAv7iZdpZvqCQwbb9FfEdmOq8DsNwAitSQHC32pmW4lN8aQ98VLNBoklE0
X-Gm-Gg: AYBFou3/5Tx7odJRFyDwTwMs9MJLVM6InRBx19GvKKtNj1SFh8PXngIUpzIsXa6sc0O
	NtsA4KWL9oXyz09n5y6UuIxyzZW/JtFx66n2YyDgZJ2c03KqJPlBKu4c0wQi5UwE9wYJwrLyGpp
	Q70K7/j2sz7QJHOjz6h1tRsmgVWz1FrPemahPzTki4XgDmoBWGno/eceTrOaY4xJxXOqyT2Z3bT
	H/GMjp7030ltGbja81XyScRiveJ+IAoiMVvswBPpxguR1G9czx9vgtzHP6SsKzH4vbao/jnYxmA
	ep7/+I5O5KDlrzcUinp1jt64fdJ7qV+09JvcQ8XQJYnQHW5DGHx9ZwT96GYN1ai9iRBJFcMk7eL
	ffo6eS45dLYQyjPH7shwOBqo6QIJXExVtzx2LChtILpU3WhnWLXBl/YJdb5c7k/TO2G/VeUeJ
X-Received: by 2002:a05:620a:cd8:b0:944:12fe:c8f1 with SMTP id af79cd13be357-94421367ed6mr377829485a.0.1793367833430;
        Fri, 30 Oct 2026 06:43:53 -0700 (PDT)
X-Received: by 2002:a05:620a:cd8:b0:944:12fe:c8f1 with SMTP id af79cd13be357-94421367ed6mr377824985a.0.1793367832943;
        Fri, 30 Oct 2026 06:43:52 -0700 (PDT)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc1920csm67290566b.5.2026.10.30.06.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:43:51 -0700 (PDT)
Message-ID: <0103e15d-42e0-4e8c-9f6e-ebd0b56bf3cf@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:43:48 +0100
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
Subject: Re: [PATCH v3 07/16] drm/msm/a8xx: Stop getting GMEM_PROTECT from
 nonctx list
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
 <20261029201730.151754-8-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029201730.151754-8-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae49f1a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4AcCgV8_PMtU11i7fXYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: -vHa_UlFB35hw9CBwgidHBvDpPnum9qW
X-Proofpoint-GUID: -vHa_UlFB35hw9CBwgidHBvDpPnum9qW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX5EySav8icV0G
 Bz0jTEB7ibUqLgKHU68z6YIoB8hI55TbbzxxUO2g+D/5MbYRi57ORfG7F6j1O7AwM+4ZnwKmMe6
 yQSVACK0wxEiFUsYgtp2zPXNbaHOnNiWh8taVAf1AyRpXeZW+jU1qAtiH1PkL6ySx/ttFQO4puU
 F1lOUclmSZUcLc/w0PHGeNgXOX0MDp5ZQtnQVnvUenIckGo32iLhBSQg7DEL/mHoTJ0qPf5Hq2g
 yuptYTc7jCYNEQF8cYVgM5q8IfW4Hjc5pkcKiAU7tarnWHIOEQljnSxU+howxda+jfuqImq+Ct8
 CHdjFZeI6/OnK9BZzX5AjIa/Q9cLD4MV4Xh/LtY1EyGz5fnqVP/yS/bm19gSmnQ6r59VE/Oxl6B
 B6FOWmp2LgecPK70jCx4lYgW8HYCmx+WctjoaeNaL71DUp1L0nFJK74ykE5L3Fr8oCg+l8G3U48
 h/t0ynQVwU1Hwrf50gA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfXzW0ZH3ArPfbH
 pzbR2GxoAD8sOoGvyriQVqspBJbsFYOKHQCzZCJ1ZAOSnJ9VtV3JgNXnCF3ya40Nh4tubwQipyP
 tDv/LK5txUQhClJPuSFUf2+rwEWMFWA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054

On 10/29/26 9:16 PM, Rob Clark wrote:
> We can just simplify things and calculate the value, instead of manually
> adding it to the nonctx list.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Should we drop the entry from nonctxt tables then?

Konrad
