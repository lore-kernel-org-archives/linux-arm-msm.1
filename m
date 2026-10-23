Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746445;
	b=Ib47OdkVsEWzokdRQPvbVqfiTQa9w/ZfkwH6+My9GDCQU/XKEGKfBpRN5a3InWcLRbnt
	 nRciq1iyA7U1RKTMZthGxsX1bVeWoYLzl7D85hab4H/E9+Oizn6KLFrLf+bZeP5CZVmup
	 UB7FfwLeVnMmXGopc9b2+tYWqxaDCDzXqBv564/Z9N1UxiAjMc8qVRltLJIuvzw3clSv5
	 sk71sY/GjadtbDP2GGWzJAbHlWyQNh0QAw+w9eiop38XbOLdEVdHLahmERfvPotWMLmRo
	 BL4whjhTWgz5TvCqcVsP36Nxu+C61E3h9aFey/57lh9n92F7vpWGJ1NqS2hkFdyHTAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746445;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dqGyeZV3oX3j3YBuq5s/ny+BKNGQxGrSV/QQaPdBNdA=;
	b=slsYMa8F+JCEwCW7tUuP4MTGaARxt1h7Th8Vhm/XOZFEEIv6XyIJVqLyoAwEuoybx1+D
	 RRd/ixgbeCGUazswn9GUfra3+Ke4NybxwfRcBesDMh4TVIoIg979K1F/id16/oeNosfMd
	 Fnhc2XxXET2VXx7oTYjh4iBWKDSLgInUr5Z9zWtNsKRrJNkLgM3aacffqYcltNjRWD38n
	 z56VxQSxLhKh7RZev04VBh7RAmiFD4iLOd79I9jHmlQZyMfxQl45nm/+1HzHNNj6iH6aI
	 3By0/94PSMRqUH4x61AawrHBFMbx0O7RWEP4j4kqlvVDGKWqHsgQ8wquzlv26tDwe9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KY82gwWr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FkkpH780;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4391606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4391606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KY82gwWr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FkkpH780
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F5GF1200725
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqGyeZV3oX3j3YBuq5s/ny+BKNGQxGrSV/QQaPdBNdA=; b=KY82gwWrd88cyQoO
	N6VlcU0gEPxvfRxtihd6fFVUqe/HVjFBPuj5QU6HCwf4iUSVGmrmoodDM615Fv/L
	5WF5N8yYHJ3QOop8lFziY7+6bQQP68JTtZSiwhEW1ppn2yQNkLNUeyi7xPEqkF6D
	aJYeZK9W0tXW2vYv4rk7a/kLW0QbGepz1AqaX4JoB7b4OQTDjLxNtOAmeXc7ZWDE
	9Q3sVrH/80ogpAiFWvkTc0Ol08FB3G8RqjkNpCWqj91cqcXnVgX6Bu9ICK/M//aY
	czsMLj0lcdJVA9Ff9gi7aygTYcUW411MmtqbYTOPS6JT5MQprgdcav8W7WoQbqES
	OhHC3w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms2uvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:07:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917a04d1cb2so2161226d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746443; x=1793351243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqGyeZV3oX3j3YBuq5s/ny+BKNGQxGrSV/QQaPdBNdA=;
        b=FkkpH780nU05h0VcjynCf85HyrJlLBiuS4jNCYBL8MI/P24dINq2qDkZ6gecnqV6ve
         t/+rzliSahc68/Y/T4fot54qIzfR+23nz6LuIa97BT8/dddB1hdaagA2VBMsVC8NPC3M
         kDVd60FItrX4r2uXcbWdqdGExLL3zOwUW+EQRTYCNvlRUYgcGXm0UtLD9CZGjBrrXrei
         LEFYebCXq57ReTh/LGk4iRNIY1E4c12UJiZ3y1xL4ifqcNOR8nhfnUNM0HHtYdaQv3kT
         CZSf8Ic3dByy7HcgiwVMqtmFvPbZA9ufkN6ENxbCzF69gHaEc8u3PgRY5EPkVATdn1im
         SgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746443; x=1793351243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqGyeZV3oX3j3YBuq5s/ny+BKNGQxGrSV/QQaPdBNdA=;
        b=0W8L3IYvQ+Z6xVSExOjRKZoDXVSrPBpjTCU1XH2suZKT97cobvha7M2pjoYjUIcg3d
         9r5p8xCUoBwDVhRMOYZ1+I9OYXORC+MS5ar/pRtmGbMZyTkXPx/FRsQUjHf8+3BVCm/+
         eDMh/avZQ7ZD9Hq2T4STc+Zfly2giAM9vRHK03gs/szCWnPb8VkCIPYiij181bFripA4
         7CdBeWWNalNXyd1s/87zhae/u5vC2eBw50B5nGTf3t9a7JJlHE4NLygtC8M0FKy1VB2q
         VdcgHywYdBIfW+qYy13K77coQeSbzi1lk0OK/um7yMc2q5U8h95ZFuvrcyRUf3YWuilF
         ALLg==
X-Gm-Message-State: AFq9FYItPpNE8NmDsa8YdRvG8L+bu0ic4e+je2OgwyzogyumORiHJdBW
	LxeNY6QXDi9jRoUoVaSbJqtBWDY/Mq8qU6tAGGG0K0qmvGSd1D+uLv3Yrz+MJx7WcPvfaa2lYGB
	SgH2uUOqdWntETOoE2N7AeofoNpXoRxWqbEIkXloLMTLXOkVKLp0vgwxRz1k3sq/hZcKWgQTw1V
	76
X-Gm-Gg: AYBFou2vrChCPw00Nc6QAZUvsy2236CcoYVJGFNJ9vMA3TXdyZ9GH4xaPXr1DTzijQg
	bW3wuROSoGLjwFNLCT6zakYfC54m2Ymc0jz8FwP9PGT4xUCWw2mP2sFcT4RcNCjMDXj6UpwiNp9
	52c+9xqzKh6JtXZcYgCUyuLlGkdSK1wJXX6bjbg4G8WbmvKio5wT9nEBBMqztcj2MNjoaNeS/pw
	BXSeLf5Hf7pyVsc26xpePi3g3ZNbSAJPCfW9MGoRhl4HIR54Rsk4ruTK5G4GteiQyvYEACGoJ4d
	c1A/NQ6uEc7eK+0SaxtuGy4hMBUT6E/knCqOk49MyWWOuVgTIpL3oVhcsWW8B3MVIBC21q5Ph9r
	Ne7gC6bsB3hf2meRDhsLg4g==
X-Received: by 2002:ae9:e507:0:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f6fa10fabmr286066385a.5.1792746443074;
        Fri, 23 Oct 2026 02:07:23 -0700 (PDT)
X-Received: by 2002:ae9:e507:0:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f6fa10fabmr286062885a.5.1792746442626;
        Fri, 23 Oct 2026 02:07:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cf09c7sm80166066b.77.2026.10.23.02.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 02:07:21 -0700 (PDT)
Message-ID: <81d21974-9242-4caf-8792-bcd8d59d9191@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 11:07:19 +0200
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
Subject: Re: [PATCH v2 2/4] drm/msm/a6xx: Add a bandwidth table for the Adreno
 620 GMU
To: patches@brar.si, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261023-adreno-a620-v2-0-1d654c3f52d5@brar.si>
 <20261023-adreno-a620-v2-2-1d654c3f52d5@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023-adreno-a620-v2-2-1d654c3f52d5@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNiBTYWx0ZWRfX+UNyDoy4gA4B
 p3wPXKUDAeBGwDPJ6cwXiZt96Ej59EsxT1KVWbf3aFsVq7f2ADQwrpVOXce3oEcaMrzPRHXetvB
 Qj3rrma1ua9V/6FaNfpUBZCqzLQzXvxmrJHwo1TeHU9tsPgOO2HDoUjnEHPzMvKH4PQaBBwNZDs
 Wj5GSqlg1+H8JCm7gupGSsAoewmwU9dXHJDaeFNgDneR9pbYs4oL2CbVt+SXvIQvEkg7a37vNEm
 IH7t7jTIR/nCS/n6lgEnk4p3rzE3KiYPqnx4Gtqd821Z+Z62vNibt09MnS1gf3G6J+7NhRuoKwL
 HchK6OEQEyycxZ1Ezs3tTJDABDZtpNWSa1tWUqUqHZYHhW80X1IjHt3xDPfKBKkhA50k0uqm3Es
 2BXuAXzKhITu+BG6IEI8aU0AX/rjl1qSvyf0H3qmdsiBJpCsJpOxFeQ6icn9NFB7K/QD7M+3/X/
 1icpkbEe8FcPlQcJijQ==
X-Proofpoint-GUID: zllJvyJQ72ki-DXjygmKeHHOf3aXMHya
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNiBTYWx0ZWRfX1ESn/0Cr+Bpk
 qvE1Bq/ocf2e0DgAGF7Au7sZ5CLjX+jyInPH5xMTJkPfiShQhWSf186yyHlFqbzbGhcWOJEilAM
 jqkPHBlMDCR/HZR/fSCbW3tOphCSn5o=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb23cb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=uaad06dfl4CJDRj71lEA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: zllJvyJQ72ki-DXjygmKeHHOf3aXMHya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230036

On 10/23/26 10:49 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Without an A620 specific table the GMU falls back to the generic A630
> one, whose BCM addresses do not exist on SM7250, and the first GX
> performance vote times out.
> 
> Like the A650 one, send a single "off" entry just to get things running,
> with the BCM addresses looked up in cmd-db. This is only used while the
> GPU OPP table has no bandwidth levels; with them, the table is generated
> from the BCMs listed in the catalog entry. Add adreno_is_a620() for the
> selection.

Please just add the BCMs for your GPU:

.bcms = (const struct a6xx_bcm[]) {
	{ .name = "SH0", .buswidth = 16 },
	{ .name = "MC0", .buswidth = 4 },
	{
		.name = "ACV",
		.fixed = true,
		.perfmode = BIT(3),
	},
	{ /* sentinel */ }
};

You can factor it out since it's common across many a6xx GPUs
and &refer to it from the entry for a620

Konrad
