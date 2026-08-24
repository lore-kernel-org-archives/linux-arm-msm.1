Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604313EFFD1
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562262; cv=none; b=RkJAlP6oRNaRXBU8ghD8ej0ML3Dp0Yz1Og9pYJkaztCxzz/P72xrw8B9XyEFq9vHPhG6mibkatN8j85QGbTUZ4Hw64p1/8xxvLD18CeS3gAFTwNNLpTcI7wkt5vZq9hR8HDB+XB55b4JKtJOH+lmw0/RIoW/FD8yiA52NgCaLek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562262; c=relaxed/simple;
	bh=7GtKT0ZmVger2XBJrLywvuYtDWmOa4M9hkNkuOLg7fA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQy07OomWns5AZ3N8ZF9rYEgkVDiLeTGD/WAxKAE5Wy6wjy0RI2+VM3T7v8IZDJO5tP02PeKSNuwTkBZ/agysJvNXtZi3uItDFNxn1vzTSN6OAjC+o66Uc++pTSHgBnfvGb0QZ9az/0FxaFIgfG9/DbUx+k/wVFKqNyu+ON0wLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUYn09hO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f9nK/rwx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUYn09hO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f9nK/rwx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RIha1008560
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I5iXFVs0UWlY/4RpvmnF6UxK
	I60QKsGEgwBkwUkWY2o=; b=jUYn09hOOHBPOcKUjjfNmtyHoA2FSeKtA9qF5dd6
	Cfjzz1hi355PwFBlnxaFLT041s03xZ6dd3S1CbU7mdqNY+SdbGftwpEGE8XfmA9z
	CPwXWX77lifIJCMRTI9uAhVtJ3D2mYwxcFZGcFXnzSHIAc6xpHDyql2smqdjIj1B
	yYL8KRtEDV49gtvnY81BuxByir7QsSc6UrhVPX2en7wQjPtGDz5s8vGrrJ74AkVH
	s3cRdsHd1Ss8FXGeV8XO0eeJo95yL7JMTVr/8sgjDbp72mc5x5M2Rt0v59gxvoz2
	JjONkRYxdomnAU/7kaRv0OeUVhxCvH8VD1MCFBpKhg+CdA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74xhe51w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:04:20 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-744e80385dbso914070137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 02:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562259; x=1788167059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I5iXFVs0UWlY/4RpvmnF6UxKI60QKsGEgwBkwUkWY2o=;
        b=f9nK/rwxb1YkgWNTv6w2umUYKdT3TYeHnFvfSvR8QjTav4O52OT26sHyrXZKYF//67
         eiO3fFCX+FJPcbvuDNFFxqJM/zLZHBhoA2wZecUzVFInIIGW7H8+va6ENbipTonADp/N
         i98FyjGjK/drM/q1n0dIOBBSZDMgTSMq5qTZn8AnybrQ4v53brcYDl0TTfmvWW8D6ik2
         +2uZGlORo1GadVK2S131KTynVV3rXTXLFt43Zbl/Lt5PjWg8MlpTkX/d3XapZN3rcpBj
         rQVJtDfKxSPwJNa+iiixMP+TZRlVGO+ZpwolcBijSOEIJZYyM3LpAz9qYttqsqIMh1xK
         z45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562259; x=1788167059;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I5iXFVs0UWlY/4RpvmnF6UxKI60QKsGEgwBkwUkWY2o=;
        b=Qlkgy0J7t/HBBnye2+CFCHz4qQDDCynSlqcd5Zk5we3gqKv185g7+zkXET+J9vpRdI
         pUSOeHekDcbuxohvyiJaOiT6f+f/ek4WSYp8bAzQ3XCwak5vRQcdSIdhk+NO2c5MxDKh
         +Mp23ezDiNeuL+4jU7y+0R73qEtnLlGF8dfzrdMQeq9MxYuHdeb6MBXyGb0SXJIy4JpI
         NgjqpKEbSpI2spTNxuLftoCHp3xM+1a1VtiNREc+XfNesvr+zzzLcIG3kWKZ8Ut5uI4L
         +JF8BxGRbW6vSH4qMBkS0NmZB2YGrz+x+6Sehy+cEPu4hZg+sgZnFA6jpDN+hd2qqDef
         Zv7Q==
X-Forwarded-Encrypted: i=1; AHgh+RpAfdsH42P7VImCCXjhf22UxchRe89aWnP+vlA8DHP5/GEsjEoaFc2E9ZWXGltNrWG601Y47ouBNtMDEexo@vger.kernel.org
X-Gm-Message-State: AFuF++kpP+oGtbX2ZKLkzDmnkCdhz7BPjmBIpKTSjrMeIfYYC9OsQ02V
	1OONqfb3V9ILoT5cmfqOAZayUXtBvzQ9dOpMoFGliK4wYvqtjrrAcA8/Db+m3A6EPDhkQ6ZZ67i
	Dglh2jwRan5IceGBYPdzmm49kvhpGXELMVOCINQE9RUrdiEcOWNox5l7asAA30QmH+pXB
X-Gm-Gg: AR+sD12fIJYsfSJdKNfF0m5TBWzlvylmkZw9eKigeTk6yqXE+qzyF1UYGPr1sGlSEM8
	p5CYTgcw8j/OOFcGwEA61fpPHAJl0nqN5F55r6Gj/afI8rCofL4TtGt+tZUmO8qkp+a4xCH7cW5
	Jjos2nGW4Pl6Gu3gExQFIliSz6rY1JCAtki3RydDkTA4YVChowk5fNNVuGwRn4GmOkT/SdG2N7e
	uKove1JKLyrIR2d4i1p6KLTI7tUsy5i6JVuCNDimomgwr7dBvUa+hv4Om8bvruPDoALVrMzOpqz
	nwuiPgm790KGFctf8+wP+L593fckMzv8iDCyR6up+3ICX3UHXiQIyEA9ggCRdf7H69AXZYkU07E
	LvNG9UchyYhzeHgM=
X-Received: by 2002:a05:6102:8092:b0:77f:2f7a:f07e with SMTP id ada2fe7eead31-77f2f7b3870mr439462137.9.1787562259416;
        Mon, 24 Aug 2026 02:04:19 -0700 (PDT)
X-Received: by 2002:a05:6102:8092:b0:77f:2f7a:f07e with SMTP id ada2fe7eead31-77f2f7b3870mr439431137.9.1787562258866;
        Mon, 24 Aug 2026 02:04:18 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e02a8fbsm10850642a12.13.2026.08.24.02.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 02:04:17 -0700 (PDT)
Date: Mon, 24 Aug 2026 12:04:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
Message-ID: <qy4dstdfwguaalr6ildd5esrskx6yxi2zga2my7m32dtx4icne@n6moblldqii5>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <9a3b9b76-abb0-47a5-ada6-cd0a576b0782@oss.qualcomm.com>
 <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SiosuLmL9vjpQvEdp5eicYDLh_ZKXTUU
X-Authority-Analysis: v=2.4 cv=GdQnWwXL c=1 sm=1 tr=0 ts=6a8c0914 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vkuWnLlI3icQtIAv_MEA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfXxdNjLndz9ARU
 1KTzww/Y+sVviypAtNE7z/vQQ6zmqRMEjTWTN+b8Gby9kcnAkV2L+C2C721uzz8h/n8ncA8LB3U
 3JUjzmoQOfv1rH10sSKkiHaZofmMNk1MeP0DNsBVR0TiVUgO5mE/A8cokOgxw5mxLP3V5k+x46X
 YlPpEBs3kZ2Pmh8/X3XLq3KtYwSNOHngh1xX/2iIodj9/FB/lkfHhgCHjahWRJtUV7nGyCZEFfR
 jw3/ZYw67CtQAQtRwbzrSq/6pLSHdMjZ0EKqaQqYfr0ONJiCqF5dHixZwE33fG6nFwZlnobhz/Q
 ehY0nG9Ijhk6gGkZbw3rqrGUoCPI6X14pbyUH9jdc+Np+P1WqGsxkqdVjy4RolSBB4THp/NKbtN
 UuPu2YZ4856xUIesBjeBaM4wRhRXpNDQPb1f8NKyHk2Cb7qudED0Mo3hG4mH5ZPF1+fP6Wrv7jO
 eqRY3NoF8FPZNRoOEsQ==
X-Proofpoint-GUID: SiosuLmL9vjpQvEdp5eicYDLh_ZKXTUU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfXxo7RsfSrOCAw
 4mtWFVmaEliI/ZeqZYSU8YH1Oy/AVtel8obv45AhDlzA64EU4di6MPvDk0+vtKtNk9gvOmNabvg
 czj3kjHGmCVwXgi7yOJd51o4CdDMU4E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240079

On 26-08-17 12:10:06, Konrad Dybcio wrote:
> On 8/14/26 8:30 AM, Pankaj Patil wrote:
> > On 7/15/2026 6:59 PM, Abel Vesa wrote:
> >> The suggestion of having the CX power domain tied up to the GCC
> >> controller started here:
> >>
> >> https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
> >>
> >> and then, for Glymur, it has been brought up here as well:
> >>
> >> https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/
> >>
> >> These plus a discussion off-list led to this patchset being done.
> >>
> > 
> > This series prevents cx collapse during suspend on recent linux-next tag: next-20260806
> > Reproducible on latest tag next-20260813 as well
> 
> Yes and the ""fix"" is to disable the GPU nodes because the custom
> runtime pm dance done in the gxclkctl driver keeps a vote online

I can confirm that disable GPU related nodes does allow CX to collapse.

Had a conversation with Taniya last week (off-list) about this.

I think there was a recent fix from Akhil that was supposed to fix the
GMU recovery, which will allow us to drop the pm_runtime_disable() from
gxclkctl.

Taniya ? Akhil ?
