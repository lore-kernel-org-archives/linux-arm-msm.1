Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF4437BE93
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 09:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774460; cv=none; b=YtMR7fHfW6S5/reSxPG/fOKONJZt49I26lXjfQ5we7ud0qj2EU9zYiOSztkYwvc8YqDucVKZpt8JkauYyouPFFbWjG2j9CgQuJBMiy7Oiz39GamnATcC4LK107xNAWDMzzaNH41JETuGDzRwR5sSoOoQXVTJ8VogK4DW/eIOucU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774460; c=relaxed/simple;
	bh=6SspYc/M1jCPep/6JTqdwpr6N1VKzLwAITB+4WnMG5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNjIpc05wxHOjOsyiUMvzql8djOi4PqrJGdwZPOtxwT1iwlymgeWbCZ+EFKWGOb/9npR+oSfn95sQ9dI8jTGpbukCJwpSAi6iCGdSCfX8yZtU7hXjEZIbpiUgHrte/zzZ1LxaSVyzjbH7Eqr/cM/Nn03M6Qo8TeLyjDCghAFE2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gj+S71mA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LyeIns4D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gj+S71mA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LyeIns4D"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bTnt3713177
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 09:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NSadxso+8kCU0Paycvkt2KDREp12le3ozz3U7BFkz2U=; b=Gj+S71mAQ69L2o/N
	ZE/ViHnpWzSoj5C+vJFAzglZBg6pRF23n1mPCVVbvTVfPazGvza413Irt38EUZg2
	5SF4plzNgNmKK44eE2SA+zQ0T498d90bHtNQUtpPcZmi52TzQJdLMGE5SSKowxTC
	6EK7VKPDFK96WDcgU8WwqfJ1NHBU+pK1gc6g+OR1RTr+PiI36tUac25r6jyumV/B
	FhVhz+n0vC/gHIfjh7rb098MB73VTjeY3Wj5dc2/OuxRzvK5opyTqXmRZwJffiFN
	oQyH4VdQDkdp5PFSmP63BMTwwrOyznMaPIuqgqTrjt2p2X2EPtfxuufuoE0wbwX2
	OLR6Lw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1d8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 09:47:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso44335945ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 02:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788774458; x=1789379258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NSadxso+8kCU0Paycvkt2KDREp12le3ozz3U7BFkz2U=;
        b=LyeIns4D8XSFl+4qA0BcaANHKWpCf2EIRJsceh53p/W9i4yzfZKUhY6BbmvQ3ZCJX9
         VVApWi4jqB8uSbQqjHmD5zrL1Anga5EDZS7ZHkTI7bAwcofgCZieRVRp4XxlVnToaxKD
         kCHDzlasysXSBWn8puZDE7Ua83r2ESjVTlwQITeoQqYQuPqxrLwm7+Qj5wJxAe40fy2U
         2PEaCqxxzkQJcblUlZ3HJnvIjYaeDAbJdwaqqmbVpGA9isQ7fvSI8MyGyA7NSgye56lO
         6GQ5+LhcSZCGLHM0787ad39qpxJUKjBCcxiN0jgQ4uCKVJxSUvdbqjef5/z+hZBPja7e
         a3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774458; x=1789379258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NSadxso+8kCU0Paycvkt2KDREp12le3ozz3U7BFkz2U=;
        b=gPqZxrLph9ksjeCgFOw87DrPIDdXNdhre5T4OAT009Dd3kg9u0J9M6vDhsH67sSLiM
         nmITimwd0jFJWmExY8TqEyN9N1U+0xkXDPNoevcDZghSz5gpABeUINP348JvQ4/4d0f/
         uSnWUm/zDpLyeTqagI+DlgljUL1PXOulcfjZ465XnXFBNhoAS0+e5UOheGznDOAEWCax
         DW3V/kpfMjebuiNgSspqdZeGMMkFswKcfi5pSl9AYmkFjfU04eZuUJ6Oa2z2AP2sgIQo
         P+Eba6gyfWnx2qUWuEOd6UROgJuHwfegoOjnS3dODypVzOB1kSeLQTCe5DgW7tBkcY4i
         S2Wg==
X-Gm-Message-State: AFuF++kol+yZht5Y65Mopt4hGBF0r19lE96D65Gll1B+Hl8pU3FdU14W
	83Gn+bSs/nNlFHhZS449ynw6ghRbXXp+3MA+1xDy9y1RhYq2MSDBwY0iGZRT09705DjnmFWzLcA
	j1bDmLvNIIE/rbETpII1NaZ4aaa6y32vO+txdNHcuOygSqPiCcM559WVHV4QPqzVw0br9
X-Gm-Gg: AYBFou2pRFoGlCXtBzgfd127rtVYzT4cA5Ntp96hs2KxsikQvEKAPN92QbPuaLbLEGY
	WgDGh5yNWz7SoUkn4ZKrM6DxsQKPggWzSL5sr9ZOyZ3wjqMLf3GdRS7iBVFfpSHNuPVego4BMdQ
	HqMEIYSY/tSdpXEtubjtuNlMDfLuE0U+zSPLlBX72x3LV3cS9yCOcVVS2Zf0W9dYgkZjf60HRO8
	zVnmr+krCVDuHuZ6wdJoH2AYSJ6SlV6DvLKLj4usfmsP/XFOs4UwDURdZvmWEekf0K47QU3+XMN
	Wqzl5FBP6xEtq55aGMw9FQ8zsU/4n3N3KMZTARf9sGf5XqswJimwqFjtPjISjcNqCiSSgCBbyK1
	0lyXsylx/Vgija1sy038EqO0z594hNto=
X-Received: by 2002:a17:90b:3a50:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-39b26101576mr37063428a91.11.1788774457557;
        Mon, 07 Sep 2026 02:47:37 -0700 (PDT)
X-Received: by 2002:a17:90b:3a50:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-39b26101576mr37063367a91.11.1788774457148;
        Mon, 07 Sep 2026 02:47:37 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm23169442c88.3.2026.09.07.02.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:47:36 -0700 (PDT)
Message-ID: <591315ce-37d0-40e4-8bfb-55206578f0f4@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:17:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add TPM support via Qualcomm TEE TPM TA
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20260831-tpm_qcom_driver-v1-0-6f16fa6924fa@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260831-tpm_qcom_driver-v1-0-6f16fa6924fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEwNyBTYWx0ZWRfX9DDfWi5SFByS
 6jRKaeK9/qUW6mtvxKUuGtuaFW7UqsiWdjB6XVzXYymTIySU9bW5MmgfhmwgNyoHeUI3VByzL4B
 pNGQHRCYxbAUYAyME/MWPFDtsrzP1HMlt4ojr1OFGsipbibpytUazJ/24Zxcc+A81+xR9mX4Seh
 pNag5CgGsxhWpXan0ojWGqmV/mNaYzwbI/gpPHlBnEu3uGF1Fr5FD6OpvZqPnFpHNbww2r02sHo
 Eh2l+arEqGtan9fNBFjW2K+HiL1vVcHRAvRYPBjHxKYI2A25Fzj9sRqcr9cH/502+/6jPWusNN2
 4HsZqIFe+pbzwq4PZHV+298HUNs03ftiBZTmtisKKB+lNaM2APQXHNoZjKCeucGqXHSkKQM7VgX
 Qf51oa2zD/j2XlwOkvL9U1akoNMlfLogMrR0/9aZx3Gvgo8f82nfn3xY8pYVrT39gLyVarpLlKV
 RqqfUrJnsf9w0KLsFUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEwNyBTYWx0ZWRfX7sdeg8pN8JNk
 kOI3LECIESElfbIqxvngrha8GrbM6mhM4RGS4HG5xlnt8c/cSFyrzNhvuec17oEgULm7fSuOJpA
 S9A2KNpiPu2FH56/pXbF1bev9JCnO88=
X-Proofpoint-ORIG-GUID: 2E2kbEhXvTEtrQ3FVGskhxglzMHkwJ3T
X-Proofpoint-GUID: 2E2kbEhXvTEtrQ3FVGskhxglzMHkwJ3T
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e883a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QTb_0JKWY7oM6lVZCfEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070107

On 31-08-2026 15:12, Kuldeep Singh wrote:
> Qualcomm platforms with a discrete TPM (dTPM) talked to it directly over
> a non-secure SPI channel from the kernel. Arm's Base Boot Security
> Requirements (BBSR) v1.4 require that access to go through TrustZone
> instead, so on affected Qualcomm platforms the TPM 2.0 instance is now
> fronted by a Trusted Application (TA) running inside Qualcomm's Trusted
> Execution Environment (QTEE), which talks to the dTPM (or implements an
> fTPM) on the kernel's behalf.
> 
> This series adds a kernel driver for that TA, built on the QCOMTEE
> object-IPC transport (drivers/tee/qcomtee/) already used to reach other
> QTEE services.
> 
> This patch series functionally depends on below(patch 5/6 specifically)
> for qtee service discovery.
> - https://lore.kernel.org/lkml/20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com/
> 
> Tested on Glymur-crd target with tpm2-tools utility.
> 
> Validations:
> - Get capabilities
> - Random number generator
> - RSA key creation, encryption and decryption.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Sent v2 for this series.
https://lore.kernel.org/linux-arm-msm/20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com/
Regards
Kuldeep

