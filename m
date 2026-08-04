Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8723939D6C9
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 23:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785886696; cv=none; b=QFXKn3oXW8J7dRVRhoT6RhGJUqq2hNKxA5y+5QePFjcZkqaoSevo8d5mUG+DTZ7rOCvNhdzC1NbQdBwxSst813x0MIlKIwfCKueHZI/cDf/ARrN0ML1SW8j1QmPRabFuLQNRwe3vxJ+GBIbWi/OXJXdTYrkCQxltFhef4u6yito=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785886696; c=relaxed/simple;
	bh=FunpkaXtNrX8UEfuOjGUq+jQa3LfT2f4TXRe05piSuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIICghzQvqbHrPTifIK6mAyvEPUMLtL01V72qoRRla0YwKBgg+3bR/rmAFOmDIHZvTrKgRinhQezOV6fRkmtSl3LvI5iEC7gi/5mdYZI0Efb4utmI2w3dDC4HI1lBdDI9nLb+8b/scEn/jKQlaHZopTUMko7mA0GYLqnwzsjmmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtfKplyQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKO4WnLz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtfKplyQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKO4WnLz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674NGg9B1402778
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 23:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tCK3SPQ5zchCrYz2NKkSth5I
	odtFQPccsfX2kI83AMI=; b=mtfKplyQITFzqsT8gyatEHQFQypJkOTxkJyZH9Vr
	EXpZygOHC45PxKrUA1Zr4I+OHatWhvffLnhT5sivFXGC+BVsIHyVCn82oceSG20D
	1SZ7/Q5fMzReMtdyhviNyec2ZJVFZBJ2R+Sm/7/8j1jw3gRxJO+xU34iw66FI/uZ
	RUm9tTz/iuJ/VOtRfQiow/MHWa3tMm3kVm3SGYKOCnyPi33Ym5YWzp6OczzZJcGS
	gL68lRi+yNAZDzBKmGI3MygEitEXfCLbbn3lOXSmuRKq1r+1h3QxTEvRWyENvwoo
	grZDCfmd+vJk43cEIeoTa9mscDy4BHDn8Km+r0SIr/gswQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3q9kps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 23:38:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso5990801cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 16:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785886692; x=1786491492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tCK3SPQ5zchCrYz2NKkSth5IodtFQPccsfX2kI83AMI=;
        b=VKO4WnLzs6PiATEY/qULbUyn6vBNhukHahwSZVVWOQ4bEVsZXSAcPRVZrI0J6jCGss
         +hIawIbvIqH6O1or4VYYxSdDtm+/d1ss3TnU4KJW7SnT9dyHPCW5/zXRFZ027Zz1wWNY
         hANHe19gv4vzQWrDYGb+Oo9ySgR1LU8xA5J2fcWTxoryG4x3i8J3N63g3vU8941nssTr
         Dkjf+VPrF19MRhdmiYXDmMU3eldGtHPKZPv/vnoffMH7gFRPNlpirICug1ZEj89J4Ank
         a8NhTXJQcH3lBWqzPeAxKpg83iXb1zJSxpbsDTqY9IxoMCDL6mKkHkGGGUUey9lhv8tg
         zW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785886692; x=1786491492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tCK3SPQ5zchCrYz2NKkSth5IodtFQPccsfX2kI83AMI=;
        b=BkTW73EI75M3r9kMPrki+Fs/oyRxv6HGfAnkDqKGXZENpjzINg82jEwNReoHC/CXDg
         5bXS84kKwn999inyR2XlRmJSV1TBpBmeJj1B3gM5DlGl15hE9lWUvL5PCugg6LLyt5rM
         m/zX57AG7ATAtyn+2DjEsHW3+uexp3pIOA1Nli1Rq/DlvUxDrZr/Di6LjYxJnBx2KJzu
         eTtxIXGYUC2TJV9sPkrbdhDhVhs/C5yfmVPyO2h37Ie7Qu8N/W16DSAnTrmQRr6i0tV+
         hqxFh/DonjUig/IBjHiYQccW7SNILUuNT8D6OpOiQe17A3FakqFuyoHX+aWe2lCH3ykB
         rw0A==
X-Forwarded-Encrypted: i=1; AHgh+RrIf2UPfki7WL1y0lSkebWRTS0pzUxbnoJmHndrmRBzikhzTPCPKBcCu+8P4S8C1czIj98CkygrRXIheppq@vger.kernel.org
X-Gm-Message-State: AOJu0YyAOJYNK9ldIeZuF0+gOnQj3Uje77QnNqyk0I1+LK0MBbIOPgz4
	ZQei5J1GXniLsrWdn9OKUtUz+rOGfqjxvm81DBrQvQhxtOOpGAkkn2r/L87bZgRvrgP7FR2aI4e
	RaJUQ5px8B09DXeC+X10F9PPC02H4mxQCh5k2yRosV3reLIY+ek3oOQYOviG6MVNkjlXf
X-Gm-Gg: AR+sD11X0cTCRdH8EDltb9+JmhNABV4Hld+t321AatgQR+HqvFBVWHspZwTlT+Af0XN
	7ZSpaM2c6ADTce9JsBtVehF/uQJuMSIOFTPyzXa2b+NNMnjL+6EG4RERCKwpzDbdSNgKMadHnJX
	heslrDw/1D3mI+Gdx7efDPeoNnePVn5TGDlSsVigOfxoFtl2OFrU8clr4mRjo1Mqirkzt1vFTD4
	e47idls1zmLp19rrsUH+XtMEsNXs86AVMEJ7NoZJ6FPAmpASIeKXp14up/XZJlL6TjzolcobPd1
	NkV+XZkJj6uiCDY2aCi2vOjisgt8jq2vuDAOrytAQP4Ms3UsDVeJcS9wleTpg3HTdg+OWha5I95
	C9ywvqHnSFJPQyMc4Jhrw0FlS71H11xpigF/1uBcUpErpXyS7qhR8CUfrPehzSWf1tiatlwi5ju
	epVWmgLkeF6sqp+Q==
X-Received: by 2002:a05:622a:1f97:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-52ce5fd907cmr36957521cf.12.1785886692289;
        Tue, 04 Aug 2026 16:38:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1f97:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-52ce5fd907cmr36956931cf.12.1785886691570;
        Tue, 04 Aug 2026 16:38:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fb98eeb78sm3134401fa.14.2026.08.04.16.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 16:38:10 -0700 (PDT)
Date: Wed, 5 Aug 2026 02:38:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 2/2] phy: qcom: qmp-combo: Add SM8475 support
Message-ID: <ikg6rz34bs2exae2ew6zrsnvpb4lsno6ugym3e3uxkiv7gi3ah@wogybp7c2uu7>
References: <20260804-sm8475-bup-usbss-v3-0-9a5b9ebf62de@proton.me>
 <20260804-sm8475-bup-usbss-v3-2-9a5b9ebf62de@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-sm8475-bup-usbss-v3-2-9a5b9ebf62de@proton.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE5MiBTYWx0ZWRfX0GvGWVtZgSaC
 8hcNFc40ddmBPcIyFbYE8batwLHHGS0pyyOFjOv8HQ1Em0eR7fOdEAyUdcQxhUAIic4Z2KQIoGZ
 Rc2SdN455gXXbdE2pQxvf8T7Uba4wjDMoXiep054JRj2B3250fNstu4GDcaveWLSdhrK74vRslv
 slvBG9NrZ22D+HO/hu7AjrSvsAY7j8gZnw2vQ8O+OWocthhSna+fn3BC3deouGlV5nY3zY8xdbp
 cOQtzqYM2JEJHmSU7/w35L4AINubxjr7MfuiMBB5e2V5tmcx07sdkYjg6bX7CZsnfz78/ByD2L7
 zAzDSLfbwA1hPeU+adG6nyp68qAeAowICHcZQ62o2JGjMK6JiwLxkFW0HzDbaReS3D+IrYGGdJb
 EAmtRnCHGo4UYWVGX3YkcZNPSkmutNSNig8YFHg4Hz6x7CUOugZrPN+dQvjy8MvYoZVuy2JqJGh
 kpBP2PIJA90PTgEeu3A==
X-Proofpoint-GUID: 8yeRZV_8nPHifcUwqHneszKuocPnheI4
X-Authority-Analysis: v=2.4 cv=LsiiDHdc c=1 sm=1 tr=0 ts=6a7277e6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=0cGqrpNjlybS6BQeJRMA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 8yeRZV_8nPHifcUwqHneszKuocPnheI4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE5MiBTYWx0ZWRfX6IW8fQ1bLCiU
 727JBr0KYSW+P+k/AvOG/dtRZbjCcm0ruyJtMFjdMjaNGfg6WnacCBXUN0O1sarkQLIEeSIMfiF
 r2M5fL4huCVCYd8SzfsBiNeXetl4Opk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_06,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040192

On Tue, Aug 04, 2026 at 02:06:20PM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Has been tested with the following capabilities:
> - USB Type-C at 10Gb/s
> - DP Alt Mode, using HBR2
> - USB Type-C at 480Mb/s + DP Alt Mode, using HBR2
> 
> RX and PCS USB tables had to be added, while serdes, TX and PCS tables were
> reused from other SoCs.
> 
> Some SoCs such as SAR2130P, SM7550, SM7635 and SM8475 use 4nm-v1 PLLs.
> For SM8475, trying to use qmp_v6_dp_serdes_tbl structs (which are for
> 4nm-v1.1 PLLs) causes link training to fail because of ref clock
> differences, which in turn makes these structs differ.
> Add structs for v1 PLLs as well.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 169 ++++++++++++++++++++++++++++++
>  1 file changed, 169 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
