Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349437;
	b=IkkAo2jJ8VhjuwIps81YQKEcBYlPAOsCf3twOgWKlFZqAnfb70S97AWUYy2ZcYlKP97j
	 a21Wb5rJkMX7u69Lr76s+cEsQy42FsN5vqmcks4SR/CyrkZHhGfMbFL3jCRtQLuUnEkKE
	 +DgbfTmqQjzz/IqFz5PID+O3+AJo6RKnF8c7N8ZT9tlI6AW+IY4vvEXOEz6/tj8OZHsYj
	 Yqw7/kZJ04I5QLR3nSCrrXd+0paSwRxEXAAb1jEjPvlPN1aH/Irv2+/MjOJHdoxrZ5bcS
	 Qy+vsgjw7460PnIrXx+U/pe+5Yks7R72Wl8nwZqGrMDyF46T/SzKXR3d2CyQq9x1a/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349437;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=s8Ivp+bT7DEkicAhEn64MXcraB26IrrC5i5zD1lewD4=;
	b=H64xSXStQPQuXfUcIocPTdcrnVhcStdn44kft6dwZhKNqbiIJl8mtsyEf60Jy3D5Ise2
	 NRZlg6v9OnsQtDFTtUF4Fn6TJtacjLEbnqZQjF00lSUcNmeHuW5VPl4IXl9eQhG5xRTHT
	 vhEU0vohgJI6IksH6tHBA17HwA92OSZeTYrbloJsH1MItD8q8HuXlDYEee6ESNrtpfxjE
	 dIeAJj1BiPRTzISi2heLI+zzm8sVqdGfy1PWIEfFbESFwzsBb25kRmvEE0CQxIZKhOnP5
	 joOFS0pFaZ0Abe2IICvMdrXow0rCF6QUzxDyHmDnkQRlx7+wDMToWNvWb+7zX/FSZvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R6su5Xpz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GPzaiJs0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D434E606A337
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D434E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R6su5Xpz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GPzaiJs0
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FI3P2733209
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s8Ivp+bT7DEkicAhEn64MXcraB26IrrC5i5zD1lewD4=; b=R6su5XpzpAGgyn9A
	0pXcsmChGNRgVaJSNhOyqG71lOUgobdh5lJyBWcKkYSUCEF/KsBqv+IUZXDdhkoo
	VpsCC9k88tNIfZ0FSB5ae9ox9Mn4+9LkD9898r15+6EHtQXgzr3QeUmWMgvnIuYw
	mCqb5QOBNlBf5i1JItnzro26L+5Bd35cu+1pdVjoLnuTyNmfCsKL5eS5y2+b8YrK
	uHrvMZ97jCjncvk0koZUM5ZIBkJYlyCsRy8erTshhYXpqGGkUxbtQtEN7B1gg8uz
	CgXRMZxxRoV6WgdfnVdalqPx34HHCX+9ou1uqUM3/yMMs0zMmnqr9VsYUcytjbuX
	ac4hMg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj15u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:37:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cac495d99so2402785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 01:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349435; x=1793954235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s8Ivp+bT7DEkicAhEn64MXcraB26IrrC5i5zD1lewD4=;
        b=GPzaiJs0o91i9mfa9N0ZOhDQDKiCmuvHsnVjf8PbTVu8tJu8Wq21//15Csce90ldjn
         +9siYOI5UMIz/6uSt67n3v0TUSjdUYD3ciBuiXTSSGLuXAwvDP7sza8r7tldUbDU7Ow3
         NIGvWiBGAgdV1+Jb0vRfwJQQGEkKrNkPXgXXcU6ulOiQyrAP4zsxR5KLR1tnZDb8DMpy
         Omwg+pJ2MC3XFBNkXk0ZoP2P3Y0C8X9Qt7AFwe3Fg2Z7GkdRiDAsRCWvQX/am1coYHGn
         3RPqqjC7+IQvDFF76nUN4VB8Bkvv74TyJ8c4s2YfV3IhXK+UYY5qrpSw0DnQVn49Oejj
         w6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349435; x=1793954235;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8Ivp+bT7DEkicAhEn64MXcraB26IrrC5i5zD1lewD4=;
        b=GJD0DQQR1HbDVSPrvTe9uiTtwTtwMaLXLFJ8BpK0V52mYsAYio15rVoiB+iyZIDMXF
         hxPk7140AsA41wy+SARM0XixEVDzn7EK6tL1eRux01oBfMx1f/dW1HkwpuhdPh2J7FvA
         j9P+vQsKMkWEoGu9D0vM2Cq72IA1GuEVJG65eZ8F9d6vlfbZ8Ii/sazVdweCV00SqvAp
         cHZeZRCN/YVeUCs0IgmwsZw/Y+YwPspKTumQAfNDJESOTgzk1q+ltiZBdHiH/VHDGIVr
         bTYks/+3kGA6YXS6YbyQtBoDRTw9UA/7ovwFa5SJBKq3+mo9eNVcnKpkmlNLYCNznr4a
         +UEQ==
X-Gm-Message-State: AFq9FYJ4/TLjicqJq/HaMVIXHXGD62fHi2UGLXtPuKCnICj2CeJX1xIw
	U1KckAA4UeitxaUn03qUW+qcPqaqn81PIhQ36wWSJmhQDA8Ex1q10wKF7AE21ESpsmW038+jemm
	xHXVGsvEc760thstnl0IXxMuYAiqBs902EIBdWtHzaS1rF1DkRPdme8DrvBpWmhFpFyxN
X-Gm-Gg: AYBFou0t053tXg6wQiayIz7maR0e7us0WLPKG1msKXFfoGX28YZQy/OS8c6bSpcStqn
	ZdSip/PSmEHruXlFmvaFYZFJQuj+frCSYZY7vaf25cpsfd/gp4TNgQFV4XTCM8c1Uml54v5BEVa
	KWQh17XBar7h/AMDsVLT1aTGiUUwGOs5jeFI0pRa8RapxKA2Y7fqfXJXT/PzPpDHjWEA3omO903
	iynRrJo/F41zQTE1GdKIvcBlFtvslDJ9RJmvPD+ZORW9IePtwwHkSz9Fe9HU8kkUPhcPK4jzBFs
	Vw4KUhBNHBCkAH3XbSresmeTzqaLeh4ml4ZXI69TH0BODIN1vubKlUN7DPhh5l5P/M1jKB5qNeL
	7EufJI3iMAPHu1vt2rFW4adtEAszo9Yd1dvEgZ/B6/8Gt+/PiYLrtSzMvfgMEZuO92PGa9jM=
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr264364385a.6.1793349435429;
        Fri, 30 Oct 2026 01:37:15 -0700 (PDT)
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr264361285a.6.1793349434941;
        Fri, 30 Oct 2026 01:37:14 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc7bsm40134566b.21.2026.10.30.01.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:37:14 -0700 (PDT)
Message-ID: <987b21ce-cab5-4058-9668-94afb1210a87@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:37:12 +0100
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
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sdx75: Mark USB controller as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
 <20261030-usb-dma-coherent-v1-1-3147b8f7aa64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-1-3147b8f7aa64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tDUApxmu4p4l6dGMcom-9EGbeOvaQaR_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfXxygzBi+fXQl2
 CwdaFZk3xgDGITyxLmpEKD3N+K9JgLwmoHO1jrccjvTt0CreVNLro77GGd8SbGbJcNB/zwC7Lt6
 28ykTMO/oaVA973air6QRpZviZYrcaA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX/CxhumLmsh1n
 7xx9TcyRuv92Azp6OKB9YSVynHL2iuXyvohW/rAfu7qdxEf5LuyXRgZazzFuHfUR9lD7l1w3xH8
 uLEeCCR6Mg2zA7PnH3MsXanQLbDITyWMCwheaLFspquwjjyKb0d8bsSvdJD7jIWsy1p4nJeThHf
 zx/0mTzcl1T4B8D8ZoLb447uyFbn1tIN3IVurmT0m5fpet2pW0P239F9RstXDwiFXiyTeijCrRW
 JjMXaS+T2FemdvKt4BOhTHLPiKEVrkjf3ffUoNAq+stJ1m7j7/jElE7YvK6jmPcLnweccm03T74
 2rfesZri6R608yGU0nCW2/PqmEHHQOA3CktMVLNDAvD3OiOwuMMagKuCBSZ4mSu9yONxVFEQv+A
 xBTCUltfiglyH8OacKzbOFb+Lq1skPJczq/oDtWZeZUrlv8a+XXifGH+ZjWh+ylmwMT5pJmjRVz
 IHbVBOcirSiBrtqNkuA==
X-Proofpoint-ORIG-GUID: tDUApxmu4p4l6dGMcom-9EGbeOvaQaR_
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae4573b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7li549WNwbtQ9Hvr_rEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034

On 10/29/26 7:33 PM, Krishna Kurapati wrote:
> The USB controller on SDX75 is DMA coherent. Add property
> indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
