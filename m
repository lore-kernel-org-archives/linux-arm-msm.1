Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794214031;
	b=hCasPEI8XlchrtMEDsLBUJ5L8/XCD0DolI5Ph6TIW2oyuNZDL9tpjEqafgoNiTmJttCk
	 +0z3KiAL07d/6MfCdLtWhzvz/t0JlbapbevnYfaX6rinK8bEYCnzobzyNys3vfbGpRM1o
	 fPVIQ3Gvh8f4d6BWhrBbMFM4A2wAJqcY5u9PR0vWbu3tYnx0hcqg6o+5HaLeAox/HmTQQ
	 PYYQiI0kMlOH4ysCYSrN9E5QPLzGss+7MN0q1rklIaRCan5JZ5s7xCmTH0sRX1oxZKVOF
	 LI8zRKlqaHC2AJRMHkPZ+O15j88dwv7QLN6wiCZ2KqQHDh6Dpl3TKsXvUt5pHJVcTYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=su1u842g4FEjFQofZRxAIR939LIBDxrqAn+twPelgng=;
	b=hf/C97ZHoX9R8Kiq6I974jLDYIRMMBOpV25DsmHyYRIjygK32Jv6uvPdqe1k56e/mQk9
	 g+BN5miejaoUZ5mMenJyc8caKV3a1np/4jxBzKO0ElkFtK2C6j5dmxHFUooZ7Ivyj2NZR
	 /NCwjVhUmL3Y2vaCKWue9kp6KDQVjur5yAqAvH+C4+IeBQYY5tLoVNaErFoZXfODK6CNi
	 9Jhs89UcYzY4kuu0TjmmqUr+Rv7VzGjBcW9nS6YW5UFAPaGzLtBFw+Q99gc/5DYFIRaTm
	 +6x6wosnYV6xzoEhN6FOF2gwGaHnlS0gyysS7lIqYqofQlIA8vA68oIfY7hftTSLy9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WHb2JPx0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwWDkKwy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44066606D802
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 08:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44066606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WHb2JPx0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwWDkKwy
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A7R73611264
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 08:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	su1u842g4FEjFQofZRxAIR939LIBDxrqAn+twPelgng=; b=WHb2JPx00Cy/57oF
	CrqkVCuSFPS5X6IRALFc5yWGdrl7uXknMMBfwJx+Gzq0FeJHGmt5s/pEuyHpj62P
	NYogZ0p6VPsTkkOTHaHwomX43ar87nSvghaz424nMoLjLvDsA+TOQ5W+/SOWysIg
	OHGClLyTB13GYCwVKgojewl1v/b+pASLJc1rhNBe5APNahB/8aLn+7kSKwM6k5Av
	1dPPdSN09sU5kt1OLrSBW7imJeqWSMafbiWElueOZBuTBnN8yNQjH8C5T+ZZNVsy
	9WvCjhnUrjUiL32dQDPwr3c630I0eJlg99kTLZXBkzKCNruHIqxw+B41fCXn7vzt
	BZdD1Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnwwqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 08:47:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91ea5866643so13140846d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 00:47:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794214029; cv=none;
        d=google.com; s=arc-20260327;
        b=TuLM8mUSziyALfVRnhw5vlOPLN8lUPOOjlQhDRaeOzs9OZi36jb6HVj5zS+GQRnpWj
         SpWe37EWtDWdUgK/bpa2UAh6cWxHpdhsyy+lkp+1sNIlaHnRVTA2QvkSClIO9+h1vQKH
         SfuLTzFtrQzGYS5EQYd3z36DZx4105/mwJchTNwi7N6F/FKTZjombQvVcdkwx2B4BPqo
         6/uHqu/lYfP4sN1C69tPIRAcUL8CfDCNYHGWgJJTGk6dpMRgnuvCfCHuOAhGz9VWD6IK
         2i9SDjjvXoVJXBdFap6/25CjHF2nEp0TWqvD+D5MHaFyirXfhH8TX7egvRH3uMcbMcQV
         kI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=su1u842g4FEjFQofZRxAIR939LIBDxrqAn+twPelgng=;
        fh=knYTzLdeN0Ti5Hf2fjV9eCjTiWcqyniyyBXvVAJdwjM=;
        b=JLpmtB2u2BWlNF5SiaxiQnP5p/JudqweTd/TWIdZctTdXar0ZuGu27cddpeTodvcn/
         rl1dSf8hvj4DB+cr/30GkxiWPW8UwR+uTmBeeBv9pKuRC8V2V6FdU3wtHociRZRRm2D/
         N97+/7VrXQlfF+Wx0PVKRf+3gPpPg3PKsm5AqzbbZjozeitsOhH/hvpqaFLaDHOmaUSS
         TmZSP2iKVBAbiDL1BpfNKPaLD0dPH1+NdhDWt1kHp/2udC0cHGZERg0NcAOIow8YaciJ
         RgGZUB82PeWTUxqPtVB3HAoXg5UprMCSjvnb3zBFtOvst2+vYcMbGZmMfTDcKGScSHlv
         xzPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214029; x=1794818829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=su1u842g4FEjFQofZRxAIR939LIBDxrqAn+twPelgng=;
        b=iwWDkKwyAtT4HS74ExdfTWe0rXOC6Bz5MFmKOMILWuhgJWsdunAz6TnePeeo6+Qp4Z
         lYA8V/pdcr3zm6XZ5BtztsQ/0dXON+1R+Q2oBl5eALxBRJfuW2YHvTq1EIvyoAGzkGx4
         xV4U7oloSEMJZv2KHfq37TQDvUY0w98xSPcl01EpijSKUtWyeMfKHXu5iYU0QiN2rrny
         xrnPaCF9HSnHQF2muuUoOtPAp0P9/ySKqkgLQqMX13DQugQY9gzUBKX9dDU87hff15Yl
         CU4ZlHOQXo9aRpawxU+3qWj3Cp/jW/mrVWAseaF3RoXpJDiGtwf1qYnA6m6XEayG/2gw
         Uz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214029; x=1794818829;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=su1u842g4FEjFQofZRxAIR939LIBDxrqAn+twPelgng=;
        b=ja2reWH7cQr0jHkqb7TTbPRNs2XC0V1Ykd2Wz2BTUO5sPRA+8ZuIeNtzsSzd8EOisA
         Rrq7LaqQDWDrBbv9woF+QEmK2avfXiIigKcHCNML1i2p931OC9rYDc7SBOkT0zw27qSp
         aBoLfP0g0HxPt/+5ZHfSYfu5Ibg8uln7ru6VhKdava7xMZ3+bOuRVfjaigKc2Zzmf9h6
         db9itQi+nP5pBkL8yGxZZb2urZCSNvN5JtYb+00+vrioF+PtjZk6cihv1O7aqSKKkKH3
         Dmr39o0GsYE75ypyDEsDdmRcuFe9/nlqmhR0TKJJibQ/uPjpwiEn96MTcnab7ddMeIbL
         7Syg==
X-Forwarded-Encrypted: i=1; AL+hErHsDh3YyUvQdPCew0XC+xNtDNFWUEZhqM1jDjoMm7Ih+vB45BZmzhA72JCU0o2Pb9c/711FtjzHuC6J3TGQ@vger.kernel.org
X-Gm-Message-State: APuU4Z+xT4VxGTeONJSvF3gFmaeFVpN1GLtxtzlQOSrflH9q2/B/IJG/
	m/c8pEHvQ/hSRvW0QVi6Al90BlXMDb01Ac/1O3v02HLxewsjV9qFcoL4M/x/Ckh50mCi3fJ4LDr
	j6T8vN5A7ycogpnxxMt1FezqoYcQXYdmc2AHRHT/1/GZSXX98EEwnrTU7YrtbcLd2RSwsc9R2tT
	q9a4ZIb7AmYlb4fHG8iWBAq8UCnm1vIUK/XXcb1mSSxzA=
X-Gm-Gg: AYBFou2ET7vBSaCVJeNawYf2VmMIWFQmMhesq/j8d0RLW28cQ2KLkVOrR5oTFMbQsT5
	sreOAmU6IoybMeKaixnEEzkNyP6QrXRBw2VCKWiPgJ+9IPDgRZ4Bg6eD2RQu7YVlZZ9oYGXobs8
	gi0u4+vO6eXzNHf02zKXP3yYYMuMY+lU0kX/htG0zkgLJoMfGFYsH+XKvNMINClIxB0PBqx0o5T
	cbpX6cLTA2+jzQKDYZenIyyHHyKc3/LQ/INMe+7Wvd/WJADJFS+g54HQQoXpZ4VBsbR0ufVV7M=
X-Received: by 2002:a05:620a:2a06:b0:93f:3120:6c82 with SMTP id af79cd13be357-947842b77b9mr459160485a.78.1794214029347;
        Mon, 09 Nov 2026 00:47:09 -0800 (PST)
X-Received: by 2002:a05:620a:2a06:b0:93f:3120:6c82 with SMTP id
 af79cd13be357-947842b77b9mr459157485a.78.1794214028925; Mon, 09 Nov 2026
 00:47:08 -0800 (PST)
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
 <CAFEp6-3x9P7Q3+RESpMo7mKNYqn6ed0XswSJhhr1nFyHg-w22g@mail.gmail.com> <a3be2e35-13ee-4e8a-b231-5aa0326f6933@kernel.org>
In-Reply-To: <a3be2e35-13ee-4e8a-b231-5aa0326f6933@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:46:53 +0100
X-Gm-Features: AclHuK9zw2alH4oLwzChdmZ5Pav3qFoszwduIqZlWs6L6xUG87_aNWF28AoD7cY
Message-ID: <CAFEp6-00odwOgmhx9hjLUeCWJo1XSFDB_rKMMinF2frRTcaq+w@mail.gmail.com>
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
X-Proofpoint-GUID: dfUg4lpBf-5Bif1_bHZiLEnSa1LZMeaq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX1EY14rDxuvzr
 mNEQC8601LpOaMVkanaxXhOW4SbLA7C9xd8dZg1oDKLIbxUmsmMmnAGHuqhwsYGkskN/1Sx2/e2
 OpYlmAhN7M6TLp1m7hzJqN5GeqCasN2ryfxYeV3sayurN06WDJv/egTRubELlGJZUvHUV2tzr87
 m5XHiv0J5vV6xeoXdMTPVRRS3kpM8KpCCZz9OGptnzmwwLHMRC7/Y/DQeR0LOzCYZz4hOTR+fZd
 ONWrKUzvQCUMtgs48xY+Fo5hzviASAw+YhRLYaauUDf1K2+xWbNheVkOX+Ixh3M/MW42vSv6QmZ
 xoQF/SySNnohtjlenoEuhtuSGNDdOLWUECIqKBE1i9TMkK3cxM+v0Kmm38L28bMDk4unahTO/hv
 vLgrDKrMmzseTILcVkxIjNSjFasYwqoHYZUREs2/LcnvT5xCWg582Y1F/BAtNtiShm18N44GyAC
 fRRkYXDO3hpwlEFYmWg==
X-Proofpoint-ORIG-GUID: dfUg4lpBf-5Bif1_bHZiLEnSa1LZMeaq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX9xxGY3OMsnyK
 tGY6lj1YQovlX8HlbgPyced07VbuRb12w61xIC21jPbOtYUf5A+1Y1aWw7MUavl9z3rmchlocsW
 cDFsty1RvKgRhdPDwqD6EXF9zI4ir1Y=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af1888e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=5RSu-QFQllxlmxuUrqoA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

Hi Vlad,

On Sat, Nov 7, 2026 at 7:12=E2=80=AFPM Vladimir Zapolskiy <vz@kernel.org> w=
rote:
>
> Hi Loic.
>
> On 11/5/26 10:37, Loic Poulain wrote:
> > On Thu, Nov 5, 2026 at 12:05=E2=80=AFAM Vladimir Zapolskiy <vz@kernel.o=
rg> wrote:
> >>
> >> Add Camera Control Interface (CCI) controller device tree nodes and pi=
n
> >> configurations of the I2C busses to SM8350 SoC dtsi.
> >>
> >> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> >> ---
> >>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 147 +++++++++++++++++++++++++=
++
> >>   1 file changed, 147 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dt=
s/qcom/sm8350.dtsi
> >> index a51942c99f8a..41dff3736061 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> >> @@ -10,6 +10,7 @@
> >>   #include <dt-bindings/clock/qcom,gcc-sm8350.h>
> >>   #include <dt-bindings/clock/qcom,gpucc-sm8350.h>
> >>   #include <dt-bindings/clock/qcom,rpmh.h>
> >> +#include <dt-bindings/clock/qcom,sm8350-camcc.h>
> >>   #include <dt-bindings/clock/qcom,sm8350-videocc.h>
> >>   #include <dt-bindings/dma/qcom-gpi.h>
> >>   #include <dt-bindings/firmware/qcom,scm.h>
> >> @@ -2830,6 +2831,88 @@ videocc: clock-controller@abf0000 {
> >>                          #power-domain-cells =3D <1>;
> >>                  };
> >>
> >> +               cci0: cci@ac4f000 {
> >> +                       compatible =3D "qcom,sm8350-cci", "qcom,msm899=
6-cci";
> >> +                       reg =3D <0 0x0ac4f000 0 0x1000>;
> >> +                       interrupts =3D <GIC_SPI 460 IRQ_TYPE_EDGE_RISI=
NG>;
> >> +                       power-domains =3D <&camcc TITAN_TOP_GDSC>;
> >> +
> >> +                       clocks =3D <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> >> +                                <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> >> +                                <&camcc CAM_CC_CPAS_AHB_CLK>,
> >> +                                <&camcc CAM_CC_CCI_0_CLK>,
> >> +                                <&camcc CAM_CC_CCI_0_CLK_SRC>;
> >> +                       clock-names =3D "camnoc_axi",
> >> +                                     "slow_ahb_src",
> >> +                                     "cpas_ahb",
> >> +                                     "cci",
> >> +                                     "cci_src";
> >> +
> >> +                       pinctrl-0 =3D <&cci0_0_default &cci0_1_default=
>;
> >> +                       pinctrl-1 =3D <&cci0_0_sleep &cci0_1_sleep>;
> >> +                       pinctrl-names =3D "default", "sleep";
> >> +
> >> +                       #address-cells =3D <1>;
> >> +                       #size-cells =3D <0>;
> >> +
> >> +                       status =3D "disabled";
> >> +
> >> +                       cci0_i2c0: i2c-bus@0 {
> >> +                               reg =3D <0>;
> >> +                               clock-frequency =3D <1000000>;
> >> +                               #address-cells =3D <1>;
> >> +                               #size-cells =3D <0>;
> >> +                       };
> >> +
> >> +                       cci0_i2c1: i2c-bus@1 {
> >> +                               reg =3D <1>;
> >> +                               clock-frequency =3D <1000000>;
> >> +                               #address-cells =3D <1>;
> >> +                               #size-cells =3D <0>;
> >> +                       };
> >> +               };
> >> +
> >> +               cci1: cci@ac50000 {
> >> +                       compatible =3D "qcom,sm8350-cci", "qcom,msm899=
6-cci";
> >> +                       reg =3D <0 0x0ac50000 0 0x1000>;
> >> +                       interrupts =3D <GIC_SPI 271 IRQ_TYPE_EDGE_RISI=
NG>;
> >> +                       power-domains =3D <&camcc TITAN_TOP_GDSC>;
> >> +
> >> +                       clocks =3D <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> >> +                                <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> >> +                                <&camcc CAM_CC_CPAS_AHB_CLK>,
> >> +                                <&camcc CAM_CC_CCI_1_CLK>,
> >> +                                <&camcc CAM_CC_CCI_1_CLK_SRC>;
> >> +                       clock-names =3D "camnoc_axi",
> >> +                                     "slow_ahb_src",
> >> +                                     "cpas_ahb",
> >> +                                     "cci",
> >> +                                     "cci_src";
> >> +
> >> +                       pinctrl-0 =3D <&cci1_0_default &cci1_1_default=
>;
> >> +                       pinctrl-1 =3D <&cci1_0_sleep &cci1_1_sleep>;
> >> +                       pinctrl-names =3D "default", "sleep";
> >> +
> >> +                       #address-cells =3D <1>;
> >> +                       #size-cells =3D <0>;
> >> +
> >> +                       status =3D "disabled";
> >> +
> >> +                       cci1_i2c0: i2c-bus@0 {
> >> +                               reg =3D <0>;
> >> +                               clock-frequency =3D <1000000>;
> >> +                               #address-cells =3D <1>;
> >> +                               #size-cells =3D <0>;
> >> +                       };
> >> +
> >> +                       cci1_i2c1: i2c-bus@1 {
> >> +                               reg =3D <1>;
> >> +                               clock-frequency =3D <1000000>;
> >> +                               #address-cells =3D <1>;
> >> +                               #size-cells =3D <0>;
> >> +                       };
> >> +               };
> >> +
> >>                  camcc: clock-controller@ad00000 {
> >>                          compatible =3D "qcom,sm8350-camcc";
> >>                          reg =3D <0 0x0ad00000 0 0x10000>;
> >> @@ -3348,6 +3431,70 @@ tlmm: pinctrl@f100000 {
> >>                          gpio-ranges =3D <&tlmm 0 0 204>;
> >>                          wakeup-parent =3D <&pdc>;
> >>
> >> +                       cci0_0_default: cci0-0-default-state {
> >> +                               /* SDA, SCL */
> >> +                               pins =3D "gpio107", "gpio108";
> >> +                               function =3D "cci_i2c";
> >> +                               drive-strength =3D <2>;
> >> +                               bias-pull-up;
> >
> > I had similar comments on a different platform, but why pull-up here
> > (for SCL/SDA)?
>
> Here the setting was literally copied from the downstream pad configurati=
on
> of CCI SDA/SCL lines, likely the same has been done for other platforms t=
oo.
>
> > Do we expect boards to lack the external pull-ups
> > required by I2C?
>
> The I2C spec requires pull-ups, but I believe it does not require externa=
l
> pull-ups explicitly, so there should be no contradiction with the spec.
>
> > If not, enabling the internal pull-ups seems
> > unnecessary. Also, what is their effective resistance on these
> > platforms? Aren't they typically too weak to meet the rise-time
> > requirements of most I2C modes anyway?
>
> Likely you are right that the internal pull-ups alone are too weak to get
> the I2C bus functional on higher bus speeds.
>
> What's your preference on this subject, do you wish to see 'bias-disabled=
'
> instead? I won't have objections against it.

Yes, I would prefer bias-disable. I think the pull-up configuration is
an unfortunate setting that we've been carrying forward for quite some
time. It would be better to use bias-disable in the default pinctrl
configuration so that the baseline setup supports proper board designs
with external pull-ups, while avoiding unnecessary internal pull-up
'interference'.

Regards,
Loic
