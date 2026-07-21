Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC40E372066
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640840; cv=none; b=Ul0NSH9EDaTkGBlrwTtMlQduoSEwW+0JqxxjELDPCRX/synNtpd05Ybgj/e/IA/tW0aHLGCCCwmq7APf4fTlE9Pvkrr7PlUTgu6T5osuTIiNS4WseSJ3q0Va1sayvGhvIX3NOYNCoxGTyUlCmuKLmaBysLCZ5Z783oadIls6vWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640840; c=relaxed/simple;
	bh=NNnz6awfeEqmEC/yqDO0GWP7yizfp6R665Mk39/3FRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L6uqXyqAUO1WFNfSvq+AlnK6YLuzrmHTBIuDaCDoGgPrwqQodJemvAvnJ8+vObVY/GtC0OGVb5kLVZAyevm99A80Xiew/txVcJw+xNgclhntynikV5HzP7DG3zYYoiR7mrSyZb4zZWzTljM4KJJzImpLNyLgaphNjM9fYEXBprI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oktra4Wx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LaOj10FU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oktra4Wx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LaOj10FU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMAda1660574
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=; b=Oktra4WxIy5mT/Rc
	cGxA8xNH7cInm+1056wbJrcVVQOzcX+TC9N4KgwRotMJZciaSaewZJfDbVnYHnWr
	2UriZ7K3J0pE8Jk2jWlIHVnANvcxBgpCA/vdstf1EiLd6LGyyvMuzqjLt6gsDG+f
	WRsaNilSBGGdArpdnXPONHB1nRG9K9p3nVwu6cOZvoSF1haSA35UouTyEcRiGGNJ
	xtRIp6AMW4aHsGyxtMRVGSBaATz/3RmvdFvv2BHRxko2Hx6ZfwKCwPzH60TMTIqq
	jKZgZkXpZFJ3rIY7TLPYAJpNTX3gjqOz7kPho3N3Of5WU6xMB7l5cShxTL0erdYz
	AHsgRg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9ae84pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:33:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so199342941cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640837; x=1785245637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=;
        b=LaOj10FUmMWzRqWV+uM8+3/1WhVqrVlLR7Py5CS3+eX0pShu7UnqTpP++TUgGESM5o
         SNw2++xzdZCn91YjC2V2d8N222b+FgxGoEppNWuFtcQzsabMsaH0iAobVRqZy59FLv9S
         BARvRjhlzd+qaxgrmWhXtbJ59124dGBBW/aY9azIaKnk3koes7LGD2bBd1vU+LsQNhvj
         VvPtYMcutCrZHUZSsHA6UqjkfLjnd23M9thQyJ6fwgeCJ0vBnFVTq1nXNpEC9SiB/9qi
         /JPnb8ty4nHMFBlNuoluULz1zy+lNsZxjvHZKrwS5XLInQExyHVl8pWf65zfhdk+eJTX
         EMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640837; x=1785245637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=;
        b=oPs2K1M6lZNi3sG+GvO6k4TzQZs8UQeOcG8WMeFv6Pb1ZBMygG9CklywlM3dD9WnIX
         06Tiecb6fJOjzN1wIPeH3GmowYTvhOBIOXWTpVcgEyQAaMJIfWN//wFSUrZXJR0jJkRg
         CjdrS1yz2iv8N4esC40IswOhnIodT55nMDSo0Dt2fGU9soe4M7qoMgHekqXsDVZYBZZP
         lau97DL3U8tUMpFmiEaVUwxokEFlpjRSU1gM1RvJDltA9YczfAWm2l13K1G8Wakb+rFG
         iST61buzc+kw4sq7r+Cae/o3+gE4J7R7RFTgmK7zXXGSHRn7uLAZ88mv0MPl62RUjaXP
         9T3w==
X-Forwarded-Encrypted: i=1; AHgh+RoNs61HKRcHsZ84gSkuCSHcfkf/xiPlWysk+r4YdQPWBgEwLxEJD44fZvPuJJASY2Ss2FpapaIufLGXMsvR@vger.kernel.org
X-Gm-Message-State: AOJu0YwMWqLtIYHnXLgPjyO5hFA6opEkMls59cVntk4KJRkl+qWJBUAA
	4+Ok4GmDZ9ineT9CuR8P3nANlrWdL1rRAO3rlSvESNS5j4i25HEKzFrWy8CD3W0xQCskCmPn1qq
	FMce3avz5JX84id2Vp/kJ03wMweDzI2FiWpogvbNeBHeJ73TgSWVSZ4G76kvhHGGXp/OL
X-Gm-Gg: AfdE7cnallk94ElHKicewJUJ++o+SgzVMBza7wjkGshZUG4kWgzwDaYfEyu518wwnqM
	PSoXEjOQVwY9QCSbBBIT2/FL8lVIF6MHM3IxOPxHKTniBusgcRxahyCqNh1bJVMk35vT7tgoiQh
	p9yHsGoFkFLm2q9uS3o3GE5qsin/ZHF//5DOkZe/28YTY7B35MpAaVUIFIlnfiHz0GOjRozpWLp
	QWWMUfh3zRwakvMlG6i9K+qoetIwm7OjnX5Wp6X7XHAGwHSyRTV9XhqXFnuQsDSy1eNwxwHWA0c
	SKid3mg96FSKHjG4h5Gf5gbkYRbes/ujC5puN2RXG3vFtmm67PSMv3JF52jyF8D58qBtvJfClhx
	ZKHQ/Xk5ZqNaf6W3tqb+HIWHgKbxJWw==
X-Received: by 2002:a05:622a:1a8e:b0:51c:478:32a1 with SMTP id d75a77b69052e-5213bb216b1mr179481711cf.18.1784640836791;
        Tue, 21 Jul 2026 06:33:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8e:b0:51c:478:32a1 with SMTP id d75a77b69052e-5213bb216b1mr179481301cf.18.1784640836247;
        Tue, 21 Jul 2026 06:33:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:33:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:12 +0200
Subject: [PATCH v23 07/14] crypto: qce - Cancel work on device detach
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-7-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2473;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NNnz6awfeEqmEC/yqDO0GWP7yizfp6R665Mk39/3FRo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3Uk7Gq+PO+9JFm6m3MN5V5JSBvVfsrV4+20O
 3cnUuBFwn+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91JAAKCRAFnS7L/zaE
 wxoBD/4rXCJuoFrp6WDQETNj137xKTCo4AWVRa70FCHK1giT2tutkZjbNdSM1iO/nAiw2k+UZvj
 BDfSmmlgXcoFKRBehMco7ws1CA0ZqaignKj47bp3qyKDnFPYB1Kz1e2hhtV4tber739KEx4DGRO
 AFLSanGZ9LQHVMkmY8kGSmhifuqRMZj5aJzq1T9imMfMxXrY8TMswyXf6wQrYCVhEkUTC46CXD2
 EVwnamkIY8tYD64L9Dqiiw+3r+9um05U+UnuUTye0q+M1y4ZPS0jMunsoTQ7etsrmBbtZ3QDzFe
 wT3ObE7wmGBpZK2Y7untGvfNMPz7m7Y36nu95fRHwEP2AzW9n2YXbRnM1lQW43K/dgatJCxtfv9
 Oul9vq6saVbTDSyREmfZNS1KN3OG0s336Pe9n5eYe5tc9IH9P9QfmICcf7XNSWbBMJbG8R8gdSu
 7JxrNYWLn4PGjKHJrD+3nU930mDkBhozEvz6hrENV+z1A8hOiepulqntLpiCU6qtnyoXbEijb52
 MPdpyE6EW6RoOtci6FVKcKpDQeva3Vaz8ZEKovwWtA/sJ6sb7lAGVvcalmRrggv93xk3TBJ/hmP
 ZIwNmfcTVg3MDTkLAsd4r8H+MAJFLgGtlcNkSAe3WDNJlxx2y+pxDMcNquTFn14xV/7XM0Kkndk
 uG6QpnNQQKHJ5gQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: QvbfBCcDcRnL_zI_XkDhKt5i2DHG2oi9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX2ksijy4xtRFK
 kV9UwApZBab6MHpseWszEA8qkW/TFqOSf1kF5/g30Y1cf/lBslKrnGOHjmV46JCh5ULPyLdbLRv
 fj5nxryRuBt3MMkEw7O743uqFpDLK/8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX/Cw4lzM7XLex
 gxrk5/8xGJRoDzX9dM7n0N+dHtMYEFF+wvbuzq5/JhlvJEXv2JCP5qpYfgycLRGMxcf3WuJ20sq
 LZR0R7URsTlajiKUZpQIiArCQjWoxng9sQgRxmWAEVNPqVkkuM3m4spAiCwtMLIlgXHL5mKAFte
 tr6V2k0K9ux0300bKHfxQzYw8MZzxVDakFcr/G3ul9czzwKLjBZgNfq89tYLZHmXwWSkKm4cuLA
 vo33zrUE59VQFcjPJbXsRsb2tn+igWRH6aVYu2LgWTMh+uCRfA2uCqknm5gSGR6oJosYDFRwnK0
 01EEHbnG+KatHuAqcno5u2d9s4NnmNVhQm0nwQMOwDnJjrSvpUbmdlyLitNJ5lHBqqmqDroeCYN
 UuYJfAIsV56xIb9KNCtOqm9nqMDapyoHYB6dSJb9laOaOl4fgL620NWve/0fFF5j9E5I2pd8Ht6
 32XZsizj3hmH9hLvs2A==
X-Proofpoint-GUID: QvbfBCcDcRnL_zI_XkDhKt5i2DHG2oi9
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5f7545 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=SDQHpg0AWQOuS8LWovAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210144

The workqueue is setup in probe() but never cancelled on error or in
remove(). Set up a devres action to clean it up. We need to move the
initialization earlier as we don't want to cancel the work before any
outstanding DMA transfer is terminated. Make sure we do terminate all
transfers in qce_dma_release() devres action.

Fixes: eb7986e5e14d ("crypto: qce - convert tasklet to workqueue")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=7
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 13 ++++++++++++-
 drivers/crypto/qce/dma.c  |  2 ++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index ac74f69914d6175b39ccde43f16269570fbcf715..b52a26ffff5ee733adcf4e8cf8bef75018dfa63e 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -185,6 +185,13 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
 }
 
+static void qce_cancel_work(void *data)
+{
+	struct work_struct *work = data;
+
+	cancel_work_sync(work);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -226,6 +233,11 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	INIT_WORK(&qce->done_work, qce_req_done_work);
+	ret = devm_add_action_or_reset(dev, qce_cancel_work, &qce->done_work);
+	if (ret)
+		return ret;
+
 	ret = devm_qce_dma_request(qce->dev, &qce->dma);
 	if (ret)
 		return ret;
@@ -238,7 +250,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	INIT_WORK(&qce->done_work, qce_req_done_work);
 	crypto_init_queue(&qce->queue, QCE_QUEUE_LENGTH);
 
 	qce->async_req_enqueue = qce_async_request_enqueue;
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 68cafd4741ad3d91906d39e817fc7873b028d498..7ec9d72fd690fb17e03ade7efe3cc522fb47e1ac 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -13,6 +13,8 @@ static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
 
+	dmaengine_terminate_sync(dma->txchan);
+	dmaengine_terminate_sync(dma->rxchan);
 	dma_release_channel(dma->txchan);
 	dma_release_channel(dma->rxchan);
 	kfree(dma->result_buf);

-- 
2.47.3

