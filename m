Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368007;
	b=BU8WJ0tWroY66+CD6YqPMoOulkR0jADtUz2XsjUNtlkRRTCgsklK5YpONW7eF99Q06/x
	 HlZ3k0WJoD1zjq6R79MVquGwO2Gjbqwiw7SdW6fZVP1Rvi4edOuOWudX8R1aaXIt9OjsN
	 qdHP/cqQWjxVcoVNWJEav+RIxS3wHA7TCvHZGQvZuc3TMvJIWubHddkWoRA9lKvAwviFU
	 bs7P67rLwqEYLmv7MtZArNwDm4dUphqnWSNlphg6uaGiCwk4zaD4EgTIN25LaYa/I38GG
	 VKyh6EiDwAq4a9UtCljne4D+jfq2PHCiIHvbMaq2Cm9owso3hluHRt1zJ4zLj66os9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0NcigoaWZbBvhzKKergF0yshnBcIAC0oeCoWwdEcoSY=;
	b=Kr3INVFLmSqEm+4QZRGWelT51VyxofDtR4HByv0sglC5u0+Sybt7qzDMMD08DOJD8Ryh
	 BLFUikstoa9J5B4s9mvnGIwl73OfvwASsiW5/Lq8KPq6WWS2S4E52zIF9rY12mZ4RqBjw
	 ZmMzxKtLIsCZgGxjF6+8aOGY4wcg7Y55EWNgS8mUJzELY6Od9kIYWJlQzuZMhoI062Uai
	 PoXMgV/mhbAM7IqQ5JxFh/CePOFVPE4mf6MEq8yJ4WsOQZoW/Lui4YIBfd7z+GuocXBlr
	 6tN9vXw+Qp2+ZvDqmlInJMcwTLX1sMaoNGHJpQrIw3EEOH8W4Y8Ah5zxR0Gj7xc5tJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=No443RHT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VQvlmlH2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E64606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68E64606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=No443RHT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VQvlmlH2
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBFxNc2169590
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0NcigoaWZbBvhzKKergF0yshnBcIAC0oeCoWwdEcoSY=; b=No443RHTXo5OlYX2
	d3LQA14O4Fe89DgHq8bilq01x1XqJcERXdk0Nhe07kpLU7nP+fEshnHDYMVt0h8/
	O6SR2pLzQQuKlrljpQeKazew2uA7SXbYASvEQhu3z5c+oPpaOnfB8k3GpaXLQqWP
	8t/CzVYSzcCxeqWQfVnrccktgmrwxppycvtt/2D0lGoq7AOhxEo8WrWQ2S3hudUC
	8TASEPMUAXmD2NdPwfnxMRZXKMWl9aikMuoZKOkCFTpZ9pR7nJjek2cynFvvpDL5
	uFVyiqhcbtXk3Gry1IQg8+Dsyzdbn+pLWzeJlGp1iwtBsGJoRN0GmCCZYRC/tQ3V
	i7LUmg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pb9yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:46:46 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-990758837bdso22525241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368005; x=1793972805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NcigoaWZbBvhzKKergF0yshnBcIAC0oeCoWwdEcoSY=;
        b=VQvlmlH2UQHAzOD98irgxVXphRmAm7wqucp5idkOviO9sByHoZgk1JFBnbj6KyZunL
         y6M+jQXtGaJEBCIGGw3sLGUhSLTQwyXWIebztA0ajDjHkQ0VWCfO4WFdM/auuYvbN5qZ
         2WMSaT3neS6DYmhpEVVeZu5LvoingOyx0u1D6320kG0RJEUJs19S9hwY3/GeVDr/gq6u
         mIgJNurNoWQnl+ZwU/4Zmq/doEjo+OOhBpVCDaAMI1PXCVKxyTcFKIP22LrEEvYYikWM
         W0zQf2cdW/TMUVsJjDgVXZR6IN2Pk3j5Xte5kIRLRdKHucPqCaviFrTzO5Zifk5I3YTk
         PxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368005; x=1793972805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0NcigoaWZbBvhzKKergF0yshnBcIAC0oeCoWwdEcoSY=;
        b=YlqrB4nceyz3Dr6Wsdphbo3MWElRsZ/MiBsV71tRP8JDExQmk6AFBeh3VoNSrsSSIB
         uyl3uZwMGeoQawcG5CGXDklw7V76/OUdfY9sSnKfqGDwLDWo+SXgzaR6M88+SWDrYbxH
         AuaBkS6b1k084AOOTu2H4pp7d/VcnH9Gy7FKPgoIquD/cCN4SuWuJtOiWRSClC5jmzHx
         f07UsZbdOWfJFylzKXTCdrSun7ofnE4W3UpGCGgvk2pM05ZtCUdgUIgRxAyrf4wkehhd
         VvQtFPOow9ebGUEiIaYYqeDBgU9+5CDWjotMmyIMgqjjJPTl14HlI/MkCEEaV8mUGTlS
         S5gw==
X-Gm-Message-State: AFq9FYIcitU8SMiOqACUtvNKcgEV3cS80vgK3nAgtYeVrHVGcNoGmXgT
	CE1XHfs53wgarSGV7FIAzpIjNlXiBigNKelbvfKCZcAnSNwWEOR9pFdYLnN52SGGNSSsyMRlcON
	H2Fzy12N83DwDrCjBgUucwGmFPToz6ys7/puqtkJSduPNCMBpFhTr1l3Ar7hsVZUTjEy5
X-Gm-Gg: AYBFou0NQSIaLm5HqXnvjgw0atgpoK4uo15Aom5uIY/qt7pN79W/kx/jXJ0wgIxBTsK
	bNlsIoAmX5TNlSqDgqD3KDEwkqla3sswDemHtvawkz+tUkCfAr4HYnP/WXWGNk0PUTHxoY4GY88
	kWBHdZ7/keYqGucSpaFa3vDnsl6+jg/yxbj/UOgjcLxl7cYq+SxPfIrBkuTBPikRnXQMTqd8dqa
	rTELObbqx8uF/nOfWUgrkbZYQLzz124LH3WpgaABTFOXnB2xrmmknrpOD3t2TiD6ta1mdswaiws
	d+dRGTsAiN9ibpx/ZI6rOhoxEPUHE/p4JEgG3xK67dWpzc7cWQfc65nMhDUguiGENB+5p81hUZ/
	X/ZsRI9j93R8lvzcaQwOVtOaILidTZHSABi0jSR09F1uLZChnVWzMfbgoHJdwKQl2ibolE4cm
X-Received: by 2002:a05:6122:6310:b0:5ea:c984:5ad5 with SMTP id 71dfb90a1353d-5ec6883359amr1068959e0c.3.1793368005495;
        Fri, 30 Oct 2026 06:46:45 -0700 (PDT)
X-Received: by 2002:a05:6122:6310:b0:5ea:c984:5ad5 with SMTP id 71dfb90a1353d-5ec6883359amr1068930e0c.3.1793368005039;
        Fri, 30 Oct 2026 06:46:45 -0700 (PDT)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc174dbsm68328466b.3.2026.10.30.06.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:46:43 -0700 (PDT)
Message-ID: <b1bf792c-8571-417d-9c98-f0b330a3abf9@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:46:40 +0100
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
Subject: Re: [PATCH v3 13/16] drm/msm/a8xx: Add all CP_PROTECT_PIPE to pwrup
 reglist
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
 <20261029201730.151754-14-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029201730.151754-14-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX3C15hzMnVZoR
 dWjxqiXr+1Lvj08MnzAnFrqA++PO+l2rOuX2fX4UlCn8qUS7YPvjYwX/Moyo+8H+rl6w3F/tTAh
 PBKKvBRpc0H0QXOVq5HS7MYTiKljBcLt4yACTCBaK5reI2f3MA+x8hCMrauYvgGznd8qJCm8VOo
 4Ne0zkTlgkbvXvJIbDYT1Dek9JU37MAT+x6FTUsAE0jawEZr6l+9cSzUkpw84szSJi9uYKkUBIO
 3ajysKAoLMEgQB0bj0Mmpkp3QXNKFmGeuy7z5lnGjg3JM21+EaxNfHXg+3S/3keXRZBkobBBXdp
 IydLs+dcu6QZRQqZW/jRo5lZ6W5kN+cd1aAwnatiFi0S2aiGpWT7zp8HuFqMzmdCkFT63v1b5HU
 sTzPcsUcHXTuRRch+DxSKwyHujzNGn4BFtqKuphdLrNliH9GDA0y4hhlYqoHiJZ/pW5i3ugGLQj
 ktaHd3ISmfGWVvPXqTw==
X-Proofpoint-GUID: oArDUe0O1nV6afC4ITSUYmq32WS9Hyaw
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae49fc6 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iG851RqCUpnUipWvLlEA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: oArDUe0O1nV6afC4ITSUYmq32WS9Hyaw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX4i4QjubaQjPt
 cKXmavZx9gXsqRcJCcaiAodnLuTG0zD2HDhfb2ODwsg/K0tk3GbGMJQV5fmJ0Q/5XIn5z2KZY+3
 a3I/7GMToHXYxhM8FWfV2gZS1WKuSr4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054

On 10/29/26 9:16 PM, Rob Clark wrote:
> We're going to start using more of the CP_PROTECT_PIPE regs.  Rather
> than missing to restore one somewhere, just add them all to the pwrup
> reglist.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

I was kinda hoping we would iterate over them in the code instead
anyway for this one

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
