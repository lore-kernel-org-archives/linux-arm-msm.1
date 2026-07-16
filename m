Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DF2410D30
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784204779; cv=none; b=Ia+fdMd8dnJSWidXAn2W7sT6LqwEzKru17JrBd50irVoqCSuWPxLE9LdGIAGhHlN0Tr0tP0at1raq1w+KiFnb5rH2hjiTEifysnewNtLsc+Rx9zCUfjBoX3pCJB0pZ6KlRvwRkgzUY3CaJhb80Uu6VnpQRiqJ3bFiy8gY/5KU4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784204779; c=relaxed/simple;
	bh=FwgUuktWlKEDuO9hQ/D+uCsYBI78tLaDcu4N3uVEcwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jh4vJzefe6V8dDJg1RBl2RfBSjprBgjj+r5rSqu8z6cE/XU9FtS/Y+6Auf66kIomZ1aV6PfGvA8wZ1HyBi2Lt7N/hYgaeHtWh0MsjEgpb67DAQpB+fxORSyyw0bNWVBJjwBqzSOSSp/Hy/2fP4ReVgoKuNDvoHanY+r1jpUdbuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WN9ZOkio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EscIiUOE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WN9ZOkio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EscIiUOE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBiPcl2824082
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 12:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0IxISuJ62EXm85nVi30QXZSl
	UArQyp0zpe3atXf2f9w=; b=WN9ZOkioGzp+oOtdH2jEA9K4+lZUR26J9qJB0Rw8
	ayPzszB9RP58b01sjy1CNIlKQ+Peo4ehIvoSgOQ8tK9dbOa7wCl8lAJvXSXDf8g8
	fcAjQUrHT0RB/R1BQFyGWT4hrDMKMcCffZF1LjK5kD4Womdgh0qf9uJGQQvRPMOF
	iy/3C9G7s7/Wtng4OwsiBSjT2wZRXjObbslz4Gv2h/z1nXcyfgqnPkKuvQRwmrxE
	BxqQuHVUYq0loajXgLeHnZa2cQmF7kxXU9LaUW2fO6KwvYT163p60yqsfo5m9HTi
	EAF8wPXhkTeOjR2KN76qwh7PtML/BYpOfKZ0fioqzTr3FQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf1aeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 12:26:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so707498a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 05:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784204774; x=1784809574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0IxISuJ62EXm85nVi30QXZSlUArQyp0zpe3atXf2f9w=;
        b=EscIiUOE+Lr9IoRLVMjeyUy9qMaK7IdPESPoJml7xq1WfMKoUT1Z1OK5r32ZMKF3r7
         D6/HoTekV2WRhWjNq81FNaCjvX8L7qBFVvnrdzmEgSSXQaKGps7tA42sweV3++xaorsH
         ArVAIz2Rr9M5Z5aRdcTFHnVAhjmOI5Zp4f6C3GVyXgMzEwy86hs7LylkfK7Drl2yuyg6
         fkUQ63nzbk/SHVzmXrozktKEXOzv4oS+oAwQacGvCja4lEhyqZb+GNf5m+wSvpdh6tvX
         uM2zwSzuMTKzFg95k2o+1G3I1ZcFelS6rxTznXmbPdVEe1PtNXeLSN4UrXfsMQFATzCc
         hReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784204774; x=1784809574;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IxISuJ62EXm85nVi30QXZSlUArQyp0zpe3atXf2f9w=;
        b=NERFw5veUfLUYfsTYtZ3q6VWMxZ8Csa/g3uE19SbUUUV0/NORrtcjzhIUrFr5kRz+4
         Qvi8xsqNGm/rZPe+aCixEIXaE25OqplkFn57f+hJKg78S4KPr5x5KssO9xq7tuYBnYoM
         s1RBAlrVQTomX/Kshpv0a3Q4q9O+1R1RovFa1J8Yxlc8kArziYYv3bpwPr6+wBAHmeWv
         w59bJ6+6udpnc+Fp7umHB+mYdu3AnE5O+YGcURBoxWbz3U8hmHpVSpAPevTpAm1Pt4wz
         U71VAsxiX3kjkVY3GtQAWFCJdLC7rY1gGJqZUjjZpoFkmIWXuP7Boz7PzhNKs39UZJvu
         pfXA==
X-Forwarded-Encrypted: i=1; AHgh+RodKWED3DMilWG3iGuno7DXgayhEYF82R0MX8LRGbdYwGHPAHVBXb2AOxItU1wRd1LW6+13ptMbq/T2/A6m@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh1lp58eDQfSNn9smeaSCvBU96GYDX/d+eEhSVkHx5gkibRnEc
	59zVSeyVz0klcZ1SpsN3ybQKGbeH6cv6fvL5E/ZiH8HKcDjl/z9hfyQ4s8x7wOwH0L0Vp7RCEjN
	Xcy71jMtnuk+zEl0JcOimEZ3AiOVPD5d0p1Z1E2VNXMdfKOdoWojFHnX98vYdVXg/JnRT
X-Gm-Gg: AfdE7cmSVuZdQFDK93zz5cyYPvQt10pPw4du8BcZ4BX/Usvad5GXc6/DFra16FdnqcO
	bn3QeEFdaBm9XQM1We4B5+htYwUYpyVWn0jmY5UeHV1f74Atf5/UHk+ZgdWJAiUQh9TtneJdmML
	sYx9RlBDIgB5lYjJxH39VpKSaarEy55GIasbEMU7qkBquJJs9RN3YkSOajVbw1sTnSSuujoZvKp
	PCYCGfQCaHZTUikLoXxFWUEe/nWUyZzt19lfmQHPkXP8np3L/nDmPEb4ccooMgEGLdA3VEmynkV
	HRTT7AfXpONDWBL49IZfLiH2Y8w5+WvtgdAJyth3X3iNCmwOQ50EpiCrna62guLFs4o1B5Hz7DK
	Z7R32+SHrKJTRIsSlvQGGM28Q2NM=
X-Received: by 2002:a17:90b:1345:b0:37e:1620:dabc with SMTP id 98e67ed59e1d1-38e3cfd30a6mr2342236a91.0.1784204773865;
        Thu, 16 Jul 2026 05:26:13 -0700 (PDT)
X-Received: by 2002:a17:90b:1345:b0:37e:1620:dabc with SMTP id 98e67ed59e1d1-38e3cfd30a6mr2342202a91.0.1784204773304;
        Thu, 16 Jul 2026 05:26:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e3a0d69sm12253893eec.0.2026.07.16.05.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:26:12 -0700 (PDT)
Date: Thu, 16 Jul 2026 17:56:06 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Weimin Xiong <xiongwm2026@163.com>
Cc: robin.clark@oss.qualcomm.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] iommu/msm: unwind probe state on registration failure
Message-ID: <20260716122606.ybsdajd6qgomte3s@hu-mojha-hyd.qualcomm.com>
References: <20260716013229.91014-1-xiongwm2026@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716013229.91014-1-xiongwm2026@163.com>
X-Proofpoint-ORIG-GUID: pWP6lD5kSpvFYg9iV_oBEpqv2lJG8oxZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOCBTYWx0ZWRfX1hMSsUWBZn53
 fVrzQV3QRQWuPyRIk/sQ+8D5Ay2Ythol4FL6B7KO8YCeHz3iF7fmOgCAma8lff9SXkWavbKbEMk
 lzhx7v1MJcr39iXIqQfi5DnRJE4+GOX0MBTW7Za5gTxY3H7cdpGhyZN+7qiIlIGHkxlr8gKZrcs
 xwbeQm2vu3p7HTaywf8ZU9EPkHqJY9ksHjCUco3mG8bDYoA67UHIdLdUoz+iYPJDY2IVkzjMO+c
 tCUzRMNYoW7CzUg9YFXH3wOR80WnPyXHZCDCOAVAzpVioo35Ny9up2yE4lmSwS+pX1XoTnZc7L0
 RdBFlFaJbusRdO6Qh7fYzybzRse2YBq8ytBRxn8yYxc8opt1rbyjHwHz5y1bJR7w1ON99tAfR5K
 QSYNnn+8XhmbuPeJQpbfKe4AT02zc/QfGnMvWoPzjHEgN7OiykhahqRDHWFfHUjXBIiQ3Mg3yHz
 3ZQSLJq9m9o4BuWDnww==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a58cde6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=qwb6liyLOyoGEZliCEEA:9
 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: pWP6lD5kSpvFYg9iV_oBEpqv2lJG8oxZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOCBTYWx0ZWRfXxqIZzmF5l6wx
 VaWoyzusnbnD4tspuJija3wgOepJQfZnyrvt+NrtCsonXtaMVjGs3otZ8OY5gwHuR+JoI9tITmp
 2iOaxhSaeA1lZV5F0wiLmdYjAjhX62k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160128

On Thu, Jul 16, 2026 at 09:32:29AM +0800, Weimin Xiong wrote:
> msm_iommu_probe() adds its devm-managed IOMMU object to
> qcom_iommu_devices before adding the IOMMU sysfs device and registering
> it with the IOMMU core.
> 
> If iommu_device_sysfs_add() fails, probe returns with the object still on
> qcom_iommu_devices. The driver core then releases the devm allocation,
> leaving a dangling list entry that later list walks may dereference.
> 
> If iommu_device_register() fails, the same dangling list entry remains
> and the sysfs device is left registered as well.
> 
> Unwind the sysfs device and global list entry in reverse setup order on
> the corresponding failure paths.
> 
> Fixes: 42df43b36163 ("iommu/msm: Make use of iommu_device_register interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Weimin Xiong <xiongwm2026@163.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
