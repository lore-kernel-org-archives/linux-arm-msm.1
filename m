Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364869;
	b=q91wDWvAS84Lf9sBPn6IClQ2Y+N3d8CEV5BNkD6yWp15q9PeTn1ADRG8w8ZkhPFlBoDH
	 RTaZw0MgqxjCh8ZzfPvuaKqE17EFjBfQLYMxEycLAKEYBJQTTdbhrXV4V232Oa24BiZVo
	 mY4LgWBLRWhdHH6rCEurjMJGE6FHFie1cxrfP+yvvEFE9sRZsJ8rQ3WIiJRKuIPzEbEhK
	 9S8Cm/NjbXUnRcnm52L6PkD3AxhwaVLPw+Iqes7gbFUGJIwktV7iz5gzcffoHB2dCwtk/
	 CNuitOxGw1z6BEm5q24eAr1Y44kkod5rR0myt53ClwkkIHHvgicfJC3cZxp1AOXnI0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pJN7OniSPVy0+buIjyCXoBHR+lwJ1eKIsrybnLKWdwo=;
	b=2K03SEzyOtqWGv4GR9gytvgq6IqLGC/AZUfmYW5J+nUWnqFDgcSCbyOyDCuv2QXZVW3A
	 8FeDybWHZWS3q4shgiqyLBBOZzWyly9Trozn3QpxZr4IEAcDPXZOBDulg0/JFyWCGmEXR
	 oueIJST2gNoTLIA77g6sx2Q0spXqW4dVJgOqh8WMotFDMxHUzodPpmnrM/iGh8DQm0/Z2
	 BRMePNGxvOXowU2tg1O0YGqgOMI7SmFhoeYdJxb7bEGcW4cgB/oYWjfyIOztF2InlJecG
	 ifoePZzTmbU7WsjiQr/7vYe08k//64E79zcjCl0bH6Dtx4wet9BK5K62uo/rBdB6O6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R2hgXAaz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8v9JfxK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2A6606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B2A6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R2hgXAaz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8v9JfxK
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBFx6l2169591
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJN7OniSPVy0+buIjyCXoBHR+lwJ1eKIsrybnLKWdwo=; b=R2hgXAazkcgtm8S6
	6Ksjoa2s0v3Zvffkjb8nFWNB1d07jrWfdScfOLB+Z9x2QULsUNeXsCt9oLVU88oY
	xWaOVfvb8EmsamAGr98O9YwOywe7Oy/YvTvtipITnfTPW10m+QIV6wdpE4ahUt15
	5E6WtSAQSYPWlriD7RFSBuTZTAO3aFoCOV5Vch+C2+vtPysDhgN65866gbmqlGKk
	UXCe+oWmM4be+XGk80BPxE0rRNiaeoB6jeAwCEdVWHGQUUwwElB4X6Qpv2qz+htK
	/rotaXpto/KIXKWRo3k1E6CHwcz8jzAuOurL6aJp67hwL6JobmYPPpjMWUv+x5PO
	R2E44w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pb3ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:54:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944102381acso15008085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 05:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364868; x=1793969668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJN7OniSPVy0+buIjyCXoBHR+lwJ1eKIsrybnLKWdwo=;
        b=R8v9JfxKQAejQXPmCEnLiyBW4JKjzFFB6T9RHAriZ68xz+pcUxMWCaP6Zvmk+6/dG4
         JoVbPnY3Yq/LhBDmp2IEaJFzxaJptaukKzwBbVjNe9R6GU1Md7ffD6sWDthM434OZ0Fa
         /qhnBKUofNum0Nxbe1S41162OjrZDBSiFaUXeekD6ufYT/1CGVqU+Gm/8xJp5bVNGgFk
         FRUnmCsDXMrZbvE5IF+3DTmn9AXJ5UmuUbWy/n1fdSfooeAunPPpc9j30kMcHyZ5Q9eC
         SRvWCErc0XqfmHeyeoLpWDmSBzyH0kZUgJrluizfwKWKECqrs1DsLXs/r4tHdZJNsK07
         c/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364868; x=1793969668;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJN7OniSPVy0+buIjyCXoBHR+lwJ1eKIsrybnLKWdwo=;
        b=bVyFWtEsqz8o+tUgcuKtpJqohPE3WUSgUtOcG/G6vxHSGBPDbPlPZRdVidKPfP9xEJ
         Lx2qZLj6ixsOfyexlvsa+I9rY51YWxpC4n+Wa4c98n7k2SiLpprb2g3pDN2T1+hIw7Ad
         akt2usAwjQ3RKbPzpe7Vc9gb8UM/oPNN4kkmOdDjw68ltQceCjwSPIrSJOAY6+FuuieL
         boR9c6GhX4a/Gl67rftOs6tz0drYRUK9pDomwBaA86tZlioOMkyIcmLpvqZ78sMVTjo0
         Fc+dg+CVLV41vDycbjOX8GRxdXRCZI8wgl4zU1xzDXxg4mY6uYjsq9QKHZeYhu0HJaRl
         5IEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIRBONemRB+uat/vT308aKJqkRL/LXnNX1XkxZwwvpk86GpiqB1GPGRFxGjY4MnxmrwW+PORubvd4pbPVN@vger.kernel.org
X-Gm-Message-State: AFq9FYJDJWLB/xjehtxQ9QY+Ef4DZcUb/xlhRJMsjGL4VCcM+tQ4KMWP
	bsr30T2AInMz87Gh+APRRvyQbv3p1sIgca5Zrxnj4Ct+ZTbur1WQKOZNRc9j7queWZiOgGNWdKX
	jla4/HHsPLdyFTRzm7fM9P1Sxhun5w2JmEyhjnbNFNfpvlcqkzXizxtSlp+HOI0jSdSMC
X-Gm-Gg: AYBFou0Nn7gBsRW9nlW8XiXaIGl2oVbwNidPDhDiMdItobcXlwXloTrly1D7m21Yw/P
	Me/AXJQ1sNWEtTBvsbo5DZ0q8zIQDZj/1V6z5snzi2BYJttzg52qMzVnW7YzfJGUj8YjLK/AYo9
	6ML2Lcasb8pJky0a5J7NbNbcwNxej8S2fZYr04eN+XVrGCzXrgSAfoX/jpH9Sp7pRhxjHWU125r
	arOXXN3uMrC2KDOL5P2OUzUXQLrZ0q12BMzf3xStGnCgs0Zjc/Xdbe/wOs7I1oSJUWFJ0F8VacV
	3t96SndmIpTIcGr6rew+QcnTq34ht3iKZ0luVPJ1kXAddVCgMFCFrckT5Po85uDpCQqkNxwHnsj
	ULDQYab0HVYSnZlgxBrmvokOL5DOKPn3Xu0n/prM9J+eUoksqKOz8Gp8eofAlU7iQYZxpzWw=
X-Received: by 2002:a05:620a:a7d3:10b0:939:8bc:8826 with SMTP id af79cd13be357-94421529babmr363508285a.2.1793364867720;
        Fri, 30 Oct 2026 05:54:27 -0700 (PDT)
X-Received: by 2002:a05:620a:a7d3:10b0:939:8bc:8826 with SMTP id af79cd13be357-94421529babmr363503885a.2.1793364867295;
        Fri, 30 Oct 2026 05:54:27 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7ae6eaesm590547a12.13.2026.10.30.05.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:54:26 -0700 (PDT)
Message-ID: <c4e3943f-a4c4-4793-8d44-0b578fdb6463@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:54:21 +0100
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
Subject: Re: [RFC PATCH 3/3] arm64: dts: qcom: tiare: describe CW2017 fuel
 gauge
To: Kupreenko Danila <keckerz@yandex.ru>, Sebastian Reichel <sre@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <179329639684.489944.6322623410181934358.cw2017-first-public-rfc@yandex.ru>
 <179329639684.489944.11313132727575469130.cw2017-first-public-rfc-3@yandex.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179329639684.489944.11313132727575469130.cw2017-first-public-rfc-3@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfXyY9rDMpyX3/g
 0z2yl0C8OZtD2JOaI4uLyjWZ55NwOHIj1MdpBOjEpzREW/QkLPA8K18eRMduDsYIqws5Pfoh0am
 V0wy3QVAxLY+n27npK4HjYGaBRX3Py4ScE1Zw5im19rH8mTl1fHLCmegr6OH1+WxFXOnPjMPURs
 MiUgkUodwJWOU26MxmxbpKpJOYSql55Y0CEpy6Ojpr25gT7pUofIfziMNwmkm7AAVjO8Dx/5t+e
 NySRC7MS0GZd7M7BP/ywsPlmWHzwtkFthtP7SLoUeNkAqKBv9fr7Fvk4y+rVJ0wu8uSnnJHe7mC
 D804BzzPSdLzwds5bwWawRFnvmIlxjRpWJFXQfXEibBN1F5VX6oVTfHRYy/D84ZPppg5mMRxltP
 Trqd2/mu33X/psynW7sSf7vi6Jy9zDn9yhdMVJRSju/E4hzHNHRgDa/BGx8wUurEb2o1sREGh3M
 gTFl+QE4vvqgjmFiZXA==
X-Proofpoint-GUID: 0NeeUYsFJaHWxu8a2XQICGCtApkJkGpo
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae49384 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=vaJtXVxTAAAA:8 a=EUspDBNiAAAA:8 a=ogegbmFYXjI9hOOK5TYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 0NeeUYsFJaHWxu8a2XQICGCtApkJkGpo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX9g3kQ1Hb1uVP
 C2iAHIpl6ZSQFbdUSbAX/XWF08eM+CuUh7iZJ4pasYiZS60mVp2IIxG0q/jERBmdwwPf6frUF99
 BhPl6kKY9fHfvA58mb9ht8/p25cK1WE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300051

On 10/29/26 6:53 PM, Kupreenko Danila wrote:
> Enable the I2C controller at 0x7af5000 and describe the CW2017 at 0x63.
> The controller mapping and gauge response were demonstrated on Redmi Go
> with Linux 7.1.3. The independent monitor also registered power_supply
> on that kernel. No charger node or battery profile is added.
> 
> The resulting mainline DTB is host-built and schema checked; it has not
> been booted on the device.
> 
> Assisted-by: LLM
> Signed-off-by: Kupreenko Danila <keckerz@yandex.ru>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
