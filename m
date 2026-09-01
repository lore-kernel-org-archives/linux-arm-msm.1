Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E3736E46F
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 15:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277586; cv=pass; b=ka6FGXfiToAofP4M+MBbLNvcXeszB5CpzxsqXpiSvukvXuAlar7/vS+uRNI1nhlGti1mBHRpxPMic6l0lNVG3vk824mq/t/ZroVAeQ1/WUbwVKiXXBk4ahqClOcllF/AiiGd252sPghGWCJh/iNc0chrXCOhnzdXNoYaP6S1zFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277586; c=relaxed/simple;
	bh=XFUUQpQVjHmTX/OMS23vt6bYwXDq4wDECu8gMDnXyKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L3nU/4+FBmGzeuqQsFGAgUZ2pmext171BtLJd6WQIXVch40xJFYfrDifkTYBudlcsl9wOEPsa4cHLnoma8zIqkM3PXuYxMYmZIlcEQky6/G3umh3hvBcovJ7AzbQzdmZU+inta3MrtqyisoLI/xDPPnpAF31Mz8rMTPjBh+J1hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dn2uc+TX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eVIgAbu4; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dn2uc+TX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eVIgAbu4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8Xkv2145828
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 15:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=; b=dn2uc+TXd6LM8e5N
	jnnwjWOAapq/YOWMDaEoFrFOeBIDw9qcaF15/5VAmvOmGNMj66MbYV0ewcPRKZ79
	sbGACZ3oeO1OFMEmi9OwY9D9VnLExCHrvSRQF60SHV7whqMBhb4Y3eyOMQioBlJU
	vSHKPVsbSHUJ4VBy46m1vYsEY/GbkGTrUE7U3sa2vn9UGV+gDcYeQ7Cb4k/jnxHf
	eyfwOQcrcAfhaR5Lz/d7jIZ5PNctbJ6Y4Wd0AQ3TpgrivnL8mfG2r4ANoGujlQyK
	mD52DMquVUIMMAIxdpBS200NSUd+8D3eu+OmvNfqG5CkgfzxvbfGgs+9hdfEbblP
	lMRRCQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8uh55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 15:46:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso1386885a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788277584; cv=none;
        d=google.com; s=arc-20260327;
        b=G+q5qBjoEb23gHY7oBt3QqAI6e+Hg0iSr9Oml7W+9QFVgiBVlRPVfA0HpmZj6KRpxS
         zkPPYWJ+lYgj0Ehod4UOboQd0FAxznO7PUxYpgPPFfNwvXfGUJfAWZzSQjtpgwlTmjab
         p6ALPYYOp0T+3Smn+8rkEtnHKLUJeh1ATrbD9q3AwwMYrygh0kSStOOrGjJT7AAXHSb8
         JmY5aPAOtyJxkNIOu+u2wlfTOrakPcIWr0UvkzOAk1kcJzE64wOCe+mAVdRvVGfqWSV3
         lo0U2MdAehjDWnT0DERpjMOw46V7577DV+pC+DxmEarEhlKtU8PM0CrA6BDCbZrs31qr
         dEhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=;
        fh=es+CINqXddbA1qTFRWBbaLUAGC/1XG+cnureaDNTsYM=;
        b=auXZwDjcUzfbww1FDSQZCpB3TJ+994L5A9Daq3YOFt5i2l4vtunWFzY3Elw7YHorFp
         994syG9zdr42cCbZHrhI/5nez0kVDs2qUaVr1alsqqIoKqjX+DvqY9CNiG1JU96T4+vw
         5lpIs3MxtKwrOMGay3W/E36jo7aiWWqSpJJ7sQ2jiNhQLBp7J06ioTYnyOO786C3JeLu
         psjMmcbW8dTt661FZmULppSp0pAogRHrarH6+RHk5ovqB1n7DpnpgAQH3qRYfyAfgiFY
         KxeC1zEcoSnxIcHIzOSeQUCnRzxSVKag9JKyBXlfM1Y1VnTa4DSXRaN+ZgXzfTCUTCC0
         pv2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277584; x=1788882384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=;
        b=eVIgAbu4HFPHFu4TAvgA7+2S2sT3XmJdp2PwB5PpI7gzaogiPEi4A9BIjMD/RnIBLs
         CrLqEbFMs9/ZDXaJdlqPE07GWJOJZmeq1XAN/X2xWPIPF598hSWsqgvmZJi6SDgB3sRJ
         F9l3ne/kItqtbKhyrq+OnTsL0erdyT8QAjc7apisErp+QFJ9pvBGt1G4FD0dRRVLU+Vo
         DVpL73yMt2e70+d4kCIu8JfCxO2rRWMdvnMIUqDbCM6jH2prYoA+1TvmvBF96YVqvJvO
         7MkjEvOfNP+LxYue/UwbnLBkWH1tMFA+MnDbQmJrZvxJRdcOXIdMGKNXGUoqCtzHC52b
         YoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277584; x=1788882384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QAZHbB+c1KWBrH19DXPv7Y0Fcx+ytwVPsa2l7SjZi48=;
        b=kxYSZu58WnMGW/a64tq76SxtY6jwJ5/k9NwP5rXS8LgjM8AkRjgGVEECxKwvGAoo/j
         6fouArLdREfD2BbFS4E7BGGoITGPjrmZkOKAqEg7goaFoAz8wciv9gndlxdnk1UuCWyn
         rgR+cnIsbWPHaaQIUAqn5Jr8BnoHznmVWDgK8mCDyxBq7M6uFlOCRntt+Me261OcOVv5
         lXNppMEOq7c9YrtqY57n+P9b44XSdB/sQxtPbWoj8IjB+0UHsMmcAE1zgst9Z6MfqGoD
         TW4s53kAdQ8BBLdLTS93jcaUZCcAZGlcaRnBNb59si1QzGaAypLnvykmydCudyZYKwyv
         RcWw==
X-Forwarded-Encrypted: i=1; AKwUvBwPy9O3mLANIq2faf/LyEr/L9UveMJwWgtkJXnztksHtmsJ72LYyXDTBMTaahisZ2FfahVfP1RguZxxSElO@vger.kernel.org
X-Gm-Message-State: AFuF++kWs0IEBKJdoXuNTAEl8Lix9AIy0HbpwsDF3RDArsAQifLcK93+
	x2qOf0CfIy/SjziBShYFF3wCiicuHSsQHkHsVrRyuY0yIDU2qpx0CgAXjnYaJOGxXm87mjf6ieI
	UzBWOi6rvCvG3Ul6kXqSh2yLd3tPaEiOnskAh1APou4e+dWx+KPHHgLFN9A16c9G+s8SPoUD9Yg
	tQYBN4EjD58bnLxmjFkAseA+BF0tQ7mXvesWQ87/dqFU0=
X-Gm-Gg: AYBFou33qJoN9AdXdCFkjXP4J1gh0yc7j85b2nZVUXzLClMm+k4WcjU3qF8AxOgkBEw
	QEy1B8TtL2Cn+mIAcn1yZ9ygP5JfAADlcKDvxvNekQeu4iqzBpXMgIGw5DCt+FWtf3rSiltIYdT
	5KtEZ3mcFw/bguQc2C1XXh0lHU4czKFws1/44/LhuPyYOcv0ZyuwJA4nQAPQ==
X-Received: by 2002:a17:90b:164c:b0:398:baa7:4c2f with SMTP id 98e67ed59e1d1-3990f79ddfcmr3891995a91.5.1788277583863;
        Tue, 01 Sep 2026 08:46:23 -0700 (PDT)
X-Received: by 2002:a17:90b:164c:b0:398:baa7:4c2f with SMTP id
 98e67ed59e1d1-3990f79ddfcmr3891921a91.5.1788277583296; Tue, 01 Sep 2026
 08:46:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:46:11 +0200
X-Gm-Features: AcwNN1UOgtX_S0RX4JszYubxSoHCtUSFoVM1QL-GMxkUwhBphaMhOq7ZdQsciOw
Message-ID: <CAPx+jO8u_w417z-z_2fkQcody_sYbijHWTowZ-RsKH4Yw3xW5g@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96f350 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=_uS-18hJZPm8K8KRSTQA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX7OB1yNezIxe8
 o4CVczMCoh0JalHMylWejB4nXsxrnMGTX7HKQOTrMWSMb9kTtIUydzJXyDrAVRX5ZO6eUuOH/Pv
 O1sE9Tjh+9VgPdqoSzXB79DhIRH8tqklgZKWo48NhWhT3s/LU2XfHpqERy1C/A9/IPogv17Bm5c
 Fudupe599nR6+vFCf8lZR3X93n2j6t9WurWEf0vMJRT+iP1Sgv1lrbjAJPfPgKXx0okySWoYqkI
 VgU3uZ/Cb3FXVxA3LnaCuMQl1HOrsmh92dh33X/8o9IosLKYh0J7W+jgIJpNrUVzBbqsVLyy+lp
 A8JrTY6a9huBfCTDeldyMASjdkAn3f1csKCwvX5PDRrTjIxVjJNPbfV6sFNr+8imtcflspbLpZ8
 PZwqIZw0S3Fc56am6+dgmogGu1hcPNJJa58hZmFCQYv/sEuPgS5msatA3T5uzdwDBUYn09ctPgO
 UpcImLpq8pl2PSPcR/g==
X-Proofpoint-ORIG-GUID: ufNZ9_OHwE9zAnKzfHCWjAQQE62UfoeR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX8sE3OPg/w3iS
 mDF7ATueu4GHG/7LFtXXykgK0CyUYR6c9nCS4kJG66yehR68epBkIHjHIHsgkpTgDlHU8NAzxrY
 UxgCICKS59nzmIG6AbfncP7WzYJIzkc=
X-Proofpoint-GUID: ufNZ9_OHwE9zAnKzfHCWjAQQE62UfoeR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010140

On Thu, Aug 27, 2026 at 7:51=E2=80=AFPM Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> wrote:
>
> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
>
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
> the essential SoC infrastructure required to boot to a serial console:
>
>   - Global Clock Controller (GCC) and RPMh clock controller
>   - RPMh power domains
>   - Interconnect (NoC) provider
>   - TLMM pin controller
>   - PDC interrupt controller and SCM firmware interface
>   - Devicetree for the SoC and the Kuno IDP board
>
> The soc: qcom: geni-se patch allows the GENI serial engine driver to be
> selected on 32-bit ARM Qualcomm SoCs, which the debug UART console
> depends on.
>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
> Changes in v5:
> - Selected QCOM_GDSC from the Kuno GCC config. The driver registers GDSCs
>   (added in v4), so like the other Qualcomm GCC drivers it must select
>   QCOM_GDSC; otherwise, in a configuration where nothing else enables it
>   (e.g. COMPILE_TEST or a minimal Kuno-only build), gdsc_register() retur=
ns
>   -ENOSYS and the clock controller fails to probe.
> - Link to v4: https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-=
dd34f235fc1a@oss.qualcomm.com/
>

Patch 2 and 3 applied for next, thanks!

[...]

Kind regards
Uffe
