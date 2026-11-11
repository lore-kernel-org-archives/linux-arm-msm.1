Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408132;
	b=0FxhEEieUl9QZIEJ3ex3lfZjCEPsabaNoCGuozqZwfqT/VtqwkBs5FsOnohUzvb9hrXY
	 RWsbMDKVRyVixrO1MK6G+GWz2Rg1FXazitBXLCI6SGNF0N40ZGULRMZlx8jdu3D30owXS
	 tzoHCOlCO0sCZh3ISbJYh0WHi0Vwv0j0JbvNsAFGpZItmTcfeIJlQLRlN15FfCeOqUWAg
	 DFD9uXPW8CrxqkAubtNjsnXKxVFIEFQ76yKV2QviugwUd6XNMXM6w3i0fTA32IuMxGpyK
	 N/M+uhXWs2BJmDbBIoiEfYgIssG5sj0vUR9qWNIr2DCC8yHVH/9vXgt36SQ3RMy713A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408132;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BW1yja6PNKybb/pgnVziGD3AKdRvCLYee15vbiBT5Ro=;
	b=EZD0eXB0KYOfdcQ2RGgjHOnSXwcolngPVR3sxrP+g8Qutw62KYPEalwgmiIQDsPlO31Z
	 HJKN9OL69u/CNnAbgm10OTjZ+ilkVj1kz4OOt5iP2ydO8m7VrVbJEx8DNBnRjATc63MO3
	 mrtNtanZMQRZKsqOQ7AKWa1DudKLGwclDr1G/jnl6r20i9fqil9KjwiwVa1VazJTtVgpL
	 RBcOy+3X4hl0zmshL91EeCnHYuVOWgEO7c+O4tI3Y+b7ICzAkc6IJHlZe0pPIeIr8yLCo
	 T4IHX6jkSwaCJwblEb8cpYn5HhOJBZJLpGUeQ2YwmCBv+w/bNyOnOlOnIsmJltoHmlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GnjWMpqk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQfsyfpK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47075606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47075606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GnjWMpqk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQfsyfpK
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEHdCV2501548
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BW1yja6PNKybb/pgnVziGD3A
	KdRvCLYee15vbiBT5Ro=; b=GnjWMpqktld/wlG/bijOOYuZ5g8jQ/zGglj/ukII
	rjoCCY/2NDySMtOMKha7d9STFuZf/exApjMF2m+6PPy6uOB6TneNhsQML00n2qYA
	pE1+mP3kC+/oVFffR5LWmZELPsxu39lTsbhre6f+sh6RG4PKFjDUqmO+0CZDdyvz
	fEwNx40cKDaPYrGpKy1LUv+2eWQ/YK76xHRdv4y97EeItnVrUdCTgcLTKyHySnfG
	AOn/F+/QQCitrzietwaMMsEYHgr8c2tnrcNjcPVEI9u1sleMwRfhcsOFlLg588lH
	Y9pRNtvXGAwG5wLJfTbmJW0NVxljwAlMttGF33sHU/a1rg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm9md1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:42:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so627101385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794408130; x=1795012930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BW1yja6PNKybb/pgnVziGD3AKdRvCLYee15vbiBT5Ro=;
        b=FQfsyfpK7NlR9ovGQ9YkiaDaxkRpf/Ng2I7jS/0FIJ4YKV5sveYJ7PbHHAjzxnaA0Y
         ZZ9pPysEWzGvsPRIbjPwDVru69GWy2vIPujjkB3kXrUSqBw/AsMRfPmrCoJTD+fbRLpG
         jr05RzYv/92NyyZ8Rrc4cbSD3cPKCPVDdBq+4FASfudZlTkRG4PjSn6jk91M/FqvsAd4
         MMQ3h78nnsLczLBLJeXUr+UhIzPd9JzHGA38iOVyf8IlwMQLamoyeYgQr9kOx4Ul6EXI
         eY9qcTIWNNnNGn4u2F++piDDfTbyFeyKo8YIfuh+O1R52gHTSb3AW+VXIvsMbmmhfW6f
         UOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408130; x=1795012930;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BW1yja6PNKybb/pgnVziGD3AKdRvCLYee15vbiBT5Ro=;
        b=RJOYgzjoRObETZGDsj6m7TgL8yx9LPZPGCM9n2+ITB39yfOjBtKXIYJOPiJ2DQrZO3
         s/tfs/2yHlkvWxEg0R7Yqq2N7vuUBQwQ3aHsHn8yjFQAQ6NVN7kz3cBuByQR6uLQ+QkA
         /ro6NhAJx+WHPWK1GCCG6UBxPpJl/9N+yM1JwI3iW17qBwhvEBKaOSyDtthoQ0AeftQH
         z+m2qfdOZ+GdFp0OBO+5yT7LalyZs3buIHnyx1YXYI2R72Np3VyWYt0Tj8q1DsWaHGYc
         DyTNA+nElWwRbg+0JCXdrdKq+XQDQS+NAXWaF+VEBpOLQ7qj5H/cNO63OwYkS5TMZxpM
         ZIqA==
X-Forwarded-Encrypted: i=1; AL+hErF3ixtudgYkrHFCXlhc/rt4NEcd/+nJcU1GPqmjwihAzM56IXrX92CxoZ/OOYrT+cpqJOM0YoPVjNMyjuqV@vger.kernel.org
X-Gm-Message-State: APuU4Z9Hj4KUpGyMH8Xuw1DF5ctZ0WbYFKSXU8TP8ogiheBBvnooow8L
	DECLVbiKWquKsUJWArrbLvdK+q4+7KFfqdovzm5QN+L8yt6w+JPXiQrrRTcyacnQJOcVLDij48W
	lvdiLwZ2OiSu4QVF/WaFK/Y6hNo1Ht8g1C+c7668I3k6Mm+DDoVd6TGXNDLvqGi9nOww0
X-Gm-Gg: AYBFou0TCwYyboXI9lftBx+QI6yZdgfFb7eWJgq9Ri78kuYppZaPd8LOFam5JWPDu4B
	dXUh6LzbxeVdb2VNfUqJ1dLsKsBqOmy2AYkINzOYjICtP3uLr6mDvdNRt1YnPMuSzQ6DzIbQE3d
	tOv71PqbHczBBnEz37bGvORCIx3pzOnjJORFgcOog9Rj/aHokxE0lkReETBGUsWfIuw4ZglGp07
	LuViXrfN+9o/aqEeIh4JG+OgUcCaNwT7RUlntmrRDpXADaEvNONU5VbJkGFLNwA0Itpu34bHy2z
	BmZIPGwjPY8ieL2xwUQooOZQhpxNAYNRDSbyK9xJ7z00b7wE+1CE7TVVJdzInnVNytemQmF+aPh
	D5HC7ZnNRFYVWc+SzqMbGEt7xm/TyXGV40FvCOtm4DWopEkYkt1I4Cl4nhRu0AqJ3
X-Received: by 2002:a05:620a:1709:b0:93e:942f:b8b1 with SMTP id af79cd13be357-947affc669cmr401699185a.64.1794408130156;
        Wed, 11 Nov 2026 06:42:10 -0800 (PST)
X-Received: by 2002:a05:620a:1709:b0:93e:942f:b8b1 with SMTP id af79cd13be357-947affc669cmr401692785a.64.1794408129484;
        Wed, 11 Nov 2026 06:42:09 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284cce7sm11855545f8f.8.2026.11.11.06.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:42:08 -0800 (PST)
Date: Wed, 11 Nov 2026 16:42:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: qcom: sdm845: Bump fastrpc shared DMA
 pool to 32MB for 16k pages
Message-ID: <s4nesb77yrzxk36nhrqca5hit3lmsnw5n3rsa6sopta6crbbur@ttkl4iftgl3h>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-10-ardb+git@google.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111115303.3749380-10-ardb+git@google.com>
X-Proofpoint-GUID: o1kHgbK3x_kho51-xDnZpEUyU4mcf0Ar
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX1TxdsakeLHtc
 f3Ug8NngX0XgMlUF52jgubNWDrq0b1VV20VtBLqolrzK+hpeHxVQyH+HDUogt+MAEIsfQDr9B/z
 urPxOIWyGx6IilBw0DWJ92rynzkD2MeipXlQgkF72VuNA/PneP94wmC2L0twL/nWbEZQDSjt7FW
 V2cQz4TZ+I5ZezY3zhMGIA3gGVhRxdJwLtuTORLsNoTfvR8l+59kvD792LJENSwCzc4l0zWt26F
 Lcq6aygyjzYam1FcFW2wceUhwhozlAwVLI3ZoZjMGUoA8CWANtacWyi3S+dnM2A2+KFhXCLd6VS
 sMHwe4b3U6knR/XMwkOpvHjSH2UZpgYRY/uiGayV6/4A2INfUSznTWE/23/LUC/++n2UTgwziGY
 Mh3w8gRce6R3uSQHBzDot8Q8EHS2qKZWRHwXt55jKrqoR7vJuHLs/FzLxusPQ7DiSwNWcP+cAH5
 a0a/bINGDFu3OrVqgdQ==
X-Proofpoint-ORIG-GUID: o1kHgbK3x_kho51-xDnZpEUyU4mcf0Ar
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af47ec3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Q0vFCno5Q2I3JVtQNlIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX16B7hsjUrrf0
 TsSGY5/UCckEB095UrUZy9YtTi6afoQZYtbDwVizsT1txvk/u1magQsMK4S9dPYqIza3DyXWTZV
 dmSmNSg18l9Z5OepH9JJxjtHT2lFhsc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110058

On 26-11-11 12:53:05, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The CMA driver wants memory pools whose base and size are aligned to the
> PMD size, which is 32M when running with 16k pages. So increase the
> shared DMA pool size from 16M to 32M and set its minimum alignment to
> 32M as well.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
