Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A823BB671
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 19:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791573123; cv=none; b=X5QegOaM/ppgKRoz2HcYlowot+y39M2Aphcov1LpuY5gZq1buU7YUWsjrbS8MU7z6xB9jSCWUW/mAtnWTBd/LYT9HI+RfE7JhUfVR7k/lhJUvgVkr5JyeBq9dOpseofkyj8PxhGD+4KFeVkPd5QPkEfbXYN56JT0ukSASE2jS18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791573123; c=relaxed/simple;
	bh=6BcyXUedRwNIZg/+M/T5XxIeJ13NgbgCs/YF2n5Wep4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvezZG56BNhFdiB2kCxFSyNNgWasqqLcyU/FU0MIaM4BpStHJ8CJtxfmByGctVU2xl2bVi5g6HTKJYd00+wkn+bK6yZAd8iS0BiaDeukj9eIu38GcJkzM5VtO79UXIr5TWNymipG2sEkNuhTXIV0nkoIdW6O3CwfljmFO0kIgmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKA+fSkV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHSpW7zA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKA+fSkV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHSpW7zA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZZZJ2460060
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 19:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b+zoMtv0ZCc2ved9YN/MjY3J
	Xy1JEV7egryQjS3u/wc=; b=GKA+fSkVJcj4UqVgYw5fvYwvP81c0aVgkDM6Lviq
	IpFN2gzfd+MpA//WbHQuidrH/zzQ2PmEHgA5XPTixa+9kOXkD7o3FRUVriBu6OMg
	22rDa0fATY/aNkinlm+oc3VwOC7AkBbjWvEXAQUQqXVW7IdEZ9G3aTUf5mNFhdQG
	l1LXBkem9hupA8NFtp+NZ0UHinzBONfXvy6Gyabh0+fqN7vdHqHG0oN5KowLBQQP
	qo6HqKtQD3B2GH8mq40pim6cvquFkSnKPB50wmWELmKGppTFv5nXV0d76cxQ1wcI
	Qg4kxyLKU0OCsCWH1yzKPHQrXg+NWlPIuFcKR05+s8IwCQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t88bnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 19:12:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91792488228so3331926d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 12:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791573121; x=1792177921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b+zoMtv0ZCc2ved9YN/MjY3JXy1JEV7egryQjS3u/wc=;
        b=bHSpW7zAsg3C8r72bjBaSbuaobhojI67gxDqIvKjDQSaMJiVlPdtJkW5IT04FAdBrB
         VRsapVg6TBlOcjfuMEvauYI9boD7bRQu6rXVIU9gllszTkTjz/+Z3MKpOt8cErBZg1yB
         yEKqpjM/vRq33yUHd0OaEfpUOQXUe7bUF9ddPlv7dnWkJXYZUtpfW2t58VpH1ja43y9W
         CDQEriWm59GE0bFITiTI7zxt/7g92ky/jPnzhtTvs8JrA5OeoKWEqTHyg/pu5sJL/Awi
         GqctYunnUNzN3emJjihxt1GZPxa0X8KYxKkk40VRFbXe/NW4Sl8hJpqgUVE2i4SFou8c
         f5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791573121; x=1792177921;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b+zoMtv0ZCc2ved9YN/MjY3JXy1JEV7egryQjS3u/wc=;
        b=gOL81LesFsCKG0em2D8FdAavJJoZvFFhFN0Rvln85r9wZ2oNKvuCbSfWwoxuUQKQiA
         F2ES6zGiZRikheT+ymGJyWjlYLdlopGeaHbMFkax7EVqBEbKEILzI8dX4HnxKWgSzKSc
         Pewm1Tpjx2Q3rByj2mi/E2N32Muf3sjt3jSdiHVnI1rZEADWKy3cB42IM1Mdo/WKcP3v
         L5ha4oKHdxLjtpcB3qQ//avE+IAjtustaXTvNxRn9bKMJESuqda+0pXqMK8iwT+4/4IU
         k+GAIe6KtDIChErVc1w59YakLGpH8/j7HOafl8+NHZjXq2fx8OqXlVMCN5zNaka4SJ2M
         2sBA==
X-Forwarded-Encrypted: i=1; AKwUvBx/zoQj9W3H1iAFAA3YCoR5Bo9xP04H5Atc1La7IZ1JiJCSJmNPq2bTCaYPC/JCAcf+Dx6AOtEQwNPNhR8p@vger.kernel.org
X-Gm-Message-State: AFuF++kNn2vwjfTwQ9wkuPrt4+x5mVLA1qSnU5ABRBKh5m6hHjb7wrog
	egLc9oMECK0Cd8Og/JtaWVLABl1rCJ4rVCDUKxR3pRirDQw7qsT4KvoZKKKWVJbA2SZaMnzOTmm
	uiMRzHWSJQdzTUH5r+NFuTd+KYWQpROQvGm+2BWa3teSaVFQ34msmMxxj0Ync2RovjrInoqti1O
	9PPjk=
X-Gm-Gg: AYBFou2xq6XOFqJGJH1S43ttOAk1cQIhUYkRRpXixsnh2PmLIBG+Pn0BKs4F/JwvTbG
	JXxk3XYS1STLfcFv8pXJNbcuw9VN9c+LrM8LHSjW6H9qi+QF1yjGHokOS0FMADqZbQ47AAxrEvU
	pSoVh/jleDuqxs+lzQesP5q6kQz4/5X82LD/EK4rHrD+FFCF08NtCzFAGqvHtN6IPF2SiZwAbod
	Bo18BBN9hNyuaj+Qr9j6EW1Zt3KloZXhvDL28ui+oh3/4bY/TD6/yP1K4Uc8J+J0it/esJa1gq5
	eIAOn9fB/6Vo3M2jPpNbHzKMCFqED2Owa1FpnpCzFc0npGGR6lWNkCWKU7EfE5C1gdMKaPUwGMC
	kogMl9rxoW0r8G/Y=
X-Received: by 2002:a05:620a:601b:b0:939:a45b:76ee with SMTP id af79cd13be357-93ebd1dc726mr471119285a.23.1791573120435;
        Fri, 09 Oct 2026 12:12:00 -0700 (PDT)
X-Received: by 2002:a05:620a:601b:b0:939:a45b:76ee with SMTP id af79cd13be357-93ebd1dc726mr471112185a.23.1791573119702;
        Fri, 09 Oct 2026 12:11:59 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea1fefsm88705995e9.11.2026.10.09.12.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:11:58 -0700 (PDT)
Date: Fri, 9 Oct 2026 22:11:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: juerg.haefliger@canonical.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hp-elitebook-ultra-g1q: Drop
 omnibook-x14.dts include
Message-ID: <3hc574blvlfxelyvrki27dc3pjabf36vc3jh7muiisz7cjuvbd@qv5cjqvao6he>
References: <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-0-9702f7c6f9a0@canonical.com>
 <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-2-9702f7c6f9a0@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-2-9702f7c6f9a0@canonical.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX5qw8upSXLwIO
 VeBCUgn7L09KilZO/K0G4Vtb1RXy5uf/2Sx9vxPnVSXgb+eCyhEZXBRvtq/2koQtxwHoYgeyK8i
 xS3uqPp8I4cr39wMPCTxFEcn6r4wJX8=
X-Proofpoint-ORIG-GUID: 6vmt4VNw1_jQbH3sAstdoavB_mfBTHM2
X-Authority-Analysis: v=2.4 cv=D9jSufRj c=1 sm=1 tr=0 ts=6ac93c81 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=DfNHnWVPAAAA:8 a=EUspDBNiAAAA:8 a=7U0OwENbvIhYZRclMzIA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-GUID: 6vmt4VNw1_jQbH3sAstdoavB_mfBTHM2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX3nRkzpKFj63L
 jVtuk8NBjZKVCsB4OoII1Wd01wNO9sKU2p4C8wqhB9Svky9N6RQFcYFBKLeWw/Ba6e3LxCcemvF
 LB3xZObEWgZejTuqKwMn+8KHhAQyOSQAnXtk7Yjk2q6s7bxCE9+A+dUkO6Ws0l/+3afWA8d89/Z
 kq2xHj7MeTnwyRHABMSKNbS38oUOO3yinVPFwPInVh1dkQX3q8dNc5rLfBvZXlU8AddQo6IYwLA
 Uu4T+qGPKkiCeMqmLQruwuj/lk1u/ToxLJZcP5ER2K4ztEpuFFMDyyfbYWQnUpefsG68fAaX9mZ
 H3g4wwi6TML3iVIWdPBRi5FQLW/3qMClif0iNpbf9udk2uhT1RdThXkPKPFvutOQLMAhZvNfwXV
 lONPkrNsTww+KFBUMYK18rlhnfuBG7dZNl8ximOgE3pIj696i9eahzYhnNyDnurIBY3agU/Q2qz
 Md5onw3HP3je1AvA3JA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610090076

On 26-10-08 20:34:46, Juerg Haefliger via B4 Relay wrote:
> From: Juerg Haefliger <juerg.haefliger@canonical.com>
> 
> The EliteBook Ultra G1q is a different product from the OmniBook X14 that
> happens to reuse the same mainboard, not a variant of it. As such, it
> should not be a child of x1e80100-hp-omnibook-x14 but rather a sibling.
> Include the shared base platform dtsi to match the other OmniBook X14s.
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>

You are also enabling the some remoteprocs, so please mention that in
the commit message.

With that fixed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
