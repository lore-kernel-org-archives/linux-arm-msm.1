Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792604554;
	b=VcNsP1sY2MVnOb0CWDaOYaKhqRCyZvQB+Ke45Rp6vj3He0RVy/yrhZy5GgQLQBuDZYBH
	 KLayP6Dc+R6nCZYYz0UdYGYdbuAIxqiuzwL5/kft+7uutk8kcfVTRFJXv7lfSipRVD5Yy
	 KPJpH1c4ENx3/7vSZyQq0gvx21OWGpTBs7fHs/YGTtcA8Q+XeT2TuW+CghsZXoYQMEIw5
	 fIWtdNVh0HR8/5phN2vKHPsxpvEdLqy2SsF2f+3M5SCzJUmHqhTzjb1uHINKUNSEGZ8tz
	 KuZKXbgbIZLvQyTdjoP8jsNPWUfkKI5cTLsMUVkAzypSCTPpRbakTno5fiKDJvMlFmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792604554;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KN+PgTF350Bf5Q08x7ilqI8W/r74ND/C/koqFQV5cX4=;
	b=BVeW1ST9unIPDPUgkE5LsE70fR6CKgzrFyVZORA6cK37MIknFkrsgN6C6mTmOGe1ew3s
	 DvA4b3ryjmjNSGZXPT0Fe5D4Tn6wrN9OOCdsw9iZI9Oix4i6GXRWm9nE/8M1BXUVGCDtF
	 GC3QMB6ibg5SCkQ1rSig/4tu5cSUsEYc9V5/r9r/ubGOrN02Mwl0vVyrCL6BZDxt9Cs91
	 W0D0UQL8+tdCnlwr+vAUrJpPCzj9HO6dEEdB60ACFCv2WSrEOzmazxuvKkjsp4JJUKKTc
	 jZ1ISV6j3tuziVX2KwMniX5/7tjDIowT6bWW5xO2i/ueZOzhvFWr4FrdaHDh7nhWh7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gR8dQDXv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCDYZvc6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473B7606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 17:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 473B7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gR8dQDXv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCDYZvc6
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LG4BhC2149265
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 17:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KN+PgTF350Bf5Q08x7ilqI8W
	/r74ND/C/koqFQV5cX4=; b=gR8dQDXvW6Egwe+DwHNnTIKewLTe2ebFyOreWuTt
	rCDnG26YKc65toONtrrne0r+HBq2kkeEabnxnxFE0XK6HN4HioijCvS3iK74SIhl
	YysrV+4UcoY0GeGUvWcLHU8rJiWj7ON9asLO1T67AJ2wLEcX8v+jj0mqZWRfT/UD
	NFNc9Cev2ZIdWZGb2xd6s/AYam2ZODJdKG1x6sjGCIOQkXIdJMwnCjSY3a64CIYJ
	sembuh7p7snPwPKouv4Lq2zLCEA+Bs99/NgTtFPqOGV2OJ7s/u55H9GuieKallEm
	BpO1rTlSqXkdvSDEVBLXAPRSzrIeky2INjhy+6d0755fPQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0ke0eyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 17:42:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f13c143c8so184762985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792604552; x=1793209352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KN+PgTF350Bf5Q08x7ilqI8W/r74ND/C/koqFQV5cX4=;
        b=OCDYZvc6lNe4IalN3A92rXJU17UpILv0iTOnPOeIWFz3tFv7J2vZBqlO4cp3ymMT7T
         hg4t610U8eWvUnAgBVhYOf9TH2RaZQU93uyG7Wk/bi8CBtc1zCmSDZFFsHx+snyH0YSL
         lKcdiQE6QMlDtnc1SpOFgbebaejz0LpKcvmOM87SA9OKAt3I6sMU08tUEeSwnbLnpng7
         uAPJTbvspGEgfQ+eC43zELtB0K5LoUCVR3JRonp2o87QjOxPqqi9fNT2Agr2ddbdaLHu
         23X60MBYnRrEzwkpd7kX+ZfandcAjfndXRggoY6uzlJxOHI+0c7GuJuvFLbRCuZe6dJp
         Bw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792604552; x=1793209352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KN+PgTF350Bf5Q08x7ilqI8W/r74ND/C/koqFQV5cX4=;
        b=H32uPTcWFtSubHYBAybBIXM16v4s/YW5iKgINfoq7whe7qvDyofYxFeDKGqV8Advli
         Jfu6e+1f4Ol8kdR88qSpKNZmpKZl8Xf8SAz9F4fsRSW3kKkUUpoA5Ozlr/r79xmFWLey
         G/cFAOOQAbxZ2tW8DORoQtT8lKAgXIZ6R6ZijONGuI9JYpWgHa5rUNRKPWgrtU+HcKv+
         Bj3QHyLuvgKX1BscOn1mXjToa3X2AN3yx6htCnrhxyc/7nssAPXBbtBpdeGAgjnZmWyG
         un069+wAp+Ob6Jx5c6qjw0tMXolMP/g60mK8xfF4vP4B6+x0Vo/SIG/9WJEl4LEuJs7Y
         kuKA==
X-Forwarded-Encrypted: i=1; AKwUvBzNYQuDR4TTeAdIeKmmPdnX+XTST4odemEEN9Kgs82YIOfsVCJomVz+hhsvPykDf7UbBc2BbjSlfoTUJtmX@vger.kernel.org
X-Gm-Message-State: AFq9FYL8xCXFbeHlcOhRO8kdBic6drRjbMxzOK0IoZlutvpmK9KxFVUj
	4ZZyyDQGcgJzxFz2sTFZJ3RPNdd2sSp7Gw5DdKk4dCwB9bLEjF9N5j4h7hgpqCSP8Uu8FVqt+Dt
	z+fpK4GafXPAcx8L0eHLzHNCYW58YZraeDl273HtItFIYmr/VdqH8wGIoHbeymrNuZjgJ
X-Gm-Gg: AYBFou2C7I/lrOqrqfYTCAWjWjBVu/2yeot0JEdugI1gVtU6xHMxVInvKOUaJg5BRG0
	henBQELi0yl+iE90arMyB5P8rRAXONPDfBT0Hs8n32fTP6E0G64ZqgccqcCIUhMOrwK4tgEVmlU
	6x1hM8EsiiImoDpia+cCZN9zez91tYGS9IHqtQ1ocT3X/KB5ezedjecmbnpulC6rx7uSdVWKzV+
	fhGawWjhjABLFp1mN3H8cK0bKs6Kr8W7AlatJLZnOzChAkdz8nhD9318FAIn1+jJc+c0hGVDfPJ
	BLwZn5Qb05mmYc/gLlKJSOFqh5m0ttOjXlOMaS2Svu3Pl7kAovqxYXUcQmH1A0kl0FXNU/eJ6BE
	2OjfSNR/8ZePkq1SnBMRma55dHznVcsvWG1NjkkVMsaNOD0H8SC5uAvYKTJfRwmXRUZf7Ez2ngF
	kIdTZmNkTywEOA
X-Received: by 2002:a05:620a:4493:b0:93e:d364:c9fc with SMTP id af79cd13be357-93f57e5e30emr518393685a.5.1792604552190;
        Wed, 21 Oct 2026 10:42:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4493:b0:93e:d364:c9fc with SMTP id af79cd13be357-93f57e5e30emr518389585a.5.1792604551742;
        Wed, 21 Oct 2026 10:42:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa4962a59sm231037e87.4.2026.10.21.10.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:42:28 -0700 (PDT)
Date: Wed, 21 Oct 2026 20:42:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Sajna <sajattack@postmarketos.org>
Subject: Re: [PATCH v2 2/3] drm/msm/a5xx: Hold a CPU latency request while
 the GPU is powered
Message-ID: <54itft4rw53zcxoyx5vhxz3zfenxgooorp6lo44vbsdayrq4yi@3f4btdyicop6>
References: <20261019-a5xx-gpu-pm-v2-0-457aafbb28da@gmail.com>
 <20261019-a5xx-gpu-pm-v2-2-457aafbb28da@gmail.com>
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
In-Reply-To: <20261019-a5xx-gpu-pm-v2-2-457aafbb28da@gmail.com>
X-Proofpoint-GUID: 0jx4WC70DdG_eas2ZdLJO0UIVkzhqOOl
X-Proofpoint-ORIG-GUID: 0jx4WC70DdG_eas2ZdLJO0UIVkzhqOOl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX2vVZNzky/vUj
 CKrd/zlgpf81lxyJDfn5ezi/iKIIl0TG7tn4Kgw0gCGwMXCJMHsgbGsETZ2f2i1iiIK7qcT4Ygy
 sG75LAjc1ru7cL2byN8zIBFTwyt7lBE=
X-Authority-Analysis: v=2.4 cv=KOzPn1Fo c=1 sm=1 tr=0 ts=6ad8f989 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=j5_2AGnEbwvZtjme2gsA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfXxRDPjK8iQ9UD
 Z3XcYBdcmhPAt4W1LCHaU5cTXyPOkrRhFES/MYT9LbFxuJRf5zAyELHh1KVFNckRKZsvwg8LObL
 roIn27cpv+28o7xsSNA7k9ITlz9BMlJ14GV4IEujaaufXaBu8H3Ld0E6UZ+t6gDqF0RiA5kWMzi
 poKS8T/Ri3kAnVb5sWlHQWy27uvIDrmJ4MmWiucrkEEXSa70nCkyx4hXGdeCgnCEzZ5+Kzltal8
 YDsDwD2R/hyA8HAnSQPsiggm6eesdR2IqUv4lsx5aHajEnsh4DXvjsWVWShRV0DxyZO1yvmXtWP
 oVpZVqRYq3MkXpTOvviHmmhWiBXEG6kdy8qR0pRxCkYmpOnnnI0p2BNLBshyMCG+7H/fmdqRmrO
 nVxpdkNlASLGSmw8UI4bEWA4djjavQsrxvfgVOZYAyLEWkRguHwt+aRgsdAdQnvnXHEazXleidX
 W5TnJdVjRGFN0kFo6GA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210070

On Mon, Oct 19, 2026 at 11:05:09PM -0300, Fabricio Akio wrote:
> On SDM630 the GPU was observed to stop executing while the SoC is in
> system-level power collapse, and to continue once the SoC wakes. Its
> interrupts have no wakeup route through the MPM, so it cannot wake the
> SoC itself. A submission overlapping such a state would stall until a
> CPU wakes, and a stall longer than the hang detector's threshold makes
> the driver recover the GPU, which can lose a frame.

Do you have any extra patches that you are running with? I don't think
that currently Linux can hit system power collapse with the GPU still
running.

On SDM630 the GPU is running from the CX, but we don't vote on it (yet).
With the CPUs awake we keep a vote on CX. With the cores going to the
deep sleep, the CX might drop below the required leven, causing GPU to
die.

> Qualcomm's downstream driver holds a CPU latency request while the GPU
> is active, qcom,pm-qos-active-latency, which keeps the CPU idle
> governors out of cluster and system-level power collapse. Do the same:

Could you please check what actually stops in your setup (CX corner, the
BIMC vote, XO)? I think the proper fix is for the GPU to vote its real
rail, scaled per OPP, in both RPM sets, rather than keeping the CPUs out
of their idle states. I'll have it as a part of the CPR series, but it
needs a bit more of the cleanup and polishing.

> take the request when the GPU resumes and drop it when it suspends, so
> those states remain available once the GPU has gone idle, and on
> destroy, which unbind reaches even when suspending the GPU failed. The
> limit is a per-GPU catalog value, downstream's for each SoC: 424 us
> for the A508 in SDM630, and 518 us for the A509 in SDM636 and the A512
> in SDM660.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>

-- 
With best wishes
Dmitry
