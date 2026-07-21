Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A823624D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640226; cv=none; b=Sqo3aueDhEtZBSyEJxrniQXLlx62TvI01UGiILeZWlyKDRNMlVwpk4duROELfvJ0v3jH4b+67Rf1Nplpe9s0h7y2HWa8mq7Jk5w6lGXNPlmllobRG6H6/NlJZ3JWW4PdqMgINT0AFnyFZnkgk5Q4XalWV29dZpVl6kyCz3V1jDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640226; c=relaxed/simple;
	bh=AJCMzLpRw4AQZ42NCiZn7YI+4yZZy8o1BfgRnmh5jpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5WQh3e5gNvGriMm2yofvKc9c6gR5ur7OR4Zst1JWD9J6p6s04pnmT+J6YuRMmPgGSj548wwwQTgo+IgfLV/ArQMC0YiyXuL3fpnH/AtYdfZzu3TFAYH380tB6NDxJl4o1lq+n215L+QBEH5zTIiQdHp/rX7jbAbM+ulg1aHvaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aasllb5E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7L8Qsl1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aasllb5E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7L8Qsl1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMIrJ1793879
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jVDOlH+vUt2ftF4BKKj2HHgr
	uZoxeRHPX+o0uUZLbR8=; b=aasllb5Em9o5/9giEY/IQMhKDywDVi5nZgy3itRk
	eWmhFPypQMfDz57lUdhH1ZlSm5E1ZPDrxOLPB4VNny2Z/0o1Y97fuJKhgIwBYHxg
	5jMrewu7MLHgI7Elk7+eTBkkB00qvr+y1EogGzmoSXmW/7OmFB2yHqIn67OVQ9GZ
	zOFNgKaojg+9D+AjtUasF4WGGvljG+O1Msd6S/RJaURIkmvLny+VeWs/3L/6YQkC
	FupZF5zKyrNyn/7E0+pDVNs9hqs7lFCBjEtkIXYue2wa41qIHBq9xU2ONuGkRHtQ
	u7xOxGtN1tTdWCNwx1HtvSRFp7VCfyqh7XlXKod4ZmS7Bw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se2d45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:23:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c110a3b6aso128439321cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640224; x=1785245024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jVDOlH+vUt2ftF4BKKj2HHgruZoxeRHPX+o0uUZLbR8=;
        b=j7L8Qsl1d1gcJMkbAjeGYTkd3PyfuFMfcHrE5yOZFEU20RPziaEsWDYXWLOnf3WA6B
         6fbZJWJOWmtdi5Yry9U0Vnq6GzT6sA4yW95N8umRwtkn7Fv90mU/4azHIhOFkYw/vw24
         e3d521g3nWjlTCkq6Xw+kGMdoOhPMxi8yP+G5Ryk0P3UgvhTDgcQ0SmvIRENNQjCXeHG
         ZtUFLwGRZrUpRrHqwSWcmC1ZYrTOmfIjUzoN/TmX67CQRXHx3F90E2cBVHEegqnKRkJU
         Re0lNWrZhG43YJG6dYoBcLL46yC6CH7eto3FpdMbAyNTeRMnTND+RDZUVK6do+3mWMsP
         rT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640224; x=1785245024;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVDOlH+vUt2ftF4BKKj2HHgruZoxeRHPX+o0uUZLbR8=;
        b=ZsKTqw059fTjNYTOuX8Pq39dBEo9LWbfUhCOoUo7fajcRZ7nkmoQ4VVGB4QU5QIfJb
         9+fAnjBC9ozVL9U51XNlDcdGxZYlLgqKWfJlM14J61OR7VDSoBOCOClX0/qwlEQMXWMv
         BrlN34wsVdlau8sJXbUGh9uwxLxRZDHZMa+iyeu8vq+HMKZX694dVkmrC1L3QayL5qc8
         4QMgxJkr8pBpGVvGHGz8E0UXreGl8yRs6IBJ0XOyXwcm5+ctMcmSw2mgF+j+5ISqfBp4
         U+f+TLC0SLh746b2375dRgJxklYXlH5MfVG0ugKet71o2QTalMW+5U/xBjf4+CIRvnzt
         zhXw==
X-Forwarded-Encrypted: i=1; AHgh+RoClNbEU5hyueNXYqxcIoU+nF6JLdsy23Y8x5VgknflFrAZdoufoJ5PgpWYVKyS4dSqczERNVUPetR8nrPf@vger.kernel.org
X-Gm-Message-State: AOJu0YyLZ9J7G9NLv/DUqG0mReyiGnavnG6ODqYfgH81k+dahP5gdFxD
	y8/tX4uVHItHxlH5u+Feao/HPtQO4fT+Ip15pbpZPpp+ERTXBU93PZZbAb3lbPUYTOX5hB6/VSE
	PVM+/aXHwalQaK89h7zSXdqYbbMIr0DzANmrTdiDZ/cnoEymV7e47x7h0tPFMQrlcO0Ht
X-Gm-Gg: AfdE7cnYzmnPSifx8vmiO4F6LpYqaN+6s7UQAji09X8wqyQ6B/2YNod1Jvw6LA4L7x6
	OgWSxG4cpJou14u8fO/mjHZHF/0evnlJpjLwUeIaleQTLIuW/7qbeHNQseEIR6Bd92g6nUbC/5M
	09lDpdfLme7Xzfh1ZEKay+LB6iMWP15RTkVE/tZO4wfRAvwN+C0wDXxxX8l8QYFo0/Z+w1t7tfK
	xaJBOEvh0x16F+m3nlL4RWm8yYCXs7mojkksZwun/Pc+ScLmLIQwcrRpcIo4LnIgxXR8sgLEWuF
	rqw0nnJo3vuDrgIyX8Jnn+R65YCRdjJafWq4YD6iW3d9YbPfYGxPDTX6XgbX6tmwerWX1Fli6u8
	KmvZQqNlBgYZs8Mq8X8oRhRzcKvZ7EoN7EhZEhHuuYa+KI9/5Fi+F6juhH2b9uglIsJ93dX7OBq
	Qx2v5DbcISd5NGFg==
X-Received: by 2002:a05:622a:164a:b0:51c:1d0c:605f with SMTP id d75a77b69052e-5213d7afe5emr170640921cf.20.1784640222763;
        Tue, 21 Jul 2026 06:23:42 -0700 (PDT)
X-Received: by 2002:a05:622a:164a:b0:51c:1d0c:605f with SMTP id d75a77b69052e-5213d7afe5emr170640231cf.20.1784640221960;
        Tue, 21 Jul 2026 06:23:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291dae2fbsm2891472e87.35.2026.07.21.06.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:23:40 -0700 (PDT)
Date: Tue, 21 Jul 2026 16:23:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: qrb2210: fix PM4125 regulator
 supply parent mappings
Message-ID: <oq5sjn5yudd3nioind5cx2wxsuo4r6h7s6nz6zjhgthlde3xzx@qk3yyswu5aut>
References: <20260720-pm2250-fix-supply-parent-v2-0-60ca47031b50@oss.qualcomm.com>
 <20260720-pm2250-fix-supply-parent-v2-2-60ca47031b50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-pm2250-fix-supply-parent-v2-2-60ca47031b50@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8vah_0pU8xabMer3krUIxzSoBEQXfBZa
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f72e0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pkpiiNAmCQNE7EOobEAA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0MiBTYWx0ZWRfXxdG7p7XTi+dw
 ntSHrASV4i9Ym/gaOWj5HjjKtxgslceCUDjD4AdOJLHqTsECezX83XafqcPEccEEFIWX8XBrq0j
 zp0uqG7nzNZAZAgtujHUMj9DmAQVnzQ=
X-Proofpoint-GUID: 8vah_0pU8xabMer3krUIxzSoBEQXfBZa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0MiBTYWx0ZWRfX6GPi0zHWyCW7
 Ol/IS5qrmVPwaF9hmNC7QSzQ1J//3hw96G/6NEXzeBGc4iwmztIrRol+l3qy0igueAko0PUF9nT
 kp7WX2OGH6OFrdhvFJ5yHzascZbUNJ24O+g4DHSHryG5GGz4lh5RHiTPc4JTyrFztgM+Pl8Ru3x
 f/5bTjFzy09WNMu3ndoxukm+oqiZp/jtzLvLLH4uQQSB8ZNlG4syvFeWKiMpgV4wLhW6RSbfn1F
 dRoO1gR+KOZ/8GV9hBVeKKoriJZkfqQL4j1CHrWpbWOfcyBnFuAkAipP2rJfv72Ldb704H5BZdE
 W3ZBEnvtT2JisowdCY4X/t+aXKT5npxxF/AgKuan5zSJqzkoQU3T8X31HNNzFYv8bRIu1A6Uvgt
 kxq+WZbYHcAUkf+yMHe6ipRJ6vaxM66KzAEiD8wAaf1OuW9S8afLXrtPjShEONIwUxuTQorp1bK
 G+ru8NoBSUndypOWOLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210142

On Mon, Jul 20, 2026 at 04:25:05PM +0530, Rakesh Kota wrote:
> The qrb2210-arduino-imola and qrb2210-rb1 DTS files used coarsely
> grouped supply parent names that do not reflect the actual physical
> pin connections on the PM4125 PMIC. Since supply rail connections
> to PMIC pins are fixed in hardware, these grouped names were
> inaccurate descriptions of the hardware topology.
> 
> Replace them with the correct per-group supply properties matching
> the actual PM4125 pin connections, and align with the companion
> driver change that sets supply names to NULL in the qcom_smd-regulator
> descriptor so that the correct supply topology is captured in DT.

Two separate commits, each having a proper Fixes tag.

> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 13 ++++++++++---
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 13 ++++++++++---
>  2 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> index c472e13fceca..90e6eb284a66 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> @@ -262,9 +262,16 @@ regulators {
>  		compatible = "qcom,rpm-pm2250-regulators";
>  		vdd_s3-supply = <&vph_pwr>;
>  		vdd_s4-supply = <&vph_pwr>;
> -		vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12-supply = <&pm4125_s3>;
> -		vdd_l4_l17_l18_l19_l20_l21_l22-supply = <&vph_pwr>;
> -		vdd_l13_l14_l15_l16-supply = <&pm4125_s4>;
> +		vdd_l1-supply =  <&pm4125_s3>;
> +		vdd_l2_l3-supply =  <&pm4125_s3>;
> +		vdd_l5_l6_l7_l11_l12-supply =  <&pm4125_s3>;
> +		vdd_l8_l9-supply =  <&pm4125_s3>;
> +		vdd_l10-supply =  <&pm4125_s3>;
> +		vdd_l13_l14-supply =  <&pm4125_s4>;
> +		vdd_l15_l16-supply =  <&pm4125_s4>;
> +		vdd_l17_l22-supply = <&vph_pwr>;
> +		vdd_l18_l19-supply = <&vph_pwr>;
> +		vdd_l4_l20_l21-supply = <&vph_pwr>;
>  
>  		pm4125_s3: s3 {
>  			/* 0.4V-1.6625V -> 1.3V (Power tree requirements) */
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> index bf6fb12ad990..3432022274d8 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> @@ -465,9 +465,16 @@ regulators {
>  		compatible = "qcom,rpm-pm2250-regulators";
>  		vdd_s3-supply = <&vph_pwr>;
>  		vdd_s4-supply = <&vph_pwr>;
> -		vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12-supply = <&pm4125_s3>;
> -		vdd_l4_l17_l18_l19_l20_l21_l22-supply = <&vph_pwr>;
> -		vdd_l13_l14_l15_l16-supply = <&pm4125_s4>;
> +		vdd_l1-supply =  <&pm4125_s3>;
> +		vdd_l2_l3-supply =  <&pm4125_s3>;
> +		vdd_l5_l6_l7_l11_l12-supply =  <&pm4125_s3>;
> +		vdd_l8_l9-supply =  <&pm4125_s3>;
> +		vdd_l10-supply =  <&pm4125_s3>;
> +		vdd_l13_l14-supply =  <&pm4125_s4>;
> +		vdd_l15_l16-supply =  <&pm4125_s4>;
> +		vdd_l17_l22-supply = <&vph_pwr>;
> +		vdd_l18_l19-supply = <&vph_pwr>;
> +		vdd_l4_l20_l21-supply = <&vph_pwr>;
>  
>  		/*
>  		 * S1 - VDD_APC
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
