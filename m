Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797962;
	b=oLf2CmTryjtssO+8xIkRWtz8nT4YFTbxg3tpUcoIWWVTXWksBl7JbjJY4G3zB4tROZAk
	 BGjeqS/q/WvGlDRqJcH5oqN5czkyqpRvwaV9usCZ6QgkTW9FAMnHu3zOaaSt8wh+kaeHT
	 KKfF+gjqkUOHLn3kCYnigRiMkihxPZXpTYRV9Xcy4f+D60W0eETzDqxW0mZIsuFWVqCrf
	 fHwi+26jqza6fuDXbEST+YnuO0DG0eSdP29o8qCNHvpx7SEs+dBknZg1WlQNL2bwXkSk6
	 QdeCpZnfDVS08KNCw4IFShsKADY4eY5eBG3BpZ0GGMrpwWfGiAH+qCdM532dYsYuCvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797962;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZeMHMSFZZC5kzxTACMlu2/mr/ht1FGhdzncsmsVNro8=;
	b=b4HE1H30nKABNU6ICPBq3XgY5+r8hMsXAXJY/5pxPY7hTGclvK5EnnqlrIdKpf6LoTNx
	 jz/UC+sLr1wSCj3UIe5+uhtvCHJiffGNNgOvZTAJBqmDL7HibOVr6wW/snugNsTgrjP+I
	 FiHID75Dnc8myWNxDhvgLf6N4XkvvK/5KYVTnZQFCiEiKUztlJIifOlQZ5l82gwifuz24
	 1scwDKNilr10NEwUMrpkXWLmjFTcncPZtOVD4TXXE8ALZh1GQ8SGUwjJol5b1bvMwVV2q
	 Gs0evb5bXK4AuJ2an0TAacRTOEkyyIYexdUSvDe7HR18o4e3DF4bePImpQSX0+tQpeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tf8SYeTQ;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O29SumbX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303D660A2635
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 303D660A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tf8SYeTQ;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O29SumbX
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLv1V33982646
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeMHMSFZZC5kzxTACMlu2/mr/ht1FGhdzncsmsVNro8=; b=Tf8SYeTQdKU/p1x9
	LUs2p0qlQ8PHEy4xAaf6997i6QkTGmNoIcnsOujVth0yszkij+32PGdB/q6ujVRI
	4Ffsn0/tGNlCw0T2aDzasCOBZNO9OEUm//P+/nxoRozNR1tj0bWI/mAg1otfAGuX
	Rt1bYgTK6bX+LJHoFZw9Z8Ottqt4oMa+wvQsT2F+Hd3Ulv4KimGxGiroACIN4BPt
	uPs3foOFQ0P19MgvK4h/gEVMgit6zoS+M7iGZIQh/VHzU8TD0pDcYlb+3udq6rEN
	Pd42N9R4OYymE4N9w3BllRf/GPt6UYysWgyuQNj7BCEl0Zg7lINTwGl9bhYyaN1J
	3Q9+OQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgart1dd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:26:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so94990585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797961; x=1793402761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeMHMSFZZC5kzxTACMlu2/mr/ht1FGhdzncsmsVNro8=;
        b=O29SumbXjCZFUj6sKK+EZ+IFeI/Lmieu3wKWMZsXpM6w3BJNixVXaexHWpisfH6S0h
         2eElJggX+DJ9tt1cAsFpfibaZ3rsPHmZEUJC0LHz62GGmKt+upMRqJiURxBYGpFgrVu4
         TCzQw1Y8RiqBLU5CtSCOUSGHR2ZUv7vylEhbOPZCn3M7jR3I1jh1Jl6PLK7xzSFsGMPg
         N7CjNtQDxqpv5LMAp6KNqGs0NG7xz4Bz5bZzL2XemKmyP6uiIXhxtvMgLGEMuUJH3hBc
         /3m7MhSxE0W8rbmIUiAldZwpWcsypiayfjUlcDEB93/XIEI8AwtFIjRkASumXcyL3/b6
         MmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797961; x=1793402761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeMHMSFZZC5kzxTACMlu2/mr/ht1FGhdzncsmsVNro8=;
        b=w3ldtShLHNBxu+fBH63OD63ME/hVUo8em663Ayxo6fKJvJw9hjMM6UMui00LlIoV5n
         sSocdVqsG57rdIftcVR8uSj0aMt3B40OiaAK/Bvo/QcrECPhcdnGY/VH8AgX61E/T9yO
         VViUYaXhZYkKo2c4mDFTdiDZJwWe794BGhJZCUz2x9qbEWH6bb3MzC7tSb6P2ww3fm/Q
         Ize6V250lmKzs99eJBYIUAKN5DeIzBxM7KT2Fxa2MXYf7NF3OaRic8tAbUhhDqDfwMKh
         k/cZTDiaQycYZhJi66QVHeZIXjPAKqWC0mfsKCe8J4wZ3TjNQkPjUXUFYZ36DLXt+fFS
         x6TQ==
X-Gm-Message-State: AFq9FYL1HDd5L8asFePxf9IV1K/2f/NzXXc7vLSb9phtWeMixDqF+Bwc
	WStyRM6jSCgQ8wFwz1qnP+l+6AMXEjpAP6O/XHMtqlC1sD/WhtAH06yRzsGLsvgZ3RMc3JKmrYe
	ejF6p5k9Iv1pLEmIoKGgPMomUQWPjZuHfLQU4DLpD3XPWmbgn1XCS5b9668H18gSGqklB
X-Gm-Gg: AYBFou1osUZl1jtNMkbYDQMRD45ZYegUJg+7Uw4ms5+ba4DXJpGGcqs1O1URNIGUSyv
	45M+l9EKX16wKw2JmKIGQL5wkYW+tFCWvD21+GGfKe55nTFhjAbSkCnUxiulVS7+O857aVheEOh
	zPxed58MECNxPhl84ev2iXnLZxo9HQhvV1PDCvzG2j4cISUY7p7zz9OhM9CXNQzIum2f/BuTOYA
	F5QwHKpF8oxr9K81hEgGeacfI/pXDzVcPFi2sa7mqjkH8/j1vhqh9W88v0zmZn3J1EY7fI9eXei
	cyzqyM/pK3e4U1u/pRDqwoUlB/BcvUYTlGWjtQsyUAn9XNRHBKpvUYoqTXoLDj4M+r8r0dB08yV
	ZmaCg7Q/nViC1cC2kkDRF5sU0uqwGdgELBauRwkHJQ/oBKX23dI4EyTbJjmAG4mDDeotmKoNI/P
	blFcpNCytA2PH9
X-Received: by 2002:a05:620a:3726:b0:93e:fa30:f1da with SMTP id af79cd13be357-940ef8f3bfemr86920085a.45.1792797960583;
        Fri, 23 Oct 2026 16:26:00 -0700 (PDT)
X-Received: by 2002:a05:620a:3726:b0:93e:fa30:f1da with SMTP id af79cd13be357-940ef8f3bfemr86916785a.45.1792797960036;
        Fri, 23 Oct 2026 16:26:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:25:31 +0300
Subject: [PATCH v5 10/10] drm/ci: mark pixel-format tests as passing on
 SC7180
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-fd-kms-fix-smmu-v5-10-a5b0b284aead@oss.qualcomm.com>
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=clQthlwXzRhi1W3zRpYrUTaCyBOJES7iCNAqF5m45Zo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+ztkv4NiwBFqBCDxxLRw9rvtynMFjCU0KE3s
 6VAiCiEaU6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs7QAKCRCLPIo+Aiko
 1dW8B/0bQcLFlB+5tLCLM9nYzJOPpsrZrQa9AsHn+vKjiIP2KxVZXJA/E8U3lyX0K4fD88A71Ne
 E9kRm0YSh0tOXWaewb+RZVtlzQb+1JypXYhNReacBAJFlZkklzs3jQPmLMqLuewfqbGIE0Dq5zO
 5jD/So3gHPJMKFmtjYDLbqpWOHHrlEtSvFs6OcWGiifutSPM02wZruZqmfopiC8AiLblKgJTyAM
 NAw9KO/zXitLx+OgUc3xwjMgDqBqsRXwdri111IDa06lNlsqqHsqWniYGjZK75sDpxh4XbKdqZY
 xOH2m7GELqW5Zp9CC2+a6rJqXBtawww6aoJC2OtivEv1B2f5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX3hzLkxD5RQuS
 axb5Kmbyz9yq0C+S9wNUEoKQo8wm/g1cnvQN2pperZ5UUerHWZUhUo0wbl4EXbhwfj6EglhoaIb
 M3ybDuhM+bpu0S9i5jnaRLv5e+QRiiZ5hS/YtrNydqXACPea2sGAGzhtb2MXqqJKaovnQ4bZ9sp
 lRSuFTA+kN64xfMy/TcNH8CU4+gfeBfHtUyHiCiVrFeeYoTjKygNJYgFx5UqRNc98H3iTf3Ez3i
 OfzRWqLqMl1qUuSpaivlHQogk5onB+ageS1NqBNr8O/aQjgbgUqE8SE2NBIs4suaR7TgFiNrgf7
 f1bwL5hjSH3/gx/gjfF5zeBN8feZLQOROp/uSCBOxVv6uG0ZR/aMi3W9tz/M2vQLhLL0er01jaL
 ksGuGwRW4itCCKU9MRl+jP2tRGNkaxm6QTZHOWEeZq0oozHE6T/A43ZPeJ3j7faZLcFGbnzJ2aE
 BgiKBgsWFtmrD6Dakdw==
X-Authority-Analysis: v=2.4 cv=JI+uIMKb c=1 sm=1 tr=0 ts=6adbed09 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=fLdCUpYKHvtX-iCVteYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX0gZNDlr5y2Qf
 cnzJkJn/eNyEYcj2VGTPaxdNE6nolQwMqsLHZRtZ6i5TMOIerXKN5z8repY1wPzaTsS6MkpQype
 SfVtZx42RmKIvza3LRlF4CuPSoe4Nwg=
X-Proofpoint-ORIG-GUID: B8uvv74wHjn5mrZSM7QQtegoYGaq2Rbk
X-Proofpoint-GUID: B8uvv74wHjn5mrZSM7QQtegoYGaq2Rbk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

kms_plane@pixel-format and kms_plane@pixel-format-source-clamping timed out
waiting for the first CRC once the test had set a legacy gamma LUT.  They
pass since "drm/msm/dpu: only reassign resources when the encoder is
reprogrammed", so drop them from the expected failures.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
index 2daf4ab879a9..ea3013faa37c 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
@@ -18,5 +18,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
-kms_plane@pixel-format,Fail
-kms_plane@pixel-format-source-clamping,Fail

-- 
2.47.3

