Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498461;
	b=BDPMKGd8ClSSGTmWVaslEzPzAz9yjhIi+WdbW/5tTap6nwDT6TpOGiSjoXwm9dRL2Pvh
	 IIPz22suC7UiusJ4YuFrXfGOUgfJMCKUW8lPSGyN/1hPLxyVHgpVAVY09TW8qGeRLUo/H
	 pUUS8ZkDl6g4F75aqlHKCnBPWpbBn7UqIuwqOm0dgbnpa5CdLxxERf2qY0hT+mP0xocAp
	 9r6bVs9dF2cl66/9coWKxAcIihgtLgL6vCir9eIQ9kBZEV2g01h39QdQpO8z53XZV+S/6
	 tHjlArmZBBofSDD0VWtjDjtLR6n8s9EFLEAPmGNEJeXn15rPROcdL9WqcJUCcKbzlNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498461;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C0eviU1uGxv+q5EB5b5AtlE48Vr0zFo3hsfKbgALgk0=;
	b=y9XTXVyHfs5f2ezvpXx6vITmpLaBlsInzqaBgY472IBrwrvkPm2osTY9AAfzhfhfvfTF
	 nTX/JImD4MIFbkFnlZIwpLANkbtTh3bQ0fil1IUbgdnpSnaXCP9x6XqODJy6Bc2tNhQB0
	 gDbwnmXjDcAQx4q4p4XPFy1DupgBoBbwHpKwRZJclsr7+BwUTmgFhB3X+DDH5Z5F360Oa
	 geruPCb58jqBzv0iAaUKFUY/vle6mSQ2d58JQRObIblG/H6QFvOHEnvh/0V1bNsE2B7EU
	 Z/SAvwJAVOfXyoYXLsa/QO6dXtqEcot7PHvrkDhh+rPfkA/GidsNd+f+dQLNCk5zo2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGu6Bczz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A9wdRHBH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6E7606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A6E7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGu6Bczz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A9wdRHBH
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxKrL1145611
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C0eviU1uGxv+q5EB5b5AtlE4
	8Vr0zFo3hsfKbgALgk0=; b=iGu6BczzOTY2xNJPwZigSiZSGn3BCjxbfsdu92lP
	cMWbENJvRcgCDg/prItIPIg7euHBJEHMSEwBGtYrbYhiqSyBwKIRykc6KRE9P4Bf
	DThSBNvuuKg0shyJATKxrPA8PzpExo1vdCIy1cmvA211b2DKgy8GUkTYbRohKW/N
	22/5oNC/sf+TG2bJFpiOKiqKTLMPs0zzadF/R1SlRPlmAleFSgG+UsN4yNK5NRWY
	JpfkHYPcNMOmKM5Bnx7hJdtSVcqINYSugjJZHXQPuFX+gloYSCK2inRR/EBO96xr
	gHaQB4vEKuKBib2zfz+D6HEH3xxb8o66nLKlw6e2NaXXrg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5qac3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:14:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb98809caso490913385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498459; x=1793103259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0eviU1uGxv+q5EB5b5AtlE48Vr0zFo3hsfKbgALgk0=;
        b=A9wdRHBH/QD9rHrl3SuikD47q5dN9D4chCAF6YAnCriPeuyyQKUbxqjwDhrg/TengU
         Ae0Jgiw4XeGmItFrjEiS+aVStpyNp++q/zt+KsURtKmK0HhWy0M6dNsdG/pKEvyOoExy
         +2pZkdsh1tjj6+rSMZTl0R+MxSc4kFQkKIRFW+TCBeekvwaRD0EBo0pHSGmmQR2VpHYD
         W4Vr4PyJtUlbJcSNi4s6gMqJErGjOUlEnLRkegmEK8q5B/A5dChp/UgqF+DJRtQS6qeq
         oefFPlMc0Uw52CvPqz9qXJZKRQv7BNi68eIPSezS4doeDZMN9uHx7SudgxV9jtnx634r
         fjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498459; x=1793103259;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0eviU1uGxv+q5EB5b5AtlE48Vr0zFo3hsfKbgALgk0=;
        b=NVfD3IkSe26e24BI5lWR6od7xRgnXnX/wJ6G5LqwDvRur0qUIFdPKLDvAs+j4Y4Lkz
         fBaS+yd83wmkoVG/kjdosftyJb0mjWYhUEI0ObI9TfCZFXSotK9h96oleNRLQ9j9GVbb
         NnkOL0eFMb98ciCQz3wa3REYitO2Tn48SZu28b1KnIVbCBC6D/7UaYwRnigc8VA23KR4
         +B4jkpIi2LWAWN28/tlRhnO1yyIzTnNm2Cz8k+f9y8qUZZh2HspBMKBrI60QpGfHyNd+
         4dTuqS92vB/G51LicioMtOhyXmMTIB47y47EN+nyUGM3ndnMUdvuoPFUmZEc76AtJPuQ
         9krw==
X-Forwarded-Encrypted: i=1; AKwUvBzZRP0RBGwoOtLh0LiaxE1lfiL3UDxLT/rsHnH/gRMT2Vtcj6i0AFpf5JHLHeNkUrsDnlVsDekGjFUZEWeV@vger.kernel.org
X-Gm-Message-State: AFq9FYIVW55HWtuJoYPKzMdUThvlDdepnx3VTQ73qawXpskxfE2b1IFT
	lMTuqnqo1WNEzR23ExH284/fSi3oQ99EzqrkcCuzvnbLoLR4XxClH3bHcPkT5u2njk2Pmg7YM+q
	XdacghP6Zqse0dsHZiQaf+Goexk2G4QjsL6qKcNVjLLMLHQn+IwqCUQLqLOwHwub801j2
X-Gm-Gg: AYBFou3iMtfZbmSrE8JgzKF8Xt3SKnzLzfFyu6EIJK1KeCKcyi0Z5nIfGwXwcGhTubD
	5DiBs7Y82jerPOEweqsniJ62qRuTCfcVQnEcsULdHH9W/DQhOTwPLtmWp1x7Y+WmYUsOG2nR25s
	AbEAJkKm3fXdWPjqad99rGzHz4i+9daefssUf5Sm8XOL1wsRYXdDctGljbjymiM4tTFKnjnfr1O
	LEJs5pOU1fX4VazZrnIXkCMCse0WJqt8QIBXJF4n+PfTseSqw8WJzcLpt5I7v6ux9lLEDGmSrg2
	fFASyUbV4q4SRa/Vqu7MiI12rlh6qrNGPHtlX3sBbhM1o4oYlrSLMcrFQR2PCFbX6XuneEDnVTn
	BgQUFW+7YFVn7Ewra
X-Received: by 2002:a05:620a:2782:b0:93c:5f3c:f485 with SMTP id af79cd13be357-93f29d1ed76mr1701108585a.53.1792498458625;
        Tue, 20 Oct 2026 05:14:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2782:b0:93c:5f3c:f485 with SMTP id af79cd13be357-93f29d1ed76mr1701101985a.53.1792498457878;
        Tue, 20 Oct 2026 05:14:17 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1e0632fcsm5034185f8f.0.2026.10.20.05.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:14:17 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:14:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] arm64: dts: qcom: Introduce lemans-embedded.dtsi
 as a placeholder
Message-ID: <k24rvwpj6lrapnph223rsff6ju2rchsmksegdbm6exofjs3ngd@6um3rrqod2le>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-2-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015023711.721837-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xGaNTH6l_ENu4fXm-bO4blv7LkbKnd6Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfXx3B5VjnCNyaZ
 iSa1+f/rIK86m/n6z5J386oH5Sn+T6zO0Vt8V/Ge0hu8Nc8ixyRzaOECNb7vvX0d3/XstK1R462
 518xBKwz6c6rxgkP3TSxmgG6saqr6Gsxe31qCuf+HKmWpyc+61CVzyMXMs1130swp7UIbk8x0jt
 K6Yoet1AitadIYQDdtze/hRonUdjeOtnoBt4uk0TeeaRV7XbKwCOD4CpmOGFizC94eWiklED+dd
 YjSP8qPFznQOQJ4E+xwz5lZOJewcaSt8JP9oUAUEU9eOh1j/ZqxidRu2IlBBRkCa9S6KqDxe2LH
 keUPno73M+oCPpe2oguvDPRt2UAwyQpTeS/utPhlEg8K9dmNBPHXBgtIyvqo9la9qFljsg906np
 56qc+/HRl/MMCG+R5i1pP7OeEkD680Axv6xpnaRBs7BLI4qIQeNRr331NCJXQvbqD81g8w255ti
 cJWCyMvQdnApv8YJ0tg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX0ri3tRkzjms8
 Xt4N9qbw9rS34eLOPwnsTv6v/s6+kUD+MNYk6URXpyekflRvic9xnuleYVEi1pWRcSchmS8+DYD
 eE4XaHBVZuoLxzm/bE1QgK4ACmWLYjM=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad75b1b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uVEy52KOV2DfC4Ai_b8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: xGaNTH6l_ENu4fXm-bO4blv7LkbKnd6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200048

On 26-10-15 10:37:05, Shawn Guo wrote:
> Lemans is a Qualcomm SoC family that includes not only the Embedded
> variant (IQ9/SA8775P) where platform resources are managed by HLOS, but
> also the GearVM variant (SA8255P) where resources are managed by a VM
> as SCMI server. The current lemans.dtsi covers the former variant only.
> Introduce lemans-embedded.dtsi as a placeholder for now, while later
> changes will move Embedded variant settings in there and introduce
> GearVM variant support.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
