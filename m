Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6A439FCCC
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047498; cv=none; b=TiLqVT3hudW9ZP+gersX20THBpBQ+s43XL4WJkL5FBsD21HMMzbmDJ9Uws5jPVy4MmSfOQFllmdRHr6VF1HiCgYzW1cT+S+zbkVyA8XdXUrSTI9KWBF47d3tnjVjbtyunArczfVc/crRhQSELDvUpw5bIvdikw933DfTQvyTWKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047498; c=relaxed/simple;
	bh=KGqJvyschyivMcCpwVaFi8h8Gh2XUT/8AidhRo6fonE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UniToVaI0c0JDACnna38XUaratEh6Ua/9yND4hM9BP1mfpT3z6c1D2Trg3a1W3NwOJEFHbV1OCsszezzHAswfXTSfzG7XHH2uL0gmtcQpv8DSJgsp11W5PrTK9cJrF56X0J6sIa6zwSeq7tIRXHdqi5Q9qPZQZnMoqo9mdFeDgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ejwvETQE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e4T9rOxT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ejwvETQE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e4T9rOxT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M1B8aw2174424
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QdSFLnOc1c4KMeMBQmdCIS
	7pmnYBgQXqRrl5gflD2tc=; b=ejwvETQEcG6lD6lqkE9MnqqiNpyWc3E1moI/hc
	aYuGPuIHoDwITF/yZegYgDZemxkG72TeWQVD/R3w5rOVQn94pWclNlI8RPpomenL
	cVsRKD1K0+K1yh16du3bfGfkopmxSmO1r/pHv7go7IA7iKFfF6de+wL+t9iLpdde
	n8alevDYu92J8rGlnW2YktEb1JltiRB9J05eBPpOWEwfgl5Q/m4Uy+FZ/VqFhFcA
	evzWrLWMeDPysB2Wuyv1M1yZvEcej7BlhlFdaw/IzBfKYUuUrrG8GyvXFT0y8ZKn
	6HDX7TCtnCIV8rJZncJI4iL+fmrV3Mu1gsaXXenE464hGUMg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsq8db9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:24:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso2986780a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 20:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790047495; x=1790652295; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QdSFLnOc1c4KMeMBQmdCIS7pmnYBgQXqRrl5gflD2tc=;
        b=e4T9rOxTujBNSARv9KXzUJshyPryKQDncKZel24XaVSXlIPGtepq0IylBhSrmoMstu
         taqajSKLt2fpcS8DXQLCIC/dtDdV5SEBq/f9M3CMF0RSGwnO3cEsIduP0xiIPp5+iivI
         5WjCC4rHmjTUjzWd6NSg9p/aGXLLan359ebskYKWf3hS4HYfEc2WF9sN1+mN7b0cWOsS
         E0YW+OAW1nfA+qKIInGu1WScNDFdlHxhbYo+GbN/hDANiw8EDuKoHaTICKwuynxSkRc4
         ZaHef1tY+d3SGBRgywOmAwmbo7bwSViUuegvewz2mn198Oe4R6CJzeyD/farNsS8+VmY
         DlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047495; x=1790652295;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QdSFLnOc1c4KMeMBQmdCIS7pmnYBgQXqRrl5gflD2tc=;
        b=LKZ3hzoVFEEW+i8JZeajnoxFQpIx20sDHLR9kI/D6v0ykuzwf3STepr14YL2sMnQ9k
         o+nlkJ7rXZy2NkVC666b3sMUIIlHIURjWf12yx7YfrujTlno1LeJ4oWRmpBvtUAhKI1m
         ATQQFU0FtRXa4pgSw/bewvyueHRJVAsLSIkUz8wFrl/a3ROOjMuZR/Ms5A/tPOnnPaVJ
         odWXxBJ0vbapFaIJtnH5pfSqeoHsAXzpY+38ZlQ+kMLpPgGTOUEeqjtvCTm5BpUqIaFr
         V7bkhdzytSjvUPlCvxrKmHq+SnveF48A921u6PVq6PT5ES+vFcikgOpZIIHjGr0OvCUt
         y2Lw==
X-Forwarded-Encrypted: i=1; AKwUvBzG8Ay5ErvyACKbNHL6N90BTv1MD9xP+L8jSYr+1SVjPE/8UHjGdbaZ4H2rZW3vhdg3ZOqi5srkToY0HfVx@vger.kernel.org
X-Gm-Message-State: AFuF++lz/PB0n+IskKuRa59sS23rfAsh7YSHYTsXgdaEtGCl40JBb1wW
	JME0Bbvnnrt2r+TSYRQ/mea4VnuQLyvds05rBt/qcAMgPxxPpjTHS1d/hVhTuSGa5lDSI/xiRBI
	Jkwh7e1tzoZHRUZILVAzIbpIom/2HjTBvY8scP3Te++XkTslKuTd3j/el7pSSh2/aIZXI
X-Gm-Gg: AYBFou2d3LtfIPHkshxRbv9KOmwOMoFbrlP6V6KWgTw6bKxOV5ykqU9GTkplCPr/DCR
	TJxssoemqIkh+hebUQa77o1hmgbgRgem/ZtXafkwHTyorON6v6g8YlLbWWnwjkHhdZi+Ei54CCl
	oETRoc/aZNFgLzkGqVIo1zdawqS00WAfyzktpXHOBWZBs8GguZ3M16+vBrEoMvdTlGRFT/S3gYv
	HftNptk0pXUt5Fk5tKalPIX9ogdjICT74H05/n0ck8oDETR1rpGPX6nZ52nwVUhqUqBo/xp+zju
	ODGx7eMMZzqkHpcP05zwbLxbC7tJZkLgm4HwqlU+O9Dm5Lg51NL9qIRj5dzD70EruTbLT1OpQ3d
	qOUI4KD4M24l6b3K1YmfaNUwfmI7889geesX/kg2gd9r6wVOChFfiLytIQ3HeCUrbErOx47HxyT
	4=
X-Received: by 2002:a17:90b:2681:b0:39e:6c69:f482 with SMTP id 98e67ed59e1d1-39e6c69f55fmr12762640a91.65.1790047494455;
        Mon, 21 Sep 2026 20:24:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2681:b0:39e:6c69:f482 with SMTP id 98e67ed59e1d1-39e6c69f55fmr12762617a91.65.1790047493966;
        Mon, 21 Sep 2026 20:24:53 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm2082452a91.12.2026.09.21.20.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:24:53 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:24:48 +0800
Subject: [PATCH] media: iris: fix VPSS line buffer width and height order
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-vpu4x_buffer_fix-v1-1-d1b6f1c24285@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP/0sWoC/yWMWw6DIBQFt2Lud0kQkIJbaYyR66Xlw0dBjIlx7
 yX178wkZ05IFAMlaKsTIu0hhWUuUD8qwM8wv4mFsTAILjS3QrB9zeroXfaeYu/DwQxHp2zjjVc
 aym2NVPQ/+epujvTNpbzdEtyQiOEyTWFrqwbVqGptNVdOygalcQ6f1mHtkUuuhDVlaQ/ddf0A+
 Q/DPq4AAAA=
X-Change-ID: 20260922-vpu4x_buffer_fix-80cb495f8f46
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790047490; l=1599;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=KGqJvyschyivMcCpwVaFi8h8Gh2XUT/8AidhRo6fonE=;
 b=llB+r3EnyxT4K1K/9bCp1rfwU+khDYnyQ3VdsAamtfybduCk0pleuOFPvlab6C80BsPQwRcd8
 +Scfv0ABMxAA/qUWxKGeQ9LOhE9jpsskbnTaAK7qXkLH9uLlWlN/+J2
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: I3ByTpJGDqwVdYNQnucOq_Te5fMVoIp0
X-Proofpoint-GUID: I3ByTpJGDqwVdYNQnucOq_Te5fMVoIp0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA0NSBTYWx0ZWRfXxCRwOcJKO78F
 a6A0Ie7CQ/w20g2Pn9KVJKogEsSo9L5j25ancZCFGQjvIHs30YFJnAKa/d5bhJrcoVfkxWzhnJ1
 Jd+eQYrEUsTfCVzW66UoQe1QAX+CLoM=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab1f507 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pJ5EbSc5xwiXHrCt9wcA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA0NSBTYWx0ZWRfX2Dfw8UGC10ub
 Ibd10YJBe6FvLcne6uB0g2mGv4gzBBt8WxwZExwmpuLdyFn18ADok7hLBBDylqyJ48XMLgSwTZP
 Ebny5yjNL16phFwXAE4WgQW/ycNAZ3D4kVt8FxBhOweXIPS1+Edc32nG9bu4dbJJxGltXuk3Evo
 oGpZpCVa10hKOQvrD0y2bxY9+Sx+LtgUKVRMw0vYA1oZp/E9tstftjVsVgIQNC5gEkNH1VJixdq
 HpC8JmEVew4m0Qewuk43DPBPaxgaASf+njoXlFUUXnWf2PGoznTW6MRzX0Qj5VUZhYdG9EsZgO5
 QjQBdqyB020+v4qQmuKHdhM+4sPsEtCdxjkcgRc0bLVomEirajOFL+EZnLjEOKsAGjeBmy9tg1e
 pxTA3DZpjJV6L3kBUbTUdJxd6o7eIo9bLHdLNA3nmY02UY3IAiqlv4tsxMfH/KuUbdC8xNTjxjI
 /frX4MSuYTNvqwt+2Dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220045

size_vpss_line_buf_vpu33() expects (num_pipes, height, width) but was
called with width and height swapped, miscalculating VPSS line buffer
size for non-square resolutions.

Fixes: df816dce1b01 ("media: iris: Introduce buffer size calculations for vpu4")

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index faebb54728660cc621f8822dabf2e44ce8c55c58..3bafdee7f23ba99d9cea4b809b953053275459d9 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -2031,8 +2031,8 @@ static u32 hfi_vpu4x_buffer_line_enc(u32 frame_width, u32 frame_height,
 	u32 dma_opb_lb_size = size_dma_opb_lb(num_vpp_pipes_enc, frame_width_coded,
 					      frame_height_coded);
 	u32 dse_lb_size = ALIGN((256 + (16 * (frame_width_coded >> 4))), DMA_ALIGNMENT);
-	u32 size_vpss_lb_enc = size_vpss_line_buf_vpu33(num_vpp_pipes_enc, frame_width_coded,
-							frame_height_coded);
+	u32 size_vpss_lb_enc = size_vpss_line_buf_vpu33(num_vpp_pipes_enc, frame_height_coded,
+							frame_width_coded);
 
 	return se_lb_size + te_lb_size + fe_lb_size + md_lb_size + dma_opb_lb_size +
 		dse_lb_size + size_vpss_lb_enc;

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-vpu4x_buffer_fix-80cb495f8f46

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

