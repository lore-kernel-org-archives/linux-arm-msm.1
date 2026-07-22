Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D633F3783D1
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784701586; cv=none; b=birfybXATowqw4YWWvjgoQxVC164irmj3eO4dPATCHVmQ8Gnsne8QFx9zuQBiDVOugYEiZUp38FIIHTfFTj2oDEXp3dy2TvoO6XlFpI1QaRf4n/EIiP1s8SIGZp2y03MmuPJQ72tS/uT96je1KAbDJ9SIWP+QZJ7U5g8BPrGl0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784701586; c=relaxed/simple;
	bh=ANWqAyRMt/cbgEm11tuJyzpAvdtzHqlsryChIh3tj18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hm10qKSO2R+KpigVdq6x8ZvXyvOtjZ1OBq0bH4Pg8cMeGY3ukOa7WxAGzwBswnHqScHuN7qFFAjqz8k4Ui1VV7Gta200RWvfseL30laDSopoicmpb4V2fsVjWJy8L3U3+hQ/BEhwukiyNiQALs7ORzps8HpSyx8K1Y5fwwLexuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HqCEdssq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbVJ5gnd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HqCEdssq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbVJ5gnd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53jtK4045320
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gGbgei6b6aS8ASTNJNECuJ+8
	vcnkKt5wKDZiufHMYFU=; b=HqCEdssq0klyMc6rTS9Eh8duA0xUEdLzSBHLwm5K
	qnmCef+OIT52xTguxcEh3CAODvoHxg/zAUi0t7WHQeVqdPLe5hzVw0p6j0RUh49/
	sWDToenazpfb9Tns+XQTXmK9H/8fCWfIGXJpmzw7ziuA/uBIjdaoxW2E07ukFZWL
	B6JKO9VZV/BFznkqOqRy4X8hkFJXuOr8WvpwT+mmHToq/b09n/dDIgI5/MIbFpGi
	HaKvEPkdhQJ78SUYpYn5nPNR+e+wcv9XL5jYZ8ZSNa8nfYHyIunnSHa4F8N6rL2Z
	1PLsOaJ6zuHzaGDibotAyRn0ps9zvGPSIxDdGSHeR/a1dA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6dakpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:26:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-520a00c7a03so154488161cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784701581; x=1785306381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gGbgei6b6aS8ASTNJNECuJ+8vcnkKt5wKDZiufHMYFU=;
        b=cbVJ5gndkTF8kwRoJddF0q1XxJrH5O//+n5d1GTDbIUirrIg5TAnHNq7TLDF7EOCLE
         O+GBlMRL2Tcn2yq+157jIpaLykFZu04TNFTahV/z4XMJjdBNA3szYDJoXMLFb6KMvL0X
         fRHAZqmdDaWkfwe+MuoiEBArX58Wo3tSEf5zw35CIYBgilcjM1MW86ch2eRNR4/GWosy
         PCRhFD8PM1QuEr/5XJu+gW9rB1Pk9AsZjUUHX8Fp82zraF6++29UwojyvPtIyRyP3Yld
         Ojaqgf56shDosyXv4QDUs4yCD+z7mgzJTYeEM321/8aQe23jOh5Oy8T4OV6XEiiC4i5i
         1gnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784701581; x=1785306381;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGbgei6b6aS8ASTNJNECuJ+8vcnkKt5wKDZiufHMYFU=;
        b=kvUlBgH/VwZLz++lVURpE6RcoYxynKGxd5rAFYoyUNx44nmU7pAyNR1x7AWqUtWY+z
         NCRGI6KoU/EW9wnzDyKzRS8GMzBwIA3spc+uyeTwG3BMUs83NOhwYFaJ8RCCclsCvccT
         FecgqrveCqIH5SxIJkZvy1X54Ab3W9i1h4UDmJT6brCJaTLn940ZHhmjmRL0hRUvICiR
         B+yi7Nl3o2OYDJ6pPtXcGmS/ZFD3PsIEjZQGiOnBtb+Ve8ahZcjqU7GhyJqlUTus1O5g
         fBkX81l/HvjtidU5S2RV5ru6Y8o/st6eI839w8zByR6lwOoxLzl4gpH1XO7eRrEEBOob
         VMoA==
X-Forwarded-Encrypted: i=1; AHgh+Rry+wOjnKpCutAF9eAl4sezjnccbIzOpMMW2hKX3htqI2eaPjyyevIv/ZF566orS/r4gGODDQEaD/byJNGb@vger.kernel.org
X-Gm-Message-State: AOJu0YzAndf6kha0/gFWMPRedbnkBTxRZaOp0HyJ0SfatGjXP/sJvCnm
	/4ZhlZ3VeXPy319jjMEGNnrWp3sfoHtBMYwRZdYFbCHhoMGdwcQBFKBQf7cNU9ZfkPjBLtyzpwn
	zzw286n/LwUNzGLKColE86nsKS8jrCETVCUT/hS1Q43DMIaG5FwQ23+ZDS/k2vfFR/9EC
X-Gm-Gg: AR+sD12ap+iMhaF0BgjYkFw/r80htKUh8fso7C22YTqDNWuPW1R5WtObcm92JxaHWB9
	rQ09Jz+JbJCgp9/JXq5Ab47WR9nEApzdEA2OrMjkwX8RUvIgy6vNY7ccLPoyahbFqa0xqM6Vz9z
	COP5EcVoIgVlgHe1p9yGb9QvzDafRNQ4csp0gIsoSAVRzq3Q5Ioax6wtP5kIvRzE33Fer0eAKSH
	EfJD6vO1L7czTitfMEgxdF/d/d9ffObR+CAy2uzIgwwpf9ivtrcQrX6pLynBuTiA8y6boYrf03P
	QHhB5PxT0NSBxuKmAh8q9QcHpEtLpg4C8+FDYQvVPEOiJeF7NLQEBeWthbpB3IhBrA/MJe1DBaE
	YWVZUoYDKOo1ARj3kNG2UdUUas8gz43JhfICW85RRjyObD/1ETMCh8fMDdXYQCJArAyMn6jNkzu
	fF/iJKhi3nG99x2g==
X-Received: by 2002:ac8:5909:0:b0:51c:16b3:351a with SMTP id d75a77b69052e-5213c8e2e55mr203299971cf.1.1784701581105;
        Tue, 21 Jul 2026 23:26:21 -0700 (PDT)
X-Received: by 2002:ac8:5909:0:b0:51c:16b3:351a with SMTP id d75a77b69052e-5213c8e2e55mr203299731cf.1.1784701580638;
        Tue, 21 Jul 2026 23:26:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c00bsm290004e87.3.2026.07.21.23.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:26:19 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:26:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 4/7] media: qcom: iris: Remove dead assignment in
 iris_hfi_gen2_set_tier()
Message-ID: <fdhgr3wow74em47qnwsyx4u2ysytcoc4zyus4gkegqyro2qhc2@yzgehyqpuxig>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
 <20260721-iris-code-improvement-v4-4-4395bd8acfbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-iris-code-improvement-v4-4-4395bd8acfbb@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NyBTYWx0ZWRfX9xaOYuADjQiI
 GNON1iLL301TmZknC+VoGxFeqDRMLzUpVpK4DPFmL5kE7UHBaig66WHyyWHazat6dSG+6BGWrzJ
 mcLdV8xLAQiEdcaydHL94o4vQCXkHIw=
X-Authority-Analysis: v=2.4 cv=Ipsutr/g c=1 sm=1 tr=0 ts=6a60628d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=miKMHEkbYx8bjHyJJFAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NyBTYWx0ZWRfXyudhTscYO2nK
 NYsJbjwCfsgs0i5xZJb/MUjgkjMmFJMwMySTJd3XPq8KUyR35T2CUF//NOUbgK2NMveaNEw1NMf
 qLw+jVSJgGjoDDv0ixUBFfSxYmtrZbc3TTHhNWVde2D59YGucZ58nZyg8m19Y6hAhglbenv7I3j
 KfUTn0AG3OcXursHKKmHPmyJ0NEhQYdBvsD7R4XhJTym9ww71C9G9NXUamqheYTNUMZAylACAdT
 jn0N2UcRqPcL0BJvR4uqwPiUnfHuaeHe2qagct8Roio7mne2tpRK8PCZdvqie/zqPRrB6FMBUzd
 WUuisjlQDH/qCmk4WioGxoK64Kv+mQI46YpLsjNBBDSKCF0C6C/b7Pg3iBHTNBV5hBZZvrDv4JG
 wT5rAm28iKieAs9XyecvXrhl/Sx1+xlFurCHM15v7RPwuu1/ip/1abHwftKvyByWbVy/PUVvhv4
 IIPBksexSmeD6PL5yzw==
X-Proofpoint-GUID: YjSvh0vL-J3kuSgDQtH4SySxBbTYpL-D
X-Proofpoint-ORIG-GUID: YjSvh0vL-J3kuSgDQtH4SySxBbTYpL-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220057

On Tue, Jul 21, 2026 at 07:50:37AM +0530, Vishnu Reddy wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> Fold the ternary initialiser directly into the variable declaration,
> removing the dead store that was immediately overwritten.
> 
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
