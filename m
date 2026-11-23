Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459333;
	b=ETYPOgXTlSg+iDLxUpbTl/3EAQi95m9odGZxxcJ5CDOsm6Tmv9uArLhRsCBq3FuDYLD5
	 FmkUpcsrJrh7bdNRJ202tFyOt0nxUB5KBXA0XjRm/gHC0tYCppwuya3vywaAv6NghwVR/
	 FAXwTnAcWzwnesaVmbRyiACYBQk+ziDSxwBFiWnTywQO7K7q0tzFPIDYt0NMZ1vuQFKp9
	 lWzfV4SnkooUSCXq6TvJbEeZ6Yg6yvZx1meCXyxO39uST7WTOG4bKHqXvCqvNiRWCglJZ
	 Offxh1A2lStJY34B7CvYk12go3iguifxGw/pxUpYyJeGXrP5igAgNgZb25QMOnDpKxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459333;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jC+1CHyr8WDmZ1wMgSud7pPW/+XpcKVypRcfMkFwDdU=;
	b=wcIz0K49lNBhD+chTHHUGtEMx5xZvk/F/jjw85XKrPy+fwawc/J7UDXEqJZq4w0tmYMj
	 2B/IwMy5cIjI4KrCsShPLWEzB+85ZG4aMjSNowPfhTUSDuvZLKXqTdzBqOr/uFc4WFk3s
	 GWINyvB3WkNkN42RBNDM0MvRfbCmkgYoSnI4DsWBFdFNFzZRyQO7wySRbOejvfsNWUwIF
	 lvv8YJ4ivToCiF23ov7V8q8BclL2rIXKYcmEH6pUFW/rkZKB97K8JhIy6AoihiayXVUQ9
	 ukQSfzHVbhPG59LIOSSWC27EG/zzfE5bPZZviNqQhjCpruhkjihSXvzzlPGV5MJS2+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kiXE4TWu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZR7Rqfvx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E719560A3802
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E719560A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kiXE4TWu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZR7Rqfvx
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGvBZ2844351
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jC+1CHyr8WDmZ1wMgSud7pPW/+XpcKVypRcfMkFwDdU=; b=kiXE4TWuaPJqeD2t
	h5/8ACClAiCz7eFqtrQZDC16RNFSzy/h+qX9CjvCLoDew5m8VnIxYfr36Tq2kkYN
	fVoFEf8mk6Yb+13AwXOPnE4krInuMk9WHXW8jQP5wJQh/2j+9BRZG5U5FdGjWVk6
	mz1aXllFjyPULvPGpPgigklyrDq3AdFFwYKZJiLG4kjktJqG024FIXkrBL0ADEWL
	yUzCEwdOzBRqjhts9doL/FrdMGunnkxzjWLyHuLk8czeQNpgYFnYgD3NSWCKPpfJ
	63WfRfFd1v2FbICoM/POZNDojCkjP4XxtlQ4PhS2j0CK1farQkYQEoRfd1ehGPWd
	emmBxA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k2xn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:42:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so27770985ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795459331; x=1796064131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jC+1CHyr8WDmZ1wMgSud7pPW/+XpcKVypRcfMkFwDdU=;
        b=ZR7RqfvxchGSHPG8wZw88p3dZv/8o0J1iqKFRjbt5iHwa8z/bmDxWhId3+Dszvibsx
         Wmx8fLlVI7L5IxTuYKEBXEFCUdHvV84WeE8XNSKvs32/wrPNKWVEual57z9B8bmFOJgr
         ow7E9OV3ANS7qHdej9iWdo/SKE4ysyLbSWsX85aUki5yZlvet+gylOpYl3idoGF9htCy
         ba9btrwr/zm5L7ZvGUPChZFHMiTjTJNdGfCMzy+luXXiJ/xZQbDJ8RN+XKOMH0alV2y9
         INfrsUUXlwciZ20f1+5VOMWcc9hECWSshGfXsg/2Zry/rlejHOCBhIC10tbWGVFaEJhn
         RJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459331; x=1796064131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jC+1CHyr8WDmZ1wMgSud7pPW/+XpcKVypRcfMkFwDdU=;
        b=qgSisorhfgbluaRN+MLpA/LSQnZY3kfXoRKvgjoVGGdSQbHIu9+0m4cd5Vn7Ykevq3
         qTpPvfZ+TMDw5QNNt8niTNgaPknsMmBvjiSYmQI4ohJXxwjLhDsUIs72h0qpCVYhm+n2
         SJWeP+2tPba1l3zsRJXsFIjRXJP08L0KPr+e1+AjsJYkWvpU1ODjfb2qohN12OoFyKj0
         3pjMSa8lkvQTLqNNoBU/6NmFPLccImvmz0LVdYYlNX+38F8SjDpBLMERxCBdovW4Gk5S
         1pD+q5hr11LENLlW2hZyZUFBbeG5kwe5Ss9I91o/xkjEdmSFsFvHkub2LY7hQUAst918
         klSA==
X-Forwarded-Encrypted: i=1; AL+hErExHovsKFvxDAk+z0zs2JW5zhn43U+jANPy+2/gzjrzS7XONXe7fUbXHB6onjl+btQqeSxVFCc4MRqhe8uR@vger.kernel.org
X-Gm-Message-State: APuU4Z8bj0baOjJiNIvBeKRnq7XI1VTM9rqYWMdHnj+tmVZ+6sfeR1JL
	pawi96u9uCgjx4/ECf4u6TB+JzzxekYKyquWbC3QAOE8Dtau9sRXOhDsP0eN/ori0ofA/A8Tbhw
	0Kk03uMHkCKXPG0keBMqvlTbZwOU6jyltiWjBpQ4bSAvfYKml8z+tq4z49W4xBBKM4ykT
X-Gm-Gg: AZFdTZcNs9wZNZzbneo1uxycjteF10TBjdS6XvCcShwllDeAn0vbHLB/b0RTkfM9xx7
	pngEYW+hGi8n9/JecMjkdizxlvij6tpQ+ky07fJkvuO+IoafQWO5NxsYBaxkW9wiaElroNHdaqN
	ctDTwsIVKOFiegmJZjY3HRqIadffyORuqIb/6yCxqkH0FP6/bUnTvKTBB4p5MiZu60IB9KK+fzI
	xLvxlKz8+MEb8dyjqnaqTv/AeEb5/CFcutzEHpDvELyIwpCif4Wn4cvjnI+2710+0wKC+bxN5+7
	hFnKNuxe7bbc8/hUySMvPyedAo7QVHE7qrf3R9KAEUo6j6hTmPOav6rqEqJq35IKDVMkAXlNLMD
	0VwCeUfeE1AiLm/9lsZ5qd5Cze/ebrK6a20Ev9AtD0RitKq+8seQp0M4oP972SmxT9jvuelqWfS
	Q3qXU=
X-Received: by 2002:a17:902:fc85:b0:2f0:3956:99a with SMTP id d9443c01a7336-2f03ef861cemr112250815ad.7.1795459330659;
        Mon, 23 Nov 2026 10:42:10 -0800 (PST)
X-Received: by 2002:a17:902:fc85:b0:2f0:3956:99a with SMTP id d9443c01a7336-2f03ef861cemr112250655ad.7.1795459330133;
        Mon, 23 Nov 2026 10:42:10 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c7dsm57984705ad.55.2026.11.23.10.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:42:09 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 00:11:45 +0530
Subject: [PATCH RFC net-next 1/2] net: stmmac: dwmac4: accept dribble-only
 receive frames
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
Message-Id: <20261124-ethqos_rmii-v1-1-1754643d593c@oss.qualcomm.com>
References: <20261124-ethqos_rmii-v1-0-1754643d593c@oss.qualcomm.com>
In-Reply-To: <20261124-ethqos_rmii-v1-0-1754643d593c@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459319; l=1878;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=qpbnYxrkzjA1cVIRkiGDBuEbDdF9dtSRfsKcf+jguNA=;
 b=nhA8ar/wB3ULBVPX7fzZqrI64pxRKE9Ib6mlOq2jf8a7U7hiK8GWURoYdJ+ROoWsGMdTctC0j
 HIYvflh0ehDBUz3882jKWHsOwqnnqo1vFKthUCkfHmGQsHdKC4i/Wsw
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfX0SKJW783vfOR
 8B+If5Oh+DoeqkyWaRErnp3wXhnThCMPLtoXj2A7GKqjBlw/8I+BYploZQtKRih0y0QTdy0HzKs
 4ENGPySlFXbOxj9ThEkjRGb1TJSqjeE=
X-Proofpoint-GUID: zujzCQevhugjQQP848-CVbYN0AiExe6z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfX9heN1pOMh4qC
 7Q9B6dHFFkCLyNikA7NJN37FdtozO0bNqsL2jvBtkkx/ZgFi2509KHZQjuBvjn49SfD9fsqYdWF
 kD1GddWbMmb9u/m3drCoXTwAv3ZVELXDE2KXKbkm4m1ao5o/V4V/butVoIZ/oJV4xy2tViX7XNI
 AZkrU6rYWtsPyZb+OdctC4t5fGhmmwEwIEOpbhi6GSVxrg1NOipTA2TjZWeuFAaskhx6EsJWpdp
 h3YKTE8wouPm2I9Uk6uB/TV5Zxhfa7cSRDDbWwmELttRFXzXa5LbzR4y4gZGTwSt2q9RkQlqXw3
 yZRtaO9BLt7VBrjMedWuXjAKuWhytmpxMSfo7A4RIWSCugvruO5ReoGE2ouJBy6T3JQRu8ZITJK
 oY0co9LmkPicdanTdAZpiPQiEYxiJgoUd+7uxfWl0un5ptOb75eHGgD5diOnhGAEFTwj3/hpRUp
 kMcPpKfVxCk1UOXGgDQ==
X-Proofpoint-ORIG-GUID: zujzCQevhugjQQP848-CVbYN0AiExe6z
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b048903 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cAvw1yLwuy3AVl_ujVEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230074

Commit 1cc5a735185a ("stmmac: do not discard frame on dribbling bit
assert") removed the packet drop condition for descriptors which report
only a dribble error for Normal and Enhanced descriptors, since a
dribble error with the correct FCS doesn't necessarily mean a bad
packet.

Do the same for dwmac4; accept receive frames with dribble-only errors
while still counting them in the error statistics.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c | 4 +++-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index c6a8f8d73501..2549ffaf9cef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -102,7 +102,9 @@ static int dwmac4_wrback_get_rx_status(struct stmmac_extra_stats *x,
 		if (unlikely(rdes3 & RDES3_DRIBBLE_ERROR))
 			x->dribbling_bit++;
 
-		ret = discard_frame;
+		if ((rdes3 & RDES3_ERROR_SUMMARY_MASK) !=
+		    RDES3_DRIBBLE_ERROR)
+			ret = discard_frame;
 	}
 
 	message_type = FIELD_GET(RDES1_PTP_MSG_TYPE_MASK, rdes1);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
index fb1fea5b0e6e..8e8762f9e0c8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
@@ -120,6 +120,7 @@
 #define RDES3_RECEIVE_WATCHDOG		BIT(22)
 #define RDES3_GIANT_PACKET		BIT(23)
 #define RDES3_CRC_ERROR			BIT(24)
+#define RDES3_ERROR_SUMMARY_MASK	GENMASK(24, 19)
 #define RDES3_RDES0_VALID		BIT(25)
 #define RDES3_RDES1_VALID		BIT(26)
 #define RDES3_RDES2_VALID		BIT(27)

-- 
2.34.1

