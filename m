Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2DB411F92
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 18:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785868250; cv=none; b=tZv8T7fXyqIvBkNdPG3y1tK2t87pzE+2hh0NVAak13L9H0d1xkA1rPZE4cMr+dhcm9QLFHS5DY9qJtCv7CFjQKJRZF+rmhPStyMH+M1xd0RJFpV9sazd19mlRd0szCin+ZyO6flpyMoqkgZUjHt/SP+MIKGt6O4pZVrPdjkHu9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785868250; c=relaxed/simple;
	bh=D4Qny+SNB++brDPpEvfKvsrGnVhLNcnYa8NDK/rHLRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdgQBC6/toV3e4Kr97syNmxc1nYa92F0ZdMMp/lEa7mde3ekoKyi8FBW5nuBxsbCKtYz6ipUW62TwMgWj8kk7+oGSgS1QeVeiWZ4+/mX/udQ0O/IaT9BI+sLvoCi2RrJ11E7hkaNCKvjefZ6Ta8Yf69cfFfFGGBBVvVyjo7DBxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvhpaFTF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDfS2+jl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvhpaFTF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDfS2+jl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H0MID580268
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 18:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JfC9ELx4BpTN5CFmL3R6Bb9J
	ryzEWW2TxPGog2BUjdw=; b=kvhpaFTFxP1RHthnXhX0i+WvH2QrqW/+6uAuZmEX
	9li2N2NO+GBgk+WRuwblBBlCC+j5d8E2pEl7xG32VKgBCYxGeWhu0ynRt7O9S6hD
	Hgfy7MgcFSZhnXVH6dYqBoL3LyILCsHhKkjpdUAs9my6DMxmG5AlU4ckFKkNVi5G
	a8Dz4nSOhHqLdY8C1/iMBW71P5Zoo85Bb5/mQf7tHK5anRc7weJcZQJG7Qa8Hky2
	nQHd+LvHDGw0bCIdPXf22qmbJ/c23A7B5u/BQjQN69xQh6RUjocQffrZn/KE9GAs
	T3nY6p9CLIbLD/xt4+JcHeTwL3KXHVfWx4+zw36i1Ogp/g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3q8dm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 18:30:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso110778a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 11:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785868246; x=1786473046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JfC9ELx4BpTN5CFmL3R6Bb9JryzEWW2TxPGog2BUjdw=;
        b=DDfS2+jl17wI0fSxWncY4c7OxCnXNI5SAPWVttFkhiJ/+WrhovoyQJtCsUBzu4PGXZ
         Mk9fToR6e7PG/IOS72TacW0pfIPjGlGiDQk6jEWTqBy9kSFCMnupfUTgxUk9mEJNoQUA
         ua74twi44qiBNgENiNPESSUx3Ko+UO7LOnmG5lE7DWPJvTAWSz3m6iq8Ozg3t2TzJcSm
         t5KNdwnvRL/Nev5XIVieiQsrlPU79b8QxQRmefvplL2xMMgUYOZL3gHUG+CsPL3HWuEY
         VC7K9EvaCkwF5XLbKztdX9ONv1IHeeisyeo7HywvuOqkt0Avk0BLMP9sUXc46UuKwqKa
         1jpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785868246; x=1786473046;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JfC9ELx4BpTN5CFmL3R6Bb9JryzEWW2TxPGog2BUjdw=;
        b=F02NrPPW0NmbbfK8uLh9srWq7+ADaN/WPNmLSOy++6DiWPQcPb1JSi+dJ70Tl4Pk93
         vZmAVjzrCpanK/Kt29NJno5G6CpO6FdPNhs98J4sKBugNauYNyOTxynmZjyZg8/GaV0V
         xO2kn4mtgsq2sBH+0C5U75qFoObYUNgiUNyV+JligbVvitfl6UCPIOTn/q12nKgt3W85
         mQVuB49Yqr1u0aqdqghhxFxR/DFfUqAqDcvwh9pKIQStocA/tjPUIg7sKkJbIwdl3hbh
         huY4zSLQM/dIhqMTlVjALOXMQ01eZ3beTdYQ1jmz4guycEIFghGG/ZCCOdOI3RiIKLYX
         shXw==
X-Forwarded-Encrypted: i=1; AHgh+RrOoFNBbE/uyhKupRYCtFUxAc9ILNA/VnU5d9nhGRLIsN+I0o6wZhjE3ia4col3/OTdcS+mLRDMGsf+Y3mk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw8lpzh7CqPzAHSsvvAHz7XhU9baOGZWSLIEgfOqYQNV5rovRp
	SX8LwVIZhb6fABInSZYcyOjy+M2C5yde53XW+zNZIECegHrcuLMSd0f6sF5+cBoF+muTIu9ocUt
	qHvt8qGUMKtddo5mSiGZfkhwVTxo8uZ2W/BQwcKdlU2MwNID4cT89ovTa9XAmRwMzcP88
X-Gm-Gg: AR+sD12VN7YQhPlOw4f/FIDSdl8/VAR49S4uiK71ZV04am9O2cJq8ZyddaY1fD/tqyJ
	XIPkR8qKvwhDxTbJZxofDodE3MyTnjv08Vkoi+zLGUTb0IUXE7Bgw/oNrIcVlpEltCWfD+WUtgB
	nPYy6RnipEf6ZPbvvbmj+j8Y3NWPAEW10iqccPCR2UM3aoRCQMMVfIdAsi7UC6ETsgzYdrpILWQ
	/MUzNsqloDnDlAJSmMyc+NzyiwyhaNLsBl/L2bOXg8MMEyfdaQKR2yoPnRsYbyzTPRVd628RmAl
	vdwlklGwFMhgK+PZOJ51vVFhQPqxKqmLoQQOINFuGDuTqIlMnieEHrliV36edzQHCUMeqcsy9PP
	sgF8PE/UKQzRTiD/Zvv6pvBudXDg=
X-Received: by 2002:a17:90b:4c89:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-3903c5aefe9mr718458a91.15.1785868246365;
        Tue, 04 Aug 2026 11:30:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4c89:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-3903c5aefe9mr718378a91.15.1785868245784;
        Tue, 04 Aug 2026 11:30:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca52d329sm5693013c88.4.2026.08.04.11.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 11:30:45 -0700 (PDT)
Date: Wed, 5 Aug 2026 00:00:38 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Make
 SDX75, Hawi and Maili MPSS fallback to SM8650
Message-ID: <20260804183038.blrgjcslwyzj67qg@hu-mojha-hyd.qualcomm.com>
References: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>
 <anIM8yN-r1wrTErT@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anIM8yN-r1wrTErT@baldur>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0OSBTYWx0ZWRfX2Ob5cR6aHDIY
 NSjvJbHLWT/kvGsOJ0fwmJzV03lvIOskBAvl64GUM1+1fNyEOZNBKIKG0PQGssigwhLEQxne92L
 uJwN3jWJ7TsiDwTFxiUnsEQHjcaWUSv/s1up/anzk+YPlFCf1YID2ZqplY7zEFW3eWqtWMLOIWN
 CDjAMb6KgMpwum6m5Pya5E2MwSI3TzDrbx4jflEqar8AlSOoTA8Ce/hvSF+dr9PQ4mWvtY3rDfz
 rs6L2nEd8leq8iAQDkPTdd0tq4SnGZfAP3oWHqZN6rG8aCgR379/wIzD8+9EXZ9Fv0U+IHTnIff
 pGbrtere3r0Z68P0eZC1KErgM1/FC76p4KOHAVC3NK43lHJv2Iejv4NQq3K+Il/fa96zQ4RQjmt
 Nho24S21H0e4izZCbxOAluf+bElehehItgsQN10yXRX6uKKTTDGgnktQK9RK5nD4GTgavSCleCn
 s4do8DHQ9uyBjUMsJyw==
X-Proofpoint-GUID: svN6mV6rnEXSC4ugFOry8AFQMLJst1vd
X-Authority-Analysis: v=2.4 cv=LsiiDHdc c=1 sm=1 tr=0 ts=6a722fd7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lxZvx7qKqtVTtBd41IoA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: svN6mV6rnEXSC4ugFOry8AFQMLJst1vd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0OSBTYWx0ZWRfX4E0Q6Puvkrk0
 8MS1SRg3gsGGuhZbhC5ByKTPFCBoJn/kIUQF6x7pvAEw7tB56yRASfJnfdzZO8r35W3MIlFHXzr
 Rp2x8BcR4OORy9Dy6hKZhlxKssLqGow=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040149

On Tue, Aug 04, 2026 at 11:11:29AM -0500, Bjorn Andersson wrote:
> On Mon, Aug 03, 2026 at 11:30:20PM +0530, Mukesh Ojha wrote:
> > SDX75, Hawi and Maili MPSS are compatible with the SM8650 MPSS as
> > they share the same set of interrupts, memory regions and power domains.
> > Rather than describing them as standalone compatibles, model them as
> > fallbacks to qcom,sm8650-mpss-pas.
> > 
> 
> This will introduce a dt-validation error in
> arch/arm64/boot/dts/qcom/sdx75.dtsi, which you fix in patch 2.

Right, but it will come at some point if we want to fix this.

> 
> But while the binding says qcom,sdx75-mpss-pas alone isn't a valid
> compatible, we support that in the driver, so we're maintaining
> backwards compatibility with current DT - until someone cleans up the
> driver to match the contract defined by the binding.
> 
> It might be reasonable to accept both of these hiccups, but you need to
> document the upside of it.
>

Thanks.

> 
> But if I read this correctly, it seems I merged qcom,hawi-mpss-pas and
> qcom,maili-mpss-pas prematurely. Based on the commit message in [1] I
> thought they would fall back to sm8650, but this patch says that was
> wrong of me - meaning that [1] should have contained a driver change as
> well. I.e. you didn't test [1], right?

Yes, it was wrong of me. I should have acknowledged Yijie's comments
publicly, saying it along with the sdx75 fix, and I did that internally with
him. I did test it against Hawi, but not for Maili, which is what Yijie
commented to take care of Maili along with Hawi.

> 
> As I said in the reply to Krzysztof, I have dropped [1] again from my
> queue.

Sure, will rebase this series accordingly with some documentation updates
as per your comment on this one.

> 
> [1] https://lore.kernel.org/all/20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com/
>

-Mukesh
