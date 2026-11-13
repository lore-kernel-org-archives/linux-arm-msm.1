Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578592;
	b=33hlPbca4cqVNXKErNS36u5+WrbOCsaY0FeBUX2iYql9Gn2q1ytFkGtV3py/p91DPlTa
	 E9xeLyE+7kGP+pcR1drm9a8ClYj5jrDHFcIfsqJ/ZB0xpISoRQA+5u+8148zUThvkkX8M
	 Fiu+wjqKCUzRwS+QH30jvXSAWboGes1gsfR8pMFloD1yw3KJRbb0ZCJqR1rbaR0xrgt27
	 tuxkW8vHwwXbpekRgKe7vwqkIVFKfDg++2aHxdPA40COhkgcD7KVmatOs0Wy3rjdnC361
	 rTf3h1OlOx4u0ZS6l8LHEcR+y+Y/Lj7mvqAPWRVmj3J2h7RxVWQe9nP8jXo5s4C7h3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578592;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PUQvuhQRh7K4F7zLr9SKJq7YllsW7TnD6WQcJABt4hk=;
	b=wPEfqhuWNMnLbjd7XttP+4zdwK1EBKjIJ/zCCRzegk/r2U9mDTrrMTMTzN1EJkGrkhv1
	 Nt2yluHCUgTRSfFHQGm+CX/3YJXtC5sfcjoJ3E95ul+oAjY41iLPd1eJXtIw3OsMND2H4
	 fafrbIZmy+UqNc69tVDPSs6LZg/UA0JcIlEB3uB4kk2vPgMC6Ie72MEkIg+CWsVMjTmNc
	 pa1LiDalaHSWQCo8X+HhopjfWPCzlbmyfi+TRG21lKfIQX2XsIESBAHjnsFUITDT1i/Iu
	 iFSiz2vA17e1LA1wuXEelrrKpe83tUxuKNMt3oJABuaGFS8/3S8GqyGfEM05SrnhBAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpIKcwok;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CxaKRxvE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6338606A331
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6338606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpIKcwok;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CxaKRxvE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJoiH516550
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PUQvuhQRh7K4F7zLr9SKJq7Y
	llsW7TnD6WQcJABt4hk=; b=BpIKcwokkcfc473Wb1waaTQpz24CG5t2Drjgdfyh
	QAi1XuzySvCtkG84x7BQQqMIXbGfWGCd5ZBT4c9tXoIm9IY2z1fu2/ADsPhBUBjO
	ip3FWYgji6ko/SsIA9YxBcFO0gwqOPD8+elVqrBmJHlvu7l3Tyv4DOJMhDl6QsMK
	racnnoP2S6ZvmxFaSCE9VL+lb46SY+AUEyhmAzfH+1ccI89hZIBVV1OjyrYTnA7e
	5PckpEik4d9HtCOBJtWb11yPWzhA63A7CHMqUb/iNh7usiwfJ/UGOjjeGeeBFBqK
	VelUSdjsvXturnL0DjSwxVn4eNahUQhXRNYSz4S5Ygug7A==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdkewt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:03:10 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9907539aff7so887171241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 06:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794578590; x=1795183390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PUQvuhQRh7K4F7zLr9SKJq7YllsW7TnD6WQcJABt4hk=;
        b=CxaKRxvEJ7eIdjkSbAeOtzK+KEOsA3TLChySfGd2V92AgQ4ozRv3KuKrT1M+DM3ly3
         w56r0fNpuXTxa3m+glhlnjoYftD4aP7M+QAxQA6Jw4/CNFdYjdpjgpMCMXDuthaSF/2k
         vFpo2Npgq5NTZj440bLUkPJZD347sm/aAO2SmSBpb6Jo2H/BUjIWlM5zAAAg2Y42Owna
         xmCXBnPWwhMMSuVQzfHJd0Ii6IrZfCSJcsxQEACWlNPkY0oITwMRXcQ+ZsaJHrhgDrnw
         A0O0Bu2eeMXhPA/tFUylzjnkO8exK51Sd3kBok8S3FRWl9Yyue/Hu8XqkMdJ9K4tUk6g
         90AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794578590; x=1795183390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PUQvuhQRh7K4F7zLr9SKJq7YllsW7TnD6WQcJABt4hk=;
        b=lmeJK+2qlIiDkH3H4fmrKBVyz0ZdrOtCKSYTAzf2vJh7wgUABWkGac0BS6mejYuRvq
         TK07d4ngL0KguCpFa8cBVR7EibrMMEmloqtiECwIDr50axwhRPP09ci7nhUhyVPDu/1N
         2T1T6mDqJELYNRDQZeob+heT7fy1XpoecMdliR3hA6MbAWQF+3hygBnnjvtCsjawsrAG
         uJK11pp3DDSUtrX4qesRNpVOwCMi8z5Lr14nr6i7ng3eWZAs0HDT1hNB8T5yXkCPnbFQ
         mbW84FBN0ApuiXw/MudOoKC2UyRbDGO/wATi5d1jh/H4cdus9J0s3Yw7D+o3zKVjFl5+
         P3lQ==
X-Forwarded-Encrypted: i=1; AL+hErHam1i3ZpnfGvL5XY6KwAgk0NcmmDX0WMCBtxeglWCkdTXvhM+gPTmH8nmf4Ed5ffuAmhq1iiOJALWRK0nj@vger.kernel.org
X-Gm-Message-State: APuU4Z+1K64x9DnK5AXxrRLdJYodUfCSKgNUq0QvpOMH3lMybWEfqW0K
	0xMmoxPr4Q5PVTftaVGh7ufbGVaB439GQb7WL4FYJMDXZqmnxoCP6RSyTZm5240ayN7Wo/jzjPh
	AOZH7RtypjddUjybWZpD+5GeubYjWnuAJp/8x2vU/63x1XkCknisHPqxIUyMtHCQYfUVB
X-Gm-Gg: AYBFou3GRTGK1gqmviL50LqQN06rqSZQnlcZWAGvKCNNhhCsUe9rW6YfBJrw+X5uUil
	1Whsms+43mEzub/PfAyJqpmvSTbMHepdatBnsSMzdXa0fjKwoWQC5/mQd7a4r30Fiksbx6DcfsP
	1dKTMFnH+MRt17W9yYIdENlTlPkGs1ZtC+gPMyMYdHhTzlb5+Mtm4v6skqFitrFs/b5U8PGJ/Vy
	7j2uVAjW/thG6umm0TlaeYwOo9nEmfnkM4vk5ufyojORxIZQLScOsu8qyeb/q4MWIiJ3lcTp+Fh
	/dcVl1c7fXEtbPxU+ssbm9hqzgXBwqkVGlXdnRfk9tiUhoBfoegWjxS5WGSoc7ocau0YT+5Fz2t
	R4xhnScaOk6KCuprbgqCpIQ9h85AsAskkKyrfHMoKFw0WsFcgEakTp+qdIB57ZOfzxTI2b64An4
	Ksqbb07/f7P/QQwtvtbtMXr6YdkmB07GROpuerXXZuD0h9PwijWcxWoeBr0Ht/KA==
X-Received: by 2002:a05:6122:e22f:b0:5ee:200a:8cb7 with SMTP id 71dfb90a1353d-5ee34aaf256mr861260e0c.17.1794578589764;
        Fri, 13 Nov 2026 06:03:09 -0800 (PST)
X-Received: by 2002:a05:6122:e22f:b0:5ee:200a:8cb7 with SMTP id 71dfb90a1353d-5ee34aaf256mr861204e0c.17.1794578589099;
        Fri, 13 Nov 2026 06:03:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171348084sm769004e87.54.2026.11.13.06.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:03:07 -0800 (PST)
Date: Fri, 13 Nov 2026 16:03:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: Add MSM8996 SAW3 compatible
Message-ID: <ooeojpbsljfgaj5iuzkobibqfv7stvklom32pzqtivswquosew@dfsj4s6cnkbp>
References: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
 <45da00b9-c7f5-4c4a-a310-00c2ba94cf6e@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45da00b9-c7f5-4c4a-a310-00c2ba94cf6e@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NSBTYWx0ZWRfX+l+f4Tdp+ih1
 JozuTmNZOEMqyep63eyMRGDVOqkjgPOnpR29Dq0/bjaxhoJMAOtlbrvZMc9Ru0o0A5rZ8t/K4u/
 2f77yeD+xUkez5aLIb/vJxXlZuEn9xk=
X-Proofpoint-ORIG-GUID: oAtA0taBntKohSm4HlSIz-jnj47G0wHr
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af7189e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=PDbGYQxuVRdfQqe5cAkA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NSBTYWx0ZWRfX7Xy9jnvC73tN
 0A4FUPberL0rhzKGpVb/bYaoySOUbV5ljYb5Kt6zasZ2ifvTaeq8oU2Nvq24LJ4HpX409lbzUQs
 h7ZfbFKkz4fxc5rJhOuyDpGio7k+AV/aFGdgxne6Kc3TlAPYecjAokR9+ogRyP1PMTbJxeoJOb2
 o7zIk1TTcza6yzG/dxX5MNxa4JF0IyNl0Hxkzlb6mhD4YbAcWxubVVHwhTgLt+Du9q6M/PkCVNl
 iOHQ942FnntvYBBfIklI6FJlS8gy4sqGvC+SHRc5546G4SPVR22pO/sMa0K/rw/6hJKp8rcQSDN
 9m836LIKs2O40x1Fxqittmaef/1csV9v490MeSBxAjf4rcUdlO/W5DTXeNftJv/gCreqS1LIjXI
 sxIPWyTbtLY9KlZuFlGEBwqEmBDf47s9llLksC8ipZeoSBVZt+HCkAWBnuAqWcO/dygEWsh7/xB
 3OjQXQoRbWZEWMwV1Jg==
X-Proofpoint-GUID: oAtA0taBntKohSm4HlSIz-jnj47G0wHr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130055

On Fri, Nov 13, 2026 at 08:52:08AM +0100, Konrad Dybcio wrote:
> On 11/12/26 9:26 PM, Rob Herring (Arm) wrote:
> > 'syscon' nodes are required to have specific compatibles, but the 
> > MSM8996 SAW3 nodes are lacking one. This series adds one.
> > 
> > The binding should be applied with the dts changes to avoid new 
> > warnings.
> > 
> > Rob
> 
> I know this has been a thorn in our side for a long long time.
> 
> I believe +Dmitry had recently come up with some patches to describe
> it "properly" - are they any different from this series, Dmitry?

No, on MSM8996 the CBF SAW3 block doesn't need extra programming, only
the voltage change sequence, which is already implemented. Historically
I tried to control the SAW/SPM directly, reinit it and set the AVS, but
it seems it was a mistake. Pending patches (sorry) from my side don't
touch the SAW, the CPR3 uses the APCC regulator as is.

> 
> Konrad

-- 
With best wishes
Dmitry
