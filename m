Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBE83DD866
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787214761; cv=none; b=j4VhrpmC1fC6Lq82LIL6ZI3OPNP5NVM4frl/idN5pyoqnaAz2p+PfvKVAvUtnDY4e9yr2CC+FRdCub6RZNpDCmW4GGwlwi3OJEOoFDcJ4eAms72eftZmcm9ZQjgStRFWFJM9BYatlwZQn0kDfyiNz1WuOBCrOT916t2d+CcGuCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787214761; c=relaxed/simple;
	bh=d3uVzH6+MZpEgvBkqjCnKeOHu3+EMSSpR9ydtLT9G3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIPfc/Saro8hRLkCWo1eIGDjxoIk7EAjtnbnr9nat50YVIcZ+1cQF9qajaTvExIstmoJxj7NDlE2LLWkSqvfdr7p0GvSEMw+unLIzQYd4VjeVd1Q04DB/GOT9UcTqddXtCLgXQQp6UEz6L6UhQFcbX8aCNPIMXnPxsuQGGhnpQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWrcYRLJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ew757NU6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWrcYRLJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ew757NU6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6N2du1027511
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NMhNcVIIev9w418/r1jeFcQu
	gt6ylFpMeNWt9381RdA=; b=NWrcYRLJLNyggHIjakcSG93Nat2PXJx59zxeFsjF
	7sGb8lr2GVZ6MwcFLvYYG3LEDj0p6uGrPqBdZQRney2bYPrdD8FEcDpIkjsFwJv7
	v61Q59vQQYg/2gAgQU5Sydoqq+5hf7RRFgmmpSKLWfuP53WneKfpORkTrTZXCeQS
	LwkNcHBrYf8FTlKfNrjVqwMaoqUulBJYjy5UPH3FAipZTo14e1eGg84HJjGN0OXY
	VjPu32n0zBYCMlJvvX/SnhiaVZIGoMVXGfdEb8ESJCKlTxKuLqJSwrmf2DwvKqzt
	7V+Istps+oGi6dVnMPzh71gcmB1JqS/JeGFw6sKNvDCh5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es4kx9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:32:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e62e3459fso226468985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 01:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787214757; x=1787819557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NMhNcVIIev9w418/r1jeFcQugt6ylFpMeNWt9381RdA=;
        b=Ew757NU6suh1q75eWddAuDg3pFjLn0wpq0iFK+e/InoPtVd9WRKmSiYEXP9HxSZybU
         NwTfxIecyW4hq9gOeq7pCcjc3fDjcGorCFQjAG0ZN+nv22vbo/+6NJ220DOLDBltZiIl
         Mac3qiRgDe6Dn9tvFXGe4GpTh6Eceuv3+DLkToKq7OTQgKrK9Jn6l634ZM8aeXjxatUr
         GJ9K9WrNpNevkeWCKlS5gVwcc3IdWRAb3UTYhKpkngqJl389gzAqZgCNMvrxFUfrVi0A
         UtIOYkLjtmoLVeylmFZQWlm+M5MDtdvfYDBLwoxSNPRaOu7zDZVA70YDbuX/o5wxxDpz
         +owA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787214757; x=1787819557;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NMhNcVIIev9w418/r1jeFcQugt6ylFpMeNWt9381RdA=;
        b=mEeez2GQ/fgP86Rc3bgx+7R3EOtq108N23kf9QwLZ72akn9CUXYpIXAkWrCJKw6V/x
         hMuAj/yAcz9PeE5V+c0xSjuclTlUxOFmaCufQhzunIocfoQ9LocO9Aok1ZLhV2RaMPo9
         uJTaonLImEpN3xAD0XAJbIkZPbcextg44cwPDQL0Y+U7WfIr8o/Gyt++xx1PmLr5V5RZ
         z6HOmtSEsfhbupQ1TbVrXqhkkFDGNcMJ39c+2HlWcAkJsTiuy5bZCzAWGByXGnxKgqDg
         igqlOM4GKwt7JRjjSaOxl4NL6o1Pnz75K9OBS4+QTNEkhEWdKuBzGsJTdO/5bw/yVXla
         BtdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+oeqN3iA+XVnXUZ9uLZ2rvr4UPtYWOWBB5PrH5tLNyaqJQYoGF0SODiCMCLS1sstIm/UpcozSIyR5o0oQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8xd8XIKQTsZzAdpQRKwytZ5mG5cvejL++Gl4shSpT+Algm7iE
	BQIOg58xRLxMVo4EFGovwKY74OB0jHMHwxR40ebtjuJoQphXv7WBhsbwiiM8mhVuqhYqQASPX36
	AYvDyIzSM4dZ3YPSbpRSXS2fNPVdiWhjCYnAZLy9tK786lMFghuk5yNebTdQs8cFqpQHU
X-Gm-Gg: AR+sD10Z9pMKCxxaSO8P5iDjzJGF7SPqwws/7plag9Y2Rhys0kbTeyNarTCKrq87on/
	k4yd1sd2pS0dE20v7ha/TCiAMPtV1T/UyDW6XjfOxtSP5Lf5OMrnrZAs1FCdIeLTaVPK3N4Sc00
	hy0ci3GvGTTRhmx1FJT89Vzhfp0cUz2TjgBNQFfZeifIq2hV1AI/7KizP4jGgwptS7K9MbHOagh
	lEB4lN0HBBNDxRv6xIk1VXvgUKRnHOKS/H5+pRSrzmzCSl5Qg2Zkzp8k1dZTRgKP7cfU2YQZxRr
	mOoDHnjB/2UNcCKAdX2nDC3E1a3b090WjVMa4/FSF6BxKDTwQeAErzo72bax8i0NFq3R4dJA8w1
	7XO93DNZa60SR2mc=
X-Received: by 2002:a05:620a:414a:b0:936:bc78:791b with SMTP id af79cd13be357-9371e2210acmr965403285a.15.1787214757297;
        Thu, 20 Aug 2026 01:32:37 -0700 (PDT)
X-Received: by 2002:a05:620a:414a:b0:936:bc78:791b with SMTP id af79cd13be357-9371e2210acmr965400885a.15.1787214756736;
        Thu, 20 Aug 2026 01:32:36 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b20a14c6sm34410875e9.0.2026.08.20.01.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 01:32:35 -0700 (PDT)
Date: Thu, 20 Aug 2026 11:32:34 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: agatti: Add memory-region for audio
 PD
Message-ID: <wyttz7lpgasuu2pxt5tibxbpq5eeav3oyezudousw2pvji7ub2@3odnelomtjaj>
References: <20260820-agatti-audio-v3-1-47337097ee53@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-agatti-audio-v3-1-47337097ee53@oss.qualcomm.com>
X-Proofpoint-GUID: GPL0NdKVwHhHNrQm52nfF7a5ezr0DCJu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA2MSBTYWx0ZWRfX/ucfcZjRZcOe
 E5ucVtmmV7em7jdB/yIppyeqH2Z/fQZbe1CIkaCVHartz+v0UmTIgnlHwWYYy5J6EsvyXJO5gwN
 g9RR26Yqh+1p/Ftgk5FckXyNttlGSa5ng+7eDb/oGcvQY0saqMzzGm09W2OIGUQBjGgOka3oP/p
 hcdEXrkT9sA8SGNyR07UvoQEpHRz4OpVj3rJyGDlkANuXyO3KK8xo0Vnm4ble40RDD7z4Oy2Fqi
 Ia03yPJXYzenz1Rt0zACGVpcI9YOPxpWolFgqOm4nShFltlnSSX1zlNBSk2obXyAo63mfKUHplA
 eJZDmFRlZC94ojAK1kPTMvZeQxi4MxYS3vdHqw01E9IIcvgSw6odxkgMKGTHJYPCJkc7y3y3NLH
 +JE5N4xJsuYUtpae13f4QvuxfcYeGNIc8ykpS4PBbgyYHrIOIqznJveyTh/XZDDqsV+Ee0KVlAQ
 noC8Q5+Z/CAhWb7rPFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA2MSBTYWx0ZWRfX1TDkwxDA4S3Z
 c8QtmofeF1+OwuznVfjj0TTQTA8+mQuG5PiAv5UxTiENFNbMsq+mvRJ7/hD+Xj1I4ITBx64+aGv
 fUF7bCmngJrD626nxq9Tly9jwP5uCj8=
X-Authority-Analysis: v=2.4 cv=CN8amxrD c=1 sm=1 tr=0 ts=6a86bba6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ev0zJbSacn9GrfYhrHkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: GPL0NdKVwHhHNrQm52nfF7a5ezr0DCJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200061

On 26-08-20 11:21:28, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
> Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
