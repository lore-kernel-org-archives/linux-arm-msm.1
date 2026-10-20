Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500119;
	b=k+rqrkAL22Lb10QTC7R72/g/fYJ7+IG3G/10L42tTU2Gt5/s1AE2a4jDYhY2cn4WL3F5
	 QgSs7yzhnTa+TTtF62RBy0f1qF7X/Pb6A1i3wm8Pds/wIG5WzNx/SX+9r9KMO/S6dtg0N
	 CHCmoWwBY1y5cVqxSqJeBryCiHfQyu4rHEec03M6Zar09vs/VDMJgwXlvSRV1QXBXYeor
	 3o/9Hr2trU6/Jb7lIJ1J49+ouHZWRH/YUsnr71GontJMlu8ERX7GlKuxzB1cCI8Dg8di3
	 bbo7dIUw+cqt9PqwxxKX9Zb08CCk1gb96uJmvMY2OLbqs7v2OZaHCV4bW4Yhsx1dMiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YVgAwVbGT77dwzosKyXh3279DX5DYFH/EToqrcKE5QE=;
	b=V22EG8K4iP8g3uKQuRth+JmwcbQaJ/APTnqZv7FQvvLR3LMb5WfbSHf7VHnVyhaz5eBX
	 KdCGWI5mxu5LIk8Ejk9ZpyAJVbBVgKvR2lIm1P8yaHX39/cZshZp6mqJak8FgHuEWYZNa
	 V6xA2XwRrDFbndAKu6nGzrwwWpGd6qPTIWiNZM4zpF+bMvyezfFHik7efxdGxUdN49YOa
	 uCQvZjym++f8/O5fc7/eh2HtLPbKWSvCCq/3J7TuZ4jIdWmlyvCk0L9MrHXgHAQMlGcAi
	 nYx/GE6XK8NxvOQRbh6riym/ceqGbnImclwvqx0N8oYSmYkVjAQ1BfAvyNMZ/4ukz6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dmMPfEsx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NXpNaWBy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1187606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1187606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dmMPfEsx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NXpNaWBy
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBWWhC1571795
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YVgAwVbGT77dwzosKyXh3279DX5DYFH/EToqrcKE5QE=; b=dmMPfEsxr3Yvy9mp
	lfVOSRCaeoTcvPMCdqQbJNOz6g6NgYX97nh+G/FKaK7cQHYTrxMdU23wImycdA76
	3BiGTVYNxcZUVS/E4fUiYC8qVD45jf005NqkRn+jbb6dS71+6QPWvqSMouyaVmXo
	hxQ1xRELTI2TDYmuhwUPUPKIzsj+b/DilaNEduoAMfiwC8/i+10Y4oZAtkJRBS6K
	D4k3zRPU9I0q9aifNPTi7DPaZgM9jQmxHCKgeMtdCXsg/dgURLSNDgUQ5/GdU5Xh
	iEhv/mVEloKfvTjhKWbTuwkwIqjxiO22fkhX06D17EVXVv9dm/ezi3lSvbq7sXAo
	nDJeJQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2874k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:41:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2005ce21so558067085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500117; x=1793104917; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVgAwVbGT77dwzosKyXh3279DX5DYFH/EToqrcKE5QE=;
        b=NXpNaWByqK4GCgMHrFUI5saJSihBBt3qUPZjXUi01qGQXJLE2zS5RoqFu3zzQcMnuE
         7PxQJVPsShln9ZW4eOGzdQXSXB29/Ugi7TkAll9TALmOLDRjGFfibLycnEBG37AecT1L
         u5zSuShpcpQsGIX34FEy3lH6MGfHiaZq5BZjHn2a9O3uyF/Ntw2cs3TsryMHr4KZbC92
         zByVjrvuxGrE4A711QIBhs7IaIqsUFlXHfqMm4RU8ZP1N5tWAYdYD+G4UKxRWxkA+L/9
         SdztBuz/OYS5JSgqxz3JWSxvJKEjdbAZZr6iiKdcl68hYwHcA3qayzunprHb4V5UzwgM
         o9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500117; x=1793104917;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YVgAwVbGT77dwzosKyXh3279DX5DYFH/EToqrcKE5QE=;
        b=OMTC55wsxyx25bExMSEw2p6i2Ju6Rarm0e+PAj1fi0qM8b2iqAlI6XOfVAaAFl79jp
         AGPVaevLa4T/h3OJqb55VRK/imQQRIlrzU0HBKFkch8/kcP6pCSe3kFKhBRLkgmfzYEy
         gSNFuutrVhU1dmMUvRO+RLkC6qGQKk+ZJLNnPgrOSCR58UrkC1Liy+WZR4pmp4aab56k
         sn1org59o2kn8vQuDKUdeDKaDN8ykFqQ74ivgIyFIs7HLAECFsH1tmlha1bMPieACT14
         wpS5215HsYacZjEBJ8PZY1DidZM0VHth5vqA26kmKLd8c+Fl6TAC0QlqnpbQd+lv0nQ8
         vtKw==
X-Forwarded-Encrypted: i=1; AKwUvBw69yaDC+jDAWR2YPIjTLqkePmJj49zK4mpyc/NTp08wq1b0AoISFERdrFhjV8Z5nvVfz98ZQ/ztSpD0+dT@vger.kernel.org
X-Gm-Message-State: AFq9FYK57qqJeKDLjAWzQ5883XBg1zS1xtqeGYe3GcI9510FzaCjyK3K
	s3hpooymDNcGVMOmSavI31ZGx7NBfhfvLtQPNqgWm15L0rlJ15G6SmORSDkIANf6pXlmrQIo0dX
	SK5JMY8FCpYglMJP5aQw87RT4c8UWZ06vA0L+ou5oiskGlIoTLE772fE37ixLr7RJzGCd
X-Gm-Gg: AYBFou0GgpVkdNz4/YNZRk//4bu7a5Nk0n5ae4FcXg/3u9gqIC+pdY4sRYHtRheXyux
	Gm9YexZnKgXuOFd8bidizGWMZmVyVxNk5IQOKtaR0m8AUKlpW0e8i6MiASpS1Be1rPAWc9pNNcG
	Hn47Zj9hvtzL8ydcOvBcXwh7yRUcyKWCoCDJ+dBhDXEpLTSVFyVmZyD6vfe5EU2fVrT9YhDBU8D
	RgsKSxZbplI3m0EfGbcP87lSBeb50jlNd26AD0M1nhPv3ut18mY/BKvmWfpYhroHoB/j5clyVa2
	cixIonFXqCj+O34XWLmmywC9Fux9NojncHsG1G9+8q7MzukX3/Z3mI7p2+uC3IoSrEeQXhAKpZQ
	rmvYdP9HKqsRwR/N+
X-Received: by 2002:a05:620a:1b82:b0:93c:b10:7243 with SMTP id af79cd13be357-93f29b80a1dmr1660120485a.5.1792500116918;
        Tue, 20 Oct 2026 05:41:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1b82:b0:93c:b10:7243 with SMTP id af79cd13be357-93f29b80a1dmr1660113385a.5.1792500116235;
        Tue, 20 Oct 2026 05:41:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cd482bsm69803725e9.12.2026.10.20.05.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:41:55 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:41:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Use retention for PCIe power
 domains
Message-ID: <hmslxyt7kj3w2lyniw5sup2dcjfvsndckwhrrrk2v5ofpry6zz@nrjflylnt77j>
References: <20261011-eliza-pcie-gdsc-retention-v1-1-9349dba7e0b6@oss.qualcomm.com>
 <273f7f8c-e24d-4322-a418-4fd5ed84b0bd@oss.qualcomm.com>
 <e255ml7kf2pyjnw4k3ssi3jp4hkovw7x62cln6n3xbf7tz5q7y@ijqwv75233a6>
 <CAFEp6-3YP29y5JYp+6Cw3T7bGEJHjfGD9mYsiQXGaTSegsMWXQ@mail.gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-3YP29y5JYp+6Cw3T7bGEJHjfGD9mYsiQXGaTSegsMWXQ@mail.gmail.com>
X-Proofpoint-GUID: phUhRzvXxyiUzKu6kaiyvCQDez3SDu33
X-Proofpoint-ORIG-GUID: phUhRzvXxyiUzKu6kaiyvCQDez3SDu33
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad76196 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Wx7Y5S4uw_J0ShrtzzkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX07jVahPBPTTl
 LasMXHZGiCdk2YwAujxCf3UYThcvIUco0U5U1vKWBcfEmb9TAv1+vJgSRSoSnLPppZvd5dRl+/m
 LIEH5RcpMgRZJ5wToiVwRrXGefd6O+I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX6nEysXqy8XAy
 RcLSBy4e12LS270IU6y8bwt+tAPEP8bWwMY6/lJLKXiybpWbtOG55RT5zcMRI23HNyMpZA0OsZ2
 s0TCdymvdXEPjU2I4gVlEFo2fnxOAzP+wY2e3x6L3SLw1Kb8FR/ImkGp5xAEZE7cqoGCpl8PsoI
 OuplGnVQ2er1VX3XS9QVxY8n7THnmGpNO94vq7biQlMKtHthmLt8eUB4n1GBGUh6gRyBcF/mA5M
 wRcJygXX+2tRgLhwG0ewPqkvp/Oe/inaiGjD36Ks4uYJe5RjJEEePuuWwwAiQXV/V2HMgJMzz/8
 1n36N8SYw6vuHAXYdFQC6Te8hUCnVRYa8ciNplBNmHY9+StiaOsv0w+I+ekjqlRas5RVykcCl7P
 2AAQ8YJe8VCwRxi3cE1AhBRtDhEguRXDZxyBkPnK7oytWe4iKx7t3qAuL5wN89Gp1Mx5fqDpccf
 sIvp5BicvO4WLEKShdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200050

On 26-10-14 14:09:04, Loic Poulain wrote:
> On Wed, Oct 14, 2026 at 1:59 PM Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >
> > On 26-10-12 14:58:43, Jagadeesh Kona wrote:
> > >
> > >
> > > On 10/12/2026 1:29 AM, Abel Vesa wrote:
> > > > When resuming from system suspend on Eliza CQS EVK, gcc_pcie_0_gdsc
> > > > gets stuck off when powering back on, preventing the system from resuming.
> > > >
> > > > Use retention for all four PCIe GDSCs, as on SM8550, to preserve their
> > > > state across suspend and allow the system to resume.
> > > >
> > > > Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
> > > > Assisted-by: LLM
> > > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > ---
> > > >  drivers/clk/qcom/gcc-eliza.c | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > >
> > >
> > >
> > > Hi Abel,
> > >
> > > Using PWRSTS_RET_ON keeps the GDSC forever ON after first enable and the GDSC never
> > > collapses.
> > >
> > > For similar issue on Lemans (pcie_0_gdsc gets stuck off when powering back on), picking
> > > the below changes from PCIE side helped to power ON the GDSC properly without any issue.
> > >
> > > https://lore.kernel.org/all/20260728-hotplug_pci-v1-1-d1f38cfb9122@oss.qualcomm.com/
> > > https://lore.kernel.org/all/20260729071514.859778-1-manivannan.sadhasivam@oss.qualcomm.com/
> > >
> > > Can you please try if above changes are helping on Eliza also?
> >
> > Thanks for the hint. Mani's patch (v2) is already upstream, so just enabling
> > CONFIG_HOTPLUG_PCI_PCIE did the trick.
> >
> > Suspend/resume works fine now on Eliza, so this patch can be ignored then.
> 
> So should the retention configuration above be conditional on
> CONFIG_HOTPLUG_PCI_PCIE, or should we simply depend on
> CONFIG_HOTPLUG_PCI_PCIE?

None. I think QCOM_PCIE should select it.
