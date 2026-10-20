Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483811;
	b=gHrWjq7LXtyegjaKWVROuZeYUJWZLE1wjoQdLR8cJPspqAub8M3mtcf7v95IS7b+dpu2
	 8np6UDDjZ6fs5nHLWcyIdz0LoLl4haP6L7M3QyCmUrLYN++1JSME9hTkSMDeiUTnjcgPk
	 gXSggK/3JNwbgyS1ve9s+jrzRMqG1m/WAfe+jKHLeLJY2A2B/EEpVA5UctQQu3ed/ZoKq
	 PNNZ4IKujosexO8kUhcCo7j17bGaPz2iKXg2jrZ2BEnxCYpR4yp//vT4q2+e9l9Td0cHA
	 7NGnS2zQD1g+Cj5ABnISP0UilTlxr9+3qDQ/5rjwE3dYvlHr6700h58yp2uLqCpv0xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LfaQ4cN44MeCR+RAKTBKQ69nJge5iLKyKSEoE7Jhr0A=;
	b=sFpnJCZCMOKoOHNKrrKCWMix2ApAxw4tjdwUdlny7Hnt/lHlKV+uYv5ZgNiTHmHoAjWv
	 BDTI7M6eo80HYgQ7udX0AQM3AeuJm9u9M9Dyv3KUdWUb2SVbgzyMcr+ohnZliBit/e3K6
	 lGXhd34gcpB1oMnPmOMJHHnG31rZGzSibwjc6U+ZprvNnhcufYgqOaFYYvLx71HuC9JA5
	 uWotXGfhoG9cZAzkHsWc67rCFyE8bfYkIkVlHhcZkFXPAr5gus0itwXcp0Yt51NC9i2sH
	 6J5nA2TD26C33FGPyOgm6t5/z6IX6dAVVbxiwRfhjSU3z34dqvHoygPRfOjw/2CVvtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZHPlQmG0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CBj1Pv2v;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11460606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11460606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZHPlQmG0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CBj1Pv2v
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K7Xl1Q1562693
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LfaQ4cN44MeCR+RAKTBKQ69nJge5iLKyKSEoE7Jhr0A=; b=ZHPlQmG0ZtBE77Qv
	3aS9lp9Fo5BdTSq2vksPzOWAFXGAnnaUC6LNBX2VxnNJy+U82OMsl4+BvegVgVbB
	QD67DB/IvMVaA1g86pxvznFhL+PjgKHujF0svkAahHqfjvkjL4AXYeYCvVq5tgUb
	WPr5Y/sdVWPpAom2lpn6sF0GzWoW6mp2HqkzsCY7qnemqlySU9etrfIaa5NOnXyg
	3Cg5dkfJRdOI8eBo8C2rmJtsEbAYDC8W2w6mr5cwTWuuryqot2bSR5p9vRfI9thD
	7gu3qC2cGY+bu4eix2n3YCX/qsUI8Nn9VHO0kJqD9EYS24YDITGu0oScilezCdqy
	+MrxDA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5phjsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:10:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3960dca5so43897585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483809; x=1793088609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfaQ4cN44MeCR+RAKTBKQ69nJge5iLKyKSEoE7Jhr0A=;
        b=CBj1Pv2vx99kMM1P5lHf7EZxEAtaYhVlHXjj0xrBuDGiqx+nQQjXluzo0y6S/x3kmY
         vRjH1uUWRk5d3bPekFCEYuVexLcTF3eC6W0krw77+Iq52DO6D+SACKcTNoV1RJiLlBXK
         2Pb0xwRLNAqIH2n9S+izbYonHvdR8hA0IRhUFu9StD2yQ2At4Khm6xYAW3LEA1bBI07z
         HgwA4Nd7xotnS7QFBRdVgzU0pqsQzk8uJGXcBpLxjaALP3Gr71S68Xw49K/6IYKXmsBm
         VuHvcTtmqNnMHEb3GHHxJMqCROWHyi5Q4LUIn51WHB8xkCcGomdAdEFjv04zDpvNvXGe
         m2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483809; x=1793088609;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfaQ4cN44MeCR+RAKTBKQ69nJge5iLKyKSEoE7Jhr0A=;
        b=IcBPg5gbgKPaIx1l2ZruLsrjt1LY+xCZ6QONNB3BiE6Asy74GG7rtQn0Yz7B0vMFES
         E2xIzs9GxIAMRTpTywIuzKkMNnLtZNce3oj54bcZczG5MWSmMkW24sBor6hiM5No4WLd
         oe/wAC/G0p2cXrX397T8XddwWK/T0T2PVOXs8w1PMmyuIlCVt8PwRT+Y0ey/SUurDp1r
         2Tf8ATBtk/Doi775yUl8kptoZ9XYZbPM1Foea7/fE9d7gnA9ihwCuMG+ncPyXJhGLxSK
         h+4T7VEggVvh+9LRpOAQd5ti3EMq/v9w73b/mtHPw/XrXDkhlYqaHpqOkbyVu4mgjfa0
         2P2w==
X-Gm-Message-State: AFq9FYIJM4kDo1zE7BVZDL15j0jQJxEZtQ/J/N3M812KXR7KlTV20CLn
	jPByVOIQFNoLvHLnWONXU93jFtyRDPLrvWg3dnlSZMONVEVRdsYm1g8ngFR2tKWNSK5OAzRKv1g
	lNz0klMKgnxaRiNUonC0PcZXZAoaHX2FoHH+o6Gi4pHb1P7Buj/r3cktG+bjk3KYLOj3C
X-Gm-Gg: AYBFou1JCBAtZWZUAMj3LcXKm9HoA4CtddFgXONx9ac43LC5BH2SBVWB77JETIWof2T
	zxrdXoSjJInc5zdOROWhg6P64HoFEhRM5EU8SYobD7s9xIeCjUOL1yxHsa1He+tjXOZk1Up0I/6
	mUgCob+1ghVYO+FNijQaHLGh0GYaHmTyBcD9baw0Ssa0lcoLxXME2pHoB3erXnOcZqXKE2DMvr6
	PBj3hyJQbUJvCZO8J2d8GAntRfk8aCnWE6JJ8t4KcDFPoXaBT8kJviBKog/Br72psyC4yc6IJ5M
	mEafQQFFmPTYQLa2/fPiRf/ZnahGiIeyvDo8mYHgy9yEnXFkK8M6pqyg6mHiJgynCLIMCvuBVGa
	kr42usRyfNrc9xXAf4U771g==
X-Received: by 2002:a05:620a:4553:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f29d66b58mr1960106285a.4.1792483809393;
        Tue, 20 Oct 2026 01:10:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f29d66b58mr1960104385a.4.1792483808910;
        Tue, 20 Oct 2026 01:10:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd10ebsm456527766b.22.2026.10.20.01.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:10:08 -0700 (PDT)
Message-ID: <398766a2-2abe-4abe-9e25-6a17b15557aa@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:10:05 +0200
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
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8917-xiaomi-wingtech: move GPIO
 haptic vibrator
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-xiaomi-aw2013-v1-0-a0c3084076de@mainlining.org>
 <20260921-xiaomi-aw2013-v1-4-a0c3084076de@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-xiaomi-aw2013-v1-4-a0c3084076de@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad721e2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=RZ138lra_CrwkBlV0WwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: QcGyO8XuabOvxONyhmeS-NZZ3D9qNoV_
X-Proofpoint-GUID: QcGyO8XuabOvxONyhmeS-NZZ3D9qNoV_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfXx0OaAOyZi5qD
 igi48ner4Fjn54vnRkTqZJAAfH4Zqpw4efy7BjmI+M36sMxAaoZ9LY5U6AqhJBEwUo9pVmsm+Qb
 PISglnKthUza7mru21n9EmrFXlZgeqFn1m6t6bTyUj/Jh+tZa4Yij7fFws3u8A086DJ9Obnwczq
 9UQgyplaibg3H+e5tv3c9SorGY2uAMl8O4P7EarG7Ht83/52IoslLzuHcMkrVHPwuRbJ+6GXSmE
 xnSNq58ZVHGe5sC/2CMezj1diXoCLIV54jqxgV8jJce7MzriOCoeVDa+Pp+XovQg8fJdEgkMzVU
 2RvD1AGylR/xWVUhSAV2wyrPqWW+AcKExR6lpn4AxXMJMT4MV0fuMJZOu42ZFvqnZW8kBPzCG/j
 a6yUW9ycn4EcgZ2z2+ekO5zTB2JXmqV1gCx8eIMLdRCM7YT/Y2wI6JTxGGRG+/HbTsSRiZs8ewZ
 0DrpmgYKHoEmyiQS89A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfXwlPxg4CTyGnN
 rtRBS+/dZjzt0ybzC/EHVyjdH6NipwpjJK+34yn5ww10EYQOjKTBJG9bPBCdP8ELodzK9c43GFI
 uQk+I2N9BHt+i6Rrw2fuJemN71Or3eM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200032

On 9/21/26 7:43 PM, Barnabás Czémán wrote:
> Move out vibrator node from Redmi 5A devicetree because
> Redmi 4A and GO are also using the same GPIO haptic vibrator.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
