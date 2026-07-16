Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E6841E6B4
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 12:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784204405; cv=none; b=NP3Gs6RwTyqk75jI0leYSvrTNt3W2RP+3oSyBNh6HZk1cTQx3ubsZ+DCCj+Ia5P7xQuu2KuEX6FyFFcjCnoTTj7bAj7gwQLA87MSrfnJV08xLWgC+hRmLaufTxB3hA+L1Uzj3bwYtnnnq4i6KnxxwiP2yUKG0C0J7cCRCrMBIqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784204405; c=relaxed/simple;
	bh=IvihLxTzJw1YuxfZsmv2OMWXoTk1psFfLCiJdYU77uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bm7+vsoVydgjUgCfElMqsjOvXTrFOCfjwd1q275RMqzrgivPNZCL4vGDdjClYOkpLUXTFGiie0f2YQkKJv6zXPFZ8zu0wEXXzQOJ06TFR+cu04RyItvAzvBr8raafFMjsLmoDrtjmlU/b24TD4fzvB/Rqer8RjNjgOem85C2/3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oo8ny8Zo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fXjBe6io; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oo8ny8Zo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fXjBe6io"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBiVOj2754643
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 12:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gnfV8mXoh8bJi/aMBOJjTI3s
	rvXjZPgofaMn/qDqyNA=; b=Oo8ny8ZocNouag3A4omFy8V+TOzzij2pOY5yAJ/G
	5kmCXudd6cVjO6qO8hS/VrMwcaB3QjXMpuDvCxx4Ozup9nV52IQdqSe3Eq8JX0eb
	5W+vlORkhKU0KbHu80oYT9560uQuQy8aBCIvN9hj+xiiHdBWXJtqnA4MYvghPY3b
	xb4f4LquG1ga3qzdHrf11TIDxgT2INR4RYwvQmqfMbTk8dqgKk+6+WTK7+gQYphQ
	qjFC5orxY29bcCjFHDPfLb+pQtVlzuJm2Srh9RVqjR89+7mH2qGgZPJrEFjBW1B8
	tAfkeMHdOmi9hfwM9aH5bkRdC1t33yvJ++os3qTYQ0wwtg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feu10954n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 12:20:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c891ed872ddso11554036a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 05:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784204399; x=1784809199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gnfV8mXoh8bJi/aMBOJjTI3srvXjZPgofaMn/qDqyNA=;
        b=fXjBe6iotrR4XQ9NZz5fuQJUmHZxEuILsLFNjpe9iJofMFWbXpC/1ByS3b/CO1DsAz
         N0YdSiIkgEBgL5rru2uAF6jhCtRwocfzpA+HoaItEVC7Y390u+fRDGlNI0iMNemFtdNy
         umMELJZl4P0rrjBtzbobPuMb6PnEck+s4/MhEIp8OgzTVSG7bJRAvXGJEffnDsQab8Uh
         thQN72fUtSy9odeLBkyUU1J0BFM/P2RohPjQdC/7p1sXdOyOe6366oD28yX3S4Wh7Ord
         2xaqUe/hQf7LSwpV2s9uppIlP98XXH2L2Qgo/EJQ5JtATFBLiWBcEwacaFvUS8EUwCAB
         hEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784204399; x=1784809199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnfV8mXoh8bJi/aMBOJjTI3srvXjZPgofaMn/qDqyNA=;
        b=Znpf08qWWnGYSPUUdU/QImAa7s849jR+SSN5iaD60PjEW3C5KoVf0vNFM8vRbA7ttd
         +dgUMVLXMQ9akaeQaw55e+jgcEfHMDAEjiAdLvsA+1Wp9+gqr5LkkS+PkQHZhgbwMSrt
         /Wbk57R4oz6rze29d4F7AWplEeU6WtMfLP/feUr9FO0AOmjEAHQ7ZSOrWYVY638x4XdS
         5uX9aLVY8Lw7N9h37ae/51Em5O2Hvues3UWB//Gb4fqPPGfvShQYC8seDRINAgD96PWA
         znueYueeK/RiwiG1R+54h4xV5FqOehYGsOgz2l4h3EaiOqLd4fs3A3bfDRWSMdzWNzmq
         KYsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqp7FZwV3fSfoLPbuGV0UIUXBi6oCclsLWvnijA9tZ+8oJxYNX6HZ620kjRk2Y4NMFUOq/OemvR05bQ0nQa@vger.kernel.org
X-Gm-Message-State: AOJu0YzFgzjnIoudUJ14xDza55d5wQTASb20/6vkk154efmHcbG6mloF
	uLoRx6EjQYMoyr1NDPgv2UG4b9wQ9T1ndvsgGHhB/HFQFw9aUVQpKCXMvCbfM/DZOkG6P2FrAxT
	KKq7e+1OvDpz4bYK+EAv2tYHlJJD8Zi3boxaggBo8zgO8UTBBSoRrcCQpc15nd2eBjnb/
X-Gm-Gg: AfdE7clcLksN0C3vprO+06J0hket/B4NvaDeXi2g5+jV8/7ZWsR+gDS7ZU/5DfDxrPw
	43mVZEiFv48CZWqmxqS3xOfNa8ovkkljcfHtXMqfq+R9+hrT4rMjyb/KhRpYDtns2nm56wt6Hl3
	bbmh5noJyndsWOX2yRrFI/9wqzwBBCZhBYyK/rB/2TdxOJnxzIqSZbO1zgXyiJBUQi5z2AqhoVt
	zRYVwg5vEl3Un5eBqlROQvvKI3FZSOfnNeVGG02I7Yyp/r7m2cnAIxl0HTuTFqdjOZGh8xsh4Sg
	IcuuABVt6PePnjOgyVdNZdSI/PXbP0JExqQ2teABhdCCh+WJRpkhM+6pySNT72B7qekRs+dL7If
	rmleZPu9+WGT2rT8TANv8ccIzDoQ=
X-Received: by 2002:a05:6a20:c786:b0:3c3:9ed1:2549 with SMTP id adf61e73a8af0-3c39ed1356dmr135365637.41.1784204399455;
        Thu, 16 Jul 2026 05:19:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:c786:b0:3c3:9ed1:2549 with SMTP id adf61e73a8af0-3c39ed1356dmr135323637.41.1784204398889;
        Thu, 16 Jul 2026 05:19:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cdc4accf4sm2336066c88.10.2026.07.16.05.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:19:58 -0700 (PDT)
Date: Thu, 16 Jul 2026 17:49:52 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Weimin Xiong <xiongwm2026@163.com>, robin.clark@oss.qualcomm.com,
        joro@8bytes.org, will@kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v3] iommu/msm: Fix dangling list entry on probe failure
Message-ID: <20260716121952.rccgie7y7ymkuh54@hu-mojha-hyd.qualcomm.com>
References: <20260716013229.91014-1-xiongwm2026@163.com>
 <20260716085313.207069-1-xiongwm2026@163.com>
 <6caf8ca0-8be5-4935-9766-10d21c71ac37@oss.qualcomm.com>
 <0f5ef1fe-7d15-4354-90eb-a7e42623ae94@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f5ef1fe-7d15-4354-90eb-a7e42623ae94@arm.com>
X-Proofpoint-ORIG-GUID: sLQLbY8qhG1llMBNfh984iEEXym_GokC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyNyBTYWx0ZWRfXybP9Qd1Iqr5A
 XuTlk5ViwgqW8cw7jITNMH/qHdis//JJaFIPUa4ryYkYuivZ/xh7QkLd5FYvE/4byuG343gLsEz
 pcNtfpRNG56bWNVKexn3mCb9zHy0fuhavYbkVOLnSqbJ/71JW5jHmUm1EC0Ao6pPo5zrqtIxKyR
 ha08WXFTdFlTdhYJyEMaSFaehEoabFb3C0aKnEA7HIlfivt3Pra891tIaDWR20OpiEFnpfxo1L9
 7a47n2Q+ThnlU3Xg+v8BCa3TuLCXMScn3qmEB1fPc536lpslFa1nJ6sdy7rBW081A2ROoQXHzaq
 PajmgdRoVZp0oOwDVepZuv5NQG0LvoS0Ak/KXxnembE4D5y99kzRIonMSnrYSgU2UG+9nJxs+KG
 8OMHc/a4JpN8Emu44eb9wQS5EghTf7Vlxou7uwybZ6ksVsYfrrEPByJYtEdd+eyns0ndd7+ziFO
 2o8D/KHqoc53LVyonrQ==
X-Proofpoint-GUID: sLQLbY8qhG1llMBNfh984iEEXym_GokC
X-Authority-Analysis: v=2.4 cv=BPODalQG c=1 sm=1 tr=0 ts=6a58cc70 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=3MspdcVbyA1qY6HslxQA:9 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyNyBTYWx0ZWRfXxdk9fQMMkHVy
 or7iIE0fuxiTC2d5bQ8AEMIegCILEL+f7CacMBPG05GpKkG6U5ikriejQpA+Zn0WRUH2MCJf8KM
 uWHFc/PNa2H+DT1wwsybwr36MW4WFbU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160127

On Thu, Jul 16, 2026 at 01:05:57PM +0100, Robin Murphy wrote:
> On 16/07/2026 10:42 am, Konrad Dybcio wrote:
> > On 7/16/26 10:53 AM, Weimin Xiong wrote:
> > > Move the list_add() call to the end of msm_iommu_probe() instead of
> > > adding cleanup paths, which avoids the dangling list entry problem
> > > entirely (suggested by Mukesh Ojha).
> > > 
> > > This approach simplifies the code by ensuring the iommu device is
> > > never added to the global list until after all potential failure
> > > points have passed.
> > > 
> > > Changes in v3:
> > > - Move list_add() to the end instead of adding cleanup labels
> > >    (suggested by Mukesh Ojha)
> > 
> > I think this approach introduces a race condition, because e.g.
> > iommu_ops->of_xlate() depends on the item being present in this list
> 
> Yes, the IOMMU instance must be ready to be fully functional *before*
> calling iommu_device_register(), since that can start probing and attaching
> client devices before it returns.

Right..I overlooked it.

v2 is fine ..


@Weimin,  JFYI, Always send patch revision as a new thread not as a reply of
previous version.

-- 
-Mukesh Ojha
