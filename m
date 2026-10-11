Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4221642376A
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 09:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791709700; cv=none; b=VGhkS3dilKCHF7dizoLm+/ZSl7AVGGDskDt4stxB0fMiabou7GfdacdhYcQmBQoLLGkx9YXVJBrub4EEglcNePuLOQW98mF88+sq6K1lD+BWf47+hFIXwhf1bHGd2Pw2F0EVYXiJLh+WHmNK4r2yAe8uazTsngQxP09qLeNtBI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791709700; c=relaxed/simple;
	bh=5oHe4n5rbLwyg7OqY/yYUv5kuFE9IDPOKywLKt7K5uM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q8vaOhkDXvXzpodvhEFqpJL1OhsQG7DhEvqUC/ovLEcYxDufrH94DOqCjkDUM1kES/4tZVx97+UhzM/CPzHXHPsielv6YLZqWMVkAv4CNLgGngbacC1ZZsqI/eJEPB7PX+5qCPpT/vNQdVFt3KxJBiF3lSCMl0FUABtpJjLdDrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFz3nDqW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cxpGi2o6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFz3nDqW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cxpGi2o6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B85kAv4075869
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 09:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C/iR2mjTCid+nrePpQGbvgdRC2IVUI2A0iMsqmLXvp8=; b=IFz3nDqWtEVZKMXr
	DjsxrI+VQ/SyD2PupNiCm5RropHru1KtK8wTldunls87r9tUfIzKoqR7XGjMP5R1
	hsidtLi0LhQWcRwW4rYcR5vIG34FdRRbovpJX08lR/ibXqZA48QH23yq/bhKQ33d
	mzESyyGnSstar+PM+NUMoizC95TKHH/i0NSc7BiL866bse/quPNvbLdl3zUkypCk
	HiHA00UV0Jh7IBTJ/vfmocqo/hUb9lQRLA4HYnXoBbL/ZUKeJan/juJ8M42sxuYH
	yX+lVy4wyW9162Q1j56vozPGECQ1OGOp+LJ/a9ddh4KYKMvYHMbhBWKFTrfE9Ppo
	ecCLow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2fb28c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 09:08:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so256230585a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 02:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791709697; x=1792314497; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=C/iR2mjTCid+nrePpQGbvgdRC2IVUI2A0iMsqmLXvp8=;
        b=cxpGi2o6itdaUoOcNyn2/qvqt6rX24yPpSYz4fMw+lTC2+VmHU9Hy69ht2g+6eSrIV
         D0Iuo2wvVJbqRN99mQqI23ZIHM6zTBZ1YoSUXvQDex56vfH04Kv6hZ3SDEB1yZ504MRU
         mV21gpiecOjMxzHcAHsVUY7+ME2or35Z7TRV+MBu0M2SLRFGJXxrkLOl1DkhjJMsRIu1
         WNXxqDHzVAxXlEyFsjIGdV4E4OWUT7AsjnBdoQH/0eV5kepAjY19BRwUi/EkuxoCAJ05
         f/HvFxdmUv712f2WM3S+jJTSnJ9A71FCnVCVRfs8S0ExakTuJ8EbH43AZ4rg9Wb6z9bW
         tG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791709697; x=1792314497;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/iR2mjTCid+nrePpQGbvgdRC2IVUI2A0iMsqmLXvp8=;
        b=E2/yLKayK6mfyUYIGJym5A0DoKOAAjEhOLK9d1kkj+WPG7EOVlMkgqaHKUbnGXndjU
         MtGeC/yrVMYdAzTABiKPXgmCsOBgBI0xQ5FONL6xGr91gYwX8w060S0Yz6dGOBII9IBi
         TVxedJeIFJXooAyYxg5H3Tv3oUxFZKFb6bA9SxpuEwC0SA75d4q5uF7nqpFejS0MrcMP
         CGM1GopQKaoWCPq1UEeWs8ngf6+ZZZKOK0dOg6m/z/evPQ7IzM/F/9CbaqweWbyO9BRQ
         NEhQrimAuzoYMy5L+f3JF82n8PSVdtwvEqpH5iD92YKlOSU7R0Xal/ArfSfM2SzESuSn
         uiGg==
X-Forwarded-Encrypted: i=1; AKwUvByJ0yoqHqj8YZ0DA7W6Ehf7ggeimkJzS+J+RrUJv/KhwG1AufMCgREM94bmUGQXtsLKcLERKO5K11CA1eYE@vger.kernel.org
X-Gm-Message-State: AFq9FYLG3T1AkicCIa566XzdVJhsSA69jk6/6nXS2kBQmj9Eb53ykJrM
	wnHp3+srzDN38pLNE6AW3Z/gUXlWgIwkIbNxqQeZ1IatyyCrCT6kwR3faWyGtXYPgYi0eMGyoZv
	Kpj6Ni7UIWgEEF0qGenBQPsYa7KhcL18YSEg3QTAxDtCpUoaMHcAh2MorQ4xWasl+4cuf
X-Gm-Gg: AYBFou0CDSSASHDF281q5mh3dOPJLOVIzpITGM2bzmKP2EI4efG+9KGa/6B1nEIBfdl
	BHCpsA5ACijyH/au0xI7LPKHmEtcMXiz7IfYWb9wJpwvdBasKJ0pIknR++CyPJrqGUREsKBAnKN
	a6d59qaj1hE11Cx/2wGXKKj0rALsDFF2jz2PRS9UGzHMs739a4AMszPUwwzfwDepaKsE5WJYOXw
	eiUQL/XpoZmPTc30QiJVG0DgzSFiFse94eR3/Nz0CW50+r5sNPOTwS3js9lt8pp4BlpXOOCZ8VX
	TZ0ryalUVbc5nYdtdaoOKMxiR9bBomZ+Gs2CBXJG+GT9fl9QxprsT/POIrvfRdiIcBn6xxqkm7i
	6W8yP83RD1vjpIBxhu7YChSbcZ/tBDCRyxHV7OTEzkhqsdJ87+ZwA3pqLwQ7r
X-Received: by 2002:a05:620a:a2cf:10b0:93e:c12c:f133 with SMTP id af79cd13be357-93ec12d074emr701305585a.78.1791709697115;
        Sun, 11 Oct 2026 02:08:17 -0700 (PDT)
X-Received: by 2002:a05:620a:a2cf:10b0:93e:c12c:f133 with SMTP id af79cd13be357-93ec12d074emr701302585a.78.1791709696517;
        Sun, 11 Oct 2026 02:08:16 -0700 (PDT)
Received: from ?IPv6:2a00:23c4:e5c9:901:c496:8838:86d0:bc8c? ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm13334523f8f.15.2026.10.11.02.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 02:08:15 -0700 (PDT)
Message-ID: <9a9cc7d383b668bd2c96596a96ca30b73e9ccff3.camel@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1: split PAS remoteproc iommus out
 of x1-el2
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa
 <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski	
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Xin Liu	
 <xin.liu@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nikita Travkin
	 <nikita@trvn.ru>, Birk Skyum <birk.skyum@pm.me>,
        Stephan Gerhold
	 <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date: Sun, 11 Oct 2026 10:08:14 +0100
In-Reply-To: <20260914-x1-el2-unfuck-v1-1-00d8bc35a635@oldschoolsolutions.biz>
References: 
	<20260914-x1-el2-unfuck-v1-1-00d8bc35a635@oldschoolsolutions.biz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDAzNiBTYWx0ZWRfX73m8TsuXDAG1
 TYvoFs/GAxZR9EpKiG7OoYUXHGdnHTmjcyabXFe3G0+Mwa5jZmtqIQu0zvERuHG6ghRNtJuARUa
 dHP0H4hAtQB6trvS485iI5k9AkvXzQs=
X-Proofpoint-GUID: XsLNE4j05AXKK0FMbgI05fr9b4JGF3ia
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6acb5202 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gxl3bz0cAAAA:8 a=InlpzHCLAAAA:8 a=ud_x2R5wYZwBytq8-mIA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=kiRiLd-pWN9FGgpmzFdl:22
 a=j9sqBCYxEfXq8HZXc0HF:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDAzNiBTYWx0ZWRfX0Ez3ir64SI2s
 fRTYOoJlZYqpRXuLaA2Je1G1ToPE6ExFRtWAtz0gW90DnTzE2aESws22A3iTmEcNN8FIoxTO7ZT
 bcugd+gq0e1QYGNRWz83RYQqyGvop2FSsWIZcVJjZ/HJf2biehgH4QTUKZiObQd5vx2zqel/oGa
 REeS+RgIJSbh7vcsusuw2ikeViOabHvFHv9lpMeQ7LCwm1bcIYk+cMS9jxkmUiseNwHHxiBP4uL
 HGsHrZlmUh6icjfIUYhs5uNyqobV3NPs/Z4NRPyFMWzDGg7H3JMGNnWEyC9TR2mn1pIJCVvlohb
 RQLSXnktkYoidTmjorXvU5MdbW9mSsg9U1Qvp1L8xIVCcLC8/E/52ngoEkNc7AihVLsQy2H8b9t
 m0+HI5WfQDkieYFcoSxJZ3QW0wXQ2ar3HWdaHV9p17YQgkhj4BIxtWO7bjbb+WBXsIDMlfg6CwH
 8RXafx+3z2pM8VsLeVA==
X-Proofpoint-ORIG-GUID: XsLNE4j05AXKK0FMbgI05fr9b4JGF3ia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110036

Hi Jens,

On Mon, 2026-09-14 at 21:42 +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>=20
> The shared x1-el2 overlay currently attaches apps_smmu streams to
> remoteproc_adsp/cdsp so Linux can program those SIDs when PAS is
> used to authenticate and reset the DSPs.
>=20
> That is wrong for the common WoA EL2 path (slbounce + shipping
> UEFI). There the DSPs are already running from the bootloader and
> the SMMU probe path leaves their SIDs in bypass. Describing iommus
> on the remoteproc nodes replaces that bypass with a translated
> context that is never set up, and boot dies in an SMMU fault storm
> on SID 0x1000 before userspace.
>=20
> Move the remoteproc iommus into a new x1-el2-pas overlay and apply
> it only on hamoa-iot-evk, which is the platform that actually needs
> PAS-managed remoteproc under EL2. Other x1e/x1p -el2 DTBs stay on
> the generic overlay.
>=20
> Tested on:
>   Lenovo Yoga Slim 7x (83ED, BIOS NHCN62WW) by Birk
>   Lenovo Thinkpad T14s G6 (21N1, Hamoa)
>   Lenovo IdeaCentre Mini 01q8x10 (91B6, Purwa)
>   Lenovo Ideapad 5 2in1 14Q8X9 (83GH, Purwa)
>=20
> Fixes: 47c88db49f6c ("arm64: dts: qcom: hamoa: Add remoteproc IOMMUS in E=
L2 device trees")
> Link: https://lore.kernel.org/all/20260130073113.3091884-1-xin.liu@oss.qu=
alcomm.com/
> Suggested-by: Nikita Travkin <nikita@trvn.ru>
> Assisted-by: Grok(xAI):4.6
> Tested-by: Birk Skyum <birk.skyum@pm.me>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com> # Lenovo=20
T14s Hamoa


Thanks!

Chris

> ---
>  arch/arm64/boot/dts/qcom/Makefile        |  2 +-
>  arch/arm64/boot/dts/qcom/x1-el2-pas.dtso | 21 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/x1-el2.dtso     |  8 --------
>  3 files changed, 22 insertions(+), 9 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index d6547fb18edf0..1d1cdf057fd99 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -22,7 +22,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D glymur-hp-elitebook-x-g2q.=
dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D glymur-lenovo-yoga-slim7x.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D hamoa-iot-evk.dtb
> =20
> -hamoa-iot-evk-el2-dtbs	:=3D hamoa-iot-evk.dtb x1-el2.dtbo
> +hamoa-iot-evk-el2-dtbs :=3D hamoa-iot-evk.dtb x1-el2.dtbo x1-el2-pas.dtb=
o
> =20
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D hamoa-iot-evk-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D hamoa-lenovo-ideacentre-mini-01q8x10.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1-el2-pas.dtso b/arch/arm64/boot/d=
ts/qcom/x1-el2-pas.dtso
> new file mode 100644
> index 0000000000000..05364b439182a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1-el2-pas.dtso
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Extra EL2 overlay for platforms where Linux programs remoteproc
> + * IOMMU streams because PAS is available.
> + *
> + * Do not apply this on current WoA firmware. Those DSPs are started
> + * by the bootloader and rely on the SMMU SID bypass set up in
> + * qcom_smmu_cfg_probe(). Attaching iommus here replaces that bypass
> + * with an empty translated context and faults SID 0x1000.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&remoteproc_adsp {
> +	iommus =3D <&apps_smmu 0x1000 0x80>;
> +};
> +
> +&remoteproc_cdsp {
> +	iommus =3D <&apps_smmu 0x0c00 0x0>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/x1-el2.dtso b/arch/arm64/boot/dts/q=
com/x1-el2.dtso
> index ee006742d6f3b..175679be01eba 100644
> --- a/arch/arm64/boot/dts/qcom/x1-el2.dtso
> +++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
> @@ -52,14 +52,6 @@ &pcie_smmu {
>  	status =3D "okay";
>  };
> =20
> -&remoteproc_adsp {
> -	iommus =3D <&apps_smmu 0x1000 0x80>;
> -};
> -
> -&remoteproc_cdsp {
> -	iommus =3D <&apps_smmu 0x0c00 0x0>;
> -};
> -
>  /*
>   * The "SBSA watchdog" is implemented in software in Gunyah
>   * and can't be used when running in EL2.
>=20
> ---
> base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
> change-id: 20260514-x1-el2-unfuck-0c46167538f4
>=20
> Best regards,
