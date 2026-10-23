Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792768605;
	b=KmBWgoCh2nMH+tXsNeeOuE2Jmj89xdoHYpT2V/+b13BdfTGsClhTrZR1nK965Nusstdl
	 2OmC3f4ARpe4ks9p/nC4Epv0RD0rgvYDCPGRFII8+2ArxgaQSIDs1aVQ+bjmuheVRPaPz
	 72oSuSqcG846SyD+mVg8jvdXUO1XU/KS1BTzR9mH7dI059PDZ0xyJID+mPWgnS2JhhHWl
	 S6mag8NM471GWWDIefyb8g5uQpSTlcobLFEQ3HS7/NO7fDfgDtUbTXetDI1A/tsFbkcDG
	 YNdBm0BBbYd5nx7KeAkM/NXCPEb8m0BkG3HXAxSiOr4cxbtFK+73lbknxDJS8edrC7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768605;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=;
	b=fC1DOlIch9kWS3E+/kBuDRbVsy3Hh4pS5IR4JweJyROU3gWjw9d9PkQnoPd8mfjMA+qB
	 lL/ZKkjBZgJlOSlhkPldcFrF0oI3vrdCKQDxMydniHp1IwXorf9pLKTtKT985qdE4ZbPa
	 AMgt0Br3elS/cNTfJ5GsnMwdSF2vbs33+qi1YKGZPdGUxjOVqq8xnpliAeN3JuIvwRXt4
	 x/a1zk4b5mB8Cm1XwuiADtnXuURQGaAR0XaZ7y8DU8CqzdpIx5FRMAC8kW4moYhW5Qiez
	 LOrNBR/lQT5ZIiHKrrjzNBy4Esyt8I6mYOFQVwW89q8YxwlyiYJOvL+N/h28VdB/oSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RuZfbKXK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="L/3gk0HD";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8194E606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8194E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RuZfbKXK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L/3gk0HD
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6DnA2462625
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=; b=RuZfbKXKE7ctzwuv
	czGvcZJqzCy2XCLn0xdke+X9ts8FAcun4WTZQCudkdJKnb3xdFnvARNiR8w9By3I
	NwA5f19bmPM0F4/1N8NdyKMtmcsewJn8V8CTbPlcN5jFBP0GZaF5wiyzsdocXvUS
	xcjmTXDeIeiuipdkZxzWk07LUQizJOAFh6S/jElNl3n7/mp18BKLuVQ1wp+bgk9l
	+FcF1qB2p+MZRT0ltDw0JQzJxLrzFY3qx4BmkwskNY9DfkKwOgNAhobCbeqgzD3C
	K4wGWwxI6rnBtUmB7j1FsuYzVYhAGBUyEOeSjKp4k/YEspItviojK8felV6wchif
	2pd1KQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtvaff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:16:44 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4f4612a1a5cso2490900b6e.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792768604; cv=none;
        d=google.com; s=arc-20260327;
        b=CvulLpWkBdoohNBGnqtFZLviQV6da1kiAoRrfuxc8LCBUEhIjTEektqiYA4BcaOiIO
         7SgFtv6BRD+qJwhgfT2+jAqOWlxQlTgLFKmb5hgPzTQAsuuezEDZQtZboPCWMCpi5tv4
         m5pC6ogWm7sc8ldENnsIn4PeZ2ENe/LH84pyJNBJzStmG+s2LUDxQcPnYfOR7E0hlews
         yvWjI5FUxCHHPtZrUt6snjSkIVbqP9ypCvQsvZLtcG1ST+EVO+ET2wSTjUl3eqC2DNrR
         SgvE6AT3/DRiWqkkXYtxTT/3f24m8tD0Wm4180TSdznROsaNdMVwIkWbhNMgCP187Ieq
         XHJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=;
        fh=7p5+fzoPw3JxV5bmyXsfEtOaQpbaaahE/OT+2c7c+p4=;
        b=fw7L/2I0UyrUu3bocvwwQD5hM96KbxQciQAfzuzXK9lKy98p5H8uU0fzD36FbtTXRX
         h1716KKlThbnH4p9Qpt1mm+XcyhkbWQScJXFhOQqMSA3GNs2ZtvyYtXATZIzRxb6lcvP
         Zd2yENgpWaPBj+e0fJwjf2jel/mvLvkqiX4Fg5UGHqP8BsY5dxkKGKJFSWnL8TPQpRj3
         k+bPtzldnLuPeGMV2RNNW6sb81E2mI9tkHbhhTFuLR6ycLBp14rWpluewuy2PDLSCimA
         dORT57z1jydfwJacWgA9dKc3jSuiCCzhOrGIDWKSs47VE45nAhMAqjnvQq50PaqXrBo8
         Qoug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768604; x=1793373404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=;
        b=L/3gk0HD6tLj0ZMPDOtdsa+nHmVehU9lqltl0YMtrsiCyjkNKDAUGtTK7TidLO0J13
         4Glq+DZlulePmP8lbSje8FLFth+Kflvb102fMF+2QL3K2UPB+heJ5IyelRUFwQ2oUnrW
         zczr4NRYMDe97XpWM3OG1uJLgQmKpeub3DBya9SLloYZ5t7oOYQomwu1QIsOHjiJh+xP
         L9sybaznrBAP7jvBIa0J80WfrHJ44b0U2l3t2lkDLCXFClMMbgKX3dNDXCytRG2+SVqG
         JwFEjOMn8DLU96XThSZW6bfSylys1yjMUXUNePQ8vSeFzbRPbF2gNDeiiMAEf3fn1EyU
         IQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768604; x=1793373404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=;
        b=mkT04TOuSQO1p8Iqga8wW+v3AfoDdQ2SfaA3eLEsG7IrwQ4jF9nWFHpqF+ZBzYPbtr
         GXvZjJfqM0gtK0DZLJjTGKAgWP0vehAJWPrLPMLhNOb+V0p/JQ//CY3AgPy3nB+JhMTp
         5q78Oi9Q4EyyQ1gyNT24Fn8D56yl00OPFLWqubp+G4njvaRwK8SDwtZhPknDjTWRwTZs
         n33SGck5rM9eD3MXlPI+EbknrDzBGbm4em43+czX4MVNDDCTScEpjZSrr2V+LdV+p0zy
         CB+Qsv+OHVyjA1az8nQfPf4TjCQNYDTLfIO8OY5tetSTvLGrc8g58h7zowXTFpLq18x/
         uTiw==
X-Forwarded-Encrypted: i=1; AKwUvBw+iYR3cFnsovkKmEqfigzdEBZN27m6HFcNyXuOV+KiXlxLMH7KEmv/XIMyRvTkQ3KZ/r+ZYB4GlCsJvzyI@vger.kernel.org
X-Gm-Message-State: AFq9FYJbixnuK+46ZqUbcDUFVSOXNdUi2m4Jm6ji66j9ql4vZOem7ds+
	xmQS36RrwRh4VT4ItKP9kUIpTgvjoQS5dGMWonYQCqBtnGFwqFy1PEKKwZeTPx7YB9iNOygFPJJ
	hLoBzagN5h+yv3vxA14HH+BvZulEYdu4G0mII+UZeW9L3AJH3L3RLFFWUyJx6a56XWv9DaV0nyt
	1invDRGxPCNN/1jPJqTMOIPEHbNDYes6v0InmqkOpjvLk=
X-Gm-Gg: AYBFou30/JAbVPZabJHS0YxG7s0Bj4ysDwyGadrPnwMPTlV2fw/cMHOHx/bKtokA6SJ
	6Q4qJjt6j9WPbp3yS9hl60ygKyPGYYnqql/+Leah6umVAmpe8eYTizq3FDep5t2kJP+V/543aLT
	fy9QYPbyRfe/GRHjgFo+QJUkB/sHH9Y7TqmP/IpFCMgLplkNppoQbUc2CTPy2nFRQYdwyb87YW5
	HJjAooh1G5+mtd3u1d/uImn+9Niv99FBj29vK6IhQdqDy1Mt81O/9n5exFkLaq3KEs74jJ41No=
X-Received: by 2002:a05:6808:6f86:b0:4b8:4703:db91 with SMTP id 5614622812f47-557eb47d075mr3061863b6e.26.1792768603849;
        Fri, 23 Oct 2026 08:16:43 -0700 (PDT)
X-Received: by 2002:a05:6808:6f86:b0:4b8:4703:db91 with SMTP id
 5614622812f47-557eb47d075mr3061832b6e.26.1792768603405; Fri, 23 Oct 2026
 08:16:43 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com> <20261023-camss-isp-ope-v11-3-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-3-0c2937195298@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:16:29 +0200
X-Gm-Features: AclHuK_gI7FsS6nJkI8EHAiWfGIfmG-kFFxZK8IqQe2rUZA0KJsBBIIrHA95LyY
Message-ID: <CAFEp6-04RVyYG1M18Dh6Z3J7MycTb-WdMkHxyyVPfyiHVK0z3Q@mail.gmail.com>
Subject: Re: [PATCH v11 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb7a5c cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=43rrA-HyjK99Vs58VTYA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: 9jh58GEylL2HP2cAY3K2WpMtDQgTqAae
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX3QFlzupVJXvh
 TlIBbpO9N6CT4iMdVBnEJI8x/E1Zz5zwRz8GZa67HcwyzqPRYD0CUDj3fyvLcFO0SKZ7tziWQAL
 ky7b8jaaxadJ5RRJGijeOLujoHTJLagoXKqFxFm3TSPpo0xi3V6chw//0ry+V+JEWJXatPLH/Be
 nxNMuPIroBdN3x1eW66zYOIcZ5e5/gpGy9qsOvYtrrTMAtV+//BVeUNY1gDDWjwrgS1jAraSgRD
 ak5Koc0eRqxVu9THZC9PR0ZBAXyOJa7M0ik51TySgXwGW+h6lBlU2Ub5saVpZhH0RTQ5MhWqiuk
 eBKreMsNoTX5AUXma3YQIaH55RJO1Qnee6ZuCdi5PndCZ8vlSAmNgqJggsYXkLTqLf/XOFtz+By
 YVBsVVWKXAY3RDzVMj7EuSoDm0rHDUMfm6DO1RPL7ErF+fImpQr5YLwEKMYMJTn5fwd8GEGLqW0
 Ik3AT059Fx9EuJzcaNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX9s3MfzOuNNym
 xP6iyNdgYbcc+PmHT3L0L7Ubl+eJaV2nRdidO98wkTSKo3q0RDUcsNEmrtsuOLC6ENos0QClT2j
 aPOgnRsp30lpMl+OIGeyBqIKsIU2gi4=
X-Proofpoint-ORIG-GUID: 9jh58GEylL2HP2cAY3K2WpMtDQgTqAae
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230059

On Fri, Oct 23, 2026 at 5:09=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>
> Shikra uses the same Offline Processing Engine hardware as QCM2290,
> add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
> as the fallback.
>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Note that I missed the trailer update step and therefore did not carry
over Krzysztof's previous tag.
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

> ---
>  Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 =
+++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-o=
pe.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.ya=
ml
> index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc=
41749e60d772ef4 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
> @@ -19,7 +19,11 @@ description:
>
>  properties:
>    compatible:
> -    const: qcom,qcm2290-camss-ope
> +    oneOf:
> +      - items:
> +          - const: qcom,shikra-camss-ope
> +          - const: qcom,qcm2290-camss-ope
> +      - const: qcom,qcm2290-camss-ope
>
>    reg:
>      maxItems: 6
>
> --
> 2.34.1
>
