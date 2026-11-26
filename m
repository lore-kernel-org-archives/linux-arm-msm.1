Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687273;
	b=5sOR6fLIsNcY6AodryaYb4u0fcqyT+6nMduAvHhRoUTagcxXmYlM63ttEXZoXuQPx7ao
	 wbKZ3POaL6dd2bRXZWWCHHgH1kbOhdDpVhkQl70ZmQg87IP4YMKDy1VC6jPSMAs5zhRBW
	 m+pSnjIgRtYRjRune8ttG1O+PlRaxec/RPUw6aqQRggqqhbbQakIXzdSr/eNvSycajECh
	 TX2Gzu2gqsbQmKNS7AX2MuSvqE7biXTkiiSqa8sAPdpjf26H4/nzySgXKkUtfw/V2h3k/
	 2srUXouhekOF4fsIjJRPxtNFTQMZE4j0g76WfARkp28Yeuw4U5wIbo6cn4Aajtmw1mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G9iILtelhr8Yu2FohoGwzQk0gRPwQeEBjlv06/YSbwE=;
	b=jg5qQgiwcgLF6RYETXVnbPwpPfATqVpjGaigpNcId0o/82ILN4zS4Dmnn8fAVkCkUr/E
	 vz02JDeSDNYDS7d7tY8PEV57dWIw6ybQwBoHjJoHtid561npkx9tUXWtvA1J59iG956Ks
	 T/tgSDkjZESKgw1N0ABsy1PvsPDSFvt6LLPBW2kmPA18C9cN2+l0mzgcVxhd02j7LClMR
	 8zMbItv7YpgJE0K97fTeX5iPmvafsysCz+WCWh8YG/ZWPcY2FBdVkrIpBg4WS5mOTi7P2
	 PUuZPhR/y9XdgjWmlDACbKhheFXhvt3vURsdk0Yt7buPmVIiq8zqhNcTlMv++Xf9daQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aB1XSrRG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dDOrD4BC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA362606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA362606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aB1XSrRG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dDOrD4BC
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B3PJ1682482
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G9iILtelhr8Yu2FohoGwzQk0
	gRPwQeEBjlv06/YSbwE=; b=aB1XSrRG9Tg9EV5Kujh1v5n+6HaPnQH8HSHhBcZB
	DMSIjQjak7kWjuy65DcwYjRRe8EG8HIb/pgErYMbd2yTqRdH8kdfLPWDBP7I74mu
	oAaag5esojBzSIyfydSwLotzVG2E9fxYZH+QbY9TEFZVQkAJ/3HeIKcpFYEEWKO3
	oGClV93Xh4hMwegJtAqsDhBOnZJ3hVZLdcmYJpBN7xpavyJfUNjhiyYOYN7JBKsl
	bQVLQU4xKu/7u2HcFK1513Nw+O53TnM6gj09LynunZ982VnnLYn69kKt9xgaXn9U
	3KetkbIF43Mtywx+0CK+LsFz6k+7qcUOfFHllJAhjgebDw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aekkj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:01:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso1166568185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 02:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687271; x=1796292071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G9iILtelhr8Yu2FohoGwzQk0gRPwQeEBjlv06/YSbwE=;
        b=dDOrD4BClu3JDoM0FEZktrw772K0JJngFl3nhlYzIlUsad8sZCNfYe/2XM1UsHOhNB
         02FaJPhFTTLwP6CBst/5Z2GgO4d0lFKLJ2SuKrOnpNHCOxAwW6ZE5QUHiT56WFPCMoDp
         IxN+DbG1r7hNgo5HXYqh1/lyCryomFvF+/aD4hh8pjuB6jMe6aC7b8RIkd5556KLjdNh
         0gB4Lu3OGEp7+3u3PNNy416iA/o5msMJDHgBW45pC8CeivtWd+sQavurK/bV0HyMLNhA
         zNStLakXizXXWPVCGZ8YRgr5mqh2w24SsKkmUtiEzEua62Pmgq6BV1hZf/BWufBhhJQT
         2OtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687271; x=1796292071;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G9iILtelhr8Yu2FohoGwzQk0gRPwQeEBjlv06/YSbwE=;
        b=mAGJGM9oJ61BfDArsTKSzSsO+OavQlynAl8htLcG85uUscm4eUo9yESkfWY56JoSHM
         XgXrQwpZDmuKQgihCeZZz+1nxDBzqdP4biKqcXFNiZLY7u7Y9WBxjG/bcBNep4TpQqZn
         ysb0g1dP14zjb2tDofkMSaez1ABzkj4YkAnUkStnyRMaGoAKnJ3sTwCGfIO4UCx9VwYZ
         0eeBKGVa2YcfP1uGmGLSIusHuV9ptKc7pJWZ2zBuCnbemTLkCpuXhDB1UftT1oEfXUp8
         Nu1flzk/MKS7xLsvNQG1sIYoTMOLzGcR9drm59gn8s3zz1BRL5d9H+tiqBORZjULxQrM
         YUeg==
X-Forwarded-Encrypted: i=1; AL+hErFFdLesFqBGfYqXk150CTPF+/PUwd1kF3NKXaTsfoDjZ5EiDNKgcCMad5PKQx7O40vPNFzNf2H/HQ6pqWlj@vger.kernel.org
X-Gm-Message-State: APuU4Z8OZCXIG+jDLfx9i9RqhVAtovavbGlmiwsV4/ibqW2v/zrXwloJ
	fooDUAtdOKz3aUgD7BT+AfAYcSuCHC5A7wxJ/3HLTfwXfOlrkNZjAOmNxU+e5hREIbe0rUFYULl
	97EDz00UClhXHCKOdmzIs/iiuHxKXAiZUCMq2Oxp43UmIfNnxMU3EF6L3tLYuE2RHNGtt
X-Gm-Gg: AZFdTZfFHcwiIGANbQDRhqLdgoES8ndURpfJ/XSIUITbdBwNNKuywFvpuRLGkseYlQB
	8AYxPWcG7uSelTfVyC2kBJ1lJ0vuiMqpE6COkI+NMu+iiFl0xRBT8rfc+TZtpgWNN6qKgVqpryy
	B342OJGM7B+omE7pL/yPtigxqsUvxWxPVFP5xF4kqMJ1dCMFnoY8SCs3TLpVbl0DiuMjpWnF2FE
	QPWAoLgA/vogSKq69XTdB/uH1KADY1hESWci735m6vSJIrBLH/hEj4GxUfkCSLGs15dO9D72uK/
	Kpftj8sVuUUh6TMt+vmdDMBIIrYCo0AlVTZHuG3XuEZUFqQcppy7ORhiBefzwqKsioTDhQ5l/Ok
	F2mwhtXJItv+Nm95KQGJOCs6W0FCXzzIwp9leg6EtmzBuoaUTpXmdTuoLRdye5pE=
X-Received: by 2002:a05:620a:270d:b0:949:3ea1:3021 with SMTP id af79cd13be357-949bab6d711mr3557298785a.68.1795687270869;
        Thu, 26 Nov 2026 02:01:10 -0800 (PST)
X-Received: by 2002:a05:620a:270d:b0:949:3ea1:3021 with SMTP id af79cd13be357-949bab6d711mr3557251685a.68.1795687266480;
        Thu, 26 Nov 2026 02:01:06 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm38799609f8f.40.2026.11.26.02.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:01:05 -0800 (PST)
Date: Thu, 26 Nov 2026 11:01:04 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        p.zabel@pengutronix.de, andersson@kernel.org, konradybcio@kernel.org,
        abelvesa@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
        fabrice.gasnier@foss.st.com, alexandre.torgue@foss.st.com,
        marex@nabladev.com, changhuang.liang@starfivetech.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add TC9564
 clock node
Message-ID: <awgDYC5NDhrtYcVW@lore-desk>
References: <20261125202141.1288493-1-elder@riscstar.com>
 <20261125202141.1288493-4-elder@riscstar.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2fAwCp9gELKVaB6R"
Content-Disposition: inline
In-Reply-To: <20261125202141.1288493-4-elder@riscstar.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX35jSR9YquOkT
 0Sho5YkNl7WnYYFcd83OLsZtJSQu3hQmnZkhoCTzZQeKU/VcO1q7d+WhZ/jmjD/+mjTCLB/XFgm
 6Ry69LZO+hta/yUdTmbsbketnCP2fmyRmeNkBDXGf0/fc4R3aSewjFZ+7/5NqeoPYT4FQxEW0uC
 Yv7RkzTfKarwz8erRFimzKPUbFR2wB5Y13QHuvHmv50lJY9JYKwpri+57tSR2JHD6Dnwz4661Af
 BE00Aq9p3KmrRY+Wz4YgSrxqKhsEugEF/dARZePfweH3OzmcO0plN5u22pPf375//DKt0NcQcuy
 Z9/Ng5WJQERgPJjzRyDtfnc+t4g819liqJZuy0L4Wu2FLlsIgkcVK+7qZHLTg88pCgpO3In2/qL
 iMc4fp3uC9srGWNNEc56OewOv8AiTyAS0oAWmGIv3rMTHwx/qQzJpz7G/IYMKM6mubGqGpGOcU4
 ayEgzRZ/eakYnGBWMFg==
X-Proofpoint-GUID: bRif2bnVzJCfR5ScLiI6e11SIGKJ1cMR
X-Proofpoint-ORIG-GUID: bRif2bnVzJCfR5ScLiI6e11SIGKJ1cMR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX+mH/BKsPyAHx
 ev4fEiRAhQ2Dj6jQI9x8tliCo4rU4iCs1cIa0GPA5U+0Ppf+dqt23UCP6paPoiVBk/7+vhPt3TH
 b3BgRZXgXYg/S6ykyNCp4HotVMnaHLg=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b080367 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=DTxt4SQFiI5XT4Iyg4UA:9 a=CjuIK1q_8ugA:10
 a=1mOaCQywVTqKKdqfoSYA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

--2fAwCp9gELKVaB6R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add a node for the clock and reset controller found within the
> Toshiba TC9564 SoC.  Also add a node representing the fixed
> rate 25 MHz crystal that supplies the chip.
>=20
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v3: - This patch was previously not included in the series
>=20
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

>=20
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/bo=
ot/dts/qcom/qcs6490-rb3gen2.dts
> index 682bcbc0b466b..b327f64885ef2 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -890,6 +890,13 @@ pcie@0,0 {
>  		pinctrl-0 =3D <&tc9563_resx_n>;
>  		pinctrl-names =3D "default";
> =20
> +		tc9564_xo_board: clock-25000000 {
> +			compatible =3D "fixed-clock";
> +			#clock-cells =3D <0>;
> +			clock-frequency =3D <25000000>;
> +			clock-output-names =3D "tc9564_xo_board";
> +		};
> +
>  		pcie1_switch0_dsp1: pcie@1,0 {
>  			reg =3D <0x20800 0x0 0x0 0x0 0x0>;
>  			#address-cells =3D <3>;
> @@ -969,6 +976,14 @@ pci-ep-bus@4 {
>  					#size-cells =3D <1>;
>  					/* Map 0x0-0x1fffff to BAR 4 */
>  					ranges =3D <0x0  0x4 0x0 0x0  0x200000>;
> +
> +					clock-controller@1004 {
> +						compatible =3D "toshiba,tc9564-clock";
> +						reg =3D <0x1004 0x10>;
> +						clocks =3D <&tc9564_xo_board>;
> +						#clock-cells =3D <1>;
> +						#reset-cells =3D <1>;
> +					};
>  				};
>  			};
> =20
> --=20
> 2.53.0
>=20

--2fAwCp9gELKVaB6R
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawgDYAAKCRA6cBh0uS2t
rDJeAP0Q6+VXzDX3T4Mxc0he53zTGBAW5n6sPUtB0OuXRO2TaAEAk4D3UlGDtfnO
vcLGfSBOqjIkzTbgYiQdQ6pQ0DDeQAE=
=e1Ov
-----END PGP SIGNATURE-----

--2fAwCp9gELKVaB6R--
