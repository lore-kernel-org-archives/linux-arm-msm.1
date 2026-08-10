Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB1E3A3E95
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352205; cv=none; b=KNsQrEKNnLD0uZlmIcos06uZEOhGlwXW+g9zJoFp4qBSxIFUHpFnVVGCsV/76Lu/DWzEJgCsgaiaP+q3Awxw9dJxOhVs8eirAGFDASzsXh7UNhxWhN7yvS1wCzuiOex2TRntt/BYqpRKVDkSZX0BzdX8O46Oagti/o/sHCwkxGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352205; c=relaxed/simple;
	bh=oHlXYPtE3OE0dSgDIiDxQL3Td/GKwGjxBF1m4tS7DJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eq6BBYlUrSfwEMGZ9RHY1lGNGYkjF+IEpEOM93uJVzTJNnAsXs/HLYxpf/s+K/RekxjdHxTIl5roKSNN3ZsCKnwJnnjBLpbuAPPcprEQ6a/kWWr2BSdl+Kpg41VH9zpFYyZkPH0w5EYeBz4XKuoZq1FCZcfv+tKxlczOQGW3ly0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kRRdvrzY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wq2gpawC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kRRdvrzY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wq2gpawC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5HWgD1771404
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zdVA3MiUvF3f8zD2NU3rdR0I
	92/qrwdusVBzawOrc1w=; b=kRRdvrzYvxyI7ieqUYpws+/ELjA7qiWq2ujYYaE+
	pC7+0E0AHu9DaLFrj1pRSbMS3ideAlOuhfR7J0gHz4OVF6n9n5OdZZdebXYvOSqz
	m8yTPpb6IvIrcLZxqbzqCPisc8q2jdPDIIU1DmsIdBKnii/raad6ki+4dPADAikG
	viBCl/PL27lcxQtl3X8AMvsAXgOuQAlxZSfGKkcRJduabR/Bc+0mDZJcV3xW/VEr
	rTBT64SsLRmvEGZSxdIq0TjhdlCvK92o2gCYf8xqAZtGMkf11laGs69o/KjXpp4C
	zrJa5a9n6Ewt2vKROux8/xUq5AC/qcmqc4/o17qhzdcMcg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy19khne8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:56:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c19493ac2so17522551cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 01:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786352202; x=1786957002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zdVA3MiUvF3f8zD2NU3rdR0I92/qrwdusVBzawOrc1w=;
        b=Wq2gpawCwo4bwCv5x8BHk71IPZh9YEMxx7ldq78J4AEXi/WW6gcHTq7OGFLidSYpMV
         XZ6Ukk8UJVUL2cv9E+/7qKa0t4poYad6WS9ZMikzwJUg6ucX2OtQSQLoems8KZvhAqx1
         zPbsO6boaqgDUda223mlUlRAdG15Q8wP50KNJNA6x2iXCJwU/XVUufyfK3KUrrlNKsug
         zvPtrrplwc5MaWS4EyDzGXAcb6llaIqs7pMpTSKSEN1li9HXJEWJSjk9vVoWfJiPzOLD
         S19yHEVP3ONQraXYzqoXlOBv4xt0W5xjqSV3Xri9qjokPycT1Aa46RoOmR7YZrtdV006
         wZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786352202; x=1786957002;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdVA3MiUvF3f8zD2NU3rdR0I92/qrwdusVBzawOrc1w=;
        b=awDDuTVMcta/5PwMXEkyOCPVz9qcc0oTQKvUSXgnORoJEaqM/mN/96arrZUsuyFni8
         YNOl7q7q7N2rfhyZlFyC6awsxmkyc/oWSs7YeAIcKIdXVEJzPETOQJeHG5KW9/0q4vBO
         KXxJdUoLhD0jubjU2rU4GkMXlGgiTpeQWWX5TFO6uxBnopoDlztlhb3ZV2jDyFUA++TT
         e85Z03ZwKRuoEMsoJ18EttptAjnbLETVX8W2UZtW3n/MepERV4S2Bwx/8MJpv99PptFp
         aTJrMHoeWpENKZ+PjOlxHdUS8tjeWURBbaVHoBW9idBVliuqO3xdmfCcW4gqFlAWwZaH
         1Xhw==
X-Forwarded-Encrypted: i=1; AHgh+Rr6rHXBGU3/yTwMR0fHGv1/o40Zs9UdmpUQHTmJJp761WcLzW+EYsvOFmyn6wY39ipmJmVYWSLpTZbv+5O9@vger.kernel.org
X-Gm-Message-State: AOJu0YwAeVqo3GF7bu3F9ahDDYETPoJanWDrwEvFSDvMLly38+21hNBc
	JpKkdIDeCI22KysHx/K0OhxYFbCr+TxBSMEww4Er2GfoWHXcOsZb3RJkvID5qzvHjipQA6iG//q
	wGkJJjUt6fyAuGygc0QZsgstK7fG7jBS1ipsysZhK83gSU2YuLoUcrW0qSmK6hEWODHc/
X-Gm-Gg: AR+sD13jldPhhDlb1LOlqi++qaCfac6aW2ddtBmdoXG8v9MWBRSgyAOyyimVXvl8lTe
	Lb2Ud72r2wS53W0NUzd7AJXXZQNgpeWuHXYN6uBKziCOm57zs6TKp9vqhhfgCu31JEUKnQEYOVv
	hLEjujI9Kf60Mp8xZEufc3EnyGihyqkDApNnbOifSgrDrpQFgPsFz4ruJ45Y647YkCLDZpyPqLo
	ev423z0TR0/QbwEtO7PUaTicvH1PIJxmfkm4o9o6brK/lLXUcnbdHYMFm3Dv/S2LoJAD69hc5Xl
	jMblR4WX3LbyFBw8/2U1aZF1Qw1H9/XLnCuyCuhO6ROgDXScohlX7oKi1x3IEeYucGgxA5HkDMl
	HX+kr3TfzbsvUHpCGy6TLceGNrCN3rok9rjOo7JrxRIOVXvpqjWrDLJZJgIrskeI1w/4ZGSDuz4
	mBhF9L+/kACP0axQ==
X-Received: by 2002:a05:622a:1791:b0:527:f4d0:4bb8 with SMTP id d75a77b69052e-52d4bc37b32mr124281cf.22.1786352202417;
        Mon, 10 Aug 2026 01:56:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1791:b0:527:f4d0:4bb8 with SMTP id d75a77b69052e-52d4bc37b32mr124131cf.22.1786352201918;
        Mon, 10 Aug 2026 01:56:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b307ea6ee3sm1842215e87.4.2026.08.10.01.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 01:56:40 -0700 (PDT)
Date: Mon, 10 Aug 2026 11:56:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: mmcc-msm8974: add GENPD_FLAG_NO_STAY_ON
Message-ID: <7yn3sn5uj2ttrvkzkrz6rwa37neilqrh3q4m23qexnv5tl3l2n@vxkx32oauak3>
References: <20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com>
 <anmNuXoOK7Xn73TZ@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anmNuXoOK7Xn73TZ@linaro.org>
X-Proofpoint-ORIG-GUID: fSWmtue9XXmTUceThLLw-UtPhYdKLRba
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA3NyBTYWx0ZWRfX1uipDqSBbztK
 /t1/dxMx2ZzCghSYiU16SuxJhp0U1Y4rWGZkhJRzzMnq5qZnSMNoKyVdm2/K098jOlWwMBxsVxo
 T2cDwsEXM41xjFA1Q/DwGmEZzrpF3K4o9eV9sRYq3rI0Z32xHYgjYoo+MxXdOyTA9viLBlA0fuU
 C+pa/j910RjosfPtybwTWUFtQ7L5A/4cRSSfZ4bXthBYikOqrlFCO980AD3Wzq1UcWm1tagA+HS
 rLzTUXi+ejrLxN4Kz114cwxyV5GoyeZL36nCmzNDXlqzma2fXQRwmt/vihwoJEJBEA64BQmHRBY
 BCWAW8/7aP0H8T4QB2hDq6VIijbysaFgVG4ndPWnAeWlJ8x1LbQOznt5IdGFJ1PxBgsSzmzwz9+
 jcmlV/6Ma0YPV7bdvMijtxb4t0ByEnEXae4NSKp/aBISV4lncKnprFtBZ2UivknbgbPcFVzxfWf
 K3zY78UouaLUrOpO5+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA3NyBTYWx0ZWRfX1dh75pEOfLL1
 jsVtRVPtcjgwVlmh0/7t4aQ8fIygGrkF9dSvyhlWHz9XLtJCHY2WyeJxA0ZlWwmS/oUqtWRAWiF
 PieuLI6N/1cPHPjdqyST9bePajioCxk=
X-Proofpoint-GUID: fSWmtue9XXmTUceThLLw-UtPhYdKLRba
X-Authority-Analysis: v=2.4 cv=abxRWxot c=1 sm=1 tr=0 ts=6a79924b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=GMQ9YdEd6bAW0Yv8tZMA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100077

On Mon, Aug 10, 2026 at 10:37:13AM +0200, Stephan Gerhold wrote:
> On Sun, Aug 09, 2026 at 09:58:37PM +0300, Dmitry Baryshkov wrote:
> > Commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until
> > late_initcall_sync") kept power-domains on longer during boot which is
> > causing DSI clock to get stuck and fail to acquire its configuration on
> > DSI bringup. While this is being investigated, add the flag
> > GENPD_FLAG_NO_STAY_ON for MDSS GDSC on MSM8974 to restore the previous
> > behaviour to fix this.
> > 
> > Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Have you tried adding resets = <&mmcc MDSS_RESET>; to the &mdss node,
> similar to the following patch for msm8916.dtsi?
> https://lore.kernel.org/linux-arm-msm/20250915-msm8916-resets-v1-1-a5c705df0c45@linaro.org/

Seems to work, thanks! Indeed, it's a better patch.

> 
> Thanks,
> Stephan

-- 
With best wishes
Dmitry
