Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBD242DA5B
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751913; cv=none; b=sErQcbVieTLlttHMEgCFP4hdEJW1UT2OJIGHn5Lrsv7ddmF5iO2ydCpQ/y5cdvVn9eAnfX2gs9OZXHc/jmJzv79HiZT3TAV7fpPRtkVMkRdhtcvpYnUeuLClZOu2itV1Qdis1XHwY6flgMvrrwzXVBERv7w8aJIcc0RTy/5XuD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751913; c=relaxed/simple;
	bh=LX3nqpwS0fC6BJCoe4QxlvZf/geKnh5eNaAhQC8kX9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApQ12n3pMsVnYj8X1gr54EagiVCi5MrMCoL8PgS/L/cwEd1TSj8os6P/n60GXhoGlBGD3gEym/dILbZZXUpNA5oBd7h2AiGw5fe7auDKHbMCElcvg8N1EI2or/oAk4xXi2WH0eedNrKX+A0B+ZNKh1G5GaGYdlkxSI+8lY+0b/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A9NRXbQq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bXl/rO9l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A9NRXbQq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bXl/rO9l"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCUFm8949050
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5mZV0itA3lsoJNJxG2ntO+RX
	31WBEmhiAf1sNhpQbjg=; b=A9NRXbQqZq6GFmHSOEKpAPAQ8veuHFtRmvu7JVc9
	SiBFdk50qFDSXULA2VDd++3oxqnSq6xgO15FVzaIX93HzdmrELn8FnAgCrZRoXBe
	CLOkWzG9fmG/Bq8QIiDOS8EcrgDH4wRRFvmLXV2WpFkj0qqcDE/ZXkURLUUcjHLj
	NRTKkP8j4/Sc9axljusz3WQ2WTl/JehOY6yHwLHbnOGcEuazsj1ix/Vym0J/GQkH
	5D7GJPk1ZrwBuGpAchRqEXNIuGktf5wZ4u0O6d+g2cp/tv+QtfuZLiL6kB8TgvKa
	kBx6xdUsA3VvV6z3cq4M9E1yJ9HMpWOnBy/0Z32OOyXlTA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga07589g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:45:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52de05de414so11903391cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 06:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751901; x=1788356701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5mZV0itA3lsoJNJxG2ntO+RX31WBEmhiAf1sNhpQbjg=;
        b=bXl/rO9lDj7IxZLPJYNxI5CEz9C4swOID4iCAq197NPqAvpXW6Px9cl5xuL6cB690u
         3csdMsVZSTP4UwjTp+aiTYvNswIbftghnNK98j1RkLbYg7fPag9S7v4Nb2lLAUVux+Af
         a3AjXDZReYfRt0NMxgwdDHfFGhhzlam7AS+PNSJuuVglDyiZIrxK/sZuOBOL4Hs6/HD5
         ekk6YVMKZwHNZBHJyPGlz/P0qgnHT9rD+Mki8vfnvTm0zC2CnhuBW4juYbEQuqBCxhN4
         w/X1ES77jNqK+DmKim9zia/ZSVqbccX2AWEg34PyktsoNV5qfFEJecNTdtqD5DAiIp8s
         nDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751901; x=1788356701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5mZV0itA3lsoJNJxG2ntO+RX31WBEmhiAf1sNhpQbjg=;
        b=ec1DtBhvve8wjjPNdpt7nOpxYWhnzP3rc3c8wxxk1aZkZWYDi5Yp06UCv5ZA7FidYp
         fUaF1a1aHDvrChA425FheHWYOJQoTbVwUrw4KjezsazshyJ0Lo3BBtbH2+dCfEIg0GcO
         KbCRLLYKpul6gs5suM7oo+KjPplOxJUkHRbdKippfWLmWeOVvgCf5cRwPqYGi636QqZv
         WJtRK0Rz3JuGHnugXeutxgEBO1NuB7JRPmCyE3h3J20Caj77qWYsAKY2HkFL9Qy4XbF6
         ja00+W8QiggGHDO8McoMxV0Rf3WOKtpCKkHEDmrJluqb8DuHu6Aqb+KKT3XUAYiHI0ma
         V4aw==
X-Gm-Message-State: AFuF++ndEg3V9IdS9UQIbrs9c5aOxhSMND/2sGnrOKgJgZRDwl8aZBGR
	0VxT4AJvGMDdi/Onga1gZPQ2ZnmUFgzU25gxU1CWYIRBJNVIMD3xSm43iV6NVEslDkwzEe3uMeJ
	zbXSXVctS8PrKtWo/NflWi1Q3ZBHeDvcWiyuWxCEazUMJjov+Rpd5lCORxZ31grgwrO15
X-Gm-Gg: AR+sD10i7+gBOa672YN3yYviw4Qol/aC0POvp392J7WUjxLajDz6nnJj0DxsTltcaxX
	FiONtxSETp68U+lpyv87tfx/PMXXDvhtE1Np/rW1PtD0h/xAIHzVOb2ZXryu2HiWwWVQj9nOJJ+
	J69/z2n4drN3yUvJzAGsPU+gmq5CeNvkHevF6VBbx/0RuTTFHLEKSJG+ZmEjPmogYNRSVvgfE5s
	+F0D8LXlOExdI40a9SgobeJACaoFmot9+iCUaK+VQZxY3NeWZ5PHctH2XrYLGuQrg++IIgY0rg/
	Ua6HRJ6NfL818PYiQP3oriwPSnlrBLBsmpVsUORTu7BXj0prg2/Qb4cJfjoheKIlz6iLFOHahYX
	20J0hW7uI4FF8yOrzvpYhQmC+FzRu1eXWvCgqeYEdxZX/R9ExhnelgFXg638unlPcoO3C6qhi1r
	i92+RXOKVPsve5
X-Received: by 2002:a05:622b:117:10b0:52e:4831:cdc4 with SMTP id d75a77b69052e-52e4831cf29mr28042011cf.7.1787751900598;
        Wed, 26 Aug 2026 06:45:00 -0700 (PDT)
X-Received: by 2002:a05:622b:117:10b0:52e:4831:cdc4 with SMTP id d75a77b69052e-52e4831cf29mr28041511cf.7.1787751900128;
        Wed, 26 Aug 2026 06:45:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4a415346bsm593679e87.11.2026.08.26.06.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:44:59 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:44:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        kssb@qti.qualcomm.com
Subject: Re: NSP Images upstream for Nord Platform
Message-ID: <um3gwtud3z3hbsr52yftcozyqku7phvxhd24244knnm3hzfaem@j6i7uhod6pyv>
References: <ca4efa2a-41c8-4658-b386-0bc691e95179@oss.qualcomm.com>
 <kug342o2og57tdhortgabobe4vdjn2jkv3bxoqzfei767neg27@46p2slgpyj3w>
 <fa3ea7e5-2624-494d-a754-3ecc73ec832b@oss.qualcomm.com>
 <1b7a301e-9a2e-48c8-a78a-d3a800a2f9e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b7a301e-9a2e-48c8-a78a-d3a800a2f9e7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ssDjNOKlnNhc6LVO9QjeqEuPm3HaBlGd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfX7thhEnigMODv
 JJxWkseFAcvhR3mSR2jt84KV53HCbs6LT4dtmcA66HO3o1MCTPuJ3PdScx+RDIGTteR8rBEV8CD
 1A//t/9/q9G0Ik+y/XAnWiYyIduVA8ihf6KG1NVAd1GZC85K5F3Bs/ewIa311bsaXvpAVUf1d0p
 24jvbgOB+Es6JcX0YOv0hoPg+O+I8fxU/NCPcKuthW55XxNCcYv64/oee/P3s3bID+alW7FZc+G
 Th08mW53Toj7v6fIWM0thhOLUxbT8Aqqak1kbPioMmp0fbx5XoC41KGuy1DzqghXaSFma2xgZ94
 /BT1tQn3xiu4LP3csvOCVMC8ViuCgZUGhCbOjKu6I8Z6a0Wd+WYcajqBTKzS6VgsEU77RHRDBOa
 NQKFfxX1eWiIPXMtKGYrXOgdMQCtvHQxAsUjyh0kC93jZK542wmv9sBM0FaYU930oiPmReqhX9i
 pz/gky2CEB6TcR49B1g==
X-Proofpoint-GUID: ssDjNOKlnNhc6LVO9QjeqEuPm3HaBlGd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfX0HEZ2OjMDAae
 7fFyWLTM3+x9Lc8NqRy1EKJd6BRy8lvm3WJuTYnp4DMhhh9csJvLnmgHifM96+PEaBKNaKydx9K
 9YLHBmXk9qs5A5lOZBup+iaOHMCDt9Q=
X-Authority-Analysis: v=2.4 cv=RPiD2Yi+ c=1 sm=1 tr=0 ts=6a8eeddd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=fZIp80y1_M88fl-JViAA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260113

On Wed, Aug 26, 2026 at 02:49:15PM +0530, Venkata Kota wrote:
> 
> 
> On 8/26/2026 10:18 AM, Venkata Kota wrote:
> > 
> > 
> > On 8/21/2026 4:22 PM, Dmitry Baryshkov wrote:
> > > On Fri, Aug 21, 2026 at 03:50:14PM +0530, Venkata Kota wrote:
> > > > We are currently planning to upstream the NSP firmware for the Nord
> > > > platform. The platform contains four NSPs, and a single NSP
> > > > firmware binary
> > > > is built that can be used across all of them. However, the current SSL
> > > > validation mechanism requires a unique SWID to authenticate
> > > > firmware loading
> > > > on each NSP. As a result, four copies of the same firmware image are
> > > > generated during the build process, with each copy undergoing a
> > > > signing step
> > > > to embed the corresponding SWID information.
> > > > 
> > > > This approach is consistent with the methodology followed in the earlier
> > > > Nord program where firmware was successfully delivered. The same
> > > > reference
> > > > image is used for both QLI and upstream releases.
> > > > 
> > > > We attempted to upstream all four NSP firmware images; however, the
> > > > submission was rejected on the basis that the images are
> > > > identical. While
> > > > the underlying firmware content is the same, each image contains
> > > > a distinct
> > > > SWID and therefore does not represent a binary-identical copy. These
> > > > uniquely signed images are required to ensure successful
> > > > authentication and
> > > > loading on their respective NSPs. This requirement arises from
> > > > the current
> > > > SSL authentication implementation governing firmware loading.
> > > > 
> > > > Several proposals have been discussed regarding potential
> > > > enhancements to
> > > > the SSL authentication process. The SSL team has evaluated these
> > > > suggestions
> > > > and is currently assessing available options. However, any
> > > > viable solution
> > > > would require significant design changes, along with the associated
> > > > development effort and validation time.
> > > 
> > > Thanks for providing a good summary. The mdt_loader, the module used by
> > > the DSP driver to load the firmware, already supports loading ELF
> > > firmware split into multiple binary segments. While this (legacy) format
> > > is considered obsolete, it gives a hint on how to support the Nord
> > > platform, while keeping linux-firmware contents sane.
> > > 
> > > Please split the signature segment to a separate file having .bNN
> > > extension (where NN is the segment index) and make sure that mdt_loader
> > > can load it correctly, possibly extending the helper code. Use symbolic
> > > links to share main firmware image, while keeping only signatures apart.
> > > 
> > Hi Dmitry, I am working with the concerned teams to get this implemented
> > and take care of this problem not for this chipset, but a bunch of them
> > that would follow. This needs work from different teams and validation
> > as well. This is not in the purview of the image team to make these
> > changes and push. The solution needs to work upstream as well as on QLI
> > metas planned internally.

This is of no concern to the upstream linux-firmware or to the users of
it. You are trying to add more firmware files, which takes some space,
after it gets reworked we will still need to provide backwards
compatibility for the exsting filenames in linux-firmware, etc.

> > The estimated effort has been provided to be
> > roughly a month considering changes (generic) to all branches wherever
> > needed and push after validation.

mdt_loader already supports splitting the firmware into multiple
segments and loading it from the split configuration. It just needs to
be either reused as is or extended for this particular case. So, the
month is an overkill for such a simple task.

> > In the interim, in order to unblock
> > the feature testing for NORD across teams for the next one month or so,
> > the request is to allow the copies of the firmware for now. We would
> > remove them with the right solution as soon as the solution is available
> > with testing.
> 
> Hi Dmitry,
> As I understand, we see this release this week is the only release before
> December, by when we would move to latest Kernel on this program.

How is this related to the files being added to linux-firmware?

> There would not be any update on the NHLOS post this till December and this

Why? What if there are critical issues? Vulnerabilities?

More importantly, do you really need a new NHLOS update? Can it be
solved completely on the kernel side?

> is to unblock the rest of the teams work on their PRs. We would work on
> getting the changes done for a single copy of the image by then and post
> proper testing across targets and images, we would make changes to the
> upstream branch as well. The request is to help unblock the internal
> development activity.

Rejected. Internal development should not complicate upstream workflows
or upstream support process. We have had complaints that there are too
many firmware files for Qualcomm platforms. We should not bring extra
firmware files for no reason. Consider this as a request to also fix
lemans firmware to remove the duplication. On that platform, cdsp0/1 and
gpdsp0/1 show a significant overlap between firmware files.

-- 
With best wishes
Dmitry
