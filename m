Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793621850;
	b=vFWL9J5L/CNuIRd7IephdiUPH/TQRGQsbiTILdczqw0reqVwdueRNavcqHhQUCVwGvPu
	 KocXAe8jGKqb1ygvhYIgL47HDeUQsl/p9k7YaM+4lFCzxL2BOcmTkfwhztvTicMzYYLnA
	 /UMmTCzsH9wRLVK0b7k4I4JH4JAVfBqM1U13UbnnMZrTRWRIBzqXU+ShxW/XkPv2DhyTd
	 RzE1KMGN/KScVAjgFcmVUuTOnfA1AZOyhU0gdsFI70xqM1en/b6wcuO+oxWJGQ2WriQtU
	 4vLql8u+W4+nmYaMoQpsYFLIfIwXhdHpZbeV601WUIS+1rtfYsHlYD3nfOypPB4bLCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621850;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rw5Zj4GRtqTMxJnvcp0kNCw6cvf23rSHywCYRdENev8=;
	b=pj48KC50GDmlUkBK8YPeO9BQWVhTWZSU3s0vIGexPLAmtEMS6zgPB09Znk5FCAgCABs1
	 oKv6VTLsrRpaVSvMHgXt2WzfLc8DI5MP7JDLZ/8P/bKjcjoFxTnEJnFDEJiG79gTzVOJm
	 L6+W9p0K3OCZ3iPbxF+YmwBH6Kf6osmyk1yHRY2bukEfPRZu5lromC90lcqwSiy1R0duj
	 KGKXuHHvzmgBcI7UUCbeyNnS1bWPRn7UErtfcnIRg9bQljLh8N7+Af8WwjhK49krwBQdd
	 jN5TjV5X3IqgfQttqfeumoZn7HSFu7x2wwklyJpCrReqq+baIPo9Jd+i1dsdxoeemgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="V9C/4rFP";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BRSp/C7v";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94411606A33A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 12:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94411606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V9C/4rFP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BRSp/C7v
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMqC1821130
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 12:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rw5Zj4GRtqTMxJnvcp0kNCw6cvf23rSHywCYRdENev8=; b=V9C/4rFP1oI34Llt
	NWlmqyFwf2vojmtGefSz4Wz3J1ElanaK78c7bDx4ZeFmJc03qsXxo0THURbVCbPq
	Tlidq0BjWO7I+o6AZRd/enrImVklWUrI5LjhhIcCH22raa1HFkfVeKw3d+ik6Ka1
	LvUFmXNp/HnFEr96KlYDP3diRQ5nq+G5cdTgdOFmQo0zBOkzjDESn+3VUVsvQo8t
	x8EnGqK4H2JvJq+RYkPgXOY6pCEIe2nA22U3mGxGa0kt06IXjfrnlMosGaFR36Zk
	SdnmAXjGEo+RbZ5yyBsQTUIT2G/Yns+/Q1yExTBqHEHGoSrqlgVqgre7Vgxk09Ay
	OYbekg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4hkwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 12:17:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91bebff9fcaso59491416d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 04:17:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793621848; cv=none;
        d=google.com; s=arc-20260327;
        b=NCGi9h/YvvfcTifbrvFhFYO/M2aolEUKIXEOa3+aQEeTKMU/I+ylMBUwzMxZYJ44Bp
         nCTZ5SnAH64FmcGE9lqxW7tfbDm+x7qWOHYZwdhCZrfxUGBsbuyx5S/I/Vzb1MMV4fay
         PtGeUC+YnyV5iSKbK4pSwmWEhnatqWT7NaD9P4I9GO9Z2CY+/d9ilRZAgA/TxUGOmjxC
         4m3vDkCylEdB2K7pRCSFWv0oENz/UF/GMGEY/7gAgZBpt/pBVuvr+o5Al0iV1aOHD33H
         FVnVUUoLAp7L8kgT+9ZV/dKAuiDsnCPdtnz7YwQE88k0F0zK6pZmYnxRtKXouceCr4Nb
         lStA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rw5Zj4GRtqTMxJnvcp0kNCw6cvf23rSHywCYRdENev8=;
        fh=nWmBXqUQIljcEDks4sUGqBeS8jv3bCCJKivk34318D0=;
        b=tCN3OjphXisHvPPjcnYmlWNCjBOGRqRWR9h/JOiq96SjGRDAjNNLvH+X3g4UvOk2Dy
         TQno2A3S5h/HmjvfdQlBiJeqxr9EHuw9IuQFiHps9FU4MERVlq7eE0Ei6KRnD/bbE9zY
         yqMYslJB62a3ecREikpcgVClRfXnxoQrX1QDMkxqh6rHrbvjzv9yFvQAFlSSg5MDyL5/
         th/xNlpUNPgWoS5nZ1VIMYF3PCSQz0jOUggx0WLYUC2D7fGJVjHA2eK46JACx5Okk3b7
         pA2Nko+bRGog4V+YT7vVMrS16+8l1EkEBoVeMx6YIycB93ak2FCGBqYTw4YeCYUlWA6T
         qTHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793621848; x=1794226648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rw5Zj4GRtqTMxJnvcp0kNCw6cvf23rSHywCYRdENev8=;
        b=BRSp/C7vSPL75eePbfkKy/MaI92gm38S7HyYMqLCiJbeNDxD91ZB08vEcIYYvrahzv
         r7yg3K6rp8mceXv8A+E1woJqZfQLqTo7GqVBf5B0DgNF3Qp9h7DsleIoZz4jJZ//sQy8
         FKNPNpN8KZEuuixnCtaqYaiePkwBL2EdAGzUKYqVS68HgMsdAnK8zzGPRS3xx1GorKOl
         DTJ2uF8lPEr71k03YHrWqdeKOQAOlWdUfA0DY7dPbxnZ4H3VPinCIy1WQif1AHC48Izn
         8N2Of8SH2fLty+WbbEyc1r4IOe0Wy6yrJAb/Dd8LCxOIwHiY3vlWXRF7YTdgamrR0QYf
         h2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621848; x=1794226648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rw5Zj4GRtqTMxJnvcp0kNCw6cvf23rSHywCYRdENev8=;
        b=BoxBtTLnTnqfCZUKx/btb5fBIUpGEuhbF8XL4TFtcbfPjkTxDLBVurlwTlCffgRE3+
         lnsbxE7j8o3EpmaPmYuk7JwTcs3cj+G+ki8KuLNDTm1YD3Ba+hZgvyIdJI+Hc6A6fTD/
         SWg51RLVigkMVu++4SZZ3D+L7hKG+h7bqamCzY48Rk8GGYWf+4qRKV5SmMtjlpSLSI0X
         1ch80YoJ4/RWoah7Qt91yZP3v34Tal+ESi0G2hBLl+eq3VjUJTGctW2kk6SbosHciPKZ
         NuiX4wShLOAthsKPUHghH9ePU2wvGRUJjCNjNjBBi2kSfPKDsCqkJmcUsinEHOGoh9eR
         hh2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxXXiXTZCsAL3kk6S7WjZB7kBiOv4JOeNdVa7jAW376d1gC2jbXgmQyIdG/fJv/TMIA8SB9mxC8uWY7eRWH@vger.kernel.org
X-Gm-Message-State: AFq9FYIv7DYaSMvPfbBxRpqKR/aQS8I6pB4hisMUq7SHY2HM/D/xX2uc
	1TvmCQ2RM3nfUcW/u8cs0K79pn10NALPmgiSvptNnBt2lNqhAv5Xl9S8wXxIVgABxXl2TWD1BVZ
	jHCR2P799Obdv/9ztWajIIdfpnuqFL5oPsoVXLTYBs8RX8trUJgAvB3VhnRfkWYHX5DJ1IF08P9
	HJJFgSBlYW7w2vuoFg0UH21A3TQN2CevhyOBSLo7YqHRc=
X-Gm-Gg: AYBFou2xJZb7U96JjycbOjPD9Rglw4mKXIrd/x8tdBZIMaFKM6yi5QnxXQtyyVRk5hh
	xbyHSIxXQaJfSTkFPHE9mAicr66Gv22dMJ4Drun9DUrs/hNi8tVfbWIoSnHLYeJgHsl/J5RwbMc
	8D32AyWQCkwvF22BD8TzF2T0grYURcr5kyskG37p4D3vmOKbMOaQGJiUF2qNQ900UDZCT+wTZ18
	Z4zT99SpzXNp5B8n5lHgmKZL8SUoJNn2QZhvNjtTpv1gZkbscWomDxdLIEvvg5kKS9Orp8sRSsC
	WqfjPvrtHf0Vw87Clnon6zKzjVNe
X-Received: by 2002:a05:620a:31a6:b0:93e:8614:bbe7 with SMTP id af79cd13be357-944214d6b44mr1617448085a.12.1793621847632;
        Mon, 02 Nov 2026 04:17:27 -0800 (PST)
X-Received: by 2002:a05:620a:31a6:b0:93e:8614:bbe7 with SMTP id
 af79cd13be357-944214d6b44mr1617441185a.12.1793621847086; Mon, 02 Nov 2026
 04:17:27 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com> <20261102-kaanapali-camss-v24-13-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-13-d6b8f3f6f66f@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:17:13 +0100
X-Gm-Features: AclHuK9AKGL6r9cA98UXUHVklVQ70B5kDGqL1vDaHdggsPaO572QzanLMtIBAT0
Message-ID: <CAFEp6-3=_QG0_f8g7bxKmh1JigfteFHE9mvp9LEX+y7LL6cGnw@mail.gmail.com>
Subject: Re: [PATCH v24 13/15] arm64: dts: qcom: kaanapali: Add CCI controller nodes
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: FML2UX1QPYm3YrTBFNeph-VulYm9qQ7n
X-Proofpoint-GUID: FML2UX1QPYm3YrTBFNeph-VulYm9qQ7n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfXwkAoi8+cPIhe
 5udSzcz5kuvaMuzKqo9OE9luKKN3vhOKdQYmUXnAmt9LuOrhDEJeXfK91dz7JL1kCvlZmoUVvOy
 JCP70gNB3nkIEdyHRlBEk3dk9DSrpMw=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae87f58 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=tIaaiuYHFHHTaTkjKuwA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX1sPiIjHqXzi8
 VaAkvBrPEo8CGHdILITu5pKAHhpMh4Rq2m8mTK6o6Q1O0hNCdWiBe6oRtU+vX1QjP/fGp+ylkhi
 iSwrbzOeQTFCa8VgRdktVqLogu/Se13vBYU8DsAI975K4S7El9Uh/Pcg2dmlGHJ5wu0r3jEgpfX
 yvHuZOYsnVt1kWMoyZaV1RjWuMx5Que3nstZrWdtg2j59ilOZ1ssTVAtm9VFSIKousfAS+WIZvd
 eU4cDhldDEkf/rYB63NmJbLN0xn8BqmEWnQalqHfg/q/k/a6ewjHnwQU7iv7tOFZ5AkjUNmJsad
 lGqcEZQ/j3ytoo68BqriRpdlsM5y21GYEXLkkcNPRUmEbccrJaSI2i5MxieF2YYQQ3RiqIPsJHw
 uhwW72m9tx3yqAGO45kn8GWScSZrXnD4+0MW4xNjXmFj7NLtPfvbd2oOJD6CALLhNkmHA2tjOa8
 oQA+r2hAiBjKqzKxBJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020048

On Mon, Nov 2, 2026 at 11:42=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> Add the three Camera Control Interface (CCI) controllers present on the
> Kaanapali SoC. Each controller provides two I2C hosts used for camera
> sensor control, so define the controller nodes and their pinctrl states.
>
> The first bus has two CCI bus master pinouts:
> cci_i2c_sda0 =3D gpio109
> cci_i2c_scl0 =3D gpio110
>
> cci_i2c_sda1 =3D gpio111
> cci_i2c_scl1 =3D gpio112
>
> The second bus has two CCI bus master pinouts:
> cci_i2c_sda3 =3D gpio113
> cci_i2c_scl3 =3D gpio114
>
> cci_i2c_sda4 =3D gpio107
> cci_i2c_scl4 =3D gpio160
>
> The third bus has two CCI bus master pinouts:
> cci_i2c_sda5 =3D gpio108
> cci_i2c_scl5 =3D gpio149
>
> cci_i2c_sda6 =3D gpio115
> cci_i2c_scl6 =3D gpio116
>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 303 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index e107bcdf0f8e..fbd65c2ad95e 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -3746,6 +3746,117 @@ camss_csiphy5_in_port: port@5 {
>                         };
>                 };
>
> +               cci0: cci@941b000 {
> +                       compatible =3D "qcom,kaanapali-cci", "qcom,msm899=
6-cci";
> +                       reg =3D <0x0 0x0941b000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_0_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci0_i2c0_default &cci0_i2c1_defa=
ult>;
> +                       pinctrl-1 =3D <&cci0_i2c0_sleep &cci0_i2c1_sleep>=
;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci0_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci0_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
> +               cci1: cci@941c000 {
> +                       compatible =3D "qcom,kaanapali-cci", "qcom,msm899=
6-cci";
> +                       reg =3D <0x0 0x0941c000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_1_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci1_i2c0_default &cci1_i2c1_defa=
ult>;
> +                       pinctrl-1 =3D <&cci1_i2c0_sleep &cci1_i2c1_sleep>=
;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci1_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci1_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
> +               cci2: cci@941d000 {
> +                       compatible =3D "qcom,kaanapali-cci", "qcom,msm899=
6-cci";
> +                       reg =3D <0x0 0x0941d000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_2_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci2_i2c0_default &cci2_i2c1_defa=
ult>;
> +                       pinctrl-1 =3D <&cci2_i2c0_sleep &cci2_i2c1_sleep>=
;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci2_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci2_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
>                 csiphy0: phy@9523000 {
>                         compatible =3D "qcom,kaanapali-csi2-phy";
>                         reg =3D <0x0 0x09523000 0x0 0x2000>;
> @@ -4534,6 +4645,198 @@ tlmm: pinctrl@f100000 {
>                         #interrupt-cells =3D <2>;
>                         wakeup-parent =3D <&pdc>;
>
> +                       cci0_i2c0_default: cci0-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio110";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio109";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci0_i2c0_sleep: cci0-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio110";
> +                                       function =3D "gpio";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio109";
> +                                       function =3D "gpio";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci0_i2c1_default: cci0-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio112";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio111";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci0_i2c1_sleep: cci0-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio112";
> +                                       function =3D "gpio";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio111";
> +                                       function =3D "gpio";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci1_i2c0_default: cci1-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio114";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio113";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci1_i2c0_sleep: cci1-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio114";
> +                                       function =3D "gpio";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio113";
> +                                       function =3D "gpio";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci1_i2c1_default: cci1-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio160";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio107";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci1_i2c1_sleep: cci1-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio160";
> +                                       function =3D "gpio";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio107";
> +                                       function =3D "gpio";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci2_i2c0_default: cci2-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio149";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio108";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci2_i2c0_sleep: cci2-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio149";
> +                                       function =3D "gpio";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio108";
> +                                       function =3D "gpio";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci2_i2c1_default: cci2-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio116";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio115";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci2_i2c1_sleep: cci2-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio116";
> +                                       function =3D "gpio";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio115";
> +                                       function =3D "gpio";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
>                         hub_i2c0_data_clk: hub-i2c0-data-clk-state {
>                                 /* SDA, SCL */
>                                 pins =3D "gpio66", "gpio67";
>
> --
> 2.34.1
>
