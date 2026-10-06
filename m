Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669AE399CF0
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 06:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269717; cv=none; b=gShlnRb+35gMhWYj3eix27GOcbYbQI0/jZEVWP9F09ksfYLZpUAKhYHg2ZZBydV9eNLxJvora7f06g/ZSHoQKNrexqbIihCBTr6PycMQw+LNl5/AnHdrgPkcOOdUKfhTxmuFFCJEGVjbWuQvbQGSxKHvTRcKuOkQ8NZ1JwJa0P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269717; c=relaxed/simple;
	bh=jlYwXoxgexyCObwo6HYXAQCbuSyCB0EIHdMBav6GINo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hcu2MrARTeLmQsIlEefpHyXu2oRFvQINuVYTQqefwaxirIrpArgcEMhcBvdbNwwQNY0UOA8HceK6A+9/ot/QEWK1kIUuSYHYrzjX+XQ3qAXlRn1+odqt/Va1Ig+4QE8k7fUFOk8D0fpoHRk5mTkZ4PcSWIoyWHgymO8uM8hCl3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7X+CnpF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKRVCLm3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7X+CnpF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gKRVCLm3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966e9Ln4103509
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 06:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sbn3DjeD0b28+scrBbrQHJZ8dt/yHM5fg8UpcUfPY8A=; b=B7X+CnpFMN2kF6O4
	2LuaNFhGeQdGse7uwpFrdvs+okvMGfOYi/qOHGpdv69pcgAgZS78ZdMtb4gK6go+
	664uyhvbbfRBULAIg6ojlU4hjZKjnnuA2raYkcF1Z5pWdoJJAFtrb8ZzDoW7d0ck
	BnlKEj9UpzgrWQ34V2AfdY35PD9esRKMD+vF2Vgxw3A9KFOTveA9WiY3TnS097Hc
	w55ev774PB2AMt3kCf2hiH6NU1+cvRhBMDH/cHJav8wNfqc8+DZlgvN//5D0CCrK
	AdLps5Cw3FN/j/Ybv8fKgtOSh+JZUaEZ7YTjwim0sIZtftfM8PHeElOoj0tRT6Ar
	+xBqUg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr0ad39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 06:55:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c039041433so2465350137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 23:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791269713; x=1791874513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sbn3DjeD0b28+scrBbrQHJZ8dt/yHM5fg8UpcUfPY8A=;
        b=gKRVCLm37F+cO0ps9vN+9XMp4e/tD8a6isALmQayTIqlghyK+t3FL9y6yxfZdkNRGi
         x4gEh81wZaat3UQv7ajh2rnRP2ID/0pCysP61IQdQFZ8Lg4jbDwN+NNGPZ8Nt1aI17w4
         y6PS3t4z/B+3UL0KRrSkf7eX+EPH9VHonhLh7vfhYNdi/M7T5I3+FhqYFE1Cmr590kVQ
         Jrx9GM8UOBzYspoMdhhXbW43yKSIGj5AInxq6po8X2EHXLBgyvH+wqVCc3pOPPfHbRXb
         4MLutI7xHcf6Pxn8ncES+mE4vqyaoDMsjCFF5rgzm2w4u1Tm+qdDICtYB9h7WAUWWfDX
         HFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269713; x=1791874513;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sbn3DjeD0b28+scrBbrQHJZ8dt/yHM5fg8UpcUfPY8A=;
        b=PZH65ZDiNSo+skWukOAG6asVIwxpVnCD8EDqfukh7r4oSBYARC6Xa7EQRj0zFl1wjd
         5P2Il+I7/xa+iHC+ilY9qQneLjTz9XzW24Exgn+GQppcUzJTw+qK/HsOtnBAp/jnLOc/
         Szt0G1EIvoORO/E0Ud/pQoeHHMT5sIkDRcWq16ql9XaJXPelwW2vKqV2ugQuw7/WyO6u
         t2ugNKFW1rZ03m2R5gCpTO6hXr7tNBYrKBYlfeievsDYbgGefTCIFfqoSHzneCsjrpjd
         Q4rLW22ImDxx+LzXc32s3v30UEyQ/1TCm0FZ9TRjoHsdhxGDRkgNWce+xx52QORpm7Q5
         2CHw==
X-Forwarded-Encrypted: i=1; AKwUvBz4yIBCuPet34ZZo7YqkXEgfKdz/mfvo8Md2TA4rr9kyDL8nwTSFlfPGV6SNaMMFWsXCeFgqhTUMA57gVYY@vger.kernel.org
X-Gm-Message-State: AFq9FYIwV+EJQ0v0Z7G8FrBKOM9TIghmqiA7DBsmyOPsh7c9SLlEFK56
	S8xLtHEwQAD+Xp3ozwZpgqlApuiiSv+QhF43E8lKLSOnDrTlUvYJJVGXqjiGAokg/uZXytglEif
	C2ROxPCMJkUiyYVAEHVFr9lQhFwromIV2Y8LH8WcKaK/8klwm5fDuvt2xd97/G+ake1RX
X-Gm-Gg: AYBFou377FEZM5eyQjQsS9pM1Mnm5zKOeg/doNU1rBUt9bGRAFiIxhwZb0SYZnG5zrJ
	4tcbneuqgGczPFt/jLOan44y0cZUJlTPm4UBanR+Jht+mtQBDBhAd+yqhfMS/Xg+KzSHGcGZZDR
	a43DaVxZPo8a7RjkjGhB0WwxOs0txV3LT1DqG4aI5gdtWbf3hfGm4IgJlOGRAdjmrjZ325y9vjY
	ZlUY7FioXr2mHEocZMTzbRyQ0ubXhkU/eDROsZW4Telk6YjRpI8GnJ6rpmIcKejBsPRTLhdNb6N
	IZUOWlstjML4JjikVnhNQKkFi/1+mojybgbAy4am+oqdLxliC8caZEO2uOEtPaB6liJD20ABYPZ
	9dUlKbQGoVvtYH+PIbBGoxxeWQxjZsY1mA3wjbZGBQSzUGXFEWyko4r+UYnAVSnZfq82XnHulxn
	sBGmyNzN1Us+nH
X-Received: by 2002:a05:6102:dd1:b0:7c2:14fe:33cc with SMTP id ada2fe7eead31-7c87c945cb2mr82079137.31.1791269712516;
        Mon, 05 Oct 2026 23:55:12 -0700 (PDT)
X-Received: by 2002:a05:6102:dd1:b0:7c2:14fe:33cc with SMTP id ada2fe7eead31-7c87c945cb2mr82051137.31.1791269711089;
        Mon, 05 Oct 2026 23:55:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303fabsm52162651fa.21.2026.10.05.23.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:55:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org,
        Vignesh Raman <vignesh.raman@collabora.com>
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
        simona.vetter@ffwll.ch, lumag@kernel.org, robin.clark@oss.qualcomm.com,
        valentine.burley@collabora.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/2] drm/ci: retire limozeen job and add wormdingler-rev1-boe
Date: Tue,  6 Oct 2026 09:55:05 +0300
Message-ID: <179126968605.1110179.12812564062301444314.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616115410.325837-1-vignesh.raman@collabora.com>
References: <20260616115410.325837-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfX4UGoHYILYRF9
 7baKEBCuicsBzjJcQRvDZgsWRz0t4ZLdDT3qkOZ4wWJoe/69B4tvqqsFelbKsyAyhZgsQYOv5W1
 u+i51+IrHx+MSSeAlYJgMFxETai/aB/rhdcPPI/roh2e3yWnOk8eZ2MWTuxXC7OYf77a/ZcU67M
 xF8Aefic23QV3JOvSv3wpdhvigZ1direPRtk5UACB0cF95Aey9Lqo2baNrUOOHMclTmxKv6DW8L
 ZfqkATEKZWcq0LOT6SrbRvKfe4WKBzASn59WHd0MbF/p//U8Nu6/P0F2tzEpN0cdUpkhAqFHKyH
 mZSUH5Pay3GXhMZD5+ncXQ/lJ7fzpdT5CaxxBl8tOCg5QuuqZzm9xfywKZK4AM6AT2wAVdp2ifp
 SRjHaCw29gr8VhmGLFeQVp70V1xu+iqSPlHwEUI3XqYOAfVXzW+9ahgXoLTNOS5eZu5J3JYphnV
 PPACtxNeRk/yUw/Odag==
X-Proofpoint-GUID: y0JgR-7PxNSxd6Sl6sbiqjD4Y8Et0jND
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfXwD0hEaAn+AUt
 nh8n+GXJW5kyq3/6154WGvAiFnPtgW0VMX2M6kJMEBuZ6UDvULgXPfbWWz84sjkO5Khv8pp+rhg
 ASDv2ujntIm29KW0UUGhTbx3Ysydj9g=
X-Proofpoint-ORIG-GUID: y0JgR-7PxNSxd6Sl6sbiqjD4Y8Et0jND
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac49b51 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=fbh3NUXcjvyNh3hXOmsA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060027

On Tue, 16 Jun 2026 17:24:03 +0530, Vignesh Raman wrote:
> This series updates CI coverage for trogdor-based sc7180 devices by,
> 
> - Removing sc7180-trogdor-lazor-limozeen job, as most devices in the LAVA lab
>   have been experiencing stability issues.
> - Adding a new sc7180-trogdor-wormdingler-rev1-boe job.
> 
> MR: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/221
> Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/pipelines/1687201
> 
> [...]

Applied to msm-next, thanks!

[1/2] drm/ci: Remove sc7180-trogdor-lazor-limozeen job
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ca9ee204e12e

Best regards,
-- 
With best wishes
Dmitry


