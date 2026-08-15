Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A78C41BA97
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 14:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786805079; cv=none; b=s2rB0JvooktYIiioNzPqnsXCH/A/PJksI6x7+ln73sPa5eb5JK9hTE65EA+CqQEphZadCN/qDQx62t5D1OnpUYooAV5kGOOca+Pg51f7G70VBuBaPrA+dkPuxrpcljmzeZPyU7lN/6zoL+IgAiq+oDrIrlXS0SH4+DSYK7ltIw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786805079; c=relaxed/simple;
	bh=yGfj/l5DctNSx5LLzusNalM1y7aUIbVLf39gaaRaENM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwy7ttzRz9h18IzFMHCgOf+kT8N0+ON2Ipy7ULyyX3LzYCou6mezXviLbG4CqeJcyikY7FRXdqN8EaiWey0sCYbQw6X+TA4T0ksVOgiT9lLJr5EuDHUfAhfofcmkaUy47KDhhztQYpgqpcfTTk6FNeQ+tdLpMVNNPkSKxGYcLEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UG9yRJ8I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itkpTkGh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UG9yRJ8I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itkpTkGh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDOHvg667804
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 14:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfNWKRJxUJh6VQ1tMySicy4cv5Y6FOCC7PXOPAYPB/g=; b=UG9yRJ8IMMSzbVwH
	U63G9QOFyrV7a4JS7DPESla8TWqgmGhBLC64Kecotc7KFjUYNmPDmiSGp6ywTmEs
	aQTdmf2eAdTgNzQATZoDfl+f9sMg4WTaXvqU1QbVjpjYXoxp4MNrwUdf+gZp/Xqr
	r7Sf9ttH8r1KMhTnwJSAgEhXkEWwn6/CKB/0HQdoJnbU8vZTAYE0SQRNnSFJwSR2
	mndrUP3fpsXwxoHZ5eufNnNtr2+ixp+FOswBScd5oxQzwixyM17/DjoPSn8jGvO6
	p2iTVx1UJTlOGzonhH79wjHy07mhl5V2YmQinkCU0kCIg2suQT9EJ0vSGD2nihEC
	QVpFYQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2gheh83d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 14:44:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d33c89a29so26471021cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 07:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786805075; x=1787409875; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfNWKRJxUJh6VQ1tMySicy4cv5Y6FOCC7PXOPAYPB/g=;
        b=itkpTkGh5cijDYfXwBmxRonJ/OqJxHOxDQblJsgWTadYMRaPfTzWbjfPof9qckEghF
         t/TcbzgLCGRHeZnU/MXdIAmBJO4Yj8IXCy3ssG/guD467oCXP0IuqTTTtuLmsCqgTm3v
         BruRO6u1eIm1ROlq2IEczYrFctGc2UMqU5VpE65nGKpdKw8PrO1/UPTeUhcNew4pkdL6
         GP5rfWARcA7XgcS/8agNlFvRpD94LmqEXH/ZxgCmFmw+gJld4qj4T4y/6sSJGkZDq49G
         zt+aiilF8h0eT5GFTEvtXzF/1Vsfik6GDvxlvO5RpCT6oSUVjHN09T2ASq4559jJKk1D
         cq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786805075; x=1787409875;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dfNWKRJxUJh6VQ1tMySicy4cv5Y6FOCC7PXOPAYPB/g=;
        b=lBh5sMEongfSBu2/VgYnv+NJECas0HzebBCEhb9mRAYWTjMcudGRRrPdTQFKxYkgKn
         k9XhhYlrgVFjKpY8/iK8N0mxFNJD8E5iDeX7fWBRpnVcM1/Z1yi7HGDB8U8IaJX4bGh2
         6SEHpVsJ37B/hAJ6M3SEMu2pPxOMOsw7NLm1m9qbRda5lP9zJxWXW2XkzWOCVV4xL/vv
         oea6uEAsBkR9ufO+KaMStC8ajpTDepV2ko+AlSIwZK+38XmFHELneZep9KkaCt4VxfiE
         nSXMqSLF11w/R+adEMhFKE/L6YNicIKCNEvRu00eXCwQi+k95spEUrszA0A4HD3Wj0tK
         hgCQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3kcX6q6jGHU6WnOIjsY4QudLFsWf2jA9XcwWQcaivqawJctKxu0YNtA6/LvX3q2MPsmovHDYkqgmXkfex@vger.kernel.org
X-Gm-Message-State: AOJu0YxAQhbR1f1x/1Q7g66zmNiLWbSyRM4LjOSoh7IExt6le675iUmY
	/hTYS3ehAabdbjasNwT44iUbJ6QqOa+zXR06KN4nA3CsnwpIE2+Y4k8IOFxeeLCyc4cIldObMSI
	9MT6esbRNPsjfVVNKVfOYAvzITAXz5xtwxPPiYLAZYcaUjUQ+qbsx1f/S8OMcU+1j7TP5qFCZkJ
	9iI+ghsQ==
X-Gm-Gg: AR+sD10I3mIzRlcpj8Om4SQE3Acc2z85I3fw/EvwOlvGiDsV37BnXX3lkefEOdUNHQe
	G7iqFMUXgpRYdco74t/BBEWQBgrxIreNkkCSHvHqCiYvoEJDi9F5xr0PY3+uihijWBOr32sn8HE
	zCCbhdbQEvrr9ewYHNoFjxJveOaDGuHv2EOZCXbEUKB+6kmxYuDnIVyTO5lX2uhrIFYhoJQetC1
	iGo8s0u5HYQTgUhKeYmQLcV3SeqPYMM2TrsEUsPn+kudkFVueg0R/c7JU7yY9B28mOzbUm7Ud/2
	t7Ed6bI59dSsZs5CvSx3ZUFprCf0JLDFdFRholJp60xQLg4h6yxjQGN4ni+ViqcK9A+FO46j10r
	scn1kWhQQ5/UaIhlEE5P73fPRDffZU33DPpQ9nQBKg7emwKoeokzBZqZFbDNS7Fv88ogMgBHTtG
	FZX2sn+qx1Gt9K
X-Received: by 2002:a05:622a:144d:b0:52d:8271:926c with SMTP id d75a77b69052e-52d854d3195mr122151491cf.37.1786805075224;
        Sat, 15 Aug 2026 07:44:35 -0700 (PDT)
X-Received: by 2002:a05:622a:144d:b0:52d:8271:926c with SMTP id d75a77b69052e-52d854d3195mr122151111cf.37.1786805074752;
        Sat, 15 Aug 2026 07:44:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130874512sm11881441fa.2.2026.08.15.07.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 07:44:31 -0700 (PDT)
Date: Sat, 15 Aug 2026 17:44:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Retroid Pocket 6
Message-ID: <4vt23tosseomh2j6iawx5ij6hp5gycuf2okjntwp6zygw6kflt@tavh75hc7fiy>
References: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
 <20260808-rp-qcs8550-v1-3-a5a365ba3dc5@gmail.com>
 <pgup5kvjyhz7l7rucduzlqj7hmle2lrcvso6ge34up5am3uukg@3jocblne3lvi>
 <CALHNRZ9c_+ahDALiQos+H7nWOz7HK8dOfWg3_vnkX+k4=vSp4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALHNRZ9c_+ahDALiQos+H7nWOz7HK8dOfWg3_vnkX+k4=vSp4A@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=EKc2FVZC c=1 sm=1 tr=0 ts=6a807b53 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=QBfilD8PbD4vc2bz1Y0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDEwNyBTYWx0ZWRfX6Q+Nad6Oa4Tk
 zHAJ3y/6fe+vlLj0rrH35dj9JuYe9l9NttdsQ/xXjgIUNZhOmuzy5R0/98tIz1b57lUHFakGE1o
 MJzUtDpH87DzWs7tqG6N29NbaJA73C8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDEwNyBTYWx0ZWRfX15J2U+Bt18eX
 czLaf8snTEc+klYkQQZDaHI7yvEYMFjGFwwoDjNGBzLyL+8xg5dIrxNzrS/x4h8ZK/r8a2D0wbC
 lQLZlBBgx2BHjGETaToxtALU0tfW9ffugMXDhyHumoztL92Qkhe9XKyOWykhkoprdGKfsoBBwci
 MxIcgMp+m8WMDFWVudPG/ayazj+fNxB67ckmjpihlLgA41cD1cuitOgL6SjnYvcbCT7++dmLRMO
 /b0w4afGLoN3hjFXmfrYh+x+6yhSAMtQlCKC3j9w2YpCLmjEy3PPQrkHb+0LelgPPIN5Dikl1Qr
 yL5n45to/EaSYuA88FuZ/1aeNGeSzwXUgpZMUmP4It9KMoIKhvcz1x5LH5A0mH9XyPeaSymLZsC
 tbt8L8YKxrLbXrisvvSa1vVsGocQUkWGxjJ6LqaJlcY3vz3rly02Mt8ae+bDovqxeHO+I8yOM52
 gbnFU3vHU/UV3O/KRqQ==
X-Proofpoint-GUID: mEyxCyDrnS9A2mpbgnweDuscZaYIXp6c
X-Proofpoint-ORIG-GUID: mEyxCyDrnS9A2mpbgnweDuscZaYIXp6c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150107

On Fri, Aug 14, 2026 at 01:59:55PM -0500, Aaron Kling wrote:
> On Thu, Aug 13, 2026 at 2:06 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, Aug 08, 2026 at 12:37:57PM -0500, Aaron Kling via B4 Relay wrote:
> > > From: Aaron Kling <webgeek1234@gmail.com>
> > >
> > > The Retroid Pocket 6 is a high-performance Android-based handheld gaming
> > > console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
> > > 5.5-inch AMOLED touchscreen.
> > >
> > > This is based on the support by ROCKNIX, however their history does not
> > > show who the original author was, so direct attributation cannot be
> > > given.
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
> > >  .../boot/dts/qcom/qcs8550-retroidpocket-rp6.dts    | 122 +++++++++++++++++++++
> > >  2 files changed, 123 insertions(+)
> > >
> > > +
> > > +     vdd_disp_1v8: vdd-disp-1v8-regulator {
> >
> > regulator-foo
> 
> I see these are inconsistent, I missed that when pulling the support
> in. However, looking at the associated AYN series, all regulators are
> named foo-regulator. Using regulator-foo would make that inconsistent,
> is that really desired?


I think, it's generally a better ide. Feel free to rename the regulator
nodes in the existing DTs that you import in a spearate patch (although
that might get rejected by other reviewers as "noise").

> 
> > > +             compatible = "regulator-fixed";
> > > +             regulator-name = "vdd_disp_1v8";
> > > +
> > > +             regulator-min-microvolt = <1800000>;
> > > +             regulator-max-microvolt = <1800000>;
> > > +
> > > +             gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> > > +             enable-active-high;
> > > +     };
> > > +
> > > +     vdd_disp_2v8: vdd-disp-2v8-regulator {
> > > +             compatible = "regulator-fixed";
> > > +             regulator-name = "vdd_disp_2v8";
> > > +
> > > +             regulator-min-microvolt = <2800000>;
> > > +             regulator-max-microvolt = <2800000>;
> > > +
> > > +             gpio = <&tlmm 142 GPIO_ACTIVE_HIGH>;
> > > +             enable-active-high;
> > > +     };
> > > +
> > > +     ts_avdd_3v0: regulator-ts-avdd-3v0 {
> > > +             compatible = "regulator-fixed";
> > > +             regulator-name = "ts_avdd_3v0";
> > > +
> > > +             regulator-min-microvolt = <3000000>;
> > > +             regulator-max-microvolt = <3000000>;
> > > +
> > > +             gpio = <&tlmm 144 GPIO_ACTIVE_HIGH>;
> > > +             enable-active-high;
> > > +     };
> > > +
> > > +     ts_vddio_1v8: regulator-ts-vddio-1v8 {
> > > +             compatible = "regulator-fixed";
> > > +             regulator-name = "ts_vddio_1v8";
> > > +
> > > +             regulator-min-microvolt = <1800000>;
> > > +             regulator-max-microvolt = <1800000>;
> > > +
> > > +             gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
> > > +             enable-active-high;
> > > +     };
> > > +};
> > > +
> > > +&mdss_dsi1 {
> >
> > Out of place.
> 
> Oops.
> 
> > > +     status = "disabled";
> >
> > Isn't this a default? If so, no need to repeat it.
> 
> qcs8550-ayntec-common.dtsi enables this because most of the variants
> have a panel on this connector. So as one of the odd ones out, this
> needs turned back off.

Yep, I missed it. THanks for the pointer.

> 
> > > +};
> > > +
> > > +&i2c_hub_3 {
> > > +     clock-frequency = <100000>;
> > > +
> > > +     status = "okay";
> > > +
> > > +     touchscreen@38 {
> > > +             compatible = "focaltech,ft5426";
> > > +             reg = <0x38>;
> > > +
> > > +             interrupt-parent = <&tlmm>;
> > > +             interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
> > > +             reset-gpios = <&tlmm 14 GPIO_ACTIVE_LOW>;
> > > +
> > > +             vcc-supply = <&ts_avdd_3v0>;
> > > +             iovcc-supply = <&ts_vddio_1v8>;
> > > +
> > > +             pinctrl-0 = <&ts_p_rst_default &ts_p_int_default>;
> > > +             pinctrl-1 = <&ts_p_rst_sleep &ts_p_int_sleep>;
> > > +             pinctrl-names = "default", "sleep";
> > > +
> > > +             touchscreen-size-x = <1080>;
> > > +             touchscreen-size-y = <1920>;
> > > +             touchscreen-swapped-x-y;
> > > +     };
> > > +};
> > > +
> > > +&pmk8550_pwm {
> > > +     status = "okay";
> > > +};
> > > +
> > > +&remoteproc_adsp {
> > > +     firmware-name = "qcom/sm8550/retroidpocket/rp6/adsp.mbn",
> > > +                     "qcom/sm8550/retroidpocket/rp6/adsp_dtb.mbn";
> > > +
> > > +     status = "okay";
> > > +};
> > > +
> > > +&spk_amp_l {
> > > +     firmware-name = "qcom/sm8550/retroidpocket/rp6/aw883xx_acf.bin";
> > > +};
> > > +
> > > +&spk_amp_r {
> > > +     firmware-name = "qcom/sm8550/retroidpocket/rp6/aw883xx_acf.bin";
> > > +};
> > >
> > > --
> > > 2.54.0
> > >
> > >
> >
> > --
> > With best wishes
> > Dmitry
> 
> Aaron

-- 
With best wishes
Dmitry
