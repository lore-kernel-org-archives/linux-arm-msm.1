Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657070;
	b=RanUf+/vlwFvQ/8O8Ia6tF1MzwYy/8IwBt45f1roRmehrqah7qhTv17Pd/Z5e4zf3UHB
	 O2JPGjR+1Lfl30svNjyO+GERiw5qGF13ZRSM66R3Btph7sSNo8hXnlRhxONzMKEK/5WvL
	 YX2uGrlpal32Str163fzdUWv5dYoUjZjz1QcEV0Z4MAWEqXGlpYmVZI1kq7XZnycAQsh3
	 noD1SQPgVipDdca9k63XHkTbX8xpPt6Z48ABhnw614OXRHVMKUhzsafUw2xgXPA1RUhut
	 7txsFKoC9xp3j4P1Gs6OzJLwYOiau6frgMone+x/f25EmyJDXE2v7aSXJrVgp5j0oig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657070;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/dQrmyfLIGU6IqlJ99P0Tuit4U9aGRac+caYuZRRsOI=;
	b=BTdCZtVNwztkc9GZl7SV9hACIq00BlPI5nv7Gs86zIGIAZ2EkmvLYy6XqjDfOINepj/l
	 lyQV8W5/SrI/msXdLo021CctCKRBszI682Fq/8hDYd9IZAl3eU4Z52HWPtKXlcqlAgR0T
	 w2ofUQ7PXGuc1ZBp8EMsG41FEqHcoLbCaU9f3AeMg9QOwgwB9QebQOBgLUsgFfYAl032W
	 MtCSLoVC/pHvYPze6dzyfPhWXlFV8+Cj+MYUud+zebYNWV68S5IKHan+J5lgQuedl9qUm
	 wAPHQj1GZ6riP6YLYow/d9f+z9JTua8Ab6xlPHTqons6mePZKQ1yLJsFgVuw7MwvVbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U2fHYhvc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IH+cQePr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9169E606D803
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 22:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9169E606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U2fHYhvc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IH+cQePr
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6Cb3166086
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 22:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/dQrmyfLIGU
	6IqlJ99P0Tuit4U9aGRac+caYuZRRsOI=; b=U2fHYhvclVNQar4mvs4zZRqghFT
	3GhGctauPZQ9dCu+i9xuGKD4D2V1FgOa3ZwFPFjKMWc1n2x8tIMp0i8qM9zgtNVm
	+isJpKFWcb+FtQ5AUhPm0jQ8XW/ECpVmYNUiWFazbb1PZRaJu0xTtCd8hlOxlHEP
	Jvcc22jslMROjoLM1zm8x8nUnLkXVEvpcP2HZysoFc1XAs8+E4fCu8SQ9+Tpe/88
	0wcWb1wir6BijXUnmzuQz6CJU3cY3EUu3AaU2P7d0fKKz/ZrGZpAtBeZnKNLROa2
	RSQYkk2+On/QqjeNuCTe1JoaQbLMw+lqwRCIWZLs60+46P/3Mc234Q1iF/A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrk4gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 22:04:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so78766a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657068; x=1794261868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/dQrmyfLIGU6IqlJ99P0Tuit4U9aGRac+caYuZRRsOI=;
        b=IH+cQePrqgyx9xE/nW0w2N9bEH8DvY63t/2RhefQRQfcoWx610kYuJBlWs73i4k33r
         2dlLXO/kqZV1pZ/8AV9vGoaivogx5IGFAGAUnyvXk3QFbEQ4vHCL/obnKJ2W8EjiD3fw
         XChRnMN1xcGGMeuwn0pnhZGk42L9q/6LSAPVPW91S8YkV8yDM5ZpjGKz7di28Xq8zQ3C
         E/TSeoSjLadhnuUzcpQWYp+olb8XWmnG8xTrNPTIGLt0mvw2Z04OL7GRQ04QHs0kxOwg
         VNMO+/5UyBsPKvGHCxbpk4ajU18wgh7kq0l5TUcA0AJw/YTHQ8AHUkWU7bP4DzRCUlqS
         fVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657068; x=1794261868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/dQrmyfLIGU6IqlJ99P0Tuit4U9aGRac+caYuZRRsOI=;
        b=xfhbgaDDwyWlZwhPMa+9MH/V9wLWvqPTGJpUKzTKBJf3pt5ikuXHGt4F0hbhP9r2JQ
         4cEms6oUeokSVxXgaqp01U6Jr3kSjCqVBYFoX9fSJl4gabtHOmPT0sh5Ub8GFkvpmDsx
         29qdyDPUteCCTEUpwbfPyPDT0Pl1PEX/pBF6c00HKjn6pqjJO6kmBSWtNIzjIVMuLSBl
         E8/YypiCUblwWxJPcptu5P2J/1Rek9sNdqwFWwjgTL51Q8uyMeRGSfgfNT9vU+4MTMsz
         PG/HbyXrXJbQYIbKqom5I/5+FK3QO8THTKx7IQHzkG594PR88+N9KSxmUfretraEy35G
         IUdg==
X-Gm-Message-State: APuU4Z9z3g5MTBrl0WzNzSOSi7ixvBGJI6FZDlGFLDO030gYfQYcgMif
	bsp4OyRmu4geNZaQTuJP+pt99XvEzKGuzwjWA0N0yR+o7OVFtkxpIsQ5Ay/pdRLb6ck1sKysGIq
	yEns6YVp16S4AegljOraSneqtRq8Y+1nQCrSogT9Buu1uklKITFzKuNIk+BFj8ZTl1/AB
X-Gm-Gg: AYBFou1RtiLDq9SrqSJtJjz793aCAxvdw5TdUSvJSJ0v7h0Dv1nVD4IJDGKsd1Jl0lD
	nDAY3GLpMI7b6nS89stLBoCjLrSAs2Zj7c3TsffXne1pgkt0Fe4txkwQk9uM38duhapZW8gnTGc
	peoDPsukkyxXi4o3s6QI546reyMEA2d9E/JmeDoh3jH0yP1TdnVN/E5yvNuKImKogzH6YRGdfTs
	Tj8YRd8qxSIgC1Tc1Li8JI2r3hCYVdtTSf93nEC1iFFoeqZU01POto2nlKGquom0cyxd3CRjb2h
	FT3KJsbHCN6rjdBVyBYgISSJaXDvWXr8sq7YYJtQsVeI+2Ul7PMb78mBdhM3o7Ydg1Q/o9YxwZx
	4qD7bVi6pUKcpCip1mmG1YLjkrTkjBmQm7qN1xxNzEEE0LVC5S6BotXx+8iymUkR5cc0gsV4P2U
	25A3p4ah3etmRuo9JLctgxBwA=
X-Received: by 2002:a17:90b:1b0d:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3ae89776936mr6169525a91.28.1793657068124;
        Mon, 02 Nov 2026 14:04:28 -0800 (PST)
X-Received: by 2002:a17:90b:1b0d:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3ae89776936mr6169501a91.28.1793657067652;
        Mon, 02 Nov 2026 14:04:27 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1039311a91.13.2026.11.02.14.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:27 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 04/15] drm/msm/a8xx: Export slice helper
Date: Mon,  2 Nov 2026 14:02:48 -0800
Message-ID: <20261102220405.30730-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
References: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae908ec cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=eauOX4bcPKZCCnkqRxoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: SLu1PTGHKymxIKenuXr0yjRqGKYDJ5O-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfXw9W7lVJQ06LW
 b5RIdso3LctdnOhXzRY6LQxA1DX8qzfQHufrq3ksNRpBc1dlf+XAW7XiY2R6ILAJetXVKHlEopG
 qqGxbZMZROctTNN0nDqposQJq9V4HgU=
X-Proofpoint-ORIG-GUID: SLu1PTGHKymxIKenuXr0yjRqGKYDJ5O-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX6M64ZXhB50tX
 LS+p0hfULRuVr128NW09f9cq7kZGWbGQjbHGkr5zDrk8SsPDRjzamKMbns/IYVi+twlIg5DlR+X
 vsB/wM0JChhdRAUM1/ROIbCCCxrDrAdtF8NidY2980wqqx95Hyz9MX9EhcFrPNrni+s3kuo24Cr
 3eAQ6CTzY2aDrXDLSEbJDsOCSniVjkPYGhGWa+/BCuwzdDHyzNv9kkSFqh+EC7VIjGSaqHYM25h
 cHa0CDG+S1HCrZ5A6OZAjVB9MkQdBgG/u6Kfc0KzTnn5ZWdVCXEWn30bFLGXTjAiJNG22Sn6J8P
 h+4ibjNoVhRvibMVSQi3O1RC+/E7YzBBZhrX4koi+UgN4EG4aIdnd1HXrEbUHhuCp9EjGbKkbHW
 CZTfGdHRCoESpjwwzfnADhf3SNeA/COcbDbspmYqt5ipSKznnEN03Z137KieO1CFISR9cRqgDGh
 9Qzv4SDiB9PMOXZkl2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020087

Something we'll need from the gpu snapshot code.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 83c0fe39a44e..f8b9ceb588dd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -360,6 +360,7 @@ u64 a8xx_gmu_get_timestamp(struct msm_gpu *gpu);
 u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate);
 int a8xx_gpu_feature_probe(struct msm_gpu *gpu);
 void a8xx_gpu_get_slice_info(struct msm_gpu *gpu);
+u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu);
 int a8xx_hw_init(struct msm_gpu *gpu);
 irqreturn_t a8xx_irq(struct msm_gpu *gpu);
 void a8xx_llc_activate(struct a6xx_gpu *a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index f2b635497811..6b299bf1000f 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -127,7 +127,7 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
 	}
 }
 
-static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
+u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
 {
 	return ffs(a6xx_gpu->slice_mask) - 1;
 }
-- 
2.56.0

