Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402101;
	b=Anf3KB9H/EHT+ENAXx4j+8JkN8bqPulMJc9hAv4lFAYLNGMlvb2xpdqcHrydaZvhwRTj
	 UISDOSfKo0c2v+z8i5UhVnEagkvK8t7HfozN8GiD8VShZG7BS3pbQZ/2OkaSMPZK/AjY3
	 BUxDYvOt3Pd0Y81JApSFssZpuyu1MzHWqxzIAAJAIbylVkdxrPdKulhm9Rbt0KBwexFkU
	 XXd6vPmBV4YpFuvbzGuyTB5FGtwhdj3xtHIFZal/9k4h53hFFyCNFLivAh1FrMyGnxk8+
	 Wtrcdq4duDUm1ahdLbdIRKbbJ44lre76H3NZZG7j2pzsnoXuVXxUB9AbsjbV3koW8Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fNNA5DINfFRpf2eORoYgUUVlbLJUUgtkmYcnEbAYKiY=;
	b=q4i6FNtkfOmNg6b8gB+FjYmRayJ5veoOquUYy7dxbUkgBJsFQeh/aYCCL943TaqYHQu9
	 6heHtUhnTpn5fddpmrRtx3bq00/2CMFVFhLnoFFW2oEAx7W40ogSw/s5DUgVftBtV3U3W
	 GKD8tz3azN8AE4C+WA6XunoA08DAEeFFWmyrHmegHZR/tcUFTu+9ViMtxsFWN9RdYI8Di
	 pJRk7lc1onrUBGBXKVbAixCw9efK8TVX310vV3BB3L4wRxFCDpA8tG9R4zU3xOvhAPS77
	 97aJtd8bSWbn1R7j9hSPeN5nBJU32II031uroSdlS93VJZsFnXa3Ovb8wVCnP9qHvLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6q+meWf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ahN0Ajmk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06A3606A324
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C06A3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6q+meWf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ahN0Ajmk
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ4x82001476
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fNNA5DINfFRpf2eORoYgUUVl
	bLJUUgtkmYcnEbAYKiY=; b=p6q+meWfh8pxTAsOPcNqXBXxXBRbH+GJDC4uiwKA
	LJ5hYTCU3/k1FKYji7ugZnbHErDA5WuhE5KzDaz8lgoup47Kf0aitPgAEw3rW0lp
	tMtswTpUYDD8q4tClQtiOBprE7ZUy4pXagV9SgI+lMAfwYQfVHVebO5KPPIcUnid
	chmnqaobA7mVsL+v/gdx+NJL5U1KFoj9M4mB1lr2ZMcQaWN29IzteadEmIgwVhrK
	EIpAcU2xW1xN36ygYXdO+5SKN19CrB5t79dsRs5D885Pvk1tYO8MeB2FCyVs7Qv2
	wejjCK8v+qWke5jhjykBYz7/jQCHfyyuSVzlG19XahwgNg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh2pvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:01:39 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c83124d530so3684758e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 05:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402099; x=1795006899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fNNA5DINfFRpf2eORoYgUUVlbLJUUgtkmYcnEbAYKiY=;
        b=ahN0AjmkD63PvVgeHmTW9R+4V623g7CKUjFoxTx/rILg6XoSPLCx7vdHPmEiblcs9+
         OXFKV7KwAzlj2DLe0CbFaW5Bl+jini2AbY9yNuUlleNQsjl8UoD/rLmNakZWu011wDRz
         38XM8LokSGsfwigtXiC7FcGwIKOc7I2XZxri8d7jzBWcGK4gC/ypzwPsIgP4XWflydYe
         RvqfloJW/9ugMzKTVIOYs+R/w5gem1fhgrJt9duQl6Q62scnAmDmH8VUXAEEpO75agNy
         j8BI4XUxTGkuy4yAazi5PoyFxyec5jlQglS9mkW6IXcVyjrruY5FmAnPRdATuGlT8Bjm
         HNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402099; x=1795006899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNNA5DINfFRpf2eORoYgUUVlbLJUUgtkmYcnEbAYKiY=;
        b=Y/gxp1G/ugctNLupWFWrLjiuFvr9WB7Kvtt8Bc/3fM6eWVN2LYkT02MBZQuNqzKZd2
         37ONT15w+zzfKNbIZoE8TNXdiIFP3zeEJNYMeys5dwPDNCjjuaZfbhf687J11an6qvUR
         afW+N04Q63F7QLF7N/6ytwCs1x3w1dM2n5h5nn///5k/XENU5jEG9LZ/uuMQHJ1bVy2/
         j1i+dkng2Lwem/tgvp9aL4DPyMShnt3zL6bNXsar2vjcz9+xRFCInTvSUlg5Vl62eBbu
         kOgcf5gJhViJDkWbutuSRNV5iWe/q5Ma3yVn4hw5AES7kHpp1XeQsvS8kfoyfg6EW2ht
         nAZA==
X-Forwarded-Encrypted: i=1; AL+hErHnHhLv9C66fzfsw6DEcsIR6EizQTlIIzPgF9j+wKK4z3POEEDnSVjIrOtYrJyq7Cw2yCHAcGJGz/w52tZg@vger.kernel.org
X-Gm-Message-State: APuU4Z/KwoXj3CCYnNmlMW8l/V35clzaD9t7ZE4r8/lPtpGWq0Mqmxx7
	5pupwrOvKP1kX/PKbXPZk8j0MlyDcPdH66UOkQL28O1VQhBWskV1rT12u5ho83upH0TeaZZf1+i
	X0qZgwBwEZ+ZDLXDDo+ne/siOee8HZU0THatgRf71A++vWqL/i1b20Y69eXHNYq6371G3
X-Gm-Gg: AYBFou36+s6l9+aoKVvnY7m6uoISOJtlpSnGlDJPtjI/y5hL0Gi+gOkP1FOUVZrFBDh
	2dvOhg5d19nEMhK5n0x4MuUgdm09gazd7xt7nZySltRys4+uVNrUXP6WSIbmO2V8xpTtfXXfRC7
	EjwrpyhnhBlTCVsFCBNyyf3oOTdbkZKHBwra4MzlsJzY5pByDSFBltdR92bdhPnx+WYAdWiFRdV
	RvEAn77Fqld3JIyupPrpsLn5N3gd8Euafv2YMr2fgu7iVA5tP6JsYALD+2gyM034uiwekGPyPpt
	yV1MdXVszzOMU83MRaGdbQa42wlB4MmF/mpOjw+L/+8ScOj/zkktLJQyks7pG4fkFFZApCku7l9
	pe3HgFZ6F40r5g+xwchE41P4U+Hy9lLBmr8r1SbiBPJUu/4TR0tRr5PaU9eWVeDfBICn6XafgNC
	ql0q57zxdPBdo/efR0vRq9O6XRtgXahvy5DXEC0xTguUKcp/hAlY1dxO3Ib/+TgQ==
X-Received: by 2002:a05:6122:d12:b0:5ea:389c:520b with SMTP id 71dfb90a1353d-5ee1c3daf90mr672615e0c.8.1794402098949;
        Wed, 11 Nov 2026 05:01:38 -0800 (PST)
X-Received: by 2002:a05:6122:d12:b0:5ea:389c:520b with SMTP id 71dfb90a1353d-5ee1c3daf90mr672510e0c.8.1794402098347;
        Wed, 11 Nov 2026 05:01:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157b7a657sm947505e87.11.2026.11.11.05.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:01:37 -0800 (PST)
Date: Wed, 11 Nov 2026 15:01:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/5] of_iommu: add support for "iommu-ranges"
Message-ID: <h7j7lyl6d67xfdw3gyabfngpurumbqd6fkcvuhyi4juashcx5r@egybwhfdaonn>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
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
In-Reply-To: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX8DqyPVNeTm4j
 ghoFHURme+VIHusjlq911K2OGA5mzAdMfGCGQxAoxeX/g2Ilyq3RZg7GNK4xXvpGJTFW2OLd5Xt
 tgjH4aEo2Llwynzf73TovQHSpqqEAR0=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af46733 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ycv8Z8E-TvjlFfbjzzEA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 7yqsnN-Rpo1X3h4x6Xd4Q_cfKWALnl7u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX25rI6cFEUxS2
 9GRJhRTYQKxCCs82CJyJl5a+Qc96G5UDY2EeY4dQ9s4vxGmBNwxqLQbmaomzRKKYhx0yf6yUJmU
 w6dGWYsg+oii1V+2gkWSRkBFv0ImRVQ7YJQuj9jYmJjuqG1cI8L6j52V/0adPs0O/OsE6hRr9bo
 Ey0rsYrRugvOOTHgUhyFH/JNg9zNceH0fMVXEcxHlPfNuOZFzK6M92T47/5LggeyNaFZzhmGk5a
 8375T4noBPRyK0IftvPF3l9mZBaIW6ZY6A/IL1z0E9QevYaWM2yg7hyyJz2BKhVGI57mV6er9qm
 IHSC+425Fuk9DVLMxFEm/8NzLY+BdbwSolhXlBzLEUPK7PcXAEGi3zz36UVv140Iba+5ymuyCT1
 ATHuo1NhGBEbaQPstrthjBFASpqdF7PKWrugNhgzwpVFAHJotJH2lgWdBpxFXAUOYiYVcfrigDz
 uApercFWdlkRuiViGmg==
X-Proofpoint-ORIG-GUID: 7yqsnN-Rpo1X3h4x6Xd4Q_cfKWALnl7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110051

On Fri, Nov 06, 2026 at 10:44:23PM +0530, Vikash Garodia wrote:
> The series adds support for recently introduced property 
> "iommu-ranges". It adds the required checks to error out for cases 
> which are not following the schema definition.
> 
> Iommu-ranges was defined in schema with this PR
> https://github.com/devicetree-org/dt-schema/pull/207
> 
> The patch series is being posted as revision v6, since the patches 
> were initially part of the media series [1]. The patches are moved out 
> to get review comments from iommu reviewers, which was otherwise looking 
> as a media series. Happy to move this back to media series if anyone have 
> any concerns. 
> [1] 
> https://lore.kernel.org/linux-media/20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com/
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---

FWIW these changes are also required for the DCP display controller to
work on Qualcomm platforms...

-- 
With best wishes
Dmitry
