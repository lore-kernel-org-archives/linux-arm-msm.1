Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201382;
	b=drpmEglNj2L6fP3bsEb6KIKXlI4oDjwDvpEPBEyrw2x0yotj38CWkntB5xaoZardKkm3
	 Mg8jPHrxRelLT00/lf/4bgEQ3xT0dO+fu9yRNHCRL+qEDf8SoHmKGMtIxyx1+jlzR6TMF
	 0/hjUz312B4D1jxdE/PgluPG46wcxwTvIYVQXbA6imTKRhwXtCFB9DUNR0cRvMea34/oD
	 OAbxDjK05G6Ywv0NnStTRbGe9byfb/6nm3G6b1XlFclI6YWBeenfo4/HHmgbFiYVLt2rL
	 8ADtOxq7viLdqcVs4JL2ex9xr4Q1sRHI4soHr6GBwddzL1hgN5fTWqaQ5PlMmECmD/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201382;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iQrl8WknYAEfdiOkOet54umzUF0swLaPr/vomAPeW8U=;
	b=Z8ku2Mo1lJFE4Pf+Yep0Z0BLU12+iae4OFjqbtJKP0eQODpqjn8nwDihU8akAsqV8n3Q
	 5tmbCIhXzsLo4hng/ih/a7X++JR7uwvuxtEPF8DWZA2fSMVqqja/BYbPhV5qaWocQUMP1
	 pRoYD9pGgneqCxUL3h48XEQl7AXTjxkAlzcDBguvPaYOqrDanIOzT48oYlBzCcAuojRKs
	 xZUMPbbYmqktKxTzx2R1m8NaEwV82A/OiJWDS60Crlgm4/kbCHyyG5i4RDG+0CPJbrhOQ
	 RDpfkVqsQgRwPxd3pMM/Vg4CBv9qHWoj89fdEpWKivO1Ael8phh2dJjm/GsAO4qSW3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gDLvL3Vz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzOzSm4z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A69606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4A69606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gDLvL3Vz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzOzSm4z
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA4jw2568839
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iQrl8WknYAEfdiOkOet54umz
	UF0swLaPr/vomAPeW8U=; b=gDLvL3VzhU5Bp5i7n7BerrWt7HmdtMRSMLDxihoA
	TT6qp7GW1PWTHZef3cBSY0Z4eqcJ+t2gSfqS9mXCG2ckezUJnBDiq9jyXD2bfyIz
	8PRSq8dFkSNcktui6PoAs6YH+55J6BFZzSEYKNqRe5JvEnKzQxHpLzYfyNIhyhXE
	TYNNnVvbn22KxAnjZ9l/EdNuzyMj8tix5hVi5aM9TKZd1dMp2BQS7+8129xAN/Ah
	G/6o17oOEq+PQQLyz45NxcgdyMXr09p2NGMVeW4rcSYeo5LX4zjogvcn+huo6B3d
	5/UH2Wj+ARLhCQmA13p+AoiUWJ+hy9aahD1PiG37Q9PYsQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pv9wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:29:41 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf45388253so19474137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201380; x=1793806180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQrl8WknYAEfdiOkOet54umzUF0swLaPr/vomAPeW8U=;
        b=PzOzSm4zirVaMUoRZn9LPhXWBzaxk8JIbbRTGFFDfnLyohbulCN/vFt7sTUQJFie4k
         NtedxWAwaJL7S+NRdC+aDf9ZUiio4uzN9LVMZjcTiZiGImlsvi39EROvIWFKcROuQ6zE
         1HKaXyaaOWpfRiWZmf3j116YgAzwC108KjQ519srF4pYDfl/ah+1T5V7uHPd4/WhDTET
         Kz3GOWIw5LVeFJgtRQKp+Ljy6WRE9GbtHgp/Z4ZZ8IoOmyaRk8jqVi7mSlp+EjwoSFBH
         nSQa3ib0staDSBmy3uE1xLVyK9LtLnhFeFKa+FU7QOrUrHGXThUmU2s0gUxYUsBI31ub
         H++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201380; x=1793806180;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQrl8WknYAEfdiOkOet54umzUF0swLaPr/vomAPeW8U=;
        b=cEYLRms33KzNzEb8w8qux0rYsjc3D7Sim4h/T5IDTRrc3Zy7rdZ91FgWmZt5l53pih
         X/1rB5tJAWO10QKYDf1ni+bScd0KIqRnlXgykewTg+YS9QPX434lBmNj3JRoHJjyvIUm
         /Fwu0h8UxS+dspJr7D+gGTAbPKUwnsmIsvegj/d2gnBDt5fMBfgNWWXqz90bgxLR3anM
         u//4RV+Wk9WvVSbKd+Oqw+ZKGKJFHN42/CzVBFJiqm6n8qDW3/rk1VpDQaxCLZUllUYe
         O2IEbSLbxHLj3VZxNjN4uMpTEmqDyFAOecxHA6rcWUAeZyN9gPHrjT0auUAk4hBMakiq
         wMQw==
X-Forwarded-Encrypted: i=1; AKwUvByjieMlKs+l+O1MNFA0FGBMYmuUn0AinTkPp0edF/S2oP45V3DHJ87YeMjbcYgj3xbLktEfJYD5t6YVF9UR@vger.kernel.org
X-Gm-Message-State: AFq9FYJVi+ZEXHQ6nJZrpMSdNoOm++Fq2ipGZ5TwRsaHpbjLNdGWffeO
	7ep0oG0lEKb0Ho7ml4lFzwanExTQl4t5n2flJVTe/td7WJe1AR7TIyMyPDMVF8RKjTG1ED3i/YX
	PDWy9J6bBDxx4VyRkLH+HmgAI1dS0QAqOingI0haWXsJiyug/mtBIaYHGiNXIAJgVmcxR
X-Gm-Gg: AYBFou3ishfFodcCRwJv2fddhEE/aUUpysQyvGLNNJVWrEiY74grSJGljP1/LQjwBqX
	ezQzbGZFMSIMFcpN29zGKNjzNCO9GeqYIlsCwLZedG2fh/s84CRFxj9ep5k0Iom03oGOjAGxGpd
	ZwLo05zfAYnbUikuqQjDe3msJ34Ix3fBqTzHam6e071c+c01CjcuO0GTVdOXaJs5TGLndaydRek
	bUoN0tDbGP6g37ke5C+px+zEvCD1QgHkvQKUHTUaLcD5rAviK7RWtT5BRBPFYC+aRqez0XhwXHL
	VpIOSRKAuVFvL4f759EzG8jMyxfqLkuOUl8Qvewn8awCt5e51rU4is7q6iV1p5fXyhZNdZeErse
	vPoBo98bVtGHigjJTnkvRSWey8Hk/DbAaChy8wu5gV6Oj44PX0ApgK6eP+rkknvb0Ww==
X-Received: by 2002:a05:6102:4b13:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d03a434b91mr1474831137.8.1793201379819;
        Wed, 28 Oct 2026 08:29:39 -0700 (PDT)
X-Received: by 2002:a05:6102:4b13:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d03a434b91mr1474799137.8.1793201379230;
        Wed, 28 Oct 2026 08:29:39 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92de010bcsm50884345e9.0.2026.10.28.08.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:29:38 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:29:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v23 15/15] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
Message-ID: <s42v57ohmpj55nsmfiae7ornwkh3wtxx6c6gc2c4nd4rlw32xm@xhyhyni73g63>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-15-95f250b18612@oss.qualcomm.com>
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
In-Reply-To: <20261028-kaanapali-camss-v23-15-95f250b18612@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gvA5gVlt2f-25_w8F-plBPSTh82Exr8G
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae214e5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WWpD2f5wiKzpAssyet0A:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX/lFpkOgaAfMn
 AUKZpfccpR3sbsYVR/+vFVYK1lCKfCi9hGXn3DTEFJIrVbc98pPnLHge+JM9vw42OqONj1UCQ/I
 VOI+JIxUSH+Fg0002Z007a2ixP2E31rTqwJ4Srdo4n1P5tgyble0Tw53aJMbkfuvz6TXp/N8jAK
 rsFEDeE/RYwohDBLlWXmUSbZboR2p3VaQ1nmBAm67AQClJRFrLi4PmiS5nASg8P6IkNwcZKNxvB
 RmepVjZPCwf7kjJJDE0OH0bV8Qc9nTpeU6gSgTczXNxeEW0O6KR8OQbsKnfa+zZqpdukOg+ipvT
 QOp24by/vBMex0xrsq3L9mc73WgnQHA59nu9MUmX6w6Txi/QFP2/1/vVihArSTuxsnVGgYNBR5N
 kmX9nwfdUoNRkmNfmC0o8OuBTO3qun6Ow1USnkI1kPoVM3ZbSnN2+0BjvUZwtfnNNhhlNw8q8dd
 IZQZlqnJczHEdBJGHYw==
X-Proofpoint-GUID: gvA5gVlt2f-25_w8F-plBPSTh82Exr8G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX1fVxy8EXgF9H
 lvDUxHFw4CyjzSY7MaI9Xzx4LEfDbq3KLjyc8CLyAcdJZsADzlxXbkG/J1qASlz/PSiFuhZ54Q1
 oG6LhIsi+UTc12TsWDbavDImz/qlv3k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 08:20:49, Hangxiang Ma wrote:
> Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.
> 
> The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
> DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
> lane mode on a rework camera module.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
