Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEEA35E958
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784730969; cv=pass; b=TGyUGP9g9m0RQkAhcjLTyOx7RxNxg55U37PsMNP4I0BIb0TXnPYo0f6BOET6UtjYbb03aIZqGTE5prMwC/7Ce/pxT4hxd9PNIIuhisWv/pCGLJLorjNUtAxpifjU8/kkauppLdqoQvuTDGDLfMRiKoZONz0vo4Y/sDvn68RUucg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784730969; c=relaxed/simple;
	bh=1vJyrAoL2euVy+qY3Yjv6srX/UU2a0Wpoeehhy9ElQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LGnMeYtYm1j+d1a5AeOp6ajxmkoL1QRVnK+OVyleMCMH/HpZOjkbUmildd8uy7FZVjAqiN2dC6YRFA2OlnCj3ZEdg/7yVj+1gs3ThE49diudUX0FZ+UrxIpozS+rURRYauGofgSpak7J3O34Xyh4SC2EgzyDYGaX7d37AwByVEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMK2QAxD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NY84YrxS; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMK2QAxD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NY84YrxS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWaOt1027233
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WooIVRqK6kIZ1xrMCevJKUrFdBOtMfyMStJXi9H6/8w=; b=kMK2QAxDYnAbOfyd
	O35VxwihZ8jm0XkYxlmcJ1leh6VJJeSSmUADAkmQduwSpE5wp6AfYSD2MMg+WQGz
	frMAeI4Ofz5nD1j7iDHB/RMeScyK9Q9CeBrziWmQ5j1LWrg5uAWB8OP93JNLuV4r
	4AEA3FmPMEjatUcHpp73WVBwtCLEVUcCwCIdGHVFqs4naQr9bX9qbGl45tngYcja
	y3vrM6LsXhI2r9HtsE9hYNSXJpq+16jh47Zu/ryPKkjijMAECJnTsDX3yOPLoQ1n
	Jyyv/OWBv9MNgt4hYMXXVq89yjIGljb2Nfd3OHJ/VGhQ7Ou3NXM4M86YPkWw+8yW
	a/vOPQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt799gtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:36:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e538afe65so2201881985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784730965; cv=none;
        d=google.com; s=arc-20260327;
        b=osxRZSa9BEDNf4S8aygZ9vpVsiAQVAXdBxwQsRkg/gtcThoUZYlva/glT+culCKXK+
         5ERlyy4sw1R0GjqJCifo7VPGkGmgKtPJBptpwmAIJ+aEtwaV0YzhQ3Fsm8z0oPQ02UuB
         h2Xq9EwVTSqQ7LUeNC43gB8F3EKnciSPKhanOMpwk894+D4hFXsmTfhOqlfdlhF12JM/
         uYmW1cJ3fsWNN1ik951iAtFg7oWCDA4PfreAuBew1zytrGdesVsKlVyEl8JM1dujns2N
         IQTRw2//q0JMODuWB+kcVwpoWEbZRn6wagSwT82XgvvtBMb/4cKKtfOFueHkrXpWASHE
         VGPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WooIVRqK6kIZ1xrMCevJKUrFdBOtMfyMStJXi9H6/8w=;
        fh=OZy8uLGBVBrIcDG8C8QPbPQpmkwlHKrABm0U8+CsUDo=;
        b=JAQA9AoAafdovv5OckWmXnCzT8nsieBAXJLtz3TIrQ/HZD8q5Aa1g3M+7dDkrSJJ7j
         xDFQzSosNHAdrjOoy5+jnpkciRk6tnXLxNArZLrT5Mgu7bUFHa7HucBp5vajfIGxvlp4
         3Oc9RX2cUpp48gpNgniWFRCuRLb3HWGKo6ufANLBz2W3qmsWLS7hJeQR3VKO2+/zAUf9
         wCIjy9kRKVZ26JdIE26q9GtX7mm19qDz5ZQ4z6Iebt0c2OScFINFlKrg4CelC3SLFemt
         jdrjlYPrT4Dpdxvmtt7G/Oii+VSjA5eMZZGiSloWgfMGYGa2w3Juvfqpefounirei4pP
         z0jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784730965; x=1785335765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WooIVRqK6kIZ1xrMCevJKUrFdBOtMfyMStJXi9H6/8w=;
        b=NY84YrxSnn4vw8zq/jyvqGxDc3XUJKIYtFdyVxKUUw3LdD420EAozxO2XLQpRXMSAa
         MwFnovAoRRD1q+AByDlLCq2FuTC6bd0McEhui61uDAw3zyjbJmn6XI84h/u8xZkXnMhx
         bLvO0HaUD4w/DMMCBDIAwtcABM/bCxEuyt8ndmGk85x7QW4mLccATy+r3kU8oahWyLJX
         sa8nAY0UVpj09e2GkTSq7ji+36ZUONApvDF+UOIAyIQKCEFZNtQrf0MaINxr7CA1z6Ba
         4tH5K094+CXD+yT5YCuzvPOCTcY7DaWLfJVEoUj7PxEZHJDa5oLOn0VSiy58np+Qp9BG
         FNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784730965; x=1785335765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WooIVRqK6kIZ1xrMCevJKUrFdBOtMfyMStJXi9H6/8w=;
        b=ixivHMwaj5VU6dalUaE9v4lF8Ft9UtVfUi0V1HBTnPK5q5TfPjBtmkL7aB2EMaULjf
         dT1i0AaKzsV8DFf1QHcUKE07aj0kzDfG1GpiVwCPME+tgohDaycmg7J5t4WeEAi23qjj
         qfvlDLE5tm4p3SoORQXX0qqdy+r6G4XVGdqyptOEPA5wm+CQre6yljMky0Sb1IHqUQv2
         M+TqtUW/BJHX8Za/4MFm6d7DW+3MwaFy7Zau8Rza+qIoAdXGHEAoaCPHcqKVkIrVHMtw
         KAfDiHo1/LGFgkxRW8QtY/dsK7cVjcR9bA5PmXTkD61hqBjRfEbVXukBv2vQB+5jq1Sp
         lKvg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6KCs+uFLhXii6XnYojwdVU/R6keIDil/8QUP4eeP+RbtyhYpKENT5nHx6tq2DkvjbaieY29Mt/rCbHavj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/wJ0qTx4f+Yh7aOdqFhoNUT2xcImwtPsLjeMTKGn7KNgSHllK
	rtCIMF7fGfxqkO9U7qLsvSQZ2R/0c+fV6FyuimcOJ2lU9WsU9x9Y6/JSrLOmaMqRQ1Y2jNF2mKj
	IWUy/kT2WBA5eQsaGmVi/R7ewxKEoDH3xzyI4URJa8uLUU7GzQaHb6hbPFmPVfY8ysaRF0VRAoT
	fs+WClSbtdRDMwkfCaNBZXamVFpcIL2r9swYLSLdhD8j4=
X-Gm-Gg: AR+sD10DG4y0cEyPvvOOJcyNBSr0YGuxkyxGF1K5vMqDaXvsAJmpHMh1Tl31eFzU2Qi
	J4wJyWU260Y/k6urUILvuP1xMhZuNEcrtla0ELjFz7zANbe3FuyNQzIyNOxpMTHw8iJZZ1Ys8lq
	FCkz/g1W8b5bofIT9lWadq9N176E2fEGTv9lR62DGsGeNjyJnhfTnNHpeXCUYBd8mDgXr7opepB
	cgWqzCERJmsLm/RN+rR7cqky6PcThFhCDuAZ/5BfWl7JweKnEllHT9v7K14T+hEjNdjOc5W+ns=
X-Received: by 2002:a05:620a:a0dc:20b0:930:f7ee:2ce6 with SMTP id af79cd13be357-930f7ee3746mr177004485a.31.1784730965064;
        Wed, 22 Jul 2026 07:36:05 -0700 (PDT)
X-Received: by 2002:a05:620a:a0dc:20b0:930:f7ee:2ce6 with SMTP id
 af79cd13be357-930f7ee3746mr177000885a.31.1784730964398; Wed, 22 Jul 2026
 07:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com> <20260614-adc5_gen3_dt-v2-3-32ec576c5865@oss.qualcomm.com>
In-Reply-To: <20260614-adc5_gen3_dt-v2-3-32ec576c5865@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 16:35:53 +0200
X-Gm-Features: AUfX_myomlSaRfEvLnmECpgY5P9YRIZkvRRfkhd9ga-0ctiWS8sbnUwKFiSuGgk
Message-ID: <CAFEp6-0c60AW_XQFW27FawqumG087XyjasLs1-YkO_4hQZ45-Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: monaco-pmics: Add ADC support
 for PMM8620AU
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a60d556 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=YAKpJRmczyeQ_Nu4dK4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: _H3EBberUUoddUEW8uTdTMcpATzO0Vu5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MyBTYWx0ZWRfX+YlgQmqJ1gki
 wzAaJrsgTzH7aFDGv/3rowvqFRN2Q/vt6B6B031CcXakCECVlQ6C1HgAaxjM+5uXfb9CHGg6d/9
 QTOIGuUCg10j4asZ5rmOtdI9Rq9VheoVxCb1LKXgcU3Y0YfP8aqt7ZmLikZOyohLkVFr+bJ2uRa
 8vKDqjf/b7wfuUj/XAn+NXWRekRAbXsAGYDyC+MB6J1OLmk2B/hNc7ssSQEV8FUyq6/8S8Z9aBf
 NDAYkNf13r+Q1DPStLbFzPA+Vv5PFC9wdNfYNhEp2KXUmrt5RY66w2iRf+n209XAu7JHC7yIBFW
 5xbZpAWTlKkDsjKVD0MyjlKuXhpPrtujYWfd7t+2p3kl++iEJ98qYoz7J1i8Mo7erQyu8EAgQqu
 2fU+d20Ma1ywBCqCb8lzERpo709OdIdkROL09h8aN0rlpM/rtzORF1Q28EjizOktGqpFnwzo35+
 HGglQUiY2xndUyJpvdg==
X-Proofpoint-GUID: _H3EBberUUoddUEW8uTdTMcpATzO0Vu5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MyBTYWx0ZWRfX28+q4dVARaXa
 jjakA4CoA9y3nZ8QhAypSvPeS/3XLtKncPAxwKaFqCx4vCzV2kpTylxbzn+J4uRp0vMpndTCdk/
 5Vh8EIGg1xSu0NOMpqXnGucenNuVMUU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220143

On Sun, Jun 14, 2026 at 10:06=E2=80=AFAM Jishnu Prakash
<jishnu.prakash@oss.qualcomm.com> wrote:
>
> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>
> Add ADC nodes for PMM8620AU PMIC instances (SID 0 and SID 2)
> present on the Monaco platform.
>
> Each ADC node exposes the following ADC channels:
>  - DIE_TEMP: PMIC die temperature channel
>  - VPH_PWR: Battery/supply voltage channel
>
> Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Tested ADC thermistor reading on Arduino Ventuno Q (Monaco Monza).

Tested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 43 ++++++++++++++++++++++++=
++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot=
/dts/qcom/monaco-pmics.dtsi
> index e990d7367719..232bcb942b54 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> @@ -5,6 +5,7 @@
>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/spmi/spmi.h>
> +#include "qcom-adc5-gen3.h"
>
>  &spmi_bus {
>         pmm8620au_0: pmic@0 {
> @@ -20,6 +21,27 @@ pmm8620au_0_rtc: rtc@6100 {
>                         interrupts =3D <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING=
>;
>                 };
>
> +               pmm8620au_0_adc: adc@8000 {
> +                       compatible =3D "qcom,spmi-adc5-gen3";
> +                       reg =3D <0x8000>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       interrupts =3D <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING=
>;
> +                       #io-channel-cells =3D <1>;
> +
> +                       channel@3 {
> +                               reg =3D <ADC5_GEN3_DIE_TEMP(0)>;
> +                               label =3D "pmm8620au_0_die_temp";
> +                               qcom,pre-scaling =3D <1 1>;
> +                       };
> +
> +                       channel@8e {
> +                               reg =3D <ADC5_GEN3_VPH_PWR(0)>;
> +                               label =3D "pmm8620au_0_vph_pwr";
> +                               qcom,pre-scaling =3D <1 3>;
> +                       };
> +               };
> +
>                 pmm8620au_0_gpios: gpio@8800 {
>                         compatible =3D "qcom,pmm8654au-gpio", "qcom,spmi-=
gpio";
>                         reg =3D <0x8800>;
> @@ -37,6 +59,27 @@ pmm8650au_1: pmic@2 {
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
>
> +               pmm8650au_1_adc: adc@8000 {
> +                       compatible =3D "qcom,spmi-adc5-gen3";
> +                       reg =3D <0x8000>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       interrupts =3D <0x2 0x80 0x1 IRQ_TYPE_EDGE_RISING=
>;
> +                       #io-channel-cells =3D <1>;
> +
> +                       channel@203 {
> +                               reg =3D <ADC5_GEN3_DIE_TEMP(2)>;
> +                               label =3D "pmm8650au_1_die_temp";
> +                               qcom,pre-scaling =3D <1 1>;
> +                       };
> +
> +                       channel@28e {
> +                               reg =3D <ADC5_GEN3_VPH_PWR(2)>;
> +                               label =3D "pmm8650au_1_vph_pwr";
> +                               qcom,pre-scaling =3D <1 3>;
> +                       };
> +               };
> +
>                 pmm8650au_1_gpios: gpio@8800 {
>                         compatible =3D "qcom,pmm8654au-gpio", "qcom,spmi-=
gpio";
>                         reg =3D <0x8800>;
>
> --
> 2.43.0
>
>
