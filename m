Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439ED3C3F48
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 21:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901472; cv=none; b=EI+nBbwDMOg8jtFKUC+DcMxzpDIL8msLSMhgbBn+e9siQEzpORT1lPkIGIxWmXqbaGWR7BOVQNGHt+rb/7djgHKqGcMhAjG/qaDyCL65or950pfrSi/I+/uoRg34MZtJccmXQcGiTiUpw8rcONC7fx4am0Lm5PuofxaWeepszQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901472; c=relaxed/simple;
	bh=QpFjPwTUFBS/ForYatSHitLssaYdb2coUOur2fJVRcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dot2V6uYkVhw7HZpzluaMGHQd5/Bb8Kor/8QuSFeYt6lza7VTNQ6yPhOCxWX6ycrnT8wFmFN2g2WOXaQGy5MVZnLYKqi8rdSVkMmUFYoFWRN4jxggGxCHeOkhSRb/6rdT3pw2P9hx8FF38kWqF7Hv59+m/BZ4biDwub+TSSEk5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgTMeiVB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d39Jf1Iq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgTMeiVB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d39Jf1Iq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Fdc2s3429869
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 21:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fzjSKTweQ3zzxsv71ANvuWD7
	OP944GtpxiHNY1tZcGY=; b=CgTMeiVBJvl0Peti4lqcGMKkI0FMMHU15iIPekK5
	7jGHxR3pfKzmWXEDV/XtFOXnFzNMHrsWZEHVls/AV2sS11919njJxw7kv+Vu9GzV
	ONN5ZhS2SnnQy7gkTd2yEQ/r+XWfiRTokuM07z4N3BAindG727rIBhTJI95rls6y
	JvZHRYw3ErdpMl0S+NBfQl6PlOLRFA9HbdDMf5UQaa3PT58mo9gD2WI5EsgjYGgT
	UlNq+EMxeS8nI4RpByYIiIYAa6zxmwxExepje0KLBQtOiooHjcTspTFJRoZxeTYM
	H4ug5rV+ly9ZmRCJR+CEiak5SH2EYRz93szqtPp5jbdnPQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjhkj2qu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 21:04:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so354406a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 14:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788901470; x=1789506270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fzjSKTweQ3zzxsv71ANvuWD7OP944GtpxiHNY1tZcGY=;
        b=d39Jf1Iqt0UBy2gW/xkU9iFN5DUeh0Uv1XJl1MvnA/QBNcfT/iSamy8QnzxAOTYOnP
         OeUxIgbNcsN1WjWh32tObYsWRN14yA1XrYgD/xsEL8zPOV+b8ICdT0CGFJS2QQotmlvS
         eM4O+szX2WhRpx+5gTtIs99JFyHq/2xn9xh6AHeVdw1F2+xWhQenQHUs71BcNzoKfODv
         MZGW/TIGSpYt10CAMVw7vzpXFGx1fQyf3cm9EXWxVzD1Igymoi5itnMuZ8fSuzzNCiBD
         yGqzzIN1okb5y9FMNqHwRc0v9iRcZtwsvVfpYTZipAGoMnCiJwtVnIK4AR/CXSIUMpvR
         xFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901470; x=1789506270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fzjSKTweQ3zzxsv71ANvuWD7OP944GtpxiHNY1tZcGY=;
        b=MoIxIUO8GPDvtX2nBUK3ShhQB/NZU7JZcGbCcqrpkR7yVJqaM83yE7NNDToDg/Vj1w
         02J2Jg0c3vrLb6usfVHuJ3XYQ8UhoFsc4kIj6NA8XAPmRbYt1djZy1nxD0pZqAQoW3MQ
         Zep1vSRHuUsfsvQuweiN3kOgwMSn0ZNaWxM2nCwxoZ2JmkGgkms8bEOtixW6NYuRkvF9
         tqz4nG7/mEOsX05V5ENdoha6iOycgt199Ga4dfApx+ogb0jOMl52RhjQTuGW3SyM+JIS
         oEBGTIw9b78Q1/zPGtvfgl435TU/+PsD2TNPCZnccuRuUA5rSNk186MV0xJs0VwQLp9p
         qsAA==
X-Forwarded-Encrypted: i=1; AKwUvBzjVRfaMXLOBwRCeTJb6HBLhFItgbjfgjbyWRLtypus7ydUgBpbBWrkjqMNetDmNOoDAdFYuVw/KdeAddqW@vger.kernel.org
X-Gm-Message-State: AFuF++kHRNN5B0nSoNZI6X0Vz7hwwZX8xqv21C7VhhnbHDNF0zAeuuNC
	CjSeRixQpOsiBAo4MFi2H0nWO6jb+NnQHBxOpfK8u1rw3Nn2I0ujcS7ZNH5/bc0K9Z2EpSIOf+7
	JO4+OKq+Fm9QLp6m2Nax/L2QHK+8IdcMs3qKSjMW271MIvge3jTtFS0pa66lCUs9htdo2
X-Gm-Gg: AYBFou1WbP1ABWLoPF1q/qCj4Pyrkk7oY6ohu9bU7GAI6sd+jIbdLZx5n06Rj8WCgmm
	Se8O2BD1b64oTk/FZKHQcE152RNXgieKTseoizaccfq1q0krb3Ea0eqiE//RYutEvHR++jkyJjN
	fDwAS95O2TBdKA7aLRmfzM8rApBn9FCDo3LVwhs8KWPwlPzssdF4fVrk1ozPtUjFcUFp6udnz1k
	af1ERuVRGT7VS3Gmg7UewEBY3PImpLxtmh4L2MLY0IBUl+NSQplaG9pAnZJ7PtGqvjky9RL2g/t
	VFLEKp5HTPVelbiQEONmqjpdtmX36XDi1rzM4zRs1F1Y48NdEaNodeuAK2v5vvgvooXrRxWRBR2
	2k2W/zehxivBYUCKkWyPJVLVgpDALAw==
X-Received: by 2002:a17:90b:2784:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39b26272bdcmr52757307a91.16.1788901469518;
        Tue, 08 Sep 2026 14:04:29 -0700 (PDT)
X-Received: by 2002:a17:90b:2784:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39b26272bdcmr52757244a91.16.1788901469006;
        Tue, 08 Sep 2026 14:04:29 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm17008146c88.9.2026.09.08.14.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:04:28 -0700 (PDT)
Date: Wed, 9 Sep 2026 02:34:21 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, robh@kernel.org,
        Saikiran <bjsaikiran@gmail.com>, monish.chunara@oss.qualcomm.com,
        jishnu.prakash@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        lgirdwood@gmail.com, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] regulator: qcom-rpmh: Add off-on-delay support
Message-ID: <xmjovrqonged7m77zlx4gbz6xvfksygbw7g4vgv2stlucvqoy6@uie3qdhdtkoe>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
 <06a264d0-6a14-4b71-b783-82b771f04411@oss.qualcomm.com>
 <oa3okt7mdhoqmrebwim5yswarbcacbmhpwfvqbhtv6ib3cwrwi@ddox6mw3uhmy>
 <0d4fa333-df22-42b9-b9c2-ccb43ac4fac3@oss.qualcomm.com>
 <3pybhkqdvve2ct6burnhav3utis6nljz7ncheqcrs7v55ullz4@nek57empeoca>
 <086f8e7c-0afa-45d5-bdb2-54ac5f79eefa@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <086f8e7c-0afa-45d5-bdb2-54ac5f79eefa@sirena.org.uk>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDIzMCBTYWx0ZWRfX7gpne7BevujS
 mDZiU3V1hmjmgo07Oezg8ZqaHq6IF08WVSfy+Lr4aPwZGhyrU3YaaiWykYaYZlQjb6RPEnDb65g
 fSjlX6bTe4sypYvA0A+HMoesveqTmT4=
X-Proofpoint-GUID: xO0v2BPnkSHjjndBxzUUYxbfG0JepWPa
X-Authority-Analysis: v=2.4 cv=VYjH+lp9 c=1 sm=1 tr=0 ts=6aa0785e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=CGwnqvY_DpLOKbjC3Y8A:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: xO0v2BPnkSHjjndBxzUUYxbfG0JepWPa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDIzMCBTYWx0ZWRfXzOWmiP8+rfM+
 9BGe47b90K0vTCE9IuvMr/uvt8MLcNlALZWfy1q7/1nN54kTh22wAjzkMP+cWd81zRA9H9FOznf
 u+2LvssFX86GxHV5X58Jk7Ah7O0baB0q+8ZCCFYj4FbRTJ4/wthubCFf3lw9zjxAZ0ZsLIiHvdw
 nklRhPBcS2r8P+FUGoNYTQPCLaZBSnFei58JzL+mBLVQe0LR6Xr0WCm7roPuW9QEJQEYss9o1W1
 GJgRgfVdCjh1tmEEZLYT9VZK/bgA2FEGESFkatfK3BwaI3GfiSO+8+ASDNoqIcBVreT1uXcPvMc
 ykIsJo5VXUwMBtTe3PvthVl4i+T19B6I0/yoH6KRQfbF4bOX5xy4060LddFq8Zg/1QGWGbpOu2z
 1BOVMJuWevIDb4sTTrsYUOUEgSQoaKa7X02Q+SHIMj0ujHtsKdIyZ+JTO0mrf+vwfrY2Hy+gPJC
 L+09DLLWsxFrUbFUCwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080230

On Tue, Sep 08, 2026 at 02:26:23PM +0100, Mark Brown wrote:
> On Tue, Sep 08, 2026 at 06:43:09PM +0530, Kamal Wadhwa wrote:
> > On Mon, Jun 29, 2026 at 02:13:00PM +0200, Konrad Dybcio wrote:
> 
> > > In that case, I see no real downside in allowing that, especially given
> > > it would/should be used sparingly and only in cases like you mentioned
> > > where the board has some quirks
> 
> > yes. we can use this sparingly for such board issues.
> 
> > @Mark, @Rob - can you please comment if you think this is acceptable?
> 
> Could you please ask a specific question?  What is "this" here?  There
> is an large amount of quoted material in the message and referencs to
> some property but I'm not clear which one.

I'm sorry.
let me elaborate.

Saikiran had posted this patch series which introduced a "regulator-off-on-delay-us"
property to qcom-rpmh-regulator.c for "Lenovo Yoga Slim 7x (Snapdragon X Elite)".
But after discussions with you and Rob, he decided to use an alternative approach
and not pursue this patch
https://lore.kernel.org/all/20260127190211.14312-1-bjsaikiran@gmail.com/

However recently on Qualcomm's QCS8300 RB4 boards we started seeing "NOP OUT" issue
for UFS driver, where this patch seems to be helping.

The issue was seen only when a quick Off->On operation happened due to defer and
re-probe of the UFS driver (note - defer was due to some other reasons unrelated
to regulator), combined with the extra caps on the boards, as UFS and EMMC (which
needed more caps) shared same rails led to this situation.

While analyzing the issue it was found that adding a delay between the regulator
Off->On operation helps the UFS work properly, allowing more time for the rail to
go down.

Since the boards are already in production and the HW design cannot be changed,
we'd like your opinion on whether this patch can be taken in its current form.

Also, Rob had earlier raised a few points to Saikiran on this patch series
(https://lore.kernel.org/all/20260129174829.GA1324020-robh@kernel.org/):

1. About calling "regulator-off-on-delay-us" a "standard" property (which is not correct)
2. If this property will force the off-on-delay on all the regulators under the pmic
3. If we can avoid turning the regulator off itself, so we may not need this delay

point 1 - I can fix in the v2, by correcting the commit message.

point 2 - As I confirmed to Konrad above, the property is per-regulator, so other
regulators under the same driver will not be impacted.

point 3 - We evaluated this for UFS - but the problem is that the issue happens in
the defer probe path, so if we avoid turning off the regulator, it leads to long
error prints appearing for the regulator being left ON. So we couldn't take that
path.

You may also refer to this
https://lore.kernel.org/all/20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com/
for a more detailed flow of the issue from the UFS perspective.

> 
> Please also do not add random extra characters to my name, and also
> you've CCed konrad.dybcio@kernel.org which appears invalid.

sorry for this, it seems by mistake i added `.` there.

