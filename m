Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615276;
	b=Rx+Cj68k7AEnbCURxI4wkcvvPb4RswOPlJdNCgZFDaWCClMpSF1eRvs2QImX5HMbeTVL
	 bLFz3l51n2Wn01kt++JQO/QbCkLsAS7ZKRF9tyDCc7ICoWLIHM6cq6JeeWFWytDXDH1Ws
	 mlZrEy3kGv55Cyczzq2YfOoF7os1jzW+29jKYdQcvq46147ImQvnrtdrBXSmhBlHjXps0
	 Q3v5IEPcrVfwXUmImM9W89MtF2a/qF+7HJay3LkJ8xlbDS/HmUYkV46wY9wbPaE8xKkOj
	 J4jJ8eOWxjLeOa1uuW1Y7wC14iINPHB4V2dNmadCwbDf6ZDAJ6iRaZ82v2XnR3MoQCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615276;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aFnKrPahxdZItDKPsTLjlGEttL3SSieVGxwpz1WB970=;
	b=On8wnyD+lvU4ZAbx1VV5MPLFzDRDjNgJmeUe7/II2ye/1Mlo4qlgrTKlYct/HbUPvP8o
	 C5fnFkXE14nzliUklE5r4jmD7d3IOWYzHFU70bQDGplYLxtHIJ18D9B3Va1PLOHPe1VLi
	 vJDNIny7Im3Fss2OcuTjZQVB2NFesAp7nwkZ/NYEaKBpNvMsNHdQtSO+s0nJhLST9Gc9w
	 ULNGRfJqlRCVWRSK4I8SfbwdgLtUBNpNh0IJO9fYNnwvX18gwKA5zY2HG90wCU7lk0GIB
	 IFqxru0CIhY3UAk84x6iQKqVStonLwIpzYw6gu8qO1bvpRbPLH+miQ3faSrQ5ETXXag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IQS9CR5M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UsGGV02w;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571FE606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 571FE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IQS9CR5M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UsGGV02w
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A299xn33430281
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aFnKrPahxdZItDKPsTLjlGEt
	tL3SSieVGxwpz1WB970=; b=IQS9CR5MACBtEgzZAUwsfGRBNBndxkNx3KxtN6wm
	nzzvUcIrtUWoZvfcz3lxaYoP5z5E4WOVGKw0KnNu5YhODMOCSigK2z5aMtyHE0hw
	jqrLaWGw2rDer9HWBxd2jxzGDhVKIroDzLBFKC7zqFirq8Yb3olkEKcnDVGceYF9
	KvYb9X39CWKCSSzJvDR0P89H8z7B1u6VcSr79w5h4saFPpqcsn7KbWkNTquDE1pg
	tSWKlwBZIbXAis3zBL4sSsFRdZutqQX9A0ZhyS2sI4H7/jPqDtjlp6L5cceWD+Ct
	vHiAnUr9ZXL48/gen198v/P7GlTJySX85vXo03VDCyWR8Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmeruhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:27:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c70349f65so61204706d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615274; x=1794220074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aFnKrPahxdZItDKPsTLjlGEttL3SSieVGxwpz1WB970=;
        b=UsGGV02wfFyjDeLk3tW1iaVb4KVGpoQqEAUR6z7Y8SR0lCc6p50o0+mEr63K2NZo8J
         uN0DhfY4kBnGVHuf6Sll8WiFpuuCn2kjmgN2bMF/bQ6EoaQoU65M/fwSqbS3ZLYiz8O0
         1pmX3BXyaVQRpJDJYs3Gl9KF87QplXmco/PB9z4cS8PPTLZwyoCILxhe1+9f2qYoaTBu
         NoAMxGEDbp3v0ucvdJpjtVXWV8YF6z0JqQCHhjYyy3Hr5GahczBtWeesd2/cWw6Sgx0o
         P3LFGwlZac4ojfSowsOy6iS0dWyHv5FtyfXHu+/4rtMzgpl4A1GIRyRoWVdMDvzx+8i7
         +JkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615274; x=1794220074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFnKrPahxdZItDKPsTLjlGEttL3SSieVGxwpz1WB970=;
        b=AQB9rZlIY47QfmoXDpRmrb1hVQNGcwfqrKI2xXWEZZ6o9gZHAFYRxXU99igu6xAoI7
         wKUGL+lYa7Wy3RWBGG+dpqg4CJPdL9Q1CtQnuRmcwYT5uJ3FqBa0HdrK5BtWcxBTmi3Y
         v+OiJKhMiSZ7FSeKUBwINdXoH2Lp0uGb7/9wnuGNufn815IiC/HkYvJnV3sDcwQLDWh6
         97u5gOS1Tn2ELqmj3aitBIJCaRV/r3YmAWeqn7rFO4QCbocfNcSQGblZ8ayeJToLNUcA
         yMee/QxTcBAuYoyDukc68vCOnJyyMOjMoDlN6gwg7BKCkQexGdfj900NRtAJTd3sYb0e
         C7lg==
X-Forwarded-Encrypted: i=1; AKwUvByB8gHF4k7LqBWZ6AQTPF/hCYLZv7hlng0yMcn3ZdD62b5LMTrdPoKPYipJC7G1znTSOKnKToXG4HAj8pmm@vger.kernel.org
X-Gm-Message-State: AFq9FYIJ0cU5MR/m1tEUODetN8AyRTotbpmma/cu8Yc4xb9bThCxlIR5
	47bnpqTaT850qWF6sIEnnZUNCvQpMGau51dDfrFbpi04MkTN3epjOofgCnLar92ZR4JDXw1UDwv
	EqfNYAY3MCs3RvBKqANeB1173BZout6nH+ht30Z7RpmIc//9j6wlhk8cs6S33UtyVQ9gF
X-Gm-Gg: AYBFou1DyyM+oJwUYkOqg6YivHtcHuwOKcGKGBbK08NX++Puc8z/hZtk3275sfZyhcn
	b+uCHeB6pqNXRQpKBoSsdHnyns4l7n/k6/fHrtN6EJS8rOxYJojupfIVX8RzvCBkTbzv2RAZ52n
	6vFmmmTfceiPUlqVLgDmtFVOlavx+AxrfPxCOYgB5qlzmoowS7vdU40Tqn9t/RolDphhqyAcXf4
	74tnLQYk8/dNntRjDr9FmvE5WETfwHTMemzDU1wBH4pdDHSWe1E7DwdKWN5qTfsqqK1Uctuj39R
	EIM9eOFEwtFNCrE5hFtG2oGVknbQGnKKmUks6NssHyfAceoLCGFZUXbTZiwkiTOKR2ntmNw5wlg
	EVd0LlwkPUurEE71i8WQQdSjYzSkB9fTuVeZjUJuJ42BNE6dv7xhKKh/eJ8CwkXXff0zI4itU82
	MY2kT8LS27qjtfYCky5oMaPUQ8jZ78gdEAjXhMMBk0YezPzbU+bvV943wqMi3x
X-Received: by 2002:a05:620a:458c:b0:93f:102:566 with SMTP id af79cd13be357-9442178cd46mr1656686885a.67.1793615274535;
        Mon, 02 Nov 2026 02:27:54 -0800 (PST)
X-Received: by 2002:a05:620a:458c:b0:93f:102:566 with SMTP id af79cd13be357-9442178cd46mr1656684185a.67.1793615274078;
        Mon, 02 Nov 2026 02:27:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0721784sm1677022e87.22.2026.11.02.02.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:27:52 -0800 (PST)
Date: Mon, 2 Nov 2026 12:27:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm/gem: Fix VM_BIND range check
Message-ID: <425xxjrsglh7hzenjwogtxto3xyn46zdm7mzfrrvonyichqv6m@72f4nygmedgy>
References: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
 <20261101174911.25184-2-robin.clark@oss.qualcomm.com>
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
In-Reply-To: <20261101174911.25184-2-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae865ab cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=chFjt-TYfWtG2qqLwSIA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX2XprPp2hXzLL
 PG2WC3THkjiTk0TOpK+Cwb5OwzHMBCl9Qd9fkh8zIRTPMeEVYZ7Dz0o+/z+HIoRqwALRJi68OpY
 ocB3AtcgvUwbBVHvTRiqYVwrx800pswLXqv80nRvWmOCrn1kA3Ly9h5CymRYZfYBtDpLvFsEkNx
 ZHhNn+6HxPY+T7qMBtw8j+tb3YN5IKpOsxeFySQDzWkGW7On9kzG6Je4SZ99yR7v5kwAUaN7yBg
 22sn/j+QOkhAZB8aizB35MjfEriFSG76o619m7+oPIVDKLkXUFgzvGnDWZZHPnFxk/rexzWlL18
 u2WPT2ul78AEFm0sfQwsPd3lfWoK8TQPayave8UiTkhAeGFsACYwbv6NuRce2WpKAGCXEp7bjps
 J4UKo0839yTxB3JpKeShR4+Dvsxhd39emBIh+VpapxvscRZaXs9z+a+2IdBTBSF+kT1hcS/0jiP
 yQoxMEjpCgoOLxPQErg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX66XOIFg+mXHR
 wD1pxr0FcOASTUxV2R/Ub/sJJN9bEvaRB4pRVKsfSp4K8XZ5D2fXuSU/pNwJY3yLL+JqxhbiMIr
 NF665mutuaFILxbfoXmrSHR+O44+yPI=
X-Proofpoint-ORIG-GUID: nJy1wU9yxCTYy-lNhzwz8SASEz3g34im
X-Proofpoint-GUID: nJy1wU9yxCTYy-lNhzwz8SASEz3g34im
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020041

On Sun, Nov 01, 2026 at 09:49:09AM -0800, Rob Clark wrote:
> Use size_add() to guard against overflow.
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range validation")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
