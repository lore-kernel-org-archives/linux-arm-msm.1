Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AF1439329
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584664; cv=none; b=euPNG/ijOCxotD9CYzK++J2wTmuBZbrz+Ne7mjaRsFKliG0x2wCfBJjNEwLDP2kMKlz46Xb9I46XTU4GXLkHaQl6iSzI/PBNjccgQCZhSmBUWtPneUcKomnhGj79rYk7JFc+V29zX2El+5bajTctnnakq3VxTGiABEPDTwwTBlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584664; c=relaxed/simple;
	bh=rbM7/kqvWjcLrpgstJYixqLZ8OHLFJBH3bktfYJhcqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4slSsUCSy2RR7rYBm+l0lPrnGWT/F20HjK0lsGX61OpKjENekMpR4PtUhC5v73Lt36KV60uRSVBrH0WJKNF0R3dS0yDwSxipzU1t0/DGdJyI9Bo6+SA0BW2/RD6uIy/1ecvcLPmDPPTpSKufBu+JXBQ3IMmJNmGnNJaLZVFJZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEwM+FKl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gGlSioLV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEwM+FKl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gGlSioLV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTZcr3637551
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dsQvLI/4cftHHiZfjGaVMCIa
	XDXrgUcf8a4e6+HJ5v4=; b=lEwM+FKlUj+5jzDekb8u8KOQAqXi/mH2m1NDhEWk
	jXUOrK9fkJHoEX8Z2Ev6dxgTA2qIn9gnssIWa2e6k2a+FOBLKdNKf6dl/awQ6wqb
	OfJ4Bqw5vmvJfkT3Vkj7NbIry0P4rZSzyagRgMR76pxqbvs/JKRVZAYhrVvj/nu2
	8uhr6YRsrf/c44dqOZPjhJLwTS94FrfGULLiG8O7FqOYA/shYjmfNgUNoUMDb+bW
	raNSmAza6OPO2e171+ugvAXMphiOrmeKi/YDE6m0JtZGOmGOZ5hok69rgui5FKV9
	IQiUmgZxx3d7OcnftX11e/ZDS5jwSTx/7dp011bDpLRIDw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhhgyu1br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:57:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso81188651cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784584660; x=1785189460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dsQvLI/4cftHHiZfjGaVMCIaXDXrgUcf8a4e6+HJ5v4=;
        b=gGlSioLVvM/KIJH1x/CVA4QXSIUTUEjrHRgZ32DXkZji4KfagxU0GlqBnVWZ5CHCLy
         4A73ykKShUfDQAlw+qbIeuIcsXhUfbs+iyjwkaIXfhV8HAObMVovYqOngZnEwwaBGdkG
         I3o2AC9joJeBFF5DOQ1X4vJ9Hf4JJ17h5eZQsDPb9AsOUH860IyQTenECZFYa9ZQxqy5
         7Jq8Lt6Avibi3uMNqIyNpFq9vJDJcMWMfBTDcxueytiUBEyGUtnXIC8L9vbfkoUiO2mf
         7sdKFjwmL9RRU8mr26Tov0b8NlOK0Qjk8Kz1yF4oFjSIeiC0J8dASV5wCq2lMIS0BoHJ
         UyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784584660; x=1785189460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dsQvLI/4cftHHiZfjGaVMCIaXDXrgUcf8a4e6+HJ5v4=;
        b=D862ADjqoLoAqCWFCHScP/tXmTyHFxLd4HEt6R8ApR6uJwtUXffNuVlQOXKV+/3ytR
         fGMFsCrmoN5zPMUD4ptALpvHnkSoUvpJ5gxCBAEOfsfLvxRNS8BNSizc8zGSi7jsI1Ld
         tMcGaPt2wD2+dNCMBj17dXGfGiu6QWPa4FOKJbDfnPKHoIjGm9ZRypGYokAUqrSLU9hv
         20Z/wRL7Qugx30Yfpuu0V19idqag0Yu1h9dcEc9T+KSsohqdfKkyap3biguCmUctuLUe
         pTM2NWTZ8Vh5S7GF9En20i5qapGmSGoC4pt8Q7AaYiMHr59+OF8INI6O2BCgftPE7OCy
         KMpQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXjj1oPIzHYosObiPXZW5+o/fghN0mG/lFlQP3Zq1457LhqFjI47lCODt1cqAfNa2KcOKDkq62nvlFjtm9@vger.kernel.org
X-Gm-Message-State: AOJu0YwlDPEBmZh/vxzdkTu76gCMId9I+4kK/YXPk9VjfTL5+Bvb9pYy
	N7QJjdOC4dHXBnz4U1O+qeS/7noDMJImbtz5k8GAU5eqAyiG+vKaFz4EYA2Gcf2puXugf6VsHcH
	1iXrNRt/hydgJdFWPCDKFBGKVncynQWPOzTNcK2ThESq7NAMb16nZ+bBb44OQifEaEmmS
X-Gm-Gg: AfdE7ck1Hydrfn/fkVWZUq7pwDfKAFPcMnFlM800CwqltlcoNOnVl7vygQBQrPHQ96a
	Nqcn39paBJSb+HMoozghyuUN4pEDh3yO6WKydOwd6k8jIL0wDCnXzC2mPoKSBpX4eomtgtoklB7
	zBOGmWimnnVUY/ilteEqP7xDZg7sJpadohMzRvGeiw0cbnLYbqi2/RjePAOGGnSy/SgIhI3xYKG
	o/gIB6nvjTD5Po2zO65fScCbvCN+JrhBKWIjroBGcQh9JZhTMWTdkLhvRZMgeLakpTIE3v4xvG4
	xF/8n7nU/2tkb1ezcGBkGRVsK38M8oMmDrk4ak7vbryB3wr5WvmDNBHj7CZyc5u1cHHcVoFRCKi
	CIYxlpEqvHhK82f94EKEmrHf25JLLFD7FPHmMS+sekpe+5hhtqtPiRhe/P7nqHdb4N8x9q+t3Cr
	itlNcVmB6q1gP+jw==
X-Received: by 2002:a05:622a:5599:b0:51c:44c:6ad with SMTP id d75a77b69052e-5213c7e5f05mr148236621cf.21.1784584659950;
        Mon, 20 Jul 2026 14:57:39 -0700 (PDT)
X-Received: by 2002:a05:622a:5599:b0:51c:44c:6ad with SMTP id d75a77b69052e-5213c7e5f05mr148236361cf.21.1784584659407;
        Mon, 20 Jul 2026 14:57:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291da4ff2sm2541708e87.28.2026.07.20.14.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:57:38 -0700 (PDT)
Date: Tue, 21 Jul 2026 00:57:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: Add Kalambo SoC
Message-ID: <uxw2bm46atdaiyvyozfjvu2hlrc3lwqyvzsl4mt6o4jvx6bwds@nfc3dfzhrkxv>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-2-a1069b5a2757@oss.qualcomm.com>
 <581659e3-9168-42b2-b715-943808d9ae2f@oss.qualcomm.com>
 <782d626c-2545-4719-9833-efbc9ba82871@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <782d626c-2545-4719-9833-efbc9ba82871@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIzNyBTYWx0ZWRfX4RamMgBKAQjZ
 J9PiMA0t2MsawiHkwoFJxsJiU6aHR7v9exh9s3LgOFTjr2BD0fLyMMHS52aSoO8o+/Z/FpmJx8/
 cC2/0wH0d9WE+hGH7tCc4OeBoWtBp/I=
X-Authority-Analysis: v=2.4 cv=LK9WhpW9 c=1 sm=1 tr=0 ts=6a5e99d4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=qhNfsfxXrzEHWKKj1dMA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 4bLFwZ_s4xp_HuyG1Dz1bQhmbVap22yl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIzNyBTYWx0ZWRfX8QZzOIRXJwap
 NqlNdtefYBD+qsZ7haLuF4Vx+/b0P2X9D0YEkpilahBJpnKWYcbr5A2pr66T2xnBJ7Il9yG7ZAl
 C+dMQAXVEygZs/rvFycD2Ow4s1iciW29+eFhCgkma8KFVWKhG/yIJx1beMfAe8yfgs2o/K/NY3t
 R41dYpL7Sey7te7aj1hpryN7mHAx/UkSoxJz/ONZw5q3ZBQWPrI0drvacdFZIbBnhWgmljd/EoP
 vQZRuWMrXWdUFkr79LhnIBa/99YnOjxPcBbiQJqYsbQ+lfZS7ygif8zj3N9x0WTuSDYFMZwBTsf
 noz7hoaPVwPPp0IwlOs64fbcfcEIG2niTuDwG5mslJllrZlsKKemedguwnriTLUcF0XY6Qv8803
 RW0K5zSeUsiGhppGC7t5wJt3S6dN4fjpiL5CJ/VmITht+gT1AA24LYMymDDnSyX/IBYvdKdwAP3
 nvFHqh9k3EWeEe9slwg==
X-Proofpoint-GUID: 4bLFwZ_s4xp_HuyG1Dz1bQhmbVap22yl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200237

On Mon, Jul 20, 2026 at 08:34:36PM +0530, Gopikrishna Garmidi wrote:
> 
> Hi Konrad,
> 
> Thanks a lot for the review and for catching these
> > On 7/18/26 2:06 PM, Gopikrishna Garmidi wrote:
> > > Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
> > > with CPU cluster 0 removed, leaving it with just cluster 1. As a result,
> > > the PDP mailbox and SCP low-priority register windows are updated to
> > > match the reduced CPU complex. Everything else should work as-is.
> > > 
> > > Add a label to the Glymur cluster0 cpu-map node to allow its removal on
> > > derived SoCs.
> > > 
> > > Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/glymur.dtsi  |  2 +-
> > >   arch/arm64/boot/dts/qcom/kalambo.dtsi | 29 +++++++++++++++++++++++++++++
> > >   2 files changed, 30 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > > index 55d91c696a3a..f2feef362be5 100644
> > > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > > @@ -275,7 +275,7 @@ cpu17: cpu@20500 {
> > >   		};
> > >   		cpu-map {
> > > -			cluster0 {
> > > +			cpu_map_cluster0: cluster0 {
> > 
> > I doubt the code that parses this will be happy about not
> > being able to start from 'cluster0'
> > 
> 
> Good catch, you're right. parse_cluster() in drivers/base/arch_topology.c
> walks "cluster%d" starting at 0 and bails out on the first missing index, so
> deleting cluster0 and leaving only cluster1 means the topology never gets
> parsed at all.

How was this patchset tested then?


-- 
With best wishes
Dmitry
