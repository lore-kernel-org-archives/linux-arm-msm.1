Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A14E4CCDE3
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887439; cv=none; b=KNou9J4pf48w375+KApD46pDy2YxXQZtO8KGUBYyDtiCXb6HvWSsgOBiOtVvB6WAcMZ8iR1Ue6frSriCOX4chbzxOHeJVrVLKa23WwEL2nfswmMvowNzaxKAw12UU2zBwafBRnfFhS/gKjJGcjeG6+YDr5sIh/QSnam+2on2U3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887439; c=relaxed/simple;
	bh=RaqQ3P+jo5TiduRAS40/77iRUsyNVJuDolsbGIV7YEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nXMfgj8u4/XXLQkH7073goHH/SKzCE802XN6RNX6Mzd7Ui6RQNBSklbQmhZIKqwCpSPI8sUKRJSH9PVwmE0RbNT0Pi1s63P8NZ8DSehIzttKrxmkREpKJ70U5IVot8PkHRbD4zMQa0veZZaGF0r3xhL8nErTU0phx9XVrBMBoh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dde3S6qy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KmbovaxQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dde3S6qy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KmbovaxQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8GQkP3054805
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQojHWPHBxRwjh4lA38mke9QuiPBGVFsYPy1tVQGL5E=; b=Dde3S6qyJ+EsCRVY
	XQQLfnqTbeKDm3OHEzXO8Q6+4gR7CQkyJA0QFgMXoH/VfV27U+8sG2ebb5gTBCNK
	6WzBOz3issHdOYk+k/hwwX9VeNgCj40f5iYM1PDNFMfmuFNcqZIpy4RMAagLUTG8
	t78KXLwzB1SxmjkbPp0sbDr5fx6DYjoXlFaBhm9BSYGoojXruRYcFNp86G98IEOj
	dzapOZHr3oV3WLc4CBt/ZrgLrtoPJRyUvDi+/PAP5ONMlRl9IK4Bw8QymQO6NtHR
	NlqORCVtBDRXmABVrR+pyNuefnlRnieTtyJY71Qt1f1PUcAyVosUZl46+0GreDrn
	8dugsw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeutah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea9ea9d13so469897185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887435; x=1792492235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQojHWPHBxRwjh4lA38mke9QuiPBGVFsYPy1tVQGL5E=;
        b=KmbovaxQCA6oLTchqflKZ4og4xopRP03E8N/T7/0SYtaHlRlYRQmd+Am5daFxcUGuD
         mYf0asDD2iwN24zqeYB4w1lK/wRUXqVc/wmt+AhzT934TumgmfkPt2YykowRnGyu395r
         C5DmqbTn4Vq+s8wN/zIEuxtF9vhG3kbQiUMa25jLFPfGlc4yqLHrwTu8kNCVqkeBIlUG
         19uD6S+x33WPvRCPZmQ0cIvD9yxxtKTikeW7vT9w6N3viG8L1gzI9dGOUNma2DdTTTSp
         GMuO1Zv5rpW/bt0aPqYyd0iqadywQpDAmveIPOW1daau2KNoywqad+3ewnneSs84raO4
         FmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887435; x=1792492235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQojHWPHBxRwjh4lA38mke9QuiPBGVFsYPy1tVQGL5E=;
        b=GGq8FGTGUq5EKW95/1xReTN448RU8OD415cfVUrtCT290kvlHmNsXhg0jBFZIGGa27
         cFVrlrGtgH4slTe1nC9Udw//Qah+su3kN3t/ve0R5/iixqPi71eh6YgUvrn9AsoYbno7
         cao0APK9yXKvKEefdRTEAIZyqJzE7WtuESyUvt8UuKGyc/AiBQXVdEQAFE/mYyw7IyL6
         RRiPF/82ZEC9rx8qtH/qZ8mHGn+5oXgp6yGwzQjfmfbb56ErKIh4K3/OcQ5cWlvd7ZH7
         Pi3wJG0bZVULR19h2/vyJZTyvHiIWtIkTW9SVtGJhGWlrTbc4PW9wCO6/z9+e7xRoNEO
         4aSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCaUZo/UIl3O6K4JfVPLJwJEfcGDXJ6/NHD0QYSkn7p+/34N6wLIpZjGQIwJyZZ0C1G2zw2GOGTXAupemS@vger.kernel.org
X-Gm-Message-State: AFq9FYKnYdf5xM7wtzReaC1fOhC2feKyHE31mWRyRNoVu8ocBCWo2YYP
	Q8pxixJpOw1FGjir9FlagY/gtZuYEykZk8XRJL0SUDmSyYkb1OZBJ2/a12yflGFebpUrJ9DR4yk
	1K58CcQ1SEY2+R5zOhRMXdC9JK/tSh1anUS6M3M+ryTpi1DvbFTMK+zM6DmgzpxpL1Ptc
X-Gm-Gg: AYBFou0W4EHqfpqnnbv74SA0oKLxRs+fCItGuzXOnOcdPnTV/rdWCEsTAteOXzMZOQK
	2qctd70D1PEIN16HE4npQURfMQJv2Fiek38MvWE47f2EKPANUr3oiTivGdDyeFF/GST/bOfjsKt
	w0wnovTPR79X9fS6KihrHbYOVNPEhNvM6e1T2ang6s4igp0UJmNcDTr6TvYVRrInlwgyzgAGIwn
	uKnxqBFOpgRHAAvbBD24gFhbvyjOpNYggpMcHm6+O+J6hXJ3pbVOo5EUMBScKeITo+2ljUJR0/F
	7wBqEMnFdCHcjFMAj6o9ogHxWnv0JPxI7T4DtmDXd5SxoUduYNM0kYHKP0NMGL4bQTuOa2/aZYe
	/VbQsfKR5AmWintCDKwsyvxACTGSWkIHkZXh+akIl1C4Fhdn5+WPAtSUqnuXg6GC93MOAWLl9dj
	Wh/vedlLuP2YwK6uHyKaX8BwPM+CN9gwle3B/HQloBs4mLIzbCja0=
X-Received: by 2002:a05:620a:2248:20b0:93e:c12c:9b77 with SMTP id af79cd13be357-93ec12c9f5fmr1331961085a.82.1791887430367;
        Tue, 13 Oct 2026 03:30:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2248:20b0:93e:c12c:9b77 with SMTP id af79cd13be357-93ec12c9f5fmr1331957585a.82.1791887429729;
        Tue, 13 Oct 2026 03:30:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d108:3895:812b:662a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be964dfsm349955115e9.7.2026.10.13.03.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:30:28 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:30:25 +0200
Subject: [PATCH v2 1/6] i2c: qcom-cci: Factor out write command queue
 programming
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261013-cci-imp-v2-1-6873326b44a3@oss.qualcomm.com>
References: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
In-Reply-To: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: hMipAvjdA56q-BnK8BDEU0PR_ReSHpp6
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6ace084c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=S5OCs8wk23pqgH2W7UgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX7G5xOkP0Gw3D
 0EDpkdVfjRJT00tG1eJ7SlwFp2uX1Z1cq79W2g/poOcr+5k3h+tLdKUXasRSYsIyL5NgxcnHlUZ
 XhB5DBQd2oJJ6eyPIeNh2x/MejAAnMA=
X-Proofpoint-ORIG-GUID: hMipAvjdA56q-BnK8BDEU0PR_ReSHpp6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX0eNLOBBTO8Kq
 EitM/sEwPwQ9BuP3OlAD0PqBqM3UIYXTIgNz0thtkIb3M7Lp3IShxuPso4kUE0y0YwJg5xcNxr6
 Cyj5KiYE5knXFvdoLoNoKZJxUn++ssDHRHoa8pvp4kBf//S2ETG7P+53MaUEkFrjOeIj3uwLuqn
 AqKX0GM1MLv3fg1SqhiVwptm/PiCanQQparqjqw9FYPkw+xLYEeNmHJ5CMYg+OH6TElvyUsiwTn
 bNPmUmwvf4LwPxrQVBpsF+d0DF/s+jyEqLYBv5kSbrPhHKgJbyKyoHbOIPp5/1D0pYBJjZN6O+Q
 B2mLf/kqGr7bfXYXGBJXN4487L/yLu5Oh0NYiN5vVXCPXnCcr0DDBL3O+KhzvIZURBKv/3kRxuy
 wvSzUKcaBPZc4CGazePGk23I+1bPG46mco0iHbuS5+SZK4HWsSQhVHbTH1B9GcZK2XcP8iFjMNB
 AnF13PLWuET/AoPKxKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130041

Factor out write-command queueing into a dedicated helper and replace
the manual byte-to-word packing code with iowrite32_rep().
 
The resulting code is easier to follow and will be reused by
upcoming burst-write support.

Also add a sanity check on the write buffer length, which should
already be validated by the caller/I2C-core.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 41 +++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index d509dc1c14700d9c199d67df19082bae4f1ae470..3304760411082b72e10e529a2bd66361e100fa06 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -77,6 +77,9 @@
 #define CCI_I2C_WRITE		9
 #define CCI_I2C_READ		10
 
+#define CCI_I2C_WRITE_WC	3
+#define CCI_I2C_WRITE_NWORDS(len) DIV_ROUND_UP((len) + 1, sizeof(u32))
+
 #define CCI_I2C_REPORT_IRQ_EN	BIT(8)
 
 enum {
@@ -485,42 +488,42 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	return 0;
 }
 
+static void cci_i2c_load_write(u8 *buf, u16 len, void __iomem *loadq)
+{
+	u32 cmd[CCI_I2C_WRITE_WC] = { };
+
+	if (WARN_ON(len >= CCI_I2C_WRITE_WC * sizeof(u32)))
+		return;
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
+	writel(val, loadq);
 
-	load[i++] = CCI_I2C_WRITE | len << 4;
-
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

