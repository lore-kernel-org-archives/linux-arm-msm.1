Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78374364045
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 19:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788551721; cv=pass; b=m5BK2epfYx0V+TP/QFl8MtparLwFoE1stJdi2twciz0OaXkGVuAy463IJGuLwDBnI/AYbHu/qvnbKGFeCY0Gf7CYe2YqhGP+2+kignWJG6Pqn8WlqB1eL6aAGTmm0oTEbP8hwy9F+aHXEv0JXsoZIMA9S6s8fhCzB/5S4gm5P2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788551721; c=relaxed/simple;
	bh=Cuy4oNKyaJF2ZdAr5zW3Dz+9GPWKnBVFeBK1jrQaFGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BKOCA2jIFAJHQwMjVnjZPYrToukvD9xfQAGsWsbdlqWZYUxE0ds40HUXpTwLSbZCQGOdR2ga+6ncHAFyh+yMDe3CYhBNuORs+pQGZb8/kYcpXBaMTVr/+byC7ZoluaLNx1xHNLfn5nWlSAWVhUXvfU+NlRMRe3QsWF6legGo9eM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+UwIbQE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZGMSVO2; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+UwIbQE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZGMSVO2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HI8qf548796
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 19:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+S2fUNcs/9WkA3bU1bHtkI2dA6OSW0Car4DEk+gp/4=; b=l+UwIbQEhpKBzgLY
	uptB0RNGGwdGSX/uUdUjHSMXvRcp1Ny6If/J65idpGn5MtAwUovCWyZpYZQLkNQi
	Of1kwXhfQYcQv3+xfAcVpPlDnxXpuUVzAQ4GOv7MSEQ54bU+BwGDng4gN+QVsHhk
	zF0NLmeLK3go4dxt5klAgacaMsHs0VdBkqvV9I2JGJho8zYMhgVieMpq4iEw9/99
	3FDHiFTn3mehNx/Cr8Z8SP3CpgNYS9VCy83P0WXyerFYScO+33KZTh+8ucyfy+Ct
	FA8RLsBYSxxFjuXTWiROxGwFjF6uZdHlGaz33kAPBfD9HZ39u/gSeJ2fLXTP0elF
	fsR7GQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg0121s35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 19:55:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e38fbc5so231528485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 12:55:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788551715; cv=none;
        d=google.com; s=arc-20260327;
        b=OiGgvdndyXGKQagm444B56i4Zxzceco1qFPD+Z+fMkpgtoYL8d62KxVqBa2fKeJ2/I
         2H1BKi9nlVOFtvtBX99PLlX/z0ooUdV20RQZM3mC7IkIdHVVbwUb1h9NQ0DJboqzt17Y
         x4lwBQUjHS9VVJu1ChRGvs7PTHl2uJMacFfow9VfP7Hhe9viHAgVqqDD8bSqUWQ3lvJ8
         k+Dz5rvig2QCsOc4lboS1FTmjiQMpZxhQIFu8P8Yk7/T+pph4AlZMhQqf3YpFZ7a3TY/
         PWKi/NDOd5N5xTumxplRtOBzVdeVGyPmgHgCCoC081Y0DtFihNhshOiyTjIAkDn0vfPw
         g6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7+S2fUNcs/9WkA3bU1bHtkI2dA6OSW0Car4DEk+gp/4=;
        fh=+k52x4gKLCbCOaNN+k+/dN/j1ny+oqm7gjoQVXw8v1Q=;
        b=PVhU6MLYxLvLLEOW8nec/YY9T0RQlemCHMfYXTzhrXjsvyMW96G1wYc1+eaPAK4j4b
         X1nuAZYMxRNeXkE3gX0LxLdrjMlMQHbdT8UjUdDPPrZ7Mp2ZP5e9totDCuFixf4R2OwI
         s50JOs/Lj3rVwWhKWHFXbVzS6Q3I4u4fqqNCGvdzLQRbR9EUUVZlbHa7ltEap8MWVnq1
         /RjeFOuwltEJjm+/WIYczeRgbdqZW81bNpnv5VhEBIy/JV0UgF3O3rin3CQ7y5/uWlmY
         S4h2ZvmkHx5wWupugwm9d0oNbV+ZysnNKO2wcVZGcTRM7PRU2oQgRT7BJJoGMAE4upvn
         JnFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788551715; x=1789156515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7+S2fUNcs/9WkA3bU1bHtkI2dA6OSW0Car4DEk+gp/4=;
        b=dZGMSVO2HK7zY7/S8dX+pARokyGm12TijPDnyXgoAhU3v17OELXYdLxbpG931mlShy
         HFyxVLc5UG0KZaBMHIaPJDzacEwPrW9w7ivFG9DN7V1Qct3FqlxW6LgkoVv9mUGW5DyB
         poUJLD8DPQcjef926VRMixtl/XXnFKeUtuhZRA3R69ENUrk6+KphIRfkPFyurAT/wPc8
         O4+FreIfrntOBzMPcUkMe7bZVGMC5LusgpOFN7Y1uLFaGNsKu09BIfyKnzrh5GOmHWKv
         O6VLqGHVSCF6s1VMw9wau+E5agst6eDw1N3jwVzkGhjVpKDzH1GADcCaOfagYzfwctyu
         YtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788551715; x=1789156515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+S2fUNcs/9WkA3bU1bHtkI2dA6OSW0Car4DEk+gp/4=;
        b=gV0+9wJ3//+NDSf60eeAZ7u7oVThVMg1WNhRolpAqZHQFAvIO+Nv6dwghCxQ9TWKPP
         jHv2ytUz3KK5wOM99sSQrMveWMAsCSZX5nH03YcmYIygmbLmw2uOlWsaTzTIyhF/nKaY
         PjU+ik3wAyUrLKbbWWCLUVk+c/0W7gIQqg8m2B3kA34/gYHJe3H/aSxY3cXH6iW4Dgxl
         XFIClc5gPUx+vrbHKLjT1m95ZTjvZ29se380IJMAE4Y4722gUeeaMCvlCsMle8EmzNxK
         bDcFfzQ+iRgINPrxrMhu1MxkAL0YEewsOOd8LPV+lKUkWs1JjFAOM+Epb9S0mvq5B55l
         qbuQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+nWaxf/xitI9JevuWLbxSpI8WlRRKxAxNg1H+Kf7AcfeI+/gPNU2NC1LrxirQoiCm30hE30YBAC9FZwJj@vger.kernel.org
X-Gm-Message-State: AFuF++mr3QQMbby0odVkWMqXcWansXNcgSP+mWsIRaiF9mAuRy/izP0a
	AXe+gx6lPGmn4Bzjn5XvFfrP+v+nnEVntHmJQdvNij3FKX4yvHLHAtUsptCug7pDkPgINTJyz37
	1KnufoTggLUEyPglsaV+SbBdLuU/nvVDKKRLyQOpGRU+ibVnnLCCSHNvFT+F2InyC1kGg+T3N5w
	0Wn7E9mWhebD+5RDznFtNSIRJEjGOBWUAJ8wY+7ExWRHs=
X-Gm-Gg: AYBFou3gp77iT6q0Y1E/MzpsWc+E1bKVEo2fOHVBtVRU1Z5a3jLyv6X8zC4o6mnFtkR
	mTzmRluIwAMsdSAr7/XRGRkrPUEJhuLMBMATZbz4dVTqAt6trrOfSjOx/GoGbWaYLnfvpQno9vU
	00NHs2oPkAE8tx3jE/SEicjKmKYy58RoFpGosDDAhnvzmxLXve68RnoLt71x/tdUPt5u42KxAiR
	NCG2CMtwNqepXtiD5PPVE2ocLUyZSvpzVlCwdxi2TvwylNHjqYgNTdA3HXwMhjz+Rid0O+6Ado=
X-Received: by 2002:a05:620a:46a1:b0:915:9e84:85d1 with SMTP id af79cd13be357-939803a4a96mr811793285a.23.1788551715560;
        Fri, 04 Sep 2026 12:55:15 -0700 (PDT)
X-Received: by 2002:a05:620a:46a1:b0:915:9e84:85d1 with SMTP id
 af79cd13be357-939803a4a96mr811784085a.23.1788551714708; Fri, 04 Sep 2026
 12:55:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org> <20260904-x1e-camss-csi2-phy-dtsi-v5-2-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-2-dc81d85b599d@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 21:55:03 +0200
X-Gm-Features: AcwNN1W9wMgd18cVEyYOdj6YVkfohjR1CF5BB3XCNyAGw8QQbTcGw0lxRrgxPso
Message-ID: <CAFEp6-3EqEghkrsUMYtV=1z6n9Y+bPG9YHj6Wf2gOVboDE3hKg@mail.gmail.com>
Subject: Re: [PATCH v5 02/13] dt-bindings: media: qcom,x1e80100-camss: Make
 vdd-csiphy supplies optional
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE4MiBTYWx0ZWRfX+XNzfjM7g0s6
 fGpCaenyn73Q25LMho+gpv9MAxkP46kNavkkrwv0P187ZTEd6JFRYJTlKJzUfLTfbt9ZFle12EO
 vQH1snST9bmsRmdKjRFx7B+4qsz3fQ4=
X-Proofpoint-GUID: s1ungkcODxhWlNFamkfJYTxpvBI5VYks
X-Authority-Analysis: v=2.4 cv=LreiDHdc c=1 sm=1 tr=0 ts=6a9b2224 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=dr_jwI5W_23fGTPCCGYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: s1ungkcODxhWlNFamkfJYTxpvBI5VYks
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE4MiBTYWx0ZWRfXwppOOAXc5H91
 VoAPIJfg43VP3Rw5VBkbYPWOzw7qpEKmC1VLiKK42B/3114xEaPW9R16LjcDDPKWowF5kG+QKWL
 xl/C1eU1xUaz3RY40B3J5F/LHJgmOO3ZPk8hnoxfiQAv+LJRTYdIhBJo/OwXDSoMTmL1tFpizET
 yWskXBtnCUgXhfvS6JN6eWcvnIzw3XN5GadEKQFBJeejlIrvmMBp/Mw3w0U50P/wvSje4DjulTP
 2eVFD3L1h0owcEGX69lSXtN8Y+RgskA2Ks/aIQ/w2rDZNPCp3NR+1d+F8GDWV0eU4RoErXRW0A9
 rnyml1MzVmpskiN0qWqsRphmdTkeT3Fr+CIOvUEmvZoCIoVhA5gTNtlxTn77lvgciDnTWfzdnZT
 KjtIxAt3z9Y9ZLBOlFfTT/ivpj0UlejuYzudMKQVdhTMpBoRfCIJ/RBriv9BzYUQd2HqqnKI+AW
 czCtIDDFEdPNnDT/6Gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040182

On Fri, Sep 4, 2026 at 12:56=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> The vdd-csiphy supplies power the CSIPHY blocks. CSIPHYs may be
> described as standalone phy nodes carrying their own supplies, in which
> case the CAMSS node has none. Make the supplies optional; existing DTS
> remain valid.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.=
yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 126400772d028..57a838fe2d229 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -186,8 +186,6 @@ required:
>    - iommus
>    - power-domains
>    - power-domain-names
> -  - vdd-csiphy-0p8-supply
> -  - vdd-csiphy-1p2-supply
>    - ports
>
>  additionalProperties: false
>
> --
> 2.55.0
>
