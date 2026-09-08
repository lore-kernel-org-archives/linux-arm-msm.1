Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5F555C1C4
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 13:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873209; cv=none; b=Iz9Oa5+ngmF/L/Xn8JZoymk1TZkTqUhvz+n/4ZI48jXEKMrN2hy/i/eLWrkU1ehPO7GITZ/yiLnhZr+RvV0jdh6Hn2KCbvSXrA1kfnzSfQOcZ6aQ+bu6dbP2vL8awnV8q/kmbI5t8pYpa/nbDs4kWhBLQ2UPF9fvH/a2y8tf6x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873209; c=relaxed/simple;
	bh=O4eWR/JZXniI+aAyv6RxYHMmagr/ohwcESr9x210uog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z20bsUVe0A0skWvHbVWWKkX1JTNZc9Ml5BVtKNKIiZo+FsAZpSZAuZwUO0NVlRdJOzXjpyWMFRG7PNkY4HP7/bcpQ81O1FgGz10vTffRMflKxXitCE29DANz1EYj3v/11yNKkKBxmYA7pYvoSg/467QqQlCh/dqmJuyb/z7xtio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JmcVEQhT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZzx0YyG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JmcVEQhT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZzx0YyG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688CksXo2507086
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 13:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1ORZ0DU7gdTxBLmd5domb93b
	jts+JyOZJlFH7aI4M5g=; b=JmcVEQhTCjIF51uHnasykLN6uOSl5V4kIHwHvPk8
	FSWtLcx1Y2R59hxniQXE+Gq++vAZzZfvydE8P/acM9upqP+0TfmUZbnPJC7lJjs3
	sYhWCFTdsClNayrm52psoGOzwX6JPFK8b2X2PcO1QkbMua7gBOjaVp+LlQun1jye
	+lONabZHtQ0Up4oPDPXnV5LPrBy6bUd+ivO4kqIKQFGMw4HDWSlGjy2slHeqoYJq
	uB4Uef/cwxUR11gR+Jl4oNTocNoSOTNy9rvcFe+5JXxPfTOX22577neLOcpuOAm7
	Ag0vMZc/IfUdOyUJCqPB1MLYELFk65kqUZJHE91syuFiIA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvuhn2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 13:13:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca8aee88725so7174403a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 06:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788873198; x=1789477998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ORZ0DU7gdTxBLmd5domb93bjts+JyOZJlFH7aI4M5g=;
        b=CZzx0YyGMo3pfk3jLIHitkHT6R+HDaJvsosJ3RsHEH4Dfp4yy6IoPPhzRVoAgAia21
         2eB7DEcozR3mmrMMFVOyOmCsAclEiypEPVHQRoi13mZsPw/K49CuV5Wm0qD6i+G7Qhpz
         jQ1JtGcYEMcxjrIEyBZu+SWl7wlSrmE4Pr6RNSmNujgPCBftnCtSxm9XPkkmJhTmDwyL
         rJizJuWreHNfWiK5Hl8vawQZTsNW62O1M4ysWkmyS/yeULlKiUtFFaSqX9XuvCLXA/Yd
         K1K5TMudRDzsP6rjUT7vPX8Ku/ElAMzs08gzibUkjALnkhT5h5LjdJOsoptE7e/V/4sY
         WDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873198; x=1789477998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ORZ0DU7gdTxBLmd5domb93bjts+JyOZJlFH7aI4M5g=;
        b=PxWKjzwJtraTRmgRP9LA4/SwWdtLYyjGon4Tc9oNz7WKdLXUkvNzPwAXjiEjORC8lF
         PMxqGSN9ZF8EE8Un2zx6M2FcXzrvpebu3WY2T1NNV1ZHCn9LSMIV6L6pg9kDDuV+dnWC
         phG1w348lhZ8+QUj+6NCVJ8UweJ90oOEAuqsAJYz82cTRcmueILNRf3824DNHS1CEZh0
         zCIlNmVKTlgEyxIUFbWaxDtRM56BcxcTwbg1W5hmx7lc7wpys/I1n10AJto+OSxR8eoE
         x2zektLkS/nSLRPQ2koVjpJPmaLxuPivSJjTG8yfYIM0PuB4k1KPQ1JsaKmk/odlZiKC
         18+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxMd7n1DAfXwDVWV5GtO/AwUcZxyLVnbQug07mk7egJ9VSM7BXmoZnpguLl3qqS7oj7CR6AZdpR2Mh5yu79@vger.kernel.org
X-Gm-Message-State: AFuF++lkSjcMSoKhZtWAZ3bcM1gRnpensbNN661Tgh7vk7gOJZZdYk0y
	BkUmxqksJVZ5Bkd/sG9QTZJgx1act8BBaSA7rHnGTultSBoi6i5pPj8/BKcQL1AcZkNsOiLmXFE
	JXaYCUmpx/sCArZoKRX2JxCDCiz0iMjcp/eAtN+29jzZFBbmsPv5WyqZg62TaVpjgMOg6
X-Gm-Gg: AYBFou0i7LF3Cohr7KvkD5LuP0x+i+Ng5U+506i0NzTMsLyC5caR8bul7aAcNKvhZlx
	A7pHUIg+uAYs1aP3MVUsFTcqVaD/7JQoLaJCgyFsft4x4JaaBVov2My4wRGOhD7YRL0/Zk3c1fK
	ApJtJSMIK7sQmMBvfd5DxbSUtCPt4nAezwveSUqdjzE83RXOuIGGhSPCPvfsceQJbv8ESi3gJbQ
	8XwrRhjpX8VgBGhJKnd5auStxMCVbZy4XgsMAOgi//1ZbwO1jlutvdgANUX4BxHnWilOyyzOGGb
	Jn7ECrhC7X6VcMLA4t2TH7UYGXgFAJGehRN72HX5GjahYAysyIZ1COnOKpaoY69xWD+CafXxrmC
	cUTXk1MLWrYAVVpTKOET6Xt8ROeOQzg==
X-Received: by 2002:a05:6a21:3117:b0:3cd:61d5:f342 with SMTP id adf61e73a8af0-3da39d147b5mr45941815637.9.1788873198121;
        Tue, 08 Sep 2026 06:13:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:3117:b0:3cd:61d5:f342 with SMTP id adf61e73a8af0-3da39d147b5mr45941710637.9.1788873197460;
        Tue, 08 Sep 2026 06:13:17 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm36266788eec.19.2026.09.08.06.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:13:16 -0700 (PDT)
Date: Tue, 8 Sep 2026 18:43:09 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, broonie@kernel.org,
        robh@kernel.org
Cc: Saikiran <bjsaikiran@gmail.com>, broonie@kernel.org,
        monish.chunara@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        lgirdwood@gmail.com, andersson@kernel.org, konrad.dybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] regulator: qcom-rpmh: Add off-on-delay support
Message-ID: <3pybhkqdvve2ct6burnhav3utis6nljz7ncheqcrs7v55ullz4@nek57empeoca>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
 <06a264d0-6a14-4b71-b783-82b771f04411@oss.qualcomm.com>
 <oa3okt7mdhoqmrebwim5yswarbcacbmhpwfvqbhtv6ib3cwrwi@ddox6mw3uhmy>
 <0d4fa333-df22-42b9-b9c2-ccb43ac4fac3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d4fa333-df22-42b9-b9c2-ccb43ac4fac3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6aa009ef cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=bvrmFQN2d7YouEhKHLAA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: wS-ZNjclqfgAHj_-CImSyWjTsI81W4OP
X-Proofpoint-ORIG-GUID: wS-ZNjclqfgAHj_-CImSyWjTsI81W4OP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0MSBTYWx0ZWRfX0+iFPfObDY5W
 RpCapgYW4bZd67ni9PXH8Aq9iv30JKPruZs55Z9qok7wDvXQDFLlpvbpJy91wC444i+uMVgtet9
 /Vh502uPgvmtY3S2n9FqTylJgZDybV1N6e57kDRo36K5oQf4ZeqnPYFLN0e8rvMrtTfxGcnl5yF
 he1lcu6+7quMe9Jfeb6c/8gkt+mlUSWMeGvYoBzW4ZT0o7HtoPFMuRjgeAxOIOcD50JlAOiSv+C
 V955VQWy8uEIYFDLjtToOmzdhtXsApmu+O9DbA5fECt8Vi1HbQu6MWsqyrG4ptWZkmWDP2V/Hey
 GXwNo2rUya2H0acEpB7mXiplCUIxqTptdpwmQCo0RSTetoF+gKXS9JrMzkYNIdDuO6yANuQ4dNB
 +5+ykwjVxA/7oddwX7rtEiIlkiFI0Dk0Kr87F0rwiOdbbYCXhvyQujN44uSxQ/FmC+te8eCAERf
 OgkkYsyOopbUtVS+afw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0MSBTYWx0ZWRfXyYzIYfiB+s+3
 kho6ngmY5No2KtSI1Con1iTGe5QbwyuZUe9rQK9A2G+TRdoYbNpZnCLWuJxsvjZ8dO6g25vwcVm
 0R+mhxPaA+CKgEI+U4aOIZj6aFjb680=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080141

On Mon, Jun 29, 2026 at 02:13:00PM +0200, Konrad Dybcio wrote:
> On 6/25/26 12:16 AM, Kamal Wadhwa wrote:
> > On Tue, Jun 16, 2026 at 01:48:50PM +0200, Konrad Dybcio wrote:
> >> On 5/15/26 1:16 PM, Kamal Wadhwa wrote:
> >>> On Wed, Jan 28, 2026 at 12:32:09AM +0530, Saikiran wrote:
> >>>> This series adds support for the standard `regulator-off-on-delay-us`
> >>>> property to the Qualcomm RPMh regulator driver and updates the
> >>>> corresponding Device Tree bindings.
> >>>>
> >>>> Motivation:
> >>>> On the Lenovo Yoga Slim 7x (Snapdragon X Elite), the camera regulators
> >>>> (LDO1, LDO3, LDO7) have large bulk capacitors and rely on passive discharge.
> >>>> When these regulators are disabled, the voltage decays very slowly. If
> >>>> re-enabled too quickly, the sensor experiences a brownout and fails to
> >>>> initialize.
> >>>>
> >>>> Verification:
> >>>> I verified that the core `drivers/regulator/of_regulator.c` does not
> >>>> currently parse `regulator-off-on-delay-us` in `of_get_regulation_constraints()`.
> >>>> Therefore, the driver must parse this property explicitly and populate
> >>>> `rdesc->off_on_delay` so the regulator core can enforce the constraint.
> >>>>
> >>>> Changes in v3:
> >>>> - Added Patch 1/2: Update DT bindings to allow `regulator-off-on-delay-us`
> >>>>   for `qcom,rpmh-regulator` (Requested by Mark Brown).
> >>>> - Updated Patch 2/2: Refined commit message to explicitly mention the
> >>>>   passive discharge and bulk capacitor mechanism on the Yoga Slim 7x
> >>>>   (Requested by Mark Brown).
> >>>>
> >>>> Changes in v2:
> >>>> - Moved the motivation/context from the cover letter into the commit
> >>>>   message of the driver patch.
> >>>>
> >>>> Saikiran (2):
> >>>>   dt-bindings: regulator: qcom,rpmh: Allow regulator-off-on-delay-us
> >>>>   regulator: qcom-rpmh: Add support for regulator-off-on-delay-us
> >>>
> >>> Hi Mark, Bjorn, Konrad and all,
> >>>
> >>> We have another UFS issue on QCS8300 RB4 EVK, where it seems this patch is
> >>> helping.
> >>>
> >>> Issue is seen 2/10 reboots and it happens in the UFS probe defer path:
> >>>
> >>> 1. UFS probe takes regulator handle for VCC(vreg_l8a) of UFS host controller.
> >>> 2. UFS probe enables the regulator
> >>> 3. UFS probe defers (due to some other dependency un-related to regulator)
> >>> 4. UFS regulator disabled on probe exit
> >>> 5. UFS re-attempts probe and re-enables the regulator
> >>> 6. UFS init sequence runs -> UFS NOP OUT command failed (no shell) 
> >>>
> >>> Issue Log:
> >>>
> >>> [    6.583836] ufshcd-qcom 1d84000.ufs: ufshcd_verify_dev_init: NOP OUT failed -11
> >>> [    6.592780] ufshcd-qcom 1d84000.ufs: ufshcd_async_scan failed: -11
> >>>
> >>> NOTE
> >>> - Issue is not seen in first probe attempt, because UFS regulators are left ON
> >>>   from bootloader, which gives enough time between rail turn ON and UFS init
> >>>   sequence start.  However in issue case, it seems re-probe is happening too
> >>>   fast, which causes init sequence to fail and UFS brownouts (similar to camera
> >>>   sensor case)
> >>>
> >>> - Also, we compared this board with other RBxx EVK boards for UFS rail, it
> >>>   seems that this board has more caps on the VCC regulator, as the board is
> >>>   designed to have both EMMC and UFS, and we have DT option to pick one of them.
> >>>
> >>>   So for EMMC those extra caps were added and they are impacting rampup on VCC.
> >>>
> >>> Since this is not entirely a UFS part issue, but a board design constraint, it
> >>> seems better if we handle this in the regulator side itself, as adding it in the
> >>> UFS driver may not be acceptable from UFS reviewers.
> >>>
> >>> Please share your opinion, if this seems to be good reason to accept this patch?
> >>
> >> Is that board in production already, or is that something that can be fixed?
> > 
> > yes, it cannot be fixed in HW, as the board is already in production.
> 
> Re-reading this thread, RobH's worry here:
> 
> https://lore.kernel.org/all/20260129174829.GA1324020-robh@kernel.org/
> 
> seems to be misguided - AFAICU this property would be set on each
> regulator separately, not globally for all regulators under a given
> PMIC - is that right?

Yes, this is per-regulator and not globally applied.

> 
> In that case, I see no real downside in allowing that, especially given
> it would/should be used sparingly and only in cases like you mentioned
> where the board has some quirks

yes. we can use this sparingly for such board issues.

@Mark, @Rob - can you please comment if you think this is acceptable?

> 
> Konrad
