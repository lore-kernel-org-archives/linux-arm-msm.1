Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353242;
	b=YQJwEEVNGU1ze6vTOUqZNXJutclFmg4H1EdJRlswEeZgxBgzj/Nd7qnRJe7a4PFy5jay
	 HJmBGcCM69zxBOxz+3WlgxXc8JIBXOPuqVnR7YFvsoH+TXj/qc8HTac+O/rgpUrf0gz57
	 PT6eaJkz2vplJhHmKhEsmSWBYLaxSsTczurTlCZkb1tiEylGlySw6FBmIRgblLMSyccJZ
	 Sp3HSvEMB+tvSyPP285O5vl9TxEYDG4zspuBBVqHZWR5HekTWQMiK7R8gjnOWEW+eJQG8
	 BLQvtsA83RTQQF6Zmk/xS5yrm+wA08/yuitlYGAcnORH1oJaIqt6WhGnf+fIxJ3BRgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=;
	b=y2BWAjpU+lx43nkrKKBRHa9A6gJpy69zeBNE1FJawQk3N/xmoveyHPdvZ08bKOCBt134
	 2k4M62ByzwhjlQfC5bh3gdYenYbDV+ncY3yoiiI8S/fLXWnaBU37JyTf6V7ekKS1F5PwH
	 6AxRCwuKF0mOaOLLN3Qo9ybKHL1dnXS7wAZskYYEpLl5aIgBb/Ix81RpGMcqwO/6ks1Q3
	 DHXGAmtpz1UKm2TUNOZokwfJ+XFFmh5GRGEUUmETSq0d9aByI7sqdLkfx2sAckpZRLp5e
	 PnRsru879h/Tuj1ZBXIai5EcENd4WkO/bPauKGAMKQ8B2NqVB5eRi/rtLnUFSOiwODw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WDUyCTsk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FN5uMiVu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FE960A2607
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3FE960A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WDUyCTsk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FN5uMiVu
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F2pP1120613
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=; b=WDUyCTskAnFWcD6H
	yNvcJUWE4F/A/qbRutoL34bToGe02+HXlmv1F1CRPWAAQri30zm+jlTctGK7kGTv
	u6UEvMbQICt/EWnVZJhpuUaHwfuIxyvTe9DE5wywkRwG4F+uFn4tR2QusUenlij4
	rQjcLRRR9TsDXlTmBusCR9j67p4eDNcEaLbDt4mp6lSsLHTRdVIz97u3Y3/XK7y8
	AH4ok8+XLI+ZPOXlbyLCTXg57B93rOJaAdlRS3GPPZN4nqVasr8R1OpP8l7waXbu
	1nlf846OjVYCsdMMzttrjRfyL4wj1/3t8s2mWwf90IECJfKpT2fx5BNpmMJ+ssTc
	LN1YBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pj8jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so89043585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 02:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793353240; cv=none;
        d=google.com; s=arc-20260327;
        b=SWjwIDOf+rHp6Vx7M481FDTGDiKEtYQlilc9wngmc30tyBNpPQ00kfO8pCJi/sA30s
         g7ZemhU05ILnYC0dtGgwLwd6pgqR7O38rlZSQPXBGuFeEGdSsrkfEHVeQ03AMAkSmkfW
         RhomlGqM0oDff7E8k9KvQcG/KuHlKjLD5KvzrGmtOY3CL7l7HmjEq6C400TWuxxR5DBX
         QBWMLa2HILAp0o/+RwsW/lD0QPwoPoU3mldCEAITyKKArgKotUPQvo4mdxvF+ot9kijj
         VaFoZGYYKyrm5G3flWsM2ZVdNxlz1dt/uSu7K8y1gLKIEMha50MwrnOzZ0/BUuK/THoj
         /BUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=;
        fh=pGFlmL7m2uDzq3yZQr73mISa+LHDham49eHemVjDkds=;
        b=ZnAtOCCUlcSsjGzq2vCOymn5mpEuMHdC4GSZe1ZjdYDyphogEfNzxUnplNwQM0OVFr
         hFXqjR6Fs/OcYX3ZBTLd8H+Lzm+DXfJ/EBwmdwYLXeHAYuG0+r1WXqIATqdI/bpO+CVX
         vLWG20tyNv3slxqeir6WOHqRMVzqqcgNV2iJGB8TudB8dPWrMWzKgoITv9jbHxmETlTO
         oPPIpvLZIVNbS6/p7FpB9eAXaLLXwnww8epNpqRF+B8W2D/lF+m8Mgn0qw/K6bCjIP4Q
         us4Qm2eqFt2na+PBW6yKcOkBn8a4ugIAFlwVUAil4gczIuVY3JwpDDqRTHm4iNh0z6ho
         nycA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353240; x=1793958040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=;
        b=FN5uMiVu57T1CAppK/bMjDbtJUI2ISEL+MqXc40uaLLJ8uvqHOiz6sH5V+dEUoRkrE
         mvHzYusljoz8/9kU2QXAjDm7r3KmuOv4ZUyY+HhDWPxwOJSzWg+s0RazS1Ch4HUXazps
         HUv/Mu8dj/iM3/bHVb0k8KErqNIkQqY98HH3ObovURd3MO8DViUFJbDubbHkeQUxzbet
         tUfj6yhKqzPc+ch1b984Hq5mKQAV35akLWYNCNko4KGTp6bPcRVZw9qAYGrUYH7UOiyU
         pmK9oaRN2Dg/OYxT+45nOkb+/T54ZFKP9Fq6x24OfGTMNmLltG5W/8Pvlyt44x0eYlnC
         AipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353240; x=1793958040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=;
        b=JxruhzFvd19mLpAEgOYRyiYQsSmXmFkZJvTan7/6TqeZeHrEDRxn09eFhsBsoXDp+r
         DTSLSvN8mvkOOdYgcYPu6/nht5OnbmStQgCFTMFoAtKCmMQvzGh55uhV/A/QfbHvnvv1
         DRUhR7Qh4mh05sMYIo/OCRWrNhX4wvO+uMLc7EEIfys/HBG6+1JM3iriu+6HVLDDQ8Zo
         YchtfdaZfO6nJnqWKUiQCuSsSrh4WnJobI8a7N/awbqo1owOwKOJsCsNUkJ0bk9Gwk5l
         RyMYgtXIdiDmzn56Lf74Jts450OLC35vScg31brujzn+GjrDmywBE/U0V5sKaTParqYA
         4eGA==
X-Gm-Message-State: AFq9FYJR/UYl8I9Ldz0qWERxPhR2RNRD5mmkr2ipV3bz4giRkvZ1okZo
	0Lkka4e7Fo/L33UWhX7EgAzsGAng9urvc2JDfqcuKvmdLNYIqgWCtRxIy58IBSiPmZ2+A4CH+QM
	YvJJkQ9A+iB3w5zQUpuRBBmRxXAgvcW/JeqZhtWZNPiVJsgKvM9se+mBG3Ads9QW0egxd/B0GmD
	96c7qGigLtVKdBodbVsjJMJSGfFmLn+GHIPq1fYHUtsBk=
X-Gm-Gg: AYBFou07qGQExu8c4pM4hNqDP4MMZxqZ16vJZrgA1m6wy46pyxsrFO1H3zD9oQp0mDF
	BRdiAoPEmD79vCbILSI2ct7Vld4QE39UtEx01RwFESLA9dLopTZJ4EmUcIOmnyDylmEsYiLBUxt
	tGBUu6eTCAU8GFEhsis8NzH6zrTqX1vCgXzUEvoN1HNFY1gjH1LuRVglclc4UL6BFo7i/GCZOPO
	up44bgdiUkp8xOUFx6TZFjH6eDTfuE2TAgTqG9fKRF0X8Sfy3K5HObXIUSVLSn8PXKCL4V25KFo
X-Received: by 2002:a05:620a:444f:b0:93f:5717:e7b9 with SMTP id af79cd13be357-9442177e372mr252813085a.30.1793353239926;
        Fri, 30 Oct 2026 02:40:39 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:93f:5717:e7b9 with SMTP id
 af79cd13be357-9442177e372mr252808785a.30.1793353239275; Fri, 30 Oct 2026
 02:40:39 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-camss-fix-v1-1-ecc170342d0d@oss.qualcomm.com>
In-Reply-To: <20261030-camss-fix-v1-1-ecc170342d0d@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 10:40:28 +0100
X-Gm-Features: AclHuK_Nb7z64_X16sSt8eZ5KfEgiXwPK7nYj7Hkj0Nd7L6xMjrKtPUseHaWH2s
Message-ID: <CAFEp6-2b8M48sxvV-bux_cxBJ-jzpputHdJrBORJ4d1w51nzSw@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: vfe: Clear active buffer pointers
 after flushing
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXzg+4ISKfUBAF
 Jlg21FQX0w5S6hXx4PjuLyjXsJuNr5jsweCrgdYqYtGmXAobmXDocHn4SerTLDQa2ATkMOoYLXW
 8Z5yiZcZ8/DvMBwYh0JRuDVgFmds91DhrFuP4KLchkxYUYQfGlUltcqx4u4bLWBsvWNSgVX3kEw
 EPuaNBooL0oUgKgsQwvuYbS8+WB2frycmTXJRR0wDiLo2cz6g3mPMWdb4zzmUpQtK/OshJ5bWsh
 XGongv+jNqRX++wolD98bfPb9vH0+W1UkoZ+x7bFVCMhBc0kt1XgdHr7DNc96RZv+00R1tJzdIR
 ChxGnmZVAPFQ88XvPUYefX0tsrgyW78E1YYGgzniwo569UmyY58HpldrPP0OUNbe013gjtpUpNd
 7VbefRicv0VpbrWdIMJkGxePj0U70rTyFcjojW0YJX1Skj9OQsQwzrE9P4Xv3cOO9pJggHfkZDU
 jMV/7oXypZdmBHkJTXA==
X-Proofpoint-ORIG-GUID: n2Z9gXzvV7IW-hkxChtA3mDU4tJNL2Z-
X-Proofpoint-GUID: n2Z9gXzvV7IW-hkxChtA3mDU4tJNL2Z-
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae46619 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=7MKz-gpKVdlp02d5jGsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX40bIKFdU7HtU
 q/pB1s3KXGHvT9ofmM1qtN3oiuL7yhPXrTInauj50rq2LQCuBDks8mTrHVOD3yBcCQpNBYsSELT
 btxPHXq+MH594xJbDYHhTXrG9KdatLg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038

On Fri, Oct 30, 2026 at 10:39=E2=80=AFAM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> vfe_flush_buffers() returns all active buffers to vb2 but it leaves
> output->buf[0] and output->buf[1] pointing to the completed buffers
> despite the lost of ownership.
>
> This can lead to subsequent flush or completion paths operating on
> stale state and potentially completing the same buffer more than once.
>
> Clear the buffer pointers explicitly.
>
> Note: vfe_enable_output_v2 is supposed to overwrite those pointers with
> pending buffers when streaming is restarted, but nothing guarantees that
> enough pending buffers will be available to overwrite all entries.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-e617a776-3d96-47cb-8d60-a769340c2=
5a7
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")

Please ignore this patch, wrong commit command....

> ---
>  arch/arm64/boot/dts/qcom/monaco-pmics.dtsi    | 2 ++
>  drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot=
/dts/qcom/monaco-pmics.dtsi
> index 361f5163b6d91eef794d3bf86b374d4dcbc6d60f..1ed4de00b1a3e23e1ef0f1c41=
2a2e29bf840c870 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> @@ -58,6 +58,7 @@ pmm8620au_0_adc: adc@8000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         #io-channel-cells =3D <1>;
> +                       #thermal-sensor-cells =3D <1>;
>
>                         channel@3 {
>                                 reg =3D <ADC5_GEN3_DIE_TEMP(0)>;
> @@ -112,6 +113,7 @@ pmm8650au_1_adc: adc@8000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         #io-channel-cells =3D <1>;
> +                       #thermal-sensor-cells =3D <1>;
>
>                         channel@203 {
>                                 reg =3D <ADC5_GEN3_DIE_TEMP(2)>;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765fa2c8f3c2b38a5f4f0e0bcf4d873..8e297e2bcafcbf30b09fc2ad6=
e57f484a4e41898 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1187,11 +1187,15 @@ int vfe_flush_buffers(struct camss_video *vid,
>
>         vfe_buf_flush_pending(output, state);
>
> -       if (output->buf[0])
> +       if (output->buf[0]) {
>                 vb2_buffer_done(&output->buf[0]->vb.vb2_buf, state);
> +               output->buf[0] =3D NULL;
> +       }
>
> -       if (output->buf[1])
> +       if (output->buf[1]) {
>                 vb2_buffer_done(&output->buf[1]->vb.vb2_buf, state);
> +               output->buf[1] =3D NULL;
> +       }
>
>         if (output->last_buffer) {
>                 vb2_buffer_done(&output->last_buffer->vb.vb2_buf, state);
>
> ---
> base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
> change-id: 20261030-camss-fix-4972697ef90e
>
> Best regards,
> --
> Loic Poulain <loic.poulain@oss.qualcomm.com>
>
