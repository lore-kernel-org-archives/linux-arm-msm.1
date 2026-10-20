Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479470;
	b=RoYPnCAnc8F7xwXbF9j/4EMejuCdRGY+rUTt9NLNPUUfoZw6xGaEqYz2Alq4fQrglTZH
	 yylAHP2pptYzEhcc297k0mVFKkg3iOipJl+XlBWWB0TcXGKyK/I29OE3fwUQVmmLv8+yy
	 tjpvK0SlvYvxHqf1aaq9Wz07hPApKnfKU0lMxrg85gh79n15mfF31Hs6b4Bvr45HsBYjG
	 IG1gUcLQU/0995IQAqeR16mFn3gB2wmPt992+yOFU2sB1X/32XjWOIF/ij7380VqPQyxA
	 vuijmLhTSdOhLWLvoSOf7IlfuZmrPy+QmNINbzwoxhHE/r2nWj/uHzGhDRIPqnZefig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479470;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=;
	b=c6EwdlNrDALsafjCJnpPdkgT0lVjucRbVpwc3d4XXEos4e57MyH3wnFzGettJEZsaa6J
	 QHZL5J//95IVw2c7fCsu/22S5wxrHWN4BXt5PS/WRxSRSbTQkMWqAQ2veqwm/kbjb2YGU
	 K91GpFIO8fAGlY1Tp4KJUj5TAH0D9XfqBoBi/+fdIMmVj/i9VY6H6/EKRdanIwCjOKuOT
	 N53B1dOc9H6K4M5H23p3KCdPaHv2ZzwiLnbQh89OHl1zB9tLSarP7gq1itKjuI8aiw/jo
	 u/btBc8Ohz7SyfVfV//fdfu2lhCC1U250Jy1ee054lDzgv0O4sEOKE1YIF0dRBXEkGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TsMk+zH2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z/dBO5I+";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8536660A3811
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8536660A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TsMk+zH2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z/dBO5I+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tIAO186498
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=; b=TsMk+zH28Jf1GdAt
	qoT/9lY3gFvz5TLeqhj1zhjWRu8+FqDdFNWulTwLsbYzVQfTU6IDshTW+IeTyGJ+
	kGSkRSxfp9vdnpQfA6lqD7pcxLR68OI70Mt9465AN5Y4h+WHqk31V/iCoHYhjYPe
	eCAqYmFn0QatzSGuVb+N7sL2joz37VzaG9jN73cTO2yhVnPnwDLHfYnAcUWsGj8H
	oHsjd1ZKOlveUSCrwbVhWnGMpzM0gETFBOeSfWHbnwjx/FM9Lt3ep9tXd8VN+iCW
	V+KQjGhQGEdjHvwomdCdKqM16NSmWCMWbPXigbxkYa77AvqIE6TzC90koYj9YjEN
	1Zix4w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ns921-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:57:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53568f05f8bso9159921cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 23:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479469; x=1793084269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=;
        b=Z/dBO5I+dtbYNTgmYzziHAI8BMH1JX0OrFqcV96d/B1CRKjF+cR9VIdJGPYUCBg2Ee
         NUkRp1QCzFpAdSPXPuPZXXpqgszMIXFsy8+QhRD9HQwgPyD3PJmbIRGaThnG0xJLgyY6
         H7uf+gbrFexPSvORE2cJJ2cmCFCaR9PC5xKvkvhDps6zmbNo9PNcdwMXWhK8T6EMq4dm
         y17E6nBcfeh8bFIHwOntr0ueRPXxf/r9Kfl7SygQoBurdiITbjGWWswaVucls0QoV38u
         JlW9AUX5UItVg2AVqeNgtu3XRhNu307ViotZ8EpGh8BRif1TOy6ehgV2DdMmDXkpJFcB
         otfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479469; x=1793084269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=;
        b=e2hbQgLDUMIJpb2DTcdKQJSuUSJpk0C9rqDRMZ2ezPXr2GCz53NM1DJ6jGC0B04F8X
         RoftmqEsHbXCBXSE3/hIeYraV/Pcj/ubCmpAmtAS+ryj3+ng7qA/1+VW+62g7LpTesT/
         ZyQKxL/U8cd43EqsNLu6ezV7QUSYwowMWRExptP2FMIDip+WPOaVb/r1Hwprs0+UIp7V
         UQO08K4ChvTe6pJT5Sv468aiHpW4XKmpW74XhfAyrZOY1/WYerey9KE8/54pL6WMiUEq
         mWM4eVw5fe1q4zbJdOWniGbWflKDIcLUN+gD6vbIautiiVeE9MtjFo7ZGUJI/9y7LYBF
         l88g==
X-Gm-Message-State: AFq9FYINdAEKXAROpJZJn1Z13jnr6TOvWN2E+XXozgRuSInOtPl1j8y3
	HObWhd4VVWzNAgKSbmLtSKVZmFm2aLyv4P7QuCkU2sVxtOK7ACAtqS+v5bStwT4l8PxgioVTmrv
	O3kdPBcOhCPmnz2Gxl2wYHU1SslrWA9WP4m4FE0Frjx+adGTpvU3zhhJI5ePOigGgmN2T
X-Gm-Gg: AYBFou1ip+3/ebFSgS9W73X/bu0m2Rbokxr+oSN9ZbeT3r0x84tGgIutobSq8tOc1HS
	fTXDIGHaDDBH+vF93NOXTF1Sgf+BVdxMx24/5LhO3cSbnf14pVs12M/As+aM0GKFOhHt8QqKPdY
	xU+Cc2r9SijdZR9tMDJgjlQ69Wg352XtxZtbbBemK8WY3Rq8OacOTltLtt6TsivE4S38MnC7gh9
	ZVFboqjQfzRZnEEBjSa2pCAtWhWMAd4QtZn+ywzkGKIbNmSSRUk3HspYUlp/JhQbh6VAFGEzoxH
	KbR3Z4ys8AeKa0LLDtkAUzqwIBIC7tivbfbX4o5ZgFNa4OJFwryt4VZK+eKN+4Lj7hs5WumA5RS
	SHzDeFUV1v8Unbspdxa7vYQ==
X-Received: by 2002:ac8:5701:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-536461cc281mr179117541cf.5.1792479468647;
        Mon, 19 Oct 2026 23:57:48 -0700 (PDT)
X-Received: by 2002:ac8:5701:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-536461cc281mr179117151cf.5.1792479468091;
        Mon, 19 Oct 2026 23:57:48 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd10d4sm453415966b.27.2026.10.19.23.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:57:47 -0700 (PDT)
Message-ID: <45b92e2c-a310-4bb0-ad8e-2fb5b162fbe1@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:57:43 +0200
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
Subject: Re: [PATCH 07/10] clk: qcom: cbf-msm8996: program the MSM8996 Pro
 post-divider
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-7-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-7-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dvE7dsSOcK76lR_a3vFgTgVbOZHg92Tc
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad710ed cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RnTLsUR5sZSAZyuXL5kA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: dvE7dsSOcK76lR_a3vFgTgVbOZHg92Tc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX1zDs6hZibeyo
 JC5lDpbQUtcz6DwD1d5bme3dTyBlL7Nxw3gQ63acbcSymUkT/J7f2CwYYIvMN8PmVE/PNCh1oSk
 KiqwAJI1z5EFCZwaxKaFbZAWgKSHzykQW2zpQM7CJejmcMwS4HzRzEjawLfHmhHSWYQPIQA0TY9
 GiIusywyya4TP5HhMasV1ZRxxqH/RgfEfWdvSfuNrUbhQyesfKjsj2hIpgVZQbhfj8GzH4d8Jww
 xJVmD8t6b8OjAgWa3Wv+VNtcVNt9MWVIsAXuKNTAD5//ebgdzp3JpqbmQ3xJiBIJ7Gw+Fy2jBRg
 +xW9hSBD4EJYv73MSCqpml1ud4F3s83aNvlHznyPLf+Jskwhf8gOd20xSQBaxzgHw15gM8OJIYQ
 JncCyTKSXcBwlnrfwKG1RRdel5TDPShrMjl/keqUNH3DByc0mf7++EL30KCh2vS7PHmFikHCfyh
 BPlrbLMTVO9r7X3DRQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX7joYJldZj06q
 65gqM1gAnc1ycCLyxXKRWXWyGvhaIBQBCp+0B5rSo67yPXtgZftsEQptbe223n5NwJW6opsbvni
 NIxyu/mlDkZN81CWVzLbqEO2+xbbDN4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200027

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> On MSM8996 Pro the CBF runs at twice the requested rate below 600 MHz,
> at the voltage of the requested rate, and the SoC hangs once the fabric
> is allowed to scale down. The Pro post-divider of 4 is only set in the
> PLL configuration after clk_alpha_pll_configure() has already
> programmed the hardware, so the PLL keeps dividing by 2 while the clock
> tree divides its rate by 4.
> 
> Set up the Pro post-divider before the PLL is configured.
> 
> Fixes: bc48641a68dc ("clk: qcom: cbf-msm8996: Add support for MSM8996 Pro")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
