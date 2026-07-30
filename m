Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1AD429010
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785414216; cv=none; b=UJWUX5B0HHQ3tgpTaBuh8KgXA1ODbMsnViLyr5oHCXVIZX/TXUPAfu1vsJVaY1752NRMEUg+JNjtasIXR9n4ykrrF97x3bStG6Gt2fQ8SOIZcpolCeSxHlInxrON8AcQxGMzmfB3HJi+xweJj1idtCa4gD+2T2DQQkAFSY8ZM7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785414216; c=relaxed/simple;
	bh=fj3OJW+2dZcUTiyhRjvyOQFWiBqLd96EJ3BCs42UOd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ondT6HXo87ox2fL5nuRVt1wfxTFRVa5BbFrzlrvCM8erBROBmAUSQjCDiX4jKmZvQX8zvYN0wE+vI/LwBudaXkrGGndZnGKpZzvnhO5hR+e7KqS6SvwVwH1jH2egB3+MvXiArOSwM+FUKt8HQ18T0gFq22GOOGcSATuyJsIUCsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIc/oqoG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NDhCUwfX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIc/oqoG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NDhCUwfX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UBDMvU655041
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cNcKBSY8I9iGvFthlr7brnym
	gfKII1KKZSodulBejgo=; b=dIc/oqoGBpAe87b7onndrjj3lDi+md2R9haFMMpN
	t4V9ssVuVy9+AhDiHBZHqS40OJKJGdoaOpR8zRvfWqA8dOXw5IwA54fEdKJPiWpw
	QQJCpmQ/8Jniewu5irC6Dmd9VjHKhVug+Yep7gX3W8WY6ZkuDBr/A5qhPjQNZe05
	VEhC2znNWDlhHtkN5Pu3aVF2eyZDWpmYlSLYHLj94N+XFmQiTM5M3/8Yzjt2Va5K
	L6Du1MELfIY0nyR/k0JOzg+TiOxdjGhpE6rp/sZTjZu34CMIUZ/TKtGcP8Z3sub5
	lCgRl7pB9TVYTQ+CVsR6ucdx9EdGJHbQCq+6n7grB1Lmlw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5j3884e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:23:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so23988531cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 05:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785414213; x=1786019013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cNcKBSY8I9iGvFthlr7brnymgfKII1KKZSodulBejgo=;
        b=NDhCUwfXaaTiudlSx6V7S0ssqb6wDoSnLZQWEYLYRwXroLueIBko62ABsn22nUMrQH
         Ck+ssSImG04bbK70y+CwtcO1F7Wu6H7QTxaj2IjYGy9SpeZv8HtKWslbfaBtBw3N3XGN
         MvLnQ7d4HNXIR1PE5cPAFGIDISjQ8ms82k7s8Ilu9i63uU3HbP6mpZYlFv2+uUn/r21F
         zkBszKr4cxZT/UKT+CUyYY7AlhNMRFQZ8IRrQaXJRgevCIJXzhzsVhMoI1d2at8KQhvA
         jwQOTqmJq6VO1nghaho57grkzipdeUzgs5vDT4vv2ebLplbUiWNxQ945aZlbMo36tFui
         f7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785414213; x=1786019013;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cNcKBSY8I9iGvFthlr7brnymgfKII1KKZSodulBejgo=;
        b=gMmLRQa9jJQ2/69iEq99vMudCtGZjoA9QnNSG2IVe37LMePbOfBu19eESjKChdtUoV
         KLZFDiaDEbQAfM+KZnn/J+Iw5NiErNNCnbHltNpN4HuQORoYqzFmU33tBenG8mij3I7l
         NdB8sRKOHLvAFJQ5Xfuifbwcz8lCMEA1+RU7T2bgnh5sc9ortanNdoh9a97h999LUquC
         VrqqOq5ir0z2SGQ9ZsG6VynCd5fH5IhSfbXI2F26zTbWyzlZY29+He0zur/ZTIjCmKpK
         j5aOntGvgweJnQuk9XmF2LDlCQBSNZ/MvtO30ZD7fwBXJFrJQRRzvkbR0Fo7RKm8DW0C
         ni6A==
X-Forwarded-Encrypted: i=1; AHgh+RpHHn0K+Y984vvxoxslcRdzVUsihGZLpH7bDX1vHqOdywwYcvelycGxeTXT4CzNgfjE8c4vnG/i9VAGWGN1@vger.kernel.org
X-Gm-Message-State: AOJu0YyD9+6JKW6K7eDiNKMsXVMV+L78v29Z8B7K7+bWdopJi2kaDOOC
	or0ca0NeY5YDw2uAir1+nscutZobsdaWD8FQPVxc+FA4llaHyi6yC1NtA+V1zthLn+T7oWtSlsC
	B7g3YIw4r+PbndEln6vZSVuVg4hMYD7uucb5QtTHrmdI6Hnz08TK7zeRszQEHtKVyOmoU
X-Gm-Gg: AR+sD12Y5Q0Tuo8CvQn4iYbpIRdWANWvSDEU3qPtWW0sor5uQjZ9DBEzSt1n1dHbJDg
	CrX7mwgo1kuPRt2b/cMnIn2g2Sbna/NJlMkgkbSMUXUcOPTkuolxfiicfuT/qL/hCVYb81ruOP1
	0aeMuS6OTxYUixpv+AzW34B8KmOv3qv9nHd9hIwMIEJ2Mqe4BVDEPXYQ+4TRUMdUhK1EqwI84k6
	n45vyCSpuwtztoVT9Ik3/py2VH1TY0dnD8VI6RxIwrHmMypCyvfPvf6rYTZ3RS5WkukRdDiQEGO
	0Em6Hi/xIpDBzyMc0KwWWNFw73iXB+FZJrizp4/quMNbQ+ByYfWc6+jfktduMxJleX50Dxk5YYB
	A1/J8THCSDcCKHrGYnLFTyOsXaMUO0co43oo9swP/r/jbSQZk/DjgA//ulzFYgPJWs6CXhBqQc3
	RZFr/m9Tl59YMM1A==
X-Received: by 2002:a05:622a:4d90:b0:51c:1f97:e860 with SMTP id d75a77b69052e-52b38369643mr25104621cf.3.1785414213102;
        Thu, 30 Jul 2026 05:23:33 -0700 (PDT)
X-Received: by 2002:a05:622a:4d90:b0:51c:1f97:e860 with SMTP id d75a77b69052e-52b38369643mr25104281cf.3.1785414212626;
        Thu, 30 Jul 2026 05:23:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2dba017d2sm299539e87.82.2026.07.30.05.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 05:23:30 -0700 (PDT)
Date: Thu, 30 Jul 2026 15:23:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 00/22] arm64: dts: qcom: Fix the PCIe iommu-map entries
Message-ID: <qw62kk4cv3knqbwa44kvs5hj2uojkkgwrvd4mljd6g5qbn5xb4@jv2lsctxzliv>
References: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
X-Proofpoint-GUID: 7b1_2T6Ca7KYVC2nAEotmH7yKUpbZwIu
X-Authority-Analysis: v=2.4 cv=JeWMa0KV c=1 sm=1 tr=0 ts=6a6b4245 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=1D2sd95aFPLQU1VH4ZgA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 7b1_2T6Ca7KYVC2nAEotmH7yKUpbZwIu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5MyBTYWx0ZWRfX9odKgEuHMyD8
 489BE6EndKjpfm692KSmaSS8c3zuXLtGZPd5mNskAjpUsyKLHltSm2GMOP1ifpVVEWcHtxMi2wc
 Qys28b0JGgAqGLoM3LSTaUwNa2qj8VY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5MyBTYWx0ZWRfX2iVIwZENE4tH
 G7jIfSMYa+u7vY45yqPXAgBHU6V/E6XVSAFqPH9T4p+qGZ9iyLeq8KCz5+wjhO9jRbCm/ehp8X5
 cYv/6bENeIawO7eQNedQM/PFlRN+DDpB6lVJ3OMt8ZW5MOzv66b70K5OAUlG/ylPdz7yT/4e3cy
 9aNNCWRTV3Cx8k/E/QNP5txmoDbk5xY/M8EyEuiv2K1TBUd+gfolRW2SWWnO50JrE5ns8Ccu1Jt
 Gkl/vqTburON+n0mOnwoFCmk4U1SICpc+ZowOE60mIrLkY6bJxt/x7MQV9MjFUyaN1ckj2VLhpA
 145sdd4zBVWvv2HTjEjsqZrQLKACVxpUhMKVT+gNahhLh3E815BD0aNvXDkvgA3pWeTlWwXWhR3
 FUfsECHdQzYrCxxjNjGeveC6D6lxyXT8hw/FBMRovQC+IAsJSEJU0AmYB3K+/ux9YCnWtKNEt3F
 lsuCrgShNeML25+07EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300093

On Thu, Jul 30, 2026 at 01:55:41PM +0200, Manivannan Sadhasivam via B4 Relay wrote:
> Several Qualcomm SoCs declare their IOMMU providers like apps_smmu and
> pcie_smmu, with '#iommu-cells = <2>', where the two cells are the SID
> and the SID mask. But the PCIe iommu-map entries on these SoCs specify
> only one output cell for the SID and omit the mask. This went unnoticed
> until the OF core started warning with commit
> ccb2fd725d41 ("of: Respect #{iommu,msi}-cells in maps"):
> 
>   iommu-map has 1-cell entries targeting 2-cell #iommu-cells, treating as 1-cell output
> 
> So this series fixes the iommu-map entries across the affected SoC, SoM, board
> and overlay files to match the provider's '#iommu-cells' property.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Note, this must be merged only after the commit fixing iommu-maps lands
in the qcom dt tree.

For the series itself:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
