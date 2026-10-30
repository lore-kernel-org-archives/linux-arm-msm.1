Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369672;
	b=nGg66n+qJ1s9/omNH0vXoZxIQQeuoBZ2LTj4xFLQDsZwZBjx2ZIhv+/D5ADlaz/JwqAX
	 ZbDuZlUH4fW7Hs0YkzFWFUI5J9s61EWsGnQ9tDScYOF5jRUlO+y4S6VJ1fWQO4tta7Dn+
	 5UqLEdFoNCgaAG9eJ1tTnUxFrmaXgc4mQo69sME4ZGGVDIRzv8dX1X4LFcL1uY81VETBL
	 cKz/B4CVvj6JpRA5J61gdv8djVEFFdAvMIqUTLSeI9s6XFjaicqSaAM5+IdNGYYjDBckH
	 4AA/V/kGLuqK6L6belcUqnxLF8NA89d+hGYmGZxtL+fqcnFNwCEouBbvvdxMvWsnGmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369672;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3Jaru/sr4U9yir9nA9QRFkdDdW1X3YADwZa6Fl4aEpI=;
	b=ci555Y9Hq5vMmi2BDJCgy41c1gGh2InBHc5QFCt0zWjkIK7UPmDqYVnINqOJCfOflSs5
	 AWkWHMPsEpzB+0sSyPTfYUlwdRc9D2I8bthkryhKy0c59YiJwrwFOevt6rWGFHYXt8p8S
	 wnQGVweIEoJb7ofS4CbygggBiiZ5XrEK2iHVj4W9HD5zXVg9xSr7m7n2c2rv4vTDmPTkl
	 i05tPdtyg9Nv53+q1tR9yqT3LGk8lCCJTp+OVsNWU+kgIRnA24XMTcfkLIEU8nlZ/VHLR
	 vcc4vdGIAc/9T0/XhtZi3sC8AcOA7Nzwb/kFg4y15L6vt4J57krnluEs/Ie0xvb6iLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="D/0F0tJD";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V156ucym;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5881D606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5881D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D/0F0tJD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V156ucym
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDnW5g3431772
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Jaru/sr4U9yir9nA9QRFkdDdW1X3YADwZa6Fl4aEpI=; b=D/0F0tJDf2Lllyzr
	dInXChbQXJBWuhLcixxOCSO7eYhukDPdCMVAkxA8qtVOsxa3CKmWdxLAvJsGHCgp
	nDBP7gZmDpzxLPSGFaKxPbCSUM9UA/WV40YDEFB/R591WypnMfwNlVlBIf7p5rTc
	CxAppIgwIDRAFjscogg7hw4I+KmIxEBI6ZpwMfnLWei7MuluFd2JmMIsoyHHhFbq
	eFiQ8FOtlS9carTAf0rLsDlThzE4gDIdaiOGJErLoxS36tuFLMVkdsZ6X9UxhQlb
	qRwvohziZCCTVJywMnEb1ZYmb7ng1uVN5n0+TbdcUHPUYynerYirq+IzgmToxfKY
	GIn3+A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkfcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:14:31 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eaad898904so30826e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 07:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793369670; x=1793974470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Jaru/sr4U9yir9nA9QRFkdDdW1X3YADwZa6Fl4aEpI=;
        b=V156ucymngSmViQaqZmDYwRtNDSYEnrqdz0mfuEXMAA/iczKN55kfBxkIxOBq5l4jG
         mFzeNSqIBvwTBVBAf3eW94/6/gfovk4RwwpGZtLlywlgY2Ygaf520/ieC+9oJ8UE5D4o
         /VZ3Ow+V0RNCrEKGFHMVEXoYXsj8f2UeeJiFOv6Dr16N6uEsZ1BrTWQMwtnjv7mV9sCV
         QcIqx4rKBHpPyQL47TzgQiHwjxWYclZqR8GtQvzWgCoBxCfY/muvvYrq988SoIyMoWAe
         mV/RNBGz4nfUJxPD1+ybmUeHLAQ4luGGy30RY8BHxrIPZ1+0JNiyaLN2gLHGyvOkD9Bx
         ZGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369670; x=1793974470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Jaru/sr4U9yir9nA9QRFkdDdW1X3YADwZa6Fl4aEpI=;
        b=UbEsQ1SimjiZaf3Hpus6csFQ8jbqVGUCceo/7siU0tu3wCyQHXM75P9UaT0YfUNYYJ
         508ZHfs4ONqK60kYaAB2NTGV6Xwf0qjHx/Oxsw0Ti675QoqcJegK8do8cYwrbIBZhCWF
         jAZSB3sS3xc1Vs9rJ5hDk+5o0IzRyca+6Oe6XzFluGgZT96aI5qH+yWeeH09+x2P3B3F
         WNgb3AY5C44fYpVElYrFHTATCo+1Y4f8SE+jhNQdqPULa8l7YharqxTBDC6nrBZ+aCVe
         mqjUWK5ARihj3t8o2mvWJ+9N2H/N6TYxiYhQsbYfk/q8IHMYGxL0+UpBvL49IM7lWXqE
         MWRA==
X-Gm-Message-State: AFq9FYLhPBdbKrF1tM/BOBt5j26yZ3r2FWonxDcx+czpNopEDi0CFCGX
	R+x8N/mCK45OOlUdjhcXSSfEGboBHzSQ6ERfOZY1OCkn2ujPFg9jsgc4LMKe1RH5A9B7Zpx6VKj
	JQ4TcoJgl+/0eMUhnGUoE9a1FO28YXm8RpoA04fdbU9qPgUsfl9PAzlnKdURajXNTt2NA
X-Gm-Gg: AYBFou1ZuCH/E8SL+UMjhXkk54iwnjuPnScQXObVtejV4kq/r3/BYsHyIiorStVR+/v
	GbN07LdmIiEhFwv9292pn+MEWiqRwSw8ZaZXva5qJFXqmMPaPXfF7GG1xPmsRkKO2qGg5/PvE52
	HS1MhOoubC+1GHstZOE1K/zlrOawjTxzPX45JL6ASkAiUe3qbDwVt06xGHMsPcA+2L1zKaY0UaE
	/6GxpzDuFy0xDsY1pOeODAZ368TA58UdwExKMf7F5ysIBAgkU2233RZxeOdCswz6ZSxEKnUAc9C
	CbeplH8Iy7SjbSfL96UV6f4cQ4CZ3Ua/1NNXGKknjDt2w3quEChXiElD9rDX6X5+0ekd2z+heA9
	hkDTWICJokTjqCxCWzlj/vpk5JeNYsfcQ0zbZ2xHX2nFiowxYQTaIl/PHjDLKZX0FHB3Amuu7
X-Received: by 2002:a05:6122:4a47:10b0:5ea:cc1d:173e with SMTP id 71dfb90a1353d-5ec6851cd15mr1215923e0c.1.1793369670484;
        Fri, 30 Oct 2026 07:14:30 -0700 (PDT)
X-Received: by 2002:a05:6122:4a47:10b0:5ea:cc1d:173e with SMTP id 71dfb90a1353d-5ec6851cd15mr1215878e0c.1.1793369669938;
        Fri, 30 Oct 2026 07:14:29 -0700 (PDT)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18ed0sm70345466b.2.2026.10.30.07.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 07:14:28 -0700 (PDT)
Message-ID: <eb461324-2ae1-4e62-bced-e662a69b19ff@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:14:26 +0100
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
Subject: Re: [PATCH v3 14/16] drm/msm/a8xx: Use CP_PROTECT_PIPE regs
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
 <20261029201730.151754-15-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029201730.151754-15-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UzF6FZypBGokmqV7jaXE3tS9aXnb9nt8
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae4a647 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6Pdd9y4b2srEKQt70McA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NiBTYWx0ZWRfX/jSoe4UXWp+l
 3i0zRWgvtvdaTREFWzSmLqQk8XHyMCdwIDAdFmywNsqNqk/ulx3wuChTKIbz3ZhEb4j03Wz3Cgi
 vw92D9UNhfCkDpyGU6E9TSQ5hMdkgjgl9fUKWCwRuIxJ/P1KU1C9RUv65KHFSTBeECA5Y1kA/5D
 qnyOuzIcPWR6ZW2yetJyIxrS5OXG2Eo8rhGLF5CRBVC4dhsx/JwZdSVloHYnUe+VQ/CUFPQiDEv
 XHAE5QfhnIb4HX2zmFeWxjG4x1kjJqMqu6fBDbArYTxcoaGJG14b6y2Sb6ny9oKpaprKP+w5Mw2
 Gu9jWqqSLYRfew4FHaHJ/7l/7Et0EeK4pmpBECw+CCOsfQSKqby70wRDIeQmz4CQnbRh5ZQm5W3
 8Gym4MUK6CUUG1Ex+e/XFo8vqDzvy2zwdllMjL6kn085S2x59shN1kssk9qv9X96Bk6VOxyiO8D
 gFHRDgJMVZAQuwjgXNQ==
X-Proofpoint-ORIG-GUID: UzF6FZypBGokmqV7jaXE3tS9aXnb9nt8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NiBTYWx0ZWRfX2RPoPARDQ9oj
 6ScHITIX0S9C8E4gpl+Q0xf91u4yPgkoOxtPKzqjR4V2HWkjxWNzn9BZP9PTiD5QFzYPmsn1bUj
 quDDxVvjiUQxxTJLTffh78+101QR4po=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300056

On 10/29/26 9:16 PM, Rob Clark wrote:
> If there are not enough global CP_PROTECT_GLOBAL regs, we can use
> CP_PROTECT_PIPE regs for the extra spans.  We just need to configure
> them the same on all pipes.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
