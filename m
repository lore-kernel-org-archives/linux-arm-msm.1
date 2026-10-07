Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183A7314D06
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 03:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791343417; cv=none; b=JuI5ueXEtyC5ACioD3gvGt+QUBjuRaricofH0pc3IRd2cw4RTESE8W3tbjucR1gG43LbQSi3+nHpUu5zRpf6DKgTmQ233Wf8EMV6cRQmQHR5r9mQmiKUZ7RiOzw3Xf7j5TM3XZ0Q5Rdx6Lzalxjimy7WLmImzjmEzriOarKp7Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791343417; c=relaxed/simple;
	bh=Ausy8/4gz8lUdqnofFDo6hUNOeuY6YmQ2FWO2tl7+ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mR/EhQ8An4LGX403sF/OQQvTVh59XCzBmc0g5mR9cwOGxaZo2ywrMgTSZIwsyPL6asAzsu8eZCKteNAxH94eK7lr7wdli4We8db1NvD4gz9fNlPe7kfKPlSNYkMwKRGH44TjfQfFsBGphdeCy+zaX0j1jLhhaTiFXwvAkNI46nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AOKk/AKT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SpKaZh73; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOKk/AKT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SpKaZh73"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6971HElG2848804
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 03:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KA48W7VRQ3uJFaVC9VZEckxe
	CX/Ro12c18oCYgFj9fI=; b=AOKk/AKTQqwVwdqwJ4RHXf+UEx/9Grw0PuLX/Bh/
	fl7qmVTYUXmKbu/7NT7+v/CcdcMsB1xLUIf3kOnGjtU69HCbuajma6LhoYQstI7b
	+/StMXc+dK5ASKTn5EvU0nXazkyeC3FzioFavxTKdJ21ZkvOQ5ijNyEzWjLcLol9
	HzYY1UlnJP+B2uwJp6/oSPjKpqBQ9Q9uEjZDssBxyOxW/NbqGrT3pLSdtIrhcNjv
	4iprMdmBfYjVS7wyH9Bn573mYa8s4vDzrlvk1CbQpUtj1UeNEU9bTw2iH0lwRWZ6
	ojdvncwWq3r3pOx1FR7EIz+qe7rXf/SPy/yro6ssnwx9pQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c608cf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 03:23:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso7148755eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 20:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791343414; x=1791948214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KA48W7VRQ3uJFaVC9VZEckxeCX/Ro12c18oCYgFj9fI=;
        b=SpKaZh73N5Mpr0hItZV1SRzZsD9wRh6Vn2oJv9iKhV8YrUry1lfB8ABGtvQ8bYCZuN
         otDRq7qTdbGhOnRUaP2d1rB7i0+vMcJwT01YJAKU2OHj5g4R/viuo0v4siwrGFVhBr1v
         IuJqNKrRpDBSrZTSsZtZkBWMUMkYFPe6QAFxjZAwPMIi1gR1HGBMKiZHz/TsEJJ7X4E9
         YZ3ZhdL5+klszwVcIV4qGDs9MAD1zhAP64KIVlHXyjWdjrqzlVh7LzJ96KHdC3GiC0Ti
         AK9skj5bGdtmYwxLuz1YX/Nkwm8q4ci1289OcnWyNuTUbc6kx+CQzP8nWO+QBRJgNGrk
         bA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791343414; x=1791948214;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KA48W7VRQ3uJFaVC9VZEckxeCX/Ro12c18oCYgFj9fI=;
        b=jmGcrN+/d4xejDwXTkuqMa7ruOPxF94fV0vKQ0m+6/WWJOpWRUMZUNT6fVWSyZ3vID
         l/Z3OJ2KkJjaqnJOABt8Y/vmXHdk3HyZzsPiZN5rmyC97aVXjNB4Zm9Gz/j8rj5GaVOp
         fXMPMq9bx3Ck1IO5nJrAogzOdYcx5nAS5jXp2mLIPDcW/Zg4uHlzFxIFJhMq0o4kab0s
         Yr3CaEAC2cT91AxRELbZTLunVecJulq3mtISQPmWdGqDew8Pn4GTU8I/pclvUR8IFSoL
         2keOOGNEwiu1ffQDUGnuWv0vgRnnh0r/SfArKEQbG0rHyw/4bOh/x+cT9LD8Jmgw7NwC
         lqCA==
X-Forwarded-Encrypted: i=1; AKwUvBzGMAo2pkjq1ZkYqLsx6Hokh/ufkOGvMdjZEwSZhT8LBd3pSv9fhfAKkH+awrcIebXu1D4CNfySTAGZ9p/g@vger.kernel.org
X-Gm-Message-State: AFuF++mC6Lp1MU34atcn7qsaW9w21U1jA6hVbpGbZpEjaruLeZhv+ZyD
	nfO8RwATFcC9QE1B/PJrn8VY3oc77d5xQGmKzbo79e6WwChwAfLZW6/Q/U0CGiFj4PsdEYXwvIG
	d36NNk5l8rGk9G4ddLXQdKl/9aA8QwuIHoGb1T0sLAC4IStp0RWdr7qF3Flw0U7oNqGVv
X-Gm-Gg: AYBFou3yIbI//+8YiLLz5VOZuZxmsXbEvPYxIG4IDKiWXjv9y3wx/FMgoOpD9M6Od+R
	aOB2AUdYgyJGvHN+p+eDagh2HVglhxQnndP3wHMPluSu0W+JTEqLgXcSR1XvnjLn2qeIg7hMk+r
	2H+wJj9HluD40qK4X8/iitmzZVE/lbn10NufgC68rC7lwL0C5V6itXO9SZkeSDy2ucCv7bsb8Zb
	/mPhxAvUAL0cZV+OYq4p3+VwQG++HFx//JsW38acktDpKlML15PFQ8t9oEIwxlWbOflDGkeoW/7
	hGGcMjP951IZmVUYuaXeTn6Tb5DMfhKQRBoAwTbJ6xoYe9LjpreL5iqwHaGuHK0sUNnBdeWwR82
	2kRNtMDw4f7qAuOs5UTLjALOUn9u3PFgC2WCYgU+qMA==
X-Received: by 2002:a05:7300:c00e:10b0:34e:caae:20f5 with SMTP id 5a478bee46e88-3515de2686cmr822510eec.30.1791343413999;
        Tue, 06 Oct 2026 20:23:33 -0700 (PDT)
X-Received: by 2002:a05:7300:c00e:10b0:34e:caae:20f5 with SMTP id 5a478bee46e88-3515de2686cmr822477eec.30.1791343413469;
        Tue, 06 Oct 2026 20:23:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515b03da93sm2702320eec.29.2026.10.06.20.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 20:23:32 -0700 (PDT)
Date: Wed, 7 Oct 2026 11:23:25 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, mark.rutland@arm.com, kernel-team@android.com,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Document Adreno SMMU for Nord
 SoC
Message-ID: <asW7Lay9i_hiuTcP@QCOM-aGQu4IUr3Y>
References: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
 <179095635040.2123203.12001281676860626455.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179095635040.2123203.12001281676860626455.b4-ty@kernel.org>
X-Proofpoint-ORIG-GUID: yjzaPhrg0Li-qqDkgXMx8i1jIfjCswqP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAxMiBTYWx0ZWRfX2qAVh35X5y/D
 e3/nR5svKNbm6xyOFgmyXJMFS7PnJHxGzdofiDEVEOKTnvizlKmznqFd373zI8EbDoaqpmL+hw+
 cpKbZpjJ6p8QvnA8eDz4kbYMr6z2roU=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac5bb37 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=362RFuTrwy6jnSdmp1cA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: yjzaPhrg0Li-qqDkgXMx8i1jIfjCswqP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAxMiBTYWx0ZWRfX6HX0HMYwOHtM
 GzOlhBlfJRa3varlrDei5uBOFs/nLpXuJspLtpKdTH0M82igfCkWUCI/6d3OEwe5YvMpMbQILhF
 Z2ti3q5ayLfSr1D7fEuNRjA7AljnxAuVU7AGsOziBo9NjjfObpDdifa5JRyuPwWFVORaD7sQ2Er
 i1QjxPxYw728crxBbZa6snhNXMtMy15E8Gvc2u9xORsO+R7URmbOSOIaOhIjybECQrKyJIYlfse
 MXF0/lXAGVi13voCcnV+s1JjoE0whNFZGY50FIyUHxDisCYe7MLE9FMNxsRWIKiKK6H4S2Pds42
 4FbPWR+CG6RROoXyaT/NyIgJZ1El1RiWiJMnpBG4B0A8/kmg2uD43SsKSnayhluJ5M/AWmbY71K
 kAM0WIpsD4NVyFQ8FBTSeAp5TwHvVoyus8F5uq2R8UYK8RrO3w7DwfPhtjxM14fYRuGGxwAEQft
 Qo7981AilxZo54hsOnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070012

On Fri, Oct 02, 2026 at 05:46:40PM +0100, Will Deacon wrote:
> On Wed, 02 Sep 2026 09:38:58 +0800, Shawn Guo wrote:
> > Add specific compatible string to document the GPU SMMU present on
> > Nord SoC, and constrain it to the single HLOS vote clock.
> > 
> > 
> 
> Applied to iommu (arm/smmu/bindings), thanks!
> 
> [1/1] dt-bindings: arm-smmu: Document Adreno SMMU for Nord SoC
>       https://git.kernel.org/iommu/c/e9da5ec4a1d6

Hi Will,

Could we get this into linux-next please?

Shawn
