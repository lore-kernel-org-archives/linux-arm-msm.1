Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B68B522F0E
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070219; cv=pass; b=grtphPJeFvIh/3RYLlEYlSM9K+cnEGXSIzcn7dZbsJJhd/oM4rqLDRCj1cb68ALVNQQzqb+0pmxA6RURBw0yiZODRe+yALCbN77GTudKQhnuoRIN8JCthj0UaXyvtdwndrry7gPAe92hlldkaUXiNMCYFtmz9djGAYqM3TDobTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070219; c=relaxed/simple;
	bh=oAd4rlmYABADl9U099AGn3/hKNE5E8OoCkZx6NPXEDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HCPKqsDNcVwualC6sVfU3MKiVDUwKbYxz3HpW2elfipwgpCctXelb38G4LDCW+2RydAfVS2KNbQmy9m+C8AFrxZ/jyuNn2I7v2U1RbKzCKDS1iw7QQq585wunFDSDsS0kgB2riUDq4bMIj+JQkci66naZcxRVxjpe6pNIWZiHNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rnj/CAFp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTSRdeVS; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rnj/CAFp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTSRdeVS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTYA2809292
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=lwuz2UrWB+/hAt9sbAT/80NziaHXfbe833Ydg4qEj3g=; b=Rn
	j/CAFpEqkQNwe81f6JUuVT+8CJAliJr6JGBlcqn/M1vpS7+gUznkTc9P1su3qLeJ
	uiys8wAzvxa+8/JlqqhWz7bp/6IJ/TeiS913MFALpHsP0MN3ymUJ2k1o5OT7qzMf
	/mxB3IIfJhcjXn73C4WmH67Fnh8HZciQBI2ZVWcPVz4I2HLNNmP/mwk/SR+XVvBQ
	2GzSJPcuxt0n9CeumeYfllwW3dwPVJfLvcu5TFOR1j5BiBU9NL7Ka2GEL28QPSqQ
	DAy0AopK/36OT4YpmChQqivFVI1fGeKLg5E6TuvMfhcLplRH7NKbVuY3PwcTlBCx
	ZW5L1S8w2B9lPgAxOS7g==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54trma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:16:56 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4a68926c8c4so5474210fac.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 06:16:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792070216; cv=none;
        d=google.com; s=arc-20260327;
        b=hSTCP9AezW9m2I2vTbXHzkAoDVIGtxukitevc0EafL0hqwup0rEiXFU6xfwJHod6sd
         xOl5/uaMe0oNK3iQpIxthe7LO9FpBtaAxE5l5c9IRVDyWbQXQc/Ub5Vpr3CueIDEfMm+
         ijozxJDCb6LhYrhq/0l4J8V7d9Yh0ERLO7BQ9N+pgH3FTaHmxLUaaiZ1XVRbjk7WeFRI
         469SNfuLC8kHAekhZPDrySenq9R+ixNoJg1iwqOVionJwyPBHo0vLzUPWOMI5UBAw/1C
         yMFdMPu+hhd4fcZVFWt6ONNKy8slpRSQ3Wks8yMwhYepsvUR9OCcRRdMhapn3R6/jfYm
         WT6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=lwuz2UrWB+/hAt9sbAT/80NziaHXfbe833Ydg4qEj3g=;
        fh=q+7ZZn7v+EWiXa8HiG1wQel4EmfALQA60jRf8SyC6Pw=;
        b=kCsB6g8jLpbaI9l+91g8FkpKMXBA9B4NaECPivCHenA9ajCuuDCMKIFMpci7U90nCi
         m5xc4p59lPZYrJGPUZHXwLwPtlnRulpgi9YeTSLFDOI4B54SlmDAQim7gRqbo99tMt+s
         L8T6S0LjkHLrplIuw3/qw7gq2JR3ZvaU62Vy3vBc0YdX5XijKQ4WOY/2Cu3XVak+g7xK
         h0LvGSt8fLJJTf8r6QcNw5fNZ/PVNcvg7f9J6rb2fGfhGwXk1HC+PWt2UuQ0jsjfK9rH
         vkRMI0cJ0XsX38bwBMi3AUbows6NyRRyiyAQmhsaAqwBwbBSImHk4+F6AboubUpwEnQY
         kjug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792070216; x=1792675016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lwuz2UrWB+/hAt9sbAT/80NziaHXfbe833Ydg4qEj3g=;
        b=VTSRdeVSa0Y5KAR/PNBlNel0K8uEYQDizNXAUHUBk8DZXw/LlAzy9lcPzcaZy0kWyy
         Vkoeh9jWhcBkelMztlRmMEN/0TG8jTZhbwSCgzfw6aJIDZkdruQAjedr50a4jfAGznj+
         /OegAFxPshgfhaPY/ibMD1iq2wsLK8wI5t+qZQF472Y7lYvRtSLt04n9XFGVhbYBSVF4
         EewC4DDMP9npVOB1oqzk90gUmcA6pl0bIypGX9OBkZJSvso6LhsPG0T7tQokMrYBNZXH
         XpDFUJxzxKtNSef4fCfcRRCf18jle9xPB2EdaAebtp4ymGkNkm9cfCw4wDQYSxy30FK9
         7z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070216; x=1792675016;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwuz2UrWB+/hAt9sbAT/80NziaHXfbe833Ydg4qEj3g=;
        b=PwQD/t7aLIzJ7mu3fhDiHVYGI2A/EXHxSqvbg9ECvvn2+gESXsmTpbSlRXkdP1+kbh
         YIbW03/rJerwVdiGCIwJcvOU38z3oeI8RNZRjEb11RTWA9eqSNijXnRrm07wckMM9Gr+
         Ke54XIp/oikjmr0uGT7zFDfBojt2dATvGsuhKAN5OigvAalI3IMLC0sRu2wOtw31A95N
         vB3hdsc9SElGlNy+OKDwNyBgxyML5xXt5GN82YXqTt0Mg/FzwafgqQ9Rc26oRXVr54KM
         NnvcEbQWMAQwUoS9k5Rk0Fd1fmr+SVP5/qd7NinUyqPX6wwca6OVvucDZq92y7bdKH08
         CDUg==
X-Forwarded-Encrypted: i=1; AKwUvByEMcPwNYyvJ6hfFw3aeVit51X1HR8KUn+gCNH89NOjMdGCYkO5KcM2lNepBv/ZkwWsJkEdkX78Be2ulQoj@vger.kernel.org
X-Gm-Message-State: AFq9FYIgmXc5njoghDnNE51J6caREPpcMVY8FCVCB8XinzW1uO+H6wvY
	hxLmaJyf3+v/akdHoxrwmtQdxFCFsh7VvPaPP3KGHtfTR8WH1GTAuOoSvNHLHho8ylgDF3GYrOF
	0MavOLfZOo42FCM35DeQCR7ZQsy6oTUrwfIZ6EnYh1PrL3OaSbrHijLThYZtiYUOYo6bB4ur55o
	7aBRcLFQvQlFU+Ufmj2xWBJ7yAXYzFZEy+zT0F6OnTG7RS2uxT4Rym9w==
X-Gm-Gg: AYBFou3ngoJHRsrDuE0eIUyMmVjssjjntMUnJv2h1dhdnM+Q78UfvaNuSeRL+N6Nm1m
	n9tHmvjkw6A96GTRDdx1/1L1MzjNZGtvZXXeosm80jm8ZvPLR9mlkYiEfwJkBPgwvD8WyYCwTkV
	0TpqpdB5ol9sx93WSk25ArBj0CoAMB7Tc1e+MyO9f63kfBAue6R95V2sKkOA==
X-Received: by 2002:a05:6871:727:b0:49d:c3f6:418d with SMTP id 586e51a60fabf-4a2a893896emr15901818fac.11.1792070215636;
        Thu, 15 Oct 2026 06:16:55 -0700 (PDT)
X-Received: by 2002:a05:6871:727:b0:49d:c3f6:418d with SMTP id
 586e51a60fabf-4a2a893896emr15901793fac.11.1792070215085; Thu, 15 Oct 2026
 06:16:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYCPR01MB11847FA80097F4B08C082DC859F9D2@TYCPR01MB11847.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11847FA80097F4B08C082DC859F9D2@TYCPR01MB11847.jpnprd01.prod.outlook.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 06:16:43 -0700
X-Gm-Features: AclHuK8yKX9plMBZ3U6bqhgKb_1JfWHjQ79FUb3oBRTqyntJMHWj0-Ic0NgegPU
Message-ID: <CACSVV02xGrytmrUQmtskUu8-OXm4Cq-qbqYjkrxYOZLLsVb68A@mail.gmail.com>
Subject: Re: Adreno 829 (SM8845) zap shader: PAS init rejected by TZ under Gunyah
To: VENKAT YADLAPATI <venkat.yadlapati@hotmail.com>
Cc: "akhilpo@oss.qualcomm.com" <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        Sumit Garg <sumit.garg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0d248 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=69EAbJreAAAA:8 a=F4Bq3xGy9Peag4MClMYA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MiBTYWx0ZWRfX4xdUGCzy8aWV
 QYtunciqHH+YTrdWWXJnojROo/ufbmw+eoYH8d7kPFmH20q/O3fePiwglMp5W1ohLoz9MicXR2H
 t8R91LgrkQSMnzoC5YkHRiCCUaIu4K3OaSqsc9KY6HE/GNHLgZNdN/fOOUGT9s/rA6gz2H9FjiZ
 OvTXX1sQ/FiAGKpbfw2X6JtmzloN7J6U8Ca8Y7xLWS6vqYoh+f/lvzFU9EQqTtYF5Tm+fU4kHAK
 L7DKMo4UWwnyjGL11XhpWlC92jyKlYloOt/ZRXKKOieHeJTHnmj0bV04MKPyXBZM+zdERb9BGtP
 FXggj7Fxn0eg+7jY0ZibVRBX7O/y9vT6r0Y0IiO/hEwCV/ntBeFfyg4Pp+ow1QIgTD6AXs2VRHy
 UGdwHZBE1MzsMXwG+oDuaiq/V2kjHp3bU6jnND8PA/e53Fqf5PcGPANKZA9bo0jdG6wYdwcTxar
 3rhbiIuAyWlBWQDP5qQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MiBTYWx0ZWRfX7h/nAZxteyGv
 gyM6FYLigHbCH3Lc75xNFhDNOvBu7XAnD75L6f/4llAzfMY/d2j8RkrDsSpm2+mg+L7jgi6tvjI
 9nWxx9uW13WK6p8/DsGp3X1tAUXINKw=
X-Proofpoint-GUID: 74I8gx7dL5oKeywBLcrStY-ds0bNdhYi
X-Proofpoint-ORIG-GUID: 74I8gx7dL5oKeywBLcrStY-ds0bNdhYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150052

+ Sumit who would know more about the PAS stuff

BR,
-R

On Wed, Oct 14, 2026 at 12:42=E2=80=AFPM VENKAT YADLAPATI
<venkat.yadlapati@hotmail.com> wrote:
>
> Hi,
>
> I am bringing up mainline on a Motorola Signature (SM8845 "alor", a
> Kaanapali derivative with an Adreno 829 / gen8_9_0, chip id 0x44030a00).
> It is a retail, secure-boot phone running Gunyah, with the shipped
> firmware (A171WVH.21-16-16). Display, UFS, USB and the ADSP work.
>
> For the GPU I added a gen8_9_0 entry modelled on the A840 one (2 slices,
> 2432 KiB GMEM, gen80900 firmware). The SQE/GMU/AQE firmware loads and the
> GMU boots (v5.3.25), but loading the zap shader fails: the PAS init call
> for PAS id 13 (0x42000201) returns a0 =3D 0xffcfffbb, i.e. -EINVAL. The z=
ap
> is the one shipped in the same vendor image (gen80900_zap.mbn).
>
> What I checked so far:
>
> - qcom_scm_pas_supported(13) returns true, and other PAS images load
>   fine through the same path: the ADSP (PAS 36 + 1) boots.
> - Moving the metadata buffer above 4 GiB, loading the zap after the ADSP,
>   and skipping the CP SMMU aperture call change nothing. Passing an SHM
>   bridge (tzmem) buffer gives a different error (0xffcffff6), so I assume
>   the hypervisor bridges the plain buffer itself and 0x...bb comes from T=
Z.
> - On the same device, the Android 6.18 GKI kernel with KGSL loads the
>   zap with the identical sequence: PAS init(13) -> mem_setup(13,
>   0x9959a000) -> auth_and_reset(13). The only GPU related secure calls
>   before it are qcom_scm_gpu_init_regs (mask 0xb) and a series of
>   MP_ASSIGN calls handing KGSL's secure buffers and secure page tables to
>   VMID_CP_PIXEL. Assigning a page to CP_PIXEL before the zap load on
>   mainline does not help.
>
> Is there a precondition in TZ for the GPU PAS on Gunyah based production
> devices (for example a secure context bank on the GPU SMMU, or something
> KGSL does at probe), or is the zap expected to work the same way as on
> the Kaanapali QRD? Any hint on what 0xffcfffbb means would help too.
>
> A second, unrelated question about naming before I post the SoC patches:
> SM8845 differs from SM8850 enough to need its own TLMM driver (205 GPIOs,
> different pin functions and GPIO->PDC wakeup map), an extra PDC range, a
> gpucc variant and its own GPU, so I describe it as a separate SoC on top
> of kaanapali.dtsi (like purwa on hamoa). For now I used the downstream
> codename "alor" (pinctrl-alor.c, qcom,alor-tlmm, qcom,alor-pdc,
> qcom,alor-gpucc, alor.dtsi). Since kaanapali itself is not the
> downstream name of SM8850, is there an upstream codename planned for
> SM8845, or should I use "alor" (or plain sm8845)?
>
> I plan to post that series soon (TLMM driver and binding, PDC, gpucc
> variant, SoC dtsi, and the A829 support once the zap issue is sorted
> out), followed by the Motorola Signature board. If Qualcomm already has
> SM8845 patches in the queue, please let me know so I don't duplicate the
> work.
>
> Thanks,
> Venkat Yadlapati
