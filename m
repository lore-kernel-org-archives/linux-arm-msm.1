Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093902;
	b=zjvYvfnRITMF8PNYPBTFjfzmfgGoYrrL97F5fVRuPFqqfV/XMzTRIGouWkiwv1lDuQl4
	 thHfHsfOf2gBs/MjuPrMiNGgIUog1Ufs/BRpiG9S5rWdymOgcCh/t6bOA62w0rF34n32l
	 zgEQcXNkUMLN+ikC01fOXZPcjHk8zDEQ0tIdXIqbUxM8XOEkLoz5dbi2l1RLfNOvceUc8
	 7irl3wi2Ed0SqgutlTWfzKsGiTiSl+Wbi7csgauvvX4PXh6Pa5XTG3Yl7jKZJDYxJntCp
	 nlyxiGvdEiS53I8jUBjv66E62o+7tP5dUqX3knG5xX4OaPKqPXs85bTTIgWqdOVby8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093902;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i0yudmo6VUVU85MjSM6weznmhVRKi2zeK7oy8nDu0HA=;
	b=KRFGZnVN6lr0+OGPjjv51W3z/KFoLCtyqyWFLYEOQLJKUUytpxWfwISrzdmUJbqU2fWq
	 oLnH1WNDtr4bDZdVxYL/lDuLSHRtA42e6L2C42PAV8/b/MbnN6AfMEi2sEo1RFX3DcD8D
	 PelYE/GNKdW25HYz/bKX0KyGdbGzGUfmSM6VYbzGCZ/qGaGEofN80N+zswyou1/wV/+Bo
	 MqakXI3cTGqWkL7TQ+DdGoO/n8HlPbW/xXn7y1YQXbP5yWi6fh4rdu6G3cfdoOoSlyJVH
	 KkOnhv9YOVITAgDVZUdBzL2xRv1JGWxWLr5qjuJb56sbTfjZvf4CGp5kTU9/UvS5KLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6u5XQJI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=crtGYp+L;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C256B606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C256B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6u5XQJI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=crtGYp+L
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8gMRF2747333
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i0yudmo6VUV
	U85MjSM6weznmhVRKi2zeK7oy8nDu0HA=; b=A6u5XQJICbd6VxefZe0sFqhQnfz
	1cFns9YtPeN2RKesCu9lXgXMzucDrEshF0KjApXHqCNwHWj6dGjOlc5xld3a8H41
	e1HvS7A9OyLF+c7pF066AdeUM/bL+wKE7e61UmpsaBWBdtpdZ+Y4hI8FkpsJbpNA
	fkXw28nnQnJ0zgsRHSvWKgg7xP0Qc+k3c9aUDnI9j+oc5V67GsYkD8sb+spvE2Mx
	sN3DGtxIei0SHIC/LdDeBFmXPo8bFIKR44sSdacn6Grx0OOvR4swM9ejQ6Ro/5T4
	7FfW9mRSpqM8t6up33vUFFF1i8vXHVgGKcYUYRqEQNZUQh0Sd5cXVgZViJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3dac9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:38:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f6f4fe531so701826985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793093900; x=1793698700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i0yudmo6VUVU85MjSM6weznmhVRKi2zeK7oy8nDu0HA=;
        b=crtGYp+LmroFWe6hRFheAEXJPNV/slhfm86t8qxETGZ6tNtDxkabUwgQJ+icKX7LUu
         UNFfqtaP40raVawgfW0JP0N7S59qRNSzV6ut00vek+zp3AXTq1SuYuN5yqlefQz0CjRw
         c/YDJ/tBoMyIcRXEvIlbTIu0HIfCB9fqHabw4DhgsKj0GiLUUh6datzYoKljII06fk0u
         ZMgYGqsDIAdR6kM9opopvBw76yvbI20DLK2B50srhgpynYkwTw/iDoLXJ+NENwUSQlFX
         qEq5dSOTQpWrDsliJTGdHrAA/73AHCSLAW3FdzZZjhld4Nxcmc4XKCcI+hRnA1jMh/Kh
         pfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093900; x=1793698700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i0yudmo6VUVU85MjSM6weznmhVRKi2zeK7oy8nDu0HA=;
        b=zAE3nNUluhk5qhXBWESs1co8xz/eh+VydeBxeeJBurOw18GOBdL4tTMPB9zXzuEqsE
         2l2Hg79dz0XFiqallcWGYEIchDgEoXGBufzKsHDoc3vzb/SK02ylSuuwyt1kbA+xTrQj
         aKsogm5Iu1TFfOcY0cBKl1iVnhgh7bvMAD9xuh7iw11+S1hbGSbU3fYAR7K369ANHV/T
         7S5H0pLNVaSsSgkoFgoEicz3XQqVZGhH6/1A7r5r1Jq11Up4m6aWcnUl7vlH7cLN3qTs
         /cjn8m39A9w9vsLfkT8x9HbvyczfXTGPihk9ctlWYY4syy1G9tGp4boNxch7KOmZUNgM
         iokg==
X-Forwarded-Encrypted: i=1; AKwUvByFVC+7/hW8rDANZM+DX0EeoIQXIpzuT06gpMxq1AYotkRqkdAM7qPVeM2ofHn9Jr9yXPo/RWUD4t9AVv97@vger.kernel.org
X-Gm-Message-State: AFq9FYLwHogdb4KigbqBlLVvKDdOfGFNk3RehxTvq9VUTanp0qzjBlRS
	Pjhh8qMbc6mKnZUbReMD8bMf2Dg9qG/Cplxfqp69ksTPZwEEIMdOFCj4WwCeZM6w7uGi70v67xi
	gJ3lUEvq1xrBD7lvVJQn+eFKP0sgFhm+iKJQQ9WaMrnIkkQMfQxoBB+7Dsk0+iPXT6kBK
X-Gm-Gg: AYBFou1lKguHjTRlchH6FMQXuK3kYB9864jI/u65QI0ZETFUXurFmMQlVF5ovevSPni
	8ccYNtTEUilA6BEfZDzxvJ+KTzTvhDbLs70meotwceLJhhFMC08OJ4KUEWlIr/j1aZjBSUc/brk
	hdrUh9CMKd2cGaZUaVKzeRJeI6MDoo6X5WyByRAaOQyrSxTB3cEZaCdPjK2xM0yNoRzvhWllkP5
	Q5eDEoqrHssC8paydOXjOpH4O4ztJkWLj9z9vw3ry6aTiSbNitD9uyCtPTBVcXYw2nVr1Ken8Ig
	uH6hUCz4fx4WkXSQEPkhLjdpCs/zAr5FhJ+C7EUq502HxrVA+nEh69+Rvf1pMF968QPJ3Xmh6tK
	18W1ezCnrYkXgm3zQAOHxgX3r
X-Received: by 2002:a05:620a:440d:b0:93e:fa30:f1dd with SMTP id af79cd13be357-940ef999e05mr1366065285a.70.1793093899812;
        Tue, 27 Oct 2026 02:38:19 -0700 (PDT)
X-Received: by 2002:a05:620a:440d:b0:93e:fa30:f1dd with SMTP id af79cd13be357-940ef999e05mr1366063485a.70.1793093899376;
        Tue, 27 Oct 2026 02:38:19 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm264678145e9.11.2026.10.27.02.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:38:18 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: atanas.filipov@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] media: qcom: camss: share VFE clock sources by the highest rate
Date: Tue, 27 Oct 2026 11:38:15 +0200
Message-Id: <20261027091922.3290180-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bdd89ef0-9cb5-4926-a8ec-92d8a4d78738@linaro.org>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com> <20261026133726.3249235-5-atanas.filipov@oss.qualcomm.com> <CAFEp6-29k2AoJq1+Rv8a3GE8Da1sZ4E9-RUd4ez-EwOajx0RTA@mail.gmail.com> <bdd89ef0-9cb5-4926-a8ec-92d8a4d78738@linaro.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX+x2848ptCXdr
 lkaJFLq830nIOkOiw5y5kqqksGbRG0xzgLzvvN9/y2IMVBaRAqByVkaTMB6odG77NvyEcko7KaT
 Nl32F4UF74gJ3NDcrDI5sgaPWUl2SRk=
X-Proofpoint-GUID: rWP4lY0XgAjMTJTIlH4JwEUIAHXNoLCV
X-Proofpoint-ORIG-GUID: rWP4lY0XgAjMTJTIlH4JwEUIAHXNoLCV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfXxkMxVNMDw6V/
 1JXHtZ0dbeL4R3sZw2A+40Zto9RGKr299IcxrdkoahvW172DW6lIW5x4NKGVHA1ZZMBnugAcBTH
 ReKzKErWp93MrIVr2Pkz2dCj+4WGX5xLuNc1SdTgtTtjabFziabkdNqg0c1mEuX2sIbhOxIVbko
 7NWiG6gvSu3mN7nUE2J7Gon4o+283D0XhTDm/85Jady++Kvv1GNRVmTddhnDizHwakEJZiNOYRl
 to7kylq9hFy9ZioYsphtHKBh9LYCN1vdClEBrKxNmAmE0PGKFbNa2P5yQEZ+MoZLWs1c1aGxY2M
 jvyStennxErMJiJAU2yNjXnDPxlbCMqzquCd7PSl6KON4Bv4y+gCJfbpQB7WrFrtJWJjNbucG8B
 GmOxH9wzIDx9JjjEvcsw5a5zplH4Mj4eU+0Aq7KOARWrYEyLqSV93rZHp5xcao6EYfFBJikBPDL
 U75vFOjbB7RmJVtKMUA==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae0710c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=G79TLdkEATUW0zZw2xIA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270038

On 26/10/2026 14:38, Bryan O'Donoghue wrote:
> On 26/10/2026 14:35, Loic Poulain wrote:
>> Why? I think it would make sense to use it unconditionally.
>
> Yeah, my intention suggesting this wasn't to have it booled off into sm8250.
>
> Also would be grateful if you'd add Suggested-by:

I limited it to SM8250 only because that is the SoC I tested on. Will
do in v4: the rate ranges are used on all SoCs, the vfe_clock_ranges
flag is dropped, and Suggested-by: Bryan O'Donoghue is added.

Regards,
Atanas
