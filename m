Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349134;
	b=13/vsR9BxLplSupj3Tc8ttv87c7F+JVSMtLZ+cSPiAL3b6XJ/x9j0AiNtf6Q9Mldrt99
	 JjX5VmVR1bBnAotU2aFQhfkxaf67gpEhhaxJ/mkEHHAcLV5gZsxd7/Wk5XdaNu4b415fX
	 AhDqs2zjUCUAJgDmzKL0bFONfQ3uJKQaNYQCG55PlVX4TAN4vl5wFdBkGxrA24Ov1cvwO
	 mjhpc6OhJ/Zz9cVpBC3hIBk6xOL27jR71yzKSpL+xaXR/OruvhAW88tuYDQ+dFG53piEn
	 QQEzmJ/Dm8Nic65dyjFdk1S/VPdH39NQb497urGIBDCTo4CqTRhYa8eNFnM6svzCxcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349134;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y2nNmMULCkjiBMguFlrU+V/6B0EjOBHt0prOTM93F9M=;
	b=Re/JInPfzRIzI7VQvoPKtyDWmIVgB2R55BEizZrBeKvFrBlSXX1mX4qM69BcBGJfq+DI
	 NGQPEif0bXZ6BTxBNMFwG66TWnuXW5TNHMUljO8FjXEFaPgMI9LJejHNAZtHyZAeggXwB
	 7au+DffKfB1oxwNKxgZJpKfp2bjYhuKNgZXlsL4Nk/SLam1+KiK0CMxFrkGSge9+teRTX
	 TNLiF4b+jRWjKsqs5wMXnE9RcxjzvgugxksbXW2eeWVs51o+fuVjmcMkPwh9jSIFVy51u
	 hfHoP6T6sEc+KB+WaEGFXB3obbisys8x3xXiPYLjjLAHbgN6wgP7ICzeDYUHNqwUV5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSWT9XH7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDbuo76s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A55B606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A55B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSWT9XH7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDbuo76s
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F32c2134530
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y2nNmMULCkjiBMguFlrU+V/6B0EjOBHt0prOTM93F9M=; b=fSWT9XH7JUOojZrZ
	xNPFNDbX8/e8FIJ50SSI2/g6RslCmTRSQ/GxaPSbzPMUPunCvmahWT2t9536u8oK
	PwJnp2qSHBuwigf7/0fq4tEOxiE9bVvAFAPP/aq9d2yrXd0A2SWylArNQdm1Q/5p
	jIMWi4xTuV3vICZA9ZgrRSklsXGJd2L/YFIXH5w7Ab5cXbcUlZACYmVz10G1NtDZ
	e4rnqncrfY1IOp6Hl5Jef/B2HtZKjxTatIlDEDkvhxIjzmLiuwOP5uJ9N+BZpuRM
	1z+GbuQp7HZmCC5LhHtNeRTBemDug82fT/iKjkxMnZIVBXbRzL3B0xhdYFRy0Zes
	U0aB2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj03m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:32:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so9502785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 01:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349132; x=1793953932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y2nNmMULCkjiBMguFlrU+V/6B0EjOBHt0prOTM93F9M=;
        b=FDbuo76s05Hqc4Buply8z9wzqwji0fPRTvzLD0m3Y7em4RHbsQx7pVfNERScrCIB+T
         u8Af+UEZCDT0uiSnqg+xaqT7ob7WvTtYA7sNNLReoeEpVVYq4QIZBO/AAEoS/P3xNfJo
         XpbstX+k00Ki2C98r7M+Xu11hd48aK8NPp9QMfqKHPH+oG3YCDIFjKnXYl7yb7OauexK
         dimV/T5pLa4/UMvtSHTVdi0v/wUZxe4ZzilOK1HmN+OiPqdn7esVeFPSYdmHprisefe0
         KblgeSEmls6p0GXS37eDkbwtOoeJ1Ilu0RHCEoqKuplzBADTWutSFm/ofc6zngkdLzYt
         GIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349132; x=1793953932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y2nNmMULCkjiBMguFlrU+V/6B0EjOBHt0prOTM93F9M=;
        b=DBdDiEvv2PTc/CCrG18bHjVT+y4SDSKlELoQ0fGbES6D2JJ4dhtKOVfk4cjJy4zOo+
         DMZ5ngYTyAneZIwP8wWcBMfAx+GKOg1cj/w2VLrMzT3WdN/KfB20/7zEqJnlEAkrjYS6
         GWa3/zLTGxCZ00ATRAQNeus6JxdHQNt198ERJ6L20FDFBEVv4PXB0uCTWyp1aM1Xjnbr
         3GRfe+BXMxfUAkb81QFQOP3PeCr15O83v8JOavxcz2fp4mvmWwaHvFIFimiGVVYLBcgq
         b53in69h8fbZLRWz1E3edfACcnrsCeMqVKVqwF8tEMcFCRaPMjJyM6RPPJmhdwp+ED8b
         abpA==
X-Gm-Message-State: AFq9FYKLNH4WCXQc7oK23m8ZuLNalpkU6Xhh8DgouGdN1CWZ9kBdzfZ8
	FFin2k/e11Uime7ZFDKBHMryfglsh8WMRmvF6Rt0bPwfwvmm9CbVOikOsokwEKMtrSwBnewxXMe
	SSssTIreuSbHSaoPxBDPrbGt+MeOI/8e3F5RLWA7Y0hKMbbxXywYf9J2LkEobINmgxtJ3
X-Gm-Gg: AYBFou3t78HuJEga1v67Yx5BEjqsNPF0ZZWctmyGHHl9X3300eTtwnBmdunJ3qiku+h
	xxKrgsihtx0zrhn9oebE7D58fDqtag/7XQ8r0RM42Tu7iJDPOosSQ273uyIbhH+9dafYsQDFShO
	hxfS7p11ObEqTQ9SN3Bnfv+2RLNdCZstsvYZkfws/WJPDI+VrCRiAiXNUGRlWJnlheLdAZ5RjUV
	XA26/Fw3Mw5ycP4RZzAfFLQgXs7kqTeP/haBaG5TlVM/tIdrKJqCJzaK2GpdO5unv1DcY78oIcZ
	bZcnqPiJocBGKsls/0YmQUCrB736vD8HZZT+Z/QmLHY/Yo7kDDzpjUPs3p+jSrfwtNClGDCX/Ah
	tF8E1fkyx0wWNErtgmmC+M/PDzWG+YULJR8jCVrVWZTnYLPnw0PiMdF0jxwFn2Aj+yEbm1u8=
X-Received: by 2002:a05:620a:870a:20b0:944:127d:f192 with SMTP id af79cd13be357-9442179be1fmr260517385a.5.1793349132191;
        Fri, 30 Oct 2026 01:32:12 -0700 (PDT)
X-Received: by 2002:a05:620a:870a:20b0:944:127d:f192 with SMTP id af79cd13be357-9442179be1fmr260512885a.5.1793349131606;
        Fri, 30 Oct 2026 01:32:11 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd22bsm39044966b.28.2026.10.30.01.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:32:10 -0700 (PDT)
Message-ID: <a2854c0f-d900-4f40-a28d-fb55aad17aee@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:32:07 +0100
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
Subject: Re: [PATCH v3 05/16] drm/msm/a8xx: Add missing a850 ifpc reglist
 entries
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
 <20261029201730.151754-6-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029201730.151754-6-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzMyBTYWx0ZWRfXyJSYE0xehFAU
 8x5WYEtUfX4RxmsC98LSkjkeKJCvTnN5azAVvPslQKLtS+xRBk1GrBGG5rH/KzwVTULhloD0T+q
 KBu15b3eu9t9r6iigHDN3ucIDkzmXPO4L0J0msvzMbrdM9DtagiRzLDP6S2dGjmAgniWJA3S0lx
 jGTIakyP1q9j5xZ17157g9l/0cW98STXLBCW7elUx/v5tcZnDS90233yB0IUWWlGH3Qbiy9vLTR
 gX5RJEE5eG/UuPClBdVnlGTGvB32Q6YZTGmlT5J9DYiR1W7yXqoZUCOwqZDyRQ727zO8ZlwPuQi
 puSJGOPr+MUY35NG+M1bvFMbNdAmBYlWdLkTRoZYFLH631R8dNHT9UXpx+33p+mRnUxRFdH3ewq
 fIxwMvEwOjDq3d/yiX2G2oV/8XRiukSbnDXxUk72qF7svcYYASkKJnEK6ZCyR5A1Ud0wwZWu/ZW
 m8PIRmBzDZDK+D1Wu0A==
X-Proofpoint-GUID: sBz_RhGxVN5vBDh_ZblPkP9fx8x9s8gY
X-Proofpoint-ORIG-GUID: sBz_RhGxVN5vBDh_ZblPkP9fx8x9s8gY
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae4560d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QS795xsoLWCajuJlIHEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzMyBTYWx0ZWRfXzl7lQFEryliU
 Ms5kKGBVixZCpxOUuRtOkFdR7Tp09OOY97OQ33Y7jp5IZbsltTg2acAxerNr3YoBhgPZxACRP/Q
 QQ4xrm4ysHX6BQI1V4lfrc17ozKTwD8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300033

On 10/29/26 9:16 PM, Rob Clark wrote:
> We want to save/restore all of the CP_PROTECT regs across IFPC.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
