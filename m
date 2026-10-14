Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8591F4D2EC3
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 11:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976974; cv=none; b=n8N7/53jlAx0IjJg0DBAfFXTmXruqGaCMVkicbNjTKIn2TbxZAM6ogkb786lIBR9PdDocJAKgMISzYdIK73PFkjkzP6iuZ4ISc9NB9PmYGeOrukF7ed/V8C4vXZTZJzAeDBqm2shhJWvHtIMUmZDoDKcK7oVIAT0wYJSwJgu0WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976974; c=relaxed/simple;
	bh=gw7oTGG7uU8qweVcAhui9r/qte1vsWv0XL7j+PdgEog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7xbcHyVtLQG+3guwAdBsJSrWy8ezU80as91JTVlzphf2uDL1lNFMmpvYO1y0QAJAhRYXQ+qc7Q1EHQ9V+ffnVsKPuxuZqi5ZIl3SfqxhJ0ZmrRuABFvIM4BRY0OpPEAF/0/xrM5J7Apx/W9to5JUm2oXc9lzG/2NKjg/yjVCWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JStjHbJW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QoJt5mvt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JStjHbJW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QoJt5mvt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EARCgY466347
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 11:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+jntJSO0dOy1PXfg1N/yqC6Gk2DhxB67lCSd+0bZ4w=; b=JStjHbJW+lXBYnED
	Dd6Ik6HLhnhVyaCsTp1DxF1ENsBv2rAheS44KAoNP6Pwr9x8E4xIUUt21Tx3df5j
	kjG2JZAg8EW7Yx1HqKjoVwmP8UBACC7IOMxhShUNhxMTWXo+E1DNJybgNxBmk/73
	LCN+OJhT1P2LvFBcq9F0G98alMH7WlCM8bYkSjES2ijd0bTuoBAEFgrH6m03ks9L
	C8cqDDq5V+68jGyZ7nxMoyBR14YZz3wb82DeAZUdgrfad0+zQSgMDSBnSBqkdBzS
	QEO/B8OZSbos5rx90y3InExdDkMFotguCUYmOs/dDwQP6kYZjVCflQ1RnU0o+Sbn
	Do5s7A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80cr69j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 11:22:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so712743a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 04:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791976970; x=1792581770; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S+jntJSO0dOy1PXfg1N/yqC6Gk2DhxB67lCSd+0bZ4w=;
        b=QoJt5mvte5rlkyi6ii+RQZq510i01t0vOoSegedwV8nJqgH1wFT/hDcE1poReuinpG
         i1FJAzZDzvt9GnXKmTkVD4YG1T7bAJ8r6YCKYyEcecREs1pokbYxyk1ikEt/4qnQgVO5
         gp1dC3RjJ8xAv7HRGmnynoUeD1yqprf8Kt/kSroGolXIM9QRpFb40TaIXgdFb6Oc+3WT
         8KoMP4nPNJltVajN9rT/lug9yN29kInnA7eWW6nhVWKhbeS2Awn8nreSrQxMFNrFZchg
         cUKnplFM6dviq8beugF1XWVO1BZfyZ+42Y6skGXP6mQKcKBJBHly3rcEMR8XC94PrC+t
         qWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976970; x=1792581770;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S+jntJSO0dOy1PXfg1N/yqC6Gk2DhxB67lCSd+0bZ4w=;
        b=XhALECukVWH+zm5ZVhZVQ2aqNqLByi8g0YWgLbUfRWGzgao6LN2sLWNN6L084Aw1Cm
         CIRE8tvrWz/sV7uee674u1EgzbXoKqAYN9Uektd7iuhtMhS/SU7MsAswTHoY626OlkH2
         iQL8hvtk3udXcULOF5SbBKRrdveu6x/AarI5F6xZMmXTWz1cSvY7CdrfEpH3aou/+Mga
         BNLUe/mWxwPvxx1oE1s0W6c2cWmJzDzgkUApdA0bpGuj7Cr0hWkc3I5DRUd/idIvLNFE
         SpQs/FsKzSt2YHat0hjILvbl/ECMgXWZYAW3vujL2+Rz9vovjxOydd2x1kviq8wawTYk
         x9gQ==
X-Forwarded-Encrypted: i=1; AKwUvBxd1NM0WWfLzpUeVfhFLl7oW5vqfFNYi2YxbHJJ9dulP/EMqu/ZYR/62Txhp8nIeksYZFadZmSAslFL++dX@vger.kernel.org
X-Gm-Message-State: AFq9FYIVx/DxWhjMu6jS9IElGLiuL20pYkRQLzemtsBon+xBSsIjkAEk
	+HBu+CYl0cE5JuLsT3UzKBbsEDeZ6wTvdHddZ5Khj8J8fqPpLgyhgliASsICecQjH/bngV9CXQz
	Mb29zJRuwYIqKGMtK5ivaRdaO3mbwP+G5ToM6BGzNeWTxqhMDv7jZhKR6DPb6RKJfGPZl
X-Gm-Gg: AYBFou0e/A1PCg5RtFLqKfKVl0h6CS/whg9uSbi3H0IO7Mblq/Kl8BwK5f0APZwiTpn
	VoaH6rHSBEj2Qp0yreo34QKMmTrBETJxE+97CKhyH59Zj6XNJJ6GXn0hSY4cgI3bdOlAsrtM7uR
	Y61mhWIsMtW4PufovVn/BwgCKd9ayVlB3FpZQN/4P+y8koWgom/MFiM9YU3bRU5U1l2J1almSfD
	pAp6qfxXFulb9xm4v3uW01TEjEe82EbrQOudmBZdVPw8pVvE7T/IRFfd/qNlUwZ5GL7Zy2Pj/8D
	TRBW8fvWJ/8/DRtqW8ymaLmwljxHguKSLUR9c8tvTcVQ4qqz88UE0+m84P1Bi89Kp1Jp6ArH/zO
	qZ421YezExc/sakjoW8aknI3p51f05Y4Olu5Cbw==
X-Received: by 2002:a05:6a21:3b92:b0:3e1:51e5:f28a with SMTP id adf61e73a8af0-3e16b7792b7mr14830952637.0.1791976970343;
        Wed, 14 Oct 2026 04:22:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:3b92:b0:3e1:51e5:f28a with SMTP id adf61e73a8af0-3e16b7792b7mr14830917637.0.1791976969839;
        Wed, 14 Oct 2026 04:22:49 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e088efsm7091424a12.11.2026.10.14.04.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:22:48 -0700 (PDT)
Date: Wed, 14 Oct 2026 16:52:40 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v12 3/6] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci
 ICE init
Message-ID: <as9mAK0JIbWhjNiX@hu-arakshit-hyd.qualcomm.com>
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-3-09271f583dc6@oss.qualcomm.com>
 <CAPx+jO_Ltc6Q+VdUgOs81azTiM5Vx12GH1z+CXt6NW=M601THQ@mail.gmail.com>
 <aqrxBSw8OupqItDR@hu-arakshit-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqrxBSw8OupqItDR@hu-arakshit-hyd.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NSBTYWx0ZWRfXwJYBG+hydo2A
 v4fzsYQvzsjxwhmn8xOTbzJN4oobjU9TTyXxYfaQSV1hE8BAYDus1AFpx9MeLUDQEbZTDXjXhdY
 J8PMX/O69CaiWIZI01PjQqqrDDXBCHc=
X-Proofpoint-GUID: R4FdRvk6xMRvh3MAAUC9wQnOD43jidMK
X-Proofpoint-ORIG-GUID: R4FdRvk6xMRvh3MAAUC9wQnOD43jidMK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NSBTYWx0ZWRfX2wHEBmnTZwtj
 7b941YCDWcRG2eUq60/MHSM2rQCqPwFh2lTKVKWUoMrZFXSW7miZBXhZTew2gLS/+M5/fyQESZ9
 ah6Vp/hOak4GmeScZPa0V1rRgMPPcP6XXH5y6IZSgpqYLI6M79CMPrB8bqBN/USZVUn8rj3kUGC
 vLD+6X1tiH8yxXn24hwhUQwh8NtjXAY1zAvBM1dqMqd5FNG8WPSTIT+GOoxyVioFdw9I4kVxkaR
 wkP8AIipy9RaOOvY39268vFuFYSOICD49HbdzrIyxFHJil5VytfYi8oCM/UYZ+68ZAgESnKcQGS
 Bv/8C7sYPC+AkhLG0bGkWJExiuUltRQiYttpJluUahscXWHgtz52g6iswpYXssqKBoOjChov5CE
 DJ70WsuBCD2ReBF/4W7vIHv1MCjTuSx8yO6C9x7zOwL+v9Psu1+ze5D+JIHJ6vVXcb/jmrkW544
 dgvkYWl1JqkwfpwVvVQ==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acf660b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=Rw_USdjLlEaQDXAQyuMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140045

On Thu, Sep 17, 2026 at 01:12:06AM +0530, Abhinaba Rakshit wrote:
> On Thu, Sep 10, 2026 at 12:17:46PM +0200, Ulf Hansson wrote:
> > On Sun, Aug 23, 2026 at 9:48 PM Abhinaba Rakshit
> > <abhinaba.rakshit@oss.qualcomm.com> wrote:
> > >
> > > MMC controller lacks a clock scaling mechanism, unlike the UFS
> > > controller. By default, the MMC controller is set to TURBO mode
> > > during probe, but the ICE clock remains at XO frequency,
> > > leading to read/write performance degradation on eMMC.
> > >
> > > To address this, set the ICE clock to TURBO during sdhci_msm_ice_init
> > > to align it with the controller clock. This ensures consistent
> > > performance and avoids mismatches between the controller
> > > and ICE clock frequencies.
> > >
> > > For platforms where ICE is represented as a separate device,
> > > use the OPP framework to vote for TURBO mode, maintaining
> > > proper voltage and power domain constraints.
> > >
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> > > Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> > > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > 
> > This looks good to me!
> > 
> > Although I have a question - should we never drop the vote? Like at
> > suspend and runtime suspend, at least?
> 
> This point is already discussed with Konrad on earlier patchseries:
> https://lore.kernel.org/all/d1232243-2f23-423b-84ac-4463eac79f9a@oss.qualcomm.com/
> 
> Since, as the device goes to suspend and power will be turned down,
> PM runtime will drop the votes and hence having it in suspend resume
> is redundent.

Ulf, I hope this answers to your question.
Can you please check and let me know, if anything else needed/open?

Abhinaba Rakshit
