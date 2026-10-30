Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395987;
	b=5JjtvbaT7UPEI3GGcYYkP4SC4RJPyewim5abA0zEQRd4TpKZqVtS/G4Psxi6vLnHEMhS
	 DyiCPa3xeSgr2JelIY6WMa9kblzzzduax/39a8+tRWZQ6WFC1jBozZunt6fjNtwIN4FZK
	 qyyhPxkT2lkL3l0FwqjqTojpht1P3v/gBWzoBk/bbPvaKT3wkuXCYJjlbKcXNVM+g9xj6
	 VrFMqMdakq9gzqkYN9AsMXI9PkpyQHhw6D5nmFteiMVimB94zsvee4YdxChsHyVf0Qlcg
	 RLYWeXUANe86kBfxuIA3mh2Lw85kVsjupSuAm5XWAkLyH7bUKKSJc+PP4RrWWS3Xk5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395987;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=s64e3dkDh8bRM5DK2RGthae0FkYgQUX5ZSt/5PXVdcQ=;
	b=H05DWzT6e6zeJ65ev3UWe8/hcS0ZhVsH5OE8K9Fn111yXXB61x7BPXGdGuoFCst60yem
	 Xg9DKrK2qp37na8eGNAQarKpMT5qZbR1212EIkvHgM6E0J0LBF9aPklnjl73+889pJ2N1
	 h7Oo5Qx+tcnJ38VQ6NddU2QzoJD4QF7xCFIPDqQfz6RgvaJCkY3oFpYjVx/l0yvqzVgfl
	 5QRMvCt+lY3Yw6LXsBDd9/hF8V6NX2BunMmA9sluBEkHhLebV4V0LMsaPJlLeS3h+xOSI
	 P2FXnxBWWz4pIC6z7S9UXJjbP/ZKWd0o6nG75RYSYKcs0JN96MOsI+8I3oeckfTgzDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IJWHGY7U;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a2jjX+F+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFB560A2617
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EFB560A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IJWHGY7U;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a2jjX+F+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULFl5v1265253
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s64e3dkDh8b
	RM5DK2RGthae0FkYgQUX5ZSt/5PXVdcQ=; b=IJWHGY7ULHQoU7QAD34NnNEBZPc
	G+dQ23rqwp0I2FrbXe7f282DSCnH5ca3O23GKsgDecMzjxrleYDlmwpauQO4OmMS
	P0jqAl3w4ne+orXJgLY+95FrDfFRnFbwgTIT3dR1mux36URKraE0wyXU5KlVzIBK
	ubX3ibe/MG781RJeYfpNu7XwgUv3veojHTUKCI1cDXQuP8QWxsqHvJfd8jabBN2H
	qs9VJe2JxyRHUDnn8MUepPKPFOb5gCOEKimik44nQwhCIVejyYIrrAfGx4XHWmWn
	RBBkdP5x22G1W5Dh/G6AvJd5mJzPY0XrA7QJICCjmRG5iJRLD4XBRENF15g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x002hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:33:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd8b299b0abso535077a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395985; x=1794000785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s64e3dkDh8bRM5DK2RGthae0FkYgQUX5ZSt/5PXVdcQ=;
        b=a2jjX+F+800xi5hGQX+38lV7MGTGtij8RACicKAAqf0Rc8lkezt/0P648qfveTsT2f
         6FTcZpLW1B5ramLXEAjHYkyEsLNCGUolt5xfW4Ld/HX/nXocmazdQYKUbwfK1E/R2TkP
         fwsAqLUeR5FF1XkQtenYPXLYo1yeHikRz2fZCxulhNqBTZLOKEGSeZ44hVTQi3dfxW/6
         G+W0/XOPGeEKj6BpUy1yc34E/gGC0JHDuOug+71nn5wJqpUigixWJ4e/WU++QlJ1rN+s
         TqNpMLffHZmbj0EyQPZru0FVl9uoLkkOn6sXBQIvvQhst+KrV8lBJWMoFI0O1XmJVk42
         28eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395985; x=1794000785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s64e3dkDh8bRM5DK2RGthae0FkYgQUX5ZSt/5PXVdcQ=;
        b=oJ7gZoN34p0qpLqs5gqWbIVN4yQ56wVR8ctz5Z9FlER7VX0LICzLBuulkC8EU2cYem
         013CdRtsTM6JH/Mq3p0AaHWv42KhrpkJ6V/qWpCESGi7ChWJ9/a9hN32tvWBD4YrW7Lw
         JX3P7TdLaN6Z/pT3X5MVkiGXHpR5Q/ZXdH2n+rRX/+LsL4Pu/BTr37A78eCP2XkLY78k
         d8LToieZ0I9mCsw7L9yUR+xZFGdodxSvKktv9ctZ4mKK3YwMibX/r5hK8XASmkgU+Dbs
         dVvkKf6NtP66UfuvTeJgundWkZ2U9/xDpJev1RCFDkGCOHmx5ELK9xbcIRMxC3PYq/eH
         6Z/w==
X-Gm-Message-State: AFq9FYJactjwKGTIdorvc50Klt6VG6jlpkm9B75lSVwTdGe8UfDuMFKT
	aIB+QVubqR9yXkvu8npERotU/JFmxj/hobaxYoZfSy85dDinBxsnWrmxdg7A8x+LpxYKAQFl9bA
	LsdFHOXi8Z2RShpH5m16nRiz01yC/NmHey005LtPJVCjhc1TIaD4GDczH8m4ZXoSx/GB7piaU41
	dqzV4=
X-Gm-Gg: AYBFou1c0wmJwd/TEopZfE8yL1DMM2X2JE34i/6NUEzR/Gsnh6sI8MyDNHtPTvg3V7k
	V+lx6Yut7t02/ZJhbZPMTOSvUa9mFDb+rlP9YeHpwNTjO0wIEDF52WShOyXC55n3toLo6ufUJ7m
	B0woy3V6lyLwB5lpG0C3Inj23pqc1/oxoEqM6oFoMP8Hw23unAoYXRVCB+GIRcQQ5jwHm0hfnjU
	gB5+H6d5wj+0z0AaGXT5Ng323i8MV4Q+rfD70Uq2rdrHQz+il6lA2Zy0Z7RGcCxQfJxanwuuxAS
	OtovZDswIWeqHZisSDbaCvk7DHn5/vyxFBVim6l3tC0t26hRI/FYCMw+/B5BKqBxKcvEkmyjFzt
	K2EdNR6RP6K9nJzWCCCpXz2jbpyuyTc1vkht9gaUc6XzDJ3kJEehtvzL6WKGKW8F8rGqNWM+ipM
	WbrmcHtFdC7FHJoJTWn0l5mw==
X-Received: by 2002:a17:90b:3881:b0:3ad:5c64:c7a0 with SMTP id 98e67ed59e1d1-3ae89814e7dmr2877739a91.38.1793395984607;
        Fri, 30 Oct 2026 14:33:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3881:b0:3ad:5c64:c7a0 with SMTP id 98e67ed59e1d1-3ae89814e7dmr2877720a91.38.1793395984160;
        Fri, 30 Oct 2026 14:33:04 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7d5b8csm10255599a91.1.2026.10.30.14.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:33:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 6/6] drm/msm: Treat !mapped as an error
Date: Fri, 30 Oct 2026 14:32:48 -0700
Message-ID: <20261030213251.55365-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030213251.55365-1-robin.clark@oss.qualcomm.com>
References: <20261030213251.55365-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bwTU2X9E4NFEGsQbi5ompEm-_hImxotu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX7ruzMrXOv3Zi
 oPpyYi84Uc5hjw6PMuY7VkKGDOZTpWUxxCUYPR1BFeD2vnWqmRs9faaEHiKi2/T40u+QW4+ypwZ
 ujvdWDipIPR0MW2/ft2T/AwJegQF3El7SFzG0Arrs+7B1XTZ8sYE0P74TDkje9CFajyAczoSph+
 o/SsjYrUF0dnEN8bvZzZ1uSKpYJKQiyG/A8Rh2Zlefm/Qohodx071qlrd1tNdHgO3JgIFi5m3aO
 sB1yDZlKjk2v9oxmfLNHPfKgZgfDLTYbmlJQPbLYWFISzS35Oi1lcUoeujWAsFYZkX3AEkhymef
 PiP+96nsFwH+dbz++6n/LUYWHW9VvagQlyrGcS4MRZ1Md3G3xkxCn4IPaiVmXueyIgPJ8BZUQWN
 nbJEMsc9QwHODhzCa9RNRcMpL2AT8sgiGunU/qkwc+l7PzC3mofCmCDnBKgBGX5KUfRYIjDcg36
 76sGJHq4j7DvJzBPVhA==
X-Proofpoint-GUID: bwTU2X9E4NFEGsQbi5ompEm-_hImxotu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX34VaM1PUyJ6m
 F9vPp+8KQ4zdrVFMfeJFDB20/obVHYbsKbgobb9p679cYi0Cgl/zrQRa9WTnnAjnEZJ7G31JD2e
 uujw6PLMqMZruHrOIB5HHjqszEI5SzY=
X-Authority-Analysis: v=2.4 cv=FvOQbGrq c=1 sm=1 tr=0 ts=6ae50d11 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=IbsCIv0Bno-BzyZ2rGMA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

Rather than silenty mapping nothing, treat this as an error.  It should
never happen, but if it does we want to flag the VM as unusable.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index c2950d32c507..255972323f9a 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -186,6 +186,10 @@ __do_map(unsigned long pgsize_bitmap, u64 iova, struct sg_table *sgt, size_t off
 			size -= mapped;
 			len  -= mapped;
 
+			/* If nothing was mapped, consider it an ENOMEM. */
+			if (!ret && !mapped)
+				ret = -ENOMEM;
+
 			if (ret) {
 				__do_unmap(pgsize_bitmap, iova, addr - iova, arg, ops);
 				return -EINVAL;
-- 
2.56.0

