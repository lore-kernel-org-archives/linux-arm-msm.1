Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AA443304B
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978324; cv=none; b=HVRakioTuRNWZ+6jQsfXET5RRsPu465E9Q2eMjNdq/4I7Gg1NztS7vBK8TLQk42xObYo2/twNHnck4nw/4kKh10Jh8XctAMeceOVjhrHdLs3UTjxVU9i1j2LH/Em37TMIUxZSV1/wxes1f2RPJarNBhjP1XsdafYxw6ino95dd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978324; c=relaxed/simple;
	bh=hv6VVt9whNtlHG/YPurYOIIccQeVJr9XxbDW/ZaPg1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsneIJq74QfHnnPYh7QYyxdT+0Eel9czQ7GsARBMSJDXJMJGYP5vooLWtHo6H7JP67Xsh5AbHoPuMpo9qcgYQ6q5I/RruxnUnZ3YV4krri4xqUPKx/qswFTZF4bhXdZltT+KIHAGf8J+dUonLeyUCjZVAGnkTPHrU8CrfHdX9do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owNShZqm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LMYpC0bx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owNShZqm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LMYpC0bx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79rZ11624318
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=16f1pSPll4Ie7DhW8oY4ccee
	3J5/JdFyisY9FHHi6Aw=; b=owNShZqmzAmcVUGC9uRxPen5rY6jSWOnuWyXKzsE
	9K8PGrZCO2tazZMqJtUSS08LkCUnai+WW2PwGqfz3wj7l1b8QPzD9WUccQKntN34
	pXya7HU+ZDuuIbTl+Lt37JS08YN4a0riIYUvr6kTr1tAIQPFeG7JDYN8MwrO0RW8
	FrSIfNkokOgbQlMmUvlbJ7PxsObDusQTmjaoPslbzxNDfOLTJ3x8LiHtgx4BMbHA
	GQvrCMrSBHhWV9lUZvmK2d/pgvL37h3S8vPAvDA6F4T3dbJ6yRNc/smM4C67igHX
	Zu9NZDOAJl4gIxMjApWylB3TYNT8N3UdnZ9xpnjlEWSbPg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wsb6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:12:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9105cf082f7so57098876d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 01:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789978321; x=1790583121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=16f1pSPll4Ie7DhW8oY4ccee3J5/JdFyisY9FHHi6Aw=;
        b=LMYpC0bxvf88n5EeBMfmvD9Vhg5TPxbqPskQfRYesl9YMGwb8g2NcEJWsjzeb8TNWt
         UN1AztYYcHlTgNzTDNYdfhhPdr0nqjsPdGonT7+yrv0LpU5sPIfaomGTBTRavTd4CaWJ
         Nt3MJ3BF4zXO2bePjViCtaASe+zJPOwMQ2559n2uOeN13wQ0ryUrtAeKKRMhFVyIq0Ag
         sf+6AuL9QHx77tJubm/JT+cGpcf+3SvDWNWtoepmn2F85EjTgnQbmjSok4i2VtrWIBb2
         28ElHcEdHGOFJf/1q2MBEF7ai5C3SfjFKvUjxe6LuLHcx1QoxXJzwfTmvBMFImvIFp/R
         Ocng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978321; x=1790583121;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=16f1pSPll4Ie7DhW8oY4ccee3J5/JdFyisY9FHHi6Aw=;
        b=ujagnMRwXsuJVHH2kPggubdbSaAx+jFJBPLVJHO+Ijkcq9WBJe4PuIhlTz2M20VfGz
         13ZoJlgkegC/88Q9cQ88lBJmpPY/l+6kM+T9kesFfwM6bFutp9YHQrYI5NqytmGJKzbm
         XtLW8ozg9xXJ1ohVVbUtKlhX6T8RhfmGbeJiN35lcbKLxhtcNJT6i1wYVgqjbwZgP7Yp
         d5EeXkwgTozQQceDKj+0ZjmRmKfDfR+Jsle6nMtDNL8/J0B2bQQkO7O+/NK7WJTAVm9e
         SuIGOw3EcaGxz6CPMPgMMmV34Xb+OaUdpxLtHxX57MuBhpeBDVgiQVEhKTZQq/RmVALq
         Hgdg==
X-Forwarded-Encrypted: i=1; AKwUvBw78JwRH+fXmXYjF/cpOiWDBSzBGjdSFmg5AX6FR2V8xlVlX7c4hBF+gfAK0mBN7NIcwMpbI3Si86xuDo1u@vger.kernel.org
X-Gm-Message-State: AFuF++kR4t61XSRJ9uFvzyX5bm1aGNzsQrkkpayP4McwqoCyfQU/oTAZ
	veQ/oIPMmzkUBQhR7R3Oro6vkT3PLehMm9rs6G/jnBbwEq1mjtZ+HOQJ6BLcXyKkbfVmljZaT+j
	lp7VVjjbtIvZpDA8JyqeU/hB2jXtPfsr4o7Q3GSQXWrnsokymXbYBMRHs582jKeUYS+xC
X-Gm-Gg: AYBFou32kK3krPTiQLKk7fnCmRcp02Fz302YqwZEwwH33m5WGVsddHPzMiwpbtiQd5l
	NA7kzO0U8r0crBTgH/x5qNIWNBCE+Fkno9rGzvEXORk2CFryxaXTZNINzpFq6vsisyLWgKWJSWg
	4cLg2Hne/zxfPHjA6IdFLfmV+iiZXnQT/Peu+maIg2e+hfqu/6kFf4zjif+86E71qRfBp2WavEQ
	sFKDUkvdnkrsqHqeGxIwhAnGnq8b6AJW1ZNgBfg/mhTMCBuQBaNxCjVwbslslH1upmwVEg98YWh
	6O/UQMebmFxvnE/g+JlYRkiITr+rbayCXtMbY3T+YFMnWSv5b4gxzJf6vRsqmznmnS26ox23DWb
	l2NPN1/iuJomSh6Y=
X-Received: by 2002:a05:620a:c47:b0:92e:7d53:8e8d with SMTP id af79cd13be357-93bf557a327mr866680485a.27.1789978321301;
        Mon, 21 Sep 2026 01:12:01 -0700 (PDT)
X-Received: by 2002:a05:620a:c47:b0:92e:7d53:8e8d with SMTP id af79cd13be357-93bf557a327mr866677485a.27.1789978320794;
        Mon, 21 Sep 2026 01:12:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm581367415e9.4.2026.09.21.01.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:11:59 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:11:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc
 SMMU mappings
Message-ID: <wr5s2uw2i6tdzmm5v26uzq3gdyttynqzmkferakol5m3oj2uw4@zpedm544t7sm>
References: <20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExNiBTYWx0ZWRfX3e86zSMVlYaf
 9RpzDRdbaC4Np/XmloZthXxRbWcYWL+xjSkLHF3xRJGgciAjkZNoFglnbsR3Rxs+ZTNHrQK0wrv
 v0063PvSsND06a/uTq8b1Gyit341hvMe+hJZzjzUgRmpDMbHJPM9nWVTYshnGW7bj2PGI6p5Eg7
 KJZXgtbmmwD6nI2Ixt83nKLG8ErZlvc9KMY8OH9bTVhueS3P5L6YYxe7b9M8oM3v7jjYJrWScOb
 am0IGyMba1xZTcm6dkMsnE52Mvie6JXVw8gHvvI9EPCq0JmoG0ErS2Bd/Xz/qYIzr9v3GjkbPN7
 8bev0CHqpeQ+4Aj4oCbFm9/PVtnQOq5od8fbPL2QN3/4fLbt+rIR5WAmK6bMT6yKe2Ir0urnrXf
 YA/n+LnaHQ3xCqA9MvcLLgF5ZhrbSW/ERjQ0t4WBUMxvBL/YJH9iAcEtCUYIxnJpxvAjriWx+Gg
 O0GqH+Ngq8O6RZM61fQ==
X-Proofpoint-ORIG-GUID: THdGLrGmvAwuzeBbjKuJMvzvbAjIUyJQ
X-Proofpoint-GUID: THdGLrGmvAwuzeBbjKuJMvzvbAjIUyJQ
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab0e6d2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XreJF-S6XE7m8f1k5BYA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExNiBTYWx0ZWRfX902yOYpIFgAe
 H3BaS/RcjSm4TD2VMQUtFzBaHImFgheBm/L9eu9hbyJj+F8qBfGI1xhV3SK1SsuMCA1esF2sEBh
 3gmxXSh9pa5xrvXDQol1yW/9MkcnBtE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210116

On 26-09-18 18:04:17, Komal Bajaj wrote:
> Shikra boards currently boot Linux under a hypervisor, where the
> remote processor firmware IOMMU streams are managed by the hypervisor.
> When booting Linux directly at EL2 without the hypervisor, the IOMMU
> is instead managed by the consumer of this DeviceTree, so the firmware
> streams for each remote processor need to be described explicitly.
> 
> Add an EL2-specific DT overlay and apply it to all Shikra EVK variants
> devices to produce an -el2.dtb alongside the "normal" dtb.
> 
> Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
