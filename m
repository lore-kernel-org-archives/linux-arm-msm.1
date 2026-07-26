Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6238378D9F
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 20:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785098186; cv=none; b=WMBAqXnztS/TKti5ckpFbyJoivV0ji+6p+apWrhgoTzhJvty/Z8W5LO2IzFNZxSUCDZ1pPbmGvdOzUd9bptbIWP0UofslltR6H4zpxLLRbkQilqWzN71Ax7q3o3ivkn1QjCX4Oa5Tk5VRUjZR9b3PJ5dY4cRKfPkpWhYIVHB8pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785098186; c=relaxed/simple;
	bh=7rv6R5YJcatIW2SWDqFSRa3NtOGxg+0Vw7PYaTlA61o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChwyxeL+pq5iUy10wXM1ZPDMR/fWVrI+Lr1hJO+Uxo2yCdxl+WHCMYPkxSLonuqdSN/wylC15Bs43fq+UA+Jwa8aLvPZgtLny8QFFoiAsfuX4Q+37Swtr125didF3h//8c3+uGdrejX2zHqsgkhoY3BeKtguS0EJr9oJ4vYRwAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9ptAdUx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDd7heKB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9ptAdUx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDd7heKB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QJvBse1678820
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 20:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SqkFlTAif5bgt5ylvluZMohK
	o/S/Ct196CfCN2FqXGM=; b=R9ptAdUxCT12Agi9X7rhDpAzfW15zvVnvGLyC3dG
	rO9wfllvlgyoUm82DAU2xUdM9q4xOy9mjkeZBw1IRgWj9ouHq7WbcEE2oE5qbPE4
	6KoQNY6cXiFWsHDhphiJzB8lwIJnqlKWUg29/MPttIxxm/RyGYS+XNiNqMb9U/1J
	Ce2O26fnvAgpXjp9sCn6UBnXgDu7v/QIl+7dvaz07hOmRNGRj+HdAryouiwOi4Lc
	pMHA60BKR2oMimNwsxoudByvlzfrDYhpuC2/yq4Nhhh9ed9A/8j+puvi3DHWED3a
	SDIUC6Sp1PucNgZlisLEfg99bv3TNN463cCd6VAmgDjeXA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmn7vbmmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 20:36:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c20762d21so22767581cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 13:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785098183; x=1785702983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SqkFlTAif5bgt5ylvluZMohKo/S/Ct196CfCN2FqXGM=;
        b=TDd7heKB4IODYGkMhckKAsm4mYLJNUeY0lsuGCW6DSapNdAGz6xr42JCetAR9kTzjT
         DuBWoHqYv2aZ1i3O+oHIfQKEcPZJMzeNSG6PXM4pnFCTshhjP7i2d3ZSzkc7YXbgLWNW
         ajXv01JdNUYOVOmP53vHcdTFugJyxgvaW37skprpyIR/HrH1ep1+WgVMrylN4leetXWr
         8gFlCUuefKK/NwlWLQMW2T76JTC8Tk7YpveJoKhV7brF4CVe37wDmwLioJ4NCqEnOLJE
         KSfRrfcZ1QYaDSIfuoRXiSpb0cVAKSrCjjW1m4oKd97AQYvEpcXT2VpQlfYHTeHiFcd7
         snhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785098183; x=1785702983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqkFlTAif5bgt5ylvluZMohKo/S/Ct196CfCN2FqXGM=;
        b=Y7s3NhvEsS62Qw3KrWGSN3QOuA56I7Lxc/C2pKjuTrK1upWEo2FfGZ5RVrWlAUR/iL
         Q4IWRdHfyfeT61Ilt5B32QbXO97L5r1n9aKASaGo72i7C7xflHgOkbOD9gKA2JoEy8sI
         ZZ3SMYg3hQHRMhSKh39LVGWNls3WH4QAtrkXFMJCEReyNjh/xZijSeZ5HeOq2eebA5mG
         fnpqJ1crJ25rj/BGCEPyw91W5E0Lvq5SjQQT1AR1XAvoqMAdQR7xuXCPDysyyovEN4SH
         PSe5eEhmYnHEHuxf+lDoEkTKHM1J6VuCDx7u5nMLJ92vW//FQt8H+JDB3biHCI/kw+3I
         WANQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYKvue2eAwXIMg760qT1jdm9CWMSgdZyXfW4AfWLVDEEZmPwyptRo04SXgOZeUg97XXbUm2WaOL6Ga7e0c@vger.kernel.org
X-Gm-Message-State: AOJu0YxJCMqssoADFRSLZG2+7pjsqWa0Cq3rfHV4y733jHwkzg+hxUn4
	fcv8o3hsNrvL+nWNVX447Bdm396ylQMUNCHQW0EomWblS1C328Becm+w0JGWfp5e5IoGfUJ7uyq
	iGITxJYTKvzWIegmMJMR1xp4gKGbMPDYUZTH+Jxjgbi6QWDD0hga0NizDEO7SezmvX3wWa95E+r
	f5QJ8=
X-Gm-Gg: AR+sD11PSrXPc4J3xTZqNy4XUVaMQ6qM0J/Gmp+4DG0LZy52xcYVhv4z53/SL92Qya8
	Mc1qxRmtSgIOYmSBDKAIPRZkIFThaLot6r0TquCF/9UkZncrRrbT076nogOC5bAT+MhpgYgrAeq
	+DjI2PRyKx3LXEArumRL+X/6sS65+hvPF+BlwDUJEKIoU0LTtk8kpUHcLl4AzBV3vmeei9WBtka
	th2p4RDOkPOxra4uLQUedcckT3dJ6h5cVY8+6yzW+iNy0OVR3o2sJRRh+5z9hso2b+zDEuDS+Gr
	kFDuNH8xVEdDTaGTmV0Kb0kYRGvHPvP9PGoZ5r5eetf9PckPgoSwZyfCz1ZZbkVsTePcFlXfRbl
	kxs0ioQUM611j5SwH/tFdPPtp9lEAVMga5fXNC+afwPYUd5OrxBT3DsxO25QJkVnfuKBZruT+op
	BrBBY2+gdtTo5Y+A==
X-Received: by 2002:a05:622a:1aa0:b0:51c:25da:903f with SMTP id d75a77b69052e-529a8712686mr69276981cf.59.1785098183164;
        Sun, 26 Jul 2026 13:36:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa0:b0:51c:25da:903f with SMTP id d75a77b69052e-529a8712686mr69276851cf.59.1785098182768;
        Sun, 26 Jul 2026 13:36:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f221873c9sm9690911fa.11.2026.07.26.13.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:36:20 -0700 (PDT)
Date: Sun, 26 Jul 2026 23:36:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
Message-ID: <5zgabwyhxu65hacpr53cwktwe4npu2ndzgvt3uulja5lejnmi4@bj4uxp5wlb7l>
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
 <20260723-eusb2-int-handling-v5-v5-2-f32ea6c1a318@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-eusb2-int-handling-v5-v5-2-f32ea6c1a318@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6a666fc7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=6jJYoImRxmWk4JxjxYMA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 2Opm7hAAKFFz4W3kb_9HentbWnLONnfa
X-Proofpoint-ORIG-GUID: 2Opm7hAAKFFz4W3kb_9HentbWnLONnfa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwOSBTYWx0ZWRfXybTWfJQGyjJj
 16kPNkNtWVr64x7epN9llidGRR4fvfCp1lNL+BHbJgqPGQA8HxNuIq9PENzcYIXMmu8UjA3xJUP
 DV8ECMNPHLMRHQ3w4SskQQ8ueEulIZ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwOSBTYWx0ZWRfX/AirXZoQ9aiV
 zzVgzcgYkNO0UmbtDw3IYkYXHnTCHs4VHOMsflJVE5xKvADRxqZmtmg6tHq+DwFi3pAu+5qieqH
 t/ypdYHNrnJq8fkl1Eq13XAPAokVXgR3Tbo45njfJaI0Lo2jv6CFr/YeORqKvePCuOfITbilgl0
 oqbuAKj8E9qxyEsH34vzrzxM8LcIQtAxB+YhWnvyE3oITzvjiIOzc3CcnzFTFzufeU8eUzRubso
 A0RDqroyNjO1KLhDStUeUERUq2QVokiyclif+HSw6ZTAGq7TiZnwIM+daiEJTrGUzgXzLS7aSch
 RwEL+fYJ5RsdDtyJ8cLwKQT9RjVICxG493EKbe9Jn/naDueygdANucw1zy0Vx0yVitgL3B8Pe2H
 Dwh3S5lYoaqzr0a/x7vHjp4JtJNN/B7Yes4Lv5Xf2ettxcitmsdN/ld/RvU5c9xzmc4MtEWRja+
 Sg0uimv4qRVBzT5xvIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_06,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260209

On Thu, Jul 23, 2026 at 04:09:05PM +0530, Krishna Kurapati wrote:
> In cases like USB High-speed phys which can be either USB2 or EUSB2, it is
> required to know the type of phy (rather than the operating mode).

Why?

> Add
> support to cache the PHY_TYPE and add the following helpers:
> 
> - phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
> declare what type of PHY they are (in this case PHY_TYPE_EUSB2).

PHY type is usually coveyed through the PHY cells in DT. Why do you need
to set it from the driver?

> 
> - phy_get_type() for the consumers (like USB controllers) to query the
> type of phy connected to them.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  include/linux/phy/phy.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

-- 
With best wishes
Dmitry
