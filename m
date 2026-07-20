Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D514252A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 13:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554146; cv=none; b=huQ1K3SEW/+3TkoahIW7NI3rsPh+TftWmwad85vYdXRTzR16PEg8ntuktzySRdzufyteBlPQlS1E6gzrU4BMa1U4L40PbuQaF2Xz1Ij6nXj9NFlVfn7tYvY9WxrL8JIChVwKHx3ttGdY8uqvOQQxh/mn5VvPd++/RwoMym4OLIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554146; c=relaxed/simple;
	bh=f1RJ74a76PW53KK+1xdt52Qum59vHAAPDpQ+wyRWZLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U6iOftSGww/eqdSaqxamp22vzyex9hhbapZV95g1Pw/e7xDlWJ1R04A3Ggtynn5ZYqjo0/Y/ZFxzn8lFIB7iQPLQZde3sgzfm0C91P71yLiRY1J1/VCxPwwwq+eOnVBq6f059wPmNHK8Xmy7hX0AoLowv8GSsVGK/cgZiaIGRWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxH3DvR/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LmzIRkB9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxH3DvR/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LmzIRkB9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KBi36v2450181
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 13:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSAwREJ9fN+/n5hiVtWkjLEHl1v3XArrjXhPEVMyZvw=; b=hxH3DvR/TKs7tSd3
	LCfkDOwqsZppI/Wivpx2IqG3PwpCwSCdunjlAiuH+hH31zlkzMezp9u9/BClSVLc
	7ZeE+WEaqPgAdQzqWQdkbCSQPA8XD8GT6mYBeQjR3fnKaLu+eGUTRZJ+t/X39RCv
	w6+3iWSq36F72kwE3CNPU0PfqsLdhFDcMeRFfPl+nN/KeDI/3VVC+oCraDxBe17k
	DNFXTQDtatXmyEWswDTq5Pg3BYiq/WlVxkk1M6Nd1/OaedPRDYjc2VX2E4371sm1
	A31o2yYBO4mvach4I2CKTwaPbOiE9N7KVsDL47ojmSmY9cP1DXz3xq1eq9buzlwr
	xlQ0Ew==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhk2f8dam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 13:29:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso12847313b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784554142; x=1785158942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSAwREJ9fN+/n5hiVtWkjLEHl1v3XArrjXhPEVMyZvw=;
        b=LmzIRkB9QEhhYVolTZyA0BoO1e/KxyoaBHH6O0PfftbHX7PpVLST5I4edMIXWNDs40
         PGn+NT5fCSk6daAiEgOh0nuHfmWtQFYWEmltzDxngKw0J+q2fI8b2LZtIZ5k+WdltYJL
         CBTbkbY2JJabKtUltXYe+jkJquEeRKTFxlXFtfdOmlFuVf/SKNGNLmoi2sCuYqPfwPSG
         eMkkF4NZpYkJKZdaZ/mcc89zJHQOY7Nl1cODefU8z7R3k+esy87Hlafl6SVa5TpGvNj1
         lP1lalpBH1XTxQL4y0/GBxHf+98YqAWmDv3cu0NGIq4YopmAt/pOT1HyLZB/iF2VNsvY
         o1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784554142; x=1785158942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSAwREJ9fN+/n5hiVtWkjLEHl1v3XArrjXhPEVMyZvw=;
        b=nUsQwac84qrSVgiB2Ci36NoNMKdG1Gakf0eHE/Ic+/+/5BU2i5cmzdIqzO0Mxgl4iP
         gAZzl0d1CYSTIeXJ9Gd/JeEcgVxAoOo32YPZMpQSZitvb9nEEh6yRbWRuelQjqpy40cX
         0TwdkTVqIdaTnnJ+qQaiBcVgoswnNDt01rwzgRheFotDYrnBNn3/7AJgCm1hs1VXyXok
         l24BQP2kkD4lws1Zo1nWr0IpqFEqz0FqKEbpAYb+NIvmBtsP29FQdddx9QwXgAk3S7vR
         S6quJCygI1zNG/q7HArx+Jf3CshUFu6QPYp2w8AdHVmFyN2MJO2BK+fdKZ6l26CEITA+
         1fHg==
X-Gm-Message-State: AOJu0YwERTt3MY1g4B8u9SHeuaq4f3iLVwBrJ4YBcCE0xNW71UBaoPjM
	nXytHjsXLsMndoTSHvD8EBtqeVkq9fgGdN5Ej4rEdJKEWKh97hZaYhimDsIKOCk7blwPNhZ1U/z
	62KPRxxji/B4C3NHdV7UsuOfGR1mvqsN0Y9z3Uc8EVRCddDGTvOS1I0QjQz3oS7zt0w2VAB497e
	pz
X-Gm-Gg: AfdE7ckWRcAofoChtQmmlWGAJ+CPiZAkPGCKDBQAiUhQTr8jxbbDjg27Cd5btDSo3Fw
	Vp7ng3GrwtDOGMjoXNoQoVR/2aelBX6WvEtLfavAiiE1wCHHXL7Ub0TcsESqci74HnODc8pfe6/
	pW0/f7CWCBA1U2zk7mW5eoUbKq7S4kxSH+ovaxivVH4fSHgUTlEojdSsiCTPPH8PBSdVKCcxVhE
	329WB/HXiTv23EUt8Vsln4ivn7ncsR7980FAikyyZyBVyny36AoqIv7uyC6EeC04mp0Jtu0tZmY
	+kNqQmybyXOhDyF4huXDTkLAOKWTvwINTczkPRcbxWBriH9yBSyu9X+YgcAc14TrEthCvQvnwtb
	eNrePI8AwtSEaCfJz1LZs+pte9t7PnYubfxe2nftjyaxf+TIzcSj+4oEQ5CqWxfe8W+uNjyU=
X-Received: by 2002:a05:6a00:3cd3:b0:848:788a:e7f9 with SMTP id d2e1a72fcca58-84c292b4922mr14094469b3a.18.1784554141885;
        Mon, 20 Jul 2026 06:29:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cd3:b0:848:788a:e7f9 with SMTP id d2e1a72fcca58-84c292b4922mr14094431b3a.18.1784554141294;
        Mon, 20 Jul 2026 06:29:01 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6e3e0sm5628822b3a.43.2026.07.20.06.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:29:01 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:25:53 +0800
Subject: [PATCH v3 2/2] rpmsg: glink: smem: Validate FIFO indices before
 use
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-rpmsg-improvements-v3-2-e7b6070186bd@oss.qualcomm.com>
References: <20260720-rpmsg-improvements-v3-0-e7b6070186bd@oss.qualcomm.com>
In-Reply-To: <20260720-rpmsg-improvements-v3-0-e7b6070186bd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784554132; l=3666;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=f1RJ74a76PW53KK+1xdt52Qum59vHAAPDpQ+wyRWZLE=;
 b=nCxSZFKsWJ+VWDLc/mo34bGZi2uJ8GrpAYX2ilml05yN9poLI9eKKjCiD1aUKcHmNoyq6aMFx
 jpA14otxz5/DOcou81CLBHLzFm1o1aw9YWc7aFX2UoKnXwWxBeN1Jxk
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Proofpoint-ORIG-GUID: E9hLsPTEKWK54KEqiEKJZ_OVmuQzoTRC
X-Authority-Analysis: v=2.4 cv=X8xi7mTe c=1 sm=1 tr=0 ts=6a5e229f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q5iom6PKYtt-AqbUL74A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE1MCBTYWx0ZWRfX13YrxQLnfpHF
 9emLNBzYRoDVBJRJ2zWEQYgz18FOcjiAGXYl90mE+jMOeLsY9BwfdqB/FeEowZEZRDxDWPs7uFX
 vsU4QwZCjEz1eH9hcK9smAjEsbnE3VQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1MCBTYWx0ZWRfX1yjzbDMS7s3Y
 0g1ZVLpPV4wE1iDw01udrXVIIG+vBBLtH4S5Y1GKA/m9wcX0QEXnDcsF4xCUAhWGHSWerZQCISM
 xn9FqkxIgW4hrK0ci2zYYUDuznRLR2x0VOec4mkHTIAi+qp5IQ5CHGvSAt5GCyx6/8uhC9DVPhI
 8NeoD99+50TtASx8LtMcGPgBRjByYwreEYMnroLRI7lpH9UiatiNZAvTb36oD+25iFdouefmzj+
 sGDBFCKk3134wN7auBUELrJuQPqh9pWX4u4P/tdk7N8Y5mv/SSXZG65hXZyUu0Bz5/+BNi6yAkX
 YUosbOgqZx1i9yUWGlKnKS5Z0TWlYzTaLjssjVlxAlOhq5KlykzpntNQp35BSQ50/psgC9va+io
 KHgYYqTeOlrbgOzVuHEJwQO5HbnLlvY6cyXbGFGKhFLCo4Fw+9X8NEm7Bd++dF5mBHmEhb+mhNM
 f4Ron2b937FLTqnrA9g==
X-Proofpoint-GUID: E9hLsPTEKWK54KEqiEKJZ_OVmuQzoTRC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200150

The FIFO read/write helpers assume the head and tail indices stay within
[0, pipe->native.length) and use them directly as offsets into the
mapped FIFO region. If that invariant is ever broken, the subsequent
memcpy or memcpy_fromio would access memory outside the FIFO.

Validate the raw head and tail values (and, where applicable, the
caller-supplied offset/count) against pipe->native.length in the
avail/peek/write helpers. Checking the derived length or the
post-normalized index is not sufficient: two out-of-range indices can
still produce an in-range difference, and reducing a bad index modulo
the FIFO length hides the original invariant violation.

Fixes: caf989c350e8 ("rpmsg: glink: Introduce glink smem based transport")
Cc: stable@vger.kernel.org
Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index edab912557ac..df3081855b02 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -85,6 +85,22 @@ static size_t glink_smem_rx_avail(struct qcom_glink_pipe *np)
 	head = le32_to_cpu(*pipe->head);
 	tail = le32_to_cpu(*pipe->tail);
 
+	/*
+	 * head is written by the remote peer via SMEM; tail is written
+	 * locally. Check the raw values, not a derived length: two
+	 * out-of-range indices can still produce an in-range difference,
+	 * and reducing a bad index modulo the FIFO length would hide the
+	 * invariant violation.
+	 */
+	if (unlikely(head >= pipe->native.length)) {
+		dev_warn_ratelimited(&smem->dev,
+				     "rx head out of range: head=%u length=%zu\n",
+				     head, pipe->native.length);
+		return 0;
+	}
+	if (WARN_ON_ONCE(tail >= pipe->native.length))
+		return 0;
+
 	if (head < tail)
 		return pipe->native.length - tail + head;
 	else
@@ -99,6 +115,11 @@ static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
 	u32 tail;
 
 	tail = le32_to_cpu(*pipe->tail);
+	if (WARN_ON_ONCE(tail >= pipe->native.length))
+		return;
+	if (WARN_ON_ONCE(offset + count > pipe->native.length))
+		return;
+
 	tail += offset;
 	if (tail >= pipe->native.length)
 		tail -= pipe->native.length;
@@ -129,6 +150,7 @@ static void glink_smem_rx_advance(struct qcom_glink_pipe *np,
 static size_t glink_smem_tx_avail(struct qcom_glink_pipe *np)
 {
 	struct glink_smem_pipe *pipe = to_smem_pipe(np);
+	struct qcom_glink_smem *smem = pipe->smem;
 	u32 head;
 	u32 tail;
 	u32 avail;
@@ -136,6 +158,19 @@ static size_t glink_smem_tx_avail(struct qcom_glink_pipe *np)
 	head = le32_to_cpu(*pipe->head);
 	tail = le32_to_cpu(*pipe->tail);
 
+	/*
+	 * head is written locally; tail is written by the remote peer via
+	 * SMEM. Check the raw values, not a derived length.
+	 */
+	if (WARN_ON_ONCE(head >= pipe->native.length))
+		return 0;
+	if (unlikely(tail >= pipe->native.length)) {
+		dev_warn_ratelimited(&smem->dev,
+				     "tx tail out of range: tail=%u length=%zu\n",
+				     tail, pipe->native.length);
+		return 0;
+	}
+
 	if (tail <= head)
 		avail = pipe->native.length - head + tail;
 	else
@@ -177,6 +212,10 @@ static void glink_smem_tx_write(struct qcom_glink_pipe *glink_pipe,
 	unsigned int head;
 
 	head = le32_to_cpu(*pipe->head);
+	if (WARN_ON_ONCE(head >= pipe->native.length))
+		return;
+	if (WARN_ON_ONCE(hlen + dlen > pipe->native.length))
+		return;
 
 	head = glink_smem_tx_write_one(pipe, head, hdr, hlen);
 	head = glink_smem_tx_write_one(pipe, head, data, dlen);

-- 
2.34.1

