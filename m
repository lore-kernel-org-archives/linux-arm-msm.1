Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F007844E052
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 06:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085706; cv=none; b=aD6D7C12Ii8jQWAGMfG6gosnfM4q3yv7n7ht8A4rNs/vWkGX0l3ROTj5coZYRnzHEhOw34k4MJKZwm8jd9exKzLI6C7gYBodv6eQVDqxecTVope0fXx1La3wEeKxZl7lc4DdkThc/o9yz6Cregu1LRLlEIfRiqYANmwA5JwlNrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085706; c=relaxed/simple;
	bh=m20Kh+H5fTlZZTfVLpqUKggHmNyF1hCcSM91TM5eEDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Omy9+A9tkzKrCzefmqKsiCwg7L7AiDPvoXKQw+sZHIe4Y9bEZPQBsn6FBsJBR/ToX3laxmmAb6O7UIxn9cvmzbNc0+TYavnoaGaY7SUzAxl+UVxG7Q6keWBWlv8bok2e0iA1DqRhc0lS43BUkQoEYxR9DMMJTf3XvyCCRQb9KpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LoPe48Ha; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GnVl6nbv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LoPe48Ha";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GnVl6nbv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GkO93477102
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 06:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Kwl3nXu9nwinBsOKeAAPgUZwJmzbHnalLoK
	uzJgJHQ0=; b=LoPe48Haz7AG5AKKt+S4Qupq9tKhEVkTfG7eM3nddK0mqUB+Wfh
	+0ime4awFgP5mlfwjSvX6GT6krGOjVW4uuc3hED397RQ25k+ui6UH/ecy5sFBUfz
	MK/BX97B5QTx+NRXkJeNXLa5qTcVFb+ODWie/LwGIo3vl/jSmw4tXw+u7NQkFWnO
	7JcdZ6259ch30gEz/aWYfCM7azVCTgxV2a5OJuUAAgHZK3rUZvbfqWEFsXGvANBt
	OxSPCCs2BRsMtInQf9S0uCzmWcg5ogoVZKxdIcXBegszYBgXOiV6RnZUm0gj59y0
	9Gwwd6selKKv02Q4EN6LdAdHqMdMTaadzMw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hapbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 06:55:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so3276581a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 23:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085702; x=1786690502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kwl3nXu9nwinBsOKeAAPgUZwJmzbHnalLoKuzJgJHQ0=;
        b=GnVl6nbvh2YjYme901pG24BDvzhJkvXDyDdDIHEF2WwEznod8/dS/GH01aJFdk/qpE
         bxc2OERdhFMEzQLaufWSgTcq2F+eWa8nHhcDnpK+NTKVkUKZsBZgbQ8muWgN+zgMIKTZ
         ua0ECXshfPgCfPXEhIG4y8DyO1FGs7LllSgAI4A565EUDQSxXmx5grqmJ6nBJaY+ShaK
         X7EAZB7evjNG4KJXjbmce5yTt2L8MJX2T6SJk2c1s6E1VUfd/vuffBd2hGTcs2y9azAf
         APEEQhyfZy1aRZP0YkRYVULje/mOZbY4yvKLnNJkdvYO5KSF29S4SVMH9DSs8OramZ8r
         cRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085703; x=1786690503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kwl3nXu9nwinBsOKeAAPgUZwJmzbHnalLoKuzJgJHQ0=;
        b=cTWCzhCM+HVate0aYPRfRreHkDHNxT5BIDDQpE6y/Ip748cPOFW4uwpEvNq3EwX9+n
         Q4gsqgZDFc5Oc8Av1SN20Vy7WtIKqW5vPSMJb3XRzpWbal3V0WA7Dyjr3MEeGYQFugx9
         NPycX9BH4Erq/2vWLqgH+QEMDs4ND84EP/h05WwctHINlD95TDg1KMkOJsOtLfy+AReJ
         /YpiY+FiUBg9pN1ZexmNJ6JiL9WlDhf5RNd4WVXxn28y+D2lBtPRtK1amdxep0WKbguu
         S4MiadfbjMLp/dk4cSbKX6UocX+FsDFdI47UbsJH80A/RUt8LPL3io5Wn4W7ZTmRecbX
         /Tqg==
X-Forwarded-Encrypted: i=1; AHgh+RomR4zEdjQNgcZRoYDNN4s1jJJ+aBPNdtkDOeOzZRsx0u8psKR6MR789MStmQU43aU/BNTPrkQzOvdB3q1S@vger.kernel.org
X-Gm-Message-State: AOJu0YwNA0kBWQ5365s4VuQOX0UmINJLQfSp/07ukivd9cKiupnus6UA
	yTRIFXkqNT26sucfwF9SdEGTfeRLFUsD/3u7+d8qUzGe0sF2YdbzNj9O9s/FoM2nqk26Hz4i57f
	uGGwVqFe7NYz6rjIufC8gq53YU/rUQ4ekzfOpzMQMMtT3AsTpUU0bfzwdFYgT71AtZQ9B
X-Gm-Gg: AR+sD11IZwmQv4/O08qCdKP3uC4WamXa8ZOLvZR4S2syt7hX0DJdncgmhvcsjpfqL2q
	5FBfeNXQxDoOcvuF7rGWfZxZPwIqF1IUO4ExY+8PA/IHFUWFYJB12H+imEIsXSY/cskWtU/m4Fg
	CwdWJloU5osluuJJ0aEuw4kYRYmy+2OgOQwo7WwYU1uvxNnDBWI3uB61i3qtihuGrRh3N6Bq1yL
	ze4Uto5hcbwRDcNp7p6HcLfM4h0K5kx0ufF9mGKiFHSeImdi3/PD02X2yZqoACpaW3BFJz2WWxY
	4Coj+rA9jY3qRRIiAn1mk+Yk9r9z2F6zdzHiboKNf+kqWnL11b2FbluAYAMLyBkeD4V9eFIeHxi
	q//Z0y9HBn41W8rayjRfHatXRCD8K9tT7nswV8F16ELxKjtwoEdV7xVQFE1V+TvR9x80Gmq09hV
	XzQe4cQqnlYWU=
X-Received: by 2002:a05:6a21:6e92:b0:3c6:61c6:8970 with SMTP id adf61e73a8af0-3cb85df2778mr29200664637.14.1786085702556;
        Thu, 06 Aug 2026 23:55:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e92:b0:3c6:61c6:8970 with SMTP id adf61e73a8af0-3cb85df2778mr29200425637.14.1786085700148;
        Thu, 06 Aug 2026 23:55:00 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101b95b20sm4064525c88.15.2026.08.06.23.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:54:59 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
To: brgl@kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net,
        thara.gopinath@linaro.org, linux-crypto@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: varadarajan.narayanan@oss.qualcomm.com, md.alam@oss.qualcomm.com
Subject: [PATCH] crypto: qce: fix CCM AAD buffer underallocation
Date: Fri,  7 Aug 2026 12:24:54 +0530
Message-Id: <20260807065454.1640815-1-md.alam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rQzvUtfaDD4HPFQC2gPAEYMWhXxTbbQV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX3Wgg484yPHUW
 uEJtFZHqYMluJPaBHnfR5upOz403LGAN9O5tEXd8RXNo9mSJBcNLJdP6nESPXp1wFFAFcMe/DV6
 HwCn4woZ9ZRg7q+oZEliw7guWowAJxSBNyMzEvF+IvtetebUPz4V+nKdY1HS1VvpMxcDuuwrV5X
 t/gEOCnl1WEGmQZ6sseyNx+vbWel5w8skk7YWcXgtW/gq/UOWaUOT6zhFXLgoUE3jh2Mg1VzSSt
 MXP/u5hs0VcAmFYQ5SzavyShavzF8Me9KhYNSWi43tDe4VirlKHXRHBMzJBP3qvwfrAiWYNFypn
 BxXU8KFEahbJikm+h77/2arQ45flA+APRiyn6tZxilbdA81cwtHeuGqK7hTS71OLnzz5QKhQGWA
 /XdHxlRYbpUe+xAfo6rkdosbuR/lVPg3bFoRya76xxOUtDzl8lmB3IdabYuwfPRc2AHtfEqRZV8
 g+n+/xuVzZUP4+t5f9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfXwc388e+JsGTm
 L7wBHFACugS6dZDqtgqhs7IFjRwwk+tuYtSRJSgjC6W12jhPaaZp3oKtcBYLxKU7Ocj3DvUnaTA
 FDyE1ASZnIay50Mi11QdYIh1/LH4qVk=
X-Proofpoint-ORIG-GUID: rQzvUtfaDD4HPFQC2gPAEYMWhXxTbbQV
X-Authority-Analysis: v=2.4 cv=MbpcfZ/f c=1 sm=1 tr=0 ts=6a758147 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8zGforoG6dPd7syO8-wA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1011 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070050

The AAD buffer allocated in qce_aead_ccm_prepare_buf_assoclen()
can be smaller than the length later programmed into the DMA
scatterlist.

The allocation size is currently calculated as:

  ALIGN(assoclen, 16) + MAX_CCM_ADATA_HEADER_LEN

while the DMA length is set to:

  ALIGN(assoclen + adata_header_len, 16)

Since ALIGN() does not distribute over addition, the allocation
can be smaller than the DMA length. For example, when
assoclen = 32 and adata_header_len = 2:

  allocation = ALIGN(32, 16) + 6 = 38
  DMA length = ALIGN(32 + 2, 16) = 48

As a result, the QCE hardware can read beyond the allocated
buffer while computing the CBC-MAC over the associated data.
The extra bytes are folded into the authentication tag,
resulting in an incorrect tag and causing CCM self-test
failures such as:

  alg: aead: ccm-aes-qce encryption test failed (wrong result)
  on test vector 8

Fix the allocation by adding the maximum possible AAD header
length before alignment:

  ALIGN(assoclen + MAX_CCM_ADATA_HEADER_LEN, 16)

This guarantees that the allocated buffer is large enough
for the fully padded AAD data for all supported header sizes.

Cc: stable@vger.kernel.org
Fixes: 9363efb4181c ("crypto: qce - Add support for AEAD algorithms")
Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 92d84941d3db..a9642c67f476 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -196,7 +196,7 @@ qce_aead_ccm_prepare_buf_assoclen(struct aead_request *req)
 	/* Get the msg */
 	msg_sg = scatterwalk_ffwd(__sg, req->src, req->assoclen);
 
-	rctx->adata = kzalloc((ALIGN(assoclen, 16) + MAX_CCM_ADATA_HEADER_LEN) *
+	rctx->adata = kzalloc(ALIGN(assoclen + MAX_CCM_ADATA_HEADER_LEN, 16) *
 			       sizeof(unsigned char), GFP_ATOMIC);
 	if (!rctx->adata)
 		return -ENOMEM;
-- 
2.34.1

