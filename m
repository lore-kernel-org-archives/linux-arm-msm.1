Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84D73AE18C
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894281; cv=pass; b=tsTFWfOYu2XOqkMWdcFf0NrQ9rLUXFOJDbNoGl3K5pbfir1pWwQTz9Yoq3PfosRJqPLDrbZsrSd7EI4ReTv2dMkef9iBwqJq8NwWNi2tEcPvvxExT51taWOuHLMkEIx6NL3Aqgti5Zrs4eLqZa4Z547yeVcvaqAM6QtWtUcKNt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894281; c=relaxed/simple;
	bh=jUlJOAGscmKzGahwZhW1vZi2twtvH5CpgUlhI/gE7gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSYuM0ws2cp9+pNgRMjs7IH4cf8TvQeU/vo69sg4rKdmq1EUHdbsWzG56kXWvYL2JnoNtpyLTiM+1y8KWQF7r8EnrnEfiMonU20hzYViaLp+Xsg1iq0dL3iQlsth4reEnRIPLklMOlcaF178e4WtfoelJ3OzaJv0JFqx8w3bFlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jp7m5aax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPw/WDUu; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jp7m5aax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TPw/WDUu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8MFDg924262
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cBHSeEg5m78MeGq/62DbhP5UimRnwtu1lp97yd0gtxo=; b=Jp7m5aaxYj2xkdlL
	M7R8sMwZwwJMzHikLYlGEXwmc4Z4MQBVEeg0ZCnfSXIxjKxj5b1k7WxeZcDZ5nIJ
	ZZ2LcpaeMz0u9gZpZiH9LPEJ5qYLCB/raFiSeJr0wczRVeVyzwNbh5l/630XOVtN
	IV4Q874QRojeN2KAQWAZjR7aw5fJ6cipK9c318fn+iD6RB9RG6gTcpkBZL6fvMTl
	QWWAWly1d7Xm+iEEx29yKpK3cAod4ncsZeXlxi5ZX1sy80+HMAL+ucqentmfXQF+
	MApnxasg/u01iYFGniqdZemDlXvn2Ny5s39a1hEIye/3oABV4KCEtjZF6yrFO092
	lSNIgg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1tw90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:24:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5352436cd78so28584561cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791894278; cv=none;
        d=google.com; s=arc-20260327;
        b=b29bdUalB77kMtMPU/3lbat0ZUzpr9wIrmIEhJev3JZX89QnRdnr60l5oI85rmTGSq
         bvBnZp1PIkhSKmSHeaWdxslVVzXXicALEdT/a0LL34V2VCryAw5Z2zgQGhylF7EZLecE
         BRRWR3NeUGVwA/HRTShv6Zu3TpaSfElK4YXem+mYfj0akOG5O7wfLxnFfspnzOwD3ILt
         CuFGkN29de6aB9ejGWCsRz8IDREburFa/PjXfI21ZRNtpYkirkTX1vGdwUt93lQ59NM/
         GamWkW8znLUJE3eJxaLGyhDyj8O93lgTj3n8kdo6e0rvfZE47gzaewxAN7nXVW3WEo1t
         9XGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cBHSeEg5m78MeGq/62DbhP5UimRnwtu1lp97yd0gtxo=;
        fh=MtbOflI7/e0O5+iCGCUtzCj2zWjyhyewlexUofAJmTw=;
        b=DwxpA5ICBZbzommV5JNfPHcqqgYzGCxqvsn5gdaAJu+P+jaPsUOZ/elHeWu4QLNxll
         8i7vAwmZ+rDbLclRm8wFAbd/xO2btmZiKKj4twIb6vbgaO7Y+Z8FsjkrUkgwUmMhMAd7
         uGseNljWeGs9bhZRbjeacZttxTaNU8hfoKHLGShhXPyWeeITOD7hier2pmf4MmwlPNpf
         BbMLfmojX9O+t0RsYs81qkLKkWNUK8A0gTuhzVlG31DmdAL4Sgz00kKPXfq5MoHydWIi
         0dfTVQYUv/bj1un9J63Ymlk2/rsfwFgBW9QYw7sBz2g7/6fNqpFa7bUqC5qqoeYI6tPC
         ISOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791894278; x=1792499078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cBHSeEg5m78MeGq/62DbhP5UimRnwtu1lp97yd0gtxo=;
        b=TPw/WDUuZderJT2aqy6PMJm3j3giymVIjdm3fysctqOh5l5WnWxkNwoawNNJMkLaSW
         29NIbasby9lv39Idjx/snHxO1rsdJlUcdsNuLUfZnA6QSDsnaY2zfXNohhvGW/Q/prvi
         uTR1KwJ3m84kEO/gbC61kbFLkKvmikz073WC5DpDt2N3Tok41O0ZDvQSwupcDwDRHc/n
         6Y1DOo1murEzPSM2753YaQ+WqO3mF8tOaoqBiAEXvHRJXBBDjBZB2CQEfC6t8NwLZDTG
         +TCSrCkOj/ryUKOTG+3vRur1L+kF03vWi1XJCvyhg67LttgYLbxTisfIZ47Dp9D7O3qq
         F1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894278; x=1792499078;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBHSeEg5m78MeGq/62DbhP5UimRnwtu1lp97yd0gtxo=;
        b=IjYwA09dN0JOjyar9417GPuPcWMzTrRTfrhAf9QtiGB8+bqaouOtrAoEGZF1gpSk3H
         p+pdNjuglm8r00TZKH7MV2dmkEV7U5r8Bkq8clOAzIGS4TJaIrrv0cj5YKMTy+ecuTNx
         SDLsy44mp0bflrcK3toOX8LhSOVpNgYLA8aWH8JnylVGp63jJ58Myk4hBjdNWjcRVf85
         DK/SytjmpCiVPuMzjOCm9dLZRUYq0Nkl4vvlbVzUIJn1085bE5XkRhkZJ2qkomgcWrS9
         yxjcM4gBHvUFzAm6JVQhB8qqTzG+3MIJmPpaUIK29L2zzZvejeWqu8Is0XYkHo+cz6EW
         Ggaw==
X-Forwarded-Encrypted: i=1; AKwUvBzMHd2aKMdu9Hz9ffxzukq3reqVSeKOsdgLnn2l9860uw+UzFZ+qAK5u573x63DEaTahivUREG2tHVtgUFi@vger.kernel.org
X-Gm-Message-State: AFq9FYJwznL3Bp5juPVKoLoPJnhAVzQ0SNWfVKEdbktZvxqPhJ/pgsDa
	sJlS0Z/6UfeYb5wg+jw5Vn+UgsV8RIuvtpGPnP+sT0EsSSdYXHSbY3QEGCZkiareQmIb9R5665a
	J5Q73dV2uLwaUQisgXWix0VtspuW5h9wl1CPKrbIP+zT+PlZ3uOw1UAc/eId9TISS+BZmtgWlsa
	Ajdgwv2wddMM/7qHVcgZS/IYzerAf0ZDpxmvgvPsu/bMo=
X-Gm-Gg: AYBFou2X3bmDJdIT1QNdZG4JV6nQnS5p6wl+H9Pzr7/AJf6Hdi1S5jbVYdKykLw3PcV
	7/N8MMD3WZGuvNW9Tz/mYDA/rgGryvNPHxHyBNEDz0ySMAQAlZUE/DXkXXIlwn4keCNWUKWbZUp
	fBwxZybevg4+ixIC818ArUHGvaQdezeaDG6l56+oOrNP52S9POCiUfmsFTSx8wL4Cjulyx0mPg+
	i18JBa7g6po+6OwTl32y2jvlu3XF9AtJtJdsbdaMuOSxApEFSyWWJ2ncxoGotKc4CVX8+XlbxMn
	THDM4hrWbDNf8PVv5xnDUhqTIKZP
X-Received: by 2002:a05:622a:1c15:b0:533:21c6:f4e2 with SMTP id d75a77b69052e-5359fa9087cmr195111681cf.20.1791894278125;
        Tue, 13 Oct 2026 05:24:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1c15:b0:533:21c6:f4e2 with SMTP id
 d75a77b69052e-5359fa9087cmr195110711cf.20.1791894276755; Tue, 13 Oct 2026
 05:24:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com> <20261013-hawi-maili-camss-v2-1-fc93222da89c@oss.qualcomm.com>
In-Reply-To: <20261013-hawi-maili-camss-v2-1-fc93222da89c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:24:25 +0200
X-Gm-Features: AclHuK_DsaujXZKzgQcz6fY7MANZtkJtyyIAn3Pjdl47YmkPjme6QijlN0LMNHM
Message-ID: <CAFEp6-3LXSdAd5seGb1e7OZVYq1SFR+8RdK1Q6mM=2ZeZfM4FA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
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
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace2307 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=b40KZWPJp5KrgtGOUacA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: LvVx7ytCm2Qf0yBRxoIJ0_YZ1stQwYCp
X-Proofpoint-ORIG-GUID: LvVx7ytCm2Qf0yBRxoIJ0_YZ1stQwYCp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfXzuu7kzOi2PyZ
 MG18NvC0yyizM6j3ENuaNLZW9h3CQwdcEOqKTbNsl3DE4UtjQt9rU0vbkzDHq8VqH6JC1/kzj2X
 L1yiqEjbfkfkvCacEq08zqoI1xggjlo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfX2FIHcJTsyrEP
 qajDFDTLMDdoNBLRDEM83z+bXD/f+bjKGq+c3BET74Rg/1e0qoyCqLteUpU+V0wtSi/K2/Cl46/
 bZkPw82Bp9rn2FUCq733K8F0J08ZskI3k+MAX7IW/NgMmCDkIvX3m0VAIadjvMHskLTKrs+yL5L
 kc/F6KQLzObZH1CHvMp9mJgZJDug8S1DhRx6ylEykhKGD+oGPmyLr9zaH5D1uEmxcYnn5RSbpgt
 2Q+XkaTa0NtzrcAzKcH2GSa++kOshuaimMLWLDerkFwuLVOr+DSJtiOdyzsne8xQFSYUiAmBN0v
 iV2qn5y1HYquZT1XNiouYIfq1MicTIvv6rDh72XqejM9/R3kTMlNfo5vvin97CZPGk5k1yOrsl1
 eaSc0pgjenUQWibMcEphqjUlrUcxnrkg2A6B19d6zxz1a2A0oNMqUHAPTp9/4jRefhWLgHnYTS6
 zueGwDC7+SN4ksTljOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130049

On Tue, Oct 13, 2026 at 1:03=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> Document the Camera Control Interface (CCI) compatible for the Qualcomm
> Hawi platform. Like other recent platforms it requires two clocks, so
> add it to the corresponding clocks constraint as well.
>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..b2b4d4bcf780792515ec153c8=
73bace1764fb3e3 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -27,6 +27,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-cci
> +              - qcom,hawi-cci
>                - qcom,kaanapali-cci
>                - qcom,milos-cci
>                - qcom,qcm2290-cci
> @@ -137,6 +138,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,glymur-cci
> +              - qcom,hawi-cci
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
>                - qcom,qcs8300-cci
>
> --
> 2.34.1
>
