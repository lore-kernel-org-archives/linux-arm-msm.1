Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A487041B8D7
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229658; cv=none; b=FGhUQpS7wx4SJ6uq7mJUG7/VbqfoQuZYnm0IEB3zypy90fjr2tr9fD1UWcEINhvl72rqw1Fzq3vlixvFUYemGutoE6VzFhORSFoweKXWF+hQ2VKEGxSO0VRC9XVtL/Acx0hShJnXP7lX6FsaP27ddz2kXFntQTNdy57FEF0F4yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229658; c=relaxed/simple;
	bh=gzFuI69uujonhQXU9S3/3frU9PVGvgP6/6xRuDPognc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fefVj32GmbDwg2hxi0fy1wOeRp2EaFkVaMLJhFlqkcmVrveR77iaq3RLegqQPGi6opRVjfa0M47HU6JijF+luI7K4vxPfU+2WiYUI55mx9lqa/xfuUL4BkCuFAjGl3IYBDIEOQ5Gn1a+oySBQlpT9vZ5Xc11+4UmXIAV29seg0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VCUMC0fa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBSXIcrK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCUMC0fa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBSXIcrK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82IBb2128925
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3XBfJ0VIe7d3CW2b3aaHLYhN
	RbU6Zxt5n+5p55yiR6o=; b=VCUMC0fav47XM1+ro6PBEWmoC5NgZ4hsVeB2bkT5
	zETwu9F5jC2f1LksxClQ0h0esWmWYovCpDvPrUXQZEmddHllRqEaFwcBSw9IgPUw
	ly63EecQRKt+6tEbWAkH8nKo01ieuwT0kj6pGPSet++hO4oN23NZymfQFAzak+71
	qnOQBFQ+9plTkjELtw4kQ9xh3MujSobN269PavnjbbWRLU0iyf63DXD2V5g5jOBk
	TaNbEYDfiryNXxkl2hkLUd+JoCWbci63l0UMf8u4KhrcQpn6DTzGjkHkrtTo58lH
	2ugTtLHEwKmXyWwHNsA8Vi/cLwN7P8fPyYdqaA6aDJJkgg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8bcq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:07:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so13069285ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785229655; x=1785834455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3XBfJ0VIe7d3CW2b3aaHLYhNRbU6Zxt5n+5p55yiR6o=;
        b=HBSXIcrKPpK2w8TD+NXcTmO43MnfWT67XbdfxvKKP80CiAY12VrC+xpkIFtok6b5Or
         32tawXypq7McVaubQsF4/4YQJ1h+DF6TOEtTg4BsQrt13aAYo0lscHLQRvZQRLnXB4ix
         AQbNBL2LbjJTExViOXtGB59WkSEjyF8RdX3+prJRij62KdBRH8IIH8qxDnLVuT3gWDwn
         Q+ajc4iI9+cfufhdAgp1oe7nKhmX40i0gSNyqDet8Zg4aXRAQZt0JJR5cXnyucCtviep
         sU6Ninfnvj0h/wdkDP9NAOSgi6/A7WmorJRUnCmnne1hZZVr8xNmR8dTACVt/VI2jCef
         UdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785229655; x=1785834455;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3XBfJ0VIe7d3CW2b3aaHLYhNRbU6Zxt5n+5p55yiR6o=;
        b=HpUlFV35BUNYQjJfb2x8fXssvOgJOcGCN8+9pEBBspFNK0KAxxSoUBjVEXyb8yF32g
         nJWM1j/brzqHET8jW04gT28HJ1csrOsRGfAstj8OlMzY+QOgKtjXOuaxNEiAD5ZEFfYk
         c+QpNcWO6rfiDWRhemmfAzxSiYxVWi3z4U+w4IePcjprkSDrFTL72EQwxBdCZCFAR6h2
         1lwfyBiYZXZJqRlPm9K178fAG/9WBNE7DM8W9ybNVr7I9DI1pEFeqZVkqNhsCkF3FDOT
         PEc87qkRadVjun0fw7MM+GEITMtHCvKyxpItMwNuLSzzpI8jxE8RYJxlhIeIuVnWrwAX
         Udow==
X-Forwarded-Encrypted: i=1; AHgh+RqJ6aLe2LB6gM3muAbbX8XYh51F+fpSRT02CRcUzKT1L1GhMSfyugwkzjwX5b6my/OJrsw7+7jaUvkYqOmi@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmg89M6QvUvnKmBPS7SQEcTuXQ8aChG9/OWm4yBZX501b+amk+
	t7RUjAK5haFOnhZ6BFfrjX8V0prM9iSED5jtrDQiEAN4kBc5Ad1/ojwmaIk2ipJLnQ2cJQknvlD
	fr+i03QiWqJin7d4cQH2ae5yqq54vhuWtKxbppYCL/WazhMO511jA1HozKrroQZUGrt7+
X-Gm-Gg: AR+sD11RxKLsaZD5D4kPzLiQOz0BBxhEeTWdBV/xvOsFkqK8X/tGlMk838lIx+SKMHb
	0WTcRTlD0plDYJ/1jLBrrOv9EJU1hfgfwQiD7T9EZEchqst/PZPwP7r3FnmfEnuLiNAFWeWXAmu
	fzo+rDIj1UT2utfCW4Vq1TxUqRGtKAhEcciYxRP6VvORnn/mGrSPchYZt6QSCdjOnuaJM3fJGW5
	i6ZEum0pcr2scoKtj3e4sc3Rk5QYZ4WsXpJzWLQSiWECU780Sj1SO7trwWqE8jpdmdFhb2p6HtK
	/B3KnDdn3mrvdi6FBhtb/ITKdpWIfGq2fGHU0W6GDI3xIrPUHy0wk+bd87mM+fmRm2eOEzbaGJQ
	gTBMPt5Yn/XiY/bgsKPH3uKc/1PvumrpkGjPQHPBq1zo=
X-Received: by 2002:a17:902:d98d:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2d015c93c70mr19323585ad.7.1785229654615;
        Tue, 28 Jul 2026 02:07:34 -0700 (PDT)
X-Received: by 2002:a17:902:d98d:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2d015c93c70mr19323145ad.7.1785229654174;
        Tue, 28 Jul 2026 02:07:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b451sm49238145ad.13.2026.07.28.02.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:07:33 -0700 (PDT)
Date: Tue, 28 Jul 2026 17:07:27 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Anjana Hari <anjana.hari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] scsi: ufs: dt-bindings: Add missing mcq reg for
 qcom,sa8255p-ufshc
Message-ID: <amhxT25_uwzYGr95@QCOM-aGQu4IUr3Y>
References: <20260720023552.2667237-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720023552.2667237-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3OCBTYWx0ZWRfX6zGSuxdydKeh
 NkjIUrochF85VW9T8et3jXt0B3YnsxnceaShv1lzwXMcZocaWrdT473pvhQWU9SIyxTCRu+QAGh
 n0naYLUZmnr7hU3dlcS2G6M0kHsKgRsTZPiogXI+w5ne6F7PNzh1iIrbkZG4pMdNLFU3V6mjn8g
 7v1126zAHHTKDRSM/bFR3EPwbHuh/kk4RFpgmbo4zHIkmxDjm9co9xA+V1+HvAApu0n5U6HW2eO
 u7kdH1jKeZI8hva/G78O3FloZNIBUmprJXX2jGs9Ct+DJZrNnHwdkkiH3sw0nsjoxUZG1Rx7JTr
 YdPk+c7RqZBXJbGsEDN3TLBeVq+jNDh/PVMQjh8b4eS1P/3L/HVi3A46+PisRot5QydrxAWdEld
 lADNsvnHH5mb3ryknSAuEYtnrAc+6UMFaxGMaYM5h+Vl884UyzUHo7BpM/s4IuMs6W4RuZ222I3
 RT2X4U4IhBXfeDtu9RQ==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a687157 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TuQ8DdaCxrWks6CsyAEA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: k_J-bLMW-IkXQjPJ0tyN1gjnY1pFgK0e
X-Proofpoint-GUID: k_J-bLMW-IkXQjPJ0tyN1gjnY1pFgK0e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3OCBTYWx0ZWRfXw49G3BFn/i3b
 kqRtzd61JWcfqAtKZb2QlVchvrI5xaF6SCA+Loxd6hgkkyct3Ni6qvMKbcaXegGMnsmgk3WntYj
 tNaasG6ENx3eWmLxkH9RtlCs+Wefgcg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280078

On Mon, Jul 20, 2026 at 10:35:52AM +0800, Shawn Guo wrote:
> Qualcomm UFS controller found on SoCs SA8255P/SA8797P has a MCQ I/O
> address space. It should be defined in the bindings even though Linux
> driver currently doesn't utilize it. Fix the binding before it gets
> adopted by DTS.
> 
> Fixes: e2725ed2a7fb ("scsi: ufs: dt-bindings: Document bindings for SA8255P UFS Host Controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Hi Martin,

I don't mean to rush you. But I do wonder whether you are fine to accept
it as a fix for 7.2 release. Thank you!

Shawn
