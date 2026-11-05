Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793867844;
	b=38CXMcRIlEQq4IYip6BtwBxZ/d0D+NtkmGZNJ0nioTOgdaTcTnFuJ5TlD9OaMbuQM0j4
	 DQNyDwi3ByLxVgieWmKyQu8dj6CDd8xayKy0//pg3esQwmMjxL3FBw8U7PuH3wdZWb+yL
	 GHHtjPlsLAT9NTm7KTk2zLGdT9CBDlrXI33LS331leVdZ/eRLfcuuULkWAPnAmGNDIXnx
	 YJ/RPzF3N9Di9MzKA99q7eJj3i/EuTFQ1ODQRd3kF9cUH46dGC7xEOwTfqd54HR96pBV3
	 qIlAXdsNbxHcj9ykPw0/+jBQPFBRW25EpDd7H8sZqMEHr4kJJ/9PG/b8qWdSFL31PHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=J20C0Q1ik5zVeSf4dk91N9VOzLrxCbR2J+L4l8jiJe0=;
	b=T99cLWRdcL0IGNCcZKVbSIn9xTj/J8zX8nVeckkmkouDMjNtbEWnHA0jWgdppJcLuZSV
	 gttIN5S8286J6xPM0syz5lW3W5Ebvua0lIJSeF28AfHBsHr65hkwkNdxp0w6HVgPaRZNE
	 zYMlVOqkbmVKAOpDTIXhPs5wRacKXURVx14s2uZs2/loprZQLSuAYgx3yZupD9Xl4Tm4i
	 yu8G24qHD8hN05YJE8ptnTEb/5bhiAiSQIIMif4Bd3+BIeQPXyWM9YyESTYftAE3UHgSh
	 g+UEHd0fjHyaFF651pfhmKwOg7Xi2xk8GfVbpXY1U0zqTk46dBIk84r+Z/StsmhUbQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cMDyDbB0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="c/U5PgmB";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B3E606A329
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77B3E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cMDyDbB0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c/U5PgmB
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U7RS3073677
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 08:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J20C0Q1ik5zVeSf4dk91N9VOzLrxCbR2J+L4l8jiJe0=; b=cMDyDbB0LgxiaTW8
	cM7R6wjoaEqsXSsiAQu8qE7hEnNM0+BtlesvfzAVxSCPM+oGVsNriN23eFgMnPYl
	voJ07Gty+6y4OOWnUYpQ2VrFSMmVOjDPT+6iTqxmz5D17WkAfyxDlF0KBtz5P1vd
	1cAPpbEpiXU2smRTebOQdtL1WmEGjCbaBplFxK/A8WSKSjy9M+liyzclLVlQNUIf
	r0Pwe0Pmmqx5irb4ayKt2TUojynAEPzMgPpr5jz16DAq34Wlere+HjE9jAJXt86P
	RRTf8e+QNaXcCFGUARXbrqs2535xcV5F9b8bX6w5bQRPa6njwtr5I5fAdE3Lle4d
	MEZ+zA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq8pft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:37:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-945b0154705so261181585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:37:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793867842; cv=none;
        d=google.com; s=arc-20260327;
        b=pbZebd5zINq7dfsFOJ3Da4z4mKj4G2VwT8PdCcUqVAEyVsAPbhHEoL87J9R1peMJzI
         4RlQShPVtG2B0rhGd6caGSYuRA9yQJS4lmhYQRNnlzCkjRx9n7SbI7zOMQmikzfIOLO1
         iF+pA+BBqbQH4w0dr42dYaCPd3EOJON4mMvQ7OX0IOz/zhCNprIYe2bNGCraUzSxc27N
         +1LJSaRce9s37Tf9pOBhq2svoqGiuh81nlchCMevl5GH4xjD+78+DQi2sMwD2fQxrZl3
         Xb+OoJbpd1EdyzWlFhRrdAhBoAPAFwTkHDvsWNeSW4MI0dlFkLgYLMl7ZlDcyo0TKfer
         s6Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J20C0Q1ik5zVeSf4dk91N9VOzLrxCbR2J+L4l8jiJe0=;
        fh=3SJTVIlC/9hopEKL5iJ/+397NGCpdlmj25tM6SdNIAY=;
        b=bk5eX/EXZAc+SSkJNKFU95k/RaiwL2ggYPWEJHEOalwVwIIXVI2Yq8rzmBB96wWf4j
         43FinIN/wDaD1zyFHRNab8O6wuSx9Da8Gkj8/hJ6pzGLjWFKeTbgCxQWF9aZ3R/DVe/D
         q5n0S5oig3S5umFw0SbWqCP3fGx3BTFjBFvVXy0gqLFL9r12Gd4VnLeyZ58DJZM6C4tP
         snAx6+8fzSvm7o+PIDaMSZN98Q8w83N/lxsZvK6OpJFpbBM4WRGDnuGicJM36uXGxfSJ
         5KTmHNyUOPgLm1wnf9+B+SnlLzJWct0OOt0mEy/ZnLVPYmI5Swjr/l6TxNwjHqIaOJ7i
         pIzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793867842; x=1794472642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J20C0Q1ik5zVeSf4dk91N9VOzLrxCbR2J+L4l8jiJe0=;
        b=c/U5PgmBuK1v+xeiJm9605kgGCQHj7G7pqrwFRHuX5cyPzUMqArUWMPyZSwwgbuYZk
         dcaYC1VgundSk33L5ycO3u3+KtTib9fASFRmYSitJR7scgMq9oO5+gI+2/cdu8xO22nL
         SsyMgUmQBQwdciq18MbMTbg3VsWyWWGmDkPeYdJ+vDPEuDove6VwiGQqlx7A+hQHQ/jA
         wBWrTpE1nSwd56TyQCRnSXgw5tpcLXXGEjXwJ+pzzfmyayIGiDqsSOWTNTXfJ/5vig30
         d4ZXJybSpn7sLOAsejjZu7OmMyQmo0oHef+kCh/0K0yOkDC1CbDJZhyudJqFC6OYcs4A
         bOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867842; x=1794472642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J20C0Q1ik5zVeSf4dk91N9VOzLrxCbR2J+L4l8jiJe0=;
        b=VJZvwqSDdAgyzjtXuFGHQgC6TaaLNe7Ib8h9Z5PnLaeY4u2guVuheVmvJlq/PquLUr
         sjpb9mBRD1ZXPNYVZXl24+crF2gI+Yi2CTgQHJeOHqHBfHHVt6dY004qi48z1z9ZkqNo
         4xGR6BiIzHFDSvx0XKaD3DZ5u6/vCTxO5GdQrLHavRtYT2ETAiYAR/sTiE3GZodNy9qF
         VoZr/BzDHDZyyhbdOmRGTeXkXa/lBdaouJnxqUTltFGbRZJ0grmzxkback5seqh2RVYR
         8EULHqz1Xt5N+dPwoWVPUH0ypaVNAWa6Ebe8IjBvAqRR1862BjLhs0yp4RhPNTyS/byp
         2aTA==
X-Forwarded-Encrypted: i=1; AKwUvBzFbjJS2hUEbemoGzF/U1nHPI6jJsEkaQ89opNiaMrSIhkiyXMThaCa17P68SwocYl3ryQ5isLeiyqos/eA@vger.kernel.org
X-Gm-Message-State: APuU4Z+aOXvAzw9ulqsJj9KLKiHpir/esnAqnWsqnUHybg2JVRQhFMOI
	tuSnQ+MTBtvZjNTszggj9LcAmQlB2oZkVe0giiyKOs4HGTbnIs59RzRpkyztAs68nefVOEmIoFK
	Y0ow4TXyLgsWsI+XN+X3rdBoCM+hX6QUpXCd0uvRwkC0fpKd1Euv98Qd1m9J0yQ0sUpvYrPtYtx
	RbQfQxDh/SXZfSTocNLGhgsF/SZivI7v1I1PNo6yf+6K4=
X-Gm-Gg: AYBFou1Fezsqva4bsJ0tZxEImihDaCqj8JVT7pUf2wK6TEL1k3/tAUZK2/UwTwgcbs9
	2hYJhlvqYupU5MpEpFj75uQJ4H/Tm1bOikMQRIpS6cnWld6epozL1Y8pQts+UnpWE6rOBbsT06r
	qooyD0LJ5DaQbpLflYBC2NizPJShQX6jSzJmAjRwpxVjsLNRw46sIuGNrwymeUMKwaZ99xGOWJ4
	7fOxlER/ORswZhMVA+RRn7WBw0fZP+CywabIMZFTMHeth9gF411nZQs0aNvNbw3vqJRXKB2fZs=
X-Received: by 2002:a05:620a:4109:b0:940:f2d9:5f51 with SMTP id af79cd13be357-9442156a727mr3192324485a.12.1793867841545;
        Thu, 05 Nov 2026 00:37:21 -0800 (PST)
X-Received: by 2002:a05:620a:4109:b0:940:f2d9:5f51 with SMTP id
 af79cd13be357-9442156a727mr3192322085a.12.1793867841058; Thu, 05 Nov 2026
 00:37:21 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104230529.3040285-1-vz@kernel.org> <20261104230529.3040285-3-vz@kernel.org>
In-Reply-To: <20261104230529.3040285-3-vz@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:37:07 +0100
X-Gm-Features: AclHuK-nN5eoEkZP-jg7XLdtYcXHlRVNa3PnAeXUUZCqyZmoNrEFWNQhhqo9cK8
Message-ID: <CAFEp6-3x9P7Q3+RESpMo7mKNYqn6ed0XswSJhhr1nFyHg-w22g@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8350: Add CCI device tree nodes
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNCBTYWx0ZWRfX8T/fv2f2zUvZ
 ElgPo4Q4xx73J2kyaqI7uEkK+5LvJmvAQPtmslbfiTXb9NTvEBfrl1997QIButJXdEKxkwvvWKh
 r5eOnrQ7QrOp3infP0ovDZ69cKG7OOf3VdiqkHvfS+JGp1nPwApIv3NCgzfRaenu02K2uWAxznf
 Q1w5DBCPBRNosYtw7DdaTQXINiHi1rpYFm6PkEHLelh0dqt0ENEmENanOOqyE9MLF+Zz3oFQ1ny
 S8GaK43uQfT+OaExn2v6jimJP1ngMPESgRX6iwXrekPK6ciWhDyG0iLIvwzqe2N+QinxGQZNGkV
 x4Qu+VgcoLEZqLoJ0e7ta6ikGCJcmffy5p6DEV045fX+ywa/t3ob39PcpfR6bPIs2qxdi0QqfHb
 qykTPBtOO3xdXFWQPZjx5nW7SRfNlQrbTovrIc1rPcUlWciWHMmNYIYOYcoCbio+iacicHxBsGv
 k8bOKzE07O/USeBEaXQ==
X-Proofpoint-ORIG-GUID: B6q-dH_ZQ89E3wHW12O7tVFr0souPgyh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNCBTYWx0ZWRfX3YeRXyWd4L1E
 b/D3r1jYC1kseQhH70UwkUYNRE/TS8kurQvlh/WFL8MoYN/BHLa8T46KpmDgLF0d28b8sWmZk9m
 IIBi8YrSD235dOI+Ial1u7vfg0u5/iY=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec4042 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=PI_Vn2BwocxK6LkTr5cA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: B6q-dH_ZQ89E3wHW12O7tVFr0souPgyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050034

On Thu, Nov 5, 2026 at 12:05=E2=80=AFAM Vladimir Zapolskiy <vz@kernel.org> =
wrote:
>
> Add Camera Control Interface (CCI) controller device tree nodes and pin
> configurations of the I2C busses to SM8350 SoC dtsi.
>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 147 +++++++++++++++++++++++++++
>  1 file changed, 147 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/q=
com/sm8350.dtsi
> index a51942c99f8a..41dff3736061 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/clock/qcom,gcc-sm8350.h>
>  #include <dt-bindings/clock/qcom,gpucc-sm8350.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm8350-camcc.h>
>  #include <dt-bindings/clock/qcom,sm8350-videocc.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/firmware/qcom,scm.h>
> @@ -2830,6 +2831,88 @@ videocc: clock-controller@abf0000 {
>                         #power-domain-cells =3D <1>;
>                 };
>
> +               cci0: cci@ac4f000 {
> +                       compatible =3D "qcom,sm8350-cci", "qcom,msm8996-c=
ci";
> +                       reg =3D <0 0x0ac4f000 0 0x1000>;
> +                       interrupts =3D <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>=
;
> +                       power-domains =3D <&camcc TITAN_TOP_GDSC>;
> +
> +                       clocks =3D <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                                <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +                                <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_0_CLK>,
> +                                <&camcc CAM_CC_CCI_0_CLK_SRC>;
> +                       clock-names =3D "camnoc_axi",
> +                                     "slow_ahb_src",
> +                                     "cpas_ahb",
> +                                     "cci",
> +                                     "cci_src";
> +
> +                       pinctrl-0 =3D <&cci0_0_default &cci0_1_default>;
> +                       pinctrl-1 =3D <&cci0_0_sleep &cci0_1_sleep>;
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
> +               cci1: cci@ac50000 {
> +                       compatible =3D "qcom,sm8350-cci", "qcom,msm8996-c=
ci";
> +                       reg =3D <0 0x0ac50000 0 0x1000>;
> +                       interrupts =3D <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>=
;
> +                       power-domains =3D <&camcc TITAN_TOP_GDSC>;
> +
> +                       clocks =3D <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                                <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +                                <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_1_CLK>,
> +                                <&camcc CAM_CC_CCI_1_CLK_SRC>;
> +                       clock-names =3D "camnoc_axi",
> +                                     "slow_ahb_src",
> +                                     "cpas_ahb",
> +                                     "cci",
> +                                     "cci_src";
> +
> +                       pinctrl-0 =3D <&cci1_0_default &cci1_1_default>;
> +                       pinctrl-1 =3D <&cci1_0_sleep &cci1_1_sleep>;
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
>                 camcc: clock-controller@ad00000 {
>                         compatible =3D "qcom,sm8350-camcc";
>                         reg =3D <0 0x0ad00000 0 0x10000>;
> @@ -3348,6 +3431,70 @@ tlmm: pinctrl@f100000 {
>                         gpio-ranges =3D <&tlmm 0 0 204>;
>                         wakeup-parent =3D <&pdc>;
>
> +                       cci0_0_default: cci0-0-default-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio107", "gpio108";
> +                               function =3D "cci_i2c";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;

I had similar comments on a different platform, but why pull-up here
(for SCL/SDA)? Do we expect boards to lack the external pull-ups
required by I2C? If not, enabling the internal pull-ups seems
unnecessary. Also, what is their effective resistance on these
platforms? Aren't they typically too weak to meet the rise-time
requirements of most I2C modes anyway?

> +                       };
> +
> +                       cci0_0_sleep: cci0-0-sleep-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio107", "gpio108";
> +                               function =3D "cci_i2c";
> +                               drive-strength =3D <2>;
> +                               bias-pull-down;
> +                       };
> +
> +                       cci0_1_default: cci0-1-default-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio109", "gpio110";
> +                               function =3D "cci_i2c";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       cci0_1_sleep: cci0-1-sleep-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio109", "gpio110";
> +                               function =3D "cci_i2c";
> +                               drive-strength =3D <2>;
> +                               bias-pull-down;
> +                       };
> +
> +                       cci1_0_default: cci1-0-default-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio111", "gpio112";
> +                               function =3D "cci_i2c";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       cci1_0_sleep: cci1-0-sleep-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio111", "gpio112";
> +                               function =3D "cci_i2c";
> +                               drive-strength =3D <2>;
> +                               bias-pull-down;
> +                       };
> +
> +                       cci1_1_default: cci1-1-default-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio113", "gpio114";
> +                               function =3D "cci_i2c";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       cci1_1_sleep: cci1-1-sleep-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio113", "gpio114";
> +                               function =3D "cci_i2c";
> +                               drive-strength =3D <2>;
> +                               bias-pull-down;
> +                       };
> +
>                         sdc2_default_state: sdc2-default-state {
>                                 clk-pins {
>                                         pins =3D "sdc2_clk";
> --
> 2.51.0
>
