Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809606;
	b=ipkgLYK4NJ6mChEqzP3npCuCPzvK7mkP6uRptKmHsK/Jq0NelKja72tOTvIhI20W46pC
	 +7hZSAL1Q55BSCYTLNvYy9DFSSUfc+jcLON7jhjpvZD1OBqB4bUJGzWmymGI6YnVmDei6
	 xxKkSNCEisdb7bq1Y3R0hpwioH2sdiCLlM3/zo1A5st6l4IqtV47LmCDoYFwdvG6nwsgp
	 ouyUqTsSFQ3uJq0nPzcAdHt14n0szaEEOLs4lTxAAKYRRCB0gstwLFtkjz2Y982MVvxWM
	 ZaCdu1jciMNIAHnvM3IO7JisZf43jaaYkuQrSvABjuGTqQtRGOaq+cnv+kGcoEJ6iPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809606;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LWe7LLGWKYiomyjVbfwSVUnBn5B9O2xyF6rgO4gTJYE=;
	b=x9R0AtwuDnIQ3bg007i90Ym88rf2EmhoHZ6qYnZ6ury5gu6uxFZVPvcXt/7sSQ0/FQCN
	 943drdiYagzLGdgqKzJhVanB9bVt6NNrE1+bt1sBKRsBa54M2dyTk2XV8GjgzEgsRrgmK
	 oVzFcKsrBP7QbUCyClB7vytmTKup1lggtG1B8ZD7tqg81UX7aKGpv9EdWGjvApCsk4hLR
	 3y15h+PjSFC0iYcRVBJM7La4WFEyxDm0ho+xSQuz+EC90gyhoogBD2hjvS+YsxnIPBKF6
	 gczoXf7jnSAez4S2ms/uRGVsVt60oQO32i0hxELhBgbyvzKLuYxaqupgudTI+gP90bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jua2jF2E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="J1K/iJK8";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5228A606A331
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 16:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5228A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jua2jF2E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J1K/iJK8
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fj8jg1692569
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 16:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LWe7LLGWKYiomyjVbfwSVUnBn5B9O2xyF6r
	gO4gTJYE=; b=jua2jF2EPSn+F1gPrl1hsEzTBJ+xWEyGaboYkY3aOnhr04zzOwp
	dJbhFj8NWi0DNFhsQ1V8Yog9pc5Fg9QKYSDOPnYKcEXyDS22328qNIBdINIcvw51
	IsIMrwQAe76M40qKtu+qKmi8II4rDE9Kg3rNikBDo3/xgU/YAD1UNmTi/DpdGaK1
	dK+4VbVOSjSpUysbGLD8ANzkMLpcsh6SMGwxEDXMLfXcNitlUI5/+2hWzxqBETCD
	mKrcyB5M/Tv35275Yx62m2f5+je68cbLYM+KXwfi0yK6ytocFapI/pTyNbmHFFlq
	dp4uVhF+FOj4PilKDNYUfI+Y5fcBA3/N61A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br0guf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 16:26:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91e8438717aso8831726d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793809604; x=1794414404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LWe7LLGWKYiomyjVbfwSVUnBn5B9O2xyF6rgO4gTJYE=;
        b=J1K/iJK8/tp6X/UDpnzud4Jbg/XMF6i0skRrVjL3SICCFt5eM+4IF+mFxlXhDBTPCP
         P3ZPv/izMHeL9JuRC57emurbXei0MjE8jChLXjRDZN2eG7ICaJvSjrKojIwBWXYBRJ32
         qCQGpczd7/up+na4pi5yeb4s0U7FfALbxZJP0MFGpqTRQSyYOi9rudQJ9w5WNzEhIBRC
         83X6DyIPA3juKpOLugdbJkQLOnI9uPzs1+9tgcYDT8KqUEPk4SN1pOJ68T8Aj0lVnvPV
         EZPC1WBW6y022x0lUvcr16Fb7TSbWWXYZjpH6Hb6ta4lHyKWXuWskAvcEkLOmetbM2qN
         V1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809604; x=1794414404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWe7LLGWKYiomyjVbfwSVUnBn5B9O2xyF6rgO4gTJYE=;
        b=ATBDZdZ/tQFGPkXQXwI8TTOTqQpoRi4cpzzUOcsxouUTesu9JSyg5lpmMZIXLVKt1A
         HKTiDFvIeVi6wL0b4YLPMPgypYQeXJ+XqK505Cl1Ezj/wbgnX9hP36qrC9xCu0KuojRk
         lUD3u6ETpidS0UEGv1iqHcwzVob7QZu+dW2Mb62oNV3L0MY/pvFU9N1QsFtXvb9RFGps
         efsoEJW3kSExZOG//JTRwRvUpV0wE9Z8m2QqWLAULEZal7BgPBhVdivDrgflS5tkhcNu
         jJOZ5hDvOamviTGY1jqcVYVZFE4EMeVXrJgQM8xMUMG6pj/wO/rsQM7qX/HZzq+0VlIJ
         Fd+w==
X-Forwarded-Encrypted: i=1; AKwUvBwvzcyG+pyz/jvIipeNSByg/KgTI10Qc9Fn+8ON95y4CPi+lBWOJ1jmTL/XRiue+6gLaI75opTubAeICxO9@vger.kernel.org
X-Gm-Message-State: APuU4Z+AltQIP6Wo+PTlEjSLGZmgib1gAacGNjs+TMXRK5zt7T5GAjjp
	hUYyCr5WwBlU5J7S96xuDHPpOdNmq1JfcXhY59r1vNm6555Lu6oZl3DrDGwCc+tmdcp/W43qrFH
	sgE+/NSu+aSW976JWYuql0uw1+xM8wGWY75iUUHGNL6QutxXYHRwcGCR330goJeffeZN6
X-Gm-Gg: AYBFou2T91lI6nkQfhwikigMmr3AAO7UV/RWhM+LtzsgrW/sVzvOO+mdWa8/+xh6yaP
	9jHUmNfRqrAQ4QLzscmeRhTfGXU/NW8L4l4Z+9b0ivaJDzahiUB1UrwLZoNlIW1jPXh1msiQU+k
	f/SPHNY2TAY2PYCAf7nE3UEkB1aHdchH8MrFIWAgQIptCdFm/CDB5zJjnIUSGy5Sf567kEwQ/4U
	2bGV8xTSUE0HWTArsNM295tvj83DMsbg/E1N7L4nCizIeMoft3usjt20CGWAeX+71w6u6EZpZTI
	w6jTLCbdHAIq1iR6frL+Ta6R0RSVcqJ3KARZ19sTEuxuNim1Q2YbLvf26AvKGzHE3lCB/JT7p3c
	JNXh72hyrlDy4V1c47JN8lnHBpPz5w5lQMurZ4nI9vKcc6fFZ93PsUV0Hdd+oeg==
X-Received: by 2002:a05:620a:a887:10b0:944:2f1d:950a with SMTP id af79cd13be357-9442f1d9b98mr1690607985a.47.1793809604287;
        Wed, 04 Nov 2026 08:26:44 -0800 (PST)
X-Received: by 2002:a05:620a:a887:10b0:944:2f1d:950a with SMTP id af79cd13be357-9442f1d9b98mr1690603085a.47.1793809603746;
        Wed, 04 Nov 2026 08:26:43 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab010a66sm202596845e9.13.2026.11.04.08.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:26:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>, Andy Gross <andy.gross@linaro.org>,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] soc: qcom: cmd-db: Validate firmware-provided offsets and counts
Date: Wed,  4 Nov 2026 17:26:37 +0100
Message-ID: <20261104162636.406949-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2844; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=041BNTqVKtRVarLz7gLjBUicIKRSya9ySTIIEff+L4s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq61y8f5KGGwYdjmdr7UZx5TKiyosF2uyLC0dGc
 YNg71D0nqaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCautcvAAKCRDBN2bmhouD
 15dGEACY3PqT5ijuNxWF7oBmC+bqcGG2PADfv17EcGYLGIMSweTtp6Nl2C57Ewal4BN+jZDYhM/
 ACjh3y1vXCq7zTNBnvCDAwPmIpfrFlSP9osQd7OnO+Y2l8o7PKpSJZfsm0AWOXaBx5gs2JXdXnq
 HPALFWlHYKcWrEuzEGASjNyIPe8EnYXqAz7kzqcWNQ3cBhPb/sAsG00nW0BopAN0H4/iKH15aRa
 gPV30B/B7yWZeP+i/ncyHe+OGyYjaeDcP3EhO3iiHU+61VYcBbS4OcANKVqlidDOMHR5B0XBqLz
 xJOKmZdRUNEmdFVvXWUxjtBBa9uP+urBIyvgJLrYoT27epGFI48qCyLgyciE258hMPXL07R6Uar
 Ao4lbtgSoB8o0woGLM4KgWuIOfr9S/3huBT4Wi/2DX3jaoFdTWzOrUVEXNrXduAcgcnozi0RrDR
 okPMQRUaS7FgVom7cR3zn/uOLxNZiVrllu4CtdgHlo4YGbUc6P37IgIf24dsjPEmVH0NgBoFg8q
 xNYppMW0i2hOIEvjNBjHu0hyPiEzDKfxoxZEDUkBn+BgGQNgm/igq685/Q49x6Co/kTSINulUxU
 5Mav7LpbwOmVGJvqitT7i3klgfVG0mfOh0Uq/xNqs0gjtasEQ5NrlF8TOQiDyQdjruxpF7DhNuW +BZVPG70kY7JjGg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NSBTYWx0ZWRfX7X6SNM9VE0qD
 mFBj+phJYbLp8YIGoO0ICShUkDI5hvRHVsCZICWeKpAC+wkaRA2BHFLMJEwm/ml1Z9SQC1Glitn
 K7QZai19XbVCp34aE3xOiNMtVeJTJ12SUcerJXbZ45P+E4mnqSRsjKReTOgNAAwHHrv59rDWIK5
 jTXEZxUotL91NPt5pAS0+UHZaQd8FiV+FxAkD/DAEmoWTFbgpST146MrhAEt7cK1N9JV/RdzEi+
 3SyvBQf9A9qHCk/BakIeC4XKtVI8/m/yVkHkTf6hpkEsj8Arm7T9DMefY7ngdHg9yLBETo1E6kT
 k8OA9YlzximJd8parvuNE82fwbeRyr6vJxewofXHb6GeBAP9R2z+Cs5akDfw2BAgdVuo50zZ262
 TdooDai1zWoCdp4Jo3YYi0alO0gg8RWYiltwn4CqEnTCiSFBwaqIs6EebL8Rf0g8i5yDqYgM2w3
 1ssk1R/Sny/1McwwQcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NSBTYWx0ZWRfX1uV/KmQ+tsiA
 +32S0+pS4Z4azQeBOkk0fZWv0zAwQRvt9r4HZn2VLVCUxrZ+k+bqST+X/Xb9jeeGd3xn6Q6KkBL
 QlsVp4iTCtc1zzc1qkVKLCYO24Jj6Qk=
X-Proofpoint-GUID: Gak880OqbvIDiTbOG9cJRYhmZG4UvSq9
X-Proofpoint-ORIG-GUID: Gak880OqbvIDiTbOG9cJRYhmZG4UvSq9
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aeb5cc5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JF2_t5xmk2bVYqND0VcA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040065

Validate the data provided by the firmware, before actually trusting
declared lengths and parsing it.  If a theoretical firmware provided
malformed data, Linux kernel could read beyond allocated reserved
memory.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-fc833525-3bf9-4274-8dc7-2cffd5b4338c
Fixes: 312416d9171a ("drivers: qcom: add command DB driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Not ccing stable, this is a theoretical bug.
---
 drivers/soc/qcom/cmd-db.c | 50 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 5d303ca0dbd0..c75567cea086 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -338,10 +338,51 @@ static const struct file_operations cmd_db_debugfs_ops = {
 	.release = single_release,
 };
 
+static int cmd_db_validate(struct device *dev,
+			   const struct cmd_db_header *header, size_t size)
+{
+	const struct entry_header *ent;
+	const struct rsc_hdr *rsc;
+	size_t data_size, end;
+	u16 cnt;
+	int i, j;
+
+	data_size = size - sizeof(*header);
+
+	for (i = 0; i < MAX_SLV_ID; i++) {
+		rsc = &header->header[i];
+		if (!rsc->slv_id)
+			break;
+
+		cnt = le16_to_cpu(rsc->cnt);
+		end = le16_to_cpu(rsc->header_offset) +
+		      (size_t)cnt * sizeof(*ent);
+		if (end > data_size) {
+			dev_err(dev, "Slave %d entries out of bounds\n", i);
+			return -EINVAL;
+		}
+
+		ent = (const void *)(header->data +
+				     le16_to_cpu(rsc->header_offset));
+		for (j = 0; j < cnt; j++, ent++) {
+			end = (size_t)le16_to_cpu(rsc->data_offset) +
+			      le16_to_cpu(ent->offset) + le16_to_cpu(ent->len);
+			if (end > data_size) {
+				dev_err(dev, "Slave %d entry %d data out of bounds\n",
+					i, j);
+				return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+
 static int cmd_db_dev_probe(struct platform_device *pdev)
 {
 	struct cmd_db_header *header;
 	struct reserved_mem *rmem;
+	int ret;
 
 	rmem = of_reserved_mem_lookup(pdev->dev.of_node);
 	if (!rmem) {
@@ -349,6 +390,11 @@ static int cmd_db_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	if (rmem->size < sizeof(*header)) {
+		dev_err(&pdev->dev, "Command DB memory region too small\n");
+		return -EINVAL;
+	}
+
 	header = devm_memremap(&pdev->dev, rmem->base, rmem->size, MEMREMAP_WC);
 	if (IS_ERR(header))
 		return PTR_ERR(header);
@@ -358,6 +404,10 @@ static int cmd_db_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	ret = cmd_db_validate(&pdev->dev, header, rmem->size);
+	if (ret)
+		return ret;
+
 	cmd_db_header = header;
 
 	debugfs_create_file("cmd-db", 0400, NULL, NULL, &cmd_db_debugfs_ops);
-- 
2.53.0

