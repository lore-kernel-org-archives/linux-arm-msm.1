Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60873E7BA0
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371340; cv=none; b=DkNdaTGel7+w6qqXbOlHfOAuNZNAVpRIH7lQfQ1e/If7FJqutLwszMRHNI0OslPTLF8Tu/vTZSXBUsG06uAJR/1QYGaYYpUjBbGmgAgwfKMX3IZ7pGCzhEAt58+RtqoYxpFNrHipUu0YiLiKjz0yYkAuz1bzGWIYgGQXtUcQAQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371340; c=relaxed/simple;
	bh=zkqQY0g40O7tzHkPZvr6qu/tyr/ulYc6tAuUweY152M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vqwf3WUCLCWCb25+sdtbar76MPOV+fiPdKnbEdi8vRATQWYe3LhB/A8pmZ0HSpG2SthmHPJeHqNA0BwAC86szds4fW5ocPKQFWTzXCSpQRSUXr+n9I0+oVGcPOb2XWB9dfxXeN3Y8hK6YTmEC5VPWc0+HrGCN6nUZ0J2AKNV6rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lBAOUimp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jD605tNG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBAOUimp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jD605tNG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ini12627086
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tfcBJLN0sEaaIWpvWTjozk01
	Or3fCbRWwVDZEbPf6iw=; b=lBAOUimpCdUPikMNPL0kXammOLvea0iMMbnW0C/r
	NWuVLjSerM3bpdD/eX0uaX5XI6KJaGN0luefSoaBzjDTDwc8y9V64cE4FsfPiMLf
	hESaXPcs701ehUHcXwZ7cirUH9tcXMh12n9+CZv3nicnvd0RAa8hqT/iXZyIOPL3
	7audb9Goj8xxrMNeH9fGUY0p6/FhVOrbjwjzgJc76TaAea57Uql5VNwp5PeRwPOj
	CzncMF+MHShSV1K+uP7jUHeBoGLUYg2cgzpiB27FAuW1znY//1VJ7vXngSEgYPpN
	94P4N052Jk7kqW6Es0Kgnp37GwHw2vUStDW0dA8aUmwGaw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh5dgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:35:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso393775885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371336; x=1789976136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tfcBJLN0sEaaIWpvWTjozk01Or3fCbRWwVDZEbPf6iw=;
        b=jD605tNGAyEDijGo3Bu//jqHSMAcl+ZZwyQFMbdU5ZT9WyzfnDeCwwgeZD98U+ADkX
         tq87wd2ThhEqH8sXd6v4LIenEQLBNFHF8wRjpky/RaSNq/LLe2bLJCA9WL5fChrqCx27
         dWcmhLtgkiQk5/vLHJ3a9xk1HCcvGEn5/koaIaAkvjeN9oaqW4JXeeP5ZRYIHb+e84LW
         +b0imWTcvqEvPheDE/MzuJiZQyc5K9YGXjEISbdyiZGTyQ1FTVxOBJgVc+mPP9kQWqkM
         3xHUei3lG/pZoPpiToylb0KSrVZNxH6JXYt8JlDDx4hwxx7RNdwNvq3Z0omuB3PEE3Q1
         g1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371336; x=1789976136;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfcBJLN0sEaaIWpvWTjozk01Or3fCbRWwVDZEbPf6iw=;
        b=lVwX6AXLxXzNyiPTgYZPEWodyJUDKEFdOT2kDWmg4g9xEp40TRT8sylm/r2SDrgw2I
         0zXZWH/dXSdhQgcvCXJLnq/HgUQNaPeCv3CEebu5FoH6sbyrR0LkzOlpOaOZxcl8AVUd
         +baBGkiE5eztQNMewWiQkwDeTsjSJogoURo858CwE2x0Do1Vlnmp+Xg4OmYuPWh/OPeq
         rufgZuDF9kyyH34+E6w85h8RRYq6SwZ33TtQDS1NJKfGruoayTctzmRAIoZ3fA91pLD1
         iTfZjegfZAtfAV/+aEBn6AE870npWvbdQhD+pMVbfl+/nhIsTVAg501u9hymkSQPNfSs
         Qeng==
X-Forwarded-Encrypted: i=1; AKwUvBypPKCc89QIL4ESSL5cgjPM+aC8U6vu+9RRQ6pjL3HQMvJ3Vr/jqPwvNdFdqrhqc4rmWOuWxY4TpWWa1QI0@vger.kernel.org
X-Gm-Message-State: AFuF++kADZHoaCRxNpra7qV593fH97g+NIZRJhRdkuiZXMxoQgl9vjuy
	YG2ag8TeL5AuHClhs1XVdZ+x3G8vXGX6oacA5DBJj7IS89bZbJSmSMMTqenPyjRobkcAzAKmvek
	k/4YPbofX0yRxiO2XYoi8tu7NxcAK43B1qSlF7XxjMtqE84sf2z7xNsiaHBwNzJOLaNCI
X-Gm-Gg: AYBFou0wgpTY1n9mucAFbsnYU+FyY0aqXycV1XwZNiEaqmv25ZNdVJnG1RnNWiibcdf
	E6/AHuxt5/JvXpJhefsPFyaSFnH/5FNepK+Q6GN3Dr4lk8gLRTwx3ZlxPzUwjHO6OHf5DM/SCwu
	JEhdluGTCzaIdbCBRkDnS06m4GADKljpJ5kv9XDfu8hFt/nE7RmmkFt/4oDJH1TA/ejs0vgIX/K
	pKU412mjYSKQaLDydMwWZQMDWTPsiJf7rLt+gYY1w0bupFRblHp0h/IHnJMOBZzUxxq9aKT248/
	3OpuM0tt9XyZglmk57qwrQyyzTDvLeN+yLiQ9NiXCodegOhBZM8hG7H0lAmg8NeVryX0ANZRonl
	/2DXYAYTZBXGaSg==
X-Received: by 2002:a05:620a:2788:b0:939:a45:8c96 with SMTP id af79cd13be357-93a185cee4bmr481426185a.19.1789371335770;
        Mon, 14 Sep 2026 00:35:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2788:b0:939:a45:8c96 with SMTP id af79cd13be357-93a185cee4bmr481423885a.19.1789371335281;
        Mon, 14 Sep 2026 00:35:35 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e636f7fa2sm297258175e9.15.2026.09.14.00.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:35:34 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:35:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 01/31] arm64: dts: qcom: milos: Add domain idle state
 names
Message-ID: <austvfofuprz5rizz62fpog4hwdyobodxfbjccpfuqkdrjyzzv@cxbyob5pdxhg>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-1-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-1-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: xF03OrrF2qgJm3Ev7ZhdA7i0rKT2x3fe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX5mZh7Blc4cpJ
 YIAKCjLuEUypfyWVybUzZbgDI5FMudSwiJrfE+//xXgdGV7RPaHSH0HJCHSeVPNE+V8z8Y+0nPw
 REnhv15VUq85bECGOkVbkALt2bUTRBtaRcgEzjVy8yKrJa+50L0bX4wdekP/4vYqaLEQaL0nK08
 PSKtLQdc0M/xmrIVFPNcjs5NAheXKsFskQgKL/LBmWqORblUUCSWXW9lObC8x8CTymMtnC4Zo5C
 lcV8l3CU9vKLoDiJQfmP9ctAZ7dP1XXC3B9qM9zWN1GkeIjxvACrbMLoa3szz7nSJRT+TvJE6Zw
 BhCM9GhvZttG8KxXu+yY8BzNsaYfEwfpBXxN2lIGel5ctq8jDqvcYgWU2lujd3k6dEewKUiStHG
 tFarOTjUcNymBrGrTYOPr9WnzAkpIUcFPYKIDwOICW6P8OhIrXBtxDrciej+DIIQNdbGC+Cne/o
 J6CzTYouTF0OV+zzl8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX6Os8UCoaA6hE
 UwbMvpWrTiiOdSeMbG9y/d2iYX1qXwi0S+W4+0pdI/bfVra1EI+nh5jAaRD4SGMELOcRWkJCJmv
 geYrF6KlK1GHb+RMpN4I1tJtM6+dtHQ=
X-Proofpoint-ORIG-GUID: xF03OrrF2qgJm3Ev7ZhdA7i0rKT2x3fe
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa7a3c8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YiyR5B_2n7VWvMOyD40A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-14 12:29:33, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, fix the big CPU idle state name, which was described as
> silver-power-collapse, and update CPU idle state names to match the CPU
> type and low power mode they describe.
> 
> Use little, big, and prime CPU idle state labels for consistency with
> other platforms using this CPU naming scheme.
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
