Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232940;
	b=Ta5KTOrI+TG+zhlD0ug6cAuhWDs9f0HdiJLO7woLl2eaFNY1A1FdyE7+tMdsdZhsr2t9
	 Zc6I4JcucB5Q1/4vdpGbnyOglBngueaCm3s5uGXK5xxv+7nADsuydJLRhYxux0Go+Fvbl
	 cHCrKxL6elLP+gw/l387Tv7s9ZOA0DuEPx0vrygiuVHk2SzJZKoh98F1vb/gVgg/JW3b/
	 eEaRrAticEQIvkQ9DZj3J47L4xJ1Peq07AAX+YNZhn3w/TerNoSeZTzRm7F9Y3vmj1aaq
	 jEZzI0/oBXb+6JTDI5THut0/zMUNGWdXhi+MzikgEsiA/0dLKtoDxtXiz6M9WIWM91w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232940;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ATC4ytGvpaxV+ditlkv+PcB9kNkdnATmugFJjVslMz0=;
	b=F376jTrBSABl4X9J5vhcq0j8hf3fngEeiHOb9s+jCEXCed8DRVCMvx7zYwjzmBnle+aE
	 nJUlHi+MVM6/qXf7KrXcBR59cB+IqbCN8s5lnjvsW8zdGLTaTFdSTG2AgAx/ILGFuxMUS
	 xSzhBOX8QmF5C7uBp/QOdPuAhvzm9lcuORNQJ472UfF4GjwYBlBSxMGwiG7Mg44Qs9xOX
	 Ps5YK5X7ItcSbGNjhK3wXsfxTEG5PnmH1jqM4kTgX/18EW3uOu58w/hNFTdJW+h6uRvzl
	 12s8B5qk+PhSlxMJBxIfL4nqjB9/0mliYlpFrsAv7MW+81dGvfEa9f8C32gcj6EXxYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OQdbatpJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MzA+NtIY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4A5606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC4A5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OQdbatpJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MzA+NtIY
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF1u7022493
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ATC4ytGvpaxV+ditlkv+PcB9kNkdnATmugFJjVslMz0=; b=OQdbatpJpbE5HMsa
	QCHAlSoC60+fde8fjUdySO69fwNuPVxJX1rNQz0ALzozyhgFyDBxvjZWUMjY1FYc
	kgsD/onAQLlcpoS3aR56Vlb0CChOI20rTUuLP+k5gTTLKuI/FwQhDVnXspbKYX72
	hemikCg5U+E2bhq+pmuMm4XSYrzBFI2UOggzf8NdVN0T5GDRXgez+RfO8zWho/x8
	frKijeARUDUVbvpIqbhLq/rvnh3FJmFf+K4Bnj15rqyjyVKuO+kPSQVcmTe2IimH
	ZiDKUD3hjLanPJh0BgKTu/nP2JJb9DjhRBOE4md2h5TA7hvkM+Un82/S+ewGrrzo
	ODZHbA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydgkxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:02:18 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ece5510b79so890249e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794232938; x=1794837738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATC4ytGvpaxV+ditlkv+PcB9kNkdnATmugFJjVslMz0=;
        b=MzA+NtIYAsEjBn2vWUATBMj5hcK6evmTQ0OFr/onfq35TSY6qOwlzulGQjG3l5pAu8
         I6KJ5uwFuqkNUo/cF8ipLW8lC/gCuortJIQMLMbMnqo0T/JhoDoQqjgffxojjFEeFWiC
         995dYuWGT+igm34ld0N/BoW6AgkALgvyJNJJO2mrX2JUTEdRPywGy0oLMpIw5IQle8ry
         +rYI5wyXHCht3lpOdTcxWTA6L36+gJ+BbLKdUH9kvKxM0oQHOLV52oV1B7JD3GinSRok
         aPC1DwXubbiJI7I0MOe/0kTSPWzLJ2mORrXr6nW6Esbnpo1f24WXxrj924dWJZPFsT27
         J05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232938; x=1794837738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATC4ytGvpaxV+ditlkv+PcB9kNkdnATmugFJjVslMz0=;
        b=zq3KQynkYKSwepxwNJfzAynSFqSCbaxDtgyBbXau1szN3aK0ICAS2mNHTH5rK6zJlP
         WWfaVfsXMDNEmft1nRpbnT/VvmxIIal/ebMg1AZv4BmB5pu34mzWIEMekr6A1YXLKx/Y
         BzaJF9ujVIn4NefDph8vtGJg4B52S4x2M6Yz+0zY6jFtH6WCCrVvAm9Y4CRsfzM5RW9W
         xYJZ5xbRzYNBIDr9yCqlpejon5MqXYJ1taZhsgQRar1aPMXP3sHXvnXdnt01ScElpGdZ
         QEAVdkDqyrPBEeG5cSh8tX9ioNifCCGoNkXo3Gde/cQVc5zZhy6zQdQASPLM8QLbQUme
         b/8g==
X-Forwarded-Encrypted: i=1; AL+hErH8o9FJev9eVJHcsoodyllCM2dL0CUUPEDadJaPr3Y2IFngoHpeCPvYVgahSzgMUZe4cEFaXf8Fq2nG6I/2@vger.kernel.org
X-Gm-Message-State: APuU4Z9divsYyPrXgEY9/twOTfmeoHmd/UbfdOZ8D1ETAtcxd6gfHkyi
	qdG5AceRh6HHR7ckbruHvoS+YckASsTKOesqopHHyYcFnhnF4MXRYr56p8xnDFv6iheJvoD8wdX
	F0xhikm8OISwt7sgpd8vATQxllp4Fn2g428RN2tJ19CXS0MuYkgBSDlr3aAouF+YOmx/7
X-Gm-Gg: AYBFou2/ewrih1/rBoaI+yg++LsILVWQpBXvAhKoPy3zzzasewaP6U15TcYlQiRgiP6
	sacAR1+BB2YOSS2MDcYe4SsBKGgdX0swUBDpvzukSlFaZZfVkC91MVw1QfVTXO7YkqnMB7ajBwJ
	GH+7smR7jwjqfas/RuYwiEwJNVu/QA5mMecVAg0GbfzIg0twBgPbs2mpWMBl8neovoIBr1lcash
	g4y1DMqy/TNex+DRt/7zJ4kxh65pj/p9PnGKDrYvE8NLkpFQ1PeABamYMPXrcWh4ujpnn+oLdcM
	NCFJzYT3IXkyfr98d0rlWoLnAhb/UvFPrdOQGd4cF6XoxWt/DZppzJd42gBjpGf93xn22E1IYd7
	ON6IGGCFDLSTSNN+2e3hRyhSjkSxDHP3qOUPlj4i4gzrQCZz/UceuzEGji0770NwPnq0Z/768FC
	RKBfRsc5FoRJXm40uLIQkaDnR6iULTXvVZjz0VgjnuOGbOI1Xjo63KSwofCpqxvt3XQGTosW3l7
	T1XeDh+KoPpZ9ZDlm9zqS+IsfCD
X-Received: by 2002:a05:6122:1313:b0:5eb:7686:48f5 with SMTP id 71dfb90a1353d-5ece7207579mr1148213e0c.8.1794232931459;
        Mon, 09 Nov 2026 06:02:11 -0800 (PST)
X-Received: by 2002:a05:6122:1313:b0:5eb:7686:48f5 with SMTP id 71dfb90a1353d-5ece7207579mr1147489e0c.8.1794232920527;
        Mon, 09 Nov 2026 06:02:00 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f9b5:154f:6aa3:35d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502652csm161515845e9.4.2026.11.09.06.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:01:58 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 15:01:54 +0100
Subject: [PATCH v4 1/7] i2c: qcom-cci: Factor out write command queue
 programming
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
Message-Id: <20261109-cci-imp-v4-1-4dc4095dd052@oss.qualcomm.com>
References: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
In-Reply-To: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX89zxKhNnt2oh
 9dsaFArAt2LhlMCOgUcWNZ9txVbacHfb05EpG10qDFPspBW0VgPVGLqqKI35A+s75FzPGfc1atd
 KYOfxLa9e4qipAtVZHgM5O1gi3VYNuE=
X-Proofpoint-GUID: 402foGD62lJf0GC308P3xf1mzoiX6tr1
X-Proofpoint-ORIG-GUID: 402foGD62lJf0GC308P3xf1mzoiX6tr1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX40n1PzAKU3SY
 q6Pzv/+/GxwJDybn8GbePNUwNPYM61KKgD9i3kNqydWhOI1wZX8gQ9k34MMs57h6fx+IbcVLeDy
 AWz4mqmK69ujW8Qv3JkxtdCBsBJMB8MRkAai4JaaDeef/uguREpjO8PZDoYYbj5b7cRTE3GMUnJ
 7fxmrhg1Aah8lNWaCwmmL5GmXP3RBFAgWb1Lr8wf2i1I3MgMZ7ST0FUiznYFyY/Fh8gvKpIrCi8
 IdaUNEDy9SvcJ4drGge0gxq8SURGNxpmRGjs4EWUhkzQa0tGEEPW4EIjlL8AE7ubnDBkmfLTdq8
 Tvaf2tah73BONpA6kc+WdAVjlghWVAVFmHtiXdY1PqklTx3ag2OvOfFGAkRTXdyNty4CRE/BXMr
 tCFhEjmQ8ik5cEowxx4EemlDzpH2NmBVUD8lc1mcjzk37x7uj61wsxAmbKZVBsyQnFnyKxofnLM
 ylxuKjnRST5fsUC74yw==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1d26a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=EKMQ_w68-2WzcSmJptwA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090055

Factor out write-command queueing into a dedicated helper and replace
the manual byte-to-word packing code with iowrite32_rep().

The resulting code is easier to follow and will be reused by
upcoming burst-write support.

A command can only carry as many data bytes as fit in its words, so
validate the length before building one, and do so where an error can
still be returned. The I2C core already rejects a transfer longer than
the limit advertised through the adapter quirks, so this is only a
guard against building a command that would corrupt the queue.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 44 ++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 76a5dedf659fb8396ca5df188143469977526505..e7e2650a05ab125c2ac619c90cb61152cd787165 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -78,6 +78,9 @@
 #define CCI_I2C_WRITE		9
 #define CCI_I2C_READ		10
 
+#define CCI_I2C_WRITE_WC	3
+#define CCI_I2C_WRITE_NWORDS(len) DIV_ROUND_UP((len) + 1, sizeof(u32))
+
 #define CCI_I2C_REPORT_IRQ_EN	BIT(8)
 
 enum {
@@ -480,42 +483,45 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	return 0;
 }
 
+static void cci_i2c_load_write(u8 *buf, u16 len, void __iomem *loadq)
+{
+	u32 cmd[CCI_I2C_WRITE_WC] = { };
+
+	cmd[0] = CCI_I2C_WRITE | len << 4;
+	memcpy((u8 *)cmd + 1, buf, len);
+	iowrite32_rep(loadq, cmd, CCI_I2C_WRITE_NWORDS(len));
+}
+
 static int cci_i2c_write(struct cci *cci, u16 master,
 			 u16 addr, u8 *buf, u16 len)
 {
-	u8 queue = QUEUE_0;
-	u8 load[12] = { 0 };
-	int i = 0, j, ret;
+	void __iomem *loadq = cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, QUEUE_0);
+	int ret;
 	u32 val;
 
+	dev_dbg(cci->dev, "master %d write: len=%u\n", master, len);
+
+	/* This condition should be guaranteed by the caller (i2c core) */
+	if (WARN_ON(len > cci->data->quirks.max_write_len))
+		return -EINVAL;
+
 	/*
 	 * Call validate queue to make sure queue is empty before starting.
 	 * This is to avoid overflow / underflow of queue.
 	 */
-	ret = cci_validate_queue(cci, master, queue);
+	ret = cci_validate_queue(cci, master, QUEUE_0);
 	if (ret < 0)
 		return ret;
 
 	val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
-	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
-
-	load[i++] = CCI_I2C_WRITE | len << 4;
+	writel(val, loadq);
 
-	for (j = 0; j < len; j++)
-		load[i++] = buf[j];
-
-	for (j = 0; j < i; j += 4) {
-		val = load[j];
-		val |= load[j + 1] << 8;
-		val |= load[j + 2] << 16;
-		val |= load[j + 3] << 24;
-		writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
-	}
+	cci_i2c_load_write(buf, len, loadq);
 
 	val = CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
-	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
+	writel(val, loadq);
 
-	return cci_run_queue(cci, master, queue);
+	return cci_run_queue(cci, master, QUEUE_0);
 }
 
 static int cci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)

-- 
2.34.1

