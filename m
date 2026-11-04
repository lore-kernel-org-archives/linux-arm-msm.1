Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783119;
	b=ql3DoGaL7K5fwj369JTPQ0B6n2+GJ5xg2dL9/4VmM6h0+jLoRwjRfJFXqNDW7DcQtUyy
	 ila2l5+quskpf5EJfUXvwhfAOxSPa/Oj1INtgdB+vivc+L90kwV62IIi3+51ov9Q4VOya
	 0BJNGP28aeY6DBLscF91npvx3SHSxZ/dsKY4rzuMakWBNsR2JHRU80wLzakzzooHMffZV
	 pXpJb+fExno0+Xjja+oK2Xe5jXNHNCXzmH17kH5KuGEWI8v+QgV1hWYux9rl+KrEpE7Dm
	 s43dgPtsAJuViFra0QFg/EgUY0akWZ85C9HG+7NWjfWuRd75gUdIxxugZ1DGjywXPBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KBeG/uicFl/5Pl1WxPYzj06Xh0SoRsIpVAvc4j63tMs=;
	b=SJfrVxFi1uhHV+57CbNguIUHk9JEPoWZSumdgu6TFQGEln0XRmKD2iZnrL0BupVWl0BL
	 eMcNj8GlqNLy7AF8+Tq7PDLHXMFL8lo6/PO+G0vuI8k1ccQlycdUq5oYTYJR5SiW60by9
	 log7R1tS8dsPZ+QOkMk/Pzx/TfML5lFoqZ+nv7JzukY9ugrLDYGAk7TAcpHtgN+TppzxF
	 B+iEpLDuawhF9xcJvPT2AR+/4PRQWIZTHnNC6wEWLQWp49LwZHLu1HrOGswjGJO44Jkdg
	 d/ADMUKQhv/T5pjQOmCOZub3iRYZHFEK9h2ZAgXntvUAyntyfIaHTWNy25ELXNVwx4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwSafNQQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bygwT1e4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB1C606A328
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 09:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EB1C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwSafNQQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bygwT1e4
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48L0n71274961
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 09:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KBeG/uicFl/5Pl1WxPYzj06X
	h0SoRsIpVAvc4j63tMs=; b=mwSafNQQF++T2mhvQQzZuT6DGOKLYs90hfwpYHFe
	tLmBK/U4aLOQKYeN021mYi7FYQ9/EPO1jQr36TZ9QvMsJhuvb1FmF8ZknjH4JK0Z
	hHqwvSprqcquPOJ3hgwlcvIYrTwD6IovbfvnXaTryLGYXwkJzhQaSXuxuCzV71bX
	44A/9iKt8P5/pNm3bmPtbxbAk7k0gSv7t0lWTShgukvOhiCpDWTTYPjCV62WYFwJ
	9od02D2IvOYaZhOsKkKfTe5pkRP3D5YnYnNgYvk9YoKwW9KOJiaASnMDV03yTTU8
	cTucMLdbOYNSNB2lKiGZ2PMAnVk2Yyy3P6cJs9TMEPN8Fw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypm607-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 09:05:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso728176a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 01:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783117; x=1794387917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KBeG/uicFl/5Pl1WxPYzj06Xh0SoRsIpVAvc4j63tMs=;
        b=bygwT1e4rKFvFzo1NVcUpts1Qa8QcF8hfnS5YQKYPWURAMuvnFbrtOnzf+CFBxWTYb
         2+zZze+VuQERWW7i6//I2GY6v6i7VmfyhW4wgu6DxBTAFQGpy6bpFFXolNRlRyKtCmF4
         YpE6gX+zBqkW2RBxH6lYRcBnOurLv8zHyZKCHA7XGcjWTVP89OsRTIqVuJWD2yqfJDsD
         bQ+9dQ22KSgz4CqjWrXuumE+Y5RdQgnAa3hYhaLFJPo4+VzbpUI6JMl6RcADKTJXiKqd
         J5vKF5PyX3kvdinrPqPjEkLJ+41Q2IYf2Pxv/ZH+Pgz2GQ71tDaq1gcuH1M9JT7Y2b22
         bBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783117; x=1794387917;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBeG/uicFl/5Pl1WxPYzj06Xh0SoRsIpVAvc4j63tMs=;
        b=jlj1QxLnCAf4rSwu6DkXYCgJ1QBScPbARbcp8vy2uBVphSf4ps28xAbubbxNNlKMm9
         xysEnb7Ovul+GK1V56GMXk86DfK7j8c2O3scZyaopupEZ1BUHe4IzW3xlzv9GX8LSwNT
         g8CeFbQ7EUv5mfManrGUYalB2fh8taM4tocDx4t8xDKo7Nlg21+zIzHkFtrFOjh1odob
         skzMN7lwhZopu/7rgYkjq9ntGlKlqQvY8L/BVmaFmUQDe+BOHX0hzgYOMCmBxZUEbv76
         i6u/QQstF2rciWoDF9+JaqIt3N8VW2d+GhxqoTXeWYAOnBTzLisvTOXjTtedXqgk5I8b
         tyhA==
X-Forwarded-Encrypted: i=1; AKwUvBw5xS3b0xWg1wW9Mm8okUXI7hsCEl2P+06rY4+sHJJXxCIsnfBZuT8JlVTly2sZS4zEneNmv1cV9nLgh7Hh@vger.kernel.org
X-Gm-Message-State: APuU4Z+YvFiAP3SZgbuPo3MBDMMPkiWQo1vkzLaetHfkpNae+0okBtAa
	kBjVX9T0ihM3aPFzaBwIRLMhDegxigkEJKcApoz8XdyrR3okrBLcr9oQSWoPt4bf33F8yEzL660
	LSY6eOPPEQP7R9p9BkOVt4xNOu17v+IDIUNqqQx/YCj+7y3qYsCd3DdG1WHRZwB33wFc4
X-Gm-Gg: AYBFou1yG5a12KuWS1WyE13PH8A4sD/eWLVMb1I31jPDykQkAErbcQ/9YdCwo+U/Dnl
	JRx116mQfjGnnzCOXWC15egUrmdX7WDA0OZxp0aZVXBOqPtr6cngrxQzy1AD/ScrGgKTYy9Ax8G
	xKiU0Eo/UOR+6h6sspn7d84LAN7S3CbSj6kREEpqNaMROi6Ey0Ie8X+xiA2VGraMrJuEuf/Q3cJ
	mOBNHOlRowvCmDbIrTK6LfTTMDyZJ8ziKiRknttZvrXSrGM1GoAPZgfr/uBXZ9godbaq3tNP+Mk
	hkQtfcJ88TLdAqDSxUDjhWGQvU7odEjS7DgLDrpuzV6vFRk05HeHEZggly8QKbymHixewewIAOI
	BZvqi9CmAESACV3W4S3r3mgZnmqtQpRx1yMCoQxZOcKBuVGWwMNTcg94DgBU0Ogmykp+/gUp5Lr
	JT93paP5MIQzh2og==
X-Received: by 2002:a17:90b:1c12:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3ae89286698mr12218419a91.0.1793783117270;
        Wed, 04 Nov 2026 01:05:17 -0800 (PST)
X-Received: by 2002:a17:90b:1c12:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3ae89286698mr12218395a91.0.1793783116784;
        Wed, 04 Nov 2026 01:05:16 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8b1913sm8533760a91.10.2026.11.04.01.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:05:16 -0800 (PST)
Date: Wed, 4 Nov 2026 17:05:10 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
Message-ID: <aur1RlNm2YLYdaxb@QCOM-aGQu4IUr3Y>
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
 <6234d23b-09b4-4a78-a2d0-35a71cd70504@oss.qualcomm.com>
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
In-Reply-To: <6234d23b-09b4-4a78-a2d0-35a71cd70504@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX7zLqxIFIJX+u
 rm6yYKuO1HumFwQWKnUDhurPvXap70pesVrQnrxcRQ9PCd8SQR4x0N79oD/tsFdruVHJXLcUpNU
 qTFH1fpZ/X/MmvCzOwDtSxxULoF0oqU=
X-Proofpoint-ORIG-GUID: NybRgU3qDUyXKQSqSli5tcdcE8I3D3fm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX1pJ0UJaP1BU8
 JK3RhNIzOiaiZI5sHUEmEQNGSODByyEzSjMvFpF3dQStHp9WqtlkOiAzvmMxXMii9Su65kRkzf5
 55vg/YvtoV3iEITc0y7KhEp85mupXaigi7WCtIUhcZBlw8uG9gEaLq2yRzGGW5UeEDO+Dlfu/cn
 LpzWx00ztt15ZCZ0kxGhVwVspeweVWVC8HaI/YRxjl4f5Y91H6SR0lTYDxuX07zi4FQ1c/1LWao
 gqELx8Sx/UKlwq6ZusknjjIRNShIlYc5GL0TE0m9MhAqkNME4leoGIe4cVXvvvEThOcv2kJR3KG
 VQiBhnoALAsDePt4Jn/0S8CnzkZZx/6ym1obA/5/vA0frCkMg4XAB3j0POkSL/ZDh9VBnH+N+vF
 9wP7Rhxe9SmfLYP+JrnOWvmk/RikSYZrP5SMzP6dDjQgCTtDPh0VKkBXoP12zpPoVyOdWUqy2bk
 lwBRqnW1RpdcRuLWs8Q==
X-Proofpoint-GUID: NybRgU3qDUyXKQSqSli5tcdcE8I3D3fm
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aeaf54e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hOQGxnIeUdGwE_sWoTcA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040036

On Mon, Nov 02, 2026 at 04:03:08PM +0100, Konrad Dybcio wrote:
> On 11/1/26 9:04 AM, Shawn Guo wrote:
> > From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > 
> > Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
> > SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
> > and DMA queues.
> > 
> > Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> I think we can't enable the ethernet hosts indiscrimately (I would
> love to be corrected here!), can we keep the XPCS nodes enabled by
> default?

Yes, we can. I will enable them in nord-embedded.dtsi instead of nord.dtsi
(to avoid CHECK_DTBS complaints on GearVM variant).

Shawn
