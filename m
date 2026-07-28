Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150F23D3D02
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785224984; cv=none; b=ZJEzgJrNS+jtaM6y6CqU/VHpqd9vyiGCGXZGWJe95fXRYjapop4Dg5ceAX0TFXzxa/97yoLj21LLj9fLIDkg05fDxYlSrWgjj3fmH6YFVRk/T2qg56oPRnnnVqa8NwX4Xw3NWTUwO3M+b7hmfl0DmxoiBozSTJHs5EO6kOEapnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785224984; c=relaxed/simple;
	bh=BXsR1PsroGmjU22Kfo1R3WWVQ8SfW8ospEk7LYL1kzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WF3x3m8I0N3nbXs9enh85UT5znAaW0tkrDVeGKRTZmlIX3Ea2CJ9L/lGB0l+JBHw5s6KNlBlwLyhUmF3CYJi1sRDQFOvP4KP4AWQFRmEg3Jbrp4NttvpBiCKjaZVB2txOlQ2zUustepTiDE7vieEp9378nStwbkAvABfnxwaFOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7yr0L7T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N5CMbSUv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7yr0L7T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N5CMbSUv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3b7hM1701852
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xACYJf8+xxMrhsOL+JreK/GAqAzmxdkE6g+EW6DuSng=; b=f7yr0L7TtfyrzM/u
	FgsyFcijfBvJ0vRzgfCbzCtomAyQJBU+D2FbnTacOwUS5B0fuqsv9jhuOfAodMRV
	gzre8wU+eA2LPrZcTc484gkujuM/s/cqvQ58iZLbzCCezqReu6YPX9DKXhUKlYrq
	d5DK627VwSXMRIAxNPG54+WM86jERXCJCTAXSDiFn6cgKsiY3vo+Do2B/mzqeoOM
	UbjxY5nfrKNDN7WCOvhY4y5T/6PmP1e8nc5Nk/VUOPntBgm989lRbeJLtaOcKUa5
	bkKDPsnKcbs7hoUML8urjkVCcRQ2QrM9ORqBeq0hkMxe3YGEU17mLkHRLNpac4ko
	w40DUg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7hm6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:49:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf1c86963bso7910855ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 00:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785224980; x=1785829780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xACYJf8+xxMrhsOL+JreK/GAqAzmxdkE6g+EW6DuSng=;
        b=N5CMbSUv/qxf+VPJ4hUwnAbxvQ0wWt3/k2B6IT69peJUJCbe5ZXUK1JYswjpAeAxU4
         vV9ohSDyY10IB38NmB/f5yCVKxLYeBBaF2K5YJscjcjn9ox5wfoXlWcuPG2lWV2AEb4i
         uzbH27gKAp5cIao/ATCasuOY6Q3wNsL9DmjghOhIsfhb08NmwBEY1cXq+JVssxbUCvKk
         qePfr31JgMUsecRoiyKPNKUb3naHYPHXpCaNbpXLLML9le4bM0ihcOJsx6dkQDYikFm8
         xoNlG1bbScQNz1Ieb42zVboe7lwV7LyNI1ogSx0zLnvIa6KfM2acUIaOvKsqkExJR4AF
         A9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785224980; x=1785829780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xACYJf8+xxMrhsOL+JreK/GAqAzmxdkE6g+EW6DuSng=;
        b=e/ToIyZBIX67OBOWdnJEHU5ib3kpRhZrMJtFjWK3BHSihdlnsTjqmyEHPkjD0IxBtN
         PHKA+2UV08CPgcsG1j+uJuHGW+rkPyvfeVvAR0nkYIuxwbyORALhTi//mj7Ddk3zVwtf
         zpFQlDFZqs3myq6WwUHBMDcVzhJG/n0WKYDfpu0qs9hhkEqL/H2yglCthD+TUUH/s93o
         1/ohjosl0AVKC1MXdpdHDcRbmpdzZ/NLBJTQvFaOATHKUucCjWq4s/oWdM3Q4gpl7Flq
         +ZhIE6YoBCxR65knHQAVRlDl8rYRkuNS3kz6uo1u5y9Fr0d6teh1zQVaBWS0EE0vIW+2
         2XKg==
X-Forwarded-Encrypted: i=1; AHgh+RqibMlkiT71DsYhKgAbFygChqLb/fOgUHWbPZe6LfEDeTubgPAY98ahmgs4FBwpTp9dRC8wz7pezZRjIAju@vger.kernel.org
X-Gm-Message-State: AOJu0YyG6OQdBwXY0fI6GOvwRSNXDIMslPXCTPbYnmuuPL/TPjige+KS
	k5TETYSLphDgfNW8Nd66b0ZlqtwhI3/PPP5O4/09gFcKtfiCHi/n+R7asAcvNVPYMeaHjtI7PBv
	lL70WeMtjhmH0S9NkbPuaCS3v6IEwmIB+dtnW115G5iMzV//C5VLs2kqJVXEDq2rk8mYz
X-Gm-Gg: AR+sD110xB9vKXNm9+0aHcRd09tJohG8R93OduffyE+lJ47BNALkvoxr+b8I1ScKohb
	0Izs5lSfbhVcBhgwGpd6D/OEUIsicLcMxE5e5Xkc1aZS2C2GaYBsm2lbUBvIfnrMij1Eyulxa9U
	QjcpQC97ObTlrSqZTpLyg9/MS8fpIgiQGYDW4qQ13F4REdlx/l+HB/0T5dJhHTvtbXG/27wSN/V
	kKSJ5fxn2yPNIwuGLvofyg9rj7MNmX/XSuPVYNEwExrxpqMAD59vlrUS2q0pKWhP+pddgKlK4eo
	o6wtPbw8DU8+UVartPtCgFzZ4B43FQs3myA/B24E3HbpSEG5KtC68WXNB0Rn5lqrxTfMWCG1Kg4
	X8LOQtMV4N9w2D9Hg45MY4SVzsb95BPk09qt5jLpuYYe76vEyzuiyZfI5yIaOFNRF/q7sIw==
X-Received: by 2002:a17:903:38c8:b0:2ca:2390:ff13 with SMTP id d9443c01a7336-2d015af49e5mr15436485ad.5.1785224979982;
        Tue, 28 Jul 2026 00:49:39 -0700 (PDT)
X-Received: by 2002:a17:903:38c8:b0:2ca:2390:ff13 with SMTP id d9443c01a7336-2d015af49e5mr15436195ad.5.1785224979558;
        Tue, 28 Jul 2026 00:49:39 -0700 (PDT)
Received: from [10.133.33.39] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e8a44sm48598425ad.35.2026.07.28.00.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 00:49:39 -0700 (PDT)
Message-ID: <ee48d1db-2fa3-469a-a89c-8aada3375dd1@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 15:49:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: thermal: qcom-tsens: Document the Maili
 Temperature Sensor
To: Haritha S K <haritha.k@oss.qualcomm.com>, dipa.mantre@oss.qualcomm.com,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com, gaurav.kohli@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260619-b4-maili-upstream-3-v2-1-e54516c37022@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260619-b4-maili-upstream-3-v2-1-e54516c37022@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2NiBTYWx0ZWRfX1+YHKZMNW2kp
 Nn6UtlXmEq5PjRZl2IYUXbnDDSD4wl79z1V1RFPw2cL0A/SO6Pkkz077/y59fV/V69JL3g0oSNC
 Ixtq1kUsiDSKwlAZY4XAwhKmIbxnXrxrUbBDTkAxNnQchS54GhlH2vXOw7htPiU8JV6YHWX/lH/
 u7odL+JeEcLyOeA26yJ930MM+tF+GpEKgMW3PCVVx7LWGFmKP6beSpxYUoe6FAhY2oqupTzoQvq
 Eui4E45xBS1SwoBCiJ/H/ABymyC+rAvz6sgS+kgCW6C9hbXk1qofqifZn0Wv5311taZD67oQ+8H
 abl2F2buqyK8Kmd0oFQvY+HCaUTjnghm4/X/uPY5mcT4TH99ogY6BFCQC1NREnbvQQmAtEv194r
 cg8yVWe8mAnLhGkWTgV6PlVBacSifwZcKXoZCPUbYvSMr+A1Kgwd/y3tG2J7Pm0IXJ2u1TTrr3J
 mLPmtwqE7AUvNvHYk4Q==
X-Proofpoint-ORIG-GUID: asu0T3bqoj5ZjC8MpUPZWGH2_mz5_5AG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2NiBTYWx0ZWRfX5DTIlPKUAC8R
 XjO6LUKrKfxvlGU/o7BaVFVaI2attHXMAn8UqlkpKpUq2b+8VDZSWMfLPaTSfEwaHALqTdnnURZ
 AqA4EB1sdFsedh/CKxU3B1N7Xv0bg1Y=
X-Proofpoint-GUID: asu0T3bqoj5ZjC8MpUPZWGH2_mz5_5AG
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a685f14 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Wp413ln0MjA_3K6qQysA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280066

Hi Daniel,

Gentle remind the pickup the patch.
just checked that it can apply cleanly on the latest linux-next tag.

Thanks,
Jingyi

On 6/19/2026 6:20 PM, Haritha S K wrote:
> Document the Temperature Sensor (TSENS) on the Qualcomm Maili SoC.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Haritha S K <haritha.k@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated commit message.
> - Link to v1: https://patch.msgid.link/20260617-b4-maili-upstream-3-v1-1-1b8cb7e425d8@oss.qualcomm.com
> ---
>   Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index f0efaa8349ee..5a8f7673e730 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -58,6 +58,7 @@ properties:
>                 - qcom,glymur-tsens
>                 - qcom,hawi-tsens
>                 - qcom,kaanapali-tsens
> +              - qcom,maili-tsens
>                 - qcom,milos-tsens
>                 - qcom,nord-tsens
>                 - qcom,msm8953-tsens
> 
> ---
> base-commit: a76326dca329a7a738ba367529868dfbafb4a403
> change-id: 20260616-b4-maili-upstream-3-b198aaa8969f
> 
> Best regards,
> --
> Haritha S K <haritha.k@oss.qualcomm.com>
> 
> 

