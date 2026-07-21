Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE2F443A80
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784675541; cv=none; b=YO6pe/yhKIJy76212SDAEw2s5J6yth8bPyoZqNxjB7iueWaGAN8EQOSubUjJM+LSpsqjLYZDpyHc2q4U8f5C28vC/IwAnKhb59M9cmwXMK/Tssppd98s4qtt5n8TR8LjWDUaaBYc9VP2NYiJpDjgDmBDJg8g4Sfz3F92hfifUoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784675541; c=relaxed/simple;
	bh=Vl8rdLXA/zWODT5DG80RoiJoKnYzEvwuaitp4xFqIRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFWbAvrFdgUaewA2BuNbVGLQAeKvL7xiV5WAbKwZb3W5J9u77tg6p+XvQmAAI1LV16W5NhOTCcUAgRwsn+jFV6+xbTV7kz5sjzwAPV48aSeTpQTj8LbzaLO0qQa15mItSIjbB6z6OXcqiOmjP+X5/kvUmz9tgi75mUuPZAoD7RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCfZDsuy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZYGPZdT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCfZDsuy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eZYGPZdT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZQj23137189
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DPFjYsfB74/nDvbDbVrJyGiokLJKFBi2imc3uqTjMCw=; b=gCfZDsuyx8wMiPx6
	EjB1L9/DUuBEJcexYw9PgKGiBCWx0LhrRNZDnTEtr4oZxr9P3ly25ZHfHVEKxSJY
	9kK1ufSBa7LZRQmbFZwOZxxyRQvZhnQc7Q5eu+4KB5syWvGe04yqCfHBI1ObuGLA
	e9xx0GnN0cFqNfj8dPDgD45Z/lINTd9Yow4xiY1mJqireeQIxlrPKa4Gmp5J2+A9
	u//EPfo6OEc8dpgB4cNiH4U0FYq41I8WqdOzJLrtTYx12R1SLGGzos9k/52QVrVX
	iixs/rsoNEs083G2eSwF0XCNiCZAxab6sYzdfhkmEETNKBIPu0yyZ/gRwIr1hc/q
	5Phr6w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d185m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:12:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-522de3c645dso97479771cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 16:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784675538; x=1785280338; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DPFjYsfB74/nDvbDbVrJyGiokLJKFBi2imc3uqTjMCw=;
        b=eZYGPZdTZeUyLiFgHtkxVwwsHrQCJNQS0MfA8po9h9YZHmhI8dMwN8iWAH4nI1LCUf
         0crx3eAqsciFZtI28rdIlPCuwPQMeVI+6zbALE2QHZJySm2K4FV2TJezmKRYlrRARVwr
         1V+ZqnDllpCMKIEoJDF7EO5ZbBVKgqS9ucu9D5Puj8dM6LUraoYevqOaS2Plgji80HKc
         koCeIIAlJJIP7TVaLVEOPzofaMlWS2BOoQtRo+0s2fKCXYHZ6yYivn0i8Pz1PWk0U5Yd
         z9DNz97SN217iAI6dLD08FLbjALb2uuHKbPhWKLW8ErfaVuAgq7zULwlHzEmK5toQks+
         6MKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784675538; x=1785280338;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DPFjYsfB74/nDvbDbVrJyGiokLJKFBi2imc3uqTjMCw=;
        b=YsxINQ79sv7X84cXfxwpZ7jsN498ri1b6L91OsvC9e0eFfgoh76naOTDuzrvvyqPQA
         wzBXCJ5GxKgozy9zNrP89sRa5wrK2cwxGbxANb12+KATLIHvmjKhVCD57kShtVgoe7AL
         1A8wFA8tZ9hX2v2Vrw8L76ZiFxURjS27AvEmQp75669qY3TQtmGj2cqYoNasu8+Vn4SW
         Iz2UXLLO1/13C77d0XYsO72xCKoC0dP2t4JlMK5fI1oa8pnRzXpCeDSD0w6T+dH46uRp
         FrVPVsymZ1t1I2iEYeHyBzIWaC+vwwDjID3VsbM5EKGZa2SoktfBYFmpsWlWCM3ag5lg
         plPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrza6gjCcVeXK3HLZ3y5Op9R/UZ2oGEFGUB+Hv/f3KiKKJAMOOMnl3lYavt4UssKJuilzEoPdEi9IEWG24k@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/7yXm1mpd19+VhNVZNUD13YN1wpJZK5oSwPv+aqQBl7D+HscK
	vdARtJWKNejYtkLZbqlGlIXUFnckDqEJkdUGWJrNgNT2SgzxDVLUVD0R+tT8IKO6jF4c0VTabkV
	WVFIc+JHjcwzyohfZEC0GhAHH5l1G8OTKM2FWZNOS1sZYkOctwOo4jozvZXV4Cn9qWYBu
X-Gm-Gg: AfdE7ckTGh84CO+xQWlBDmEPdGMG1Id/ubC1/0O290bbEVDA3FQe/lVGe5wtOTwA62q
	/uykFVKnR8CSTpI/aG7ColhLtgWTG0azaoJlNanPcjLxjm1s2z6Kua9JpEvSogBdyO+r0qRi4RM
	YtBF11sy/CcjxgOlVCo0cqcfM/bPadPKlpCrTZt2Mn/1XRaFVydeN7YOzW+eFvfIOGKUmIbamX0
	/xELKUIZUmr1Z54AXCRFw45x1AK1/vUvDsppkC5IbLPVcHVQu5bO5ELa8OYpq+mS4ee1CQbBnOI
	UnsmDcJ+vsfx2HuxzDsj4q0A+MXXiDRxySjbwFDMZcG2ZpUdRmL8pzGk4iyYjKMY5K6Uqj6I37w
	cACXF5RvivgRo58oPWwBrbtsy9vEFmCfvUN7qpe1e7HUq+y30Lan97AYa1DiFqPiNZ8g/HbFLEN
	U1hlSmQQkB6pGuzA==
X-Received: by 2002:ac8:7dd4:0:b0:519:f884:b587 with SMTP id d75a77b69052e-5213ab6d3a9mr195185281cf.27.1784675537748;
        Tue, 21 Jul 2026 16:12:17 -0700 (PDT)
X-Received: by 2002:ac8:7dd4:0:b0:519:f884:b587 with SMTP id d75a77b69052e-5213ab6d3a9mr195184921cf.27.1784675537347;
        Tue, 21 Jul 2026 16:12:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68b7425sm1387111fa.11.2026.07.21.16.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:12:15 -0700 (PDT)
Date: Wed, 22 Jul 2026 02:12:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH v5 6/9] arm64: dts: qcom: lemans: Enable CDSP cooling
Message-ID: <mi4irfwanrjjv56p62nn352yinzzxuig56amv3xkpkscwlrywl@pst3udv3kpth>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-6-99620e07f505@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-b4-qmi-tmd-v5-6-99620e07f505@oss.qualcomm.com>
X-Proofpoint-GUID: uEV-rOba9UM-IeJeU3eBnAceCCH73tIE
X-Proofpoint-ORIG-GUID: uEV-rOba9UM-IeJeU3eBnAceCCH73tIE
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a5ffcd2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ysZNT-AePBnC6ZdsTwIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfX999BZnvtMxh2
 H+YXw9AniHA1dF7bAIKqQyUPQzylyKlkCY/w6pOvUaBgqwp4xPSOS9LE+7zRsvBAGLYFup1MocS
 bQLyJeGV1Tyr2aAO7e/LMUSFt9yuca4Glm3IGIJGA0o8ZtPE3YKSbqKSkbAOyb5h6qCz75IRxzr
 2o/eXkKufzDcKXF1qHA+EbQu6bK0I/QhB02+EEUbZhA6PHaSwSZmZ2xeeZdsOq3Pk9f40DwEl4D
 omCwfcRx7U/Cr1mITx/aAxi9XzZfTkpZTv7N2Zv1wywNo6KnTRmJDXyVFGA1jhPf3uRgxQlmB9b
 wkQvkFysz7hgRP9+4Ug2PQI4pCsFZy1pb2iNukPboL+/Q5mB09UTRhddInvqJkAZd8OTb5c9yK2
 2NRAUfWAViTWwfkKx4CczWqchVyRj+/m0nXGlDw1SX5KyWFlVZKNWNApR/P/2b/1EMDkVP1b3yh
 Fya1RBAsKfFLjw5ltpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfXzLeW4TaY1Php
 YaCDTCt5je/iwQrg4j/WW1Tq0PCB/0UGvw+2Eg34lXYUk1csv2EvpI71DG6LMJ5gl40Yl8QaFN9
 A/r/gzJsjNDh6CFvspMAmzskbyHWXJA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210239

On Tue, Jul 21, 2026 at 11:59:03AM +0530, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in lemans.
> 
> Set up CDSP cooling for both instances by throttling the cdsp, when
> it reaches 105°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 125 +++++++++++++++++++++++++++++++----
>  1 file changed, 113 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
