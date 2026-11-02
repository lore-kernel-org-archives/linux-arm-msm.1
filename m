Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615478;
	b=CGNG0QHkRmOx+WtHuW+oMQC25uO8rJWd/1voct1klQVKdxyDUECQV9n/qtHLn/hu4RyB
	 zPcQkaVZvroW0quBzFUMpm8cIqBLT1uKFNPJFC0cYmBNOni6T05dEJGn7ueZaMMfgjeid
	 1v4kpSOWaOPy16jY1tdyhEN5NijCErYvk00nQ7BZCU5idpxSuigp6L+PNNJP+8bxyFF/g
	 ejcON0bj7PTfNwGzA37gQLoZ6iXrVQtCY63IUFspcW9zeukTgPM5RLLdd47flf4mJ2RDn
	 xSWE8L3sl6I3Eu2UZpi3RFeTNspQNnNtc78FRjK2549zJEjfcnbDGii9kZipwYEhv8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BD2jJ7R23UELXBejTUvUKCF/Tie5xKv0KES5hJVghpg=;
	b=VOX3DDt+E2TTg1npBL0n5/nfYt4ucA5AgLxkxStvvHkMkK6JCtAFqgC0F0OjWjbzzqS0
	 nzc3blEAHt0qfoeNTJaZNEeJ+YkVoTbXPAKf99lOCkDU6jDnri5D4rk4YLY97lwv5v6YU
	 C7h1GPLfnmF5QXE04VjSxO+erOsREIWVEN5GCuQmo94AFWh4LlHUCD+BYkxK/OjTthl1u
	 RS0V6FQL2ewZuZvaOpKy13ya+0IITaCEe94qldZf/luHtDve58eiQ7O+bmQa721r9n5G+
	 NEluQqCERodP2vbJT1wjqA6IrbnYvqul4OGrFzd2A4M6G92mnbdbpcCILro47xv8w1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iqOy0Qxh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCP9IEZJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754B7606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 754B7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iqOy0Qxh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCP9IEZJ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMWh1821130
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BD2jJ7R23UELXBejTUvUKCF/Tie5xKv0KES5hJVghpg=; b=iqOy0QxhOCnKNBdb
	/Rh6UyYWPSeiPz76xCjfWUaNc1iK6XbqnFzicpEoMLn1OuC3hZKuC0tNztnd9/B0
	PlvyYYjvjvLtrAOIA0VfMjrcUvp3ndTUlyauhME0PPPjRcZ8MDTtJV/pX8VYURAn
	QIxZFkwtM/Xn8pjfgOA0QTvCrgBUmoTd2RHYmRdBnmRIrAsj+lq9VpPCx8CTyQrp
	v3dt7CsCODBmt1bmLjd1CXKa+lgauQzbhH40OhNhMmiy6NDfBz2YSpVzHLaRom5b
	Sj1hLsRUPwhaIHXuxRm9sPLo9B9EMpfk3iFFUOuAOYvBIOD6gSiH17Q5ug6EhyBb
	TnNCrg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4h7jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:31:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f1f2ecfso47720285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615477; x=1794220277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BD2jJ7R23UELXBejTUvUKCF/Tie5xKv0KES5hJVghpg=;
        b=aCP9IEZJ35thTu+xxh/A0nNM///k4CWeCfLgntDzgzRdt0NKakkvUMCuAT7NoaXKoY
         6OcNrlkJPVNPXMvzQ+DrfCrgHJT0eegx5NBGti/rrBQeTzNKlnD7kTPxW5CX2tgqKaAG
         XuT5MxunhN8We95E0PPOoffzkjv7S5us9iwdDqmYCrak+//Z1CR+dZHhvHH3wx8ICk54
         D/hScTiiHpXddkTQhI0GoungCMak2Dq97FyZ+/O5bilFXgcPdeT/MUNRbsI2qCDg3f3f
         +Bq5/tPBNpQ7wm1pIl10Nw2hG8pru8I2MyjBUt/m8MQXxglbpdWJbTqBtTR+DEcD4hoN
         mhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615477; x=1794220277;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BD2jJ7R23UELXBejTUvUKCF/Tie5xKv0KES5hJVghpg=;
        b=Y/G31HAW2JqnzEDLSQQRtD2kProH9bMRsU0oR9pv6aXbX3o/U5mHyROp0Wb5wQkV8x
         JbDd5wShpqo5FOmPjm7fEtKoxvpLfJsz99sDGeUDQHjD2pzRuPSkOG1GjsvpKlLdbh+c
         rp+pYy+JRrPwGSRpSYi3Zbmd1FQ4p/+o8+0sUJ3nbxugz5U75TL2ZsIns805avkXYr9o
         tii1I4Rujt7/I53lRdTtulG1Z3/f8mXkHv6Iiobe2Nq/u/URfxrwcQ+TODc9qJxcrblB
         kzydBFXKQzNaQjWfIxEXX6bouIwD8Zuyt876EBbrCa9u0hUQufYyTmTi3wD2noGcfC8c
         i1Og==
X-Forwarded-Encrypted: i=1; AKwUvBxzjJ7GDhs2swUwkj52Qeao47B3mEYyI6BGMQPedsB6nvzpB06FU3cmOOZjKqPodk2KpX8Fu6F7fAQ4eCkk@vger.kernel.org
X-Gm-Message-State: AFq9FYLW/5BTSG/5Qzz017Nbl/Sgs4eOY0d8Fv+v86YL3ShhWhzt079Z
	ve/NLDfpnRQc0dXdzl/OVPpe3wmAPfkvSsGTHsvQurh+ACf2Q+cLsmorm5JEhDqbnW0I74WabHQ
	l4W+HWRTbyzV2X3aeV3u5Ze+ChNVTjuaVhFLTNMIOof1eHfkkeXxWleSF8SGu/X5J7dEw
X-Gm-Gg: AYBFou1oeP36B+HDSMxV9FBhFj9/Yjsk695h3jk7PIwdIrTDo/lvkSkrAqP6GWIUYwy
	yRLYfV7ZYFdcVHjJYVC1/Gy7+ncKPNRrp02aWMU3HmHpcyZ2CNGBPwb22BgpIyJ6QvuLZ/Pu8Kn
	5fxZKiWanfIqFclqeu/HXpoRdI1F+WQaMr5EmGQKfVOEeiobyJc0EBV+dlW/TZ1vikJvDK9fN2z
	joBVRDBUzFo/FY9H1i7OobDTeDC1QTDabadXqDIIJF2wmCIqou912Ml5jTsQiANeHDUXOcaSkGY
	ePQdxUYw/9C+TcmeuJHeMciUQ/JJeEqUIIJkYEWPgizehWNG2NtknyrzfiQPg8mYEnKVXDHoe4+
	IlJJVH9EgAB6E6jKfMJGRwrvGByIAFHgd65Q1XOAuZTevvBewQNGnjl/wcFyOYKafEpTEh7U=
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr1550882385a.2.1793615476622;
        Mon, 02 Nov 2026 02:31:16 -0800 (PST)
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr1550879385a.2.1793615476113;
        Mon, 02 Nov 2026 02:31:16 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf428f1sm367117166b.86.2026.11.02.02.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:31:15 -0800 (PST)
Message-ID: <01e57cde-a18e-481a-8b4a-e38d467b39c6@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 11:31:11 +0100
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
Subject: Re: [PATCH 3/3] soc: qcom: smp2p: Fix possible out-of-bounds read
 with too many inbound entries
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Chris Lew <chris.lew@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261101202404.156522-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20261101202404.156522-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101202404.156522-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Hmnf3eXeD4-AVHHJu-KMnfak3dXiKad1
X-Proofpoint-GUID: Hmnf3eXeD4-AVHHJu-KMnfak3dXiKad1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfXyWFhdvE7Kqie
 ymki+0tN4B3JAZiIbOGR/qCnI2N+PhHrB89vPyBfzMTi8U9kBDksgcQ8RPhLlseWRFOWx1r3vGU
 M1ml25sT6iHTghDWsbSy4CRjG9XyIyw=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae86675 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UsLgiRDap3Yzww6lrMkA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX6PEFd1+0HZvM
 +aU0vRblcUN7PMQikVTdsMAdA5g0K4bmEmW8CkrMyF9yc3GZfBDmBfxRaU2xh5C/hSvRJefy5JZ
 tw4gDhHSTUHXfMXe1n0jLnHhQbHtNDqM1n/eOipyxfiM1ndiQkgC+aWkbPU1Ulfw9jTmSqZx4OZ
 1V8OL2FlbgZLJW3B7+6UATnH0fmzVHnrHkcLAWVwf37z1hHpTWXPj/EjYCA62W8hKaNraLxeJdy
 0vIj2hqZgnMl9oURc/jtE97iM6E5VRF95qp1d8WYSNqCnp2TTLsFXGS7cFAhhZhUkVof4Me8t0B
 Y6KsSGDMvEp+WpnATf++2oMr718AAKIxC3JVhSLs1Sh80+jqlsQkEnGXtMMYINasmXshf/FleJk
 GONdQWHDujD87KLs+0ArCQylXuDH9+Kr5V/CZATXGZI/3fnR2CdpvJTbVOxNmsNJLWwKTizlWrE
 IUwLivZB6RNonxBc9hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020041

On 11/1/26 9:24 PM, Krzysztof Kozlowski wrote:
> The inbound SMEM item is populated by the remote processor, so its
> contents, including number of entries, should be validated by the
> kernel.  Number of inbound entries is directly used when iterating over
> inbound data structure, so if it is higher than actual size of data,
> kernel would read memory out-of-bounds.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-b79427c9-5d22-4b48-8ee7-1d7808101e52
> Fixes: 8a9a7b9d14c2 ("soc: qcom: smp2p: Add irqchip state support")
> Fixes: 50e99641413e ("soc: qcom: smp2p: Qualcomm Shared Memory Point to Point")
> Cc: stable@vger.kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
