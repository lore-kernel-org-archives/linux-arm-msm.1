Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615974;
	b=PsVML1KGFFp1tos9ED1b00EoX7HH8R2xNRuVWOA6CEz3L08AZ1KR6sEnFeF7VW7fP711
	 BDD8dAoRDkCOfspaWrGQJ4qT3JhCAIGI+7By1OSnbrP6pctOQHieMi/zCQVVW0MNu1Z5s
	 6DuUMQSTlNBnSKGhkWlnbencz7hSgladmJB1W1lWleERqPu3/MCoIGARAN5xgFFVSdcDU
	 RYvj09lucwC6MiJm2iuSMCDYmCQ6DaIyBpo9gXDXC4YBaWzXxbD/HAGH3mAlITerRKe4o
	 XLZ623SLxEicD+mKDFjRQforI13p9xJLa32ktdu7sMEfAc328orzChtbPTP+bb1Foog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615974;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ocDu9x7a94SWPcpzxK16LgiMD4smeVd0t/ViadjFsRc=;
	b=hBxRk9i27W8mMrRowZx07absRzIqMjSoZXLdFdgkIYXRJTEbYji3H2zNkPOgx6HS7EGa
	 XvjtMje6dGHkeZUxRjaI2wa1K051ZtSXpgWXty+ZG7NskRriK9AU25UdAmVKYDxc07/qm
	 JfJjn0MOcNW+b1KIcJ32tnq29FDcVoGK0XS6nZ5W+NeS5lmqjBWLja0NTwQ542fjSEw27
	 8lh2h2EmrhDyskBO22lkE1lSMFrdIiF3dJlyjJYScZF8IQTn13c+X5a4iNRaB7n/MjdCW
	 6hVehCo1l7Ng9FRCEnLk5G3s2MT7I+RnQ7p33y4V4APgnv5Kh5ZARocMek/tnTP9K6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kQoBWcJ3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AuECfbdQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685CB606A338
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 685CB606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kQoBWcJ3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AuECfbdQ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKeCF82160343
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ocDu9x7a94S
	WPcpzxK16LgiMD4smeVd0t/ViadjFsRc=; b=kQoBWcJ3ixHquOP36eUDlperjY2
	XVKR9jk/zqcD5LNmbGH9YgDhxdkkLEFfgzIlB54mYQfnmYo8UlHcHppMkBf+uFSA
	sSIdhanY++X5/WELlbKwU5jdbWAj6KzO2aolQkfCBtWO3my+c5HmX1jH0e8AZgkp
	hiR+GCPBlLYqE2oa86r7hVQZK19jiHbxldLieub9dmRSY64YRD3cY/QKbLe32WzH
	+iLGxiSgDSttwumnvbQHLBzl7dhyOBzd7lkNHxZfREWjHGFR2caVDTJd88x6UTZT
	IBHLXJCL1tN7w5afMj1XXYbW9EfTbRicXXeaMA6MSrj/8UHGyNFu3zC6jSg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf1u3gppf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4a0017549so3013850a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792615972; x=1793220772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ocDu9x7a94SWPcpzxK16LgiMD4smeVd0t/ViadjFsRc=;
        b=AuECfbdQDf7VR6Rrtgd5BtFSjWp+YDdDpcZAq9oGzxIfzpLVGS8rQXBiYsk3DlZNmA
         V8gBHQ9feLXQt87wXZ1/h8iSK4Mko0PWkb0tePRwpXXs95E52mugolvr5yw0l5MiwQ99
         K48BdGUR8G7hxXK3OI8NzBqCZrC6FqsFxMUl4893BUgPi7X/nbt5fVzL7cnOeLWSIfca
         LdheSbkWEp+FC6KBfpZwmYAyD/GB7Cg7HY1Kna9I+g8vkoi7zLLLPccqXj2ZPaVHcWDT
         3wPwjVhQqGSiDi2CkdxWbsgIda2cvbWi19QrFXgdSBq8Y7Gd2vtbA+RUS4svvtLkt+ZK
         NAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615972; x=1793220772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ocDu9x7a94SWPcpzxK16LgiMD4smeVd0t/ViadjFsRc=;
        b=HsAYs531ENxd++/3KCp+rcGqgJ6FYXghYIjeDnkZmCbWaZ87pOYTjvfI3yPEGuMeTl
         LPXil6JQPnmNmMfU4iwXxPSUp2KHMKlNHHc0Qzgzm+mgwprON8rqh5Oz/OKnsyG5MPa1
         3918o9keONVPPemBuWIrZn1i7ar/nBNumaNxAx894SjOJDES3C/1YkeBhkLjUO/Qkc1a
         2RxaXA4wcfNL1se4mV4+7LsF5bxmVdFV2/TQK2JAlcAGL3SOQ/OGdD4ZByfW9BRftJAa
         HdnMFf+Vx6gz5+4oH2micoRXA2BQ11pOvfypyxE43VzVwg759pBCsNPsrAglFxaCvxVV
         By2g==
X-Gm-Message-State: AFq9FYJq2eYVFQF307H4ZILcWucV0erzCN6CGWO4d/JfohXhxq2PLfOH
	3KUSYa6YWtddMEwpiAnTF8qDyDyxKVWzG5Ea02nSfvN/modLYYe1bdgz1pcsak2cn0gNwxHybKj
	LbZZ66fiQ7NZ+OoDy3/lUqHsWyW4dztM4r2s2FcGyvlQUSQOBxQy2RhULY6QjRv5GbZmF
X-Gm-Gg: AYBFou1R0DCyDXqzb7nqTgztG2aMqBq/3xBww/vTlk3USGkuDYNG9/XD2O1C9qu1nwR
	nGW1kLCuMJ42uosnA4M8Quk9lp4KYe376coxW2p0y6KwozgSVJRKrtyDjSdbeDzIZBlrxqvJhnu
	ROAyYKCkf8PzyhpG3DOw9KL0s/srzzTkpqsfOvC0WckqErhrN9RMT2KcQ2VYsU5igHjFoxXLxnz
	l222bMXpYVcJhmfV6L9himXrtU59+klh6uUlNbSxA6CT2PmArp/2LtYQpRcXPoKbdlYl9UcwEuz
	Ezi+xP/Vpyh/SD68qXSIe2ZeSKM8Bn3J86df5crP8BPOFwX1tQus2tkvvH3YnYgnUY7/E8x4ke0
	ft3Kn189EPYWcdm+nPWuTTGRJC6q6q2BGHTLOVKNXamZApFrv2w==
X-Received: by 2002:a17:90b:1d45:b0:3ac:7556:8ee0 with SMTP id 98e67ed59e1d1-3ad86ee318amr2589078a91.19.1792615972596;
        Wed, 21 Oct 2026 13:52:52 -0700 (PDT)
X-Received: by 2002:a17:90b:1d45:b0:3ac:7556:8ee0 with SMTP id 98e67ed59e1d1-3ad86ee318amr2589052a91.19.1792615972140;
        Wed, 21 Oct 2026 13:52:52 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48cc51dsm937500a91.17.2026.10.21.13.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:52:51 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 09/14] drm/msm/adreno: add temporary __maybe_unused
Date: Wed, 21 Oct 2026 13:41:34 -0700
Message-ID: <20261021204244.67160-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=S8ZMU4sP c=1 sm=1 tr=0 ts=6ad92625 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: hTKljBtGtWSkA7ohHlpc8a6lwmT4Huyo
X-Proofpoint-GUID: hTKljBtGtWSkA7ohHlpc8a6lwmT4Huyo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX34A+7nnNamqE
 LllMUDzk06d4cWpO+sBNLB5aT5ysU72T0kkiWkEfFaKqDABAr7yWDR3xmUrP7VNzMVwHE7USVs5
 4lBN8rCv06IZFaL/3HREuHguZFymkHXvgeJqRjTLZJA1PXsAjdRqyyIN/iJrNpsZNkTTedplsYn
 yjdCEucrGpakFP7DNf7YGmsBuYi4blG1/6+RHmKwBxOlB5nodVYlJKgFp/t49RLe8x2OMas1EkW
 dcv0UomxVX+LefsYILSliIVWVnR6uAePxlj23OraNdgVbxoD6SCRs+4QwZ4/YkYBAW3uK6c0oEE
 ZF/QbYwWb6JyjYJwYTHepwlM+sYhPNfOt86krAKIuKDJqJNafIBGY9uY0OO3sstKDiZUbrQwgZ0
 Qf0RYQ7kHqKJemgh+8cDbZkFwjxaJzmkeuMOQc2trrcM60bp+hXxMIAR1EcCWjP7lNhgW4kmmVf
 nnPdehM4h2tnTHnx40w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX3ONN90jSwBon
 iwulvp0qHbYepDZRo46SlS9IqL+eFRneMZkBZl8Dvji/FIEc0JvKbE0ZaczNL/aV2P0pnLNiLS/
 8XGe12JqOaUy/dZksItlQne/W6kwYlc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210083

To keep this series bisectable.  This will be removed once there maybe-
unused protect tables are gone.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6d6e4c7cf919..c43efb85fde7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -168,7 +168,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name = {		\
+static const struct adreno_protect name __maybe_unused = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

