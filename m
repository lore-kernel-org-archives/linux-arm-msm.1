Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333525;
	b=rXEWrYU7Udq1DzMBuhqayYtW5xXUwSv/NqHKd9WHRHwpHJfx5ExIU+PSi/YTAifijxvB
	 KYaMwXJ9Oujh/5dOGe6C26dlv5jdi5/tPHw67lBLc6iRBRHpP1qA/1vhIQL04OXjNWEpF
	 6bstYGRKYeWXdR/VWIvDSbAqlEKQ2omPWfyk741Nfxq1KC9Ij6dtTh9dZD7h+Amz7zunm
	 3zd9a03teRMO534XxxGE6QSNTwHOYeYCQ67b+WjRz740dZx3ODRKb/Q4Za6WRrZiTjugB
	 a+iuVxkivzIDdyURPyS2H6W4itI/wKumw8sIGM+Gc8CserY+uvD2PVxS0U9J0WcysTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zPFsZgyaCdAHrCU/fXJ3x9ev5UW6Et+8sbyRNxd+Myg=;
	b=DVHaD5IvwV9+HayoG9CHDuSFNRdcQ1EAkBtD6FfSBOoUQbwSRKvim/1H0Sc+gxISSsTV
	 IQ7yqdvChhcvlxsuWkyoJFWAH9PeS4FCan/09WF56s9u02OgIAOC8073JzZgcrSR5KmUI
	 mH2qYyJgonqJTyki8ey2NVG3RexLGLnm0b4LAGlAiUR9cjk4wxwLFKTYvaTUaiOFqNZi2
	 AYk42Pfdy8IKVKYoYtcEp/3y0hjSaKBItKyBTwF9XX08x4rwHpc5SThaS5LLvzmJ4W1aI
	 ohIX2PpNs/BuyVmnC9t9kTuKSpfd3q3E/CLtto0FYYZoBCYbNSg6SVb0xY3Ou6FR4uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="C7/luK+m";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QtB0aOQ1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F94F606A320
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 17:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F94F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C7/luK+m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QtB0aOQ1
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0H4O151624
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 17:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPFsZgyaCdAHrCU/fXJ3x9ev5UW6Et+8sbyRNxd+Myg=; b=C7/luK+m2l0JX3ZE
	ENMS+k7w2WZ/oKWuTLwKzysb30AnzxUEO9HUwIcFnwcia1QY0SyjLjA93tCjz7LJ
	jxb2X4B38s7xCtPL0p9pJx4i3liKV1K218M0zxODd8lf9tzqL7d/0Ib6Bde8HhS1
	1IIrVerrbYE8c6xnMpClh38OzXsVGO0fUqcbe8/E6IWbs3WMBH8Db8rfCI09Q43i
	y9CnwjS0KoqY6hCycaj5jYDzpK1QJ2+V9KPKFfxh4ufVhvOIACY4bzrLfYkN5iLq
	pjqj0aNHOSvwRHZ9i/ML97+XTrdybQKGV6YurYIQm6Pehyzl247v+1jEmcVa5ycd
	pt6D9A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pv9052-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 17:58:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f479b9819so4145236eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333522; x=1794938322; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zPFsZgyaCdAHrCU/fXJ3x9ev5UW6Et+8sbyRNxd+Myg=;
        b=QtB0aOQ1ocsXxyJpwT6umWRIyDtOQK9Fu4M7qWTPUovfuLTiq2poalcPUEo6r2awrm
         YteXCl0A1KEuDCUsw/K7beFjYn5W4diatoEFDCURzxHQatWk7lSrbQAna8RxbCDx79uw
         mamxRoUPRYqPoceK1d+BvjRt9DFq5a/wWFhw4i9dNBByUqnz8m5W+5CblWGq/hqr0Tqv
         mGgfvlYwu06R8HHUdGuZhhqOBzqGAldZUxwHW7q2gflSHHV1//uqt8JUidEtQeYMJ7Gd
         kqWh45PVz9+Tv+J/eGszJWA8eDLjrgo1sPdP/v3xowbamBFABfVazPAVXw78JJGDfop/
         Cucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333522; x=1794938322;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zPFsZgyaCdAHrCU/fXJ3x9ev5UW6Et+8sbyRNxd+Myg=;
        b=a/b22WnrZyomha1hPDfAX8PjobG3MUSZfkg0SJAuuk9UMWeSY7lfDNDPY4zY2QuY/M
         pcH/tlxg3ur1cQeSlHo7cL/PRi49P1jJrtqg9vGdrvMoqr5J7MCnoJ+ShFzCV4FBuRux
         kETDmKGi4Im9eXqbVpqIawAN8Z7B+TAxh9rNhSpnO84B/ZOkMkqpJcc9/IyXmpekZ32z
         CsBb1yti+9ZvaH1tA2+CxAyKi7LskUeMeZyibso7c4cU3TJ4rLAoXzN/roHzbovbTxlx
         ZxE/K6k3r1s9Gdm5BhKDaz2GTQ1tSgW2vEMNQB5z5yCVhdsAscz5PVaOqgMQOhNQ4JF+
         JMVQ==
X-Forwarded-Encrypted: i=1; AL+hErEHnyPf0nFOHU5uxCylEtrOqqCcUxzHMIallqkUA/AQ6ZiI7Xr1G2vu5n+KX7wB/K66sivynMTHZdc4+ef1@vger.kernel.org
X-Gm-Message-State: APuU4Z/tlvvsBe5+qh6dXAFL6pzmLPHxLK9rx4lqlJ1hcJ6rq/Ht/U4a
	lEJan5gwpUm6GHmwyv58RUtr92R9vK1ye+3v3/57ejmqQDMXEgZDwAteIX315OY2Qn6bOkAd7rk
	iHiW4FpdKYFSVZz56S4rIt9CmGhF3cLluVoYCaoAUbcxtWBe/Db+8GYDFugO8EiBmFLH8
X-Gm-Gg: AYBFou2wu6LG81RSVmNKGtHZsWMNTWUjdRGvrzNf+jzIXZSRW/mTaFHQ+PD2WQDFxC3
	IAl+riLJu+h13OfLVgF6Z1zmLxp8gzXuBCqOCzkiR4OgS+UFxD6a/f1dL9lIAKsrHUYvu8yC7T6
	/mZr2Zkj1rLz69R2d1HDigloWosTqJd9gXJ1gswhE6ATNAAFB8yPlULgkARK66uplagOhOQOCDv
	xCY+PvJqFRsfl2adhG5PYqlqmqQl/IYw3H3Hf8QH0W6qZj6R3O2XemV/ST/BJcPHmm/fc4k5cSH
	j4+nrifx/BFqXOj8izNl+zhgbbxGR6QgayTPmA+3y0p1G9ikeGVvI9qz0MZuqh14VwhMix+l9En
	SK4nAsS5iEO3y4if2u7Rug6esM/ue6bQYaZj3hd955P9ymtTc4/ZBpGlj+3JJxPjRabT+92el7/
	iDSLuhn/mSEMep
X-Received: by 2002:a05:7301:4d12:b0:359:8492:20ff with SMTP id 5a478bee46e88-37685a83888mr29216eec.12.1794333522214;
        Tue, 10 Nov 2026 09:58:42 -0800 (PST)
X-Received: by 2002:a05:7301:4d12:b0:359:8492:20ff with SMTP id 5a478bee46e88-37685a83888mr29190eec.12.1794333521516;
        Tue, 10 Nov 2026 09:58:41 -0800 (PST)
Received: from 20e739389ce0 (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3766146551asm592226eec.1.2026.11.10.09.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:58:41 -0800 (PST)
Date: Tue, 10 Nov 2026 17:58:39 +0000
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/4] checkpatch: improve exit criterias
Message-ID: <avNbT_IRhemIX_Xw@20e739389ce0>
References: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
 <671a7f6bda4ec81f56e3eb7ee287bce4a96b9d5d.camel@perches.com>
 <CADLxj5T36OOBR4J1HGNT3U7H1FwwvSPmBWYRM_vGAEsXfWT0MA@mail.gmail.com>
 <42048f8fba5c2726a488b28e94625938bc045f5a.camel@perches.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42048f8fba5c2726a488b28e94625938bc045f5a.camel@perches.com>
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af35b53 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=IJv9LcIfAAAA:8 a=F-nW4nSZl1667gKoV2AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cmr4hm9N53k6aw-X_--Q:22
X-Proofpoint-ORIG-GUID: pf5miklx8HKC1iLJeD16yvAP101M-mi2
X-Proofpoint-GUID: pf5miklx8HKC1iLJeD16yvAP101M-mi2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX3jAciJo/f7x7
 IWyVop258YEhLCDkBWlqFbPEEIh2GpIepaGsq3Rs0F/IMO/HQ6JG/DrFfNJuis8+UDSybS1Gvth
 VobS3yAcywXC+sAc6NbIVGWkxi9UCdc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfXz54D5SykWbiN
 GJXc5aqjm3TPwKlQ+ebv4ww6wDdMAzwz178P0C0G9eA+OQW+2LNRqYCiXxT0BCEcQZhJmRKjICl
 OvooRb8YENLkTX7BmCUtlE5jZAnpNJ55GaJaa9r9Xpf6MEIAAB7jyMHh7+sMd3vQINSQWdss0bX
 UYbZhYS8TUFnpovoki478kUf45awlk8UuQ09e14XNHYRvwJqlbyHpMARRbYtRDwQIG9uKnBDcZ1
 lfCtl0xQ3odA+cyMEzHZnophDYbFTp+L56e8lxKofTtN6eWMBJ8LIJmTL/A6Uw2/q0SrHOz1QgE
 zOH6PDdsP9apRyoAVOVGqWmMq/YlDs0zj/2OSGTmOxIkWQ2ui41Zmr4TUJXmZmpZYQisyYJsBas
 WsHgG+yniSyQnuOffHQ2yiTORItPk7pAODXvZkF+5FdKS0W3iD6+a0NGzuc9SalvareP19dpEQr
 myXR8+6tsxAZ9CbSIvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100071

On Tue, Nov 10, 2026 at 06:54:06AM -0800, Joe Perches wrote:
> On Tue, 2026-11-10 at 07:42 -0600, Bjorn Andersson wrote:
> > On Sun, Nov 8, 2026 at 3:04 AM Joe Perches <joe@perches.com> wrote:
> > > 
> > > On Sun, 2026-11-08 at 04:21 +0000, Bjorn Andersson wrote:
> > > > When invoking checkpatch with the --mailback argument over a range of
> > > > patches the tool unexpectedly exits successfully on the first clean
> > > > patch. For example:
> > > > 
> > > >   ./scripts/checkpatch.pl --mailback --git v7.3-rc1..
> > > 
> > > Why is it useful to do this?
> > 
> > My use case is that I create a maintainer branch off e.g. v7.3-rc1
> > (now v7.4-rc1), then apply a bunch of patches and before pushing that
> > out I run "checkpatch.pl --strict v7.3-rc1..".
> 
> I think the description for mailback should be changed to
> be used only for a single commit as this proposal would
> otherwise change the exit condition for the single use case no?
> 

I don't see a problem with the description, but making --mailback reject
cases where multiple inputs are provided sounds like an alternative
solution to save others from being surprised by this.

That said, it's not clear to me why:

  ./scripts/checkpatch.pl --strict --git <hash-with-warnings>

exits with status 1, and:

  ./scripts/checkpatch.pl --strict --mailback --git <hash-with-warnings>

should exit with status 0.

Or why:

 ./scripts/checkpatch.pl --strict --terse -f missing Makefile

exits with status 0 and omits all the warnings from "Makefile".

The intent with my series was indeed to fix "the single use case"... all
four of them.

> > But this is quite noisy, and the compressed "b4 prep --check" output
> > is more what I'm looking for.
> 
> My b4 version is 0.14.3 and the man b4 for prep doesn't include
> a --check option or description so I don't know what that output
> looks like.
> 

It effectively looks git "git log --oneline" mixed with the output of
"checkpatch.pl --terse --no-summary".

> >  So, I borrowed the "checkpatch.pl -q
> > --terse --no-summary --mailback --showfile" from there and it took me
> > a while to realize the difference between:
> > 
> > --mailback                 only produce a report in case of warnings/errors
> > 
> > and "don't produce a report if the first commit is good".
> 
> So perhaps just don't use --mailback?
> 

Of course, I know that now.

> And remove the --showfile so checkpatch adds the git commit id
> to the output and maybe add a front end little script to do
> the git commit id to commit subject to make it easier to detect
> what commit might need updating?

I'm now using "checkpatch.pl --strict --terse --no-summary --git
<range>" and that gives me the compact output I was looking for.

Regards,
Bjorn
