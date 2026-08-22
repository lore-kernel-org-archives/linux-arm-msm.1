Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E46B347BBD
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 14:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787408729; cv=none; b=dyaKX28jRd+/q4ssMe06gI/BoNDQH4VRSH1gVS2PrtMI7FkDAGLxc6x0V+1/f5iTEPPnhJDf/gxu1bJFF6QJcWbgMpB6iU75TUeoMvICxxWcJkXTrbmjreOGEdKgcClP7VUy+SSsnnhcfRjclive3o3rlrF2gsCt1PzrR7qjEP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787408729; c=relaxed/simple;
	bh=JohAOoCNGkQRZL2E68Xhgl4IRplg1FotNZ60cFKNAGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L0TPYBimeG/FslitqrnnzdJ2BzxEWRERqMRE2cGAuF6X+pgUYDAiOuH9nOpu741o+Fv9DqejJgW97im3DZqM0IHk6M8mnmzaxiQt+6hiAlW7PWqxNvYT7/b4UqUPBViYJQnspHlIez5JVN9VckMFEbCfLnalIGt+I6B6d/wgdpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=StKDbvt+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Htff296H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="StKDbvt+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Htff296H"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67MEMJGU474481
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 14:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lqTmiWxZbpG
	p2Ca8WwMlm9SHBAl/t1NnsRYU6QY5Ozw=; b=StKDbvt+5piXpjLAhP9AktDQ8y8
	ACGisiKZggddR+xQ1CneH20c6Of6zZzGcwYjnUGg30JEmwLc/d0LNkpXy1s3vOeC
	2DhHb7a2tg1epzgl2RBoIzBsg2021XhLbHERwepy2pVGrSem535zOGAj6/o5i0YM
	uPlljr5gBc8I1cRHpiuR9Uy/LT0uWTtTc5Ld0V7aO1xVfnkW/EDYUMNPoxIseXgD
	d0FsBAsdiBBTWq5Uwz99Gdy84WuW6/quzo4/Ajg80RdOkI5vCrMb5Wy+5Sqn06vx
	yNQNuKS03z5bjsB5OVd1TBBGST7lxglbyBTGjdwvtB7UIk722GerhHy2Atg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74xh9b43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 14:25:12 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66cd27a5468so4789235d50.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 07:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787408712; x=1788013512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqTmiWxZbpGp2Ca8WwMlm9SHBAl/t1NnsRYU6QY5Ozw=;
        b=Htff296H8ByDtSZ9FGmT+Er3eoXKzRTGtC6MViFlU4LaMk/g2s6LvY+DcZyFNx7u8k
         hVEKN/uSYmPwPtdejvve2A2TVhzUBcgThrXX4Xn9RWHcdNNiyiJH9aKDEy0mOB2HURiN
         2QzOJspsf60GLHFiFnGUkk0HvE7vrN7GW/xTB13yAlf/UEpT/G9LrCoAvYtUDt4nXjtS
         IuqFlFk/mb6oqKdAvXpHVUjCvteRNgP6ajwMyvVT3/BpG34F9244+yVOsNi9CsRZbVpD
         Bp1HswhskffVR5WEXk++5F9M78qmEuQrBaQsTUyT5ltLnN2DJk8Hu4nabIC34aELUieP
         jtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787408712; x=1788013512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqTmiWxZbpGp2Ca8WwMlm9SHBAl/t1NnsRYU6QY5Ozw=;
        b=pPNAhHf5fMTkZ6cjCz7wb1CgSdFEEbKK2ex7ZmraWs0dbxBQbgdDF4JXNPJRH/Wy9H
         wSnAL+i9e2ScDm/nldnyiBDZoGTVckOZyYMf8/RF99Buo9qUbj2KOsRYE58weWWK239k
         r5+js1I+xKOdNZCX38agd5W4T3W/Na2iM7GAzR/uX1oHrUoOr/9L5ZGETiWZaSEX6svd
         +aEzWz0iYLvVHXlIilMuCrVCiYiREo1KAFG5M6HhM8IFjBFeZxvE33FFb/Z+DdBsFoTP
         4M4EWLanNrT9CqF0Zbf8MbKIbtiOWtaSebMbvvgVfJq3S8xd2NyWu3JDyBMD5nQJHSZP
         l7lA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7l+1BrAZnpKhAwjXsmOpt2fYMCQuTTBhDLTBvqQltkiUkP60kLx5QMjYYC2hzdy+Z7SzZ/MYPLwNHd4OB@vger.kernel.org
X-Gm-Message-State: AFuF++nYJmkO6V5jF7OmDbodv6u+b99trAz6s27teBlGnZK6ETJfJAD3
	3oS+zdHG6mBadwfBC70vvxs3l944WRzRu4504U/X7m3nUKxK/pa3+OBSj5DC67qT/ehqb6aC+NV
	gn1iHSqhwexyuMSfn3N+WZmysonrNOwsRBvGbHRW4WXmkCoQdXdttdpG5ujK6wcg2HLN6
X-Gm-Gg: AR+sD12w5DsoS1i0fDqahYIPxfjUTzg1TyICNbhRfbPJTajREvxq5b7xyaMkSG8B+33
	THzkuRBG4Fzvy/Lqw2NhlQ/vvw4zV+APUyGsHs7vQ8KCj6xQd4twmcx5p0INhxcgcrWylADpwTA
	F4FWKhoKwGgMzPoS8fpzJmUNDZ4nJ80t2wo9cnO94KKyck4BsEaGiXvqrbD82XEAECRJX7X1SZ0
	MOWcWFbDDB81+W+QoqNW0BpwdyNvxdzX5c70BJcitKFDXQ55jRCccZT1oll4gpHlEdTpyYer7TM
	GvBQ6u04HP6GBec3TAH4TOXqNAj72/5uGhK4b1knEkziFnxnw/lzxdPY0dn3baoBX41mBskDOpo
	3zgZhW38n3VUeW5YA+QDpLAKC44hizDgfl6nkHPEBYBcLBc9o3g==
X-Received: by 2002:a53:cc8d:0:b0:667:a285:7624 with SMTP id 956f58d0204a3-66ce4b02a7cmr3827519d50.35.1787408711888;
        Sat, 22 Aug 2026 07:25:11 -0700 (PDT)
X-Received: by 2002:a53:cc8d:0:b0:667:a285:7624 with SMTP id 956f58d0204a3-66ce4b02a7cmr3827510d50.35.1787408711459;
        Sat, 22 Aug 2026 07:25:11 -0700 (PDT)
Received: from agents-mac-mini.lan ([2600:1700:b450:a0df:b4ea:69ed:306f:23dd])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66cf46460a1sm931442d50.5.2026.08.22.07.25.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 07:25:10 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qualcomm: qmp-combo: update DP PHY PLL programming on Glymur
Date: Sat, 22 Aug 2026 07:25:08 -0700
Message-ID: <20260822142508.25473-1-jason.pettit@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260721-glymur-phy-conf-v1-1-7c8909552c5e@oss.qualcomm.com>
References: <20260721-glymur-phy-conf-v1-1-7c8909552c5e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 93zHMH7BxisZEQKH9esIPlFeRr30RwOE
X-Authority-Analysis: v=2.4 cv=GdQnWwXL c=1 sm=1 tr=0 ts=6a89b148 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=RQBTEf8xbrG97JagYZgA:9 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDExOSBTYWx0ZWRfX5PvlD3ekTnc2
 btcgzC/lkdszku/N3kRQ5UOczn1T/t27aMtMFDwt/stRuFg0npKNoSlh9xIS9mxfRI3wM5oqEUa
 WqE7fb5nEFfluCgILU7yn2NWuH+bzmZiErc0QUK9hfLWlU04Buz0cdFzktdqHF1kqURRyxS+oP+
 YL8U5RtIXz5yRo00yFLH1NG81dx1javZ86Cc73LYYinpecrNHfmKyvFQHEBI9ehI2CNAjWk2Tyo
 w9uBbyI00pd8l9GlSqSN71NiNRNRw/3Mp9vpBjfLKwsdHEcGPY+Gn7235UV/pk6CsZvKfNK1nUR
 g0HlChM5mttbiCvq/nUFjqvHP0DGkFc5C5/Kil2RFuPzpFpeXFJxp59zcbTLHhtPxrPYgdogg2k
 DdHAN4zzM/OwAjU1KTLCsYWMN0qUvbgXnRn2UC4yQnUUZGWmxzsNpX2ic7Nrb58ihlLE7eo7wMu
 jNmPcxXNBx9sv7GDLHg==
X-Proofpoint-GUID: 93zHMH7BxisZEQKH9esIPlFeRr30RwOE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDExOSBTYWx0ZWRfXykNiySJ+gxQp
 JUIvnpn86eVED0Zs21p698AwiX4LJUudjXcR+X3LbLxjBKXQEr/tm+So2jw8eO+EZpFW/n+bxbp
 fUHOI+YkggKDDL6nWyp3EQf3w34eoKs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608220119

On Tue, Jul 21, 2026 at 10:48:33AM +0530, Nabige Aala wrote:
> +#include "phy-qcom-qmp-dp-qserdes-com-v8.h"

That filename does not match the one accepted upstream. In Linus' tree the
header is

  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h

The "dp" and "qserdes" components are transposed. As written the build stops
at the include.

  drivers/phy/qualcomm/phy-qcom-qmp-combo.c:56:10: fatal error:
    phy-qcom-qmp-dp-qserdes-com-v8.h: No such file or directory

Dropping the line instead is not a fix, because the patch uses two symbols the
header supplies.

  phy-qcom-qmp-combo.c:321: error: 'DP_QSERDES_V8_COM_C_READY_STATUS' undeclared
  phy-qcom-qmp-combo.c:322: error: 'DP_QSERDES_V8_COM_CMN_STATUS' undeclared

Both are defined in phy-qcom-qmp-qserdes-dp-com-v8.h, which has been present in
mainline since v7.0-rc1. Correcting the spelling is the only change needed. With
that one edit the patch builds cleanly for me on next-20260821.

One other thing for the respin. The patch no longer applies with a plain git am
on current linux-next. The include block gained a line in

  eca0e717aab1 ("phy: qualcomm: qmp-combo: Add support for Hawi SoC")

so the context of the first hunk no longer matches. git am -3 applies it.

One process note. The subject line reads [PATCH], but the changelog in this
message reads "Changes in v2". The revision is therefore invisible to b4, to
patchwork, and to anyone following the thread. When you split this into the
smaller commits Dmitry asked for, please post the result as

  [PATCH v3 0/3]

rather than starting the numbering again from [PATCH]. That keeps the lineage
traceable from v1 through the split series.

I am carrying this patch as a prerequisite for HP EliteBook X G2q board support,
so I am happy to test a v2 on Glymur hardware.

Thanks,
Jason
