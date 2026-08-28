Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0C33E0090
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912349; cv=none; b=Jm2TUo1CYejc61OjVlaRe/zONzlaKmpvcsjhxmPcWwxinAuyCKT1ruGOTi2BYg9DienqFosRpZ7p0GNTLd3KdjgYuFr1lUnFGJDweUb4akIfdS3jE2VG731S0C/huzylNa56L0HiYkUz7uVrN6ojfny25xl9DPZFatfdQbrb8qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912349; c=relaxed/simple;
	bh=rbvnhY73mXXfTxu+bLbyfaSKBNwQbWLwwtzOCw/1swQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gO30PmjZDeV0i9UOvBxaMUqFA9NMLBNmsCUjzW7Y/mY2Jh6gdzOp/W/tDr4hKZgOOhbmG249tbjG10EGg56rN/HHMR4wrsb1XvxVMmSjlZkvqnlrOmHlz7FN9TaeS0WRrUUCmXUTY3kUxCZuQD4ZE3B7xDimFzudCLYyO5xH2/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6xso+rn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hyzW8d6X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6xso+rn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hyzW8d6X"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7mUl1581439
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lPcn6i0GuP5FuV0mD6U8uId0
	cdgsQPaoW5qSq7vxMo8=; b=M6xso+rnVwRsZm03dOAyLUCpNanhCmyExRIO1C0c
	YDiyjeZFjs/ENnI2t0to60S4XPcWYdIvc7BdUOpQWsqCoI40ll5BOYOBgNcvjZHC
	d/JskZ/w4NvT973/Oiim7hRrPEtLEIhTkaoEekTsMFUT5wP0f/hNlk2tvYvqwEmY
	xACB+j3FtWbUiHnDkmE14j7VlaTskb568oN1RL5sCSHvD0QRpqJGpwTkyz7VIHpT
	asmbT0uEA2w3Sqe4c7lwk+R4So9v713Vc2t4Q98VZhnkuMRdOFmgniHGXYFvooue
	mDplJu0k+tNLUGHiiI0cfc+E0hcJLAHv+G4inS8IC+wQww==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gatnc3dng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:19:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fb8f67542so9544431cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 03:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787912347; x=1788517147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lPcn6i0GuP5FuV0mD6U8uId0cdgsQPaoW5qSq7vxMo8=;
        b=hyzW8d6XgwSAWzwVPWNNkIotyKANlTfZty6Br6jy7SroWO1Ce5K6sOPeiTzs88eCAG
         bc6cWXZayxQ/T5VKaei+PRDqMQXCU5YtLmIvhsut78LLrfzLUfJ0KvnTB49j8or6I2mB
         KlHZLyCrSxxYAM3sgZBFqfAN1VxCuxyjYiyebMFnHkcGWYzx971zKxsgwDGq7zgmXGrF
         hfkQKyryUGCOlGK335cRH8WZDAblGFt77dD+O2VwanvPjfgDWhvOxO/bhNYnvjkBPxsD
         2YImn9gWDRB1QAZhocF1NDS4e51EFn3QHWOqtxof/R0CIP9om6+0sCcR+Ne6AV2Zua8+
         LTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912347; x=1788517147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lPcn6i0GuP5FuV0mD6U8uId0cdgsQPaoW5qSq7vxMo8=;
        b=E2SUYqgbRFZ8G+TwzMm3eIrgPM/5YRxj71aEQ2I9q8j0RYcMp1VYnOnNITqFEdllHa
         mln2qsTZgVS1rIwGcqoodA3ULO4RUpSV84hLtcCzeFCHpIWL8ahEGjfcSfj9WrzLhWz/
         i2p4T8zji/KXesXUs0LGpJGulJC+uBt8P1jWe8iPWA/3lblzpwAeH6Oyb1QM/zykd0+q
         dDYOq7jPJqKkxR33f4vXLR12dWOH+NoKVA3O2P4MgB0naJTxqBCP8d7LY2d0DbYFL3Sq
         uYGXI0UvDIKPsgOESY35OqKU3fhzw7i+KLTjWrwgSxv7KERXr071JqIEjRMVGwjEek6E
         +tEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqb80p4CaXmjX8OXIN+NsBLOrToQF1f1JEllCTF8kJmqe2/uc1E/FFCV3zKH39Sa785csuZBY0DrKNYj87v@vger.kernel.org
X-Gm-Message-State: AFuF++n0wGxy5VYMEBPHpLryZF3DrdJxo/wg/fX66Z+cPnK4tdC10S+i
	ZuqrGHSMYYCzbv8G3kFXBx9Hn85Sz38A2G+9/gZEYA8PlgXqKtfw+IiCITvphhm6UZi/DfSJ8tt
	6BPBBxpCdvKRxyiApdlk97+hlz+w1ZT013Fz7kRiP5PlsmLT+Y7f1oT5Zak5OBSREI7vx
X-Gm-Gg: AR+sD104m6YdaNNWozilF5UgcPppDqKHhQ7RrjAKGTQzBD7rXNv+oB9Mm1WC7Umvbdv
	lLiVgOTdg6K80flNrqsoMzBDoygKSW81bJxd23HQvIFyCq2ef0Mm+kKcTwZff+DvScYVJo5sKBt
	+69b30aZw+Vh1HWI0g3MTEilDTukE2cnT13Pylm+qsg6lrCIFdrNN7rpWS+6w/tpzbxIeBEIWhh
	s3ojc8SvSYA3KFqqn20ZoFd5b+CU8r2Efs9Lc3/7cZNJqtQkb6SI7w/OOzu7LDnWWsCpyQoVgfy
	rR8LQEJY4wKZwr03UD5Ve3Ok5DV3rAwSJ/4MswznX/DEeuW253yreUPMtBSyIBdqki0PFVgteGs
	x/6zJbsreAfmlNw==
X-Received: by 2002:ac8:5a41:0:b0:528:38b1:b547 with SMTP id d75a77b69052e-52fb9379da3mr66887161cf.8.1787912346609;
        Fri, 28 Aug 2026 03:19:06 -0700 (PDT)
X-Received: by 2002:ac8:5a41:0:b0:528:38b1:b547 with SMTP id d75a77b69052e-52fb9379da3mr66886571cf.8.1787912346039;
        Fri, 28 Aug 2026 03:19:06 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92679be5sm45707765e9.3.2026.08.28.03.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:19:05 -0700 (PDT)
Date: Fri, 28 Aug 2026 13:19:03 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/4] phy: qualcomm: qmp-combo: Update DP PHY common
 init tables
Message-ID: <c76vte7k6iky26lm6gazhkkoojceykwkgt3fc5zw32kxh6uge7@vnpvkfyyjfel>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-2-8e73ce7c4636@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828-glymur-phy-v3-v3-2-8e73ce7c4636@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfX6ptbwiheY/yb
 y4U6TvyMueWHovRZ9/qBzv4ski+swclLq7z4f6y/d8m7F9jUsb6XYwOLa4EaGoSSpoDXsVSQ93S
 CIvaLZbKmVCoPiKwSskwUsybj4VBfrPk7+nVszSeGtFQ018CxxX5nb+k02fxgXNxcYpfrYvy6tQ
 AiEtSsyT0NrTh8/790N8WpmUiRDLC1yKxuOR0wPZuiRmV9UMGtazBhhgjgoDN84x+i8Ho7+pH/q
 HpMjczFiGTR8qpJkNQSFn0qugObGVvhy9lKQ4D0kMYcUWqwNYArnu+V70u+txdy97T/hMDpB9GS
 w+OF9oA0TxSEmiC8Os8kpPr4XtLIxyF8HJTVWGKDqLTtpA68Nvewam026hga09GERf3f4N4UbBx
 RN/Yo4ZaR4FuQqL0Ba9jhqi4KDJc2qMvTMXUxfgCMULIeSI/p1y9xojFK3xMl1VqSUco4olkEcy
 xyjskQtqbUrnIjDrVbQ==
X-Proofpoint-ORIG-GUID: plCzWh9ghiMNcdbHgtX2UtEMUxRXBCBt
X-Authority-Analysis: v=2.4 cv=HfUkiCE8 c=1 sm=1 tr=0 ts=6a91609b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Oqahiz4U4qnBBrGiSRoA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfX9AFMbl9+Wswm
 UPHOIKBw1S4KcXawL2rYRWhtPz+636Zao/f2RO5qq/1INTe3BL9zMlA9tfBT3XjrG8i++q+iP+9
 FhQ2hJjn2mfBOB0Ye2LytLwPnSzD1Hk=
X-Proofpoint-GUID: plCzWh9ghiMNcdbHgtX2UtEMUxRXBCBt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280088

On 26-08-28 15:13:14, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Update common DP PHY serdes and TX initialization tables with
> corrected PLL control values (MODE0 instead of MODE1), updated
> SSC step size, reset control, and various TX lane configuration
> parameters including emphasis levels and driver enable settings.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
