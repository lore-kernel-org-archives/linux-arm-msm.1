Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793564670;
	b=xRUnqOB52NxukrMXdgoCaXDRdfhW9U5R60ShC6lOcmieM5ZtdqHmHnUGFDocQyI8PQVL
	 dWh7F3Y9QTSLpGSVpoQRoQRvU1vbxkbZN9g46MXctYLTkWF+oKCm1o+BRkYsk7H4K4rKO
	 Z0R2bwRxaecewt70cG7jY8V+kbBZeWE0tvUtLqp7fDEaTvP20V5RGtxnXJJrGh/Y3GHne
	 nU7mjOYpxMrbhjfbFuvzULUl0JKCrZv3ENo3mbD2EiYpb9WZDKCck5uJNHSFYWQK8+j7j
	 Zjtclq6VNCafeeyUFYayMP8gk6/C9fMMMOn6Reeb4y92wDLb1qpMNsdcudKKrwYAv6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793564670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0CYhVuDpQu8QYZjZkxqSBp9RIPdqIGatFnQV15ShOXU=;
	b=g/JhinAbcSK9FFvif72D50ensd4s6Mb1o6lpRhjFprZ2AfdmIhzYICrDN7Kd97eztQXQ
	 t+4MMOIDEbJkIhjB0XaEzDISTIsYL2ysqJsLiBK8xRBc+9h3vJ93gdwXcTGJod0qg9f35
	 6ES5D8c3eufaZzH+0l2GjCGQxXrxtJhphDN8inDFDbqC/3Jyaqb3xtIjI1gjgDnkr21Wm
	 X3+lNLSFNAFtPTesnd26rqC22C0PwDiPcd6zePdmrpwzK/NN+ccvZ9abA7qt501//83UE
	 bAFwcidCY47lX/cxzECv1C8gYFnTspJ6fX2ZQVg/XAyq2nXrU3h2jD0yoOx1/ouxamg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f80ybTA4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZ0KO5X6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F28060A2605
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 20:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F28060A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f80ybTA4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZ0KO5X6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KJxxB1801066
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 20:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0CYhVuDpQu8
	QYZjZkxqSBp9RIPdqIGatFnQV15ShOXU=; b=f80ybTA4bnsLD3KIZUWLy24NggP
	RZHBvRIXJH+xBjzAenAFFmAE7J8jcXLl+3Bx5XizWszo2qvWNDtbHe6j4TRHoPYQ
	w4GwZFkULwqlWxVl8A/NigiU3i4brjWwb678DhPw44LyjiTMCddC6JuIXIkomMI0
	dTyyFRBhZ4s8lCXxZsJH5bAg/Vk+JMwMS7AOC1SlV/8mnEOrxRM99vo6id7P42Rb
	x252OiiwdmZy+IGQH/RjcS+fCyWLrhyEx4dY30J5EzezFAkpfyuHl8r4mv0OlAOP
	QEAlhHQC+uA2WMjuW3afjK3miryK7eS0k3RS3PsTccs0C6GKZLtY3MC3lnQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8duc4c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 20:24:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so459573285a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 12:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793564662; x=1794169462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0CYhVuDpQu8QYZjZkxqSBp9RIPdqIGatFnQV15ShOXU=;
        b=KZ0KO5X64vocw+o435FU9hRO3JcyCLC2MZt0+OTZrqC9MSnGeJSJw1boJd8r4T7SM9
         +Gz9+gWvc1r+AnEp5vTRex1ysrRAQGm4pEH6HNlg4V+tVnrZ7Ixx1p1LvEEOz6AjWpa4
         d4W5N64zw1JY6JlELtMKbjC+Vwb9Rjr7c3YJPZRr2SCKho7kdWTms6Xey3Vu8rkpi1kZ
         g+2dvZUPz74SJ9iHOqvtnGjo2qu0xAGIMbvV+45IMzLX8eg2PpH7dk3eP2zYVtrKQjSe
         VdPhe8Zi9OGFlnFp1X/UYVIjh1+do6GSt0n3ZwD/EYXZhejteRuJL8YjZc+a8kSAOY8U
         iE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793564662; x=1794169462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0CYhVuDpQu8QYZjZkxqSBp9RIPdqIGatFnQV15ShOXU=;
        b=VO+B92CrK5D/lhd8b0ZKqwJ73LowE+mxDcfN75Xo8mYoWuCxEXLFAZjp7AtLoZXPbg
         NHSkV7BXv+TqfuWJZBYwU4jUIxeqCXzrmkP/EWRlJd7v9Cu73s7pnaBnIF1pQv6fCY84
         3+0QBUhRNdZrPhkrvsE11xhdn+TibDnuMD9ZT488Pxkh8xlzSOtyJWWVGWpLChZi4wgz
         j3gGPzvwavf5DtFAk4mbLAu6Rn51BwO+4qRv+sQG6dtrMBqhfww3AlzfngpMpKsnb2l8
         14npzoUpfEM0odG1JRfhVvQ5SnQVbH0O3VOsVRWr76/WTXXNFyahEy/JWI6WxopBTUFp
         bccQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrAwwDbTkhoW4qHGcV7YWWC7FTD5BEFBmZSccPJW0ugo87E8soCorKCDjeR4VO7GYHfW5JjliRK5L1Exbp@vger.kernel.org
X-Gm-Message-State: AFq9FYJvIVja6D1ggbDOb58h6PUqwJTKeFnb0qEhN6DQimULKp64eu24
	USbIG/htLAVuorAdT5jSEQXz7bd7i6a4h7KomQ35JCq1skuxFzwL1rAkDjxWDghGlSqTbxZtKTs
	eGWATZsH8EUCu2C+toQ/h6iweSZZiAbzqKo6P5uzQXptM1Pqzqq+vDn4HUKwGG6VytPMr
X-Gm-Gg: AYBFou0mMvBee+7N+S+jVH6oH8cmAYLb+mtdOqqjNGy26+GAGC7bPmz48p0o2NCRuCp
	E1scE3kAeTQBfdLCXM8ybme4KdkxOzD1MOg6hqxddfGotcOT5MaBp0C8aWp/nsQxxPGwQjCnqtx
	1eF+ForICbBpbm7tyJCfHt6TJLWPFEBBoF8J215/aBDVQpr5KB1zK0X0RWPeVLskfE4YzCiqv3P
	/mV3vpxgK6wAoiVgObdEVMqLjRV0dmhlqD/rxGa1YJN+GJjofFmejokoFW8tXBThKfrc1byEfRn
	saup4YlJ+dVpZVBzgnDaAD78Az1TvyXo22U6jG1M3iLCvKRUSmUzpXadg7+j62kc0MCw1aKTSoP
	Nql6KtnVxZZmSC21XDN6FjfhuLOC2kxmP1PNAEwDA/sjWqMmHBIHXlnJygyc1Vg==
X-Received: by 2002:a05:620a:4890:b0:93e:90e0:d2f2 with SMTP id af79cd13be357-9442175c04amr1361357185a.41.1793564662423;
        Sun, 01 Nov 2026 12:24:22 -0800 (PST)
X-Received: by 2002:a05:620a:4890:b0:93e:90e0:d2f2 with SMTP id af79cd13be357-9442175c04amr1361355385a.41.1793564661948;
        Sun, 01 Nov 2026 12:24:21 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba4ac6sm16796675f8f.52.2026.11.01.12.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:24:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Chris Lew <chris.lew@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH 3/3] soc: qcom: smp2p: Fix possible out-of-bounds read with too many inbound entries
Date: Sun,  1 Nov 2026 21:24:07 +0100
Message-ID: <20261101202404.156522-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101202404.156522-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261101202404.156522-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2916; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=fTYjwHjyqPhR6jVQmsSR64EDEvlEpuBr8t0tO7jmykk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq55/mIDCEOQQpl+b+weT5ffrMZADqls8l/iXZm
 RVxFU2teS+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauef5gAKCRDBN2bmhouD
 18MJD/wIiVBtf4dpsps5I/axn1Yrlexu5fSOOEH0v1WTyjZuu9XgWPE6H+QboG5McudTq3EKShR
 4glETnPDJVYK4XPm/ZEtI5bOVcxy/Zekvv1+nyi6Qjlk3KPGq3Kc+JhnpQYigswlKgzaNZWbozF
 IReO5o4r1JZ60DDAG7t1zX63QJlM9t8u4Sb0XThyK0odt2XijGiY3anNQG1/DSS9LAjiosxtGW0
 dcWdiJLLk+sxb6KoNpm47nyhEFJtbwvby4IF1T4HyCKTInxPQ8WWo/s8oeFe0v2HySjGe5LfuG/
 ZHGETrQZaOA19D975sPm3kPeRs7Ikr+Xcw45WOqMHxrkiRuV4JUQ8MqNsq95Xmwzn7oEPlu8KkG
 X1R4bM/K9BeMpAh72Bji01u/0KeNFT2kq7Gps59MP15XPWRBdxiQ9YzzZslxial+CjvoXsG36OD
 WAB8lLGmEwu55JI6jMQ7wVyNYDMyKoeO+zbBiPJdisROw5QSBoH3W+DrEKlBzAUJUl5BmtE7va0
 AeTWne9vsy1TXD6aUX9riDCIxVN8HJGVs9tgIWG0O5+451nnOeugKTRdFknicMP8bUfrAUlM+fS
 y5LI+L41sQ+BtTst4K8tXSDapVoh9FYy00VpzEKhCUSBfjJ9qHqtE0tJwxk7EMdxYgybj1Y88xL qI24j2QZ2T5xWcg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae79ff7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xix-rBOErL6eV1CkEnYA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: G7zmjmlka6Q6-twkR-uoUsqh6vJNEKV5
X-Proofpoint-GUID: G7zmjmlka6Q6-twkR-uoUsqh6vJNEKV5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4MSBTYWx0ZWRfX3krTb7fdo/G2
 ZIiknxmX378IV8jJ9PGeaD2ErY4b/9IfZOjlkcAwA1WmR/v1kfAX3tnkTWwrEDVTVe3ioO3K9Ut
 AniEw0NW0iNDHTTa8E1olR7AMlrtrJcMDBCZYdRuBTUH4XTnP2w8kNKFJkg18taRUwPDcd1Q6h4
 rSbASSApOrfGutl+o3RqWWrqlac+EeInoA8CzZC13beI3APtf4UXXAFOnXIEp/5HB8LJK+EqdWz
 RPrAcHL/neMc2u0fni7jah1oyPRKo9oZlWlCaUHnDjcU0KqRJIHzjg8r5o+PnSYATn/BhxxUwwT
 rqXr4V1ccvG0WrcXnxNr5WNTizqjiNCxr69wYSHFDyIiTbrhcMyxg+qHQroxLmEnf0uXnnmQxq/
 5fmCVL2h6wPbGw35dJRnMuLXDeBMcezqHxlWltgMoJyorncxus91jvRkt7ax8XWBNgvw/YKNUjX
 E87joB/caxrtldFBX2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4MSBTYWx0ZWRfXzC8/DwMbD2M3
 z0CChGOmqsIS1BRGfiuUWIKQArfl42URC1IS2pRqupiyHGZDMxEze/8st7P9nHYvQ8uGO22v5y0
 KM0vJbSUpAlr5fQEpYNF7axm6O1ui3c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010081

The inbound SMEM item is populated by the remote processor, so its
contents, including number of entries, should be validated by the
kernel.  Number of inbound entries is directly used when iterating over
inbound data structure, so if it is higher than actual size of data,
kernel would read memory out-of-bounds.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-b79427c9-5d22-4b48-8ee7-1d7808101e52
Fixes: 8a9a7b9d14c2 ("soc: qcom: smp2p: Add irqchip state support")
Fixes: 50e99641413e ("soc: qcom: smp2p: Qualcomm Shared Memory Point to Point")
Cc: stable@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/qcom/smp2p.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 784a164cf367..ff7c91645712 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -252,6 +252,21 @@ static int qcom_smp2p_in_version(struct qcom_smp2p *smp2p)
 	return in->version;
 }
 
+static unsigned int qcom_smp2p_in_valid_entries(struct qcom_smp2p *smp2p)
+{
+	unsigned int valid_entries = smp2p->in->valid_entries;
+
+	/* Remote side controls the value, so do not trust it */
+	if (valid_entries > SMP2P_MAX_ENTRY) {
+		dev_err_ratelimited(smp2p->dev,
+				    "too many inbound entries: %u\n",
+				    valid_entries);
+		return SMP2P_MAX_ENTRY;
+	}
+
+	return valid_entries;
+}
+
 static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
 {
 	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
@@ -259,6 +274,7 @@ static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
 	char buf[SMP2P_MAX_ENTRY_NAME];
 	struct smp2p_smem_item *in;
 	struct smp2p_entry *entry;
+	unsigned int valid_entries;
 	size_t size;
 	int i;
 
@@ -272,7 +288,8 @@ static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
 	if (in->version == 0)
 		return;
 
-	for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
+	valid_entries = qcom_smp2p_in_valid_entries(smp2p);
+	for (i = smp2p->valid_entries; i < valid_entries; i++) {
 		list_for_each_entry(entry, &smp2p->inbound, node) {
 			memcpy(buf, in->entries[i].name, sizeof(buf));
 			if (!strcmp(buf, entry->name)) {
@@ -292,13 +309,15 @@ static void qcom_smp2p_notify_in(struct qcom_smp2p *smp2p)
 	int irq_pin;
 	u32 status;
 	char buf[SMP2P_MAX_ENTRY_NAME];
+	unsigned int valid_entries;
 	u32 val;
 	int i;
 
 	in = smp2p->in;
 
 	/* Match newly created entries */
-	for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
+	valid_entries = qcom_smp2p_in_valid_entries(smp2p);
+	for (i = smp2p->valid_entries; i < valid_entries; i++) {
 		list_for_each_entry(entry, &smp2p->inbound, node) {
 			memcpy(buf, in->entries[i].name, sizeof(buf));
 			if (!strcmp(buf, entry->name)) {
-- 
2.53.0

