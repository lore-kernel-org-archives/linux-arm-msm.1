Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730DB37C93E
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060444; cv=none; b=OpWWc6Vp+8xZ66ars7XQZ71YW3/7O5RtD68bmLNClmNz0CLFWTSk5dut5qnJszbb+nuvTLoqu6neox5wL2Z6KlHnRjBxdC1S0MJNIfbZJdupuMuDBvjrwkx1Xb+m4adil5Ftg/QcalgvKvehXpXMeYEIvXNLkVRFta5y8fFK6dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060444; c=relaxed/simple;
	bh=TCrbWvqf63u8uXM2YiguOWjo1ni+/8UwmnOPk+ac3f4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEVxuoSXIX668tjKtVBDWattVhxJ2ov7XZc9SMpI0QiD9fM6NfJkEIqByPTkmLIyLHbcpAxNMxsBahQlQzMJ9Ces+svTPJeaQNCPswhBBJ4CsGgKthn6Mf/mWKBdcdSpKZNDYagPcvEXA7184tU0jP/J6NfqRb09cXUO4yho950=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kp2LTTKc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WfEoxRMh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kp2LTTKc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WfEoxRMh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M6xshV2165593
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p5eN7YD3va4RMrrzBayQIdcp
	WFIP8aIvsPpJCSIUZcs=; b=Kp2LTTKcleB60FIKu7DkVnOONOM2SN7ZzVe9Dhev
	ZL+x8nu7BUks5qG3mX4lN2S0xF99Vcst7r2yjN96PbgnvgobXF7j14C3XSw3HNLK
	jtv9fsZ8bdtkL3q9GunHU68eCXsyC6KUNkmwA+vB3FsjY0JffxzFMPWkVkqokRiy
	TB7SDdyHobWBs9EUlQgbHMD9VTdqLUaAXaQxKKO2FqweSTSuDe6t/0+GlzyaA7u8
	rxYJorIdbgkVGk5GWfJc9I6hE3GfD3DTAFEpTxaGIMNZ6qIlUb7t3Spt1XXaO4PZ
	d1gY2jpoud7Me1YNb28XutwMblzsMarqlsW7zkLwlhNDMA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xetpht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:00:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df375fb9b2so30958765ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 00:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790060442; x=1790665242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p5eN7YD3va4RMrrzBayQIdcpWFIP8aIvsPpJCSIUZcs=;
        b=WfEoxRMhxMhmGDTBsUj7IHPsu0+Bmzr8PWb9DHyFlWrmLTZNGjCI1PYuCxVpLJMUN+
         qbxX+hyERXA5PsRM89HeErIKhl+R9D2yF7SiQvC9URneBTmxLWoUDFZHJL/Nb7IzB662
         4xsMmGSPcZa3UFgNDXiRDb7IV/nRDTtcGaqDW3RcjNr/rg9B6YOgT1uTkd5xA95+AvB7
         NcvpATKWxCajX9Fctm2K8Yn033LLR5+3RY2Wy0qWQriUovSH8F2RLqhid/5ZSF2LxcHN
         +Cd+1XmhzYFSCqXPIclo1qgmOt34DKWOhpPjSv2E9922Tc5CCSoZY3kLvaRdTcTotH+z
         bSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790060442; x=1790665242;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p5eN7YD3va4RMrrzBayQIdcpWFIP8aIvsPpJCSIUZcs=;
        b=hEEI/f3WY+0Mb7Xglr7BGr+IXPHEN/mDjf4Ab6Di81AYN3C1a+0gSv769pbCQZbYbe
         /Z/qhRjNAhW5iozA7/3iw7XvSBs+idDZmOJy+pnchEPQeIXjMsoEu5i0s7CFIamaF0yQ
         Sj0rA25B+dcKNA9GgDTaIqb8gdIxHoh/MEl39DuIYNiYazJ//hii4ILiwXGowOr9FqkB
         Ha2KWS4yyVa/lT24KBcCbVBBEVeoYqKIulTXJtCl+jhatRN4B22uW9FKTSXJ851mDeXk
         Ops9UzSCXLIYgxC41j0T/Ec3I3ziSUFBCEWf3l4GNOJCTZdTju72/uQ0AFK8sU6LXptO
         1iqA==
X-Forwarded-Encrypted: i=1; AKwUvBwdh3PkCAuK+ao8woSoC7DRL0eIVftYGCIFYnqcg0QiB9fDtzQ+IcoZ/KQNxNJ2GXGSZEOOFzKHi4QZ5doc@vger.kernel.org
X-Gm-Message-State: AFuF++m8A60e31v8jzYDbEqTYnl0R47WKT6fyajttON/H+lrhZ7MCekD
	Rvwms/kQW0xZT3u8FIX8WjyRRQWnAMNEDMW7jjAjj9UraB2CPmXqly7H2cn6VaqniPYNhH9zosk
	7wcXhWW2Kh/iM7E7rDNaCXh8VhiyFZFAhLMsq9WbcDPHhUjEAJpMzjOBt4Yi0DBqRM4sg
X-Gm-Gg: AYBFou2N5UcJA6Yge7J3coRchWYEA5yCwVXUzqmfosHJNrP9q4BTPzOEvFWgUkOAHJ+
	WGvzXH7Z78hk4bPilyCeqf05N/ch0S5hDyz9xjxaKfa2WlHONXDrAeF7iys7u0B3fU2EG60XrIR
	7u62c/xp3cY7skDPaZcfu+gMYCGtnzdnKABxhLhPkw1h0gs1O55SeElJpmmJyNT68A0L0HfDvjD
	zW1XCZGkTArhaubiEd9pTqPDl6538L61BHzBD1zXnRQOwfurwna5lHm7TXUS0ZcrhZBXEWh1ido
	LjQBG3MJOIejih9fyXeP7xSbXU5SdSIDd81FlBMecVpiw7xzMv0RkvtD3yMz8OCEZrN+il4Ywbd
	U6iZTSXmMXq/76dsSa49AASn5yJfII2wnj5e7FElsIQ==
X-Received: by 2002:a17:903:350f:b0:2dd:c053:82f5 with SMTP id d9443c01a7336-2df60b45f23mr2467895ad.44.1790060441800;
        Tue, 22 Sep 2026 00:00:41 -0700 (PDT)
X-Received: by 2002:a17:903:350f:b0:2dd:c053:82f5 with SMTP id d9443c01a7336-2df60b45f23mr2467075ad.44.1790060440408;
        Tue, 22 Sep 2026 00:00:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e8439sm3347130eec.3.2026.09.22.00.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:00:40 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:00:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-gpio: make direction changes
 exclusive
Message-ID: <arInku1hs9nTHd4t@QCOM-aGQu4IUr3Y>
References: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
 <20260915014447.282121-3-shengchao.guo@oss.qualcomm.com>
 <0d0ee38b-8ded-480d-a586-d26b3c292427@linaro.org>
 <aqyPs5d72s80G6b8@QCOM-aGQu4IUr3Y>
 <CAMRc=MeB75OeOLeO8nqLXQJMHcny-fN-0J7QGQaSbof++TqFmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeB75OeOLeO8nqLXQJMHcny-fN-0J7QGQaSbof++TqFmg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: GC8OnBNzpYEcQbl9MSRmQwxQ29LyilzU
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab2279a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OddHCmqlFxd8KxF8cHwA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: GC8OnBNzpYEcQbl9MSRmQwxQ29LyilzU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5OSBTYWx0ZWRfX0+DXPNjXAm2P
 JwR5WK8oSjIdozvOfWOqgJXDwSdsaD58FTJulJrc4e/ddEt0jkAt8RDhGFrTPQNfTtSgj8HRSng
 DpZeF2SYnJTDZL7XAbkxYAO1SiumTFxpvtq02IXHLwiO39zFt5N76vvCzTaiSJVsEhYq6R8T9zP
 s8P3mZNSG/3i3+VTgfCIE4oma+Dm5qbHKTYGbvoVwLh5VzpzaC265ftB3By9j52W/0SfbpGOBG1
 2nuohDtXl+O6MC1z2ao5cjxIqKQaHNNk/MfXBvnG9SsjJQ7NGK9epqkSP6zp3p89VVgN7EQSABm
 jbf6SehjPzDZQ5oJdtaSTgNsjKdME6f8H/XBmIDluCCYOA2Q6qicjBmHd+Br/rxJcqsRwSGaI5h
 VWhtHNymHVseAqYPoB4MEGO+O0uFEaWLGE8N7zQLWeyG4M3IYLoO/twyTMriUzUoh4HB55QExBo
 P+TFzKNtwYWPJ04niUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5OSBTYWx0ZWRfX97Xpz8gpIul1
 8pXElB+ljrkm1FRXZZX+8ULfZsmI80Zo8G9a9Qu79nIZ5x11/2VAUkOUE+aDYjuX7mvzBa0svSK
 tRLBDzaKZ7vc5I2XCERwgZBd0nklVkg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220099

On Fri, Sep 18, 2026 at 03:05:30AM -0500, Bartosz Golaszewski wrote:
> On Fri, 18 Sep 2026 03:11:15 +0200, Shawn Guo
> <shengchao.guo@oss.qualcomm.com> said:
> >>
> >> Personally I would prefer patch 1 instead of this change.
> >
> > As I mentioned in the cover letter, both patches are fixing real bugs
> > existing at different level. So I prefer to merge both. But it's a call
> > up to Bartosz.
> >
> 
> I'd take both but I'm not sure if the ASIS case for shared proxy can be
> addressed without reading back the direction.

Sent v2 by keeping 2/2 only and updating Fixes tag.

Shawn
