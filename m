Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E9525A645
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 13:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343311; cv=none; b=FeykFaX3b7PdUiPBJqBrB9dV65NnFKM8RB5NvRNUG8Sg0TI5C4gVRBUDnZ4bKtE3KjZ9/jybYuIvcaFjkwcX7LxWe339I70YOcCRa0gbknBRBzAArInyOC96Dx/susWbP8vge17xwSawf0fPXA80ybUD61EfHH9uTCLXdBc6pv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343311; c=relaxed/simple;
	bh=IOkG2JYiGgUbv35FbpodpbDiMFbkHvb1Kn+5txFGbuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpZ7ErKwiiWWMsYBH+7l2erRNJnXPsdDb92Z5lKVDOaK5YHmerB5Zy0078euDQAGGKV/a9+0pu/fnsGv6QUYOKd2uGlHHA/LZ5jj/z0N1WBUU4Io+1G4WfGIcBiQ9OGOJQCKnHX/02KhZsvhv91cLZpUV0O78nTJucjfAbUXmU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cjsDA7bF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PtkAl3RE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjsDA7bF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PtkAl3RE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDFJLe1055788
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 13:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0+9Tf85hFayM5DW0EiV7Zj89
	MPJK1Rp1eAzmngjUXtQ=; b=cjsDA7bFqK3OHd+oGx6GAVOUEGYvD45zm2KvFsgG
	0YJgRhVUrvSXbjwEwPpPXtpuzwLniqci+ZmetujF4r4xs7MiwmYeLf1NUel4IesJ
	+FL7k+IUFqrO3t5IiHjVJPcD5pDGMWrEY1b9sY9q0GFbHTZh86GLxRc4KPZeAAxw
	AAgIc1K4kxHxmRHRJBuOjNSf4+knAVZ41g+5deen6K/0nGWo6IAfIpkBQsQyLRxo
	fUusKd20SxVunv1Yc772EBMAzBI9yYe7eybcvh3Tos4mm+f6cYYKrz3IEQUAdzRK
	32UpZdvvKCIpprt7MvF44BXuj4JqrZYzLXjHEVy214Zxug==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce7akew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 13:35:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91242b356cbso9690186d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 06:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790343309; x=1790948109; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0+9Tf85hFayM5DW0EiV7Zj89MPJK1Rp1eAzmngjUXtQ=;
        b=PtkAl3RETXLrH0d0PvJRcCwTiyiLass9X9KDTIuotIEB7mWVQPGBOnQfLnaatT7pey
         ZOa0cwhuTCtzmndW6KUx0/1QQmSGQit6tD+cqkYVKkii9p3g5SGWq+a9nayVSaVq+wcC
         S0xCUjO0489n/Zmkoo87mAEgT6220oK2+wnkbCx59Y3gUH2SC1uDNrrmJC7RJcNnV5nY
         TQCUoUSNClpaRvLixXScB8aEmJFgbwoQlXB7ebSzcmgC9CA1BXRNTdVjvHLjZ66uqs0n
         pHqV1Ojbc+i26pbhywn8Zxb5PJuEMXyUAzwOBqAE96+mK1FrbrM8YO7ujER9iw+hO3ju
         qNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790343309; x=1790948109;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+9Tf85hFayM5DW0EiV7Zj89MPJK1Rp1eAzmngjUXtQ=;
        b=iVtHeHkgFaJTrvEY9KsmPl58kegCngwhCM70MOKEtn2uhujZpWSjQCpsligUVTpoEa
         MH7s6VqPbTlMSPF/mSmOUwRf7lG11CyJarKmnwhQiNIFVUGl/9DhZvS+ukoxrawFitpN
         eevqLKN7BRqDrs4aWO6E17tAzynSTydowyqlTgVtR1NweLVBTpWmYF5wI2W9vIA70zAZ
         5TAOr+y1nOJoYu9iBuQlqYuqu0k3MBjXaj4IhA9TFG7eFwjomfUvI5+A17Jco6LNdZU9
         tIdOJzBt+AwHbAraqyouQE7yP1sSbEj5+EUTMzeKV5sXxBZaEi/Tzh6zRRz8QAof5nDe
         aGHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkM94WNzxsBpKjyZOIgdq6+X/ShKjPtGAZVblnP0yUkhYsZgHXRyo49VagT9X3Wx7hQAWbHY1uYKLEGkoT@vger.kernel.org
X-Gm-Message-State: AFuF++m80tgUwI6wUaLlzbLJ4vYcZV/7wEZeTyJtbGS55vzjlQ34qL06
	fBu8+5jpEGXpLz82yBuLDoLRG4ldllPvco+5dtHy1ZikFxYhVU8PB5KgmXQg5Z636xrBkTCQ5zo
	mJ2+0bekUGBvrGih8TiWBucLejwEU9FqsIJzeWHrcbKlBy3JOzMz2FtYH3vVL8edlJHQ+
X-Gm-Gg: AYBFou2IRPRfexLoatFoUJoeuqhlAKKw2iMKsmWJXhD6P4gDioSYII/OX4kEPWwWXJC
	FMdd32l0Z8F9AMPs2AT1DShb6U0xDohoq8P8pqBIFUCvRobVayVFrcT3npvWRYKDOsKhXpcuhfD
	7suNjFtQOl+bhU2Ba80FfNhYseMYCmh06UoDvXGW4ZVBYcygOtmCww/2ySDzOZG+YEr2UD2WJIK
	W5eEm0ccR52t+n0Y6OORB+8WxZZkxlQJc503SbJNGpr2WPY9EjctunngD7fI3BGWMNc1n9u8DR9
	M3LcX9rHRlgzBDeIX7qBv1UMD/Y4VdDRmBeB/CcHr1B/BGmQASkLsuES8yz3gasrJ7H4hRhHAvG
	DCKVjbEUgCV2ZuQ==
X-Received: by 2002:a05:620a:371b:b0:937:7e90:ecc with SMTP id af79cd13be357-93c43bf241cmr483149685a.25.1790343308412;
        Fri, 25 Sep 2026 06:35:08 -0700 (PDT)
X-Received: by 2002:a05:620a:371b:b0:937:7e90:ecc with SMTP id af79cd13be357-93c43bf241cmr483141485a.25.1790343307700;
        Fri, 25 Sep 2026 06:35:07 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6450a3sm6569501f8f.25.2026.09.25.06.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:35:06 -0700 (PDT)
Date: Fri, 25 Sep 2026 15:35:06 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add
 Nord compatible
Message-ID: <arZ4ikxuE3p9CfRz@lore-desk>
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <20260923-nord_ethernet_serdes-v1-1-f8ac1c487882@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wbcqu4ESfEJos+9j"
Content-Disposition: inline
In-Reply-To: <20260923-nord_ethernet_serdes-v1-1-f8ac1c487882@oss.qualcomm.com>
X-Proofpoint-GUID: xvgTFQY9B4sTm8eeFJe50ohAN_kEpiSV
X-Proofpoint-ORIG-GUID: xvgTFQY9B4sTm8eeFJe50ohAN_kEpiSV
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab6788d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=XuoYqDaM_I_laROpC8QA:9 a=CjuIK1q_8ugA:10 a=BlIz-W2qHe9yj-0B_l8A:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1NCBTYWx0ZWRfX7CKqvRNo16YB
 v/Gb9cu2fQeTfMYSm973As8WcaswL+BkpVB9nb0flIqf7f1Y6UxhS3Kichp/7K/8AI/Z6dSCp4r
 41/XfMRnHv1JUttC3QiceEKkUMgGIazLbhfMrxSHJLtvnQQ+p9pAuLvNFud9Pf6RAwugYV8540n
 x7jQ00NmeDJEM+3498Ygg3hispxnXw8oSpQyjDwryA9YY++QqR5y832D35/t60GUg+ezYjy1lbt
 5kc8KJNyNBG3SCAIVcHx5WYrRqi1dL2Xukt5z6+IApk2KuEfq1KyC52bxks4Xt03Pz7PJEFgh0g
 USR4gWvQLgrxIOJmfiqhVzD9+2MfhTrO16HnszQB+SpR6zHVcPR5eZ/8SJdQbVE0JXEyfSQjq3z
 MGJOmUJyhhhGIW1/i/9bA56SMqwku2JI0Z/8Jdf1cVO3+xwfpmjE/gUnmF4484LrO3iLWeLz7Il
 SIdQybvTzjBwL0n42uA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1NCBTYWx0ZWRfX43kxtF9B0lj4
 UL1qfeXNdPltL01/R2OhohRy48mSOtMBd53YF6w9PuZnlcR2DadXAvFQuq2zDTWjpCR7doEGsOl
 EnyeHtMYPwLNEWSLyHpPuE2wIwVvL/A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250054

--Wbcqu4ESfEJos+9j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add the qcom,nord-dwmac-sgmii-phy compatible to the Qualcomm DWMAC
> SGMII PHY binding.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml =
| 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgm=
ii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmi=
i-phy.yaml
> index e573abcb937df914ced25ec87add7955bbba7b87..f2df9983d9536654e838bae4e=
1e23b832cdaea3c 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.=
yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.=
yaml
> @@ -21,6 +21,7 @@ properties:
>                - qcom,qcs8300-dwmac-sgmii-phy
>            - const: qcom,sa8775p-dwmac-sgmii-phy
>        - const: qcom,sa8775p-dwmac-sgmii-phy
> +      - const: qcom,nord-dwmac-sgmii-phy
> =20
>    reg:
>      items:
>=20
> --=20
> 2.34.1
>=20

--Wbcqu4ESfEJos+9j
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarZ4igAKCRA6cBh0uS2t
rEj8AQCvog+D/EGZ1bBhQzHnuSy106/aNlu3Mkje9Z9B6bRv4gD8CYovhF1C/+kv
cQcO0DZ9od/rY0vDBhjipvCfqcC+TAs=
=pLpz
-----END PGP SIGNATURE-----

--Wbcqu4ESfEJos+9j--
