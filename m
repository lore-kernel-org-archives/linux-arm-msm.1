Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232996;
	b=WIHxrO5dpd8+IydR6CQxus4ZTeG5H6qnOB4Pvwl6X7lYoqqQkpb7jk1Sqd226JFNp58J
	 liYFb4dUEXVoAs1/auusgDWewYgF66WrxBm8EHyWlNZBKc67bxyYACkiGnPLTJ0dpOQpZ
	 4lxpeQz0zjJUOCCTdSJr9COWHNVyANkLd6LQhU6LWl/pBYjxIAWKsWQh1XLTZ/YR8qYG8
	 UwsPm++9mHLuP8YhdYTRIi2NcstZuLA9JKqp1f3MMVifG7yAk9SuF8SY6zBj2RnCQHfdO
	 kQxw9CvW6mbDfcvtMSzIw083SbBeNfGpOUqfujAZe8XirnHA0Ei1Q60bF319hZIb36A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232996;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bzUDjoYzf7fPf/riUB3Cm7ED6nu44j+BYRwBBoXgSpI=;
	b=C3jaXp0Fe/jDuPgmANXswqYYOuRRAArVSH1xhAphxJ9ksc5Li/g+gbsXNH2+Sv1W47fd
	 9Ho8NgVkKDh2mjXF6gIKhX+YJ6jhgoP+O2WqvFr+xZezDLLxUdzPY+ccz8yu6N8nnAXKv
	 q4QgQM/M7MPPq5C3rJsgh0wFyZqFusZ1nkxog5LqFwaVNeBfw6vzdg/6HAOFQxJ0rgIrq
	 MYy+Q5KGygv6HA/q8ghFc3YoVyWNsTG1PWjg5tI/p2TIj2GFqpiNXXUgA2GwxUzOQhvuT
	 qNb4CgtTqg9PcRo/HpfD4sV8FbhFAqylnScJdZolUYuN7zjweP7RDOXyD3mgNmgVZrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="L11V/teK";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BeJrSghT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FAC606D826
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88FAC606D826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L11V/teK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BeJrSghT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF58J310732
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bzUDjoYzf7fPf/riUB3Cm7ED6nu44j+BYRwBBoXgSpI=; b=L11V/teKikPLjWhd
	o0MG3H1sE84/Taj3zYC+5B3uf1shAg0QVMpf/V/2YC/qaJlPjD86g/JXjyRtBCC2
	6dL2M6DVatCFTNm3o0mWKcz0PjBCDCNqAbuwtUw9cG2z44Wu5G9upf87v0MPCKzO
	2twTSJWt1VHplC7q5OYUicWwMAEyH6WWHkw07nR/4tdZgtu+4Hw/GMn2Zpi8Bxtn
	tSfEw39TGGdpD5XAOkiquJyS7sPEUaV8c97UIrnP40Hk4F5zhQFsTg9Aax/iHniL
	FFrWoZSPBlKzCxDEhe8zYVugxnzI0QVab4w51fhCyCsfDRfMSoWZjrD09BrA7SgM
	K2EJNQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucap8q01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:03:15 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecd7e10ca7so182993e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794232994; x=1794837794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bzUDjoYzf7fPf/riUB3Cm7ED6nu44j+BYRwBBoXgSpI=;
        b=BeJrSghTx0gltL/eqmeoIpBW+c4eT/VE1u8GI4Wv5ncLa3iuAGkAE6VDQPqgZclYzc
         cOxmtp8GQgRY35s1RXwKLT6/Zo2fmh5u5xZt4GzZ3hAOKoksLwePURudi5jSvfZY6nty
         HrJ/MkY4q9ZLmo3NDVC2EhdeMPsK+RjsPa5RR4DMPk01ucWBvjlOBKZMHC2qmoyZSQW6
         7PsiT6LZeHG9SWiph/Y/zLfBz78jKQcvbOBlkw4Uy19rjIgCi0kGFqVtWNKECcUYDq47
         AICaIaY6HByiDVXwLYpF+msfvsz0MLHsdKS9jdShwQTiv+ueWYF6TSyT005uuSQ0pQke
         L1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232994; x=1794837794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bzUDjoYzf7fPf/riUB3Cm7ED6nu44j+BYRwBBoXgSpI=;
        b=YFYCBRpAVdEF+HXkN3QLZ+bjOTv/xDV9jqpdnlu6fctWYOiI4TH+Fg2l3c05XI6YqQ
         ZGWl7TKkYQS7okfrAX8hS5b2VbO/eXd/Lf/LlycrdeRtDpkXdrT8JhgNhALew56r/1lC
         lVMvIQEsm3ZXOCBU70XnHQd6hq77EAiJylKED3LSpQOWiASKkiNdmQEIWFSdmwHGqK2K
         8SGiHI9wKCF4jGtODiNmQ558SfqANJW/W/tqaQyE3EZ+zStpN+GgACm8clP0uDx8Aof1
         GrkCyOBXFJi+wVpef8iUJkXlinnMMSiB/rDqCwbazn0PwRDyklhXOH9fL/glLFeR44zL
         Sntg==
X-Forwarded-Encrypted: i=1; AL+hErHtMLh9n+7ex5AsfnT+ncf44XXlgNPQ5pZJHR5fWKTd14WvNpv2+ceXuLmscrj+62a01wfNXjrZjqy2t2r4@vger.kernel.org
X-Gm-Message-State: APuU4Z+SkLRKEy8YhlWowrGhMzylaL7MEBCnjXD1Pgz0jnlLSYDDhyyK
	jwFXwEJANgR+VUQ5/Bh32HLpU96pxpOidoewousRbzyBJcoUGPekl03Wa/u6+5irGocho3gh9JP
	BwL6tNhV33tSboopkZsjnuxtw+iFwsMHqD6Kf6QKQZuqey25/4Kax/ZJoeoEy09txw4wZ
X-Gm-Gg: AYBFou0TKISi/LNnY/5oBcS6QDGcIltJaswYO4gaKyhshJP/b1/u6HjPgp9Oa+WnBFK
	Cs686dvofoWMfTwwE4T+5dGJMuEZEDWqd8U5+mLIrLStJKJIKWaO/w7jkjVYTjPZASk8VyOBIcJ
	BE2Al0Kyy2jcuGLqmGk+YvmUdvtrIywytBT4ZPGTA6rl6Bg+RvOrjfxV7eqmCN+kC6JKdIT2UX2
	mdSku5PBRnHGfzA8+l61EDEC9kqzdHp0r6eX2XNT9L6RLDqgDXoPVBzsR7K4fe+iJyliebCyrmY
	NjDAJQYbPvcbRMZPShc9czoCusn3bVa1nEgWeqHQ3jpxiXqJQnDdCrXWi5unQnUGWsuSCnXmyjJ
	kH1N3//WTrUQdEOVBwG7zjHqczWkfi3u+rbwJJVqaWRpr1X6hP4GD9TlVy2Zh6imuLgDCUPGIAX
	II1KlSVljjYMYUM3KriYfgdmHLiTES3r2iO1Ls8D/S4dfLBcBykGVQdnOk1iz8fx4xCOznCEAno
	f9XWSLWU3XvCjIfvqg31YnNR44v
X-Received: by 2002:a05:6122:4b18:b0:5ea:b1f5:a657 with SMTP id 71dfb90a1353d-5ece7220ac4mr1174161e0c.7.1794232993995;
        Mon, 09 Nov 2026 06:03:13 -0800 (PST)
X-Received: by 2002:a05:6122:4b18:b0:5ea:b1f5:a657 with SMTP id 71dfb90a1353d-5ece7220ac4mr1174095e0c.7.1794232993087;
        Mon, 09 Nov 2026 06:03:13 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f9b5:154f:6aa3:35d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502652csm161515845e9.4.2026.11.09.06.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:03:12 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 15:02:00 +0100
Subject: [PATCH v4 7/7] i2c: qcom-cci: Build command words with
 FIELD_PREP()
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
Message-Id: <20261109-cci-imp-v4-7-4dc4095dd052@oss.qualcomm.com>
References: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
In-Reply-To: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfXy884wTEU1qaH
 M+COfjIaqhKo+v40ZYHRAxJaNBbwsptEhVBm2AirsEMC+5t6DKJSvT1NBywSI5gqUOyFVfM0FmX
 hVmIh+ZlHe6ngHOzp+7e3c3XnLWBUYMeYjyHA9Ty5E8Z+HzYIGy/FN6TQps3WZilLzaskgleqjF
 Z4d14peNioYbOhDl8hlDeIv1blBpTolS4l8LEQzcwjszqA3dA81gSHYQNSq13WKI6IZ8o0s4bza
 ICoRWiRzwG9J+2aO8AXzTsSDEyHYcBTtszFBi/DSlmk6QmbmGcpdsPjA60E8vQ0Kl2SXEdSYWf9
 armxtUv2r0aJZooB0fcZM2ZfLP96IQu87Zcl+tznZY+DVW7kF7Ymcmo8tyAIuAo/mjYqbgXnLXu
 73I3bHOMhZ3x6cEQDqbEQvyPpKBQ8P8TIzYTahM/UWXussMBh848NLwGogIeDGlcgkFvRt0Qn5R
 tgVkee8pucyX8Wk+OZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfXzzlQaeHXRPId
 EB9LbfxajpqdMlEIjjdXAHLiYZS3kABr09I63cKUYa8lWKvdcv/wNhk6VeY3YDmBz8gD16LtRQG
 uQ8zKDyYEMHB8OWLirJpmis7WAHraLo=
X-Proofpoint-ORIG-GUID: Pu2PXvJSwymIBTZ78MTjzVa6VIhAeOp2
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af1d2a3 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=aws9h2sAfGIhmysyGwIA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: Pu2PXvJSwymIBTZ78MTjzVa6VIhAeOp2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090055

Every command loaded into the CCI command queue has the same shape: a
4-bit opcode in the low nibble followed by an opcode specific payload.
That payload was open-coded as a bare shift at each site, which hides
how wide the fields actually are.

Describe the fields and use FIELD_PREP() instead. No functional change.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 7452ee8eab0635bf6562f4dbfb2342263211cbb8..66cf68837a9112f83503ad7299775d1a2c6953c6 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -102,6 +102,17 @@
 #define NUM_MASTERS	2
 #define NUM_QUEUES	2
 
+/*
+ * A command word is a 4-bit opcode followed by an opcode specific payload.
+ * The payload width differs per opcode: a write carries its length in a
+ * nibble (which is what makes 0xf available as the burst marker) and is
+ * followed by the data bytes, while a read carries a 16-bit length.
+ */
+#define CCI_I2C_CMD_OP		GENMASK(3, 0)
+#define CCI_I2C_PARAM_ADDR	GENMASK(10, 4)
+#define CCI_I2C_WRITE_LEN	GENMASK(7, 4)
+#define CCI_I2C_READ_LEN	GENMASK(19, 4)
+
 #define CCI_I2C_SET_PARAM	1
 #define CCI_I2C_LOCK		6
 #define CCI_I2C_UNLOCK		7
@@ -574,7 +585,7 @@ static int cci_validate_queue(struct cci *cci, u8 master, u8 queue)
 	if (!val)
 		return 0;
 
-	val = CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
+	val = FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_REPORT) | CCI_I2C_REPORT_IRQ_EN;
 	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
 
 	return cci_run_queue(cci, master, queue);
@@ -607,10 +618,12 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	if (ret < 0)
 		return ret;
 
-	val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
+	val = FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_SET_PARAM) |
+	      FIELD_PREP(CCI_I2C_PARAM_ADDR, addr);
 	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
 
-	val = CCI_I2C_READ | len << 4;
+	val = FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_READ) |
+	      FIELD_PREP(CCI_I2C_READ_LEN, len);
 	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
 
 	val = readl(cci->base + CCI_I2C_Mm_Qn_CUR_WORD_CNT(master, queue));
@@ -685,7 +698,8 @@ static void cci_i2c_load_write(void __iomem *loadq, u8 *buf, u16 len, bool burst
 {
 	u32 cmd[CCI_I2C_WRITE_WC] = { };
 
-	cmd[0] = CCI_I2C_WRITE | (burst ? CCI_I2C_WRITE_BURST : len) << 4;
+	cmd[0] = FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_WRITE) |
+		 FIELD_PREP(CCI_I2C_WRITE_LEN, burst ? CCI_I2C_WRITE_BURST : len);
 	memcpy((u8 *)cmd + 1, buf, len);
 	iowrite32_rep(loadq, cmd, CCI_I2C_WRITE_NWORDS(len));
 }
@@ -713,9 +727,10 @@ static int cci_i2c_write(struct cci *cci, u16 master,
 		return ret;
 
 	if (burst)
-		writel(CCI_I2C_LOCK, loadq);
+		writel(FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_LOCK), loadq);
 
-	val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
+	val = FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_SET_PARAM) |
+	      FIELD_PREP(CCI_I2C_PARAM_ADDR, addr);
 	writel(val, loadq);
 
 	do {
@@ -727,9 +742,9 @@ static int cci_i2c_write(struct cci *cci, u16 master,
 	} while (len);
 
 	if (burst)
-		writel(CCI_I2C_UNLOCK, loadq);
+		writel(FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_UNLOCK), loadq);
 
-	val = CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
+	val = FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_REPORT) | CCI_I2C_REPORT_IRQ_EN;
 	writel(val, loadq);
 
 	return cci_run_queue(cci, master, QUEUE_0);

-- 
2.34.1

