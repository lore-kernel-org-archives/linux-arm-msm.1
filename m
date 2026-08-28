Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8A140F749
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919295; cv=none; b=eb/nuNj7ZhMns6Wg1OjtCkVRNccmSuJk68jAIWRs3J5o0IFSbifuw5kZJw6vlTe5Cl4YATrhHIG8ZiztSNXjHvPlAFOmbsEhb7tKi9lnxLN4s57lKHV8o/+fhy8kC0mH8pz7mpT081AKiKOvc/vOERWLSGDbVtCe4gBhAfXd8io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919295; c=relaxed/simple;
	bh=4K/ktbnFtXxUOiRHBzpkXjxxs9uGRvk5jen0jEuoCt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvIiEem8AwXgclB9swIgccAARDP0e/qg55avOX/OTncabro+sKKnhU0bQggLlQSlBosg0nrU+AMsPPPbSrrWHnN5Crg7c/wurNAcpAPjkMhXAfMF8IMiFwlm/Uqr8CZ7vYxO4WO0MdP0k7iTRB9vYaSRlJKzavFmh9kQj++f6QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDVUqtO9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RfNGPdZ8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDVUqtO9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RfNGPdZ8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7k9r3306368
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xH52WhtMhlm9EBJU0K2TWO5ErvgRLEO02V2yZlYd28w=; b=bDVUqtO9YBGTJi5T
	2JSarYqcIOAT+XIQ1SwdDfqpcMPbg0/WXY/ptB4WfMZ74bUOuzTKIaydxkxyXnM+
	valspoeotA50tTTUfi1nEfGgFzFgcfbCuZUxALvBbhm94XJf6BVAUE4dXC++MO0C
	QqgWFzhz5PfmV/Twk64zTBOyzBNwMh8vdUjRYdx4GoTvcMjjTUczkDsDCarjMvmY
	undo7pHT5mSZk1AXIC3bufnyofABZrz8KmdT4BElntX2FPoHZRjGc1nwZlYkWHva
	LAZ1AURINuqIcAecMuEufHoDvUriHQ4XkLgQjv0HBfPDAUag9qwOWhK6P/787cKg
	znPzKA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42p9hu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:14:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ea38b1e7eso1693901cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 05:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787919283; x=1788524083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xH52WhtMhlm9EBJU0K2TWO5ErvgRLEO02V2yZlYd28w=;
        b=RfNGPdZ8zV/3znjNzqNbztiFdCwJsWLhkLwIfozfS1vRvomnJupD9QQg0gAGn2GEhg
         Hr0Y1QISCgAQxHBNImXOxhRB+B0+qH4eEKD+0XJghI1VHPY4cboClVdvrRA9oXrtV2x/
         vdxTwNb4DiP10KXV0nxkn8wKOpVvgSolRjMQf93OR8dSHBWRuVhXUqBW3Q7qdNJoiPKW
         Ih+Tpr1Ha/H8FjQbl5L7B48wTXilQH00oPQc3OQlUdIDqkKrpbyRm5bEjFhsUw0uRlub
         DkMRc634a7esEr9abKTml15YtPWUo+v4UG0q5hT5se5Tggs9si4PqcfBmEg3wHUTIa9R
         B70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787919283; x=1788524083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xH52WhtMhlm9EBJU0K2TWO5ErvgRLEO02V2yZlYd28w=;
        b=C7znmGsj1fWek2TLqJS08TFDFSTr0FnE38fWmSKEUMdpABjX55wCdLCnZnxk9HeWMm
         b3eWPnxcNVP6eNVJroBOatgWzOFCH3vaNxUnTbVr/CecEx3P47DT6cDFJ7QTZUvM/8AZ
         Fo20iRS9ZiIsN6sp9s/iO+tobs5AIylEkpzj28BNxiZbr4VJq+90+Lk6rBkX0EX7xJ/y
         3HDEMX+dWWJzSoTs3Ki4qasPd8TKuJuAKn11fJUkUyLTuQwACJ+kTp2MgMNPhHigKnKx
         AG6HqMfr5sXkMTYgNyty1fCtYWnGboFQ1wW3Ietf8y6zg5fmmDvLZtJ4HwleG6X0GeZF
         ipew==
X-Gm-Message-State: AFuF++np/eHJjjeWxavJMUT+AN2fU5/FICtSZeT7/B3/9Eb111onotGz
	gqE1kQz7fu+9XzhT3R7DObaiGHTvkqwTZpMvT3FBmkvKVEp3I6K8hz6NSeKq1XmtlGCSMrdYy2A
	8Ym7GmOUpKabDW4hE1F2pTuezETvyfIzS0Sy4+t7qeld/SIBwK3CNSD9uYllzokehDJUQ
X-Gm-Gg: AR+sD13W/PBxqH8pBlzKtkMgD20OjWJpHiq95YlssFISxHjZFZ8ukfm0H6MYRLp3Kjx
	Hxxj29hFPVnp86IJhwQ13pP9VUy3vTcxcJTmUjR7aFv/yyHewmtT8BBAR0hZ2lSx4pS/nSm3VnM
	xCV2TZesp5DLnUmV4PJPtBDY3JM6IWS7fgQ69M5+JUeBIKj70e5XYL73tgGsjsoAj5DLq3Lyxt/
	/8675do51jlyU6vwxY21qLZVu67pUfDzRbhKHoKzHRfE2eS9o9wW155YoNAvvp8GBc3gArI+Pyi
	j6T0zq1xAJgRieWy5GvE0G1dxEFqcIQrJJT/FtTnAxrbbfzU4p3aHJ8CzGFZ16Qt5Jz/a8fvMCx
	GSh/qjv+eLj3TVVhD4Upnr2g=
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr48349611cf.3.1787919282708;
        Fri, 28 Aug 2026 05:14:42 -0700 (PDT)
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr48348971cf.3.1787919282051;
        Fri, 28 Aug 2026 05:14:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b2074sm74098266b.38.2026.08.28.05.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 05:14:41 -0700 (PDT)
Message-ID: <afe45689-7f32-4a15-a7b8-1f8e855104fd@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:14:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] phy: qualcomm: qmp-combo: Rework DP PHY runtime
 configuration
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-4-8e73ce7c4636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-glymur-phy-v3-v3-4-8e73ce7c4636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: G-V083UXecp8je08Y4N4inAIOgDtluC0
X-Authority-Analysis: v=2.4 cv=ToDWQjXh c=1 sm=1 tr=0 ts=6a917bb3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=lS0QMqM3BESs-n2QcPcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: G-V083UXecp8je08Y4N4inAIOgDtluC0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwNSBTYWx0ZWRfX4/cS/AoaPGnW
 uwjS6YzwLl4Cr96cbsyaeJ4jDgTXQIleNfVNFhJJ4/OSNoC2UKJ5CcPsCLZWmHBahwiR/PBNl1u
 BF2ukE8ecX6/2ylGJz+8CmUIm4bTB18=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwNSBTYWx0ZWRfX7cCAw8sou49D
 K0GzcaDgArYi0EWmwFHJn0XEt9T0cy242NcZp6/aTxK06R7JSrrkAg8Y0DGsqsZXp2KGyGH2g+f
 MMkOuSE/pJn+usC3RcdoDZQIOMg/FSuCdQiBMWjYm6MPKK/B96C2QJTMotqh+8f7SgzlUQN1LlR
 Yi4YIco2Cq0ysBctHNx5SYrLm9HSQfSR40d5ITAHPh7MtHtDnyHEP2zTpSC86SA885hWT1QmYX+
 U4TO4oogB4xujemssNLVueH6svW9TuOu0MUMtjNpNJvl1VXzagzf/ihZcnusNZD/d1g2PreesBK
 p8UHazsSNQEe8sqL5NrDrW35T80Ba0/NOgKr9Uj+ArfiNZcGue7JGemW118v7Juwdo/qOmFWYqr
 6tm0gCv96IpNLq5FEeVFN6TsuGNIjJyaD9ldDAs/YOGf/tyymHqNMBXvL2+UGbfSyM7azbO6Bp/
 XF6PwrxyPGQ3oBrlMyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280105

On 8/28/26 11:43 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Rework the DP PHY runtime configuration by:
> - Extracting common DP PHY initialization sequence into
>   qmp_combo_configure_dp_phy_common() function that is shared
>   between qmp_v456_configure_dp_phy() and qmp_v8_configure_dp_phy()
> - Adding dp_aux_cfg2 field to qmp_phy_cfg structure to store the
>   hardware-specific AUX_CFG2 register value
> - Defining named constants (QSERDES_DP_PHY_AUX_CFG2_V456 and
>   QSERDES_DP_PHY_AUX_CFG2_V8) for better code readability
>   and maintainability
> - Adding validation check to ensure dp_aux_cfg2 is properly
>   configured for all hardware variants
> - Updating qmp_v8_dp_aux_init() with corrected power-down control and
>   bias enable settings
> - Modifying qmp_v8_configure_dp_clocks() to add VCO divider programming
>   and update auxless/LFPS timing parameters
> - Refining qmp_v8_configure_dp_phy() with updated driver enable values,
>   TSYNC override sequence, and additional status checks for proper
>   PHY lock verification
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

qmp_combo_configure_dp_mode() needs to be updated to ignore reverse state
on Glymur

cfg->configure_dp_phy()'s return value is currently ignored, let's fix
that too

Konrad
