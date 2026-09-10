Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28163603E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030258; cv=none; b=F1wBEeXC4KDKF+rT9XILkplq4sN/3eo2r4kkyEs4pJ1UD0atzWpLO9wOEDYhskAXo2lZnX06zUVbYa49uJjN989coSZEe7fyZDi/v5fOdvGVX4Y23MqAG/CdSQuIvCkU2B/KTBb27Me5D7Jiq3rBXNAhZnlXGNzFwEgMfHoOaVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030258; c=relaxed/simple;
	bh=Z7ELx0xxpT8iAxlgwr0qNRiApowBB2/et1oBr4QiLBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJzo8pmMv6tWmv8gQbFtQMRYDyHjrTKK5gxWN5/OzdLgbIHF45WMutMrJL9KjbqcjZw8mCwxznFNg50bLd62KaZQ2Q1ZSWZc22lv4udMOreRXVlv8G1Wgmh6P6WkpbSBHp/FlTKTGNDl/spTZtpHqv9J/0bvIx8IfLD8kmVs4G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VM8ajfHf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GqNctLaC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VM8ajfHf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GqNctLaC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A7fI2h642179
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YRdmCeGYdKolSM2/nA+SELTr
	KQJjw5qoJh5MBPg7W/A=; b=VM8ajfHfL5l18upf4TQXxZk9S9vC7wDi/ZzjRUHq
	V29wXTJeud59Q0AFU2ezSIWhFDXe1FsGxquyrQ5PMT5+fhyjAt2wRPdbYJ6rFeRT
	GTto1LbyT7uEFFJAF5dBBoPW3RCmEASnLGIxOdsZOkGc+HGParF9cPK07hgkZLhh
	ivIPN/IW9Y1F/fk26P3D/T6Yr7ERNkURvj3309DbPqTkwEqYbtvox7G1bqjvv0aS
	4OTP4XK2XesVgvSHx4VjwrISc8dt8eo/rR5WN61mfIBJxmpcvXGLnH5fqGgu8Cl4
	S4i8iu6KmHNlxX4Tx0WgIUOUdTj71mswaPVVhyiVuZ6Ujw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrcjr8fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:50:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b6416441eso8728377a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 01:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789030252; x=1789635052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YRdmCeGYdKolSM2/nA+SELTrKQJjw5qoJh5MBPg7W/A=;
        b=GqNctLaCLS/g5AJp+djkdJWhj7w98OFSUejK3qWLa6vRBvPT3VeDNCLrLl1meMCG6l
         Q2m7WfzLAuhiwtiJ3Rk/CsuM0HSMUxzjEWgHF8JOxzNnn+oOHVgOpvEAGc0qYLm6NzFm
         jwLyo4+DOBRWOnOriEUND28sTtmxY3bDhlyQDLepK8jqHua2LsnZzJNxhIIhuYJf6voi
         2xQ4WD48ZuWg2eMMk4L1pjQ2DKmwqvlRyRtPHrAzb2LxKHgL8nqYh7ilMHGsduYsPDaj
         Cl1pc+XRCJTQT8YxF+B0jVx5xy+SRRb/ZAT3fx/ENDflVt/oMZSa/dxgOY0OWxygtXsX
         TtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030252; x=1789635052;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRdmCeGYdKolSM2/nA+SELTrKQJjw5qoJh5MBPg7W/A=;
        b=rtaVTtLzrg/5uM6xVWAP1Di8P+GHszWniDhaJL9swHHLJu2GA49Iqvu7XLRV3P5Tzn
         l2+YiYikMKM8F/1UY2ALIQ8A+55zXaL6bfSOyCxAQMVS+CVZ6ZYARpCzcPe1J6E242S/
         IcaXzV6kNsfvOBtz9DDgsroY9lUoMT3w4cPkaEqL8eAFgMUawrCmC6+6UqZJRP596+Il
         my/0Z5iE9j9dYOrTBK4itrTpaj1r+xnbJKX8N4OYiCGW8rcgl8GADmC/MW2bSFMZYqoc
         5hnItmLwjnVZAFRhohuELtUS5sSwV0HW+FJlX3AaDaQCASdi4X77OX0ldG/DxS+LsQEA
         QuEA==
X-Forwarded-Encrypted: i=1; AKwUvByleIn/ZArbcd35cqit3VZZqKZcflP7QGb9zyjZ+AWw5mcNPiFcpE1gqqy2hPWFyuzjJvoJGmFv/iVGxpEd@vger.kernel.org
X-Gm-Message-State: AFuF++mq0yYwCk9LnAhUz0o50Qwzn2fHMTHl1uofx8VqkDk8bVaSn4vK
	o8HJnV4SShFKNFYZZARyWnnED8AePhh60853NHWvghmAsFGmXPC0xrvejbOz/lBz7cO+9ONoW56
	mGgGATCY1zCNUhMdbfCIPRounYH1RLhiV60Pu1CbGn8PvkLWYZWDMHgStVTVOgsNObKoC
X-Gm-Gg: AYBFou35V/sz87JyszL3potl10TJY19+FAz3QCyT91Zb25XgaO8w+X2SVAmPsfhEa6W
	Y1gu3qopE+yO/W2LYw15vRrt9a/EPlzI52RiBXGBif7T7DycYjH+G1DqM1f90SvxLMFd5WB8k1k
	VWGxAaUrkYrTUXQZD32LoKkSNNwukUcJWgLbHlBZEWfbp/1FKAGMZ4XP1TY81pIrv/f1YeK3UQ3
	xwnATyIFm8+J4vazVtPO2jnL34pBy9TcToB0M0IiB4arrrisNO3mlfMP4RWGfbQNXLWmt1Q6YT2
	vto3g4uWgUSTSYFmIP2ESCdtywvAeFWKe+mCj/ULSljezPKIpuew41jURtukbYTg3n/IfmsDk2E
	/2dBOKoyEbKj+hrvrJgksF6RS65U=
X-Received: by 2002:a17:90b:5292:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39d70b7d864mr8751288a91.24.1789030252477;
        Thu, 10 Sep 2026 01:50:52 -0700 (PDT)
X-Received: by 2002:a17:90b:5292:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39d70b7d864mr8751196a91.24.1789030251843;
        Thu, 10 Sep 2026 01:50:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3397d6d1becsm12817627eec.22.2026.09.10.01.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:50:51 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:20:45 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] interconnect: qcom: Some defconfig/defaults
 cleanups and improvements
Message-ID: <20260910085045.eargbxuwmeyhlhrw@hu-mojha-hyd.qualcomm.com>
References: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
 <20260814073334.7orbdongswfxgc42@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814073334.7orbdongswfxgc42@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5OCBTYWx0ZWRfX6JGa/e48f6Jd
 G5nibrnscXJwH88zkKn5LwiRL9ab+N++lcZEc8h7Won7el7nuAPKjoPQEdy50HvWURDr+YjzUb0
 3kkXzVJ+1DoA15DjwhLmheTHhKh9BIM=
X-Proofpoint-GUID: -mAMY3TBUmmpToaxVF4hWbMyeVAR4qsU
X-Authority-Analysis: v=2.4 cv=aef0Dhot c=1 sm=1 tr=0 ts=6aa26f6d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=OV78iIIr6_8e9roN0uYA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5OCBTYWx0ZWRfX7H/XagItXlHH
 OApMzIoGiRxZp6SlLGACWs9WOhevyIWq8vkDbwsklwqE0ASvzK8EAlLX07KgKTIfwlK81xeu60A
 Q3KybbFFxyv70hW8Xnb+e9c74VlPk7fJG/rH7Y34cFMMCTm5sXYLRB2GdPTNtMz9ywC8LiaSHwt
 ahCyP6Ka3j81eqFO2xLOeJEGIKuUcYyw/dvHfuiBr+DmyH8jQrlz0N1nfzs0rOGkdaBr7W1oOOE
 UTYjXTe2ciVC/xIAP3scDx52XvSTwWEJeFVU6+lIx+Sn18JICMi6/SNJ7AW/4pWOquPYEetka/M
 r4vVOP7wunUqv9i8MDOI/VkFCWZbOHriRkl6bhFWFLon2/2gKrxeJrklGU6sEcOKeFbtkrt4iQ9
 gefE59HAGvGDy9E0oznMrI851g091jh6HnnfmoNlZh7+BaJJ6GT8/azd1bdkhKkHhB6NoYiS0ml
 aPq6N8fBArF7NfuhVhQ==
X-Proofpoint-ORIG-GUID: -mAMY3TBUmmpToaxVF4hWbMyeVAR4qsU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100098

On Fri, Aug 14, 2026 at 01:03:34PM +0530, Mukesh Ojha wrote:
> On Mon, Jul 20, 2026 at 09:03:26PM +0200, Krzysztof Kozlowski wrote:
> > Merging:
> > 1. First two patches via interconnect tree.
> > 2. Defconfig a release later via qcom soc tree (dependency to avoid
> >    surprises).
> > 
> > Changes in v3:
> > - Update also Nord and Hawi
> > - Split defconfig to separate patch #3.
> > - Add new patch #2 for arm64 dependency for Hawi, Nord, Shikra and Maili.
> > - Link to v2: https://patch.msgid.link/20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Patch #3: Switch to built-in for everything, with explanation in
> >   commit msg.
> > - Tags
> > - Link to v1: https://patch.msgid.link/20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com
> > 
> > Similarly to clocks and pinctrl, interconnects should not be a user
> > visible choice.
> 
> 
> Looks like this got missed in this merge.
> 
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

All this while, I was replying on v2, this does not apply on
next.

-- 
-Mukesh Ojha
