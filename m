Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793391231;
	b=1YpMIXWr+bXoILT3SO/UayVR/5vJGCkZvk1HqcoQjA+dvbVZtsKOAiCZ9zWPJhrYVaaM
	 A8WqZ78n9vHZiU8GZqq803XggLAbvoSHOtt9UlxD8KVOWTEQ86KpUdE34gf1qhVc+qjJI
	 eP3klrOP6r/OQMpSTS+fgX4ph1NHbT1W1pBAOO1xVFnrqtERN/zorggzmTKGfFJPGVfIc
	 U3L4rVY2W/RxSJTQ2TsFO9crScspaWvs+c4NZDeSidbG2epb+3ipMu3ufzofzNZ8ee8sN
	 72m69sppg3fU+PU+lUrbm6x7LadE/QMlArtZCM0cx7ysOMfwuW0iX23ZZ1ZYOAJ9JhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793391231;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HA1eqb/XMMKqnq98MchSvo7KllgtgAWstr/4IblL2f4=;
	b=hQbMfXAFJ/NJqzt0ScBV7KleF8rYTIEQmWbzh5cmdcx26hTptOzo1jmlogBpcGATCv92
	 x4kztJM4QHnLwTrxwojyw40tQd4oU5T2WKp1HBEgfikwbZe/zXhX4lLuhNTS/8eokSwaJ
	 qZ2zRASok5nBZGJVL8bUhXzuCi5MoeXdL7WNgv0EQLRhpA8uBPadi9C/txFQOGZGMlD/r
	 r/GCfdQiedNkN0wbN+uHAzTmJIhwwZaMDnsDm8opZnTii/IwD7NNLrrYA5TeXLc17K5an
	 2c4otqEtFHo6MDJdOvfu+wfr1qoIy9R6CQC5JZ1FL97qKcO9dT03Ebb9XEkofboUVhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lkgSY1M8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kx2Mtaut;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AA7606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 20:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24AA7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lkgSY1M8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kx2Mtaut
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIhTYq941865
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 20:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HA1eqb/XMMKqnq98MchSvo
	7KllgtgAWstr/4IblL2f4=; b=lkgSY1M8cPxKpiTP/XBWmg2OyBpx5lmPo6d6fk
	gWV3HBZLnpGUSj6z2Ma27dg8OF9gpW3F1OA8GpccA5GXswYYk6JiJVERpKsTGr7i
	VQLAGCuKsRm1NJLoqXasC8nibNT/sRbTv9cfw/twGk7dBlXHSqodkshRMmQygExU
	W0jevctbtKQd0gxeOUga0qkgkIM0kG4NUOOLptUR8GFjUNO3jcwRuSgEm6pcGad/
	wWVEjUvHwdD/hpjPxBlYLF6jGbIykPpy0StL4CzJWwGD9bTP4INNw64amc6aAzwJ
	X6nAq79kZdiUMyFj5TMejR2yI4uRPOpDi1t+/cbVQbjhpxqg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0s388pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 20:13:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3692c5b061bso2905251eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793391229; x=1793996029; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HA1eqb/XMMKqnq98MchSvo7KllgtgAWstr/4IblL2f4=;
        b=Kx2MtautUC4jaOyaoFBr9/xxlnrhX71qvEwTn49khVC41cuNtusxIw6eiPsVxH2Oc6
         hFyomWVMHSE39z+obBTL/5oRvdpNo+O16RM2tsbQMb2K9G/fAV1Jq1Rkb8wWM2FBZrFQ
         IwZTb/vgZJMLiqqGm/fRWcT75AAJzIMdWlrJ1k+S/m4g0czXIHw8ZlpyFBhQaufwIGCg
         S30ZcIyrNn9RJrCXVaVX+iuO6Zo5kuUx1hAHeQFoH3Ee4jlfomvHCdAK5yxyybABRJb0
         IP8Ltl54/PCPWug+qNCbmGNYPtK8i9gCYzhoAVbmnIBJKolLxH2i7yr/QrRnbeddNW74
         86uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793391229; x=1793996029;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HA1eqb/XMMKqnq98MchSvo7KllgtgAWstr/4IblL2f4=;
        b=tOQhvCdpoqyQljusJJwET4jgV+XZ8DyH5r0OmjroLqyrX70q9ezcLV1ca64HOFGgwC
         BlhwhjMSYfmLCsHGPy4C7um3+od8/SCQnUfwab4IsOjv2j1m+lcJ4XCYZzIBlZ0dgBw6
         J5x1fkvT56lrHIEIav9C37rNGE6w98isNbkW66mRs66fj3k5pO84+e6j+zDBD0BAifcf
         y+TAKSZLDlCmsW86dZ0CaeNFDP1U4mdOt6vvKHK+52OcFUoViruDNRX/56qmZzG1oIgX
         Bjnee5qJvtMXQetsLi+crFSIuqiKGvY2KCNRqtGMdsSckjrjrZDdz3yTF0TP1o9R0IAe
         1VBQ==
X-Forwarded-Encrypted: i=1; AKwUvByMCWeSIZPHzlR6TeJATeKRLrZh6DZDMdXKmeADtsF3VT3xEne1RIVp91fZD/nxHWBzu1B2g0l0lG1WuVF+@vger.kernel.org
X-Gm-Message-State: AFq9FYLUx+eJZ7Tx/2MGZdFlwXL25fYRI2VoXVcMgcJDoZNGUGi2GsmU
	VcXYP9Xd+ZmuAadW8dqQF4Oe48u3kpzJ7HBe5gWMTHAB414PwdAGVgQwV9tXOJ4zQydcdkNLtov
	3UTDA5MaQ5ZvgfaYFAeF+N9nhPJZCKZ59f3ISuSV2AYOwkAVYlzSRwuMB7ELDVVUsUVlN
X-Gm-Gg: AYBFou0AbJSjaGSrKI4Jnjk8hXosc/ry8IJF3uz9lk1l/atjP1pcOlkdom/RsWVJieg
	eJmgZXkcL0vEeYNBn6/IpQofypwnxVUXwyafTdrhvRBLwiQ0aUb1ahdYw8yaok8GAuaOlG+tOLe
	cgFZ3ICVUxP7lmRFPJRIS66Tc/qyzQ8tVnetCdVu80NO4pXpQNyQF8nY8YAC1iBLOBAZjbj2QzP
	qRmRo8Hn24dBJLiGE62yf3Yk1vKqFckvBniS9Cc5fVTbzaC34TKIeR7Wys8J7E5MJ/jI3UvJ28A
	HMfV3TBmLw7ZkslgRnKXrOAkBNrQ2xf5pg6JSyxtQUZSSQpxGuuM2kaoIxgbYAsXxtEdkSZkniO
	zzzIHPl9g4/vARWOC8F+9H58k4EsvoKgB8Fl07l4X6N/dcfkbHyy28QcuyjFyePcfgLCu9GRyab
	wE6eHEfik=
X-Received: by 2002:a05:7300:3b1a:b0:351:52ec:60ee with SMTP id 5a478bee46e88-36a423f04b7mr7266625eec.28.1793391229252;
        Fri, 30 Oct 2026 13:13:49 -0700 (PDT)
X-Received: by 2002:a05:7300:3b1a:b0:351:52ec:60ee with SMTP id 5a478bee46e88-36a423f04b7mr7266584eec.28.1793391228573;
        Fri, 30 Oct 2026 13:13:48 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm10830527eec.15.2026.10.30.13.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:13:47 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 01:43:06 +0530
Subject: [PATCH] media: iris: Fix encoder reference buffer size calculation
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
Message-Id: <20261031-fix_enc_ref_buf_calc-v1-1-54dcba5977a8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFH65GoC/yXM4QpFQBCG4VvR/LY1bCi3Im2MWUZa2j1OSu7d4
 ufT1/eeENgLB6iTEzz/JcjqIrI0AZo6N7KSIRpyzMsMNSorh2FHxrM1/W4NdQspQq50oSsstYV
 43eIqx5tt2s9h72em39OC67oBln8WgHgAAAA=
X-Change-ID: 20261030-fix_enc_ref_buf_calc-c0e73537063f
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793391224; l=1534;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=FkrOlZDI4iemUsKsTYD08B3bK3zXEhsXGUqFdQMVOME=;
 b=TeQZNyEQxtWmQVIiYDHCHhn6k+6czHWhBNKa6y7Pk2TgVsh5QA6cnRpt3JP8gkvh+MGsiolWL
 wri65eXtzUgDLxHavH6m6oTKKG+NjbdN1+4pILk+k4WDVS9rh6Q4Jz7
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MCBTYWx0ZWRfX4CcYfTQeLAFT
 Li6UnJI+BaVqUK75kYqNwsfK7mNttfOqVuvH9IyEjuxgP3Jlm+sOjnxeYx7RGMYyjRPwCWkiyXN
 pUuKM5QJ7riNwoiA83DCDodotTZu8h22HE0MIEaQz/YRbiA6MX4x9sDaaY2yVSha+YwJ5dsXOS5
 b7nfd2sxf/mOjwRtlQQTdPSw1UONQMJFVzRDHgGySn+xBFjKT+eESTkHvOw8NNOmgwSMxMdtkdQ
 scKsxtxExrVKyAnxJGOF0DPZ04ZJ1VtL0CMb40NjE4dMpDsB6xW69MHJprBKVOMkNPDIa2h+nyI
 2PzTMZnTqB9Mw3XEzn2WFoAzw1pGOQKWiDWjeejtyGG9nuPqa9tiaOl7zJ65u4ypRzuhrykIDy9
 ci5gmjHEEWRVfuCS6FsvIdWwGBCKLeeYhhXp9K+Y0C4Anbll1M26rDmZL6WJ6yPXRM7tZCAPGUj
 di4TjSwJDEkx7XjZeoA==
X-Proofpoint-GUID: uvnipSXA2RvWo13rOJ-qaSn2beqIDyxB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MCBTYWx0ZWRfX55EpYGcPhyzN
 aTKNWvn5pFBn8BXbX5B31f8wSKJdRJ3dHIePayOgus4TfuAh+rX5Fd6sIGXPOKB6//h/nd54Pr1
 KwJN5VaF+G0TqZU63Lb3UTXBbz5H4U8=
X-Proofpoint-ORIG-GUID: uvnipSXA2RvWo13rOJ-qaSn2beqIDyxB
X-Authority-Analysis: v=2.4 cv=XMul2ghE c=1 sm=1 tr=0 ts=6ae4fa7e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=55WMKUh_GWMeySVVs5YA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300080

For frame widths that are not multiples of 128, such as 864, the
encoder reference buffer size is underestimated. As a result, the
firmware reports a session error when starting the encode session.

The encoder requires the reference buffer width to be aligned to 128,
but the current calculation aligns it to only 32. Align the width to
128 when calculating the reference buffer size.

Fixes: 61528e86687e ("media: iris: Allocate and queue internal buffers for encoder video device")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index a8170e5fa9e6..2eaa2218f6a4 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -1517,7 +1517,7 @@ u32 size_enc_ref_buffer(u32 frame_width, u32 frame_height)
 {
 	u32 u_chroma_buffer_height = ALIGN(frame_height >> 1, 32);
 	u32 u_buffer_height = ALIGN(frame_height, 32);
-	u32 u_buffer_width = ALIGN(frame_width, 32);
+	u32 u_buffer_width = ALIGN(frame_width, 128);
 
 	return (u_buffer_height + u_chroma_buffer_height) * u_buffer_width;
 }

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261030-fix_enc_ref_buf_calc-c0e73537063f

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

