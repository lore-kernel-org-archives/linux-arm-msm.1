Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3C9347BD7
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 13:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959821; cv=none; b=WLf6pqA2zsx/uIPqTvxj2Ho9j9lv05NvZs7PyQ7JzcXaaxB7Rbsyg7N2Eno1XpGMzttPPTfHeCObxnVy9RH6OhCSfcZ2BxIoqPsL+wVdag2bHq1WBR0WVuM7IEcmSgehsyia6Pome+NJe8LrBMnP18KEu4G/7fb8XGGxzPka2+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959821; c=relaxed/simple;
	bh=z42X+DIeWPFD5iqPawWs+CCgDOHjrErcNhPQWVQSh9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSAj1BTfL7SQcORQ6IFLUTRk3rap3cXQhXWr+zIqvRLzKAhiZBzxmyOYiQdqT93k8ruSzzi6P4iFvFfJUhJm0mOXyQ/xrmuuFFaaOLkjFpiVfl66CYAhAqYzK6sTwbIpoN1RVDUXN2tGnzL1EeqfohyMEddDJuCgE/wkgjF8cuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVxRghFP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YWmK00ES; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVxRghFP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YWmK00ES"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BogWu2698714
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 13:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X3YW3TLe4NcEgON6AYpHQ6p+
	Y8CG2QyzanrzyTddpsU=; b=eVxRghFP9+PneXsz2AktF1vwRi9Wjmh092xy7Zb1
	F3Hl6FdKv1EebNsXCianRC0z8XVS0xOom9v22gL4RSzdQq2f8mXxGk5HNYVwBG5L
	TLAhOlSQAaNeE23nxTYOZbDRhjPSOeiSrFOXWI8XOqPcARGxAmqcqMf7pvL/nGsO
	i+y+pvSlO1AbYctR3dzOultQUBGNTWHQCTFL5LQHun5EdgWAx4ieNX3FOl0YPNnX
	qbEEz9tW9UmVNVhQGzv31IcI2HJp6G+jo4CL1jWr16DT1yKglDUEOIk5ZgArwGiF
	hnQh5KIDAN+nCFsHk3KLlTJkM7Gs7vVojKEnOEAgQ3nCKQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh0aga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 13:16:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so7281575a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 06:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788959818; x=1789564618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X3YW3TLe4NcEgON6AYpHQ6p+Y8CG2QyzanrzyTddpsU=;
        b=YWmK00ESvuCt5JtKboYSn1RrLcRZEo1JDCG5Nv45z1wnM0pwwAD3lv5iLsd5lhnT7T
         Qrp/Btce3f4ygcYedq6ExUO3BcPXmT9ni6psD/wNoHI9rVN5o52PzeuGezTR6CDq7vjQ
         7kkpZzABq5koEmz4KLNscaHzUl3+bqxwtItQV3abdSHGK/zPPw1WNUG8YkWVitzCb/CU
         BpEQeukHr0z86nmPRbttfImXPanz2QHz6ObscU7pfd3EGb2yPEtmKYCnLQG8+hy0DqKI
         NPuK9nKVnTq0Ky9XMUH+DPwNAgq2QGUS8b6GRdbN7L7CB65LJ8H6KejfOClTEWu5vqpJ
         1VIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959818; x=1789564618;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X3YW3TLe4NcEgON6AYpHQ6p+Y8CG2QyzanrzyTddpsU=;
        b=itVpEt44WrvjHpzsJFhrTmDJ3vom5WCU+IUriI5ySlc3PbMsYw9QHT8XVbJZeRLMgp
         IOk/FUWzhe6lBEcGhTcSg0C/ioYk4Vqa3OryIP6EE75G5QD+IOhAxMduZSg3G5QqgmxZ
         M8cAuQtxRfPAKWM8ANn1ALHc8valCDRl4oNi9FS7pPZc17vprrghBHwZcpMT3usqf4KL
         tS7oTLqJS9y5tQLGaFhjPB5/7CKzHWriDJ6HLXYY/G9YrwuUbFYvPqI1PY5yYy1Dec7y
         nZiNVdTf2nst5u3IgqEAC4OuvfR55FYQ90acj8qdY1K0WWlq8bGpNoKa3DA26VdXh9jb
         Gjrg==
X-Forwarded-Encrypted: i=1; AKwUvBziDT6PTp6i1aJlnUWUYM4xqee/JOsYqd0moKwJEeGPEpTEmkaHdxXayrsb3gsUd9nH2ZCayiDb4CLW8Fu0@vger.kernel.org
X-Gm-Message-State: AFuF++kRfwqb+FwCj24d5RbyuCq+3bxUMc+JkiElQLuapyyB5EqdFd8J
	IJLfVOdyRNMH7hgkA1eNXa43x82blYqeXot5qeDwsWecWElmKniryN9yIwse7L7HkNFUQspruBw
	QotGrBcn77Ijg2I0QiYZ3ckOSbMV51xYvswXsiiVWOo0vSNFV5rgqumiy8NY9/h76JADe
X-Gm-Gg: AYBFou0CvocYW3Q5aU6l/kERu1qxZaKSg4I+mfGdzYJGZawY088zb5zlwXnw6OSsmxQ
	UWlIeLHJzLrU8FziX5OqidEPFRBFYiv+HskC4F7ScqxQJ2nCORf0qgzLFzaiLElHNkdDSY0UWyg
	j0wuo91Q41FkKSMEBZSQFJrjihPHwYVpWdurb0cZ7eumuoDGmAXz/Nj8X5EotUZid8pR9uw7Wzz
	CRGz4bKMDScZWNjzzhmCgreRhmWXghDm5o/werapboZqp2I5ZLGWvmhans1b0X4DL7IjF9juRSZ
	ahie0TvjycsNtBpvcwHPvMAGa8Y0VyNbRPMpwEPkKf/2y8E2JNCgZc7xDCNIJ/ZgsXwd0XJr+mt
	sKX/X6r5dhmhdp4inOHH38xY/FEIRn19LUGGNHx/i7kY=
X-Received: by 2002:a17:90b:5346:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39b26190fd9mr53507889a91.7.1788959817728;
        Wed, 09 Sep 2026 06:16:57 -0700 (PDT)
X-Received: by 2002:a17:90b:5346:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39b26190fd9mr53507818a91.7.1788959817093;
        Wed, 09 Sep 2026 06:16:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm38236827eec.4.2026.09.09.06.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:16:56 -0700 (PDT)
Date: Wed, 9 Sep 2026 21:16:38 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC
 support
Message-ID: <aqFcNhB9ZeQlkOFh@QCOM-aGQu4IUr3Y>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <f9252adb-7b5c-41c9-8a2c-fdbda21d672b@oss.qualcomm.com>
 <ap6o4SRb_4dG97yD@QCOM-aGQu4IUr3Y>
 <bc051d4d-c94b-4f01-bc77-a4da93331d6c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc051d4d-c94b-4f01-bc77-a4da93331d6c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0OSBTYWx0ZWRfXxnl2B8rxXBDx
 QqSbhjr6TLv+lFq1j+wYxZjzHLUiccTkB3leMn8bYyvqJPJ8S3p4kuphK7ATufTkhGzaNi5E40a
 ygDHQkNFhAM+HOHltzTMdcg6XO8LsiBoFYmNyVqwY1Yo/q0I1g1Yef4GQHngpFqeyoGkGoXmq/c
 cF9wjTJMNxeo2u3/zAxxKtPTVPZF1IFK0eF4zrC21tZ/ed9SnUruNJGgrW5KDed0vlLM/L53oZa
 I8mjkrXLv0R9KI3ZZQXfoLI+PA8/0eqliD2ebCcKIrT3p4t75G/3Gcqoj56igEEA5POrrZ+u8vj
 PuLsGN48jtxFdCVXgs5iEDWTEZz4UkMHZRwqKrqpK6jB4ljxKMDRu3SRr9PoW/jkTi1bisKXxgz
 AqzrkWBhCb28sMAXa/XvvSd/7OkFaTabUlHRxNGk3KokDdF5WF+BkLJw+rlNlPhxvKKyGOu1o9K
 LReJs6/NMDz9cibf+oA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0OSBTYWx0ZWRfX5YbM/O4jUeZF
 ZEHzDe0WB16vPq9dMUUB3WUApwBmaK5n7mqyHxm1vDwBvtWoh3DeiI3zICV9H1c4zBFDoqaX3vU
 4qnSeBYiYVMxJ+KfTnGP0SbO8FirtuE=
X-Proofpoint-GUID: HeqoKf_KYpXiPyaemhOUwyfD9HCcC3TZ
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa15c4a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B_aPWRgbl8lC6mU0Q60A:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: HeqoKf_KYpXiPyaemhOUwyfD9HCcC3TZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090149

On Wed, Sep 09, 2026 at 02:13:35PM +0200, Konrad Dybcio wrote:
> On 9/7/26 2:06 PM, Shawn Guo wrote:
> > On Fri, Sep 04, 2026 at 12:00:40PM +0200, Konrad Dybcio wrote:
> >> On 9/4/26 10:16 AM, Shawn Guo wrote:
> >>> This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
> >>> and the PMIC descriptions for the Qualcomm Nord platform, and adds the
> >>> initial device tree for the Nord Ride Embedded board.
> >>>
> >>> Tested on next-20260903
> >>>
> >>> Dependencies:
> >>> - NMXC define: commit e484a765f543 ("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index")
> >>>   from git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt
> >>> - Base DTS: https://lore.kernel.org/all/20260903140617.441111-1-shengchao.guo@oss.qualcomm.com/
> >>> - PMAU0102 MFD: https://lore.kernel.org/all/20260830034719.140213-1-shengchao.guo@oss.qualcomm.com/
> >>> - PMAU0102 thermal: https://lore.kernel.org/all/20260830101025.191697-1-shengchao.guo@oss.qualcomm.com/
> >>> - PMM8654AU RTC: https://lore.kernel.org/all/20260904074541.590485-1-shengchao.guo@oss.qualcomm.com/
> >>>
> >>> Changes for v2:
> >>> - Align PMIC comments in nord-ride-embedded.dts with nord-rrd.dts
> >>> - Drop unneeded regulator-always-on and regulator-boot-on from RPMh
> >>>   regulators
> >>
> >> It still remains on something like 40% of the defined regulators
> >> without any nearby comment justifying that - are all of these
> >> intentional and necessary?
> > 
> > Yes, all of those are intentional.
> > 
> > - Supplies of LPDDR5
> > 
> >   vreg_s1a_vdd2h_l  -->  VDD2H_LPDDR5_01
> >   vreg_s5g_vdd2h_h  -->  VDD2H_LPDDR5_23
> >   vreg_l1k_vdd2l    -->  VDD2L_LPDDR5_01
> >   vreg_l1f_vdd2l    -->  VDD2L_LPDDR5_23
> >   vreg_l3k_vdd1     -->  VDD1_LPDDR5_01
> >   vreg_l3f_vdd1     -->  VDD1_LPDDR5_23
> > 
> > - Supplies of PMICs
> > 
> >   vreg_l8a_1p8     -->  VDD_LDO_XO
> >   vreg_s3a_1p8     -->  VDD_PX3 
> >   vreg_s5a_mv      -->  VREG_LDO_MV
> >   vreg_s7f_lv_sub  -->  VREG_LDO_LV
> > 
> > - Supplies of Nord SoC
> > 
> >   vreg_l7a_1p2     -->  VDD_PX14
> 
> Does RPMH require HLOS to cast these votes? Generally such supplies
> should be taken care of in the fw

Good point! I just did a couple of tests by:

- dropping regulator-always-on/regulator-boot-on from these regulators
- dropping these regulators completely from DTS

Both booted fine (the nhlos software for Nord Embedded variant are still
under heavy development though).

So what do you prefer, dropping always-on/boot-on property or
the regulators completely?

Shawn
