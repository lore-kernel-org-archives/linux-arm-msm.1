Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E313CB2DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787023972; cv=none; b=dWYJiAzmv7m01Mwzj7n2koZH47aL72CJD2tQcbgzw42XIkBdUrqs2dRrBUwlDtf3Ae1V4JnwmsjnrWIBmbPn02B8ZbgIDdbU+FAjQLQ543QhJgqgBcQzSuN+lu7DHGAVuEVS2mHvdBcKLorv8YRY2/VtN/OVp6zqeKwvTm/NTOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787023972; c=relaxed/simple;
	bh=05mmTgA6Rnt5XSnRQE1Lh2jV3yVtAM4f2nkEjq8ypgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdPV9D0gPWhTl+jE5KJUyVMiGSUrG7CBu0OyOfCSuh6yiT2kwEFglrI/uRdxd3LP/K76S4uWYQwyOq0FlmkO6zwwaCxXQ7G40SQG5fOaoK2WxnzC8j8qWui7fAVQz3NPOYV7bjgRBS7hlj0AEd1qWRGdPTFlRMw9dRog+40nPvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2jxQ239; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUJA5kAe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2jxQ239";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUJA5kAe"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I2YWTM3762018
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6jrYo2RZtbsIDb/KF9qa9avTbzl1dNVpFeA9zuf0xzo=; b=b2jxQ239rA/pNoAP
	5M3cv5Txn600212XZtTGjjas3/wySQJZ5YxWlf0bVRzTO5C9uSYPw7Th/gf77jQv
	KRMGuvoMUv5ECRYtyFJ8kKsiwnT/69Y+NTtZ+vvmQmtU5+mMDqKuisK+vbTjM37h
	kA85xUdcvjLbKm6D4YCRoGSkpk+evbpnOqPETnL/bOqO5997GFZPUIcfHMHYon6N
	PiyEkgdhTW9tUdcE/bIGeByH31YC7nM63E3pLtPLN2dD0MALwYOkFYfDNmHZM4FG
	nbeUa5BgQRUdicwZEwPgt2tEvv88aoxG7ipnMCQAiBkUcFX10Ygf3qAXe44n1AxX
	qA9XHg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4eqtr694-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:32:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5fc4c7e9so543556985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 20:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787023968; x=1787628768; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jrYo2RZtbsIDb/KF9qa9avTbzl1dNVpFeA9zuf0xzo=;
        b=jUJA5kAeG8/a01lhhMugVBK8b+Mbe+5K23GPT1SPEaRAgtB8T83w6cY3jjjr6YNmDB
         09hUGZthiclxGcUReXD0n3pEC5N9HhKXET1HXTmvEPeQiklEn0CzqQRFt8WvwQZF81JH
         UQTwtxMWORVpIe6aPWs1Wb7yIm4e/3Xpd/jh8xpP417ZLYBaA2VBGTRYuqmQTErhi3tm
         gTUgz/HNrsczcQABDpdL3MzrgcUXN1w6sqZQaockajuIuq4KvCpBNhT8YroGt1IoIZ3h
         NFHTjd109sG9sTCIlL1IXGOK0zdqKgpOPsYumX12NEXgbCtRqLj45KleRumfAyg2ilrT
         Ngpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023968; x=1787628768;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6jrYo2RZtbsIDb/KF9qa9avTbzl1dNVpFeA9zuf0xzo=;
        b=HwPmB9k2szNf94V3qihgkpctCpxa6aLnwrXGbZLdrnEkLaRCynTr6ERPovRiuTk1gK
         Sv3z6bpicySF7kMsNuWt961ikvGLMCLbZS1RkMnMDTG5r0pJvLbEbhL5dQE3WoSyLnyL
         dh0FvrC8l0l5ZR/cuGk4agr/sBCoNkmzqEnfr8JlGPo9kbIOENhQLgpk4vHesL3j09Zo
         V48KFYRsXoLIJGr6aITlG1xZOm+RleoHh+9bz/43Hqmkw26sGq/90lTZe7iPuAcKs8Lc
         Vw8mLh6cxpIOMuYEb5YR3cdfUxeQeVVlxhCGFvE0nYMAV7umyheS19x7fqD57XZUcrrV
         Mjzw==
X-Forwarded-Encrypted: i=1; AHgh+Ro2cmsMlAd/zRCL04WQ0DPJNdcplqOnXuVriJBSkcIDHVl8WJQyEWQ2KWtpVKGecEVcVQv6MbJ3AVSb50Ft@vger.kernel.org
X-Gm-Message-State: AOJu0YxMobR0pMt7BWz9HeVotAz0PDX8lkuPhOg5cvWIUZX/c0j2N/nD
	2xP6kFYpDf5TjIK5kbLmrKOvgXKktAmpp1GkykpfHp6eb3b664eoIuTgb0ZB4JtNCgp6jDGJzFQ
	JLkEtkvEMMF3SN7iq3RaQ+4nyUqj5nDNXBeEMLUrfQE9h19LsZhTFPzDqGh8Qt38/Ip/9
X-Gm-Gg: AR+sD10u9AOmN3+GqKrXljwZmRtou3AsiTOphPDtloZ3seeVAUVVa5YyoKIaWxgSU4N
	pUkqnRAzNM7oTmZig0w87A7QZqjH3WGC64NixL3RkfMqGfxEcN6vBiYmosYTNwaMlsMeGL2YmEz
	GQ1qDrKcYgNyKp/Z9nEV8hMki3tDTHE+kPuEOKjpDglRUfw+iVCR7FxXXemryf3TyZhyeXc/4YX
	HSBYkzpk1fza1Fv00bshqwgAAgv/v7ObozhQ2u9lXO7GKpO7vBvsFrfoIUotDvQwYwGWxrZiyBE
	P05QDflTwPu3EdZ2vdmZZJBOPoEUshwFlaYuLJPI22Z1QpVlwGyXwDfi422k3m1778pJ/xcX6Ii
	7RnviYMU3/gg7pGgkzhKJ7JUtCzZ742alNjOuU65g3Tw8bh+H4eLUTsUfUHiuq8jJsox5e5QmmG
	coYndMkVeAXzGo
X-Received: by 2002:a05:620a:720a:b0:936:695a:185a with SMTP id af79cd13be357-936d2356e91mr2661692085a.44.1787023968550;
        Mon, 17 Aug 2026 20:32:48 -0700 (PDT)
X-Received: by 2002:a05:620a:720a:b0:936:695a:185a with SMTP id af79cd13be357-936d2356e91mr2661688185a.44.1787023968128;
        Mon, 17 Aug 2026 20:32:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cffea7bsm846691e87.50.2026.08.17.20.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:32:45 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:32:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
Message-ID: <6jwrfg2vffra5dlqrp46l2ehtmwhfguu3s4acfixiue2p2ei3w@g6k5wxdmchh2>
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
 <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
 <53a32af5-daa8-4a11-86c9-10b1fbf01566@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53a32af5-daa8-4a11-86c9-10b1fbf01566@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyNCBTYWx0ZWRfX01HZFSa8UyfP
 aMNCJCLvl6UIJ1fXzQabUOw+DTQf/Lndv2QL1kKQ3eY/P78LUckZhhaoPnQgh5XT3UGNJfmECMh
 zwKz6gCGErHKrlUG5u8WvfS7reMo1eY=
X-Proofpoint-ORIG-GUID: ECW9FT8eCkJ1DbyhyuUcPG7ORcNfGFOr
X-Authority-Analysis: v=2.4 cv=UfFhjqSN c=1 sm=1 tr=0 ts=6a83d261 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=F_vBso_8M4dMwCL1aLIA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ECW9FT8eCkJ1DbyhyuUcPG7ORcNfGFOr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyNCBTYWx0ZWRfX4O8oXF/gk4qX
 XtuaIgu5xicQyJpaU9YlvQnHGmZBJGcDDbUPJi9BkObgTTvKG3EwlJmMIOqtQNTLh5qT9ri5XyE
 WaepQ7IEnlHr+p5lOt6dCEXjrV1E+9qJOnK1BuOCG0VR//ufUPLY1pxWxAZ2OUUqse4nIoJJEuA
 EBN/N1Ylb4vuNb1otLwjvx0UNQmm79kktx66TJt7Q3+26Wr5qM3ua413ZjsjlnKEOOD4bbjnIKN
 j8fBJigVQqstec8PZGFiRLzAJ9++wNLmvsRod7V1H6HdHqg1Dcliv38VnLSMbK37H7G4646q0to
 553g5CPSTLlZiFRVN6jXUvU0DbKvZ072FrgZExuw5KbVEs1eiV+Kil0MY8zMtblKKdgWnZS9X3T
 NOk0fe0WlnIERXEpIN6iJKD7GVwa2J/TR8LI/5wBYi+l1vaJW0ZPu+iNPAKjb03+7FEhLdit5zX
 Q8RfVNiRofxbsid7yeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180024

On Mon, Aug 17, 2026 at 04:12:51PM +0200, Konrad Dybcio wrote:
> On 8/13/26 9:44 AM, Yongxing Mou wrote:
> > 
> > 
> > On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
> >> On 7/20/26 10:43 AM, Yongxing Mou wrote:
> >>> Kaanapali (SM8750) and Glymur use two display power domains.
> >>> CORE_GDSC powers the main display hardware while INT2_GDSC
> >>> powers a subset of SSPP blocks.
> >>
> >> Can they operate independently? Does INT2_GDSC need to be
> >> powered on after CORE_GDSC?
> >>
> > On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should generally track the same state, except that INT2_GDSC may be powered down when SSPP1 (VIG2/VIG3/DMA5) is unused.
> >    - CORE off, INT2 off
> >     - CORE on,  INT2 off
> >     - CORE on,  INT2 on
> >> If so, perhaps changing the clock driver to make CORE a parent
> >> of INT2 could be the simpler solution
> >>
> >> Konrad
> > That would still need DT and binding changes -- DPU has to reference INT2_GDSC directly to gate it independently, so it can't be hidden in the clock driver. The two GDSCs have independent GDSCR registers with no HW-enforced sequencing, so they appear to be peers rather than parent/child.
> 
> No, if that was a reasonable change (which I don't know if it is), the
> genpd core would take care of enabling the parent before the child, since
> the genpds are intrinsically hierarchical

That sounds like an interesting quirk, but then I wonder if we end up
spending extra power in cases when only CORE_GDSC is required for the
device

-- 
With best wishes
Dmitry
