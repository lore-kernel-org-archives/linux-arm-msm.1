Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794563684;
	b=NChBsiga1GLPhqLPDowxp0dYzCWpqO9s+f/QIWCKGH/0pa9/su6LEJ4EB64FTSnrG0yb
	 TMwBrUbdfvWLBBXRziFTTXKqzvJIQmAWpowc4vk/WQ9kGuLljHEjtssf1GeUe7cgI2B86
	 4bC6zj4xgx9oFAq73PNdVcd9oJWdSH1qeSa6EyUz/6YWd25405qJDTKSPun16OT6vfLuz
	 F3l1OnpGvLbpD2XQ3ATLP1As+8C9MXGieZWa1jxkzTy5sU82tc5Y0YRAAlzNApVnwrPpT
	 MKrgd93EINEqr0KSQqjNnk0gU7N29sDwsVeIcr3bjlzs2RUZOf7zeIMXUz6QRjKgx4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563684;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=;
	b=fsxWOt+uDDy7r7JA8zCcnVJofOOHI/z/vCy1c2IbqV+9G47cZoAfdlHln5Uo5C6QkYQf
	 +Gv9Yzh0Vcwh24Lc9twIBqLY0QuJg+EF3aAim1ySXP0GWWkYpPbtOZZ5fMpd+dn97zGyc
	 fVXfzFhGJ80N86vuDpsijlN7qnd97uNYn2hI/3DSmIsdP/HyWHPxTob+0iXKr0tmz85md
	 wv80HWTvC088GrHtDyWIYVTnpwFLZoVV0nTveJ73iPHT/CreBfhVhnLMxEJFZVlbafkt1
	 9yEOR8L/zNsqbsA8h39KEBqGn04U2DaiY7CyeuT/7UYnT7XBo5D6tQCtJ6BTMzES/9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="n/9+4myU";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLBeZ0De;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E039606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E039606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n/9+4myU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLBeZ0De
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8UwRa3619871
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=; b=n/9+4myUxHJ2L4b3
	pyRYjtpmX9OVXRcZ4u280wcXS0Wh6f2eEI0+P3AfccewIz2022OOhjrNuJYYSAPo
	Pwin2RNBFEMUw85K9fngCx1mpeZXl/my9cxXS/uAkALam5gVWNwJ2+ksOCxZD1rO
	NZeN+ZuRx0jYzszyM5TqB1YFgM2z+0iZT/B7/SQ+sb0TAAbEaZ1oNJxU4C0uH95X
	5LqOoJiRM6tP+8b/8xwi/33ND75GBqiBf5F9ItCeF+ZSI6NpRs+opJRgIab/7/XK
	8fS2QaneQA0RIfIlxcmytR1czXWTIv7vCoGBsoAhN8rKUyD4a9g8yKm+QDih6YAx
	p1q1Uw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja8ugv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:54:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495c71055bso7152185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 01:54:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794563682; cv=none;
        d=google.com; s=arc-20260327;
        b=LlbrXIURCEhfimkuKdocra/4FL09U35ckRFE7TZ94oolyQcdAfXor/PuifAY/4MWbM
         LM3fqPJmWIwOwxnyK0wM7khf176VlkGMPOwvmtSZXLaEI6/AyxGGwaUvxhA39psBkQRx
         6UBuo3E33YQF6zChJJzWNbFSoTkSVhfTOgM1riNQ62du07SC45l+8nQ/HJGre/AthPXe
         BkcAgr4LLD9jAb7z4lIOoblH0dIU7B1sgaDzfrX2X4qq2FujCyqhtog2QW++a2Mu5T0W
         ZWwFwIZGV1VgCGpNcPfMSbwIwBoc0AiVX2kwQjN8D7mJyb7rxESYOUeYk4tFTA1hql3S
         YjWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=;
        fh=TP6wROvND2W4id7TLce2d7CtJwnmtq5mOlaKbGCekjw=;
        b=oxvfL+WaS/emXM2w0ARa1GU2qIVot5n06AaZrXjVfKPFw1PgEnHN0IpuWe3eS02/xS
         s99IkUK2MRboVdK08fzieYRBN6Q9Re9Wo8jdZP3S2AdVB42yf5xUMXVr/PxSA0f4tgix
         sTXDuoit1W1NOyGuznB5ecXJOz3p/6fhAbeVQXIoAYhTx5T6lVDxD1Nl+ttd8+iYLslw
         VG7Dhs+MIXwYrNeb2E2aOfbMKntO7U5c4wg7HSK5w1k/JWv7xgsAil/tCyeh8/B3AZTj
         ppZNlYiOpZT1peulR5XQTYwrUNvyguLvMj0X1Dk48x7pUYuMBKAy15Lx2rzLl7XEwKxk
         pnOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794563682; x=1795168482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=;
        b=RLBeZ0De+7RfEvY/cOZx6uuhMrok2LGsjpSfyI9vkMVjG+2kzDGSlBwlDBJuHVYh7i
         Lpw1rdz5m8VFzNV+vd7Y7HOLyeLlfEZu63TB6K1OfXOHJwBigAXiCUFKVMiXK5NYkqKg
         D9a5enkb/wVX2ZstPRP0v3SykFvQASPXZe+RAkKB5UGcwe7YJkj0HRZPG5oC51eeCVUK
         r2COxceOd0Rzvs8eiuuIFDsbxRr+xAxktiPn0tl8o4OSv11iidiApFjZDKOm78ZmWpr+
         8D5e/e3ADFKmQo13eh7G2AjnjWTgMNRumYcgtedVcRy5v0hFgIVJQGSVmfPAiei3xqkw
         wPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563682; x=1795168482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=;
        b=J+z4yG7msrjd4ykdjnBOJs9qzpWwdt7Umf/dYATqZui7ZBKLQkB6FMPiTvMr9Ou/vA
         9PPO2KrACy2o1iprH2zk7HrOXQvWwWz7q0DBWEe0tJnPNN12nTrlZJNO14IePBgXRNjr
         dTO3RNymJz43yricSHFqgWhSnLviI11imcvosugusFn2EhtSwPIm1J6cL6IGezfCW3Rf
         TzABhmoL+D92aEmm4kThPO4kZgRsEPBwJVEtETrA7qlpOJ/w52pMUuWpzSh8Z1VQGJsy
         g8wtXdzyPSsVHK1fK7/NRResPNtM7mF3uK4T9VqEHS+Yr417Bcsn1b5V7Y5G30AilKvO
         sQRA==
X-Forwarded-Encrypted: i=1; AL+hErGaBiUR6Jk9WnN1BxucZMUbaxf/FC2OnL5fWb7nIvzlc2tVUIVhE6g2kILE+gtB8jDgcBAaYbNUWnJ8Xtmq@vger.kernel.org
X-Gm-Message-State: APuU4Z9IXnwsb40WCdsd9cy9uHgcnRuXJlcCH0wADimEgPbMH13/Qby7
	jOVqMSnf9m0D9tQWf7Ihyr+WhwJEFjKk7yLKdpvbsdHGEyGHMUfK8Crv6lzYllNDU7rGGnXDdUc
	XANhAHE1n2q5pq2AW7BXv0aL4P10dczpsPR0WZZ8F0jgePEyDUqBxrusIeQGyQYSVbNbGhwwi33
	oQh967q1hzq2o5RTionPmq+8dR/wP2Y8Fo9hQAdTjcLUs=
X-Gm-Gg: AYBFou06v3rsBOqVaiST/8pXiOEK6fGU6J3zjLiPbmtPBU/84QZZc6aFUjvpvzaAjr+
	w2aQ5e8cxnD1PF2L7YtoiyHWApPWY+nJZQPdwhCQYVB2Cb1MjmvTcT+QYdFKqOiziNRgzi40jHu
	oETkd8dkYpha8v1ae0JBZIoETdZwU0FKsIojkPt67Zf/EEE+i+4GF1Dc/Bx3pIi2Tfk/Os7nLfS
	IW5P0aHwj66v5lAWNhiJW24QcTeipaDJnBW7jPsf0HFEvJJdb8mmO4EDh0rz88U4mlqykJVpCjM
X-Received: by 2002:a05:620a:1a29:b0:93e:942f:b8a5 with SMTP id af79cd13be357-9494baf6dc6mr335666685a.14.1794563681680;
        Fri, 13 Nov 2026 01:54:41 -0800 (PST)
X-Received: by 2002:a05:620a:1a29:b0:93e:942f:b8a5 with SMTP id
 af79cd13be357-9494baf6dc6mr335664185a.14.1794563681101; Fri, 13 Nov 2026
 01:54:41 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com> <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
In-Reply-To: <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:54:30 +0100
X-Gm-Features: AclHuK--hQiioKQaB_FA-5QovlmCsdFTukadEaIJn5s3vWyrV73NAS_u6OCE7JU
Message-ID: <CAFEp6-2Twta_X4nyQVBa72zj1uaeGiK=F4j2edZFJrXA3rmtFQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: aqEUyyU3cG_nPB692asW_siqMRAGiAyq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzOSBTYWx0ZWRfX80GKY2Kr8oJo
 mAp/FXJqH7yLjtlSKk3GmFKfPIAmxbnswYy1+PfvZnl+wzvLYBIYw17tJafcF3thMxTbLGwVWB7
 mXVt6doaKTRrMD3l687Si0mDx/o20yg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzOSBTYWx0ZWRfX91O5ykQo2rJb
 bBEJBTFVQTzOkZDHI8maqMXtHcHjUS3WdRvXoq/Vqg84j7JGTT9FV2XCxGfWkbi9VwMcXKUq7U3
 OPPuAMRx97vTGcEVNYafdg3hI1wRdI2BpQMwF/Ldtg+on2fbZcyuLJi3JS6KsGsKAuoLWFYvXUG
 +vCDQXH4HKBW9hxbeGd9V3VcCCd0x3h6mFEZjneYWJW0pxnyGufllKNVWBL/O2QcClcXDEqm74F
 8aC+NAh3K+3JyPRQccBbHRPwRJF2DTxcCwJHYSi6lJa/YLczR7W0QKnYsXj3Y1QxHFLj8dOdwz6
 N5k6Anxb3fwKKGfpkvxbo7hUrASuq2KxHgVoS6eR+KGPT2VLPN3/xb979TK5CYVt+DOf+9sTdsU
 LaMpDSvnm7ERSuZgu+/WeoZ+2xon3owtWaG3V62GSsTApfxWzHBSeKuFSv2VD4O52kjMhcI/TBD
 jAeo4eH32UadEMYuGKA==
X-Proofpoint-ORIG-GUID: aqEUyyU3cG_nPB692asW_siqMRAGiAyq
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af6de62 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=x832WoCsc11X-eU8GdcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130039

On Fri, Nov 13, 2026 at 9:20=E2=80=AFAM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Glymur has only three CSI2 PHYs, so there is no port@3 in the CAMSS
> binding.
>
> Limit the allowed ports to port@0 through port@2 and update the example
> to use port@2 for the third CSI2 PHY connection.

I know you put this in the cover letter but you should probably
explain here why you think it's ok to break the backward
compatibility.
Even if the binding is recent and we don't have in-tree users yet, you
may encounter pushback on this.

Regards,
Loic

>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++--=
-
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> index a0b77edc212319fad69113f3d55ca24f184d4b23..18a38fc4f9025f6b927780f55=
ed4fab194091c02 100644
> --- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> @@ -109,7 +109,7 @@ properties:
>        CSI input ports.
>
>      patternProperties:
> -      "^port@[0-3]$":
> +      "^port@[0-2]$":
>          $ref: /schemas/graph.yaml#/$defs/port-base
>          unevaluatedProperties: false
>
> @@ -288,8 +288,8 @@ examples:
>                      };
>                  };
>
> -                port@3 {
> -                    reg =3D <3>;
> +                port@2 {
> +                    reg =3D <2>;
>                      camss_csiphy4_ep: endpoint {
>                          data-lanes =3D <1 2 3 4>;
>                          remote-endpoint =3D <&csiphy4_out>;
>
> --
> 2.34.1
>
