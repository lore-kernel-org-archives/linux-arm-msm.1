Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36E2321420
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565745; cv=none; b=ukSASegauflz9ebWeWRHXvUoPzXEgoXNuYdhs3ibGo+nhg+UY0TLQArFOTcu1Kf5IdzzNwhXfm0TBepj0XgDpgxOaOH2PGPuLCZjPifPnSJPkVLvm39+AdtCuuIRPS8BcH6za0oOG2V/VI4g5QH7SR5kAgeUXa3h8DHwLo4WSAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565745; c=relaxed/simple;
	bh=6DfugGeQZU3WMliokpCdHjNrEpJWYiLdOWDMXeeHba8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ilywzh38qEuIhf9RinPAE3lEdD5eT9PAcziwknfGuPZXlnlRms4LGd4MOWKaY7WFltomjlHkQYqpmNTxSO/VLWYmFGx8UGIrW9KzIiYY4h+gBwF/nHi7QA1fW1WjW/8yga+i4q8LiL0f2hv7RZT6c870nqvY6FBjT45QUcFGvnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5PO77Dq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HKbukNyr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5PO77Dq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HKbukNyr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S1AuJ73455542
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tk2HxwKJ8qMHnyeP0NsV/+zb
	Od6grNaGyCvG1rUeuJY=; b=P5PO77DqhDHYDlg6CoHcL2jNPHYq2zP1tNANNFaH
	cUpqqD/2vAxhfPEYPfSpvqDMNc2+RVVxQvb68q5XlkJbq9+nKo5m46qAMn/edNuJ
	/yc2gZM+tX4i3as6Bh03L0kqNZHgABzjY15F0/r7cov7KbQGGYAgWhcFvizWyQio
	hypYtS2aZxafqsoRBK/7WaRpX3NBEOlrTX0wz+1KeefTJRFUrRN1bCuMxdBdrIuq
	Bk5FFVWFP7zlFtcASjCClMBtkrtEHwID/F04UyCpmgXO3JBXQCW/PRlfP59hT1Q2
	RW2k9TZ5a92l0lUSHnJsZPkd5FERlABY75zDarTuNrg5wA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq09fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:22:23 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14a62326b51so13133c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 20:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790565742; x=1791170542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tk2HxwKJ8qMHnyeP0NsV/+zbOd6grNaGyCvG1rUeuJY=;
        b=HKbukNyr7nUGjidpV/dwk5DVJy3XLrDaYRNvHyfjz4AwCr0dfc/FhyhJ3QXQdv87Pi
         26HgFxnOtzbDlDGUBdaapSZKb3BXDULOqLq8953m4KFuQ/SE3L3sWxP7mR9HHbey76XT
         G32VHc8il0RPb/ygprqiigMGkurfVgLG5vYUs+UBCcdjNOICNtw/OTxDy0hUO+wjRX+A
         1zlBkOp8Wa2/sKEBCTeM47LY+J9cE4oTiKCd6rbh1XpG3tgNI5Qw8Oqr+2Ov56Wxxaqe
         IqKNjmwNknS99xjbOWHvwAdf8mzdUrkapWbpinzzT1Nxpl/6LySUpSb31Md4cjPHJ/ak
         Omyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790565742; x=1791170542;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tk2HxwKJ8qMHnyeP0NsV/+zbOd6grNaGyCvG1rUeuJY=;
        b=RSdwLdhYhdT2Fx+d/OhZmx5IKOUrPxHho9pXMcSPmCYjTYQ730oytDmeZfxRqlIYXQ
         4kw0EOyf9gEYWMMowpxKOZbi7tYy2R7CbAn31nB4787rSeVTF2wDMf5gIwei7kJhz9AN
         G/SjAlCiMq7wV9EN/Ot8jKUz9OXzQBSgXGwbTBIv2rBEARRmYgjowGTU8GvZpd6nK8y6
         UhscPCJFTIkubOtkB3RzexpEvZnOzAZsBkw705lcOp9FtR++b+uTnUBdpP9FkVbFFSjn
         V3E3a0A6cWHlRCTiTcVr5F03d1EZrzYuxmaJ223E48wfnaCRj6KOC2AEQWGisKnQCA5w
         U4dw==
X-Forwarded-Encrypted: i=1; AKwUvBzViP9wtYlQuSqnzh2vnc+DbglDiMn5FHgnHngEMxL+z+KmMoLbkhdutuLiIdrvatZEaKVCZlg+ssAvrXec@vger.kernel.org
X-Gm-Message-State: AFuF++lq/JT7+rKQyGwC2siErSIw+Ht2DnJe5N/hlSadq/N5MBCSnvLA
	hgBaBMzOqPu0CQWzLm2oj//EFqL5QkKkiXMhvrE+qyoVc6KRaZdmS5G7paUEoYcBBJO07IBLtAg
	Oub22FHv1wIdQkBaL3AQOrs7QusmzLaciccjolPPg6Z8LPZHUsAucPto7vgEgRUwpA9V/
X-Gm-Gg: AYBFou0lB5Pp4kJ11gcaGufycfqqAUl/mW+TlAw0IDkOvCO5sDmCeRsePgPd9qslaNK
	ohFsbM5zbQFNYuyMeHgFdmmbYL6kUNnKhRKOsQg9tWjLvO/GOXfAF30+Pci3ZY7dQIFNnRLW5uL
	NNuYgtROR1+JJ5wNmsrFa4jGgxBeyueVJuI5oIaTMhSFKbhSiDDYu1Z8lKwBtAube0OmLeY6Ogo
	bQSAVV8lHgr5XGffZ3JUaBOmO/rSA1xN/4DPdAjEH38HqDIiu2QfYELazpboLBvh3KNsWEkp0xH
	hvF5v6ERoAj9LR7zYaRIvQLCnm65tUCpqTkUahDXfrd2F8Hq+DHbU0vzkMmb4GNfLmLFLMhsMI/
	X2bZAc2T3rrr5vmWBpULWsUzOZ7BjuWcmru8wGbAGYQ==
X-Received: by 2002:a05:701b:2612:b0:148:4d6c:2016 with SMTP id a92af1059eb24-1484d6c2746mr4899612c88.24.1790565742362;
        Sun, 27 Sep 2026 20:22:22 -0700 (PDT)
X-Received: by 2002:a05:701b:2612:b0:148:4d6c:2016 with SMTP id a92af1059eb24-1484d6c2746mr4899569c88.24.1790565741678;
        Sun, 27 Sep 2026 20:22:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad8e43d2sm24943073c88.12.2026.09.27.20.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 20:22:21 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:22:15 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC
 support
Message-ID: <arndZzMXODwRxf2c@QCOM-aGQu4IUr3Y>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
 <arnVNhV3DYnvt8Qu@zenbook>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arnVNhV3DYnvt8Qu@zenbook>
X-Proofpoint-ORIG-GUID: hUWiAzmho-0mM7ULCLFpGHeXGsWRGhpT
X-Proofpoint-GUID: hUWiAzmho-0mM7ULCLFpGHeXGsWRGhpT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX2+FGB0V5V4gJ
 /TST8fNAK+9JaZd3VFYS+rxZdm83eumPBU2NpbbK2WIYJGwL14b1sWY0cQIRxT2+MqXjUPsFi8D
 xjOhq80x9UYQtO610IIuagH9BVp8MLc=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6ab9dd6f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=SYfeJ31E7edhApbbmCIA:9
 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX3cr2HQOU9goY
 a9S1DpPj/iomOT9O7NnZq83idqdLgNoVsRt3Bd36cYkzkoaJplHVYZxsVNfA3gONLkIzHdlOa6R
 NHFxzSSvEWhHIDoJn+2coOnUg25n70sXP8U1jKd1uXYgaSO5rVCnuHpYcW8n7NmBzt0UanaVjFz
 3t+vw9jgF+tU3ZpS8whWOWdEQNKmprky6Pg8TxH/1r2Pk5N82NR64nUUNngJOv9gXjT+DT5w/dp
 jHDmhvzGoevSthvNd8SkgmH8YpduOI16levvFp3dONb+x+Cxa3BuNZriDJmHzudOI7jsaiSoOda
 Idb96GKIo+OfdH+QUD/3aOkeh7j7kH7TRRv0oNkCnY+q28u0TkQbeWj/30DPOdrty7jDCTZp8xk
 neOnOMoX+cv9uItnF9t7S74DkHJP55bf7TwhIObU71Y1MISJ7kp85SAe0bK5fUx0iE5B9KS0wmK
 WWepgEbBovF2taWwahw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280013

On Sun, Sep 27, 2026 at 10:00:01PM -0500, Bjorn Andersson wrote:
> On Sun, Sep 20, 2026 at 04:49:14PM +0800, Shawn Guo wrote:
> > This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
> > and the PMIC descriptions for the Qualcomm Nord platform, and adds the
> > initial device tree for the Nord Ride Embedded board.
> > 
> > Tested on next-20260916
> > 
> > Dependencies:
> > - NMXC define: commit e484a765f543 ("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index")
> >   from git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt
> 
> Is there an immutable branch or something? I would need this commit
> merged into my branch to merge any commits that uses the constant.

Yes, Ulf confirmed his "dt" is an immutable branch[1].

> 
> > - Base DTS: https://lore.kernel.org/all/20260903140617.441111-1-shengchao.guo@oss.qualcomm.com/
> 
> This is v14, I merged v15, now we're cooked!

This series works fine on top of v15. But I got your point, this series
was only tested on v14 when being posted. See below ...

> 
> > - PMAU0102 thermal: https://lore.kernel.org/all/20260830101025.191697-1-shengchao.guo@oss.qualcomm.com/
> > - PMM8654AU RTC: https://lore.kernel.org/all/20260904074541.590485-1-shengchao.guo@oss.qualcomm.com/
> 
> Please don't send patches that can't be merged and thereby sign me up
> for the manual work of clicking a bunch of link trying to figure out
> when - sometime in the future - your dependencies has trickled in.

I may have misunderstood our internal discussion. I thought it's fine
to post DTS changes with a "Dependencies" declaration, so that they can
be reviewed while waiting dependencies to be sorted out. And when it's
ready to be applied with all dependencies cleared, I will resend the
series by dropping the "Dependencies" declaration.

Shawn

[1] https://lore.kernel.org/all/CAPx+jO-q3JwY=i6P0K_r4OBie9bnPaR5kUm8+T8uGFq1oK9vFA@mail.gmail.com/
