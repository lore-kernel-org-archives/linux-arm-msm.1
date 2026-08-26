Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA64733CEB0
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 12:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787746241; cv=none; b=cNwcwo1g20PitIiFas+7uOdTmHgaTfL9K7Mowio9pPyvmvpGO7ImFoOL+azb9b5Mks1D1uLMMFtqbd8fdkJhWr4LzgxUMQDNRWmnpbsloz7odW146ea3miYLESEBUmDQJ7RaBGpiP/sk+mLJrV9ti/AnHAISGb6S1qGH8Iq2WPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787746241; c=relaxed/simple;
	bh=0P4fcTB9k72ej3wUz9CmQN36dTA1d8/v14KkKK/0QI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/zup0tsIFhk6c5RXug7aBu3sK9/Y1xLdqfbi4wcNhby80kllhY7rtbPw1/D1xw/DNEnFrRUPJj2p2yb7F0Zc1b5/Ar3okWCdM5F++jRW7jjIAbSw8LYCoXqSpbzhyDrM32aCtAW9JqKI7LebOsCYD47z6KxXl1LXyALXWdd61U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQd1/2U5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKX+8aJx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQd1/2U5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKX+8aJx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAH97p425227
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 12:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=faow8O+cjE4ttzoSQ7ZB8oAb
	ooKihyGHBKug/csh670=; b=CQd1/2U5h2dPgaz7O26qRg9QbPZvhNkm7oCb9Km6
	eFAMw9GNQgEzt8ttTzu5OrTLj2i4+STnKcZFgk/JACNGP7Xtw+45RHdTOgrtIfPO
	K9+7sD+bxWC0YSIgmEmQTLn1gOrQdDyUX4tYap9rRoMEz7ueQxWf5s686rFRwtCt
	19OV1+qhUan/R7NRkcAW6iyfYKB+eUW6xbTLk28lctgWP/AtEA1BYY8bQKnt8Pa4
	gxPNekx638t0I3mEUHBCRuoSBtqH9nsmB/qdBAXMiDBCagI/SX63af1a1F9gsq5l
	cCVWAkMjJ5DxAsqTXLuB7u+0X3LBNze8uRGpxeqWrzU3EA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fceuseh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 12:10:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a236220so9052591cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787746235; x=1788351035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=faow8O+cjE4ttzoSQ7ZB8oAbooKihyGHBKug/csh670=;
        b=CKX+8aJxsJ3WlU51E1JpUwo8OrjhkxmaQh2gpHsIBcMQR03qADL5QQM8XtziJzM/Hr
         HFsE4fMueM5FOcZsZv/3lyRsZvq/4pY56c1ysm5kzyIizYP/fBa4FSjH0rjjL2XVjheu
         NTOCYN6dNPeIcL+leS+aQP9PANtsC/4OYHio+4I5uto0FxmI92oORRXou26pXwjDug8R
         R63nGjTTyV1gamOFN+8ug6TmNSXTwwOrsA9nNua/GbxpOAIMPSXMpsnEJE7NNYH5Kdp5
         cPoBUc68/MWp1qxq7sgSq2h1qhv5peAyxKfMJED1p8OTLELAlCIJXq+qWR+/M3m0Fqnt
         uvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787746235; x=1788351035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faow8O+cjE4ttzoSQ7ZB8oAbooKihyGHBKug/csh670=;
        b=BzFi+XVTVY8l4/vkeITA5VvRodUJGukv8mXnwoLv6IX3JjDz3V865VIFDdNNX8CjkL
         ZKtt/AYfbMnOfAvRdXAQFRmwfKBFjFBk1NxWj/vaXWeYm8fNtj9PpUN/Bn247iCAq4lS
         z/V9VyS1XG8hhpM38VfaNHUM3gqALGo6yIjB+QVHzh1O5FPo1zssb/X9eXGiflVBUd6K
         +rQ+bVYzb7e9tRczfXVyrtVM+jLZ/qC7/gITcp+APb5NiP5J2QymdbiqYZHaChbBZnmM
         zNG3x8EXxCao3lS7TqELyM1uYAMqoqv5BBucQuY2GGiHDy3VAKypFTr7AHMyN4W9wIgE
         4owg==
X-Forwarded-Encrypted: i=1; AHgh+RoMlkrqKNL8i/A5uHz3i/3Livvv1holMPo4xUguzZDidLcVCNWc3xkYrvifvzlBDD+JXNyv2BJlH4WgPO4Y@vger.kernel.org
X-Gm-Message-State: AFuF++mYtq3VJcR+30K3/llXd+FzYhpN0vAPy0DD6P/ElNVJJ1Fp2qqG
	AqtupAsqXF0LDeNQCoxdqDPy6E7gip+iyI06YTm/4N0LoACfzYKTeH3Gw12S3YFLxcQPBXS/h8t
	52dDqYvoERbDeBkt6TW2UttcEVz8pDu8138CVgmoiLkXSO9+q3C2pK3tYipe6H0swwaPgzrkoMm
	vc
X-Gm-Gg: AR+sD13FV18GnbSkOrNr5f4TywxHC14icGtrdQMqVxmhvJtIkCp0Hi+6N8CmoCVwIPh
	dYosFHqYpMzPNilEGKm7FA9a9LkbLIG45FBMc4/NC3c0yviVNtwihWCMCL8cq0pcdK2fJvzcwOa
	eY0DtMbQl/O71ysv3BmGYLfyPzFElN3VLoLww0sVVmn8SdZtbK3+UYGbMjBI8Bk7/XXOa3NqQmL
	Zc13hOV+U6nOd3ou5ii+Lqan0kOXbPwy0nMKQdC1GgDoUHo1IpfyqKRhm8HliN2RTimGlVc6KZ3
	+bVaHzi3WGv9j5mZlONC5vLhHt3KbAG+2cLXj+un8Yh9qdZVZDiIUNITLd7iGivb/1Vuo1IDh8y
	PHKzPSgIzfxZD
X-Received: by 2002:ac8:58c9:0:b0:517:78c7:d93a with SMTP id d75a77b69052e-52e4227150amr52989651cf.16.1787746234810;
        Wed, 26 Aug 2026 05:10:34 -0700 (PDT)
X-Received: by 2002:ac8:58c9:0:b0:517:78c7:d93a with SMTP id d75a77b69052e-52e4227150amr52988831cf.16.1787746234163;
        Wed, 26 Aug 2026 05:10:34 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ef4d2sm351731066b.59.2026.08.26.05.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:10:33 -0700 (PDT)
Date: Wed, 26 Aug 2026 15:10:31 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: common: Tune clock controller dependency
 on runtime PM framework
Message-ID: <6xbm6uq266y42ga54wkdn6364gjj44v4mmsjg53rhfi4e7rzmq@i2uwudm7pxcf>
References: <20260826112021.1455707-1-vladimir.zapolskiy@linaro.org>
 <20260826112021.1455707-2-vladimir.zapolskiy@linaro.org>
 <r3nxoo4w56oiyhbs6ysdh3rzfntwwk75m4csktar2hoxdhmfmu@rh4ghbaav4lu>
 <5c5a5617-1a74-435c-bff8-8813e4acc5b7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c5a5617-1a74-435c-bff8-8813e4acc5b7@linaro.org>
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8ed7bb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qEkJQMT-hTS9M5PVdzcA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEwMSBTYWx0ZWRfX2YCr0QGSZAZp
 DzFsMh9S+hNzI2rMu848qShYz5Gz29/+U0jjOAu3bikkM4Ftc/qUEv73njymFABxBHGkDYZrOUw
 HKvZVU0o/fsVujwsz5EPa0A3cGEoR2o=
X-Proofpoint-ORIG-GUID: cp4OoKA5jNx1ndNWtNoD4B4GlRilgRE8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEwMSBTYWx0ZWRfX7jOPCGOEOnXl
 bnFTS7wOMfOfkleNOVkNgoUUDJfKMhxRCDzAiYtGDBmVWsdqwvJ5ZHxYpvVy43ZdXMdeHx1ARZa
 Xsl5RdZUGOZT9T7m0JAD99xG7RUHFsW61set8h6UnjmB5GiNeTQ4Yud1OvfbFInhQyQE0aL2hL4
 HDF/5O/5emn0iA4JtNcK2/NKPqlwMIF8ShXoHwRYeSjUWjjvElDDAdF+IzCjdkYt0ol08mH5xjx
 i+nI6gc8L6Y9IeRnslp/aQhMI28RVBW3WZJzcEd+Sswn2Bdv0D6qj0ApgxYvaqXCoY75HK2syuI
 166X2WXZcW5/Aa4Znm8FZiUJ+eKPD3oWUHf14uWy5noa3hS4eT1PYEDOXozQNPTX7uEOOBQBwTi
 5MSN8LU9NjnjQcCwQyEbkmNamHdMmovS5zU5g7Axsco0GuR7KEWdyLtzatOq6pI0wwENsphiCda
 SIJpvfnHKyTlQggAhmA==
X-Proofpoint-GUID: cp4OoKA5jNx1ndNWtNoD4B4GlRilgRE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260101

On 26-08-26 14:50:03, Vladimir Zapolskiy wrote:
> On 8/26/26 14:31, Abel Vesa wrote:
> > On 26-08-26 14:20:20, Vladimir Zapolskiy wrote:
> > > A clock controller driver is expected to be embedded into runtime
> > > PM framework iff there are specified power domains to supply the clock
> > > controller. If there is no power domain, then it's a noop to add
> > > the driver into the runtime PM framework, and if there is a power domain,
> > > the dependency can be considered using this fact rather than relying on
> > > a probably stale data from a particular clock controller device driver.
> > > 
> > 
> > I don't think this is right.
> > 
> 
> Please elaborate what is wrong in the statement above.

Enabling runtime PM just because there is a power domain attached to it
is prone for breaking consumers. If for whatever reason the power
domains parent child relationship isn't right, the child PD vote might
not trickle down to the parent PD. So if runtime PM suspend happens, it will
drop the vote on its PD just because the genpd tree is missing stuff.

And you're enabling runtime PM for all controllers that have a PD attached,
even for those that do not have the use_rpm set to true currently (e.g.
Eliza).
