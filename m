Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD71241D214
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 17:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786816549; cv=none; b=GupseUDpTZVHjrdijmrOqOc6l6rqMJcD1cDNsYq800pDC5TjTSuzgK9bZz2qpL/RZj5Uol6Fz8h/y7pD412i22rApDIHB5HNSYtqb5bfDt1JfrnbbP7jJCwtkrrQVE3V5+AP/2KUkSZgjUfB+zQ1/pKBEy1JPYuHz2xfqivraAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786816549; c=relaxed/simple;
	bh=B4ZKGJoiOKl8XcGlldyr+v/OjCNyHfxQ6SVPkQVai0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApvByvquDOPVIa3ksgaBYs96KSZq+lHiGw45vYihMZ5hIctwVEImrH1r+gf8VZClg42AQwLvhdBfGAIQCO70DS8kKJZNbrTFcBev5m3pwy3/fCFxq4J5aW7YlAjnO4+6Wc0jZSUq1lSqP/M6Mec9jjdlXAYjvnaQnOHXZ9rcJeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNokkVgx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYjcDR1K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNokkVgx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYjcDR1K"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FGTVjC3999621
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 17:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	islGPNqbf5Q6RaL+LmRucJ7tqK2wpIB5Pr+nHZz+Rxg=; b=MNokkVgxz3Mhtybz
	3HwY8u/BpnX2ZUwS0/k5dSG8yH5a2D9aK+fRaQIxI85V5sf4AC80z51T3bWt8rLc
	H1PrRImSauUh88ZGAICD8aO5URxJwbgkSWhRfhmxBM9tBggsWC6QyWk0KRKqbfua
	rnoYhUjdTKxfY86tQZtSRQ4K/YSedrHdJXGsuRXOFeb58a6q3b2sugSc3LlY9/p0
	iJ46EDdSaXI6W/jGqHOQGxd7/uBGF3LRHKIKn+tZ/OfAZxhtWgWlemtgAC7j7fTc
	xztOPIEb/PKhD7yl79cg0nmNQDhhMJ2taSlMNf3AKYz8z9lxiiWn8L9u7kV8IN4L
	ZhqGNw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghq1kur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 17:55:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21c01cf3so39583561cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 10:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786816545; x=1787421345; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=islGPNqbf5Q6RaL+LmRucJ7tqK2wpIB5Pr+nHZz+Rxg=;
        b=PYjcDR1KNK1GAEhIVc/qVjFdgMvseKyf5rUCnnbGNYO+/QR5vf2COzcsyngNm+tFHM
         2ZUvRPg9pgcHIqAEgNx809feKxvTiihftZcJ5yXOKzRB7TZgMDUMsFTw5SHKZ0+8nKEh
         Amn6Qm2R5dCAtnd+WGS78wTgWNIfPhRlVGJfKNzDdfJXb4mZMWaaiw2/YghNvfJWsxho
         RJDp+R0NsvlafdCyrKa247YG4KaGpTghYJh1xUARZaBWZ1OS7oAkrUZwFtBUJbks/enT
         Z9mvsj8CfvpoNvkJkIpTdjIJlleeYA9/A396Oa6XXXHXBPYwrhzuZu93x+4rHJvj4lBo
         zv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786816545; x=1787421345;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=islGPNqbf5Q6RaL+LmRucJ7tqK2wpIB5Pr+nHZz+Rxg=;
        b=bY+Cllq8j+WOGy4CgO82hqrf1jT1xj6lsYoFqiIlRG7wPOr5rTxUTrtSBT5ABm7zLB
         U/+eNiFeQpihlAw4QzWLOooJ6oo9OZQuWAr6BqSkxERrEDFCmpQcLi3rxwHydx26vc8Y
         v8G2q1AXmw3b4rwWzdKthR7Hn7+eJOLeXrczMp/B4An0Oa07fKRhOkYde7Efjbr4VqDG
         5gXcQmqsDhbVXPysYPV/fvdTcyGdCMAJh/M1qlt7O7fg8anL4yyP1m7MVNEUVbQyWPF3
         1Yyu+WDpDQ5sOl1FANhzvXiRReYo0Fy5vhuU887WTL+0pSDKfCnzWUIOmKnZ2Q1bEmq8
         KYqA==
X-Forwarded-Encrypted: i=1; AHgh+RpGztcSh/PNaK5iKdRVsfx0cE2HceYLKlqiwQIQN83X+ZJI5nYB1xZzT7ysVCINlO3+2mLKbhdovSGxzYPV@vger.kernel.org
X-Gm-Message-State: AOJu0YyZh9nEYCp3uQ8w7G91/QT813wstnvXce5v/eAEXWTFX7TZuZAB
	ASsiWhGp/mugPkTGbb1VdfRH3qS8JQ/9YaHn0CORclaapbXYoM9/ayRBbWhzEi+KosSRcsUXWmy
	9k8275/tBDp3yQhtTc0i52CCiFJM1zSREjpfAKr/VdJxiyl4eSlmBCvn+7l5+N1yBcd++
X-Gm-Gg: AR+sD13g3rj5TobkTonbgkdqirJRd3ed+8ftRhroeA+EQpid1YohAWRlJlGwtvY5vxv
	J+JLrG2RbDUFy6+0cFZXHEZwkqL1PW5uNXpNAcnJPbLi275OzAibWeoo1N6koxa3GxKKgyJJDxX
	hjhVHRSFIXoXsYHgbpw8UScFQQ/qkLSPCvJH85PAOqnoc9+JBB7UBvmad8aOfmR6yMIPzIqy02I
	YQH6tMynxHP7CBJRf5Vp3pBh4eE/oLZAjBR0ILlNH+NaUDbwKyYZw5VTgJbQEY4odDDeI6LlVuE
	O0OPsyUVTkmTvLw4QkrdI6PVzB+5LS5+NytVtGwczIbUQaZQtNfkg3Cy72bIivdUdhDhVfsfOqG
	5ZsH0yZfxCvXNEG7HlbkdpKRSV7vvcvLeWX1wzAhmduljTUJmGZBaGyNn6ND86zOZa71QLtqnI4
	AoouLDi2KvQcmX
X-Received: by 2002:a05:622a:e105:10b0:52d:8748:c616 with SMTP id d75a77b69052e-52d8748ce29mr96063831cf.37.1786816544855;
        Sat, 15 Aug 2026 10:55:44 -0700 (PDT)
X-Received: by 2002:a05:622a:e105:10b0:52d:8748:c616 with SMTP id d75a77b69052e-52d8748ce29mr96063641cf.37.1786816544402;
        Sat, 15 Aug 2026 10:55:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458bfdefdsm1291176e87.55.2026.08.15.10.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 10:55:41 -0700 (PDT)
Date: Sat, 15 Aug 2026 20:55:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: allow interlaced video streams
Message-ID: <pmt7y732eidnjlzuolisfyk5xqfdsfkhvrke2rlkjczqqbwvu3@ru5mmhurfa6w>
References: <20260228-venus-mpeg2-v1-1-c13aa7cb6e93@oss.qualcomm.com>
 <4CA1838F-504D-4EEA-99F4-B3CC5EB10EDA@gmail.com>
 <goqowrvdp4uwbakbp5cztujh5q5z3jroql7m7dumlp64lj4yph@4n3mjqsj5n7i>
 <885a74d4-c61e-414e-92a1-863faad931ce@oss.qualcomm.com>
 <uis6txrcj2thbtkrk2u3w23orzzjkluuzynqcijpcix7zlsvz5@kyrmka6zwtyx>
 <d3310437-2776-4c7f-a844-8dc5de0f6359@oss.qualcomm.com>
 <D3656655-844F-4369-97FF-0A57D023E988@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D3656655-844F-4369-97FF-0A57D023E988@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDEzMyBTYWx0ZWRfX8fmi5r47HUMd
 jPPN6jZDCKfA+F6P5/uQQy5462X5I/6RsTzbcD9EsPLFJZ0CvLojc7GJ0TiBKsdKrIVgOSi61AB
 NQHgqMDbrr0+AmXAbflfzuQMTt1C0UZIyFFwrbW4vPvZPaJtzrnrkJqyP0pHGfb1y8mz0khMakx
 JNxF2lckkaWwrWlt8LwFmASLhg/Ya/0R8gDtCHRTM3xwwhGlg3VEzaiuWgO1qnaQLy126ldLMmv
 5Itn2ZDfdjuxDQoTW3AOlMxmwp4QVCkQKD2u0E1wLCUqwwPCBLdL4D5oaJAaxBJwHHwmk2rqCDP
 kkciVraiURbjEhv9IBlGqlCsNZgaTolc5TZgBn4gM4mXG0RpUYAD4oV+wKzBo6MLBD0/EuGbIna
 Npny0eagtfcJgD+zkBr5PvlTOcRuQiOudVJL1FEIqmEbG53IpKh11bWHmYETIzJQ72zVfJaDzku
 9cmwW3NuAkc3zVzcAeg==
X-Proofpoint-ORIG-GUID: cLeg1n_E2jPAApI0nFnmTtNrJOZqkPQH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDEzMyBTYWx0ZWRfX/8VnuDW7CJwa
 hCcIk4OAGbG6W32xCz16p8X19nxusA6/zxNZybve3mIEyoazELq2PM/w2pUGpxH2Y2jFkuymebw
 FygDqaD/3glHC0bw03bcafedTOpIcQs=
X-Proofpoint-GUID: cLeg1n_E2jPAApI0nFnmTtNrJOZqkPQH
X-Authority-Analysis: v=2.4 cv=dvHrzVg4 c=1 sm=1 tr=0 ts=6a80a822 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=3pV9njX7cCvVs2pVLYMA:9 a=faji3pmpdFn-uRyl:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150133

On Fri, Mar 06, 2026 at 12:04:28PM +0100, Piotr Oniszczuk wrote:
> 
> 
> > Wiadomość napisana przez Vikash Garodia <vikash.garodia@oss.qualcomm.com> w dniu 4 mar 2026, o godz. 14:28:

I've sent this patch so long ago, that I almost forgot that it is not
merged. Vikash, Bryan, anything pending from my side?

> >>>> have any other ideas.
> >>>> 
> >>> 
> >>> Venus should already support h264 interlace.
> >> I guess, the question is: do we support interlaced H.264 streams?
> > 
> > Yes, we do support interlace.
> > 
> 
> Hmm - i'm curious: when you are saying "we do support " - it this mean:
> 1. just support or,
> 2. suport for demonstrating working state or,
> 3. support for useful usage (i mean useful in user space like e.g media players)

I've pointed out previously the fluster-tests repo, which I'm trying to
use to record test results on various platforms using the fluster suite.
The suite uses FFmpeg and GStreamer under the hood, which means that
major multimedia apps work with Venus and Iris. There are known failures
(sadly) and even more sadly there are known tests which can crash the
device (those, defined in -skip files).

> 
> Isn't target to have option3?
> 
> I have qcs6490 and decoder fails on:
> -kodi
> -mythtv
> -mpv
> 
> Tested only on  3 major players as i'm afraid other exotic userspace is rather niche for users...
> 
> And believe me - repaying to mine users: "hey - my distro supports video decoder on qcs6490 as i can prove it by showing you working test tools on it" is not what they want to see. 

For QCS6490, please try using the newer, Iris driver. It proved to be
more stable.

-- 
With best wishes
Dmitry
