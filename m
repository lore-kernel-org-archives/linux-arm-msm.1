Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60D442C51C
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227379; cv=none; b=amLzOfPmKxE2dGywL6akRW6ItRDvn9RZggNOLU1hUtKGj91MvJxWbhM3VmZUTUB1GLHuDNkxIxb4UhOuioXSkfyxAnmm9KOmxTbhP0IquJm2OD8q68Q+7UsWL6sgdMsB1ZkrbeF3Y3wTEGYrhe8jEzuKW7cO+7Ggxj5ipQInJyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227379; c=relaxed/simple;
	bh=Vbi7IkUq8B9jJRh3qR3TUtbJMUTUcNg7QdKscRxEt2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCF49PqIqwBTI93eg9NcVR/mhyCN/uIRQVlGuLZxmnRiVdHCerAeCp48qgRJGS7AbKzdPEqaDEpZ07CCkRWwlqhNVbDn5Po7jnXSqFLQM0oHodzjUx6GR/weKX7lqNt1XYmr91nFxCewALdtDFhzY2IxdRndN5E/dWVsoo7EvJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gHMznqns; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZWoYF3rd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gHMznqns";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZWoYF3rd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEe1073471440
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=roZxxF1LIDrEPc1y7e6j2bdW
	NGZ4/WzmFDknXsKKMIA=; b=gHMznqnsrWJZ3zYAs4YpNLJvBspU0VtzW1+j3de7
	7ukaGGqCXy7dqH8mcLd2ZVCoa/R1vrQBqfpuGhWDt/etox1IvM6wb/PehnkCnZK2
	NLeMRFMI9EwnH3y3zk4Ch4Qs4d8a8/LH/ei5YHge6gFMOjDeFSysGu4r0iO8D3g3
	FukJIJzzdwUGR3ySjdrDvB9dUOsWlIGdgnCpKlV+c1dqlDY5ofcKLhyN6xfzAjs/
	kiiQMcodfJPaJ5Sv9GbMynnXkpy4Zf0EtUvk6AGkW2k0mPTG/9ry2j2FDaiRur5B
	fT7fnMc/9Mkv9zUFIuU1FF1kWf8kMdbJ/EAa6P8V2klpeg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c99wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:36:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390a2c895bso437995685a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 08:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789227376; x=1789832176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=roZxxF1LIDrEPc1y7e6j2bdWNGZ4/WzmFDknXsKKMIA=;
        b=ZWoYF3rdCzoxpm2qg3DgohzEc8jTnciO7b71QnO2HCJsa3r83VCReFZRW1LM8gzNO1
         tzTcLGa7ad6vqBrS8k25JPhmE0ccBwVahBTUveAKpF4gp9lbwJtHqLFE71jfMhVkc+dn
         2kb14wP7QxvWlmmrE0sdKuihg9MqdRBoFDJiPuSB86C1bAddMwvSCdMWtGpk4JeOivqr
         Bcs1I2E+11ehM1/x+zFapqRojn9B8b6Qszd41ezEBD/jkH2vews5p6M8a/TViWD8T/tU
         Bd7IiEh2Djuwbky8KiS9IIY4sm60oqSabRP73Hqcjuo8PlQGu0B8CKjZYyJwBaBCiYbi
         wJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227376; x=1789832176;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=roZxxF1LIDrEPc1y7e6j2bdWNGZ4/WzmFDknXsKKMIA=;
        b=rFb/DiR3slaRvnlJcYIpP4LhhIZ3gj/xQ2SgHXtAleZV8bp+kxZBtPWkONLMPCoLCj
         fkBGmHdCo5gV1jD6BHpPpJEmxUyL/oMKRmdR4pIWda5zIAI1+fsod/N2a062KXGAt5LI
         ZoVp35E9TDSFCAcdt1Rq1R0Kw8+5zh9M5/m/j7QnUUulXUvmx9VLc24LKUZkpmno39ZW
         xzZbB9wfi5aHfXjd9N+cuB9AuslztU5UHl1LnZGZqyykgOISkSC+Z7gllV6MBgsalmm0
         LYrXVZy0RgVY2AjNlv2uX7+hWS1Wg88Kk83ERK0AZd+lrYbt67cP933h5rLDbaIH4cMQ
         dCHA==
X-Forwarded-Encrypted: i=1; AKwUvBy3cgDpEdVch6icavIn7KBTMoXY1SBrwz/LXN4E2Vk0nVOCmD39X+wMV54uY99xNcITwcnT76VplMPnt86A@vger.kernel.org
X-Gm-Message-State: AFuF++ld4xXjPaP+QPZolrr7YhcaNeBc3iGfV4cXjzKcKY4cC6UXsSbO
	HOv5zZH0e60hKCgsowI0I/Pq69qXxOpPowwgNef4ft/B5+ekTdOjLNjnqxECPydEPE0e2lt/J6+
	QiSujPaL0UDMr8fCNOn1cXZoRLPEUV3jVU8pmi79WA9m0ylmg702XBXcseYW8zlV7Cvw4
X-Gm-Gg: AYBFou3/a2jMRHenuQgRuV4sfulMXMn/E2vMxrzRpByl6tsEHk4XIl1+o4uE2ZXH4mS
	SPu24cmYWYnpr5/5xgsh0FbsCl7/9QcjtqbIV+RrpNR/UYZxrB0rJdUKREhu9JTsxuXGN3JR/ov
	zQYM0F+e/mrP5Al6R4L4uFhdt1j2kRsoKqLwlBzHOquyYdqHaqsBFeOSnn8gsvrRbBgacRwQui6
	6kzxsRi/UKvgUfZCB5UTM5UkXkPnc09lGdWMeubNYNaZpaEjJp8nz8IR4YlmPTqJS7bnzLdyJny
	0erSAunaFNKOW91ljfBsIUH5zvzViw/KZlFQmvyb2pc6iftBVDmoQgsxCFcKgI85CxBfqyldwAK
	rBFKR6i58AAgYWug=
X-Received: by 2002:a05:620a:4144:b0:939:8d08:9244 with SMTP id af79cd13be357-93a03709296mr444170985a.25.1789227375927;
        Sat, 12 Sep 2026 08:36:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4144:b0:939:8d08:9244 with SMTP id af79cd13be357-93a03709296mr444164185a.25.1789227375408;
        Sat, 12 Sep 2026 08:36:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34fdd2sm13666987f8f.28.2026.09.12.08.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:36:14 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:36:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra CQ2390M SoM platform
Message-ID: <qkoevqddlypqomyadf74jbd2s3zoouinsnjzmpj76rvzwgpyoo@ov7yyratpvmg>
References: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
 <20260911-shikra_adc_support-v6-3-e4b2da5cd55c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-shikra_adc_support-v6-3-e4b2da5cd55c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e+mT2qp/ c=1 sm=1 tr=0 ts=6aa57170 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=s8hspuRcmIiiD5yHkK4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyNiBTYWx0ZWRfXyJZeQrHHmMCe
 PIwwazkJuBcd/2rIYWC4Cwk1EXb8825y5mxrlIUTto3WoX0yR/mmBlxQmftoHrtsWkuGG/nyJnA
 4ZeLFTnGj2ApARxlG0iRNh1yGO6Zt/A=
X-Proofpoint-ORIG-GUID: 4HniJfzvbH5MNjwsI2NgP8XhTM62P7BP
X-Proofpoint-GUID: 4HniJfzvbH5MNjwsI2NgP8XhTM62P7BP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyNiBTYWx0ZWRfX45jLADVyUdFD
 fAzoVeIMwkJrg/ZsRPBBpb+cxzPHcnFHDb90Meq7f2cr97UH7HuOb6l6OpODo034wm9/wo19m32
 aI7pKkA5mSgFnqIXz/31usbDWcXv2tU+Ui7PUtSGh2i7dE4C88pYFGdj9shGw2MAWsoA06xe2a6
 rj/WXFLEdjOQqySIrxZekDXMvQKuixWp+Ri1sFzFB6FXjjjwonSC15iZhjS8QtrWmp9/n6ipNFM
 veDwoTg3f3KV+fJqOKaE0Z8/mLnLiC54QEqg//nuliXJgp6QaMnrkPhGSbJS6dzoiSVm+BqE5d5
 7n9vEhKw2vxFTABwQScPUj/zZhpEcqhQJ2NEcpSwC0dEGAYutEpo9Aax1g1TrlUx2Nj6Pavh/eV
 yqBTsjOdsgbO52TxsxlvCXggopOW3+W37RPpqbqDCydvJc55v+mQVuOsNo9+hLj6taBuU/byCNI
 UEtkprncU4KKA5gfZsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120226

On 26-09-11 22:10:41, Jishnu Prakash wrote:
> Add ADC channels for pa, quiet and msm thermistors along with
> their ADC thermal bridge nodes and thermal zones for PMIC
> thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
