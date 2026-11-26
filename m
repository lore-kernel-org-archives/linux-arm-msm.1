Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795690384;
	b=w0ZAK8jCjwnmYDKf0VLNLrfQYll7ntCdQjEqo6pbV/7PE2YonJMUUnnfYQQ3Q7gnYRmv
	 DkuX72876qmDJBzpsccCVPPzm7qNOukXPWIVCtA4ALvHZeMqcP7cO/TPGxAfSx2vne6Gb
	 c2R1Pfjl1ov+QgdJb/vMoSmgWU0urUwoSLjuBqnyY1rjuWfW5EjrH87BIqJOHoSpZHyoa
	 qq6KmDQGshfD32ptd3d7wCSzYaaK3tzdv8fEQCCdVKuuuaASyG1iprw7MCKZyFW4SIr5b
	 V5f+qAQVM81wBq0NtSN0d27bRUEuWoxzdU8lwh/jjxcPzqRuP56W4K3xaKp9O1Vz/ZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690384;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ni6puywMMHNYeFI1EJ7o+kG8F5OQFdRdjsh/I+X4uqE=;
	b=1U+HjOND5/KpY/EBhmEYpcmQZp2iYdDcd5cIiapEgtOAyplwy+N0mCijsZmXtQxghe7S
	 twhSligO6fUJ0uLAHTBIwJTLYYT5LqVdn3h1RwXu9s1q2KJVEA4CFVl9PdZbJ9Rezkq/i
	 Lp4hK78C34ld6qW1mfAvM9wvp0Lwe2LzVAbyyW9Ol/AjyAcKoV1z9PoEjzNb3r9hei1cD
	 6KaoJ6Ol/+9v9JIO5nSiNYTrdBkCTDWGFslb/+GYxf+WHVFrsWnuJcc7lJsPBn4qcKckU
	 80qDb0qSeEpiNn786jbLf8R3OOgp7b0KuVbi1kKgUYKGi7KxC9IC+ub5YM4BVWlM6lA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ENWuQwNF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=exVlGjqy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5FF606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A5FF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ENWuQwNF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=exVlGjqy
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXSBJ4001449
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ni6puywMMHNYeFI1EJ7o+kG8F5OQFdRdjsh/I+X4uqE=; b=ENWuQwNF1PEb57jI
	VZKSA3QE2yjQY7SEbjn//krCUApWSGEsKWnN2OBqjPoTBcZFX3oVVhdeA02I5h5/
	cdfLurFQiPpgSy8c9/WZKqp0Gf/fGPURfmzPccY2GN6IqxKNlcGUXlFUPSg3gPlI
	uF5SoZdOzKcgXWuIMDQJxVjvRtzJR9vNISwI5GQw8m/yZOl+P5TrX86AKZpvelRH
	W8/y6hKsbE0XNIdkWJSgU8RYyB6Uhr0Ze+IxVTQXWUSJNvfcu/ifCF6fdgw8Sm+N
	CiRznVhxs0eFNC0pItmKmD+ka3DhIQpkKpxym5d0ACMxDGT2SntI35eebUs1J2eM
	OJ9D8g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vaukh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:53:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495dd0f07eso1186277085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 02:53:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795690382; cv=none;
        d=google.com; s=arc-20260327;
        b=fyNd6grXKU1jjCVQ+QIS7Yxk26NmEHQQncr6qyMpuuJvmGqr51YiAYeyp/rResQSOO
         qtJru/njmI7tnx3M+98/ghmbz1xxLWaA42pQR4P4mMyAn2HYoem9Kq2qKEdYquCDU448
         llvTsdLMKaNDhkDSEq4i4vubfEYoaPHX+HEJCkSmFj5xja3xtN1kQ5FzBoUcFxf+a2jG
         ANy9qo2IR+7kcJw6isLHBa1LbgWYBK3AugoGmKYjScNnV+dQDTLQ5QozRH8EFvmYqnfc
         7UdOEPrw648LWeTGM6I2em0d+OTDqTr8pVehu6PwhkWjYR6zoMgyCj6P/JYhN4ogzPzT
         KlDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ni6puywMMHNYeFI1EJ7o+kG8F5OQFdRdjsh/I+X4uqE=;
        fh=ywqSYKo+ancI8BQe4Q2BPJfQvWLdbz4+4wrjdnoPeLI=;
        b=RDRZKheENz8QC8ly53r3dnI9pe7F2+NX56kvcwQvw6cuw0ubT27xjK/8NgSZu8lToI
         x3LHOsmIGnPQCigT0ft7SuBrqnnZ5jXeXLFQMZlPOEUlvyOCCdpTI+iBR7x93be3pHYI
         Yz9lMzfpQMYBInYJlQdRS0GR77Sy4hJ8FEdx2cZAdFLtRK4BZ7U+4HxvbbhIfq58pXCj
         +yObbloV0oXFwXH734u/ZMYDO/b4pSXtaMz7cjfC/TaXjkwfacGrR1rc9auTJpSiQ/0/
         iWQpPmU1kCW6u2/EQ44zcFzkDCJvDx5wlsG3ZkSJBUbPCjIhTnhfvC5MzfXr0n6AMbce
         k1Ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795690382; x=1796295182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ni6puywMMHNYeFI1EJ7o+kG8F5OQFdRdjsh/I+X4uqE=;
        b=exVlGjqyVQX69gi5pMCj+rihqHe/tzXd9plbloIjg4AqQOtaYMwnJfynXCHwGLKGuI
         nP2rzSvjJE/Fjkb8jVylE4dc2VaHnxws9iKXRfcvIv/S0gE1WRg2yg8SL1v4/ZVfJnA9
         NU7RUr+XGvtFpvUwMaI82DGkqVbSu22gwehNo22ns7YNhWh51UxxDv1WCyOA9P2viUeN
         Pv+YD+U5fthQddEg3pZujIOZGquHWf71QPRnysTSKjGnfa4tZsBQI71CaQdIvsshAWm4
         AqrJdTCmcclUUeaxbkiTFAI9HplDTr6uDESa+/cen/fXzOMc3CPdxeJvHutvFcLV1dWF
         7ObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690382; x=1796295182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ni6puywMMHNYeFI1EJ7o+kG8F5OQFdRdjsh/I+X4uqE=;
        b=PdGPZkP/giQ1pMWHK2DGTq3j3uKJru+Hy7bslL65qcPBPxAOsoryeE2n/qViViggVZ
         ZqYOn6dk6YI+bMJRBFquFyjq+oGbZjRaSY3NSseVUb1YAmdr7Cy2gCkWcChhBMAmnF/Z
         br3bm+Ac+iCAnyU0XvUOHgsSZvAuOE8WViwm619LrR+6bIEWOwgLaTf3l8uORP2NNpX+
         EW0Ayo89ktBTYoBYJ/ZduTKTI5oehgSxdHoFzTjIbpMrQ8QV4X9brD47jZqjbTSu+V/5
         BvC55C50PIV4us3dbyxbr5cM0afcCvfcxz2Z+Ey2DUR9IuDgzdHiTIU4Mg4V66nffj2x
         bsGQ==
X-Forwarded-Encrypted: i=1; AL+hErFB2RJo/n5EBKTVuxlFM1hcZhEWnG9edXiB8VzAc3pKCcLLZpR0lzrjy8vXovf8NIjRolwxi55As4vCf6n7@vger.kernel.org
X-Gm-Message-State: APuU4Z+xR/nHdfXEqjgPFzxQy8aNzMlDVf/im5qa3/cVfTUygcuVGh4Y
	zEds0r4Omp7DtAS8gu9DChbWua6T3ULj5oQLGtgHbVRjMGIaxRH2tjBxU2UCWofFTamruVcH48y
	1dMEGNxCK4a5Ufi4ZKZI6n7GoeAZbuf8Ps75at3LbnzYzPc8pTvQ7QBVSzJcSQHtqVkecC3yKGZ
	VEh2bp9UygdZaJSGuqeu2K9iQOBbl4W2y5tCj7GjE3Y2po0JFSDjrt0AGV
X-Gm-Gg: AZFdTZe4cB3IOSC00s+uG2MdxHoVEPArfwPc63L8JFHmSZ2bvEr+5gqBaZx4c98sgYU
	/h5LjdvQV8A+VEXwWHp0/EE8BdJb3qBpe+u153hFp/rNekxSff9fnBgS/yjpaYB7hZETr2OfAIY
	kVdJA2u47Usgq0s9oxj5y/yiNTXXAMErEbDPUXhEmPmwijm18ZH8swVHeX4+0qhNXEUW7IkgbiQ
	gmEIR14jtDskcVuZEKTIRPMEYU1n8znc8nG3kwtj/Dmnkd4z5gAZt5U9CtCKtbjbpallx92PZFb
X-Received: by 2002:a05:620a:6496:b0:93f:5519:5e87 with SMTP id af79cd13be357-949ba8483edmr3214747285a.4.1795690382363;
        Thu, 26 Nov 2026 02:53:02 -0800 (PST)
X-Received: by 2002:a05:620a:6496:b0:93f:5519:5e87 with SMTP id
 af79cd13be357-949ba8483edmr3214744285a.4.1795690381901; Thu, 26 Nov 2026
 02:53:01 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org> <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:52:51 +0100
X-Gm-Features: Aa3M54qyoulSiyCZ_DIY3VLySWTTm65Hdj2w3I9NfQxQcNY242sH-YfIpWIKr_c
Message-ID: <CAFEp6-0Ykn4VNMMAa-WzCDcJ9=Z0x9Vd5e7z8FSNf72gGL7c2Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: media: qcom,sm8650-camss: Add test
 pattern generators
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfX2Jwi5Hh3XsFP
 5nHRPYbZCKfTLQReJ1N3ALSW7XSsGHO5hqkL5mAItRQBt4Ax3yN0RW+s/Zk3pd/xzpJ9Gb7JgMh
 dRnoMFrJ5/em3htDkyHfO1TvPA2eLGk=
X-Proofpoint-ORIG-GUID: JLiXcRtAA6NgVs36XqMuB3IxJYfvo-jM
X-Proofpoint-GUID: JLiXcRtAA6NgVs36XqMuB3IxJYfvo-jM
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b080f8f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8 a=hZyePdzDgcEG3UIITL0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfXza/2Mx+PHjwt
 0eCdzrcQ6bFWm879P9hwzxVeDCuqMPyAnGkXD9JX2Wd0ETMgXAhDNLVy2ClaVVKwZLH9l2sdZEE
 xhkRH31gNxE29IJj6aKVSvY47NbDg/sqicO4xKdEwi/UprHhmF1oP2eD/V9kCcd4C6GGHxzcbpv
 KJYtnopxG7njgrPaX59CfxIZGiRdgiPHKwEiFVE7rpHFIB61kHraIY0KOW7FvAyBZMmMIxKtK6/
 3WpWUJH3TWxhyHiE7DT9I4mr7+xuoQPMaFZH1Jbc74hREwu2JDjsu67PySPOlBBMv8ZL7fsf95W
 w63PaAhnKlzRDg7buIp+W2smv0iAIFH8R/hoN+Uc9Cm++R86Uh0iYqVh69h6qtrA1obI3v6jjz0
 jHoqEaxUYDhx29g9Y9JHxcOjeAh14/jYIws9tJ16g2+iqjhBrajlepFGXHPXXT+zpeFpl1q7s1z
 CRIFuW0zcdGeReEIUlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260042

On Sat, Oct 31, 2026 at 12:22=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks.
> Describe their register spaces and the non-real time CAMNOC AXI clock,
> which is required to get TPG output frames passed to VFE.

Do you know why TPG support requires the non-RT CAMNOC AXI clock? Does
the TPG perform any memory accesses?

>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../bindings/media/qcom,sm8650-camss.yaml     | 24 ++++++++++++++-----
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> index 9c8de722601e..50ae30cdcb82 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> @@ -17,7 +17,7 @@ properties:
>      const: qcom,sm8650-camss
>
>    reg:
> -    maxItems: 17
> +    maxItems: 20
>
>    reg-names:
>      items:
> @@ -38,9 +38,12 @@ properties:
>        - const: vfe2
>        - const: vfe_lite0
>        - const: vfe_lite1
> +      - const: tpg0
> +      - const: tpg1
> +      - const: tpg2
>
>    clocks:
> -    maxItems: 33
> +    maxItems: 34
>
>    clock-names:
>      items:
> @@ -77,6 +80,7 @@ properties:
>        - const: vfe_lite_ahb
>        - const: vfe_lite_cphy_rx
>        - const: vfe_lite_csid
> +      - const: camnoc_nrt_axi
>
>    interrupts:
>      maxItems: 16
> @@ -226,7 +230,10 @@ examples:
>                    <0 0x0ac71000 0 0xf000>,
>                    <0 0x0ac80000 0 0xf000>,
>                    <0 0x0accc000 0 0x2000>,
> -                  <0 0x0acd1000 0 0x2000>;
> +                  <0 0x0acd1000 0 0x2000>,
> +                  <0 0x0acf6000 0 0x400>,
> +                  <0 0x0acf7000 0 0x400>,
> +                  <0 0x0acf8000 0 0x400>;
>              reg-names =3D "csid_wrapper",
>                          "csid0",
>                          "csid1",
> @@ -243,7 +250,10 @@ examples:
>                          "vfe1",
>                          "vfe2",
>                          "vfe_lite0",
> -                        "vfe_lite1";
> +                        "vfe_lite1",
> +                        "tpg0",
> +                        "tpg1",
> +                        "tpg2";
>              clocks =3D <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
>                       <&camcc CAM_CC_CPAS_AHB_CLK>,
>                       <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> @@ -276,7 +286,8 @@ examples:
>                       <&camcc CAM_CC_IFE_LITE_CLK>,
>                       <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
>                       <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> -                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>;
>              clock-names =3D "camnoc_axi",
>                            "cpas_ahb",
>                            "cpas_fast_ahb",
> @@ -309,7 +320,8 @@ examples:
>                            "vfe_lite",
>                            "vfe_lite_ahb",
>                            "vfe_lite_cphy_rx",
> -                          "vfe_lite_csid";
> +                          "vfe_lite_csid",
> +                          "camnoc_nrt_axi";
>              interrupts =3D <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
>                           <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
>                           <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> --
> 2.53.0
>
