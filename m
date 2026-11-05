Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793867907;
	b=ltV/wkrZUzWcAvip3cvkLldf7o4XryzOtH6NwQgc7kkraPcwS2gpFLwexspOCrdYti9e
	 qCbA/vLFHSS2Y63+0CsalOAMNieVJef+iMskFQd8ZzSShLyQI+koh1uHY/dG4RF7CdMKI
	 S0WdUAbJV7O9nIMjj/reauCLqYBb51vLZJk5ac1esC+ah3CypFFB5RADVOSQVWA/m5/Sc
	 /a1l0GpPlmt44Ak7vx1kh2xuROtEhvtgqmlKOn90Ce4uD1OJLubqgufj+9Kza/Nc1SwXL
	 RngyZGRFeKB31Do4eCsFopElxdsZT+0FiTs7bGaqCQ1ESLyELCrWGrHtzgdIDXplcTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867907;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CZU3+TIcrOhVuaVEBRSfCnpA3ZSr2HheVe8dQ5VOkHY=;
	b=mqbVNjPoxVs4ACzBss4LsMYe2GqvNGceCBEO8hhhP6ehbPfuMnDhHeTEsEZYMx9YBr5B
	 Ew6lusX5kxq4FCN+MVgDa30OOHSJKApS9OpwkgieppAPuZ0EsSqu3A2V4ppSp5f/+Nbc5
	 ly0TZUzWwiBjkpHfKKB0tRV5ITATTBUQ2wNz5Y8KMCahednwQHIr7ffClFX5tshKZKPYi
	 C0h0ji9h9qhmg6mluIrcBmj23ARCKx2rvShp8vfMunHn6iww/R0Pn1yVKlBmnzTZvMbyz
	 Fj5PCMVP/E5YFuybFogOkNZpEEcuOCUJwEzE/+HuAxrJy/XjA5zWPXNeeioiO6c9RJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MT0bcWVw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PpAqXkri;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEED606A326
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EEED606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MT0bcWVw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PpAqXkri
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56Ubus3820274
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 08:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CZU3+TIcrOhVuaVEBRSfCnpA3ZSr2HheVe8dQ5VOkHY=; b=MT0bcWVwxNd47Za4
	3xN7qRK5eT9NaFg7k1a12Nomu/0HGiWDMCDUHklSBvxgkbG0ir5ud3AQCoBkDxRq
	sJFLePHQ2zy0cHlxOUpYvglzSrCLb0Ax/wxBEPrXVJMVUolOH68ZR80HrE9rCm5T
	5ICHFA87XvLFtIN5A58VhPrP0KQcSu5itmXDgpaZfMpBSispwxEegH5HzQDs8aL+
	9uXDvfUbU+8/NbU2eg/QkdA7CluMhzKsOSikqHGhVGIEGVoRiV55orVHYYUJHSwE
	YH60u4G1SNh9tYm/p6VncNZwDdig5JFLidOhaXyfEVPmH/wGqQiKaHYZ4Ye0dqAp
	5arn6A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hra5tjyuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:38:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e49a1d3b1so414457985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:38:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793867904; cv=none;
        d=google.com; s=arc-20260327;
        b=kKbFlp5uOmw8QB98B4m3bmvzoSh8BVorDeAZzuriK8/0yTF3tl5Q2LVcrZ0nf8nPxp
         Eq8lK3wv2OvzrJKZtTPozqrLeaoqCVwxrLyp7WzMwdjjL0ofK0XTvZFLnDop0KBaLvHk
         +4hn+4uuYnH9yjjY0YWaziw+dRQ8dLwqUk+hkw/gyi7PBNdsNiuZEwSHNpTd4zcHNfk/
         zzxboUzWelcG7Fr/z6YkvSJkhGDzx4kW2vujNI6pQqqjuh/tjHl43jkdUl9H9OMFwp1e
         VnTpKS7nSc4VcJimCfvNzdcD+R+PXdpsSfJJtcEXePb/qhj/of/jDQNcIX3Bcn8lG3Av
         d9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CZU3+TIcrOhVuaVEBRSfCnpA3ZSr2HheVe8dQ5VOkHY=;
        fh=5/II77uYbwEZE6PDdbH9NWlzzqNnX1v54dZN5KCpMrY=;
        b=pPeH2ZPUxYO6uuyZdFEn6eaCbJJA0GilkDCGVwoo6umDIdeh0YdOuPbi9bV/xw0BId
         ptpma3OeTTKAzimmN8DibCLK4NhfePNHae1DUi3QjdIlDMsYzLvCK9x17s9mUEuLXCB9
         KZp2D5HBlvoMLqO0h+/FzS7HK3vfEfikR09AJFzg7GqOilgIt0fNLVptboULatkCA+9B
         DvBhoExa4g0y5DmQxTfFf4MZvLsSgXL58r/JjNlfaQ/r3gzj8L+1MyBGsXRHsI8le0jF
         dKVgAEZj0U9Sy5Z4Pxg4qSGe3HB9P/KytlevngEsmzgCp4he4KBymWm7V+v/XiUAeYST
         4qgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793867904; x=1794472704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CZU3+TIcrOhVuaVEBRSfCnpA3ZSr2HheVe8dQ5VOkHY=;
        b=PpAqXkriQntDrPuY3ZICEBJ/ozr3kUcuGRVFjg+8CJ0rloo/ucAdmx8RtCdzVN0wlL
         uPCkfD48XxOC1XH50Q31GSMfoPelQJa60IWGvuy9SlFU+pKM7xfFxLsBXaJoZNVO6v0o
         lTI5jx6s6sc64KYQ1aFq70PfyrX1EnIVLVgfSxYX79JrAgZTLXn8QF7zlZBSEPqC14yz
         C5XSTCybAlmO1mgnlspWgb32Vigu4H80fSNRJnKQ9zTw8bE9nUX+h9c4HcfzAFFVu5LO
         fEtVR5dvL5sBqGNfenS7rjSEXfc5iW4PXbX+NtmqpT98JaMdBLEzlvPOTY4ImFuTvjNc
         9Fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867904; x=1794472704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZU3+TIcrOhVuaVEBRSfCnpA3ZSr2HheVe8dQ5VOkHY=;
        b=pRC8beSUk5nhK+zaRybOYubELDLX5kaxejacn4quXdE7lmoUxixjPKrmJ5jTS0XPLw
         /PLNysWiX4s4RsE8pQnCLZJ97NU6mp86G0HrkLSkAyC+NGO98m/Uzrf2BaH3ndPLmMAX
         lw5V3Yod57e/gyMN0d7Ljsv7H6uj3kV2hsbKz5qmvMY7nrR/80teHg+UhmwOojGWJHj5
         o8q8wMzgUn+WbZI+J1edEAJzK2/tX8Pl0Q6kYi/hef3OTrGbQ1p42mZ8Alf4xJRfZKIM
         zF2P3l1jzz9xt12+kC/TO+OufkaAtHLrIzs1u5AV/KPYSqx/Pg+YZV8wnhnigrXcgo3+
         UBhA==
X-Forwarded-Encrypted: i=1; AKwUvBx+ty0WtIyNjf8buFl6zp0zyStxZX1pNjTNC7uyY902azUWjEs3m7FH74DTYahzyIfsyF+lLc75fEqiWAd1@vger.kernel.org
X-Gm-Message-State: APuU4Z/IMv/6XLkqn+WMOWqVGVxagfndH82jMvXjdxsY2CSHr9AcWtz4
	BAYAMtC6WwcmO4DbrkQL+OAdjBIaiLCGpLr3VZovLPq9hdVPyZ4bZU4FDqz96Pe+IBf6G2K0qo4
	COUv0rp2LjHQdJvBzzrpB4F9KNtPvk6Qr07XU6ypl7tUOzO0Fbh7pyZFuRmSPXAG0+63mBiy/pH
	UL++IJ3YKTSpgQmaBSyRNNIYsLegkiLpoJL1n3b9vbrj8=
X-Gm-Gg: AYBFou1SVFD1JJHdXLy1gy7FZRWq5bwBhBi/Rc4ChJ96rShJbKlAYLieprHJsf0GRV7
	8lmM7t7NSfdDJr06NYASzU6to324+b3/LTxKcyS60SSjDv9/2H7AUyV6DQWpZSIYZqmWsfSXOik
	2FRJV3kb6lyGdS3Ir+hAp8XJwJSPiimFnO0uGUDyCs3Gwhg6DMX/HobjkYZahKbgLHuUhR6e4bT
	PTAcg0iHzuGgjYouInlXp5pbJr943/X029TNgFJd/oXizqxphKNdXsU/+lM+5fTiHNat8xQ0Lcb
	n5x6YzpFfAihy8AzVVB5H9OPFM4S
X-Received: by 2002:a05:620a:444f:b0:93e:6620:bde7 with SMTP id af79cd13be357-94421712a51mr3342705185a.20.1793867904577;
        Thu, 05 Nov 2026 00:38:24 -0800 (PST)
X-Received: by 2002:a05:620a:444f:b0:93e:6620:bde7 with SMTP id
 af79cd13be357-94421712a51mr3342703485a.20.1793867904183; Thu, 05 Nov 2026
 00:38:24 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104230529.3040285-1-vz@kernel.org> <20261104230529.3040285-2-vz@kernel.org>
In-Reply-To: <20261104230529.3040285-2-vz@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:38:12 +0100
X-Gm-Features: AclHuK_XOYAY9o7oM-e2793fJtzmXvNCrEJQLGGzCvifJ5wF3W3-wOy2cPxKVws
Message-ID: <CAFEp6-2sv6AJhWqABPzQQcfv84j3VrR6+_=wBst9L5GdNZgQcQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: i2c: qcom-cci: Document SM8350 compatible
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNCBTYWx0ZWRfX6Lj7oZFybAZA
 hFNtzkmDQUuYhb9Ls4btBBKqXixeuUfIPmrwsNtgq2N1BqosbwcEqbt/J0F2nY4UglIrZHK+oPF
 UZ/vh/s+YyXBdJHS3I/zGfx26121v3w=
X-Proofpoint-ORIG-GUID: -5VX8Me7tkpo-sdb213Nlp1l658fsZxg
X-Authority-Analysis: v=2.4 cv=P/6vFSAu c=1 sm=1 tr=0 ts=6aec4081 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=-vm_nUme4f6pGPv4iSwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: -5VX8Me7tkpo-sdb213Nlp1l658fsZxg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNCBTYWx0ZWRfX/nOfH/YZ/VYq
 8nU3kpUd+zTGZv9KwbciNOOopEkFJr/PSfGkjQRzTLAn/OAXDsLYA7gZTIYo7oMHHn5lAyEiOwr
 JcgfitAV2/LUhBo76k73Icl9V4pqiF8uwLHs5SxjMCKcvBhfy6Zqrf6boeBb0FIglb1gnrVM9o1
 p6HeM0/BtiHpOxZxw1g34mxfSvlutpFzNhT+e0HbdI1igjo6hX63bbUZ5yvpP6/V6kLw3moQpkA
 CR+VLMzvH7vKcnRpMpoeyepXNpw6C4j67OIclg1JZbc4DofMNioJoLEPRIKqEMPjFbqD/D0z9ke
 C1gcCLUJJeTZH7opNohKI9hrFr/b0CKf4LCnUfP9MTSyMwhQ9O+1fdh1nPuWxL5G7uqOQpzFIRv
 WwWC369Van0sxHj3eXlEWs3Cpt9zuVJyiQrIIYqKBT3w/2iZ0tj0DNWbJB9VkyVQE3K4cZ8DC2h
 npMnFWnSN5l9TKNU0UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050034

On Thu, Nov 5, 2026 at 12:05=E2=80=AFAM Vladimir Zapolskiy <vz@kernel.org> =
wrote:
>
> Add Qualcomm SM8350 SoC compatible to the CCI device tree bindings,
> SM8350 CCI is compatible with CCI v2 found on MSM8996.
>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0e..63083e0bdd9c 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -40,6 +40,7 @@ properties:
>                - qcom,sm6150-cci
>                - qcom,sm6350-cci
>                - qcom,sm8250-cci
> +              - qcom,sm8350-cci
>                - qcom,sm8450-cci
>                - qcom,sm8550-cci
>                - qcom,sm8650-cci
> @@ -219,6 +220,7 @@ allOf:
>              enum:
>                - qcom,sc7280-cci
>                - qcom,sm8250-cci
> +              - qcom,sm8350-cci
>                - qcom,sm8450-cci
>      then:
>        properties:
> --
> 2.51.0
>
