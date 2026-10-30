Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793367552;
	b=q4SyY8734vfE3Y3eyMOYjb69Ngi/m4ZyqnndkLjatRR7rorLNASRIu5hjm5Jpu/tHTLz
	 7gEds9k0MpELsrX5uFnm6Vo2+rUi0ioHJM4+V4+RqSgBCMe2kD441n2LAKr0o7v246PYs
	 JQX/ZgQI1Cqp2wPI33eUmLKeEfLTqX1YXRLqKlmq2ZXUWfsdj+Y1bbfVTOF7tiHUftY+S
	 mXbcHQfKkQ9A5GmrbEK1ajX4bDzA9pTrnZDk11SFGk6zh4GUBihFCZ4c4s+dxr70AiR3p
	 EYZiyaYB7q2x6QsUWnh7WH6B/jb5xAY2WsuF5Oz7gF5rJ65YrKS09zCmCd68kpUkF+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367552;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XwEaob6thLYAra0jHlQOZLAFR199UwLvhJVwj3sBNU4=;
	b=UNyPp8Swzdo5iYXTEAii6St09RyNmSzXA6xMebMFdSbhRS/BEXmLyvre3EdgaDtQ45NH
	 LuJyYD2vmh5zpwV7XwFozVD8idJRd8wn4R4Pv7G0g7+7n/H7u17M5oLwqzsBPuL6TKvig
	 pDm7bIxhnbui0F+I1SPtvjfn4fTn8gLfGBVMZyMkWykzhK9mK/3M3cK/0BMD6Sup0iZY8
	 XpOFRkA3lWefas7QPf7J62r3Rtnt8paE/oIco5zIijkaG/+qHy9MpH9/4VP9ntv1ubJss
	 OYZs520RxfyTvxYx8IdYoLRPC/XGtYuwzVgdPh4rW+4KArZvkU8kKAim+43S6V45gvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MeCUVtrG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bn2kDyi6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAD1606A329
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DAD1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MeCUVtrG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bn2kDyi6
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG4kp3142130
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XwEaob6thLYAra0jHlQOZLAFR199UwLvhJVwj3sBNU4=; b=MeCUVtrG19q1KNHb
	HYHfkpDegf7bewPeoAgccrjzPBx9yYujR7BRiAkyZH62zo41/o3txLcu/zYYnJA4
	i5ClT4OlxRS/AFJuNMlPGQ36txB7zOAiLXm1g1mQ7yqeHVKxV9JXwlNgS5AR9rvy
	MY7cyRlIdotakOHWpkrHgviXBYymNwI3iLdYSfAHValNCwT/A2z+cnOqAQ31ekVE
	58oI7A01Sx4b6iKQEHgCwYL16WhTcQ5DzfXpXxusMGKLn+MmOXOO+tlRa6b7sRRo
	BVfFd0IIIqfE3SLS75yVdqfGAe+0SiyoMJMAp1bxrBPWBC9uXbyayt05kD/RMx/q
	D6JWow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk80u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:39:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so143436185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793367550; cv=none;
        d=google.com; s=arc-20260327;
        b=Kc1MccdoMadFwiQdvaStnRPKo/vUyHkLtVFVUtGqpvyLrpsz5P37mMAZaY3+TZKk3f
         k3PHGFPwfETA0a6c4roX9ohhTxJgmuEEk4xN9/uCGaEYpwz2zxcE6nIuTSHZjLAr7wAM
         OKt1ISkLOiO8Gy/b0KLVnpKj+4lug8yXW9AvMhFuFBXFHj6893IAylEYKYrsz5yyHksK
         XlP1XH3mpMAO2A8TOAe1eik2T3uH8y50qbIpwy+i1jd2gjmejLzh8ttNK74YK+8hbqKy
         xRYaIrpb/Beiu6vjYB1o+lmH+T7rgFDAO3v+/5/yaEsjrAxqQP0RhLWqBXEk+dUm5Jnb
         25ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XwEaob6thLYAra0jHlQOZLAFR199UwLvhJVwj3sBNU4=;
        fh=ra+Ni2Fw95sNERvU5aFxJqZoVQXg/hcs44wwwBMaSu0=;
        b=bvB3ZaIjVO6B/QtThBLsrOv48sbSQG0OsbctnJcZYycSwnb5uaeHUPsklDZF6F6fiZ
         SXEvgWY9Em7p3s9CTh66BNXe4PEubJr/sKctqkFxDFAv8pqh5xaxYAD3qbc30Hy2ETVu
         Oom0gugcH+P3W6Tllh8IwcVe5dA+rTRL3SLWSMesiS/z3A0HGKFlfhneZpBk5+bzcnwX
         dJCvr4oWyexGvKYwMauJYD5bGPM+6OnNbzOHQrlvz+XG60YFpChVMLZO0ajJc3pmAFmh
         IGTVfLRg3fMTitmjIfyjeQEbfCyxa12GLnmtQd141ADUf5Wlo3tpQuGw+yCcXKvUxwVI
         UaCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793367550; x=1793972350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XwEaob6thLYAra0jHlQOZLAFR199UwLvhJVwj3sBNU4=;
        b=Bn2kDyi6GtGHGrMw+q/ysoxe3buIgSu5+npM4YKeEglq3nIBIkh1UhM7JIRTI/8GU+
         gGWloCmNhUMPXqX1zb9VyBviHZXwGG6S/CxpryfJWWguZKIUZDLCFKiaTg2AKzEsbMUN
         R/FHkb3+1cdxM6uJ16I6YK08WLrFfzdgAPPW/JAuJz+LVrhKqLm2GANMqbS3v3e81T8N
         BC8rb2Eu6JU/Ni5kyYCgvtQwWkexpOGpLtqf3YWXfBF3GgHo332KgtAyNeGeJTnFgsjW
         Ii90Zutqi5QzF3DtYKdt57P1ObaEaZpIRcOAocjfgKdlFsLk+MSjwy96LjwNw7SGcUNU
         Lgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367550; x=1793972350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwEaob6thLYAra0jHlQOZLAFR199UwLvhJVwj3sBNU4=;
        b=RdTshQCfw7nvSXbo6s5Zoh2MKa6ZQShqVkGPUIh2n+HkaRPnicoi08Xk9zL34j6d4I
         WMd5xpuKs+0UTzDcvCj78XuHsSdl83t7RVVb1fxfmscUO/BiNxxVc1JWVdqMwBdVuAgn
         wr0W03Qa8pgf1kE7at0FUug60fsMfG3HjiqYAB2Yw/BSR/D85dqZn/CslKbJjKwSU6t2
         4+u3xIH2fq8tj5w0m5Q+x1r352xvDuXbixn63QRuUxAPVPiNfICQBIWN4n04DHxDsqZo
         Tz/cpvzV/yL8tAejh9URB5iptjtxt8EwDwAw8carTgoASLgAr2vph6+NRsebeZsWKVHs
         zKPg==
X-Forwarded-Encrypted: i=1; AKwUvBwy9xNXIrRSdy4SuVorQNbRtlyTifoeKSfORpHuOBPeDBCT7eSY+h8CWt5rkPJX0sms6XEoA+G6DC/lwARL@vger.kernel.org
X-Gm-Message-State: AFq9FYKcXGUSYQ3BYjYVfTd6ZET5ovS+yrxGGFwmNZVSu3wpBIlF9rot
	hMdeGefD4PVShe1HrOQr60VZV2640HI9gocKeOSUPXemkMQ+yUZod1UK51VyUYQsv+1h7tUKNB6
	8wGnuvyAgR5ev8iNX+c5KW1ngpRCa7xW4XO+s8LYUDg6qJQ4zWigszmOXT8gf+9LgiFaWdm4P2J
	RfPKPz2n3gUwMrA1FsSAXcdCZbC8ENl+bt0N2A2Ab9UhM=
X-Gm-Gg: AYBFou1lTgXqRFYKFMhPOQJrBagKnBcsybHxY/7KH10RRhr9gxw6vAMT072kjv1QYQU
	N39znTJRU52PHttX93brTAtUDo5dqXxulfkf2TIjQm6UGSX88g97LWqYraCw7AQ/e3P0LaSKsm2
	DnsLOjI+K+n+3tEkQ3x9GAm/FMRsnbFErlwoSHM/x42NaBYrt9saLjTJCmYGE0+3BhmWA8jX4+e
	DsQWEVIdhHIVZbNrGb6Zmo8APANGxrUyNOtqlgBPp6lxPiUR/3j4gcpk19gwhxxq+VOPckhGFYN
	RTsMSl+v0vgNgE8qqvvdkPTpKLxr
X-Received: by 2002:a05:620a:8391:b0:944:204:7e46 with SMTP id af79cd13be357-94421679aa8mr340816485a.20.1793367549343;
        Fri, 30 Oct 2026 06:39:09 -0700 (PDT)
X-Received: by 2002:a05:620a:8391:b0:944:204:7e46 with SMTP id
 af79cd13be357-94421679aa8mr340808285a.20.1793367548624; Fri, 30 Oct 2026
 06:39:08 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com> <20261030-hawi-maili-camss-v3-3-9742bca8cef2@oss.qualcomm.com>
In-Reply-To: <20261030-hawi-maili-camss-v3-3-9742bca8cef2@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:38:57 +0100
X-Gm-Features: AclHuK_-EUrkM1XNUcr_Url0Uwx1X3rot5F_HGx50SCbO4oqaf02oTzKKHc7lN4
Message-ID: <CAFEp6-2vN5UEbSwDH91eUzP_w7DHd3WtuLnui-_k7az2oQnoHw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: media: Add CAMSS device for Hawi and Maili
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: GIGXNMa2lSJpsCtOOqXBJPhPPAjuQ0-v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfXycFLTwqFZwDJ
 9MJ1yZDU/Bjijm1eowSIfaI1Lza8udv4kpuwlrtIFHrPFPsTwtwji9iraif2jKiF+ku7jZQmXxv
 UxRdeogoTiG/UnPRS0PBZmT6J3lJkgs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX7TuQOcUqmh62
 RsdtiQxtkXlBYdOyRxrbp9tFuVOVBppbFNU3jSWwcd8NGzVaH3sZUXyw/GM4XwzibTI4xPIh/eZ
 tOfLf9ZuVbKpROkvnu1r6PQtUT/M/+W42hpoL5kUmYZYh6FMd+w/iwc9K/tDONm1kw/LtGKoVFO
 zFWZrltVR8YT1hZzTQMNnkfrWggaNnNo5JJI17NC6WQlen+kuYSuuI4syi6JjBvEEhJjyav15Dw
 78S6Ineu36LhS9pG2eT+QxY7jb3EJUvrWH9Uhyp64a1wRUfpo8KApfhQ5yf8rf/7FVRh7YXlIZY
 FMHzTTiQG8Erhmus33YYLZEqp6akUQqkVKUV7KhC2gEnv0Mn4bGZ9JUYlVvggU1XIwZF4wJtfUt
 GDzMw0UdId5ubtsmDnNj8V5RhtgFdoeim46QQuB3OWh8MlCXoUfnmAgKCpfai7L2KPwizRjUFP/
 F/dLgg2ZbxHT8ab4z2g==
X-Proofpoint-ORIG-GUID: GIGXNMa2lSJpsCtOOqXBJPhPPAjuQ0-v
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae49dfe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=x8rGuSE_rcxhvlVRD_QA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054

On Fri, Oct 30, 2026 at 1:43=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Hawi platform.
>
> The Hawi platform provides:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,hawi-camss.yaml | 314 +++++++++++++++=
++++++
>  1 file changed, 314 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml=
 b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..32c1cc59e8767b8b03f6947f8=
fde83d3e7410125
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
> @@ -0,0 +1,314 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,hawi-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Hawi and Maili Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> +  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,hawi-camss
> +      - items:
> +          - const: qcom,maili-camss
> +          - const: qcom,hawi-camss
> +
> +  reg:
> +    maxItems: 14
> +
> +  reg-names:
> +    items:
> +      - const: top
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csitpg0
> +      - const: csitpg1
> +      - const: csitpg2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  clocks:
> +    maxItems: 26
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_nrt_axi
> +      - const: camnoc_rt_axi
> +      - const: camnoc_dcd_xo
> +      - const: cpas_ahb
> +      - const: cpas_fast_ahb
> +      - const: cpas_mnoc_hf
> +      - const: cpas_mnoc_sf
> +      - const: cpas_vfe0
> +      - const: cpas_vfe1
> +      - const: cpas_vfe2
> +      - const: cpas_vfe_lite
> +      - const: csid
> +      - const: csid_csiphy_rx
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe1
> +      - const: vfe1_fast_ahb
> +      - const: vfe2
> +      - const: vfe2_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +      - const: qdss_debug_xo
> +
> +  interrupts:
> +    maxItems: 10
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_mnoc
> +
> +  iommus:
> +    items:
> +      - description: S1 HLOS IFE and IFE_LITE non-protected stream
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Global Distributed Switch Controller fo=
r IFE0.
> +      - description: IFE1 GDSC - Global Distributed Switch Controller fo=
r IFE1.
> +      - description: IFE2 GDSC - Global Distributed Switch Controller fo=
r IFE2.
> +      - description: Titan GDSC - Global Distributed Switch Controller f=
or the entire camss.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: ife2
> +      - const: top
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-5]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input ports for receiving CSI data on CSIPHY 0-5.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,hawi-gcc.h>
> +    #include <dt-bindings/clock/qcom,hawi-camcc.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        isp@9253000 {

Address should match your first reg addr.


> +            compatible =3D "qcom,hawi-camss";
> +
> +            reg =3D <0x0 0x0900b000 0x0 0x1000>,
> +                  <0x0 0x09253000 0x0 0x5e80>,
> +                  <0x0 0x09263000 0x0 0x5e80>,
> +                  <0x0 0x09273000 0x0 0x5e80>,
> +                  <0x0 0x092d3000 0x0 0x3880>,
> +                  <0x0 0x092e7000 0x0 0x3880>,
> +                  <0x0 0x093fd000 0x0 0x400>,
> +                  <0x0 0x093fe000 0x0 0x400>,
> +                  <0x0 0x093ff000 0x0 0x400>,
> +                  <0x0 0x09151000 0x0 0x20000>,
> +                  <0x0 0x09171000 0x0 0x20000>,
> +                  <0x0 0x09191000 0x0 0x20000>,
> +                  <0x0 0x092dc000 0x0 0x6800>,
> +                  <0x0 0x092f0000 0x0 0x6800>;
> +            reg-names =3D "top",
> +                        "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csid_lite0",
> +                        "csid_lite1",
> +                        "csitpg0",
> +                        "csitpg1",
> +                        "csitpg2",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe2",
> +                        "vfe_lite0",
> +                        "vfe_lite1";
> +
> +            clocks =3D <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_DCD_XO_CLK>,
> +                     <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                     <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_TITAN_MNOC_HF_CLK>,
> +                     <&camcc CAM_CC_TITAN_MNOC_SF_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_CSID_CLK>,
> +                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                     <&camcc CAM_CC_TFE_0_MAIN_CLK>,
> +                     <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_TFE_1_MAIN_CLK>,
> +                     <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_TFE_2_MAIN_CLK>,
> +                     <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
> +            clock-names =3D "camnoc_nrt_axi",
> +                          "camnoc_rt_axi",
> +                          "camnoc_dcd_xo",
> +                          "cpas_ahb",
> +                          "cpas_fast_ahb",
> +                          "cpas_mnoc_hf",
> +                          "cpas_mnoc_sf",
> +                          "cpas_vfe0",
> +                          "cpas_vfe1",
> +                          "cpas_vfe2",
> +                          "cpas_vfe_lite",
> +                          "csid",
> +                          "csid_csiphy_rx",
> +                          "gcc_axi_hf",
> +                          "gcc_axi_sf",
> +                          "vfe0",
> +                          "vfe0_fast_ahb",
> +                          "vfe1",
> +                          "vfe1_fast_ahb",
> +                          "vfe2",
> +                          "vfe2_fast_ahb",
> +                          "vfe_lite",
> +                          "vfe_lite_ahb",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid",
> +                          "qdss_debug_xo";
> +
> +            interrupts =3D <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names =3D "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite0",
> +                              "csid_lite1",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe2",
> +                              "vfe_lite0",
> +                              "vfe_lite1";
> +
> +            interconnects =3D <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_A=
CTIVE_ONLY
> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_A=
CTIVE_ONLY>,
> +                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALW=
AYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +            interconnect-names =3D "ahb",
> +                                 "hf_mnoc";
> +
> +            iommus =3D <&apps_smmu 0x1800 0x00>;
> +
> +            power-domains =3D <&camcc CAM_CC_TFE_0_GDSC>,
> +                            <&camcc CAM_CC_TFE_1_GDSC>,
> +                            <&camcc CAM_CC_TFE_2_GDSC>,
> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +            power-domain-names =3D "ife0",
> +                                 "ife1",
> +                                 "ife2",
> +                                 "top";
> +
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                port@0 {
> +                    reg =3D <0>;
> +
> +                    camss_csiphy0_ep: endpoint {
> +                        data-lanes =3D <1 2 3 4>;
> +                        remote-endpoint =3D <&csiphy0_out>;
> +                    };
> +                };
> +            };
> +        };
> +    };
>
> --
> 2.34.1
>
