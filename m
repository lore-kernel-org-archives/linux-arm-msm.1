Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615440;
	b=lgs69qq2wTKhsLonKlmpmJMVQYGucD5OD7XT13V7OjLyxhL3kn0HULmNQKS6AFD/H0Zd
	 yT9Ybwh1qz+hOSS1DNRsb9z27/qgX22NVY33GiUmJggLJCebBJlAudGaucl8G4gWkZe+9
	 bW/lJx2cYShXUg4MgycVoqoRXaCQ2tD6+GER7I5w2kIDEgDDhqm+Upf5qTvnhpJk2qO+v
	 xrYLHrozSi+BKRZhq/DDo9uhEJc7Z2wPEdOz6aRuGygH+xGcimPqfAYJHZgJPEg82s+b+
	 m9WfWztDvdRUsR1t0cX+Gnqkg3U9ADs3V3b7XZCgq/0PjWkBg/cStJMANXRJ4ahZRMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615440;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NzHFCCrQzGLsKI8/KQW7VhRBUvifYGel9dhS3AdJCd8=;
	b=ax2y6mYN1U+QZ3rtAPoFhwa8VRNJj1/4mqNAMsoi33Qf4rQJbX9dWZogLNJkul8R3iSf
	 MxrFL/bc91kFl4gAFkvEZzzxfjRpxzlGIQkLZOzMsAQlkySNW22Ata9YMa2wgH9+ly5KQ
	 AZcxk6tI7l+YCruDjJ5fgt8axDzBq3+fSWX883Cx9cwuTUUyAkR76HOxp65k50ix8voWC
	 k1lYnp4uAhxorzVCoRzdLsHkvn08dSlAB/SUqrXbVgDsifgQaBNsD1nFOjsYeEVdJKKtO
	 5wiuaAIvXQZittSAGbbhAErpgh+AxHiB+xZfJf+6t/xaY7/Pde6C4aH9l4GmNRhYnmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T6Y9zr5j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MoJb6hjJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3132606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3132606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T6Y9zr5j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MoJb6hjJ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ADi84039441
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NzHFCCrQzGLsKI8/KQW7VhRBUvifYGel9dhS3AdJCd8=; b=T6Y9zr5jzNmeahze
	Vk3VgX6HlfKPD0egTiQ+7G23C+ONdR5ejKOm4byHnPcPcdpaUIRJ5spqS2+kLqtk
	ieYaf4jOa2l/80Zb2YrBFIPoqRVwWTbi98LM9843sBEzbA3ElA4jMZHpcr74dxa5
	6PIyfMjTzQp5sNLUDJ1JHFvCYMehZbvVBRToC36VwFDUsncz4WvGSQEGhaERLzq2
	AJ3QiwSCGHblV11dK5oewoUoD6L2sSDz7x54aLg+AJX1pvj/p064Ey1l2qsWeR1Q
	xf+xeuVJc3N8AhZvl+D1tai07PnwLQW5Zn10hOwem3m4UTUxzrUK798omWAPwfj7
	w6syfg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18nw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:30:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1440e081so48631485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615438; x=1794220238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NzHFCCrQzGLsKI8/KQW7VhRBUvifYGel9dhS3AdJCd8=;
        b=MoJb6hjJb/P2CuFjZBHaCnGVWRS5KQM0Q8W+M24orFuLGymLnL6Ts0k4CgXIEjQ/vu
         yfVnc/liWIiQSFwTYAjsMVWnJpCfadCw39Y2jE3g0b4Mstp+Vyt2syWM1AMmYu4z5TCE
         XZlV4FnD6ET6g4vuFWcISNHfrcx2snmuteJhro7fwWfA40LTTVrOFrS+L/VwWFb/XZGS
         xXRJ2LEB3tkieFaMUh+zU6VSGbgr8H02pDCTrslRHvLsYTtJLCYmltTT+4vRFYf1Bxie
         TZ80gT1Xczx9qEZqnm/MNa9ViCYYlbk+USzVMbVoLehLx5c16rfPw2LVeS17aJiefJhx
         l+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615438; x=1794220238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NzHFCCrQzGLsKI8/KQW7VhRBUvifYGel9dhS3AdJCd8=;
        b=JX89HBoSKtzVGohBW/BrgwYe9zR/MS4BN+Ishs3c9/3bVRwSQLZYO6cVWg+btICW9W
         F4IiJui6WgWvAE2CabenR4uJK0cvW75iSsEGdd2FQMSrCS3gR//m+sJYIVwQ4WdhW4qp
         EYMyn+LHXSxd3WEAzU2Ix+kRrP5gqpiwVn2nX7zZu8KpqpP7QFD+2KEML9ZcR5HZWZX3
         0Er/DtTLZ02T2FNHysynljYKSQoVT7jRtyyg+xHbs1ZNP/hlou2GMHmeNFpRc4xQWLvU
         MRg12q3p/yP2WE405AWUKvSF3xPflD/CwAyrxkjWD+iCdwzT4FD3/kHwcKDRQhkrKFWD
         B+/A==
X-Gm-Message-State: AFq9FYJMOQgJlfSRZXg1mZ9+w07VW2Ifw9JBs7/Z9UicAyrNr0nSaamP
	7K4dfbB2SoDqVkiI8xD9lhupMUywAgsmzlbYzoqIILnjfIK4uqhXgC239l7x/w2nobqTdbhD7f6
	BGbqVomGkrVh0bt7VuJ3O8+R7HT/ExXWTORl8z1BmhGlZtXyp0Z/POgBe3d/dEXeTnTOO
X-Gm-Gg: AYBFou3ievHj4U6gfaAblwa5FplaMXfKwW4RwCdsk9dcCVhigIBx6wU4jLXZBnuj0nL
	SA+qPunZ2SBUj9tTqmGnnCESwdq07AZnwtrLr5xKNZHlJvCgwc/QTHD7vLd8i4jZ6HshbHmtlmj
	cWvcMT0I/gbkMiIIS1amZlujoZ7K0OidSqwFUinXN4sOgQhgdEVRQ7hw3qtsJqyjz6UENVE1pVf
	YaSwYhbSKBFRItBmvwkiLCZEytP2D7mlzWBtbZxKkwPbPIQ/wNSqJ8oaBjsOHjxuvuD3yvwwwk4
	JISPMeGURZUNu3Xi75Z/Focwvip8Dy2c/txgaYlnkueA+VTWWk8XtTqRbMOvS4FwwcUHo3MvYnl
	v4JALS6hGks4NoVjTGF6y4f5JSwJHp4QjtWpXyEFZGfpJnqb7ijq7AVYEG4VvUxlDep0X53s=
X-Received: by 2002:a05:620a:85c:b0:93f:977:5d9 with SMTP id af79cd13be357-94421404364mr1648767685a.0.1793615438226;
        Mon, 02 Nov 2026 02:30:38 -0800 (PST)
X-Received: by 2002:a05:620a:85c:b0:93f:977:5d9 with SMTP id af79cd13be357-94421404364mr1648765585a.0.1793615437867;
        Mon, 02 Nov 2026 02:30:37 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc174c0sm366006266b.8.2026.11.02.02.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:30:37 -0800 (PST)
Message-ID: <dd0d1941-485d-4eff-9fc0-6dc900d198d9@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 11:30:34 +0100
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
Subject: Re: [PATCH v4 07/19] drm/msm/a8xx: Stop getting GMEM_PROTECT from
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
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
 <20261030211928.45761-8-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030211928.45761-8-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: No8ZTskZYsCPpfHjkxcMJiS6rdeJZGIU
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae8664e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9tEP0OE30YQ_IqY-BwIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: No8ZTskZYsCPpfHjkxcMJiS6rdeJZGIU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX8GcIwNQXJba7
 7IEBXDbV/Wq4eGGw1NO/qQttvajbhmYBF+R2Cbs671onF51otH0fw8rdBmsAFjb2bqZMg3WupdB
 D0VTXFxezl3iiBqhLLNtGgYF9htOs4DHBZjOKKXUVPZGUtjtxtWmu8tVhBWB2iXqM8LhfED7XxX
 x0LNmXhs372ZJ3KGZUeGCUsGXxuhMNeENoYxVvFeaNR9iw+gCjIVNBR/pp0b8t3DozXHBU2WKIK
 oxLjdEA6zDKirSgCTfZVLXXnXIpV05P8T2XhA6NQKbdEbPvPe/n8jMOy7PeVrgy/LUqxQFJTyqZ
 h827pJZ6pmWYrqlaC0x1+2XXDdGWHB84kl7tjYvL+Q8erA4xjrp/fXQqTpnOJ2pj3TXbPZNsTW4
 KWmqcJqzRe5LIFxqqjpGzX6zEIGgbRqUBeL/cGS0TOlzHYBRPUypGCAW74mZXM6njXfwVHryEud
 KF/gWtk9JCTovWxIkuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfXz+rIIJ6qbpKc
 5HlEtp+yf7fZHP9dcE6oCrMjLQdTl8hTZHJEoLvb7HMG2VKh/aWitvIskneAh5QrBVDH4qIdPqn
 iq98AnvhKXu3GJAmhO0/4NeufgIMTmw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020041

On 10/30/26 10:18 PM, Rob Clark wrote:
> We can just simplify things and calculate the value, instead of manually
> adding it to the nonctx list.
> 
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
