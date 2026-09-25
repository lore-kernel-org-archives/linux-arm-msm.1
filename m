Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E763E7640
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 06:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790316846; cv=none; b=MTeKuol2WII2lgGfCaSOec50blw0OAKYbhR8h8rAHRrwLV704RcE7D242BjyxcW8O+61QILFmw9FKSCo1XknWxyejuehMzrfGdNJRCFqu1r7l974U0tfY4v8CHaDZ2RQJygLqms7U2NqokGAlpOB/f2T+LQxdHax3LmvN7V3+Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790316846; c=relaxed/simple;
	bh=UjGi/HMvFFK7HvhdtN4vEXbxfXMe3CYhjl57nk0EeHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TXzgJrl1/Ww2oVAzdZWg0j8LIlaJtUDIodWo5qW7pNAg+SUogm4xgcPybqZZnz3PKffDXk54tYewVwllojnisKUuZ0dabGKOOjW5pZgTqMvqn96QnJn1kVZAnWsOXIODsjnZiw1T1jOgTsBJhJlYmWuZ4CeF78a5Q6z4PN4ureE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nH6TSXss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oi7dizQX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nH6TSXss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oi7dizQX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YnNJ208802
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 06:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+zDb7X7rs0VhS2XSto6rLCN0dteWuU7x06vvUzd5cx4=; b=nH6TSXssISO1VdTW
	5xDNZiYO9tAqBZCtVULnbwsTgVLsioytLqXVS2cdERf8Ge6rMDQlcFh8v74hAWvL
	NWvxLHFNCTbW7ud84WorlBfQPbrcPf7SvvSU9qjXt4I8n+ChmPJj9UNuUUhqrpX8
	EpZBsOJce5r+Moay6Ki+NqfTGQwpWNfCjZYz60cfu0CCEicM1m6fZeF/bLs0xqmW
	aBel0DzgfiLtdW3mEE2og7Xs/Dv5Q7derW5GzBgFBg9EzC3PbS36ihBxxxzL9fA9
	dN3Dpy7vR9fOeqUoiL0XD7qZwnLMFZnBqZa0Su5LJTiWZIDvWpAVKOZZ5JyEtnfT
	CRKyuw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898t9ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 06:14:03 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3284bbaa89dso2168617eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 23:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790316843; x=1790921643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+zDb7X7rs0VhS2XSto6rLCN0dteWuU7x06vvUzd5cx4=;
        b=Oi7dizQXeu5xF2VxoSY58o9GbDJA7mM6hqsXkvfUFyJhJp/5aDtNpHeOPyOuLQ5+BG
         iwZDr6dgvWNo3fw+5cMzl0/cPaPJv5xd9MM37HSE7hFhnhmgNW7THOb7sLYpFjXM7f9K
         HfKoV/bYr9QaItDUiwGa3V75JJFpwx+Q9d2VN8jJf/pQWXquERo6pIS8u/FBKGVaWOWt
         6tTakKZ5pcNYiH/Eu17S7mfzmxxEUCAL06YYuvLyCtsZqbjCctA8WzqPYnLJCznzQoCZ
         bzdkheUhbNlGIy+RIPQ5iwRcBCfc/VJsd6iymRvkSpZSPnNZomV/XZtxfLUKzEAfzCsX
         V0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790316843; x=1790921643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+zDb7X7rs0VhS2XSto6rLCN0dteWuU7x06vvUzd5cx4=;
        b=W+k8cLwM/TtmVt38Z9UNElSInMUoHJvZ5Uttuw4tHJEfE7VWGDqULGmXA9gVZ3xN54
         bysE2/FhGav+msiMuSHlhlIru3QGWM6nY7TAEI1LBtNqtqlADq4Qj5fC2r0Cizu4M/5r
         VG/Lshzp4PI6ZsBE1l5o8zmmO99hzlS08te7uh8lT1G5oUq1ZvFEY7D6nhB8imHwdo6+
         xwLi+6YSloj6y250nv4vxIF4bngjn/Mh51/19tACOuYWCgCagaIynQXX24LGm8dNRiU/
         q+JDLkTPNfG/lTi3ObZLYhHbtZ34b2lKxJP5N8bImJewJ40Lf5gZtthBmlzRg3/J+jym
         gcGQ==
X-Forwarded-Encrypted: i=1; AKwUvByS/kWalK6lkrGKOtNCW79MgCi2XIiHED/AyxUb5qIL464iac94768nvl1OwlS7uIqEGyNpMMSElZHkG1zB@vger.kernel.org
X-Gm-Message-State: AFuF++ny5kJtze5kAFaJlFFx9EBB46aotOzWTQh4gccRfizRPrG+ZBa9
	e0LT1kxQNb8LzRCib+w4/HtIvcO3FAUQC/0TSbPaszNxV8Hx2sRjDRruw6levEZJ7AbY1lgdg5v
	2aP/tZktv+aY93XxIqH1k1WnDJ5NozXmjb7TYcxtO/v5gRJFwwB9sSx7L4cvycvN/J9E4
X-Gm-Gg: AYBFou3P7FQzEv6M/e7AD4KXyn0URbL/AyVyjyMcQn6zggLYnWalpzSpzLH4LEaz9AP
	/UczIaWToyJXLs5uCmZl5A3hycbqfNpTfBwhNCRBur9OTkAsvACDxCpPXSZy2Rjt8LAeVY5JozY
	Jqsk/IjORFEmSJxHk8gG8wY6vwuBXYKIoFkOn0cq3XpXzEy/PuZt7R3HceoGtjsC7hSA9BiDDck
	VvFND78r+S150V+xSG2HRepdFxvlEJ2zoRHjn61JfOwchk3+OVloHz9V+QB23OD1wtl+2vftIiI
	1gVSfYgnVF0aQT+hHKwi5Pp/9NWJSw9B0BYcJQVtNDVtZET9kvoXfGhAB+gFmDZxJtts8+ZL0/i
	LpjlxVpIjkEvFm2KwsAkyjn6DaV1k
X-Received: by 2002:a05:693c:42c8:b0:33c:2611:1a14 with SMTP id 5a478bee46e88-340039b520fmr3853564eec.29.1790316842714;
        Thu, 24 Sep 2026 23:14:02 -0700 (PDT)
X-Received: by 2002:a05:693c:42c8:b0:33c:2611:1a14 with SMTP id 5a478bee46e88-340039b520fmr3853524eec.29.1790316842076;
        Thu, 24 Sep 2026 23:14:02 -0700 (PDT)
Received: from hu-ysiddu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c17074sm3381039eec.26.2026.09.24.23.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:14:01 -0700 (PDT)
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:43:34 +0530
Subject: [PATCH 1/2] Bluetooth: hci_qca: Add WCN clock management for
 pwrseq-based power path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-bt-wcn-clk-enable-v1-1-30bee88c4de4@oss.qualcomm.com>
References: <20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com>
In-Reply-To: <20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        quic_mohamull@quicinc.com, quic_hbandi@quicinc.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790316831; l=2346;
 i=yepuri.siddu@oss.qualcomm.com; s=20260603; h=from:subject:message-id;
 bh=UjGi/HMvFFK7HvhdtN4vEXbxfXMe3CYhjl57nk0EeHw=;
 b=v5wS0OGTviMTA0Yll3u5cZKAy9TX62AW4w34Zv0X0znfQKBDbHeemzVcNgzH5R/fuzZp79wyZ
 pKEcAa5592qBxbqPbTKGJY8O13FaVNBbCxeFyyQ1aLFrHjMLS+iZCG4
X-Developer-Key: i=yepuri.siddu@oss.qualcomm.com; a=ed25519;
 pk=ldEQwkUmctxwDtIVURg3xvXfzZavX8decqpk/pVLQZg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfXw4/3Fzi4iZqF
 dwmTm9hneVTKfQdqBMIs8xWuT1BYpJN1TR6fxWxZT6Y3mSnq7BLrQ2aeR5xT8ykDQ5W6hPYXpnp
 0NagbGhcnNBXl3xZcYRg/DWOjXy1llzr02MQNLR5qAAhU9lvhc+9AO9nw4Hsg5W1lFi5DaAHVoJ
 2NLdf2eI+wfQoHT5mg53mY6a11dDSllYbx6/IMU5EwEdgGuJez0t9wJDs2V2DzEJyaEDJoEhFbB
 26BRjd3UI5aoe8pUm6P0aalzQHRAMqA4J4+PIOYfpT3Z7IEv+N5seq2KGdX/k3HMo1OZusPgmNl
 8gMCJL9fDw0kxUbK3zgHJtQ4b6Csy0CFgNwta3SLns/2je+ljCDSlg+zcfKoWHoFPAzBhDj9lGi
 2AzMnrXUYqWOD0OZak9rvlkxYsxF+D9m98QNdotStUv5YvoEfgdfyn8iGH9xYYFVwitk4gqvhvb
 7iDGM0mGk8gDDUFLE3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfXxYBo321zsSU4
 NiqZjFl3NqnoveqJi05JqPpZc10PFWANs2rd3y67S3jDu1UNRE/H/WzGpavkWxKMyo2Iy7i3NyK
 4shbxUrTHWyNki7Rv84j6NT6ZwfqcV4=
X-Proofpoint-GUID: jxlBfYp6grS_VxdiXdglw8BJlDZIQ1L7
X-Proofpoint-ORIG-GUID: jxlBfYp6grS_VxdiXdglw8BJlDZIQ1L7
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab6112b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZKVZgszskm7KUbKj4J4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250024

RPMCC previously kept WCN clocks enabled via proxy votes, so the pwrseq
power path in hci_qca did not need to explicitly manage the clock.
With proxy vote removal, each consumer must explicitly enable and disable
its required clocks.

Extend the pwrseq-based power path to acquire and manage an optional
WCN clock. In qca_serdev_probe(), acquire the clock using
devm_clk_get_optional(). In qca_regulator_enable(), enable the clock
after a successful pwrseq_enable() with proper rollback on failure.
In qca_power_off(), disable the clock before pwrseq_disable().

Targets that do not define a clock in DTS are unaffected since
devm_clk_get_optional() returns NULL and all clock operations are
guarded accordingly.

Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 7089e9b639b2..489a059e519a 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2265,6 +2265,8 @@ static void qca_power_off(struct hci_uart *hu)
 	}
 
 	if (power && power->pwrseq) {
+		if (qcadev->susclk)
+			clk_disable_unprepare(qcadev->susclk);
 		pwrseq_disable(power->pwrseq);
 		set_bit(QCA_BT_OFF, &qca->flags);
 		return;
@@ -2324,8 +2326,17 @@ static int qca_regulator_enable(struct qca_serdev *qcadev)
 	struct qca_power *power = qcadev->bt_power;
 	int ret;
 
-	if (power->pwrseq)
-		return pwrseq_enable(power->pwrseq);
+	if (power->pwrseq) {
+		ret = pwrseq_enable(power->pwrseq);
+		if (ret)
+			return ret;
+		if (qcadev->susclk) {
+			ret = clk_prepare_enable(qcadev->susclk);
+			if (ret)
+				pwrseq_disable(power->pwrseq);
+		}
+		return ret;
+	}
 
 	/* Already enabled */
 	if (power->vregs_on)
@@ -2472,8 +2483,14 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			 */
 			if (IS_ERR(qcadev->bt_power->pwrseq))
 				qcadev->bt_power->pwrseq = NULL;
-			else
+			else {
+				qcadev->susclk = devm_clk_get_optional(&serdev->dev, NULL);
+				if (IS_ERR(qcadev->susclk)) {
+					dev_err(&serdev->dev, "failed to acquire clk\n");
+					return PTR_ERR(qcadev->susclk);
+				}
 				break;
+			}
 		}
 
 		qcadev->bt_power->dev = &serdev->dev;

-- 
2.34.1

