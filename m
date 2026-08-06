Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705D444C4EF
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 11:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786015823; cv=none; b=g1S2AFczVMjtZYiNrGLPeB3MRZxfhwBQLciK29tbq030JvAddCrNRel4LMLwciMKfUeXydsMb/YI+PJoldHhllQd+AYdRPM6SEhvhlv7bLXNpnvHIDvhnhuxD1FXOA3XO59ZM3PHRJ+/pHgo1d3qtadBBOyoJcGYqu/L+gmOTnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786015823; c=relaxed/simple;
	bh=U2PBsxeKkHWP5ICMHVm4UfrCYRFVNK1zsBFJPVBwJcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pV5AbxeBABOqZzO1QfdCmH92rMzuyUlWTT5UtCSwfs3iBpr9n0k666cb305502OD83rwBQmAeP+XPwYHWD1R8ItG2gAeZFx3Tij2ZxIBSQHdu9YXS46IdMnxrVFAHOidzmR07kxBZzfi8nTr+rcRmzrhvAPnzP1lAW6LAY3zeuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VV/3diu/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PAxGn5Rm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VV/3diu/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PAxGn5Rm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769oGuZ2106070
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 11:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M/usO8X3W55fRscG2ZK1PVUesgdixKhMlinKjh6t8kc=; b=VV/3diu/LcCf5JIg
	GeqGiZ0W9Kq6cgeXbdcNP9xA43H+C55xCeAwdHKjQS61WB7obnnRfKy4nJsX3oLv
	Z2hTYTX0oAwGLC+XtuKm/MRoks6pjnRJu8RzPlFM4sYYMAOi08sRV/GgKMkr0a9o
	UClmXK17ZxeNKaKKyo6b89MDaw0JkZlrCfGs35ENm12Fs3mFr8WKdgULmBI+8p7H
	tFZrGJdgBKLYmnV52QEi3SQxhw1FkVuX5N+UV6eM6bOFufBiXmZYcrQJVV/4SxQn
	MJYj5tU6m6EOjKbOrxjDE0kTHMj2mh6z4p9y0IJjFXSqt8/UN1zEm9JUHCdBcm9n
	V459Nw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvq730qwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 11:30:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso1533572a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 04:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786015821; x=1786620621; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M/usO8X3W55fRscG2ZK1PVUesgdixKhMlinKjh6t8kc=;
        b=PAxGn5RmgpMbT3Wrv8v0Q/BsGDxrlwBAOMgzPGmTZQyifCVgvuqDgnNXGixG7m97kO
         K8x515fhjOeEJVlDbnlY5lR+/o1E4Z3gW1z2iGz5J9EfscNfhiWUmCKVK+2GI/7NRomv
         1JzYvid6fTPnRPCovfM58q/YvWvbcDI3OBIuTs5fzJhMHjckPsfWpkOMWclfSSs84nWw
         f+rxB2lCzMA/UF5Kert4/S2W3w84wlo2q50AIZIK62xcPktjmBbw36ElpulwS8WPDBlB
         Sxdx7SeOpQIeS7e+EURG56iH+/M4ipviBzLE6EGhjnS0lDsaw51GEv5EzMNPbnEHNmfE
         agWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786015821; x=1786620621;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M/usO8X3W55fRscG2ZK1PVUesgdixKhMlinKjh6t8kc=;
        b=HELkay2I9uGrlwf657CYSIncSdHtPYJWF6j4Q+0PCowgflmS86VT+UinwXK//U6HVE
         gJL5CYsdWQNKiDZeFsN1usR984hvlhtPo21fWIyZruprJ+gY7Jjdj8JQ9MOjmeL5YcHb
         AZmxt3wnWADobfd0WWZmtKeL1PvxSyAHoChVSsTgUfn3ppghhc92LdINZ9ieP5DymMKR
         6RJ6U/HvTnFQz2Gd5dr05XudXB3RZ0yW+jv/h+zc+Nq1bSHcrllAqcnaaoZzYzNYsihe
         uTjB8iLufM/Z3xohkwMZRRH+lSUuXa9FltCYoGzearDJW/PcDeMP/Bj796nx1cvRDGt5
         SFMg==
X-Forwarded-Encrypted: i=1; AHgh+Rrh0jEcq27WX9cjl4l2XlMuUofBPw06JxMpYGUBvpdtpeLR5YB+n1Vw8aizvvTA0STsG7Q/zWO99xKpD2Hw@vger.kernel.org
X-Gm-Message-State: AOJu0YxTVxuBxswv1NEjgxNmU329hHDff/cKYHbrHkljrY4qZ4z5WrI0
	tIAff1ckm3ewCx9aAloUn0MHNfumNHgZhzRxpKqkMxwNp6TGrPfG5YA3WUpivL+07o7x7Tl8Me7
	ntCyteIL0Hp0XcPEnCk0PsiUZ+jbrlMIxfXeRpWpplPjnSx8wQeXQ0uUv0WeHJoTvcB8lm0kWD4
	uY
X-Gm-Gg: AR+sD12KtaqfFyW1WtMm1AlaC6EI+/8ctCCw29y8V62gxcEInD1npYInvzLiVcUYSfw
	B37NixhY8jbLpMKgmmcBB/bfB7PIKkwEOO+k5C9ujfwrAz5xShBqYL/S1jLZqrHPrldG8DrnLqH
	CZ9RSDbkAQcIGkBCfHAQrUNxGDMUrGbkpn++HR0ujUZRivsKXFWoXRvbveH61eQkDlxslI914GT
	Fy1JtUYxevva9G8o4WqvJZOZ710eKoUyyXgYEBy0l2FNsGQN+oHuHqvvwiJck+DI0y4uyNiQAP0
	ewKlfFAEFzUkvCW2dqXSXUOuoKZvaozUev5PYsapp2CZPqPfClt3nbjy200fr0BQDoK5qX43z4K
	dAl/geO97wQOoulKqcW0MMpfrEy4=
X-Received: by 2002:a17:90b:48c9:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-3903c58f06fmr14001287a91.13.1786015820777;
        Thu, 06 Aug 2026 04:30:20 -0700 (PDT)
X-Received: by 2002:a17:90b:48c9:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-3903c58f06fmr14001219a91.13.1786015820158;
        Thu, 06 Aug 2026 04:30:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca8df89asm42596278c88.9.2026.08.06.04.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:30:19 -0700 (PDT)
Date: Thu, 6 Aug 2026 17:00:12 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Andrew Halaney <ahalaney@redhat.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] firmware: qcom: scm: Fix tzmem state on probe
 retry
Message-ID: <20260806113012.7ol2znhmr2wo652j@hu-mojha-hyd.qualcomm.com>
References: <20260724094939.613844-1-mukesh.ojha@oss.qualcomm.com>
 <20260724094939.613844-4-mukesh.ojha@oss.qualcomm.com>
 <CGME20260806092742eucas1p1b946452d9f0f714b27cad67cd5590c21@eucas1p1.samsung.com>
 <5ea74dd3-7471-4c7c-9242-c2005312b1ab@samsung.com>
 <20260806111209.eijwcaoiutjvblk4@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260806111209.eijwcaoiutjvblk4@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5MCBTYWx0ZWRfXxnn6PdfwqEmE
 SycQk+dCEtJ7TqWdFWO55OMynBK7C1m2holc0PfAPfchqbE4oG0+tVleZ6Tuut0VgK88RZCSWXl
 4P2O9a87KWFKJ5t7Vunrpr0BlaD+6biKQRBjdiWMCXioXOB8ejdKDGlQ1Rp0GdPv/dKBy78r1/g
 M623NelEnnzx33KU7a5d1acwpmADIiFiBM8UOzG/L/39+Cp9Kg2YnUzd9Lx8cD/Fc0YvRETTBdB
 oPRtHESna1z04x1CL5GKXPKmOy+owmkmu4IFqrUpMVGPwDfa7+3OrdIbK7/xnyiA+iG3HFbOj09
 GiHBes5cl+/13jracyKtdCFxm78UtMWT/t7NsA8Jyv8yXPR/dslv1vDcSXQOWz+Opx+OdUfbh4o
 xMX2WLv1NqjDqFkKZnCptuN3jCQO7ab+eAmJ6j6wktTT2ZWdV+828+7FOOduFtdWjAARWiWXhN4
 HIDTHJwfgU4HBFyYMRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5MCBTYWx0ZWRfXxy55PltoTX7+
 GalAMQ2tBTgT+I/jsLL+BP7IvAqheYOd1egFppYz1hPPEZJeWLpvt5xG6Ly5Y+In6BN91SstkA2
 leuPlKxtAcK7f6VIZ1ODLzZc06TJbbQ=
X-Authority-Analysis: v=2.4 cv=EeH4hvmC c=1 sm=1 tr=0 ts=6a74704d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yb3Ho7lQx70rAhbS_MEA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: XXwGD35nYkaJTjeuEFTtEWiribSgh9zu
X-Proofpoint-GUID: XXwGD35nYkaJTjeuEFTtEWiribSgh9zu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060090

On Thu, Aug 06, 2026 at 04:42:09PM +0530, Mukesh Ojha wrote:
> On Thu, Aug 06, 2026 at 11:27:39AM +0200, Marek Szyprowski wrote:
> > On 24.07.2026 11:49, Mukesh Ojha wrote:
> > > qcom_tzmem_enable() returns -EBUSY if called a second time, but this
> > > causes probe retries to fail permanently if a later step in
> > > qcom_scm_probe() defers after qcom_tzmem_enable() has already succeeded.
> > >
> > > Use DO_ONCE() to ensure qcom_tzmem_init() runs exactly once across all
> > > calls in a thread-safe manner. qcom_tzmem_dev is set on every call since
> > > probe retries use the same device pointer. The result of the first
> > > initialisation is cached and returned to every subsequent caller.
> > >
> > > Fixes: 40289e35ca52 ("firmware: qcom: scm: enable the TZ mem allocator")
> > > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > ---
> > >  drivers/firmware/qcom/qcom_tzmem.c | 13 +++++++++----
> > >  1 file changed, 9 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
> > > index 0635cbeacfc8..0fd9581275f1 100644
> > > --- a/drivers/firmware/qcom/qcom_tzmem.c
> > > +++ b/drivers/firmware/qcom/qcom_tzmem.c
> > > @@ -15,6 +15,7 @@
> > >  #include <linux/kernel.h>
> > >  #include <linux/list.h>
> > >  #include <linux/mm.h>
> > > +#include <linux/once.h>
> > >  #include <linux/radix-tree.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/spinlock.h>
> > > @@ -507,14 +508,18 @@ phys_addr_t qcom_tzmem_to_phys(void *vaddr)
> > >  }
> > >  EXPORT_SYMBOL_GPL(qcom_tzmem_to_phys);
> > >  
> > > +static void qcom_tzmem_do_init(int *result)
> > > +{
> > > +	*result = qcom_tzmem_init();
> > > +}
> > > +
> > >  int qcom_tzmem_enable(struct device *dev)
> > >  {
> > > -	if (qcom_tzmem_dev)
> > > -		return -EBUSY;
> > > +	static int result;
> > >  
> > >  	qcom_tzmem_dev = dev;
> > > -
> > > -	return qcom_tzmem_init();
> > > +	DO_ONCE(qcom_tzmem_do_init, &result);
> > One should use DO_ONCE_SLEEPABLE() here, otherwise it triggers a warning during
> > boot on some on my test systems. Here is a log captured with
> > CONFIG_DEBUG_ATOMIC_SLEEP=y on recent linux-next releases, where this patch is
> > applied as commit 9941fe8a04f3 ("firmware: qcom: scm: Fix tzmem state on probe
> > retry"):
> 
> Thanks for reporting; I will spin a fix..and yes DO_ONCE_SLEEPABLE() is the right one.
>

Sent the change here https://lore.kernel.org/lkml/20260806112709.4018596-1-mukesh.ojha@oss.qualcomm.com/

-Mukesh
