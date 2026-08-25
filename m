Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34943F484D
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787652588; cv=none; b=XlGWM0NFy/Q9FXXpvzaDh+IpiWDYRtj6QhkFd0Q422b33vYnOpJ5m6B/MqlBUodszyTyhlyAxnQJlXfmZiOCA6TXxLyOUtX1d/u43JIcouADY8tfs/DH/SotuuR715o1PAyUlhEoRjACG/IciwhlYZ94bia5I/fiS33J+v9zljE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787652588; c=relaxed/simple;
	bh=KgPjNR1beIIVR1sLf+AckdqU/z+Gqj06uIHvw6+fvdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhpeOy3lhOgghn08GhJmq4WafZJyPUel9yQKRbSoCnaZnZzlRPgR7fuINtz7t/cd9m+K73P4UNkrIidUGGzOTK/a7w2HIj2/Q8gNxxKI5tCnXAu9D4YAv8QuIczG7hmdGhhZDuquc0H3R01sjyXPQ+s/ARKwcPeiZEPwYJGI7yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o07VeGWR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPZMZDri; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o07VeGWR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPZMZDri"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88FM91934852
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eMJa30H7DkzCjuo1rsUnN+eg
	1rmbr25bqyL+tJh6XTs=; b=o07VeGWRriS/KUySrEGVaZl8V+7909ZIIysaEWFd
	JkmzYKiWCFRcv6+8zZSMH1I6ztMWzGOnjOpxOKE9P0LG2cib3W6Pk0+UQYe2NX5S
	zrSz4bLORZWAR4smTVN3r4QfbZxjRPvQuBNPvuWA76IhsWejIF2XyKQnN48oRzB4
	AFxtofGs5zIYAMQJ8bwRA9PP407FJFSjWTz+GmVYQ1SRgDXxpfjm3/irxfsEfLp2
	2m5H6Sog3x5JfR0cgH++i284You0V7CF7joSRkWHUIUKwbQbd3Ftzw5oOJfs2Yoy
	RQ4PNRIstHidSjiL0alj4w6/ZNYNbSuULxRGEFFTNziz3w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g92jqsm16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:09:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d827597fbso47635401cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787652584; x=1788257384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eMJa30H7DkzCjuo1rsUnN+eg1rmbr25bqyL+tJh6XTs=;
        b=SPZMZDriYLpI3AOekXAIGQ8UFoCQ2mIJEJsuO9AU8ZhjD8j9lJCjZ7uCBOvhzMSz2K
         4tO3StWja7cSk2ljyE/XVMe+TVJ5q7SOutiCREojVIBzIP5tDKjaVPX1EPK8ndxSKDnq
         Mv3dkTo3jQnbrsA1vpC5xQ4Bhm7BkC/NJDSxO4M18NAMFJ0uLVi1671EYQHmRYNiLe8S
         JjKeuEVe7VhiKRCdSZBGRXJxyMFUgheTO+whyYAu0dxlW96Pbgq/TFbYzC7rb+p8/A/x
         EHJ0KMSHBsrKYVjLIhHtiSFN7zsHXAm0/qRfMMp5kzVraDbe60Kf0y5AEWmzBd1IdCUa
         /GQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787652584; x=1788257384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMJa30H7DkzCjuo1rsUnN+eg1rmbr25bqyL+tJh6XTs=;
        b=hMzz4flL4Z4txe0hLlQiwdz/xG+aodOaEhIYeNVIh89Ic7KkquSjOitILUP/1Ftafy
         7JGAQ2Qo0HJcSgzIV1u8L/rKlCpQGtfMhWTnbB19olH72SNSbgob0dwSk7UbJKKYuRPV
         BF0diFw4c9xiLQJtj6PJiEwmGMEkVhuomA5Ubr1VxVl91KlLN/gX1BzE8dZmtTiWMODM
         hSu2YBxDZbotfvow9iwXRNeL1FpVezfnyi0ef3sjQIStJNKFM8Unh99DwPjf6nZOm4Vr
         gkC2Un5poEeQ2ht9VRtI0wpxCVVjdJJAXrF5jnhJQ+Mk0nW3aXuNIBlNGnM7iJ1Kriu3
         8Vsw==
X-Forwarded-Encrypted: i=1; AHgh+RrAssYgLgsqiIMOZipcZabIHQrv1okXMx/Fud4nq/MVhMpxdlp4pMncrjesrS6Ys+a/GyW0I63GcSdOibFj@vger.kernel.org
X-Gm-Message-State: AFuF++nLZ7DnbV6R+6/jTzl8+OljAB0wra5dUCE2d25MGU3JN8EDtjS+
	Cyais60VWJXgOkg1IsUwWhg/3il/GFWAEZTxJ9darSmaxY6ESSPpVMPdBVHOEMAqQuS7GebAHBN
	kyt33pMvDwreolfny5e0CgJf8Hw4XjbAP+sXEOEcgJqCrns3UGeGeIVYLQT8PekHeF087
X-Gm-Gg: AR+sD135D1GpbK9EB5zHtujW51+K+pWW78Khf/naC73V5vBKXB3pgU0dO8NKPhM1YXH
	ZnEbmjVsTt9LqtBNaVFtbsQ182nec1EFM0acCpi5AIUs76X7eLFIQFMI7ahxdG/MUrorM/KVfmI
	wB2eIcU+OeOZz+BIbOe+QH/mv5nCr9KO6nPrztDasT3FiQSdMwMumk78n+JlRmIXh35GMA3YhPx
	6WvpcldWQMawOgKJbgERJC69lSt2smflpU7s+itFA5VxvA/7OlAZSn+th66TnDoKMoWLZNJXka4
	yo13xbntwmzO4ZhL2jVGr0QkM6rUExE7OogWIfaoo5nTEbm5PW9Dn7z6VA4Q+yV5wHqh9C3Eu2d
	fm0j4O+eXsvyU
X-Received: by 2002:ac8:5881:0:b0:52d:ca81:e5b7 with SMTP id d75a77b69052e-52e2f069100mr52551471cf.8.1787652583688;
        Tue, 25 Aug 2026 03:09:43 -0700 (PDT)
X-Received: by 2002:ac8:5881:0:b0:52d:ca81:e5b7 with SMTP id d75a77b69052e-52e2f069100mr52551001cf.8.1787652583117;
        Tue, 25 Aug 2026 03:09:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606a8fasm1874057466b.8.2026.08.25.03.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:09:42 -0700 (PDT)
Date: Tue, 25 Aug 2026 13:09:40 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: qcom-geni: rename setup_fifo_params() to
 setup_spi_params() and make it void
Message-ID: <lxif5gsyfq24aq3vsiing7xufwdmhllmn3gzdm4sqopz2ttele@myvffcz72jqq>
References: <20260824-spi-qcom-geni-cleanup-setup-fifo-params-v1-1-bdf98ae62953@oss.qualcomm.com>
 <8e4684d0-d130-4c75-8b28-11fd98fc4a29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e4684d0-d130-4c75-8b28-11fd98fc4a29@oss.qualcomm.com>
X-Proofpoint-GUID: ZJ6SleNPoiOZzK78JU9XkNC6pTvCV7U5
X-Proofpoint-ORIG-GUID: ZJ6SleNPoiOZzK78JU9XkNC6pTvCV7U5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4NSBTYWx0ZWRfXx8d0TgZ960f7
 69IPDIWG2Eyc3mOAo7ZWg5Evf6WP2WtqI5VkGRf7u8Pmd7KbuqrM1t4R6Bi2k/CXPuQWVfBuzlL
 RAptXpQic2devkPDwML2/Ob3nSpjOXchmAgfsI5JgDDq4XAFC4eUm4I03aXkW0Nw/nyy+fZNGbI
 aIYS5RhpwnReH1+p9n6kGRiXZKnZC/ySu1l+LKP2Saq1dbjeIeuLxuBdm1s99dxPe61tUYkgmih
 mIu0Z0eUFQj9S4zro4rrYIgNV9fftOKJ0xpdSWuGAXNfBBxnKuvE0yBtuwiRVlSMynBTtReavwq
 wjiE1JKG8A9bD+X1DGNzMeb7sBnDSwmNAAbhH6/iN5cyj5rbLuGUaOFZjQ1f8/qeBhtji/kH6dk
 /jxfFrMVQloc0t34kKnre96Zya+kd8u66SREWrh42iO2wuc1o1QX10vKNbtfsEQO5C4Pst3d3q6
 06ETlokcqhI5CSVU/Vw==
X-Authority-Analysis: v=2.4 cv=JJULdcKb c=1 sm=1 tr=0 ts=6a8d69e8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=l2S-4nWEfdgaFz3rMeQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4NSBTYWx0ZWRfX5Z8djgirQY7m
 Vv3nCQ6iCtEeO2fyDehyNJr/zmO1zzOXi3osY8nOARicoAFdhZeH4alW4kzyE+64ll8zvMS72Sd
 nnw+Q7V8C+e7Cl4DrVZqxNc/Si+d+Bo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250085

On 26-08-25 14:01:10, Mukesh Savaliya wrote:
> 
> 
> On 8/24/2026 3:43 PM, Viken Dadhaniya wrote:
> > The function always returned 0 and had no error paths, so change its
> > return type to void. Drop the now-dead ret variable and error check
> > in spi_geni_prepare_message().
> > 
> > setup_fifo_params() is called for both GENI_SE_FIFO and GENI_SE_DMA
> > modes, so the "fifo" in the name is misleading. Rename it to
> > setup_spi_params() to better reflect its purpose of configuring SPI
> > mode parameters (CS, CPHA, CPOL, loopback, LSB-first).
> > 
> > No functional change.
> > 
> > Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > ---Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

FYI, there is a chance these might not be picked up by b4, when
applying.

Make sure when you reply with tags, they are actually part of the new
message.
