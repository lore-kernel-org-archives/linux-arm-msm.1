Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AB937269F
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641473; cv=none; b=oX78n7rl51vHidqXzhBMWsA8YxX6PXTgswclnrYA5S7iEUDO92QfCZqE9vPxS/KTj1oJHRHEFGGzVHr0+Rr2mLU9PvFFI9zaMOQdDWuHZQ/zfYUbudtfKBTJady+Y3nNB5kBNvJRnl7VlUguaav9DUh5UJ/Hhmyo6p8Z93QXxwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641473; c=relaxed/simple;
	bh=yLeDKYmUOoBlawlpWT232ipgMlY7u+sWXAVwZRfCty4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJ7Zg8luXN7CHSaIzItlVOuVFoTS+3ZuA9ajWH8+kcbX87u9+lyplCnVwpqCTbrV3CDsJ+w8VXhKi1sqvkC7v53OmBYW8VBDC9e/RMGJUP1okpkDKk1hl6NvlAP6gVcecOo8jUDtpUnXJCKFc99CyiqBMSNJd5YZwXS+i7zLqBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nqiR3p9l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i6sew6nw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqiR3p9l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6sew6nw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg46I1958692
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Shns5tcGdxwmLdPVH81yrbqi
	fEUO4I9TByta9UuTXt4=; b=nqiR3p9lDeD82Dpl6scC0UqFkMdA4PJJCCA/awnk
	sd6TXk0iC5BBDhlRH9zUyDDKldT82zJqSF5drraZD8pXdPZYT1pcJ1IGslV7gwO4
	v9fO0LESDhWSTnDpik//k/GmnfgeNNJlFN9s2QBu6j9ds0BfZauPqmswIMlcVR4v
	Or9j4gbmn3aQO6DTEVXQEhKCxNfe7eWAnJeiRggB2o/ZO0tqvVNzCyPlszRniBYb
	+IBh59lsg+AnwpIP2UPqEq3qxkkbYxs4o3TgCM1NCqBCudJeRlHrZQa7J3/WjZw0
	322fwQMWCFbkwd18LX1BZN69QBG1DjyieEgjfskqvHNi7Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvtns3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:44:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a87ef9713so71530751cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784641470; x=1785246270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Shns5tcGdxwmLdPVH81yrbqifEUO4I9TByta9UuTXt4=;
        b=i6sew6nw7ExkldEASR2RN/n4O91HeeMMVf0ArTXYQ96RqHfS1TlhGHY+yHMeSPopL/
         K7LkS3009n6XyomJQ5WqbfUY5s4E5FV7BKKl7jjQFvHQ09Kln45m9ugSuSMvtlKwya9i
         /442Wf/S6X8HMrVDfxvbu9rq0sKOr23vj54eLr1Y4gU+ECji1xGwkgwQyD5NAZdO1rID
         EssjJQwXX3MvrgLvZUvjxi/l2SG11Xm8wWMu3f3q0YihkkGqhIf78shZkV1iMHE7nvH4
         nI/jOuQJuJJoYPDepjUtsoMJgw/4MW2yT5NwhvX9P5wVNgOZ88PTKBAUA+M0WoAceG8h
         QMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784641470; x=1785246270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Shns5tcGdxwmLdPVH81yrbqifEUO4I9TByta9UuTXt4=;
        b=M1TfOyK22iaE5H3drd0mi9vJvrbrjWDq5+SErPaBsUl5SzAOyAQzoAGKw7YplEuUl1
         aBGGiTLEqBZVJiB5I69G+tIe24jthFzIursXLsWn0hRNyqtZMTUKA3PdHZ59orz1+iaQ
         i4YP+pdWVdoN31CMUZpW/92VapzmJGzQiFyWYe0m1cuVJth/kgT0qgdD/45tl7ofw2BJ
         l41kxvcbPNl23hqF0TAlvZe/TTufhReUoY/4SJt9LpvYtuelyWbSFUY/1lGl/rMnQ0ez
         UsT4N5s+CkloVgxquFpJVY2Cv88BBcIlvpcyQSCqvWo+kQlI7oo6gPtwU0aZSooxx2sd
         KFnA==
X-Forwarded-Encrypted: i=1; AHgh+RrS/m/3ezet4vNbUrMUAp94vyuLiF8gIEg/x4mNM1CTkIhSDq45QYO12FQDV4j/f3OTPyrfXXaHutK+6JeA@vger.kernel.org
X-Gm-Message-State: AOJu0YwJbBEWiept5ZPWf0xBmsqA6hyNNMn+sv75wBxtS3VAJvowWA8r
	VCX/gd4XLieSIH65mD7yhAYMe7RTuEx43rC4MWp+k74auz5sb2fw2Kh8Rm9QhYckgWo/cfNED0U
	LdzwI4IK5a/rmnw/CXXNAaWJUv+7d50M9LvnQsNleCZ64Rlja8BcvzPgvF4IdpWCwJC/qBJALrD
	tu
X-Gm-Gg: AfdE7clvyRC8bRwvskPDS0z4uD/F0t0bOWtdRmh4WqiXch0onLTT0bb1uSjSgI+n6vk
	iVyrKxHEA3F2Um46FmGO6td0qXwHGMuq28AJpKbj3uSBAavOLsPW+0bibpMTnQDm5h1oDJU//ej
	GIvrR+vC4GFoa0C3oYI0zTXN6QwL16DHUgwGBFsPvf98fZKMr/FTT6hY0hpftip1Ozjw2gHRnAi
	iL+8tqtxbechGMK0L361uNvXr0gb/Uorl6yTxjC9VaLpap7wrzC2IQjGjbmP/c98ZXFWFuonXAd
	ojIS37BtbRz7NxDt3ilpLtWa71mvPZ9+ZSBxuvsXEOh/ejR++sf6BY9ICevxBHgI/xWw/HrqXkQ
	BNr/oT/uP7EijwDmVyq/I7ruCwXxKAmUj7cwd14NEdNPROgfz4NxFDG/mw4bYMxXu34POC6WIFq
	l0ZZh2QkUcwzUxrw==
X-Received: by 2002:ac8:5a46:0:b0:51b:fdc0:ddee with SMTP id d75a77b69052e-51fc197586emr209037421cf.30.1784641470239;
        Tue, 21 Jul 2026 06:44:30 -0700 (PDT)
X-Received: by 2002:ac8:5a46:0:b0:51b:fdc0:ddee with SMTP id d75a77b69052e-51fc197586emr209037171cf.30.1784641469841;
        Tue, 21 Jul 2026 06:44:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e0e961sm2928420e87.51.2026.07.21.06.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:44:28 -0700 (PDT)
Date: Tue, 21 Jul 2026 16:44:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: qcom: sdm845: remove unused card
Message-ID: <oi3he7t7q4ds5tdszsdqg2pwvcz6dp44ldatwrjnk2ilby7nvh@74y42eik2far>
References: <87qzkxi0j5.wl-kuninori.morimoto.gx@renesas.com>
 <87o6g1i0i6.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6g1i0i6.wl-kuninori.morimoto.gx@renesas.com>
X-Proofpoint-ORIG-GUID: T200p5dozPdOJG92ydHSBgSbHcW98Oc4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NSBTYWx0ZWRfX+Uh7zOXvIBwV
 tkVfB4Hht09nzHmu3ja88yBnIQKFXM/x1tn0imN0XmZlOwcvJHgRIJ7ahB9SDHmpGAVATpDiHJu
 nfbFw4HeANjfBTOj3Cvyy/rEXCs1Qek=
X-Proofpoint-GUID: T200p5dozPdOJG92ydHSBgSbHcW98Oc4
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f77bf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=yC-0_ovQAAAA:8
 a=EUspDBNiAAAA:8 a=mSFW0d8dyqmXVUy6iFAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NSBTYWx0ZWRfX8Iq9fK89DaSV
 oPt+dqnyn7eJVmNecpxn4igQ/lwDTRPyKdHoHK0PcWQmy/r6Wxt0qf/C8A7jrSI+/lZXWf1FZOY
 g2GiQI3AKTXaCxALVV2bx2zBA6UN5o8942s8MPd0bbVZNOmdvcC2uSk2PKbuA5qVaQ2xpdlHEnt
 gl6N6WBDLaCwJi2dK9a/kqzEoLHPiHwujbfJ8J2JdI95HJ0DuueP/FIv5YjhiuzAtSErwJzRwT+
 PkDm7c456QtonHcrrz31kruKME9u6xN9oQHq7DR7+W8D86IJp0M9RPxXBksatvaUiy+BcYsYUVM
 dh7EaxsxFETk8a3wHzbwv+C7IHy56tvJxG1K0DvdaAZWd5iTUNTpLyFqr3q52tznC70FvRZk2lD
 ybefu4TDW9Ncl8wwv1Lww9Oue6j0Vl7uRh00htSIfYl/xRktFicw0Z7N49wMaeU3ojFAebgOUES
 LuQHiFjkJWxuyT57efg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210145

On Tue, Jul 21, 2026 at 01:40:01AM +0000, Kuninori Morimoto wrote:
> It is not used. Let's remove.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/qcom/sdm845.c | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
