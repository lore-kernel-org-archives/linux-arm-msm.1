Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102495;
	b=CNW0NY0rGb+/ztjzMLN5WNfdwPx2igdm39RGBmqomuHp2ynX6hBEBjdAcB0jdQ7UNHHg
	 jd4PuEu+hdJru2owDHUd8Z1w3UWp0bT4TFCabIGbqXoTvI/fbQLuWPuwR2/aRDWtYveck
	 cj1DSIavoTGhCKXwj+hzPjiNWNLWJB4PRqrKL4UVCatE13+ootbEgmsNaoFmVlkzCxEjk
	 VUXpHSNA0MosW8p6xYVant2VXmgZTyknCb38zbgx8GXdPk/FnA3muHqhJ65H+LsqkHztc
	 NI0cVj9U56WYvYrSsj8ur2fjtEbkyfQ1iZkuFZNFkUwxq22hs14DZAF259MlzQCBnSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102495;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KNE237mj1MNRlMgpVoOvUADUwZrvTfIRUQM33z2ltSI=;
	b=XrWeJn6A3l/hF2mCfp5oc6t5oovWy/rJfQrT7GmSVZymwcobkEo8eUFMNJmxxnN0TvZp
	 +V0G9Vv5LbudooGkfCdzBK9SB6xC1M1F9SMTGLdkNiIVK1aTP66hT43wx9pXQCfqDVFJp
	 OJUkZghxOzN2pZF9kH8fFX1ISbQ2nyPLsxbfQ1uSR1jwGTwUnl0lB4Tl0zzZFKwgoqI1v
	 VgZMnpSgL8tFvE2KtcvJaVb9sMr8JGn194UKkXUm8KGcCyP8salKTgYCTjWEzvWYozUUg
	 yjy2fXffG/iPW9X6XaJeLjqH7wWtqQcVLAHKzY+8GnYXm83YrU7i1f/lDdJ5LRhiqfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3jL96oI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="VAJtsum/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C25860A2604
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C25860A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3jL96oI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VAJtsum/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe0nR2458170
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KNE237mj1MNRlMgpVoOvUA
	DUwZrvTfIRUQM33z2ltSI=; b=a3jL96oIYi1MaDo2m07xgWy3ARXVIdcyH/IIHt
	xQX0JYNGBw0v6ChJnqI+0gMJcR3IfDzt6VlfelqZDY7meh6fcSfC2946WrDoaMlC
	foAOhZrevvo446fAl0owCfsTfQ4FhDDS/R5HYRmFeGLn/vn1O3R0pZ1WG1MSN+Gf
	Ul1NQX+0Mu14mu2VZ1mxAbzvk1hrTmkv1EjXC1qoZWMxbCBOZKFzMy1SQFN4TZM/
	S2PcIzu7k62KtqA9gKV33WzAalXxV+sIUI91vi9ds+qyLKUZ4kBL5HOMNF3/dkji
	OoCkbxWZrqadoauKWSkCcdX03LoN42RO8bnvr+zxw2/asd+A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbta4sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:01:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso3768364a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102492; x=1793707292; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KNE237mj1MNRlMgpVoOvUADUwZrvTfIRUQM33z2ltSI=;
        b=VAJtsum/4WR1627U5fC/m+fcZBathrsL5yjUllNFwlvuU1mAyItiuDP2l8KauoDhfK
         6mHkeJp1EA9XwqyMCb4LtnlEjsgK1Bnq5ucIgFU6LXCn+mFgc0GaJ7hmKJJRoghsAgY/
         swJv8FMZpOM9L/EJ73+jIPdhqTP8ZELBUDRRioNvRtxlEAYBuqCltpDkEfecsfw42N4e
         hFxm+QMInzW7fUVA+xZqy6mPNJEAOstFGuuU7QroCcI2C/q0weOl6zJi4zJbex4hYux2
         pdXtx82EhTSVaqGITgVdKC1ckWjaPNuh0SQG3uQxN0v/jbB2nBQ+2uLQxM/Ug/dvbeq9
         NaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102492; x=1793707292;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KNE237mj1MNRlMgpVoOvUADUwZrvTfIRUQM33z2ltSI=;
        b=A0JBKLt+MCxoRCVsQ2qmen1o4CMEtxJloNjnKZeVc4nowygFDpWQsCYXrdwJ64uK/W
         Kv9NNUVsLloRBt4myzghOWXGfKNJ+N6GEXjmfU88LN65Ypz2+HY91JRvjmdEUmbmX3je
         j31IYD/4iBjJNs3z8sRHTCN+Yv6Sn6tULVjxViUHLqKZfMzCLSfNLVxPAJtOdeSVxS6L
         ZlBcrScA5gh7tTcjapSb4BxvtXS9DETrS4AeutYQGwWyBqA31v7yXa+kUKn0LsFCwXqa
         TLH3RbEff5+igr1HTyHDYaFnE1/7tyYzTbmK22QTtYqQHlzGEpO6lzCmFgnCLR/yj4/Q
         zCYQ==
X-Gm-Message-State: AFq9FYIYa0EgVmrCrlAi3dCV/wtxClKVSRVV4wctwBM8yGVGC+0MecvY
	4kHSmrXi9eqNaoN5iB8BV1aqNXw2fXqijmJoUgLmPN2OhspyulEnRdLofGSrdrshJlA5hAqXRwA
	ZkNUM+qNQVxC5YHVEwAZq41OUWRPftCeGv+oT8VzxRUKPuX2OAAPZmceiuUtyakqBKQfnFQkE/n
	cR
X-Gm-Gg: AYBFou28OUS0FflV0VJpojJXRNuXacWPBWPVDWLXCFaF5izqt5v5Ltp8WR3PSmAuXqU
	Oehw8RJr9eKtXsk0JrPpLOmRA9NpU7zxZvo/INYJXKw9/JsWT+ZgoMfq6ucZCDezTCJUhYo/DuE
	UAMiIFUHh1EyHEtpSCEoBcSwkKsRMHF+YHLJ9T89GiEf5YnjFVhqqJaSwGiOu4FU+RIPv2dGuct
	SXVklF7JTDHkwA9ABjJCjm+6FgI+Xbp2wjeHZZOvAIh7sb4rxxz2nJFkEWl9v5e2oHrIy0cSJWT
	ltlNzePHOLQvDbQGJ17qKdagYo3R9AQN3ibgBD2WLPYWsLXrQcfjYoI/n5gPHnCv5hW5VoxVIhL
	iw3fYyH9Nze4jvcHaioNlyR8QWHmmipRU0r6q
X-Received: by 2002:a17:90b:4cd1:b0:3a8:1943:cb7a with SMTP id 98e67ed59e1d1-3adead44808mr7390142a91.18.1793102492445;
        Tue, 27 Oct 2026 05:01:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4cd1:b0:3a8:1943:cb7a with SMTP id 98e67ed59e1d1-3adead44808mr7390113a91.18.1793102491931;
        Tue, 27 Oct 2026 05:01:31 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40651560sm3672037a91.13.2026.10.27.05.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:01:28 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:31:22 +0530
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Fix proxy regulator array
 overflow
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
Message-Id: <20261027-b4-q6v5_mss_proxy_regs-v1-1-6c5557e42462@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJGS4GoC/yXMQQqDMBBA0avIrBsYQ422VyklaBx1ClU7U8Ui3
 r1Rl2/x/wpKwqRwT1YQmll56CPSSwKhK/uWDNfRYNG6FG1uqqv5uDnzb1U/yrD8vFCrxtZ5gQH
 xlgUHMR6FGl6O8eN5WqfqReG732Db/rMFwYp6AAAA
X-Change-ID: 20261027-b4-q6v5_mss_proxy_regs-2d780c0095c6
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Luca Weiss <luca@lucaweiss.eu>,
        =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793102485; l=1400;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=TJzPJNVsxPFGtMeNzrXT5vOZP2+aBDhH2ctGaurMUUQ=;
 b=jWhUUIWporDqHDdpejnELQLUFf//pLhMvR5mqllgDSbaBgGClVK1s9ny5BdYA/5+aFfwP3LRm
 Xa0GRyOmqItDfaSCSQir1BbZzqlMbnA1+IB1FOZXkP3Db40jTkQdbTY
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX+dfG7r4FBxJi
 N2hn2Qrf+Q8OmULryJwgLEPpPk3FtuRisew2T4jClY9C2D3u2yOGdnlAyG/FF5POireNatac1V6
 tgJCW6LCrVTNwxYDea4Yfi0vuhlujXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX6ZQNRdgtBe6F
 OfYK3cHG5hZNfyeKvchHczGL9aUwNoTaF/lkm9pPyz+yV2/coXnHVedlQiA3ZWOa9Yn1d7DV7qj
 1dMG9XDsdBh3HIyxgQJTsSY37TBC9rUssl5Z+Kx+I6bxuGO8P0cSaAhnO8DclTHY0tQ58kltkai
 ndIH+4RkqVridqD6CLtB0+7Jf/dKSmoVEBRiNPGzp2EDUH1UYBk+8HbM0l+7VzOJ9x3QkMi49DL
 N4JfYAN2XGCfVMbCUlPxGCpYBCTN2BvAz4qfZiZ2F9oZUmfWQCVeZMcmgGSza9/dpYZBkDcl74A
 xMMNGkci6FusBBgRJIdnPBIDdnpoQ0c/K2i0ecbd1jj/WZznEvrWy9SHMNc5TIJd8YF0azwfjll
 EbSCmnznLke/XtiSiLCA65V2n5MFObagV1f+bRkeRUBGp+zc5svQNc6LqXEL+xRdHmoUlnlvEnt
 aRWGdUQdeIPe2BfUfqg==
X-Proofpoint-ORIG-GUID: Up9Tw4qM4nli9Wo8-xyai9RtmQggICYp
X-Proofpoint-GUID: Up9Tw4qM4nli9Wo8-xyai9RtmQggICYp
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0929d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=isYqYfF-chSf2xzEknkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

The proxy supply tables of msm8974, msm8226 and msm8926 list two
regulators (pll and mx), but proxy_regs[] has room for one. The second
entry written by q6v5_regulator_init() lands in fallback_proxy_regs[0].

On msm8974 with a device tree that has no cx power domain, the
fallback table then overwrites that entry with cx, so mx is never
enabled and cx is enabled twice.

Make proxy_regs[] large enough for the largest proxy supply table.

Fixes: 4641840341f3 ("remoteproc: qcom_q6v5_mss: Handle platforms with one power domain")
Cc: stable@vger.kernel.org
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2f71ed2feff6..7dea3bad9f5d 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -216,7 +216,7 @@ struct q6v5 {
 	int proxy_pd_count;
 
 	struct reg_info active_regs[1];
-	struct reg_info proxy_regs[1];
+	struct reg_info proxy_regs[2];
 	struct reg_info fallback_proxy_regs[2];
 	int active_reg_count;
 	int proxy_reg_count;

---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261027-b4-q6v5_mss_proxy_regs-2d780c0095c6

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

