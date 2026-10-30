Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395986;
	b=4olH8aNe8oOkOVmOr29pDYLu6xjTgbQ2yc/iTzQU1HMWXxzzd/sYAVjosHtNDMlSW49U
	 BWuHgudBPeaLKmBySmaewvIgwAMDs+u5ZWMDFAXCsDUBwemH/CbTOZA7TliujmKzs42Gr
	 sySYmdgFlbjc9ueM0g+AaQ+HldaHUyr279K1XeAGp2FDhwvJO4f+gtucTTlpvBDEqAzm0
	 DbCsvrhXOUfZDGHS9yVGW0feGFIzfWQYIR8l85Nyjyx+Z8Gunw263fhQeAMjDUmv2G4Ho
	 KV5Lv4QRgldYUKjlDZYQoElMhAQRJ2TRAZ5Zbx5BNKD2lllHP7IyDsGjW3kgrp5hjAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395986;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vX8c2uJChbI30GlGQJ9D3SlnpZahwcNedt7ptpVKARc=;
	b=Y11BfpOx+6H9zDs86dNQGXp/+LC614uaH4StFgkHnevoDHQ7084ijZqkY4AwZDtqbQJ5
	 5cEYIGtAydNqmnhpOY6lR+UJrwPZUWgbY9oReN7gJiqAoytxABUZvDima/BVwSlTrjvmh
	 +mPBP/KFFAZs20kLK6za3A8Zl28lyNMxO3WdTntArq/jKxKFCkGsGW3AhynBsK5SKxPS6
	 lrjPst4lSQ2O8lINMBLQW6pSK1yZfP/ixT0hPdPs8Bo+VOmwgKvzl2zWlIsnmQ+/OCIRx
	 AGn/E1WA+uSno2gHyMhjcwwyd0jVZWxHO9VOHHRY//xnaU93gO+jXvnhpHPR3zZbimw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XTEWEyXz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NyK8g9N3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDC3606A335
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BDC3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XTEWEyXz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NyK8g9N3
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULB21Q236665
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vX8c2uJChbI
	30GlGQJ9D3SlnpZahwcNedt7ptpVKARc=; b=XTEWEyXzn7z0NWjfkjmNM5imB1P
	YgItPuSTcDuZvj0+k4zuMo6UyHmwLZoTdMW7xyUCI8ZJy/1WJeS7/fgiwj7TLIzM
	/A1dpi79Uq5PtjlketpkF6c9tJYc1cmQT3aZ8HMXk8Pjjktn+YKujcP8Hhj7zX6/
	QoTO0ntHnyDuLhmuzN6R38sOP4mUwjxfn28U/EVJwDpywRbMrY6OIqeUmCt6ZJGn
	vNuRwQU+O+xXqw+Uv3mib/IHzgIUxY8asxYu6kXW0BVS4/myj0KhvKtdP/oqY2n2
	kB6m/pgvd4c3VJsL8uyDlWK8foXbntids+d5bDcbnJSbi1um4/+yli84mnQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x004fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:33:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac76132001so861051a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395983; x=1794000783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vX8c2uJChbI30GlGQJ9D3SlnpZahwcNedt7ptpVKARc=;
        b=NyK8g9N3jsUAqxb3Eq5mMB5cGCxWhpi2x0Uf+d5YqJOuEK9H/4UT5favqopqj7SZ0U
         lk+Lkr+D4qv1d/rbvbhVk7rfOSdbliD3qqrpzjV6H0YhZ2NH/ynXmLltwNZSggxgQm57
         wJUAP9Sim1/cSvNHJb6bdVclpXHgmxzn6uQgba0NecgUVHy0NQt5s5n2o3xH3WtoAeHV
         F4IqWyqH1xVHZ1m35Pi/8rVtHmK6buuE9ftdte0hUR1sl9bSKzrn1dMYqLb4aJ6OeD3q
         RjjwVtnEpR/gMAXF7YW8DSOVwfIEz2xHurYeUD/tjhTRHPk4DHrVvlxbb5zdjMdt3qKU
         +cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395983; x=1794000783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vX8c2uJChbI30GlGQJ9D3SlnpZahwcNedt7ptpVKARc=;
        b=CaK0A8drE0By4LFjDd5FtJU/2JtsIi1QuBvRtfvEqyywlACOp7f7QyT5zQf3LaFjmo
         aCUW5yO++iFY7+yIVNADT2jLU+2EnzKPj9rYePz2O2bexVg5f06yL1Cu1Czbhw66M6Mi
         H9ha6XQwZTFLY/H9eMdCf3GLUoJZTUpM99kusnmtNmToRJoJiRoBVwbxRLE4aAaaujBI
         42A1cuYCj4uF1LxrY8Fgw7KMjgwXFyF+gBXjTsQpU41hwjdEmx74qF6Mpkb9ifYf5BxC
         38dYrs8yrg28dlT2qBh8oO151lmrbxTyyvJh/B0fqd15m2+CkVbfDHra2XAlOrQTPNk4
         81FQ==
X-Gm-Message-State: AFq9FYKoBMaPhEghuCYzdz6Bx6yooalEnrL3sifKFa+HNW7dcBvs8Nrk
	LsvXs88PJYxU8ZcsHrJo0cfmjhfpFhS1EutDVUSJfX4HQZ12RNeK0+YwQAQ1oC4ZI5c58noh+2C
	Wb5bPb95hIatnXnr0qDdrSIbu5BkNVwHdODaL/cipFSEcfR+3sSxyFbjUvnuObxJYFTer
X-Gm-Gg: AYBFou0LCvxy7VVS6kXFIABxrcvv2S9jWbryKqGUamybXBr5meybZ676SBAqKS9NmF5
	3G3Un7VhQEpmVA6sdwckXDyq1CRhyVcMovobjlJd2+yvPiB5BRVuw9/WAx5zIBabZiysjrzUKaU
	PzwLoOf8GsJbBqEX1nzPKYiU+hq2FnebWFL+t3LpjzMmyakQtG2Ze0tklOBfhG8iT2EqFxZUmek
	/50XkDKYvijf9pwq1Ych4Y2Von4b/Cda4AkG75HXMptVLcaRJNrRrfbSVATp1dgKV/3BRd3AVg4
	I6yKvjJ4WgWBoOFmk+h02UMr4U0mkGTqYF8FNbR8HnrPqZRXJ9H4O0qtc5RKH+autIhbI7fqIir
	1RxHlEsJP9p0bFWDpMrC0V/wYMwOMLvSjd9WvnL9HekoQh/fzDEg9pbBsaOgn8oGEBR6HQmn86v
	wLKxDz46eazbZa0lhBuZg7Kw==
X-Received: by 2002:a17:90b:1f8f:b0:3a4:ba6b:cc24 with SMTP id 98e67ed59e1d1-3ae89820cc1mr2657934a91.58.1793395983352;
        Fri, 30 Oct 2026 14:33:03 -0700 (PDT)
X-Received: by 2002:a17:90b:1f8f:b0:3a4:ba6b:cc24 with SMTP id 98e67ed59e1d1-3ae89820cc1mr2657914a91.58.1793395982953;
        Fri, 30 Oct 2026 14:33:02 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9583c1sm10544978a91.10.2026.10.30.14.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:33:02 -0700 (PDT)
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
Subject: [PATCH v4 5/6] drm/msm: Convert map helper to use dma-address
Date: Fri, 30 Oct 2026 14:32:47 -0700
Message-ID: <20261030213251.55365-6-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfXx7EaNhlSbfei
 JC5bvr66cOs+m+mxdd4+5n1Bk+DTPcwAxSl9r5u5xz3tntvDcJiJdOuS6cFQXucrhaUsbiSoZZ7
 UT4WWgNL5Smkha2edYGQy4L2e62/kCSTO9Ioz2g/+WnF1y+1/wGISNkyu5BSsZn4jIOzp1JfO5B
 4LR2NqrEuzcoHCtMsp2G4dP2C7ya10EmuXwoK7Ukbvo75/dhAVebOfu1o4LOWmubxDRi1a/+yqP
 r/NxcD0iXXUKRoB5uM5ar/T0pHTw1p3g0yLqkcaWpeVtNJeFqU196BU+W6dCPmFNGmrkzlW8KgH
 3VDgPNSzkrFPtmCj2ajh7jujpmPdpYqmwJmUYkmzpqKj42KDV9wSPlvohprZG1DbfF+2Uuof073
 tLC0TJx9sB4aWN5cVih6sFHI6lvNmXYEPBY4lCsp+5VLBWkfyRvSKDVKSsQE7RYMSpVM3bGiju3
 OcQXoczt6T8YX7NhoQQ==
X-Proofpoint-GUID: dyBupshjs6VIC9uo-os_6FrVlUGhFKqM
X-Authority-Analysis: v=2.4 cv=FcSiV5+6 c=1 sm=1 tr=0 ts=6ae50d10 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=I_bc3XnsTyL_mMZFCHAA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: dyBupshjs6VIC9uo-os_6FrVlUGhFKqM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX0Mr+N3Yx4NNe
 2ZhxEC3kf0kp9Yn4FBlUAKAv6Z9++SdunD1LhpyocqYUnbJun+4pwwyDGFZvoLJ6eAalcO+l1I5
 B7edqmR8TtUcayXTjQ3KPavbx8ky8C4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

Now that we have everything unified in one path, switch over to using
dma addresses for setting up the mapping.  This avoids issues with
CONFIG_DMABUF_DEBUG stripping the pages from the sgt.

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 479e5450a4dc..c2950d32c507 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -153,9 +153,9 @@ __do_map(unsigned long pgsize_bitmap, u64 iova, struct sg_table *sgt, size_t off
 	u64 addr = iova;
 	unsigned int i;
 
-	for_each_sgtable_sg (sgt, sg, i) {
-		size_t size = sg->length;
-		phys_addr_t phys = sg_phys(sg);
+	for_each_sgtable_dma_sg (sgt, sg, i) {
+		size_t size = sg_dma_len(sg);
+		phys_addr_t phys = sg_dma_address(sg);
 
 		if (!len)
 			break;
-- 
2.56.0

