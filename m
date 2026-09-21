Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DDD49C4D4
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789995530; cv=none; b=nsMU+zazE+tCJ6r09RNYV3jVZ6VnH2HQAb6jPaBShTOqLyO4eeSKfJ0lYzsu6on1hE5U64sn8OVxkKPcYn09ofQz2rRn4fl/aqdUpgQ5nrUDllO0gIJPa5sei9y+vprIbT+nUgtwTJLNK6oDGzNqYLMEN81VSFYU1DMAQK3jQ+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789995530; c=relaxed/simple;
	bh=tX3TRtZACxaWj28Vd3tV97Cdc6/vFpH99oExqmgwzeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a3mUWEfqHaq/0iqvetwqe9FLjORZEvuJrqyjqEPA9HVmJPNzHIgHruQqXKx2AWvHm5R/7CXX501Lqm/+5O2EFtnWMEt/r+4OJiNLgM6HUaIiDoYIlfBrd8ze6oUHT9CkSyH9Mqcwk4ANYHirkHPDNLKT5L/z3gCmBpvs79b/tOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVEXkp5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RNF4j50u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVEXkp5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RNF4j50u"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdnoe227909
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XpAwiJrGurnLU7swiLYwHwGFQJ26CvgKoaprZ+5NHTo=; b=XVEXkp5DAQtxNROD
	8TUtU71YXwpf5AycTK20Vnin9/bmIE1pFVdqOj6JCgTTLfymuAhL5Pzw+gvXXPfa
	6qBZwmjjnMS2s6SCrmbzOTnrTxuiKZ2FdszGwgydzis+PRbZNe95gzgKPBSueEp1
	LQW3i/XG65L5U3adB7WGsd8r7FBsDx9fnvnYqojixuaj/LUDGxa/WNJmwB8wWnXT
	PWWlKrNGr8MoI3ba9qTOMfR/Lwg/T2IEgENWgbmbe6qhAugJQaj5XOKOCvMWi5Zt
	T8STT/fy0abCjMBkoFRQ7ae5YgkkSQ1oJ32R190Np8rIFLL41qHUuFLLJmyJeoUO
	xKtKrg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17gs0q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:58:48 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97cc09260a3so3271421241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995527; x=1790600327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XpAwiJrGurnLU7swiLYwHwGFQJ26CvgKoaprZ+5NHTo=;
        b=RNF4j50uzKrgSCR2dEWUDhrgL+SoHyHbV9cge9fKiUjrrOnfb5EPXDLjCSthksf1AB
         iZRtlGUUIOmOxAncIS2dJIBNk/RCrAq3CZv4wOt6vCjeudO+8oVwRzfcriYlz5EbabbF
         XomEA0Ge291WXYn6qJfpE/gvZhgZtajUbtJBo2JSnroMPiwoJFn+XpMiQGweMONV4ee8
         A6icykAJjsK1NrKrdre8R9APOw+kSrNAtKddo9WoEk36kk5YSM/mwsSqeWtHOBYPWnq6
         d+IN9MdDQb5ncWtG0I2h7iXjh1rC5JbFqpfPL+l8U5z8nfYUVtUpAXYBwRtBbSBKtohJ
         z6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995527; x=1790600327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XpAwiJrGurnLU7swiLYwHwGFQJ26CvgKoaprZ+5NHTo=;
        b=tRZfbRaFhf2RyR9IfgkBy72b1ef57nQpJDd6CWu4CCuPBZ8h3EINZCzqkJqLdz/DOi
         DLUbqS0N3aoeVq/l0xor/9MIZRmBYkMHGeSAjSDscoUh4KTs+hWP5aQbWgFzaL4PZFA/
         LETubxtaQtRRQAD5XuaXMw0els1qXx4hqlVYTHxWUgNS3E+bNXDpmXk6tA8owvH3XvVX
         vLE0ok2kM6h4a4rxKComfNsrbK1+1hxWVuD46NMH7IMn606bntUQa2Ma5El40IUY4QV1
         KMzsIBtPSBTN0eq0cjy7eX1kl2Sikts9skD9Q79j2aae2xTZC5vs/3BeQz8PJId/6ZVT
         jbxg==
X-Forwarded-Encrypted: i=1; AKwUvBxRy7mn2DuB0NHMWzisuf6Bk8iNB2qTBSk/OXEOSKpwz3gw+ncmeVAj/k3PtQPUyqBK3glGRaGH0Ur2gAVg@vger.kernel.org
X-Gm-Message-State: AFuF++k/GiXuXZJ/NzjblGL5AXSJTayJyIJiQwa1ZLsgQYJY2wcGTtSg
	v5iKaDMiwpQ4dSdNBMOrmgd6ESqS5lbtJqP5RpvrJgEw1d9PykBvkWkARh0MQup6+djFFtedlta
	4whxjobAofR5ysdMcfEcgwXYbkfO5A7eIVlbw/9APdNF157vRPipCPboIIQkTGQb9M+xX
X-Gm-Gg: AYBFou1in7vrQ2oh9OcYC8OUZLf9aaSsM5/g+U4rV8kjXTJHi3BRCEnMp7ay1Doa+28
	gW4MRBXr1+HEuhzv2RndyMvqNsBPIVALiiCnV6mjz+G/PirRD/LOaHVp+I1DsgeIkFN5CVh0aa4
	yErvqOyy8QO/zS5v76NTaAKdiO5uUKaiO2745m43xZgcvNzqGo2ZWVkbp4w9KwilyrN3d53gTBf
	0pURyLkNoL4A5Vyqv4xtuVP1paESfTS29l2jwBOv0EO6J19F3pM9sUj3G9Xk0gCOgXw+F6E0DhT
	zkeVTC1yaI1Ofyo75uDGkWUAqjdTmiu6LJFM+DFjdNHwEmwX26fwOqpZ+Fq3oaweDqYoSNo6rRM
	CQ67TeOBlY+C3j3/+EfEorSPExic=
X-Received: by 2002:a67:f7d7:0:b0:7a2:7d1d:5014 with SMTP id ada2fe7eead31-7a4e1abc3c2mr2942550137.16.1789995526283;
        Mon, 21 Sep 2026 05:58:46 -0700 (PDT)
X-Received: by 2002:a67:f7d7:0:b0:7a2:7d1d:5014 with SMTP id ada2fe7eead31-7a4e1abc3c2mr2942535137.16.1789995525893;
        Mon, 21 Sep 2026 05:58:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:58:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:13 +0200
Subject: [PATCH v8 04/14] crypto: qce - Use a fallback for AES-CTR with a
 partial final block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-4-107537869a72@oss.qualcomm.com>
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
In-Reply-To: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tX3TRtZACxaWj28Vd3tV97Cdc6/vFpH99oExqmgwzeU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSns+PyCyJuRQgL1Pq4op/UdD2lRhm347xN8M
 V4UnHO2zsuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp7AAKCRAFnS7L/zaE
 w3FDD/wNFoyQNr83Tn26infnX20bDnq0HWlj0p9hHRyFBsmTz/Vvqh9gZQPoBEBJgM/gpxyuUto
 Zzc2LTGEeKRGbUHDqZ33V0j8ztXUomYGXIuMc3poo9qY719BaNA/cvaEbO5N4Tfaicjf5NoMFNg
 CvvSdWL3Z2qW9vBwmWkq8S3AdncjKl1yDtAkP1UQ55PQuWC8juErb6ITmTlZpg7GX4FghRV7+E0
 cxtAQyuPeIV53SRAEnxI+zL/uL1A9N+6V0iuFBg+J4cSzHMRRUAW/WhL/n7nXgp923MSdjwsqmO
 AAoYOTVzifI+PCEEmTrqcSzZ3pKpKS7WZun0Mcb366pE3AHdyTSVnK0kbLrTPlY4x9gqcCjTUG2
 kEbRUB7M+DQa8JNM/GD2YAg1HKG+3LmsywBDfsNmN15jIN9zqQc9EjsEfa4YdEBCqfr2DLHk3b+
 5QirXJjWmr91SHvrhXgnzEPh6FXyoUHFW1ncogy6t+KJFPLFf4d04PcXcz7Z5IdcD1mWm/BPNjB
 BF9rqSi8bwLSO0/QNm3QGEZmdOAM2C3W4ml8d0dE/RXdWqD4VSiqTHJMBfru2rOm42wihsRsaEY
 HnyqnDnZ65h+u0G6/8yN+sRXFqYNiNNZ4sQzkJ7VJlUSxV5PkLdZ0Vy9FCe55iG6UyLqXm9U4nL
 +OefrVqr8uTL35Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: QGl7R5rh_-R7FGch3H5Te8Jx8ZfeF2hj
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab12a08 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vUpbTSJP45I4i0_vGVUA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX3lqD22S4Big+
 RX1oMvA6uUdFUrdvmtOpG6C1FItpRvPzBCcaQejBu9s5s5j4BRuXeX9pUNJgkUaOKnRqjgmu/eC
 5AhqKcp6qb7Kd4caocMlMALCowxIe+RWoWN+3Xlqp1LI520/Wz8QdEWuAN4ePQPBsO75DwtqhLD
 F65iXA0UHUI1p8VGhcZXtv5GVMMtcLGZvgYHV23yxZOfpzLoopJbDkXjdhbv+s4fjwlpyl6vqIt
 0FO/4VFF87tJgXdSnQGFuL8b9DDDR/boRr4Uuxf01d1q2gM9hzHSsB2cvauNtgmWa5rfBYOeocE
 N3ZojD7e2d7c0xdS2R/w61pAoycpA/VJHGIxzOdv3sp8CO03BhKWfgYBFOy5MzGAePwouIuDfcv
 ekmqX8srsl+LlENZAMgc/Q4Z21PNB4QDFJWO0OMuGqu5S57iIsAkrOSKgytAkoCTAuiY9oGgYdS
 qBbRwjyvF5TzoWB9XMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfXwO+hpNq4KcjS
 q1OwEmZEdFmPBhxkFPbA6+lNbDYvImkwTXzTt7ZnqyMWGQlkeFC9NVSX2k64gRRrbP0HQZceNvb
 wOvjvlf4HnHIuwI5lYKwMsRq1NrE3KI=
X-Proofpoint-ORIG-GUID: QGl7R5rh_-R7FGch3H5Te8Jx8ZfeF2hj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210187

ctr(aes) is registered with a block size of 1, so the crypto API hands
the driver requests whose length is not a multiple of the AES block
size. The crypto engine, however, stalls waiting for a full block of
input in that case, leaving the operation incomplete and failing the
request (and the crypto self-tests) with a hardware operation error.

Route AES-CTR requests with a partial final block to the software
fallback, which already handles the other cases the engine cannot.

Cc: stable@vger.kernel.org
Fixes: bb5c863b3d3c ("crypto: qce - fix ctr-aes-qce block, chunk sizes")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 0a872beff4807e6e5af612e336630ea7a36e203e..e2ca2f7a6eea1129edb724fe30659d55aaae8190 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -259,9 +259,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * AES-XTS request with len > QCE_SECTOR_SIZE and
 	 * is not a multiple of it.(Revisit this condition to check if it is
 	 * needed in all versions of CE)
+	 * AES-CTR with a partial final block (the CE stalls waiting for a full
+	 * block of input).
 	 */
 	if (IS_AES(rctx->flags) &&
 	    ((keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_256) ||
+	    (IS_CTR(rctx->flags) && !IS_ALIGNED(req->cryptlen, AES_BLOCK_SIZE)) ||
 	    (IS_XTS(rctx->flags) && ((req->cryptlen <= aes_sw_max_len) ||
 	    (req->cryptlen > QCE_SECTOR_SIZE &&
 	    req->cryptlen % QCE_SECTOR_SIZE))))) {

-- 
2.47.3

